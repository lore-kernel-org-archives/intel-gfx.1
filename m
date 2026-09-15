Return-Path: <intel-gfx-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5D3C1C88E75
	for <intel-gfx@archiver.kernel.org>; Tue, 15 Sep 2026 09:52:44 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C0CEB10E5D2;
	Tue, 15 Sep 2026 09:52:43 +0000 (UTC)
Received: from 61270ab9df2a (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8B44310E5D2;
 Tue, 15 Sep 2026 09:52:42 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============3835599521299158966=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=97_i915=2ECI=2EFull=3A_failure_for_Add_support_for_Common_S?=
 =?utf-8?q?DP_Transmission_Line_=28rev6=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Nautiyal, Ankit K" <ankit.k.nautiyal@intel.com>
Cc: intel-gfx@lists.freedesktop.org
Date: Tue, 15 Sep 2026 09:52:42 -0000
Message-ID: <178946596254.163797.15754210600517874578@61270ab9df2a>
X-Patchwork-Hint: ignore
References: <20260913145649.3240904-1-ankit.k.nautiyal@intel.com>
In-Reply-To: <20260913145649.3240904-1-ankit.k.nautiyal@intel.com>
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

--===============3835599521299158966==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: Add support for Common SDP Transmission Line (rev6)
URL   : https://patchwork.freedesktop.org/series/162622/
State : failure

== Summary ==

CI Bug Log - changes from CI_DRM_19136_full -> Patchwork_162622v6_full
====================================================

Summary
-------

  **FAILURE**

  Serious unknown changes coming with Patchwork_162622v6_full absolutely need to be
  verified manually.
  
  If you think the reported changes have nothing to do with the changes
  introduced in Patchwork_162622v6_full, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them
  to document this new failure mode, which will reduce false positives in CI.

  

Participating hosts (10 -> 10)
------------------------------

  No changes in participating hosts

Possible new issues
-------------------

  Here are the unknown changes that may have been introduced in Patchwork_162622v6_full:

### IGT changes ###

#### Possible regressions ####

  * igt@kms_flip@flip-vs-suspend-interruptible:
    - shard-mtlp:         [PASS][1] -> [ABORT][2] +1 other test abort
   [1]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19136/shard-mtlp-2/igt@kms_flip@flip-vs-suspend-interruptible.html
   [2]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_162622v6/shard-mtlp-2/igt@kms_flip@flip-vs-suspend-interruptible.html

  
Known issues
------------

  Here are the changes found in Patchwork_162622v6_full that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@gem_bad_reloc@negative-reloc-lut:
    - shard-rkl:          NOTRUN -> [SKIP][3] ([i915#3281]) +6 other tests skip
   [3]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_162622v6/shard-rkl-5/igt@gem_bad_reloc@negative-reloc-lut.html

  * igt@gem_busy@semaphore:
    - shard-dg1:          NOTRUN -> [SKIP][4] ([i915#3936])
   [4]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_162622v6/shard-dg1-18/igt@gem_busy@semaphore.html

  * igt@gem_ccs@block-multicopy-compressed:
    - shard-tglu:         NOTRUN -> [SKIP][5] ([i915#9323])
   [5]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_162622v6/shard-tglu-3/igt@gem_ccs@block-multicopy-compressed.html

  * igt@gem_ccs@ctrl-surf-copy:
    - shard-dg1:          NOTRUN -> [SKIP][6] ([i915#3555] / [i915#9323])
   [6]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_162622v6/shard-dg1-14/igt@gem_ccs@ctrl-surf-copy.html

  * igt@gem_ccs@suspend-resume:
    - shard-dg2:          NOTRUN -> [INCOMPLETE][7] ([i915#13356] / [i915#16348]) +1 other test incomplete
   [7]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_162622v6/shard-dg2-4/igt@gem_ccs@suspend-resume.html

  * igt@gem_close_race@multigpu-basic-process:
    - shard-rkl:          NOTRUN -> [SKIP][8] ([i915#7697])
   [8]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_162622v6/shard-rkl-4/igt@gem_close_race@multigpu-basic-process.html
    - shard-tglu-1:       NOTRUN -> [SKIP][9] ([i915#7697])
   [9]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_162622v6/shard-tglu-1/igt@gem_close_race@multigpu-basic-process.html

  * igt@gem_close_race@multigpu-basic-threads:
    - shard-tglu:         NOTRUN -> [SKIP][10] ([i915#7697])
   [10]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_162622v6/shard-tglu-7/igt@gem_close_race@multigpu-basic-threads.html

  * igt@gem_create@create-ext-set-pat:
    - shard-rkl:          NOTRUN -> [SKIP][11] ([i915#8562])
   [11]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_162622v6/shard-rkl-2/igt@gem_create@create-ext-set-pat.html
    - shard-tglu:         NOTRUN -> [SKIP][12] ([i915#8562])
   [12]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_162622v6/shard-tglu-4/igt@gem_create@create-ext-set-pat.html

  * igt@gem_ctx_freq@sysfs@gt0:
    - shard-dg2:          [PASS][13] -> [FAIL][14] ([i915#9561]) +1 other test fail
   [13]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19136/shard-dg2-3/igt@gem_ctx_freq@sysfs@gt0.html
   [14]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_162622v6/shard-dg2-8/igt@gem_ctx_freq@sysfs@gt0.html

  * igt@gem_ctx_isolation@preservation-s3:
    - shard-rkl:          [PASS][15] -> [INCOMPLETE][16] ([i915#13356]) +2 other tests incomplete
   [15]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19136/shard-rkl-8/igt@gem_ctx_isolation@preservation-s3.html
   [16]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_162622v6/shard-rkl-6/igt@gem_ctx_isolation@preservation-s3.html

  * igt@gem_ctx_persistence@heartbeat-stop:
    - shard-dg1:          NOTRUN -> [SKIP][17] ([i915#8555])
   [17]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_162622v6/shard-dg1-14/igt@gem_ctx_persistence@heartbeat-stop.html

  * igt@gem_ctx_persistence@legacy-engines-queued:
    - shard-snb:          NOTRUN -> [SKIP][18] ([i915#1099]) +6 other tests skip
   [18]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_162622v6/shard-snb4/igt@gem_ctx_persistence@legacy-engines-queued.html

  * igt@gem_ctx_sseu@invalid-args:
    - shard-dg1:          NOTRUN -> [SKIP][19] ([i915#280]) +1 other test skip
   [19]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_162622v6/shard-dg1-14/igt@gem_ctx_sseu@invalid-args.html

  * igt@gem_ctx_sseu@invalid-sseu:
    - shard-tglu:         NOTRUN -> [SKIP][20] ([i915#280])
   [20]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_162622v6/shard-tglu-7/igt@gem_ctx_sseu@invalid-sseu.html

  * igt@gem_ctx_sseu@mmap-args:
    - shard-rkl:          NOTRUN -> [SKIP][21] ([i915#280])
   [21]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_162622v6/shard-rkl-4/igt@gem_ctx_sseu@mmap-args.html
    - shard-tglu-1:       NOTRUN -> [SKIP][22] ([i915#280])
   [22]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_162622v6/shard-tglu-1/igt@gem_ctx_sseu@mmap-args.html

  * igt@gem_eio@in-flight-suspend:
    - shard-glk11:        NOTRUN -> [INCOMPLETE][23] ([i915#13390])
   [23]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_162622v6/shard-glk11/igt@gem_eio@in-flight-suspend.html

  * igt@gem_eio@kms:
    - shard-rkl:          NOTRUN -> [ABORT][24] ([i915#16837])
   [24]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_162622v6/shard-rkl-5/igt@gem_eio@kms.html

  * igt@gem_exec_balancer@parallel-balancer:
    - shard-rkl:          NOTRUN -> [SKIP][25] ([i915#4525]) +1 other test skip
   [25]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_162622v6/shard-rkl-4/igt@gem_exec_balancer@parallel-balancer.html

  * igt@gem_exec_balancer@parallel-contexts:
    - shard-tglu:         NOTRUN -> [SKIP][26] ([i915#4525]) +2 other tests skip
   [26]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_162622v6/shard-tglu-8/igt@gem_exec_balancer@parallel-contexts.html

  * igt@gem_exec_fence@submit3:
    - shard-dg1:          NOTRUN -> [SKIP][27] ([i915#4812])
   [27]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_162622v6/shard-dg1-14/igt@gem_exec_fence@submit3.html

  * igt@gem_exec_flush@basic-uc-ro-default:
    - shard-dg1:          NOTRUN -> [SKIP][28] ([i915#3539] / [i915#4852]) +3 other tests skip
   [28]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_162622v6/shard-dg1-14/igt@gem_exec_flush@basic-uc-ro-default.html

  * igt@gem_exec_reloc@basic-write-read-noreloc:
    - shard-dg1:          NOTRUN -> [SKIP][29] ([i915#3281]) +10 other tests skip
   [29]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_162622v6/shard-dg1-14/igt@gem_exec_reloc@basic-write-read-noreloc.html

  * igt@gem_exec_schedule@semaphore-power:
    - shard-rkl:          NOTRUN -> [SKIP][30] ([i915#7276])
   [30]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_162622v6/shard-rkl-4/igt@gem_exec_schedule@semaphore-power.html

  * igt@gem_lmem_swapping@heavy-verify-random:
    - shard-rkl:          NOTRUN -> [SKIP][31] ([i915#4613]) +2 other tests skip
   [31]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_162622v6/shard-rkl-5/igt@gem_lmem_swapping@heavy-verify-random.html

  * igt@gem_lmem_swapping@parallel-random-verify:
    - shard-tglu-1:       NOTRUN -> [SKIP][32] ([i915#4613]) +2 other tests skip
   [32]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_162622v6/shard-tglu-1/igt@gem_lmem_swapping@parallel-random-verify.html

  * igt@gem_lmem_swapping@smem-oom:
    - shard-tglu:         NOTRUN -> [SKIP][33] ([i915#4613]) +3 other tests skip
   [33]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_162622v6/shard-tglu-7/igt@gem_lmem_swapping@smem-oom.html
    - shard-glk:          NOTRUN -> [SKIP][34] ([i915#4613])
   [34]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_162622v6/shard-glk6/igt@gem_lmem_swapping@smem-oom.html

  * igt@gem_lmem_swapping@verify-random-ccs:
    - shard-dg1:          NOTRUN -> [SKIP][35] ([i915#12193]) +2 other tests skip
   [35]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_162622v6/shard-dg1-18/igt@gem_lmem_swapping@verify-random-ccs.html

  * igt@gem_lmem_swapping@verify-random-ccs@lmem0:
    - shard-dg1:          NOTRUN -> [SKIP][36] ([i915#4565]) +2 other tests skip
   [36]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_162622v6/shard-dg1-18/igt@gem_lmem_swapping@verify-random-ccs@lmem0.html

  * igt@gem_media_vme:
    - shard-dg1:          NOTRUN -> [SKIP][37] ([i915#284])
   [37]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_162622v6/shard-dg1-14/igt@gem_media_vme.html

  * igt@gem_mmap_wc@write-wc-read-gtt:
    - shard-dg1:          NOTRUN -> [SKIP][38] ([i915#4083]) +2 other tests skip
   [38]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_162622v6/shard-dg1-17/igt@gem_mmap_wc@write-wc-read-gtt.html

  * igt@gem_partial_pwrite_pread@writes-after-reads:
    - shard-dg1:          NOTRUN -> [SKIP][39] ([i915#3282]) +6 other tests skip
   [39]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_162622v6/shard-dg1-17/igt@gem_partial_pwrite_pread@writes-after-reads.html

  * igt@gem_pxp@hw-rejects-pxp-buffer:
    - shard-rkl:          NOTRUN -> [FAIL][40] ([i915#17053])
   [40]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_162622v6/shard-rkl-2/igt@gem_pxp@hw-rejects-pxp-buffer.html
    - shard-tglu:         NOTRUN -> [SKIP][41] ([i915#13398])
   [41]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_162622v6/shard-tglu-4/igt@gem_pxp@hw-rejects-pxp-buffer.html

  * igt@gem_pxp@verify-pxp-execution-after-suspend-resume:
    - shard-dg2:          NOTRUN -> [SKIP][42] ([i915#4270])
   [42]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_162622v6/shard-dg2-6/igt@gem_pxp@verify-pxp-execution-after-suspend-resume.html

  * igt@gem_pxp@verify-pxp-stale-buf-execution:
    - shard-dg1:          NOTRUN -> [SKIP][43] ([i915#4270])
   [43]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_162622v6/shard-dg1-17/igt@gem_pxp@verify-pxp-stale-buf-execution.html

  * igt@gem_readwrite@beyond-eob:
    - shard-rkl:          NOTRUN -> [SKIP][44] ([i915#3282]) +2 other tests skip
   [44]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_162622v6/shard-rkl-4/igt@gem_readwrite@beyond-eob.html

  * igt@gem_set_tiling_vs_blt@tiled-to-tiled:
    - shard-dg2:          NOTRUN -> [SKIP][45] ([i915#4079])
   [45]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_162622v6/shard-dg2-6/igt@gem_set_tiling_vs_blt@tiled-to-tiled.html

  * igt@gem_tiled_pread_basic@basic:
    - shard-rkl:          NOTRUN -> [SKIP][46] ([i915#15656])
   [46]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_162622v6/shard-rkl-4/igt@gem_tiled_pread_basic@basic.html

  * igt@gem_tiled_swapping@non-threaded:
    - shard-dg1:          NOTRUN -> [SKIP][47] ([i915#4077]) +7 other tests skip
   [47]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_162622v6/shard-dg1-14/igt@gem_tiled_swapping@non-threaded.html

  * igt@gem_unfence_active_buffers:
    - shard-dg1:          NOTRUN -> [SKIP][48] ([i915#4879])
   [48]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_162622v6/shard-dg1-18/igt@gem_unfence_active_buffers.html

  * igt@gem_userptr_blits@create-destroy-unsync:
    - shard-dg1:          NOTRUN -> [SKIP][49] ([i915#3297]) +3 other tests skip
   [49]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_162622v6/shard-dg1-17/igt@gem_userptr_blits@create-destroy-unsync.html

  * igt@gem_userptr_blits@dmabuf-sync:
    - shard-tglu-1:       NOTRUN -> [SKIP][50] ([i915#3297] / [i915#3323])
   [50]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_162622v6/shard-tglu-1/igt@gem_userptr_blits@dmabuf-sync.html

  * igt@gem_userptr_blits@dmabuf-unsync:
    - shard-rkl:          NOTRUN -> [SKIP][51] ([i915#3297]) +1 other test skip
   [51]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_162622v6/shard-rkl-2/igt@gem_userptr_blits@dmabuf-unsync.html
    - shard-tglu:         NOTRUN -> [SKIP][52] ([i915#3297]) +4 other tests skip
   [52]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_162622v6/shard-tglu-4/igt@gem_userptr_blits@dmabuf-unsync.html

  * igt@gem_userptr_blits@map-fixed-invalidate-overlap-busy:
    - shard-dg1:          NOTRUN -> [SKIP][53] ([i915#3297] / [i915#4880])
   [53]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_162622v6/shard-dg1-14/igt@gem_userptr_blits@map-fixed-invalidate-overlap-busy.html

  * igt@gen9_exec_parse@basic-rejected:
    - shard-tglu:         NOTRUN -> [SKIP][54] ([i915#2527] / [i915#2856]) +7 other tests skip
   [54]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_162622v6/shard-tglu-3/igt@gen9_exec_parse@basic-rejected.html

  * igt@gen9_exec_parse@bb-start-out:
    - shard-rkl:          NOTRUN -> [SKIP][55] ([i915#2527]) +1 other test skip
   [55]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_162622v6/shard-rkl-4/igt@gen9_exec_parse@bb-start-out.html
    - shard-tglu-1:       NOTRUN -> [SKIP][56] ([i915#2527] / [i915#2856]) +1 other test skip
   [56]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_162622v6/shard-tglu-1/igt@gen9_exec_parse@bb-start-out.html

  * igt@gen9_exec_parse@secure-batches:
    - shard-dg1:          NOTRUN -> [SKIP][57] ([i915#2527]) +3 other tests skip
   [57]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_162622v6/shard-dg1-17/igt@gen9_exec_parse@secure-batches.html

  * igt@i915_drm_fdinfo@virtual-busy:
    - shard-dg1:          NOTRUN -> [SKIP][58] ([i915#14118])
   [58]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_162622v6/shard-dg1-14/igt@i915_drm_fdinfo@virtual-busy.html

  * igt@i915_fb_tiling@basic-x-tiling:
    - shard-dg1:          NOTRUN -> [SKIP][59] ([i915#13786])
   [59]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_162622v6/shard-dg1-18/igt@i915_fb_tiling@basic-x-tiling.html

  * igt@i915_module_load@fault-injection@intel_connector_register:
    - shard-snb:          NOTRUN -> [ABORT][60] ([i915#15342]) +1 other test abort
   [60]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_162622v6/shard-snb1/igt@i915_module_load@fault-injection@intel_connector_register.html

  * igt@i915_module_load@fault-injection@intel_guc_ct_init:
    - shard-snb:          NOTRUN -> [SKIP][61] +529 other tests skip
   [61]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_162622v6/shard-snb1/igt@i915_module_load@fault-injection@intel_guc_ct_init.html

  * igt@i915_module_load@reload-no-display:
    - shard-tglu-1:       NOTRUN -> [DMESG-WARN][62] ([i915#13029] / [i915#14545])
   [62]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_162622v6/shard-tglu-1/igt@i915_module_load@reload-no-display.html

  * igt@i915_pm_freq_api@freq-suspend:
    - shard-tglu:         NOTRUN -> [SKIP][63] ([i915#8399]) +1 other test skip
   [63]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_162622v6/shard-tglu-3/igt@i915_pm_freq_api@freq-suspend.html

  * igt@i915_pm_freq_mult@media-freq@gt0:
    - shard-dg1:          NOTRUN -> [SKIP][64] ([i915#6590]) +1 other test skip
   [64]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_162622v6/shard-dg1-17/igt@i915_pm_freq_mult@media-freq@gt0.html

  * igt@i915_pm_rc6_residency@rc6-fence:
    - shard-tglu-1:       NOTRUN -> [WARN][65] ([i915#13790] / [i915#2681]) +1 other test warn
   [65]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_162622v6/shard-tglu-1/igt@i915_pm_rc6_residency@rc6-fence.html

  * igt@i915_pm_rc6_residency@rc6-idle:
    - shard-tglu:         NOTRUN -> [SKIP][66] ([i915#14498])
   [66]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_162622v6/shard-tglu-3/igt@i915_pm_rc6_residency@rc6-idle.html

  * igt@i915_pm_sseu@full-enable:
    - shard-rkl:          NOTRUN -> [SKIP][67] ([i915#4387])
   [67]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_162622v6/shard-rkl-4/igt@i915_pm_sseu@full-enable.html

  * igt@i915_query@hwconfig_table:
    - shard-dg1:          NOTRUN -> [SKIP][68] ([i915#6245])
   [68]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_162622v6/shard-dg1-17/igt@i915_query@hwconfig_table.html

  * igt@i915_query@query-topology-known-pci-ids:
    - shard-tglu-1:       NOTRUN -> [SKIP][69] ([i915#16109])
   [69]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_162622v6/shard-tglu-1/igt@i915_query@query-topology-known-pci-ids.html

  * igt@i915_query@query-topology-unsupported:
    - shard-dg1:          NOTRUN -> [SKIP][70] ([i915#16079])
   [70]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_162622v6/shard-dg1-17/igt@i915_query@query-topology-unsupported.html
    - shard-tglu:         NOTRUN -> [SKIP][71] ([i915#16079])
   [71]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_162622v6/shard-tglu-5/igt@i915_query@query-topology-unsupported.html

  * igt@i915_suspend@basic-s3-without-i915:
    - shard-glk:          NOTRUN -> [INCOMPLETE][72] ([i915#16182] / [i915#4817])
   [72]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_162622v6/shard-glk9/igt@i915_suspend@basic-s3-without-i915.html

  * igt@i915_suspend@forcewake:
    - shard-rkl:          [PASS][73] -> [ABORT][74] ([i915#15140])
   [73]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19136/shard-rkl-2/igt@i915_suspend@forcewake.html
   [74]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_162622v6/shard-rkl-1/igt@i915_suspend@forcewake.html

  * igt@kms_addfb_basic@bo-too-small-due-to-tiling:
    - shard-dg1:          NOTRUN -> [SKIP][75] ([i915#4212]) +1 other test skip
   [75]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_162622v6/shard-dg1-14/igt@kms_addfb_basic@bo-too-small-due-to-tiling.html

  * igt@kms_addfb_basic@invalid-smem-bo-on-discrete:
    - shard-tglu:         NOTRUN -> [SKIP][76] ([i915#12454] / [i915#12712])
   [76]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_162622v6/shard-tglu-7/igt@kms_addfb_basic@invalid-smem-bo-on-discrete.html

  * igt@kms_async_flips@alternate-sync-async-flip-atomic@pipe-c-hdmi-a-1:
    - shard-glk:          [PASS][77] -> [FAIL][78] ([i915#14888])
   [77]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19136/shard-glk6/igt@kms_async_flips@alternate-sync-async-flip-atomic@pipe-c-hdmi-a-1.html
   [78]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_162622v6/shard-glk2/igt@kms_async_flips@alternate-sync-async-flip-atomic@pipe-c-hdmi-a-1.html

  * igt@kms_async_flips@async-flip-suspend-resume:
    - shard-glk11:        NOTRUN -> [INCOMPLETE][79] ([i915#12761]) +1 other test incomplete
   [79]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_162622v6/shard-glk11/igt@kms_async_flips@async-flip-suspend-resume.html

  * igt@kms_atomic@plane-primary-overlay-mutable-zpos:
    - shard-tglu:         NOTRUN -> [SKIP][80] ([i915#9531])
   [80]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_162622v6/shard-tglu-3/igt@kms_atomic@plane-primary-overlay-mutable-zpos.html

  * igt@kms_atomic_transition@plane-all-modeset-transition-fencing-internal-panels:
    - shard-tglu:         NOTRUN -> [SKIP][81] ([i915#1769] / [i915#3555]) +1 other test skip
   [81]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_162622v6/shard-tglu-4/igt@kms_atomic_transition@plane-all-modeset-transition-fencing-internal-panels.html

  * igt@kms_atomic_transition@plane-toggle-modeset-transition@pipe-b-hdmi-a-1:
    - shard-tglu:         [PASS][82] -> [ABORT][83] ([i915#16866]) +1 other test abort
   [82]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19136/shard-tglu-7/igt@kms_atomic_transition@plane-toggle-modeset-transition@pipe-b-hdmi-a-1.html
   [83]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_162622v6/shard-tglu-8/igt@kms_atomic_transition@plane-toggle-modeset-transition@pipe-b-hdmi-a-1.html

  * igt@kms_big_fb@4-tiled-32bpp-rotate-270:
    - shard-rkl:          NOTRUN -> [SKIP][84] ([i915#5286]) +5 other tests skip
   [84]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_162622v6/shard-rkl-5/igt@kms_big_fb@4-tiled-32bpp-rotate-270.html

  * igt@kms_big_fb@4-tiled-addfb:
    - shard-dg1:          NOTRUN -> [SKIP][85] ([i915#5286])
   [85]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_162622v6/shard-dg1-17/igt@kms_big_fb@4-tiled-addfb.html

  * igt@kms_big_fb@4-tiled-max-hw-stride-32bpp-rotate-0-async-flip:
    - shard-tglu:         NOTRUN -> [SKIP][86] ([i915#5286]) +8 other tests skip
   [86]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_162622v6/shard-tglu-4/igt@kms_big_fb@4-tiled-max-hw-stride-32bpp-rotate-0-async-flip.html

  * igt@kms_big_fb@4-tiled-max-hw-stride-32bpp-rotate-180-async-flip:
    - shard-dg1:          NOTRUN -> [SKIP][87] ([i915#4538] / [i915#5286]) +3 other tests skip
   [87]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_162622v6/shard-dg1-18/igt@kms_big_fb@4-tiled-max-hw-stride-32bpp-rotate-180-async-flip.html

  * igt@kms_big_fb@4-tiled-max-hw-stride-32bpp-rotate-180-hflip-async-flip:
    - shard-tglu-1:       NOTRUN -> [SKIP][88] ([i915#5286]) +2 other tests skip
   [88]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_162622v6/shard-tglu-1/igt@kms_big_fb@4-tiled-max-hw-stride-32bpp-rotate-180-hflip-async-flip.html

  * igt@kms_big_fb@linear-32bpp-rotate-270:
    - shard-dg2:          NOTRUN -> [SKIP][89] +1 other test skip
   [89]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_162622v6/shard-dg2-6/igt@kms_big_fb@linear-32bpp-rotate-270.html

  * igt@kms_big_fb@linear-8bpp-rotate-270:
    - shard-dg1:          NOTRUN -> [SKIP][90] ([i915#3638]) +4 other tests skip
   [90]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_162622v6/shard-dg1-18/igt@kms_big_fb@linear-8bpp-rotate-270.html

  * igt@kms_big_fb@linear-max-hw-stride-32bpp-rotate-180-hflip:
    - shard-tglu-1:       NOTRUN -> [SKIP][91] ([i915#3828])
   [91]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_162622v6/shard-tglu-1/igt@kms_big_fb@linear-max-hw-stride-32bpp-rotate-180-hflip.html

  * igt@kms_big_fb@linear-max-hw-stride-64bpp-rotate-0-hflip:
    - shard-rkl:          NOTRUN -> [SKIP][92] ([i915#3828]) +1 other test skip
   [92]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_162622v6/shard-rkl-2/igt@kms_big_fb@linear-max-hw-stride-64bpp-rotate-0-hflip.html

  * igt@kms_big_fb@linear-max-hw-stride-64bpp-rotate-180-hflip:
    - shard-tglu:         NOTRUN -> [SKIP][93] ([i915#3828]) +1 other test skip
   [93]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_162622v6/shard-tglu-3/igt@kms_big_fb@linear-max-hw-stride-64bpp-rotate-180-hflip.html

  * igt@kms_big_fb@y-tiled-8bpp-rotate-90:
    - shard-rkl:          NOTRUN -> [SKIP][94] ([i915#3638])
   [94]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_162622v6/shard-rkl-2/igt@kms_big_fb@y-tiled-8bpp-rotate-90.html

  * igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-180-async-flip:
    - shard-dg1:          NOTRUN -> [SKIP][95] ([i915#4538]) +6 other tests skip
   [95]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_162622v6/shard-dg1-18/igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-180-async-flip.html

  * igt@kms_ccs@bad-aux-stride-yf-tiled-ccs@pipe-b-hdmi-a-2:
    - shard-rkl:          NOTRUN -> [SKIP][96] ([i915#14544] / [i915#6095]) +3 other tests skip
   [96]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_162622v6/shard-rkl-6/igt@kms_ccs@bad-aux-stride-yf-tiled-ccs@pipe-b-hdmi-a-2.html

  * igt@kms_ccs@bad-pixel-format-4-tiled-mtl-mc-ccs@pipe-c-hdmi-a-1:
    - shard-rkl:          NOTRUN -> [SKIP][97] ([i915#14098] / [i915#6095]) +47 other tests skip
   [97]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_162622v6/shard-rkl-2/igt@kms_ccs@bad-pixel-format-4-tiled-mtl-mc-ccs@pipe-c-hdmi-a-1.html

  * igt@kms_ccs@bad-pixel-format-y-tiled-gen12-rc-ccs-cc@pipe-a-edp-1:
    - shard-mtlp:         NOTRUN -> [SKIP][98] ([i915#6095]) +39 other tests skip
   [98]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_162622v6/shard-mtlp-5/igt@kms_ccs@bad-pixel-format-y-tiled-gen12-rc-ccs-cc@pipe-a-edp-1.html

  * igt@kms_ccs@bad-rotation-90-4-tiled-mtl-rc-ccs@pipe-c-hdmi-a-1:
    - shard-dg2:          NOTRUN -> [SKIP][99] ([i915#10307] / [i915#6095]) +46 other tests skip
   [99]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_162622v6/shard-dg2-4/igt@kms_ccs@bad-rotation-90-4-tiled-mtl-rc-ccs@pipe-c-hdmi-a-1.html

  * igt@kms_ccs@bad-rotation-90-4-tiled-mtl-rc-ccs@pipe-d-hdmi-a-1:
    - shard-dg2:          NOTRUN -> [SKIP][100] ([i915#10307] / [i915#10434] / [i915#6095]) +1 other test skip
   [100]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_162622v6/shard-dg2-4/igt@kms_ccs@bad-rotation-90-4-tiled-mtl-rc-ccs@pipe-d-hdmi-a-1.html

  * igt@kms_ccs@crc-primary-rotation-180-4-tiled-mtl-rc-ccs@pipe-b-hdmi-a-1:
    - shard-tglu-1:       NOTRUN -> [SKIP][101] ([i915#6095]) +34 other tests skip
   [101]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_162622v6/shard-tglu-1/igt@kms_ccs@crc-primary-rotation-180-4-tiled-mtl-rc-ccs@pipe-b-hdmi-a-1.html

  * igt@kms_ccs@crc-primary-rotation-180-4-tiled-mtl-rc-ccs@pipe-b-hdmi-a-2:
    - shard-rkl:          NOTRUN -> [SKIP][102] ([i915#6095]) +75 other tests skip
   [102]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_162622v6/shard-rkl-4/igt@kms_ccs@crc-primary-rotation-180-4-tiled-mtl-rc-ccs@pipe-b-hdmi-a-2.html

  * igt@kms_ccs@crc-primary-suspend-4-tiled-dg2-mc-ccs:
    - shard-dg1:          NOTRUN -> [SKIP][103] ([i915#6095]) +187 other tests skip
   [103]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_162622v6/shard-dg1-14/igt@kms_ccs@crc-primary-suspend-4-tiled-dg2-mc-ccs.html

  * igt@kms_ccs@crc-primary-suspend-y-tiled-gen12-rc-ccs@pipe-c-hdmi-a-1:
    - shard-dg2:          NOTRUN -> [SKIP][104] ([i915#6095]) +7 other tests skip
   [104]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_162622v6/shard-dg2-4/igt@kms_ccs@crc-primary-suspend-y-tiled-gen12-rc-ccs@pipe-c-hdmi-a-1.html

  * igt@kms_ccs@crc-sprite-planes-basic-4-tiled-lnl-ccs:
    - shard-dg1:          NOTRUN -> [SKIP][105] ([i915#12313]) +1 other test skip
   [105]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_162622v6/shard-dg1-14/igt@kms_ccs@crc-sprite-planes-basic-4-tiled-lnl-ccs.html

  * igt@kms_ccs@crc-sprite-planes-basic-4-tiled-mtl-rc-ccs-cc@pipe-b-hdmi-a-1:
    - shard-tglu:         NOTRUN -> [SKIP][106] ([i915#6095]) +94 other tests skip
   [106]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_162622v6/shard-tglu-7/igt@kms_ccs@crc-sprite-planes-basic-4-tiled-mtl-rc-ccs-cc@pipe-b-hdmi-a-1.html

  * igt@kms_ccs@missing-ccs-buffer-4-tiled-mtl-mc-ccs@pipe-c-hdmi-a-2:
    - shard-rkl:          NOTRUN -> [SKIP][107] ([i915#14098] / [i915#14544] / [i915#6095]) +1 other test skip
   [107]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_162622v6/shard-rkl-6/igt@kms_ccs@missing-ccs-buffer-4-tiled-mtl-mc-ccs@pipe-c-hdmi-a-2.html

  * igt@kms_ccs@random-ccs-data-4-tiled-bmg-ccs:
    - shard-rkl:          NOTRUN -> [SKIP][108] ([i915#12313])
   [108]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_162622v6/shard-rkl-5/igt@kms_ccs@random-ccs-data-4-tiled-bmg-ccs.html

  * igt@kms_ccs@random-ccs-data-4-tiled-lnl-ccs:
    - shard-tglu:         NOTRUN -> [SKIP][109] ([i915#12313]) +2 other tests skip
   [109]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_162622v6/shard-tglu-8/igt@kms_ccs@random-ccs-data-4-tiled-lnl-ccs.html

  * igt@kms_cdclk@mode-transition:
    - shard-tglu:         NOTRUN -> [SKIP][110] ([i915#3742])
   [110]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_162622v6/shard-tglu-7/igt@kms_cdclk@mode-transition.html

  * igt@kms_cdclk@plane-scaling:
    - shard-rkl:          NOTRUN -> [SKIP][111] ([i915#3742])
   [111]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_162622v6/shard-rkl-5/igt@kms_cdclk@plane-scaling.html

  * igt@kms_cdclk@plane-scaling@pipe-c-edp-1:
    - shard-mtlp:         NOTRUN -> [SKIP][112] ([i915#17016]) +3 other tests skip
   [112]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_162622v6/shard-mtlp-8/igt@kms_cdclk@plane-scaling@pipe-c-edp-1.html

  * igt@kms_chamelium_audio@hdmi-audio-after-suspend:
    - shard-dg1:          NOTRUN -> [SKIP][113] ([i915#11151]) +1 other test skip
   [113]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_162622v6/shard-dg1-18/igt@kms_chamelium_audio@hdmi-audio-after-suspend.html

  * igt@kms_chamelium_color_pipeline@plane-lut1d-ctm3x4-lut1d:
    - shard-tglu:         NOTRUN -> [SKIP][114] ([i915#16471]) +1 other test skip
   [114]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_162622v6/shard-tglu-4/igt@kms_chamelium_color_pipeline@plane-lut1d-ctm3x4-lut1d.html

  * igt@kms_chamelium_color_pipeline@plane-lut1d-pre-ctm3x4:
    - shard-rkl:          NOTRUN -> [SKIP][115] ([i915#16471])
   [115]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_162622v6/shard-rkl-4/igt@kms_chamelium_color_pipeline@plane-lut1d-pre-ctm3x4.html
    - shard-tglu-1:       NOTRUN -> [SKIP][116] ([i915#16471])
   [116]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_162622v6/shard-tglu-1/igt@kms_chamelium_color_pipeline@plane-lut1d-pre-ctm3x4.html

  * igt@kms_chamelium_edid@hdmi-edid-stress-resolution-non-4k:
    - shard-rkl:          NOTRUN -> [SKIP][117] ([i915#11151] / [i915#7828]) +5 other tests skip
   [117]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_162622v6/shard-rkl-2/igt@kms_chamelium_edid@hdmi-edid-stress-resolution-non-4k.html

  * igt@kms_chamelium_frames@dp-crc-single:
    - shard-tglu:         NOTRUN -> [SKIP][118] ([i915#11151] / [i915#7828]) +8 other tests skip
   [118]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_162622v6/shard-tglu-4/igt@kms_chamelium_frames@dp-crc-single.html

  * igt@kms_chamelium_frames@hdmi-cmp-planar-formats:
    - shard-tglu-1:       NOTRUN -> [SKIP][119] ([i915#11151] / [i915#7828]) +3 other tests skip
   [119]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_162622v6/shard-tglu-1/igt@kms_chamelium_frames@hdmi-cmp-planar-formats.html

  * igt@kms_chamelium_frames@hdmi-crc-fast:
    - shard-dg1:          NOTRUN -> [SKIP][120] ([i915#11151] / [i915#7828]) +6 other tests skip
   [120]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_162622v6/shard-dg1-14/igt@kms_chamelium_frames@hdmi-crc-fast.html

  * igt@kms_content_protection@atomic-dpms-hdcp14:
    - shard-rkl:          NOTRUN -> [SKIP][121] ([i915#15865])
   [121]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_162622v6/shard-rkl-2/igt@kms_content_protection@atomic-dpms-hdcp14.html

  * igt@kms_content_protection@dp-mst-lic-type-0:
    - shard-tglu:         NOTRUN -> [SKIP][122] ([i915#15330] / [i915#3116] / [i915#3299])
   [122]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_162622v6/shard-tglu-3/igt@kms_content_protection@dp-mst-lic-type-0.html

  * igt@kms_content_protection@dp-mst-lic-type-0-hdcp14:
    - shard-tglu:         NOTRUN -> [SKIP][123] ([i915#15330])
   [123]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_162622v6/shard-tglu-7/igt@kms_content_protection@dp-mst-lic-type-0-hdcp14.html

  * igt@kms_content_protection@dp-mst-type-0-hdcp14:
    - shard-dg1:          NOTRUN -> [SKIP][124] ([i915#15330])
   [124]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_162622v6/shard-dg1-17/igt@kms_content_protection@dp-mst-type-0-hdcp14.html

  * igt@kms_content_protection@dp-mst-type-1:
    - shard-rkl:          NOTRUN -> [SKIP][125] ([i915#15330] / [i915#3116])
   [125]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_162622v6/shard-rkl-4/igt@kms_content_protection@dp-mst-type-1.html

  * igt@kms_content_protection@lic-type-0:
    - shard-tglu:         NOTRUN -> [SKIP][126] ([i915#15865]) +6 other tests skip
   [126]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_162622v6/shard-tglu-4/igt@kms_content_protection@lic-type-0.html

  * igt@kms_content_protection@mei-interface:
    - shard-dg1:          NOTRUN -> [SKIP][127] ([i915#15865])
   [127]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_162622v6/shard-dg1-14/igt@kms_content_protection@mei-interface.html

  * igt@kms_content_protection@type1:
    - shard-tglu-1:       NOTRUN -> [SKIP][128] ([i915#15865])
   [128]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_162622v6/shard-tglu-1/igt@kms_content_protection@type1.html

  * igt@kms_cursor_crc@cursor-offscreen-512x512:
    - shard-dg1:          NOTRUN -> [SKIP][129] ([i915#13049]) +1 other test skip
   [129]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_162622v6/shard-dg1-17/igt@kms_cursor_crc@cursor-offscreen-512x512.html
    - shard-tglu:         NOTRUN -> [SKIP][130] ([i915#13049]) +1 other test skip
   [130]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_162622v6/shard-tglu-5/igt@kms_cursor_crc@cursor-offscreen-512x512.html

  * igt@kms_cursor_crc@cursor-random-32x10:
    - shard-dg2:          NOTRUN -> [SKIP][131] ([i915#3555])
   [131]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_162622v6/shard-dg2-6/igt@kms_cursor_crc@cursor-random-32x10.html

  * igt@kms_cursor_crc@cursor-random-512x170:
    - shard-rkl:          NOTRUN -> [SKIP][132] ([i915#13049]) +1 other test skip
   [132]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_162622v6/shard-rkl-4/igt@kms_cursor_crc@cursor-random-512x170.html
    - shard-tglu-1:       NOTRUN -> [SKIP][133] ([i915#13049]) +1 other test skip
   [133]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_162622v6/shard-tglu-1/igt@kms_cursor_crc@cursor-random-512x170.html

  * igt@kms_cursor_crc@cursor-rapid-movement-max-size:
    - shard-rkl:          NOTRUN -> [SKIP][134] ([i915#3555]) +1 other test skip
   [134]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_162622v6/shard-rkl-4/igt@kms_cursor_crc@cursor-rapid-movement-max-size.html

  * igt@kms_cursor_crc@cursor-sliding-128x42:
    - shard-rkl:          [PASS][135] -> [FAIL][136] ([i915#13566]) +1 other test fail
   [135]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19136/shard-rkl-6/igt@kms_cursor_crc@cursor-sliding-128x42.html
   [136]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_162622v6/shard-rkl-7/igt@kms_cursor_crc@cursor-sliding-128x42.html

  * igt@kms_cursor_crc@cursor-sliding-256x85:
    - shard-tglu:         NOTRUN -> [FAIL][137] ([i915#13566]) +1 other test fail
   [137]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_162622v6/shard-tglu-3/igt@kms_cursor_crc@cursor-sliding-256x85.html

  * igt@kms_cursor_crc@cursor-sliding-32x10:
    - shard-dg1:          NOTRUN -> [SKIP][138] ([i915#3555]) +6 other tests skip
   [138]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_162622v6/shard-dg1-14/igt@kms_cursor_crc@cursor-sliding-32x10.html

  * igt@kms_cursor_crc@cursor-sliding-64x21@pipe-a-hdmi-a-1:
    - shard-rkl:          NOTRUN -> [FAIL][139] ([i915#13566]) +1 other test fail
   [139]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_162622v6/shard-rkl-8/igt@kms_cursor_crc@cursor-sliding-64x21@pipe-a-hdmi-a-1.html

  * igt@kms_cursor_crc@cursor-suspend:
    - shard-glk:          NOTRUN -> [INCOMPLETE][140] ([i915#12358] / [i915#14152] / [i915#7882])
   [140]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_162622v6/shard-glk8/igt@kms_cursor_crc@cursor-suspend.html

  * igt@kms_cursor_crc@cursor-suspend@pipe-a-hdmi-a-1:
    - shard-glk:          NOTRUN -> [INCOMPLETE][141] ([i915#12358] / [i915#14152])
   [141]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_162622v6/shard-glk8/igt@kms_cursor_crc@cursor-suspend@pipe-a-hdmi-a-1.html

  * igt@kms_cursor_edge_walk@256x256-left-edge@pipe-d-hdmi-a-1:
    - shard-tglu:         [PASS][142] -> [DMESG-WARN][143] ([i915#16685]) +1 other test dmesg-warn
   [142]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19136/shard-tglu-7/igt@kms_cursor_edge_walk@256x256-left-edge@pipe-d-hdmi-a-1.html
   [143]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_162622v6/shard-tglu-7/igt@kms_cursor_edge_walk@256x256-left-edge@pipe-d-hdmi-a-1.html

  * igt@kms_cursor_legacy@basic-busy-flip-before-cursor-legacy:
    - shard-dg1:          NOTRUN -> [SKIP][144] ([i915#4103])
   [144]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_162622v6/shard-dg1-14/igt@kms_cursor_legacy@basic-busy-flip-before-cursor-legacy.html

  * igt@kms_cursor_legacy@basic-busy-flip-before-cursor-varying-size:
    - shard-tglu:         NOTRUN -> [SKIP][145] ([i915#4103]) +1 other test skip
   [145]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_162622v6/shard-tglu-3/igt@kms_cursor_legacy@basic-busy-flip-before-cursor-varying-size.html

  * igt@kms_cursor_legacy@basic-flip-after-cursor-legacy:
    - shard-mtlp:         [PASS][146] -> [SKIP][147] ([i915#17031]) +55 other tests skip
   [146]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19136/shard-mtlp-8/igt@kms_cursor_legacy@basic-flip-after-cursor-legacy.html
   [147]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_162622v6/shard-mtlp-7/igt@kms_cursor_legacy@basic-flip-after-cursor-legacy.html

  * igt@kms_cursor_legacy@modeset-atomic-cursor-hotspot:
    - shard-tglu:         NOTRUN -> [SKIP][148] ([i915#9067])
   [148]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_162622v6/shard-tglu-7/igt@kms_cursor_legacy@modeset-atomic-cursor-hotspot.html

  * igt@kms_dirtyfb@psr-dirtyfb-ioctl:
    - shard-rkl:          NOTRUN -> [SKIP][149] ([i915#9723])
   [149]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_162622v6/shard-rkl-4/igt@kms_dirtyfb@psr-dirtyfb-ioctl.html

  * igt@kms_display_modes@extended-mode-basic:
    - shard-tglu:         NOTRUN -> [SKIP][150] ([i915#13691])
   [150]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_162622v6/shard-tglu-3/igt@kms_display_modes@extended-mode-basic.html

  * igt@kms_dither@fb-8bpc-vs-panel-6bpc@pipe-a-hdmi-a-2:
    - shard-rkl:          NOTRUN -> [SKIP][151] ([i915#3804])
   [151]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_162622v6/shard-rkl-7/igt@kms_dither@fb-8bpc-vs-panel-6bpc@pipe-a-hdmi-a-2.html

  * igt@kms_dp_aux_dev@basic:
    - shard-tglu:         NOTRUN -> [SKIP][152] ([i915#1257])
   [152]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_162622v6/shard-tglu-4/igt@kms_dp_aux_dev@basic.html

  * igt@kms_dp_link_training@non-uhbr-mst:
    - shard-rkl:          NOTRUN -> [SKIP][153] ([i915#13749])
   [153]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_162622v6/shard-rkl-4/igt@kms_dp_link_training@non-uhbr-mst.html
    - shard-tglu-1:       NOTRUN -> [SKIP][154] ([i915#13749])
   [154]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_162622v6/shard-tglu-1/igt@kms_dp_link_training@non-uhbr-mst.html

  * igt@kms_dp_linktrain_fallback@uhbr-to-hbr-fallback:
    - shard-tglu:         NOTRUN -> [SKIP][155] ([i915#16870])
   [155]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_162622v6/shard-tglu-3/igt@kms_dp_linktrain_fallback@uhbr-to-hbr-fallback.html

  * igt@kms_dsc@dsc-fractional-bpp-ultrajoiner:
    - shard-rkl:          NOTRUN -> [SKIP][156] ([i915#16361]) +2 other tests skip
   [156]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_162622v6/shard-rkl-2/igt@kms_dsc@dsc-fractional-bpp-ultrajoiner.html

  * igt@kms_dsc@dsc-with-bpc-formats-ultrajoiner:
    - shard-tglu-1:       NOTRUN -> [SKIP][157] ([i915#16361])
   [157]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_162622v6/shard-tglu-1/igt@kms_dsc@dsc-with-bpc-formats-ultrajoiner.html

  * igt@kms_dsc@dsc-with-formats:
    - shard-tglu:         NOTRUN -> [SKIP][158] ([i915#16361]) +5 other tests skip
   [158]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_162622v6/shard-tglu-3/igt@kms_dsc@dsc-with-formats.html

  * igt@kms_dsc@dsc-with-output-formats-bigjoiner:
    - shard-dg1:          NOTRUN -> [SKIP][159] ([i915#16361]) +4 other tests skip
   [159]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_162622v6/shard-dg1-14/igt@kms_dsc@dsc-with-output-formats-bigjoiner.html

  * igt@kms_feature_discovery@chamelium:
    - shard-tglu:         NOTRUN -> [SKIP][160] ([i915#2065])
   [160]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_162622v6/shard-tglu-4/igt@kms_feature_discovery@chamelium.html

  * igt@kms_feature_discovery@display-2x:
    - shard-tglu:         NOTRUN -> [SKIP][161] ([i915#16081])
   [161]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_162622v6/shard-tglu-3/igt@kms_feature_discovery@display-2x.html

  * igt@kms_feature_discovery@display-3x:
    - shard-dg1:          NOTRUN -> [SKIP][162] ([i915#16081])
   [162]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_162622v6/shard-dg1-18/igt@kms_feature_discovery@display-3x.html

  * igt@kms_feature_discovery@dp-mst:
    - shard-dg1:          NOTRUN -> [SKIP][163] ([i915#16599])
   [163]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_162622v6/shard-dg1-14/igt@kms_feature_discovery@dp-mst.html

  * igt@kms_feature_discovery@dsc:
    - shard-tglu:         NOTRUN -> [SKIP][164] ([i915#16600])
   [164]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_162622v6/shard-tglu-8/igt@kms_feature_discovery@dsc.html

  * igt@kms_feature_discovery@vrr:
    - shard-dg1:          NOTRUN -> [SKIP][165] ([i915#16600])
   [165]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_162622v6/shard-dg1-17/igt@kms_feature_discovery@vrr.html

  * igt@kms_flip@2x-flip-vs-fences:
    - shard-dg1:          NOTRUN -> [SKIP][166] ([i915#8381])
   [166]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_162622v6/shard-dg1-14/igt@kms_flip@2x-flip-vs-fences.html

  * igt@kms_flip@2x-flip-vs-suspend-interruptible:
    - shard-glk:          NOTRUN -> [INCOMPLETE][167] ([i915#12745] / [i915#4839])
   [167]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_162622v6/shard-glk6/igt@kms_flip@2x-flip-vs-suspend-interruptible.html

  * igt@kms_flip@2x-flip-vs-suspend-interruptible@ac-hdmi-a1-hdmi-a2:
    - shard-glk:          NOTRUN -> [INCOMPLETE][168] ([i915#12745])
   [168]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_162622v6/shard-glk6/igt@kms_flip@2x-flip-vs-suspend-interruptible@ac-hdmi-a1-hdmi-a2.html

  * igt@kms_flip@2x-modeset-vs-vblank-race:
    - shard-rkl:          NOTRUN -> [SKIP][169] ([i915#9934]) +5 other tests skip
   [169]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_162622v6/shard-rkl-5/igt@kms_flip@2x-modeset-vs-vblank-race.html

  * igt@kms_flip@2x-plain-flip-interruptible:
    - shard-dg1:          NOTRUN -> [SKIP][170] ([i915#9934]) +6 other tests skip
   [170]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_162622v6/shard-dg1-14/igt@kms_flip@2x-plain-flip-interruptible.html

  * igt@kms_flip@2x-wf_vblank-ts-check:
    - shard-tglu:         NOTRUN -> [SKIP][171] ([i915#3637] / [i915#9934]) +12 other tests skip
   [171]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_162622v6/shard-tglu-3/igt@kms_flip@2x-wf_vblank-ts-check.html

  * igt@kms_flip@2x-wf_vblank-ts-check-interruptible:
    - shard-tglu-1:       NOTRUN -> [SKIP][172] ([i915#3637] / [i915#9934])
   [172]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_162622v6/shard-tglu-1/igt@kms_flip@2x-wf_vblank-ts-check-interruptible.html

  * igt@kms_flip@dpms-vs-vblank-race-interruptible@d-hdmi-a4:
    - shard-dg1:          [PASS][173] -> [ABORT][174] ([i915#16876] / [i915#16932])
   [173]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19136/shard-dg1-16/igt@kms_flip@dpms-vs-vblank-race-interruptible@d-hdmi-a4.html
   [174]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_162622v6/shard-dg1-17/igt@kms_flip@dpms-vs-vblank-race-interruptible@d-hdmi-a4.html

  * igt@kms_flip@flip-vs-suspend:
    - shard-glk10:        NOTRUN -> [INCOMPLETE][175] ([i915#12745] / [i915#4839])
   [175]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_162622v6/shard-glk10/igt@kms_flip@flip-vs-suspend.html

  * igt@kms_flip@flip-vs-suspend@a-hdmi-a1:
    - shard-glk10:        NOTRUN -> [INCOMPLETE][176] ([i915#12745])
   [176]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_162622v6/shard-glk10/igt@kms_flip@flip-vs-suspend@a-hdmi-a1.html

  * igt@kms_flip_scaled_crc@flip-32bpp-4tile-to-64bpp-4tile-downscaling:
    - shard-rkl:          NOTRUN -> [SKIP][177] ([i915#15643]) +1 other test skip
   [177]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_162622v6/shard-rkl-4/igt@kms_flip_scaled_crc@flip-32bpp-4tile-to-64bpp-4tile-downscaling.html

  * igt@kms_flip_scaled_crc@flip-32bpp-xtile-to-64bpp-xtile-downscaling@pipe-a-default-mode:
    - shard-mtlp:         NOTRUN -> [SKIP][178] ([i915#3555] / [i915#8810] / [i915#8813]) +1 other test skip
   [178]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_162622v6/shard-mtlp-6/igt@kms_flip_scaled_crc@flip-32bpp-xtile-to-64bpp-xtile-downscaling@pipe-a-default-mode.html

  * igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytileccs-upscaling:
    - shard-dg1:          NOTRUN -> [SKIP][179] ([i915#15643]) +5 other tests skip
   [179]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_162622v6/shard-dg1-17/igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytileccs-upscaling.html

  * igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-16bpp-4tile-downscaling:
    - shard-tglu-1:       NOTRUN -> [SKIP][180] ([i915#15643]) +1 other test skip
   [180]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_162622v6/shard-tglu-1/igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-16bpp-4tile-downscaling.html

  * igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-32bpp-yftile-upscaling:
    - shard-tglu:         NOTRUN -> [SKIP][181] ([i915#15643]) +6 other tests skip
   [181]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_162622v6/shard-tglu-4/igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-32bpp-yftile-upscaling.html

  * igt@kms_frontbuffer_tracking@fbc-2p-primscrn-pri-shrfb-draw-mmap-gtt:
    - shard-rkl:          NOTRUN -> [SKIP][182] ([i915#1825]) +7 other tests skip
   [182]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_162622v6/shard-rkl-4/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-pri-shrfb-draw-mmap-gtt.html

  * igt@kms_frontbuffer_tracking@fbc-2p-primscrn-spr-indfb-fullscreen:
    - shard-dg1:          NOTRUN -> [SKIP][183] +79 other tests skip
   [183]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_162622v6/shard-dg1-14/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-spr-indfb-fullscreen.html

  * igt@kms_frontbuffer_tracking@fbc-tiling-4:
    - shard-tglu-1:       NOTRUN -> [SKIP][184] ([i915#5439])
   [184]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_162622v6/shard-tglu-1/igt@kms_frontbuffer_tracking@fbc-tiling-4.html

  * igt@kms_frontbuffer_tracking@fbchdr-1p-primscrn-cur-indfb-onoff:
    - shard-rkl:          [PASS][185] -> [SKIP][186] ([i915#15989]) +13 other tests skip
   [185]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19136/shard-rkl-6/igt@kms_frontbuffer_tracking@fbchdr-1p-primscrn-cur-indfb-onoff.html
   [186]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_162622v6/shard-rkl-7/igt@kms_frontbuffer_tracking@fbchdr-1p-primscrn-cur-indfb-onoff.html
    - shard-dg1:          NOTRUN -> [SKIP][187] ([i915#15989]) +13 other tests skip
   [187]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_162622v6/shard-dg1-14/igt@kms_frontbuffer_tracking@fbchdr-1p-primscrn-cur-indfb-onoff.html

  * igt@kms_frontbuffer_tracking@fbchdr-1p-primscrn-pri-shrfb-draw-pwrite:
    - shard-glk:          [PASS][188] -> [SKIP][189]
   [188]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19136/shard-glk8/igt@kms_frontbuffer_tracking@fbchdr-1p-primscrn-pri-shrfb-draw-pwrite.html
   [189]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_162622v6/shard-glk5/igt@kms_frontbuffer_tracking@fbchdr-1p-primscrn-pri-shrfb-draw-pwrite.html

  * igt@kms_frontbuffer_tracking@fbchdr-1p-rte:
    - shard-tglu-1:       NOTRUN -> [SKIP][190] ([i915#15989]) +9 other tests skip
   [190]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_162622v6/shard-tglu-1/igt@kms_frontbuffer_tracking@fbchdr-1p-rte.html

  * igt@kms_frontbuffer_tracking@fbchdr-tiling-4:
    - shard-tglu:         NOTRUN -> [SKIP][191] ([i915#5439]) +1 other test skip
   [191]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_162622v6/shard-tglu-7/igt@kms_frontbuffer_tracking@fbchdr-tiling-4.html

  * igt@kms_frontbuffer_tracking@fbcpsr-1p-offscreen-pri-shrfb-draw-mmap-gtt:
    - shard-dg2:          NOTRUN -> [SKIP][192] ([i915#15104] / [i915#15990])
   [192]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_162622v6/shard-dg2-6/igt@kms_frontbuffer_tracking@fbcpsr-1p-offscreen-pri-shrfb-draw-mmap-gtt.html

  * igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-shrfb-plflip-blt:
    - shard-dg2:          NOTRUN -> [SKIP][193] ([i915#15102])
   [193]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_162622v6/shard-dg2-6/igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-shrfb-plflip-blt.html

  * igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-pri-indfb-draw-blt:
    - shard-glk10:        NOTRUN -> [SKIP][194] +213 other tests skip
   [194]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_162622v6/shard-glk10/igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-pri-indfb-draw-blt.html

  * igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-spr-indfb-fullscreen:
    - shard-tglu:         NOTRUN -> [SKIP][195] +148 other tests skip
   [195]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_162622v6/shard-tglu-4/igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-spr-indfb-fullscreen.html

  * igt@kms_frontbuffer_tracking@fbcpsr-rgb101010-draw-blt:
    - shard-dg1:          NOTRUN -> [SKIP][196] ([i915#15102]) +33 other tests skip
   [196]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_162622v6/shard-dg1-17/igt@kms_frontbuffer_tracking@fbcpsr-rgb101010-draw-blt.html

  * igt@kms_frontbuffer_tracking@fbcpsrhdr-2p-primscrn-spr-indfb-draw-pwrite:
    - shard-glk11:        NOTRUN -> [SKIP][197] +79 other tests skip
   [197]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_162622v6/shard-glk11/igt@kms_frontbuffer_tracking@fbcpsrhdr-2p-primscrn-spr-indfb-draw-pwrite.html

  * igt@kms_frontbuffer_tracking@fbcpsrhdr-2p-scndscrn-indfb-msflip-blt:
    - shard-rkl:          NOTRUN -> [SKIP][198] +62 other tests skip
   [198]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_162622v6/shard-rkl-4/igt@kms_frontbuffer_tracking@fbcpsrhdr-2p-scndscrn-indfb-msflip-blt.html

  * igt@kms_frontbuffer_tracking@fbcpsrhdr-suspend:
    - shard-tglu-1:       NOTRUN -> [SKIP][199] ([i915#15102]) +21 other tests skip
   [199]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_162622v6/shard-tglu-1/igt@kms_frontbuffer_tracking@fbcpsrhdr-suspend.html

  * igt@kms_frontbuffer_tracking@hdr-1p-offscreen-pri-indfb-draw-mmap-gtt:
    - shard-dg1:          NOTRUN -> [SKIP][200] ([i915#15990]) +21 other tests skip
   [200]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_162622v6/shard-dg1-14/igt@kms_frontbuffer_tracking@hdr-1p-offscreen-pri-indfb-draw-mmap-gtt.html

  * igt@kms_frontbuffer_tracking@hdr-1p-offscreen-pri-shrfb-draw-mmap-gtt:
    - shard-tglu:         NOTRUN -> [SKIP][201] ([i915#15989]) +30 other tests skip
   [201]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_162622v6/shard-tglu-4/igt@kms_frontbuffer_tracking@hdr-1p-offscreen-pri-shrfb-draw-mmap-gtt.html

  * igt@kms_frontbuffer_tracking@hdr-1p-primscrn-spr-indfb-draw-render:
    - shard-dg2:          NOTRUN -> [SKIP][202] ([i915#15989]) +2 other tests skip
   [202]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_162622v6/shard-dg2-6/igt@kms_frontbuffer_tracking@hdr-1p-primscrn-spr-indfb-draw-render.html

  * igt@kms_frontbuffer_tracking@hdr-rgb565-draw-pwrite:
    - shard-rkl:          NOTRUN -> [SKIP][203] ([i915#15989]) +9 other tests skip
   [203]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_162622v6/shard-rkl-5/igt@kms_frontbuffer_tracking@hdr-rgb565-draw-pwrite.html

  * igt@kms_frontbuffer_tracking@pipe-fbc-rte:
    - shard-tglu:         NOTRUN -> [SKIP][204] ([i915#9766])
   [204]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_162622v6/shard-tglu-8/igt@kms_frontbuffer_tracking@pipe-fbc-rte.html

  * igt@kms_frontbuffer_tracking@psr-1p-offscreen-pri-indfb-draw-mmap-wc:
    - shard-dg1:          NOTRUN -> [SKIP][205] ([i915#15104] / [i915#15990])
   [205]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_162622v6/shard-dg1-17/igt@kms_frontbuffer_tracking@psr-1p-offscreen-pri-indfb-draw-mmap-wc.html

  * igt@kms_frontbuffer_tracking@psr-1p-primscrn-pri-shrfb-draw-mmap-gtt:
    - shard-dg1:          NOTRUN -> [SKIP][206] ([i915#15990] / [i915#8708]) +15 other tests skip
   [206]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_162622v6/shard-dg1-18/igt@kms_frontbuffer_tracking@psr-1p-primscrn-pri-shrfb-draw-mmap-gtt.html

  * igt@kms_frontbuffer_tracking@psr-rgb101010-draw-mmap-gtt:
    - shard-dg2:          NOTRUN -> [SKIP][207] ([i915#15990] / [i915#8708])
   [207]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_162622v6/shard-dg2-6/igt@kms_frontbuffer_tracking@psr-rgb101010-draw-mmap-gtt.html

  * igt@kms_frontbuffer_tracking@psr-shrfb-scaledprimary:
    - shard-tglu:         NOTRUN -> [SKIP][208] ([i915#15102]) +70 other tests skip
   [208]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_162622v6/shard-tglu-8/igt@kms_frontbuffer_tracking@psr-shrfb-scaledprimary.html

  * igt@kms_frontbuffer_tracking@psrhdr-2p-scndscrn-cur-indfb-draw-mmap-cpu:
    - shard-tglu-1:       NOTRUN -> [SKIP][209] +52 other tests skip
   [209]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_162622v6/shard-tglu-1/igt@kms_frontbuffer_tracking@psrhdr-2p-scndscrn-cur-indfb-draw-mmap-cpu.html

  * igt@kms_frontbuffer_tracking@psrhdr-2p-scndscrn-spr-indfb-draw-mmap-cpu:
    - shard-dg2:          NOTRUN -> [SKIP][210] ([i915#15991])
   [210]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_162622v6/shard-dg2-6/igt@kms_frontbuffer_tracking@psrhdr-2p-scndscrn-spr-indfb-draw-mmap-cpu.html

  * igt@kms_frontbuffer_tracking@psrhdr-rgb101010-draw-blt:
    - shard-rkl:          NOTRUN -> [SKIP][211] ([i915#15102]) +33 other tests skip
   [211]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_162622v6/shard-rkl-4/igt@kms_frontbuffer_tracking@psrhdr-rgb101010-draw-blt.html

  * igt@kms_hdr@bpc-switch:
    - shard-rkl:          [PASS][212] -> [SKIP][213] ([i915#16644] / [i915#3555] / [i915#8228])
   [212]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19136/shard-rkl-6/igt@kms_hdr@bpc-switch.html
   [213]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_162622v6/shard-rkl-4/igt@kms_hdr@bpc-switch.html

  * igt@kms_hdr@bpc-switch-dpms:
    - shard-tglu:         NOTRUN -> [SKIP][214] ([i915#3555] / [i915#8228]) +1 other test skip
   [214]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_162622v6/shard-tglu-8/igt@kms_hdr@bpc-switch-dpms.html

  * igt@kms_hdr@invalid-metadata-sizes:
    - shard-rkl:          NOTRUN -> [SKIP][215] ([i915#16644] / [i915#3555] / [i915#8228]) +1 other test skip
   [215]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_162622v6/shard-rkl-5/igt@kms_hdr@invalid-metadata-sizes.html

  * igt@kms_hdr@static-swap:
    - shard-dg1:          NOTRUN -> [SKIP][216] ([i915#3555] / [i915#8228]) +2 other tests skip
   [216]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_162622v6/shard-dg1-14/igt@kms_hdr@static-swap.html

  * igt@kms_hdr@static-toggle-suspend:
    - shard-tglu-1:       NOTRUN -> [SKIP][217] ([i915#3555] / [i915#8228])
   [217]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_162622v6/shard-tglu-1/igt@kms_hdr@static-toggle-suspend.html

  * igt@kms_hdr@static-toggle-suspend@pipe-a-hdmi-a-2-xrgb2101010:
    - shard-rkl:          NOTRUN -> [INCOMPLETE][218] ([i915#15436])
   [218]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_162622v6/shard-rkl-6/igt@kms_hdr@static-toggle-suspend@pipe-a-hdmi-a-2-xrgb2101010.html

  * igt@kms_joiner@basic-big-joiner:
    - shard-tglu:         NOTRUN -> [SKIP][219] ([i915#15460])
   [219]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_162622v6/shard-tglu-3/igt@kms_joiner@basic-big-joiner.html

  * igt@kms_joiner@basic-force-big-joiner:
    - shard-rkl:          NOTRUN -> [SKIP][220] ([i915#15459])
   [220]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_162622v6/shard-rkl-4/igt@kms_joiner@basic-force-big-joiner.html

  * igt@kms_joiner@basic-force-ultra-joiner:
    - shard-tglu:         NOTRUN -> [SKIP][221] ([i915#15458])
   [221]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_162622v6/shard-tglu-4/igt@kms_joiner@basic-force-ultra-joiner.html

  * igt@kms_joiner@basic-max-non-joiner:
    - shard-dg1:          NOTRUN -> [SKIP][222] ([i915#13688])
   [222]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_162622v6/shard-dg1-17/igt@kms_joiner@basic-max-non-joiner.html

  * igt@kms_joiner@invalid-modeset-force-big-joiner:
    - shard-dg1:          NOTRUN -> [SKIP][223] ([i915#15459])
   [223]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_162622v6/shard-dg1-14/igt@kms_joiner@invalid-modeset-force-big-joiner.html

  * igt@kms_joiner@invalid-modeset-ultra-joiner:
    - shard-dg1:          NOTRUN -> [SKIP][224] ([i915#15458])
   [224]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_162622v6/shard-dg1-14/igt@kms_joiner@invalid-modeset-ultra-joiner.html

  * igt@kms_legacy_colorkey@invalid-plane:
    - shard-dg1:          NOTRUN -> [DMESG-WARN][225] ([i915#4423])
   [225]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_162622v6/shard-dg1-14/igt@kms_legacy_colorkey@invalid-plane.html

  * igt@kms_mst@mst-suspend-read-crc:
    - shard-tglu:         NOTRUN -> [SKIP][226] ([i915#16451])
   [226]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_162622v6/shard-tglu-8/igt@kms_mst@mst-suspend-read-crc.html

  * igt@kms_panel_fitting@atomic-fastset:
    - shard-tglu:         NOTRUN -> [SKIP][227] ([i915#6301])
   [227]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_162622v6/shard-tglu-4/igt@kms_panel_fitting@atomic-fastset.html

  * igt@kms_panel_fitting@legacy:
    - shard-rkl:          NOTRUN -> [SKIP][228] ([i915#6301])
   [228]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_162622v6/shard-rkl-4/igt@kms_panel_fitting@legacy.html
    - shard-tglu-1:       NOTRUN -> [SKIP][229] ([i915#6301])
   [229]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_162622v6/shard-tglu-1/igt@kms_panel_fitting@legacy.html

  * igt@kms_pipe_stress@stress-xrgb8888-4tiled:
    - shard-dg1:          NOTRUN -> [SKIP][230] ([i915#14712])
   [230]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_162622v6/shard-dg1-17/igt@kms_pipe_stress@stress-xrgb8888-4tiled.html

  * igt@kms_pipe_stress@stress-xrgb8888-yftiled:
    - shard-tglu-1:       NOTRUN -> [SKIP][231] ([i915#14712])
   [231]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_162622v6/shard-tglu-1/igt@kms_pipe_stress@stress-xrgb8888-yftiled.html

  * igt@kms_pipe_stress@stress-xrgb8888-ytiled:
    - shard-glk:          NOTRUN -> [DMESG-WARN][232] ([i915#118])
   [232]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_162622v6/shard-glk6/igt@kms_pipe_stress@stress-xrgb8888-ytiled.html

  * igt@kms_plane@pixel-format-4-tiled-dg2-rc-ccs-cc-modifier:
    - shard-tglu:         NOTRUN -> [SKIP][233] ([i915#15709]) +4 other tests skip
   [233]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_162622v6/shard-tglu-8/igt@kms_plane@pixel-format-4-tiled-dg2-rc-ccs-cc-modifier.html

  * igt@kms_plane@pixel-format-4-tiled-modifier@pipe-b-plane-5:
    - shard-mtlp:         NOTRUN -> [SKIP][234] ([i915#16386]) +1 other test skip
   [234]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_162622v6/shard-mtlp-3/igt@kms_plane@pixel-format-4-tiled-modifier@pipe-b-plane-5.html

  * igt@kms_plane@pixel-format-4-tiled-mtl-mc-ccs-modifier:
    - shard-rkl:          NOTRUN -> [SKIP][235] ([i915#15709]) +2 other tests skip
   [235]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_162622v6/shard-rkl-4/igt@kms_plane@pixel-format-4-tiled-mtl-mc-ccs-modifier.html
    - shard-tglu-1:       NOTRUN -> [SKIP][236] ([i915#15709]) +1 other test skip
   [236]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_162622v6/shard-tglu-1/igt@kms_plane@pixel-format-4-tiled-mtl-mc-ccs-modifier.html

  * igt@kms_plane@pixel-format-x-tiled-modifier@pipe-a-plane-7:
    - shard-tglu:         NOTRUN -> [SKIP][237] ([i915#16386]) +1 other test skip
   [237]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_162622v6/shard-tglu-3/igt@kms_plane@pixel-format-x-tiled-modifier@pipe-a-plane-7.html

  * igt@kms_plane@pixel-format-y-tiled-gen12-mc-ccs-modifier-source-clamping:
    - shard-dg1:          NOTRUN -> [SKIP][238] ([i915#15709]) +2 other tests skip
   [238]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_162622v6/shard-dg1-14/igt@kms_plane@pixel-format-y-tiled-gen12-mc-ccs-modifier-source-clamping.html

  * igt@kms_plane@pixel-format-y-tiled-gen12-rc-ccs-cc-modifier-source-clamping:
    - shard-dg2:          NOTRUN -> [SKIP][239] ([i915#15709])
   [239]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_162622v6/shard-dg2-6/igt@kms_plane@pixel-format-y-tiled-gen12-rc-ccs-cc-modifier-source-clamping.html

  * igt@kms_plane@pixel-format-y-tiled-gen12-rc-ccs-modifier@pipe-a-plane-7:
    - shard-dg1:          NOTRUN -> [SKIP][240] ([i915#16386]) +3 other tests skip
   [240]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_162622v6/shard-dg1-17/igt@kms_plane@pixel-format-y-tiled-gen12-rc-ccs-modifier@pipe-a-plane-7.html

  * igt@kms_plane@planar-pixel-format-settings@nv12-tile4-src-y:
    - shard-tglu:         NOTRUN -> [SKIP][241] ([i915#16112])
   [241]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_162622v6/shard-tglu-3/igt@kms_plane@planar-pixel-format-settings@nv12-tile4-src-y.html

  * igt@kms_plane_cursor@viewport@pipe-a-hdmi-a-2-size-256:
    - shard-rkl:          [PASS][242] -> [FAIL][243] ([i915#15913]) +1 other test fail
   [242]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19136/shard-rkl-6/igt@kms_plane_cursor@viewport@pipe-a-hdmi-a-2-size-256.html
   [243]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_162622v6/shard-rkl-7/igt@kms_plane_cursor@viewport@pipe-a-hdmi-a-2-size-256.html

  * igt@kms_plane_cursor@viewport@pipe-a-hdmi-a-2-size-64:
    - shard-rkl:          [PASS][244] -> [FAIL][245] ([i915#15912]) +1 other test fail
   [244]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19136/shard-rkl-6/igt@kms_plane_cursor@viewport@pipe-a-hdmi-a-2-size-64.html
   [245]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_162622v6/shard-rkl-7/igt@kms_plane_cursor@viewport@pipe-a-hdmi-a-2-size-64.html

  * igt@kms_plane_multiple@2x-tiling-none:
    - shard-tglu:         NOTRUN -> [SKIP][246] ([i915#13958])
   [246]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_162622v6/shard-tglu-7/igt@kms_plane_multiple@2x-tiling-none.html

  * igt@kms_plane_multiple@2x-tiling-y:
    - shard-rkl:          NOTRUN -> [SKIP][247] ([i915#13958])
   [247]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_162622v6/shard-rkl-4/igt@kms_plane_multiple@2x-tiling-y.html
    - shard-tglu-1:       NOTRUN -> [SKIP][248] ([i915#13958])
   [248]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_162622v6/shard-tglu-1/igt@kms_plane_multiple@2x-tiling-y.html

  * igt@kms_plane_multiple@2x-tiling-yf:
    - shard-dg1:          NOTRUN -> [SKIP][249] ([i915#13958]) +1 other test skip
   [249]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_162622v6/shard-dg1-14/igt@kms_plane_multiple@2x-tiling-yf.html

  * igt@kms_plane_multiple@tiling-yf:
    - shard-rkl:          NOTRUN -> [SKIP][250] ([i915#14259])
   [250]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_162622v6/shard-rkl-2/igt@kms_plane_multiple@tiling-yf.html
    - shard-tglu:         NOTRUN -> [SKIP][251] ([i915#14259])
   [251]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_162622v6/shard-tglu-4/igt@kms_plane_multiple@tiling-yf.html

  * igt@kms_plane_scaling@plane-downscale-factor-0-5-with-rotation@pipe-d:
    - shard-dg1:          NOTRUN -> [SKIP][252] ([i915#15329]) +8 other tests skip
   [252]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_162622v6/shard-dg1-18/igt@kms_plane_scaling@plane-downscale-factor-0-5-with-rotation@pipe-d.html

  * igt@kms_plane_scaling@plane-scaler-with-clipping-clamping-rotation:
    - shard-dg1:          NOTRUN -> [SKIP][253] ([i915#15329] / [i915#3555])
   [253]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_162622v6/shard-dg1-18/igt@kms_plane_scaling@plane-scaler-with-clipping-clamping-rotation.html

  * igt@kms_plane_scaling@planes-upscale-20x20-downscale-factor-0-75@pipe-d:
    - shard-mtlp:         NOTRUN -> [SKIP][254] ([i915#15329]) +7 other tests skip
   [254]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_162622v6/shard-mtlp-6/igt@kms_plane_scaling@planes-upscale-20x20-downscale-factor-0-75@pipe-d.html

  * igt@kms_pm_backlight@brightness-with-dpms:
    - shard-tglu:         NOTRUN -> [SKIP][255] ([i915#12343])
   [255]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_162622v6/shard-tglu-3/igt@kms_pm_backlight@brightness-with-dpms.html

  * igt@kms_pm_backlight@fade-with-suspend:
    - shard-tglu-1:       NOTRUN -> [SKIP][256] ([i915#12343] / [i915#9812])
   [256]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_162622v6/shard-tglu-1/igt@kms_pm_backlight@fade-with-suspend.html

  * igt@kms_pm_dc@dc5-pageflip-negative:
    - shard-tglu:         NOTRUN -> [SKIP][257] ([i915#9685])
   [257]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_162622v6/shard-tglu-3/igt@kms_pm_dc@dc5-pageflip-negative.html

  * igt@kms_pm_dc@dc5-psr:
    - shard-dg1:          NOTRUN -> [SKIP][258] ([i915#15948])
   [258]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_162622v6/shard-dg1-14/igt@kms_pm_dc@dc5-psr.html

  * igt@kms_pm_dc@dc5-psr-suspend-resume:
    - shard-dg1:          NOTRUN -> [SKIP][259] ([i915#16914])
   [259]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_162622v6/shard-dg1-14/igt@kms_pm_dc@dc5-psr-suspend-resume.html

  * igt@kms_pm_dc@dc5-retention-flops:
    - shard-dg1:          NOTRUN -> [SKIP][260] ([i915#3828])
   [260]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_162622v6/shard-dg1-17/igt@kms_pm_dc@dc5-retention-flops.html

  * igt@kms_pm_dc@dc6-psr:
    - shard-rkl:          NOTRUN -> [SKIP][261] ([i915#15948])
   [261]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_162622v6/shard-rkl-4/igt@kms_pm_dc@dc6-psr.html
    - shard-tglu-1:       NOTRUN -> [SKIP][262] ([i915#15948])
   [262]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_162622v6/shard-tglu-1/igt@kms_pm_dc@dc6-psr.html

  * igt@kms_pm_lpsp@kms-lpsp:
    - shard-dg2:          [PASS][263] -> [SKIP][264] ([i915#9340])
   [263]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19136/shard-dg2-4/igt@kms_pm_lpsp@kms-lpsp.html
   [264]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_162622v6/shard-dg2-3/igt@kms_pm_lpsp@kms-lpsp.html

  * igt@kms_pm_lpsp@screens-disabled:
    - shard-tglu:         NOTRUN -> [SKIP][265] ([i915#8430])
   [265]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_162622v6/shard-tglu-4/igt@kms_pm_lpsp@screens-disabled.html

  * igt@kms_pm_rpm@dpms-lpsp:
    - shard-rkl:          [PASS][266] -> [SKIP][267] ([i915#15073]) +2 other tests skip
   [266]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19136/shard-rkl-2/igt@kms_pm_rpm@dpms-lpsp.html
   [267]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_162622v6/shard-rkl-3/igt@kms_pm_rpm@dpms-lpsp.html

  * igt@kms_pm_rpm@dpms-non-lpsp:
    - shard-dg1:          [PASS][268] -> [SKIP][269] ([i915#15073])
   [268]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19136/shard-dg1-17/igt@kms_pm_rpm@dpms-non-lpsp.html
   [269]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_162622v6/shard-dg1-15/igt@kms_pm_rpm@dpms-non-lpsp.html

  * igt@kms_pm_rpm@modeset-non-lpsp-stress-no-wait:
    - shard-dg2:          [PASS][270] -> [SKIP][271] ([i915#15073])
   [270]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19136/shard-dg2-6/igt@kms_pm_rpm@modeset-non-lpsp-stress-no-wait.html
   [271]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_162622v6/shard-dg2-4/igt@kms_pm_rpm@modeset-non-lpsp-stress-no-wait.html
    - shard-dg1:          NOTRUN -> [SKIP][272] ([i915#15073]) +1 other test skip
   [272]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_162622v6/shard-dg1-14/igt@kms_pm_rpm@modeset-non-lpsp-stress-no-wait.html

  * igt@kms_prime@basic-modeset-hybrid:
    - shard-dg1:          NOTRUN -> [SKIP][273] ([i915#6524]) +1 other test skip
   [273]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_162622v6/shard-dg1-18/igt@kms_prime@basic-modeset-hybrid.html

  * igt@kms_psr2_sf@fbc-pr-cursor-plane-update-sf:
    - shard-tglu:         NOTRUN -> [SKIP][274] ([i915#11520]) +12 other tests skip
   [274]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_162622v6/shard-tglu-3/igt@kms_psr2_sf@fbc-pr-cursor-plane-update-sf.html

  * igt@kms_psr2_sf@fbc-psr2-cursor-plane-move-continuous-exceed-sf:
    - shard-dg1:          NOTRUN -> [SKIP][275] ([i915#11520]) +7 other tests skip
   [275]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_162622v6/shard-dg1-18/igt@kms_psr2_sf@fbc-psr2-cursor-plane-move-continuous-exceed-sf.html

  * igt@kms_psr2_sf@fbc-psr2-cursor-plane-move-continuous-exceed-sf@pipe-b-edp-1:
    - shard-mtlp:         NOTRUN -> [SKIP][276] ([i915#12316]) +3 other tests skip
   [276]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_162622v6/shard-mtlp-5/igt@kms_psr2_sf@fbc-psr2-cursor-plane-move-continuous-exceed-sf@pipe-b-edp-1.html

  * igt@kms_psr2_sf@fbc-psr2-cursor-plane-update-sf:
    - shard-dg2:          NOTRUN -> [SKIP][277] ([i915#11520])
   [277]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_162622v6/shard-dg2-6/igt@kms_psr2_sf@fbc-psr2-cursor-plane-update-sf.html

  * igt@kms_psr2_sf@fbc-psr2-overlay-plane-move-continuous-sf@pipe-a-edp-1:
    - shard-mtlp:         NOTRUN -> [SKIP][278] ([i915#9808]) +3 other tests skip
   [278]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_162622v6/shard-mtlp-8/igt@kms_psr2_sf@fbc-psr2-overlay-plane-move-continuous-sf@pipe-a-edp-1.html

  * igt@kms_psr2_sf@fbc-psr2-overlay-plane-update-continuous-sf:
    - shard-glk:          NOTRUN -> [SKIP][279] ([i915#11520]) +4 other tests skip
   [279]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_162622v6/shard-glk5/igt@kms_psr2_sf@fbc-psr2-overlay-plane-update-continuous-sf.html

  * igt@kms_psr2_sf@fbc-psr2-overlay-primary-update-sf-dmg-area:
    - shard-glk11:        NOTRUN -> [SKIP][280] ([i915#11520]) +2 other tests skip
   [280]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_162622v6/shard-glk11/igt@kms_psr2_sf@fbc-psr2-overlay-primary-update-sf-dmg-area.html

  * igt@kms_psr2_sf@psr2-cursor-plane-move-continuous-exceed-sf:
    - shard-glk10:        NOTRUN -> [SKIP][281] ([i915#11520]) +6 other tests skip
   [281]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_162622v6/shard-glk10/igt@kms_psr2_sf@psr2-cursor-plane-move-continuous-exceed-sf.html

  * igt@kms_psr2_sf@psr2-overlay-plane-update-continuous-sf:
    - shard-rkl:          NOTRUN -> [SKIP][282] ([i915#11520]) +5 other tests skip
   [282]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_162622v6/shard-rkl-4/igt@kms_psr2_sf@psr2-overlay-plane-update-continuous-sf.html
    - shard-tglu-1:       NOTRUN -> [SKIP][283] ([i915#11520]) +4 other tests skip
   [283]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_162622v6/shard-tglu-1/igt@kms_psr2_sf@psr2-overlay-plane-update-continuous-sf.html

  * igt@kms_psr2_sf@psr2-overlay-plane-update-sf-dmg-area:
    - shard-snb:          NOTRUN -> [SKIP][284] ([i915#11520]) +10 other tests skip
   [284]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_162622v6/shard-snb7/igt@kms_psr2_sf@psr2-overlay-plane-update-sf-dmg-area.html

  * igt@kms_psr2_su@page_flip-xrgb8888:
    - shard-tglu:         NOTRUN -> [SKIP][285] ([i915#9683]) +2 other tests skip
   [285]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_162622v6/shard-tglu-3/igt@kms_psr2_su@page_flip-xrgb8888.html

  * igt@kms_psr@fbc-pr-sprite-plane-onoff:
    - shard-dg1:          NOTRUN -> [SKIP][286] ([i915#1072] / [i915#9732]) +18 other tests skip
   [286]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_162622v6/shard-dg1-14/igt@kms_psr@fbc-pr-sprite-plane-onoff.html

  * igt@kms_psr@fbc-psr2-cursor-blt:
    - shard-tglu-1:       NOTRUN -> [SKIP][287] ([i915#9732]) +10 other tests skip
   [287]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_162622v6/shard-tglu-1/igt@kms_psr@fbc-psr2-cursor-blt.html

  * igt@kms_psr@fbc-psr2-cursor-mmap-gtt:
    - shard-glk:          NOTRUN -> [SKIP][288] +190 other tests skip
   [288]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_162622v6/shard-glk5/igt@kms_psr@fbc-psr2-cursor-mmap-gtt.html

  * igt@kms_psr@fbc-psr2-primary-mmap-cpu@edp-1:
    - shard-mtlp:         NOTRUN -> [SKIP][289] ([i915#9688]) +6 other tests skip
   [289]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_162622v6/shard-mtlp-6/igt@kms_psr@fbc-psr2-primary-mmap-cpu@edp-1.html

  * igt@kms_psr@pr-primary-page-flip:
    - shard-tglu:         NOTRUN -> [SKIP][290] ([i915#9732]) +31 other tests skip
   [290]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_162622v6/shard-tglu-3/igt@kms_psr@pr-primary-page-flip.html

  * igt@kms_psr@psr-cursor-mmap-cpu:
    - shard-rkl:          NOTRUN -> [SKIP][291] ([i915#1072] / [i915#9732]) +13 other tests skip
   [291]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_162622v6/shard-rkl-4/igt@kms_psr@psr-cursor-mmap-cpu.html

  * igt@kms_psr@psr2-primary-mmap-gtt@edp-1:
    - shard-mtlp:         NOTRUN -> [SKIP][292] ([i915#4077] / [i915#9688])
   [292]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_162622v6/shard-mtlp-5/igt@kms_psr@psr2-primary-mmap-gtt@edp-1.html

  * igt@kms_rotation_crc@primary-4-tiled-reflect-x-0:
    - shard-tglu:         NOTRUN -> [SKIP][293] ([i915#5289])
   [293]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_162622v6/shard-tglu-7/igt@kms_rotation_crc@primary-4-tiled-reflect-x-0.html

  * igt@kms_rotation_crc@primary-yf-tiled-reflect-x-270:
    - shard-rkl:          NOTRUN -> [SKIP][294] ([i915#5289])
   [294]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_162622v6/shard-rkl-5/igt@kms_rotation_crc@primary-yf-tiled-reflect-x-270.html

  * igt@kms_rotation_crc@primary-yf-tiled-reflect-x-90:
    - shard-dg1:          NOTRUN -> [SKIP][295] ([i915#5289])
   [295]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_162622v6/shard-dg1-18/igt@kms_rotation_crc@primary-yf-tiled-reflect-x-90.html

  * igt@kms_scaling_modes@scaling-mode-none@pipe-a-edp-1:
    - shard-mtlp:         NOTRUN -> [SKIP][296] ([i915#5030]) +2 other tests skip
   [296]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_162622v6/shard-mtlp-3/igt@kms_scaling_modes@scaling-mode-none@pipe-a-edp-1.html

  * igt@kms_scaling_modes@scaling-mode-none@pipe-d-edp-1:
    - shard-mtlp:         NOTRUN -> [SKIP][297] ([i915#5030] / [i915#9041])
   [297]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_162622v6/shard-mtlp-3/igt@kms_scaling_modes@scaling-mode-none@pipe-d-edp-1.html

  * igt@kms_selftest@drm_framebuffer:
    - shard-tglu-1:       NOTRUN -> [ABORT][298] ([i915#13179]) +1 other test abort
   [298]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_162622v6/shard-tglu-1/igt@kms_selftest@drm_framebuffer.html

  * igt@kms_setmode@basic:
    - shard-snb:          NOTRUN -> [FAIL][299] ([i915#15106]) +6 other tests fail
   [299]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_162622v6/shard-snb1/igt@kms_setmode@basic.html

  * igt@kms_setmode@invalid-clone-single-crtc-stealing:
    - shard-tglu-1:       NOTRUN -> [SKIP][300] ([i915#3555])
   [300]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_162622v6/shard-tglu-1/igt@kms_setmode@invalid-clone-single-crtc-stealing.html

  * igt@kms_tiled_display@basic-test-pattern-with-chamelium:
    - shard-dg1:          NOTRUN -> [SKIP][301] ([i915#8623])
   [301]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_162622v6/shard-dg1-17/igt@kms_tiled_display@basic-test-pattern-with-chamelium.html

  * igt@kms_vrr@flip-basic-fastset:
    - shard-tglu:         NOTRUN -> [SKIP][302] ([i915#9906])
   [302]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_162622v6/shard-tglu-3/igt@kms_vrr@flip-basic-fastset.html

  * igt@kms_vrr@flip-suspend:
    - shard-tglu:         NOTRUN -> [SKIP][303] ([i915#3555]) +6 other tests skip
   [303]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_162622v6/shard-tglu-4/igt@kms_vrr@flip-suspend.html

  * igt@kms_vrr@lobf:
    - shard-dg1:          NOTRUN -> [SKIP][304] ([i915#11920])
   [304]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_162622v6/shard-dg1-14/igt@kms_vrr@lobf.html

  * igt@kms_vrr@seamless-rr-switch-vrr:
    - shard-tglu-1:       NOTRUN -> [SKIP][305] ([i915#9906])
   [305]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_162622v6/shard-tglu-1/igt@kms_vrr@seamless-rr-switch-vrr.html

  * igt@perf_pmu@module-unload:
    - shard-snb:          NOTRUN -> [ABORT][306] ([i915#15778])
   [306]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_162622v6/shard-snb7/igt@perf_pmu@module-unload.html

  * igt@perf_pmu@rc6-suspend:
    - shard-glk:          [PASS][307] -> [INCOMPLETE][308] ([i915#13356] / [i915#16236])
   [307]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19136/shard-glk4/igt@perf_pmu@rc6-suspend.html
   [308]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_162622v6/shard-glk8/igt@perf_pmu@rc6-suspend.html

  * igt@prime_vgem@basic-fence-mmap:
    - shard-dg1:          NOTRUN -> [SKIP][309] ([i915#3708] / [i915#4077])
   [309]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_162622v6/shard-dg1-14/igt@prime_vgem@basic-fence-mmap.html

  * igt@prime_vgem@basic-fence-read:
    - shard-dg1:          NOTRUN -> [SKIP][310] ([i915#3708]) +1 other test skip
   [310]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_162622v6/shard-dg1-17/igt@prime_vgem@basic-fence-read.html

  * igt@prime_vgem@basic-read:
    - shard-rkl:          NOTRUN -> [SKIP][311] ([i915#3291] / [i915#3708])
   [311]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_162622v6/shard-rkl-4/igt@prime_vgem@basic-read.html

  * igt@tools_test@sysfs_l3_parity:
    - shard-dg1:          NOTRUN -> [SKIP][312] ([i915#4818])
   [312]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_162622v6/shard-dg1-14/igt@tools_test@sysfs_l3_parity.html

  
#### Possible fixes ####

  * igt@core_setmaster@master-drop-set-user:
    - shard-mtlp:         [FAIL][313] ([i915#17048]) -> [PASS][314]
   [313]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19136/shard-mtlp-7/igt@core_setmaster@master-drop-set-user.html
   [314]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_162622v6/shard-mtlp-3/igt@core_setmaster@master-drop-set-user.html

  * igt@gem_eio@hibernate:
    - shard-mtlp:         [TIMEOUT][315] ([i915#17038]) -> [PASS][316]
   [315]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19136/shard-mtlp-7/igt@gem_eio@hibernate.html
   [316]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_162622v6/shard-mtlp-6/igt@gem_eio@hibernate.html

  * igt@gem_exec_suspend@basic-s0:
    - shard-dg2:          [INCOMPLETE][317] ([i915#13356]) -> [PASS][318] +1 other test pass
   [317]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19136/shard-dg2-1/igt@gem_exec_suspend@basic-s0.html
   [318]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_162622v6/shard-dg2-4/igt@gem_exec_suspend@basic-s0.html

  * igt@gem_mmap_offset@clear-via-pagefault:
    - shard-mtlp:         [TIMEOUT][319] ([i915#16021] / [i915#16168] / [i915#16349]) -> [PASS][320] +1 other test pass
   [319]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19136/shard-mtlp-6/igt@gem_mmap_offset@clear-via-pagefault.html
   [320]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_162622v6/shard-mtlp-2/igt@gem_mmap_offset@clear-via-pagefault.html

  * igt@gem_pxp@display-protected-crc:
    - shard-mtlp:         [FAIL][321] ([i915#17052]) -> [PASS][322]
   [321]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19136/shard-mtlp-7/igt@gem_pxp@display-protected-crc.html
   [322]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_162622v6/shard-mtlp-6/igt@gem_pxp@display-protected-crc.html

  * igt@gem_sync@basic-each:
    - shard-mtlp:         [FAIL][323] -> [PASS][324]
   [323]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19136/shard-mtlp-7/igt@gem_sync@basic-each.html
   [324]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_162622v6/shard-mtlp-5/igt@gem_sync@basic-each.html

  * igt@i915_pm_freq_api@freq-suspend@gt0:
    - shard-dg2:          [INCOMPLETE][325] ([i915#13356] / [i915#13820]) -> [PASS][326] +1 other test pass
   [325]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19136/shard-dg2-7/igt@i915_pm_freq_api@freq-suspend@gt0.html
   [326]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_162622v6/shard-dg2-6/igt@i915_pm_freq_api@freq-suspend@gt0.html

  * igt@i915_suspend@sysfs-reader:
    - shard-rkl:          [INCOMPLETE][327] ([i915#4817]) -> [PASS][328]
   [327]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19136/shard-rkl-3/igt@i915_suspend@sysfs-reader.html
   [328]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_162622v6/shard-rkl-5/igt@i915_suspend@sysfs-reader.html

  * igt@kms_async_flips@alternate-sync-async-flip-atomic@pipe-a-hdmi-a-1:
    - shard-glk:          [FAIL][329] ([i915#14888]) -> [PASS][330] +2 other tests pass
   [329]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19136/shard-glk6/igt@kms_async_flips@alternate-sync-async-flip-atomic@pipe-a-hdmi-a-1.html
   [330]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_162622v6/shard-glk2/igt@kms_async_flips@alternate-sync-async-flip-atomic@pipe-a-hdmi-a-1.html

  * igt@kms_atomic_transition@plane-all-modeset-transition-fencing:
    - shard-rkl:          [ABORT][331] ([i915#16866]) -> [PASS][332]
   [331]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19136/shard-rkl-1/igt@kms_atomic_transition@plane-all-modeset-transition-fencing.html
   [332]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_162622v6/shard-rkl-2/igt@kms_atomic_transition@plane-all-modeset-transition-fencing.html

  * igt@kms_flip@dpms-vs-vblank-race-interruptible@b-hdmi-a4:
    - shard-dg1:          [ABORT][333] ([i915#16866] / [i915#16876] / [i915#16932]) -> [PASS][334]
   [333]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19136/shard-dg1-16/igt@kms_flip@dpms-vs-vblank-race-interruptible@b-hdmi-a4.html
   [334]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_162622v6/shard-dg1-17/igt@kms_flip@dpms-vs-vblank-race-interruptible@b-hdmi-a4.html

  * igt@kms_flip@flip-vs-expired-vblank:
    - shard-mtlp:         [SKIP][335] ([i915#17031]) -> [PASS][336] +164 other tests pass
   [335]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19136/shard-mtlp-7/igt@kms_flip@flip-vs-expired-vblank.html
   [336]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_162622v6/shard-mtlp-5/igt@kms_flip@flip-vs-expired-vblank.html

  * igt@kms_flip@flip-vs-expired-vblank-interruptible@d-hdmi-a3:
    - shard-dg2:          [FAIL][337] ([i915#13027]) -> [PASS][338] +1 other test pass
   [337]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19136/shard-dg2-8/igt@kms_flip@flip-vs-expired-vblank-interruptible@d-hdmi-a3.html
   [338]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_162622v6/shard-dg2-3/igt@kms_flip@flip-vs-expired-vblank-interruptible@d-hdmi-a3.html

  * igt@kms_frontbuffer_tracking@fbchdr-1p-primscrn-pri-shrfb-draw-mmap-cpu:
    - shard-glk:          [SKIP][339] -> [PASS][340] +5 other tests pass
   [339]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19136/shard-glk4/igt@kms_frontbuffer_tracking@fbchdr-1p-primscrn-pri-shrfb-draw-mmap-cpu.html
   [340]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_162622v6/shard-glk8/igt@kms_frontbuffer_tracking@fbchdr-1p-primscrn-pri-shrfb-draw-mmap-cpu.html

  * igt@kms_frontbuffer_tracking@hdr-1p-primscrn-pri-indfb-draw-pwrite:
    - shard-rkl:          [SKIP][341] ([i915#15989]) -> [PASS][342] +1 other test pass
   [341]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19136/shard-rkl-8/igt@kms_frontbuffer_tracking@hdr-1p-primscrn-pri-indfb-draw-pwrite.html
   [342]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_162622v6/shard-rkl-6/igt@kms_frontbuffer_tracking@hdr-1p-primscrn-pri-indfb-draw-pwrite.html

  * igt@kms_plane@pixel-format-y-tiled-gen12-rc-ccs-modifier:
    - shard-tglu:         [ABORT][343] ([i915#16866]) -> [PASS][344]
   [343]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19136/shard-tglu-4/igt@kms_plane@pixel-format-y-tiled-gen12-rc-ccs-modifier.html
   [344]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_162622v6/shard-tglu-5/igt@kms_plane@pixel-format-y-tiled-gen12-rc-ccs-modifier.html

  * igt@kms_pm_backlight@basic-brightness:
    - shard-mtlp:         [INCOMPLETE][345] ([i915#17032]) -> [PASS][346]
   [345]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19136/shard-mtlp-7/igt@kms_pm_backlight@basic-brightness.html
   [346]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_162622v6/shard-mtlp-8/igt@kms_pm_backlight@basic-brightness.html

  * igt@kms_pm_rpm@dpms-mode-unset-non-lpsp:
    - shard-rkl:          [SKIP][347] ([i915#15073]) -> [PASS][348] +1 other test pass
   [347]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19136/shard-rkl-8/igt@kms_pm_rpm@dpms-mode-unset-non-lpsp.html
   [348]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_162622v6/shard-rkl-3/igt@kms_pm_rpm@dpms-mode-unset-non-lpsp.html

  * igt@kms_pm_rpm@modeset-non-lpsp:
    - shard-dg2:          [SKIP][349] ([i915#15073]) -> [PASS][350] +1 other test pass
   [349]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19136/shard-dg2-4/igt@kms_pm_rpm@modeset-non-lpsp.html
   [350]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_162622v6/shard-dg2-3/igt@kms_pm_rpm@modeset-non-lpsp.html
    - shard-dg1:          [SKIP][351] ([i915#15073]) -> [PASS][352] +1 other test pass
   [351]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19136/shard-dg1-14/igt@kms_pm_rpm@modeset-non-lpsp.html
   [352]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_162622v6/shard-dg1-16/igt@kms_pm_rpm@modeset-non-lpsp.html

  * igt@perf_pmu@rc6-suspend:
    - shard-rkl:          [INCOMPLETE][353] ([i915#13520]) -> [PASS][354]
   [353]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19136/shard-rkl-6/igt@perf_pmu@rc6-suspend.html
   [354]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_162622v6/shard-rkl-4/igt@perf_pmu@rc6-suspend.html

  
#### Warnings ####

  * igt@api_intel_bb@crc32:
    - shard-rkl:          [SKIP][355] ([i915#6230]) -> [SKIP][356] ([i915#14544] / [i915#6230])
   [355]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19136/shard-rkl-8/igt@api_intel_bb@crc32.html
   [356]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_162622v6/shard-rkl-6/igt@api_intel_bb@crc32.html

  * igt@gem_busy@semaphore:
    - shard-mtlp:         [SKIP][357] ([i915#17031]) -> [SKIP][358] ([i915#3936])
   [357]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19136/shard-mtlp-7/igt@gem_busy@semaphore.html
   [358]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_162622v6/shard-mtlp-5/igt@gem_busy@semaphore.html

  * igt@gem_ctx_sseu@invalid-args:
    - shard-rkl:          [SKIP][359] ([i915#14544] / [i915#280]) -> [SKIP][360] ([i915#280])
   [359]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19136/shard-rkl-6/igt@gem_ctx_sseu@invalid-args.html
   [360]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_162622v6/shard-rkl-7/igt@gem_ctx_sseu@invalid-args.html

  * igt@gem_exec_reloc@basic-wc-cpu:
    - shard-mtlp:         [SKIP][361] ([i915#3281]) -> [SKIP][362] ([i915#17031]) +2 other tests skip
   [361]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19136/shard-mtlp-8/igt@gem_exec_reloc@basic-wc-cpu.html
   [362]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_162622v6/shard-mtlp-7/igt@gem_exec_reloc@basic-wc-cpu.html

  * igt@gem_exec_reloc@basic-write-read-noreloc:
    - shard-rkl:          [SKIP][363] ([i915#14544] / [i915#3281]) -> [SKIP][364] ([i915#3281]) +4 other tests skip
   [363]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19136/shard-rkl-6/igt@gem_exec_reloc@basic-write-read-noreloc.html
   [364]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_162622v6/shard-rkl-7/igt@gem_exec_reloc@basic-write-read-noreloc.html

  * igt@gem_exec_reloc@basic-write-wc:
    - shard-mtlp:         [SKIP][365] ([i915#17031]) -> [SKIP][366] ([i915#3281]) +11 other tests skip
   [365]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19136/shard-mtlp-7/igt@gem_exec_reloc@basic-write-wc.html
   [366]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_162622v6/shard-mtlp-5/igt@gem_exec_reloc@basic-write-wc.html

  * igt@gem_exec_reloc@basic-write-wc-active:
    - shard-rkl:          [SKIP][367] ([i915#3281]) -> [SKIP][368] ([i915#14544] / [i915#3281])
   [367]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19136/shard-rkl-8/igt@gem_exec_reloc@basic-write-wc-active.html
   [368]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_162622v6/shard-rkl-6/igt@gem_exec_reloc@basic-write-wc-active.html

  * igt@gem_lmem_swapping@random:
    - shard-rkl:          [SKIP][369] ([i915#14544] / [i915#4613]) -> [SKIP][370] ([i915#4613]) +2 other tests skip
   [369]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19136/shard-rkl-6/igt@gem_lmem_swapping@random.html
   [370]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_162622v6/shard-rkl-4/igt@gem_lmem_swapping@random.html

  * igt@gem_partial_pwrite_pread@writes-after-reads-display:
    - shard-rkl:          [SKIP][371] ([i915#14544] / [i915#3282]) -> [SKIP][372] ([i915#3282]) +1 other test skip
   [371]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19136/shard-rkl-6/igt@gem_partial_pwrite_pread@writes-after-reads-display.html
   [372]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_162622v6/shard-rkl-7/igt@gem_partial_pwrite_pread@writes-after-reads-display.html

  * igt@gem_userptr_blits@create-destroy-unsync:
    - shard-rkl:          [SKIP][373] ([i915#14544] / [i915#3297]) -> [SKIP][374] ([i915#3297]) +2 other tests skip
   [373]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19136/shard-rkl-6/igt@gem_userptr_blits@create-destroy-unsync.html
   [374]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_162622v6/shard-rkl-4/igt@gem_userptr_blits@create-destroy-unsync.html

  * igt@gen9_exec_parse@secure-batches:
    - shard-rkl:          [SKIP][375] ([i915#14544] / [i915#2527]) -> [SKIP][376] ([i915#2527])
   [375]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19136/shard-rkl-6/igt@gen9_exec_parse@secure-batches.html
   [376]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_162622v6/shard-rkl-4/igt@gen9_exec_parse@secure-batches.html

  * igt@i915_fb_tiling@basic-x-tiling:
    - shard-mtlp:         [SKIP][377] ([i915#17031]) -> [SKIP][378] ([i915#13786])
   [377]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19136/shard-mtlp-7/igt@i915_fb_tiling@basic-x-tiling.html
   [378]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_162622v6/shard-mtlp-5/igt@i915_fb_tiling@basic-x-tiling.html

  * igt@i915_pm_rpm@gem-evict-pwrite:
    - shard-mtlp:         [SKIP][379] ([i915#17031]) -> [SKIP][380] ([i915#4077])
   [379]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19136/shard-mtlp-7/igt@i915_pm_rpm@gem-evict-pwrite.html
   [380]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_162622v6/shard-mtlp-5/igt@i915_pm_rpm@gem-evict-pwrite.html

  * igt@i915_query@hwconfig_table:
    - shard-rkl:          [SKIP][381] ([i915#14544] / [i915#6245]) -> [SKIP][382] ([i915#6245])
   [381]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19136/shard-rkl-6/igt@i915_query@hwconfig_table.html
   [382]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_162622v6/shard-rkl-4/igt@i915_query@hwconfig_table.html

  * igt@i915_query@query-topology-known-pci-ids:
    - shard-rkl:          [SKIP][383] ([i915#16109]) -> [SKIP][384] ([i915#14544] / [i915#16109])
   [383]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19136/shard-rkl-3/igt@i915_query@query-topology-known-pci-ids.html
   [384]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_162622v6/shard-rkl-6/igt@i915_query@query-topology-known-pci-ids.html

  * igt@kms_addfb_basic@tile-pitch-mismatch:
    - shard-mtlp:         [SKIP][385] ([i915#4212]) -> [SKIP][386] ([i915#17031])
   [385]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19136/shard-mtlp-8/igt@kms_addfb_basic@tile-pitch-mismatch.html
   [386]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_162622v6/shard-mtlp-7/igt@kms_addfb_basic@tile-pitch-mismatch.html

  * igt@kms_big_fb@4-tiled-32bpp-rotate-180:
    - shard-rkl:          [SKIP][387] ([i915#14544] / [i915#5286]) -> [SKIP][388] ([i915#5286]) +1 other test skip
   [387]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19136/shard-rkl-6/igt@kms_big_fb@4-tiled-32bpp-rotate-180.html
   [388]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_162622v6/shard-rkl-7/igt@kms_big_fb@4-tiled-32bpp-rotate-180.html

  * igt@kms_big_fb@4-tiled-max-hw-stride-32bpp-rotate-180-hflip:
    - shard-rkl:          [SKIP][389] ([i915#5286]) -> [SKIP][390] ([i915#14544] / [i915#5286])
   [389]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19136/shard-rkl-8/igt@kms_big_fb@4-tiled-max-hw-stride-32bpp-rotate-180-hflip.html
   [390]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_162622v6/shard-rkl-6/igt@kms_big_fb@4-tiled-max-hw-stride-32bpp-rotate-180-hflip.html

  * igt@kms_big_fb@linear-max-hw-stride-32bpp-rotate-0-hflip:
    - shard-mtlp:         [SKIP][391] ([i915#17031]) -> [SKIP][392] ([i915#3828])
   [391]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19136/shard-mtlp-7/igt@kms_big_fb@linear-max-hw-stride-32bpp-rotate-0-hflip.html
   [392]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_162622v6/shard-mtlp-6/igt@kms_big_fb@linear-max-hw-stride-32bpp-rotate-0-hflip.html

  * igt@kms_big_fb@x-tiled-32bpp-rotate-270:
    - shard-rkl:          [SKIP][393] ([i915#14544] / [i915#3638]) -> [SKIP][394] ([i915#3638])
   [393]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19136/shard-rkl-6/igt@kms_big_fb@x-tiled-32bpp-rotate-270.html
   [394]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_162622v6/shard-rkl-7/igt@kms_big_fb@x-tiled-32bpp-rotate-270.html

  * igt@kms_big_fb@y-tiled-addfb-size-offset-overflow:
    - shard-mtlp:         [SKIP][395] ([i915#17031]) -> [SKIP][396] ([i915#6187]) +1 other test skip
   [395]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19136/shard-mtlp-7/igt@kms_big_fb@y-tiled-addfb-size-offset-overflow.html
   [396]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_162622v6/shard-mtlp-8/igt@kms_big_fb@y-tiled-addfb-size-offset-overflow.html

  * igt@kms_big_fb@yf-tiled-max-hw-stride-64bpp-rotate-0-hflip:
    - shard-mtlp:         [SKIP][397] -> [SKIP][398] ([i915#17031]) +3 other tests skip
   [397]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19136/shard-mtlp-8/igt@kms_big_fb@yf-tiled-max-hw-stride-64bpp-rotate-0-hflip.html
   [398]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_162622v6/shard-mtlp-7/igt@kms_big_fb@yf-tiled-max-hw-stride-64bpp-rotate-0-hflip.html

  * igt@kms_big_fb@yf-tiled-max-hw-stride-64bpp-rotate-180-hflip-async-flip:
    - shard-mtlp:         [SKIP][399] ([i915#17031]) -> [SKIP][400] +21 other tests skip
   [399]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19136/shard-mtlp-7/igt@kms_big_fb@yf-tiled-max-hw-stride-64bpp-rotate-180-hflip-async-flip.html
   [400]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_162622v6/shard-mtlp-5/igt@kms_big_fb@yf-tiled-max-hw-stride-64bpp-rotate-180-hflip-async-flip.html

  * igt@kms_ccs@bad-pixel-format-4-tiled-dg2-rc-ccs:
    - shard-mtlp:         [SKIP][401] ([i915#6095]) -> [SKIP][402] ([i915#17031]) +5 other tests skip
   [401]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19136/shard-mtlp-8/igt@kms_ccs@bad-pixel-format-4-tiled-dg2-rc-ccs.html
   [402]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_162622v6/shard-mtlp-7/igt@kms_ccs@bad-pixel-format-4-tiled-dg2-rc-ccs.html

  * igt@kms_ccs@crc-primary-suspend-4-tiled-dg2-mc-ccs:
    - shard-mtlp:         [SKIP][403] ([i915#17031]) -> [SKIP][404] ([i915#6095]) +9 other tests skip
   [403]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19136/shard-mtlp-7/igt@kms_ccs@crc-primary-suspend-4-tiled-dg2-mc-ccs.html
   [404]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_162622v6/shard-mtlp-6/igt@kms_ccs@crc-primary-suspend-4-tiled-dg2-mc-ccs.html

  * igt@kms_ccs@crc-sprite-planes-basic-4-tiled-bmg-ccs:
    - shard-mtlp:         [SKIP][405] ([i915#17031]) -> [SKIP][406] ([i915#12313]) +2 other tests skip
   [405]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19136/shard-mtlp-7/igt@kms_ccs@crc-sprite-planes-basic-4-tiled-bmg-ccs.html
   [406]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_162622v6/shard-mtlp-6/igt@kms_ccs@crc-sprite-planes-basic-4-tiled-bmg-ccs.html

  * igt@kms_ccs@crc-sprite-planes-basic-4-tiled-lnl-ccs:
    - shard-rkl:          [SKIP][407] ([i915#12313] / [i915#14544]) -> [SKIP][408] ([i915#12313])
   [407]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19136/shard-rkl-6/igt@kms_ccs@crc-sprite-planes-basic-4-tiled-lnl-ccs.html
   [408]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_162622v6/shard-rkl-7/igt@kms_ccs@crc-sprite-planes-basic-4-tiled-lnl-ccs.html

  * igt@kms_ccs@missing-ccs-buffer-4-tiled-mtl-mc-ccs:
    - shard-rkl:          [SKIP][409] ([i915#14098] / [i915#6095]) -> [SKIP][410] ([i915#14098] / [i915#14544] / [i915#6095]) +1 other test skip
   [409]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19136/shard-rkl-8/igt@kms_ccs@missing-ccs-buffer-4-tiled-mtl-mc-ccs.html
   [410]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_162622v6/shard-rkl-6/igt@kms_ccs@missing-ccs-buffer-4-tiled-mtl-mc-ccs.html

  * igt@kms_ccs@random-ccs-data-4-tiled-dg2-mc-ccs@pipe-c-hdmi-a-2:
    - shard-rkl:          [SKIP][411] ([i915#14098] / [i915#14544] / [i915#6095]) -> [SKIP][412] ([i915#14098] / [i915#6095]) +9 other tests skip
   [411]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19136/shard-rkl-6/igt@kms_ccs@random-ccs-data-4-tiled-dg2-mc-ccs@pipe-c-hdmi-a-2.html
   [412]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_162622v6/shard-rkl-7/igt@kms_ccs@random-ccs-data-4-tiled-dg2-mc-ccs@pipe-c-hdmi-a-2.html

  * igt@kms_ccs@random-ccs-data-4-tiled-lnl-ccs:
    - shard-mtlp:         [SKIP][413] ([i915#12313]) -> [SKIP][414] ([i915#17031])
   [413]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19136/shard-mtlp-8/igt@kms_ccs@random-ccs-data-4-tiled-lnl-ccs.html
   [414]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_162622v6/shard-mtlp-7/igt@kms_ccs@random-ccs-data-4-tiled-lnl-ccs.html

  * igt@kms_ccs@random-ccs-data-4-tiled-mtl-rc-ccs@pipe-b-hdmi-a-2:
    - shard-rkl:          [SKIP][415] ([i915#14544] / [i915#6095]) -> [SKIP][416] ([i915#6095]) +8 other tests skip
   [415]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19136/shard-rkl-6/igt@kms_ccs@random-ccs-data-4-tiled-mtl-rc-ccs@pipe-b-hdmi-a-2.html
   [416]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_162622v6/shard-rkl-4/igt@kms_ccs@random-ccs-data-4-tiled-mtl-rc-ccs@pipe-b-hdmi-a-2.html

  * igt@kms_cdclk@plane-scaling:
    - shard-mtlp:         [SKIP][417] ([i915#17031]) -> [SKIP][418] ([i915#17016])
   [417]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19136/shard-mtlp-7/igt@kms_cdclk@plane-scaling.html
   [418]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_162622v6/shard-mtlp-8/igt@kms_cdclk@plane-scaling.html

  * igt@kms_chamelium_audio@dp-audio-after-suspend:
    - shard-rkl:          [SKIP][419] ([i915#11151] / [i915#14544]) -> [SKIP][420] ([i915#11151])
   [419]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19136/shard-rkl-6/igt@kms_chamelium_audio@dp-audio-after-suspend.html
   [420]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_162622v6/shard-rkl-4/igt@kms_chamelium_audio@dp-audio-after-suspend.html

  * igt@kms_chamelium_audio@hdmi-audio-after-suspend:
    - shard-mtlp:         [SKIP][421] ([i915#17031]) -> [SKIP][422] ([i915#11151])
   [421]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19136/shard-mtlp-7/igt@kms_chamelium_audio@hdmi-audio-after-suspend.html
   [422]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_162622v6/shard-mtlp-5/igt@kms_chamelium_audio@hdmi-audio-after-suspend.html

  * igt@kms_chamelium_color_pipeline@plane-lut1d:
    - shard-mtlp:         [SKIP][423] ([i915#16464] / [i915#16471]) -> [SKIP][424] ([i915#17031])
   [423]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19136/shard-mtlp-8/igt@kms_chamelium_color_pipeline@plane-lut1d.html
   [424]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_162622v6/shard-mtlp-7/igt@kms_chamelium_color_pipeline@plane-lut1d.html

  * igt@kms_chamelium_frames@hdmi-crc-multiple:
    - shard-mtlp:         [SKIP][425] ([i915#11151] / [i915#7828]) -> [SKIP][426] ([i915#17031]) +1 other test skip
   [425]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19136/shard-mtlp-1/igt@kms_chamelium_frames@hdmi-crc-multiple.html
   [426]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_162622v6/shard-mtlp-7/igt@kms_chamelium_frames@hdmi-crc-multiple.html

  * igt@kms_chamelium_hpd@dp-hpd-after-suspend:
    - shard-rkl:          [SKIP][427] ([i915#11151] / [i915#14544] / [i915#7828]) -> [SKIP][428] ([i915#11151] / [i915#7828]) +3 other tests skip
   [427]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19136/shard-rkl-6/igt@kms_chamelium_hpd@dp-hpd-after-suspend.html
   [428]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_162622v6/shard-rkl-4/igt@kms_chamelium_hpd@dp-hpd-after-suspend.html

  * igt@kms_chamelium_hpd@dp-hpd-storm-disable:
    - shard-rkl:          [SKIP][429] ([i915#11151] / [i915#7828]) -> [SKIP][430] ([i915#11151] / [i915#14544] / [i915#7828])
   [429]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19136/shard-rkl-8/igt@kms_chamelium_hpd@dp-hpd-storm-disable.html
   [430]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_162622v6/shard-rkl-6/igt@kms_chamelium_hpd@dp-hpd-storm-disable.html

  * igt@kms_chamelium_hpd@hdmi-hpd-enable-disable-mode:
    - shard-mtlp:         [SKIP][431] ([i915#17031]) -> [SKIP][432] ([i915#11151] / [i915#7828]) +9 other tests skip
   [431]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19136/shard-mtlp-7/igt@kms_chamelium_hpd@hdmi-hpd-enable-disable-mode.html
   [432]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_162622v6/shard-mtlp-6/igt@kms_chamelium_hpd@hdmi-hpd-enable-disable-mode.html

  * igt@kms_content_protection@dp-mst-lic-type-1:
    - shard-rkl:          [SKIP][433] ([i915#15330] / [i915#3116]) -> [SKIP][434] ([i915#14544] / [i915#15330] / [i915#3116])
   [433]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19136/shard-rkl-8/igt@kms_content_protection@dp-mst-lic-type-1.html
   [434]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_162622v6/shard-rkl-6/igt@kms_content_protection@dp-mst-lic-type-1.html

  * igt@kms_content_protection@legacy-hdcp14:
    - shard-mtlp:         [SKIP][435] ([i915#17031]) -> [SKIP][436] ([i915#15865])
   [435]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19136/shard-mtlp-7/igt@kms_content_protection@legacy-hdcp14.html
   [436]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_162622v6/shard-mtlp-6/igt@kms_content_protection@legacy-hdcp14.html

  * igt@kms_content_protection@lic-type-0-hdcp14:
    - shard-mtlp:         [SKIP][437] ([i915#15865]) -> [SKIP][438] ([i915#17031])
   [437]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19136/shard-mtlp-8/igt@kms_content_protection@lic-type-0-hdcp14.html
   [438]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_162622v6/shard-mtlp-7/igt@kms_content_protection@lic-type-0-hdcp14.html

  * igt@kms_content_protection@lic-type-1:
    - shard-rkl:          [SKIP][439] ([i915#15865]) -> [SKIP][440] ([i915#14544] / [i915#15865])
   [439]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19136/shard-rkl-8/igt@kms_content_protection@lic-type-1.html
   [440]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_162622v6/shard-rkl-6/igt@kms_content_protection@lic-type-1.html

  * igt@kms_content_protection@mei-interface:
    - shard-mtlp:         [SKIP][441] ([i915#17031]) -> [SKIP][442] ([i915#8063] / [i915#9433])
   [441]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19136/shard-mtlp-7/igt@kms_content_protection@mei-interface.html
   [442]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_162622v6/shard-mtlp-3/igt@kms_content_protection@mei-interface.html

  * igt@kms_cursor_crc@cursor-offscreen-512x170:
    - shard-mtlp:         [SKIP][443] ([i915#13049]) -> [SKIP][444] ([i915#17031])
   [443]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19136/shard-mtlp-8/igt@kms_cursor_crc@cursor-offscreen-512x170.html
   [444]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_162622v6/shard-mtlp-7/igt@kms_cursor_crc@cursor-offscreen-512x170.html

  * igt@kms_cursor_crc@cursor-offscreen-64x21:
    - shard-mtlp:         [SKIP][445] ([i915#17031]) -> [SKIP][446] ([i915#8814]) +4 other tests skip
   [445]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19136/shard-mtlp-7/igt@kms_cursor_crc@cursor-offscreen-64x21.html
   [446]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_162622v6/shard-mtlp-8/igt@kms_cursor_crc@cursor-offscreen-64x21.html

  * igt@kms_cursor_crc@cursor-onscreen-32x32:
    - shard-rkl:          [SKIP][447] ([i915#14544] / [i915#3555]) -> [SKIP][448] ([i915#3555])
   [447]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19136/shard-rkl-6/igt@kms_cursor_crc@cursor-onscreen-32x32.html
   [448]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_162622v6/shard-rkl-4/igt@kms_cursor_crc@cursor-onscreen-32x32.html

  * igt@kms_cursor_crc@cursor-random-64x21:
    - shard-mtlp:         [SKIP][449] ([i915#8814]) -> [SKIP][450] ([i915#17031]) +1 other test skip
   [449]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19136/shard-mtlp-8/igt@kms_cursor_crc@cursor-random-64x21.html
   [450]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_162622v6/shard-mtlp-7/igt@kms_cursor_crc@cursor-random-64x21.html

  * igt@kms_cursor_crc@cursor-rapid-movement-512x512:
    - shard-mtlp:         [SKIP][451] ([i915#17031]) -> [SKIP][452] ([i915#13049]) +1 other test skip
   [451]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19136/shard-mtlp-7/igt@kms_cursor_crc@cursor-rapid-movement-512x512.html
   [452]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_162622v6/shard-mtlp-5/igt@kms_cursor_crc@cursor-rapid-movement-512x512.html

  * igt@kms_cursor_crc@cursor-sliding-32x32:
    - shard-mtlp:         [SKIP][453] ([i915#17031]) -> [SKIP][454] ([i915#3555] / [i915#8814]) +3 other tests skip
   [453]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19136/shard-mtlp-7/igt@kms_cursor_crc@cursor-sliding-32x32.html
   [454]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_162622v6/shard-mtlp-8/igt@kms_cursor_crc@cursor-sliding-32x32.html

  * igt@kms_cursor_legacy@basic-busy-flip-before-cursor-legacy:
    - shard-mtlp:         [SKIP][455] ([i915#17031]) -> [SKIP][456] ([i915#16119] / [i915#4213])
   [455]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19136/shard-mtlp-7/igt@kms_cursor_legacy@basic-busy-flip-before-cursor-legacy.html
   [456]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_162622v6/shard-mtlp-3/igt@kms_cursor_legacy@basic-busy-flip-before-cursor-legacy.html

  * igt@kms_cursor_legacy@cursorb-vs-flipa-legacy:
    - shard-mtlp:         [SKIP][457] ([i915#9809]) -> [SKIP][458] ([i915#17031]) +1 other test skip
   [457]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19136/shard-mtlp-8/igt@kms_cursor_legacy@cursorb-vs-flipa-legacy.html
   [458]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_162622v6/shard-mtlp-7/igt@kms_cursor_legacy@cursorb-vs-flipa-legacy.html

  * igt@kms_cursor_legacy@cursorb-vs-flipa-varying-size:
    - shard-mtlp:         [SKIP][459] ([i915#17031]) -> [SKIP][460] ([i915#9809]) +2 other tests skip
   [459]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19136/shard-mtlp-7/igt@kms_cursor_legacy@cursorb-vs-flipa-varying-size.html
   [460]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_162622v6/shard-mtlp-8/igt@kms_cursor_legacy@cursorb-vs-flipa-varying-size.html

  * igt@kms_cursor_legacy@short-busy-flip-before-cursor-atomic-transitions:
    - shard-rkl:          [SKIP][461] ([i915#4103]) -> [SKIP][462] ([i915#14544] / [i915#4103])
   [461]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19136/shard-rkl-8/igt@kms_cursor_legacy@short-busy-flip-before-cursor-atomic-transitions.html
   [462]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_162622v6/shard-rkl-6/igt@kms_cursor_legacy@short-busy-flip-before-cursor-atomic-transitions.html

  * igt@kms_cursor_legacy@short-busy-flip-before-cursor-toggle:
    - shard-mtlp:         [SKIP][463] ([i915#16119] / [i915#4213]) -> [SKIP][464] ([i915#17031])
   [463]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19136/shard-mtlp-8/igt@kms_cursor_legacy@short-busy-flip-before-cursor-toggle.html
   [464]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_162622v6/shard-mtlp-7/igt@kms_cursor_legacy@short-busy-flip-before-cursor-toggle.html

  * igt@kms_dsc@dsc-with-formats-ultrajoiner:
    - shard-rkl:          [SKIP][465] ([i915#14544] / [i915#16361]) -> [SKIP][466] ([i915#16361]) +1 other test skip
   [465]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19136/shard-rkl-6/igt@kms_dsc@dsc-with-formats-ultrajoiner.html
   [466]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_162622v6/shard-rkl-7/igt@kms_dsc@dsc-with-formats-ultrajoiner.html

  * igt@kms_dsc@dsc-with-output-formats-bigjoiner:
    - shard-mtlp:         [SKIP][467] ([i915#17031]) -> [SKIP][468] ([i915#16361]) +6 other tests skip
   [467]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19136/shard-mtlp-7/igt@kms_dsc@dsc-with-output-formats-bigjoiner.html
   [468]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_162622v6/shard-mtlp-3/igt@kms_dsc@dsc-with-output-formats-bigjoiner.html

  * igt@kms_feature_discovery@display-3x:
    - shard-mtlp:         [SKIP][469] ([i915#17031]) -> [SKIP][470] ([i915#16081])
   [469]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19136/shard-mtlp-7/igt@kms_feature_discovery@display-3x.html
   [470]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_162622v6/shard-mtlp-5/igt@kms_feature_discovery@display-3x.html

  * igt@kms_feature_discovery@dp-mst:
    - shard-mtlp:         [SKIP][471] ([i915#17031]) -> [SKIP][472] ([i915#16599])
   [471]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19136/shard-mtlp-7/igt@kms_feature_discovery@dp-mst.html
   [472]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_162622v6/shard-mtlp-3/igt@kms_feature_discovery@dp-mst.html

  * igt@kms_flip@2x-flip-vs-absolute-wf_vblank:
    - shard-mtlp:         [SKIP][473] ([i915#3637] / [i915#9934]) -> [SKIP][474] ([i915#17031]) +1 other test skip
   [473]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19136/shard-mtlp-8/igt@kms_flip@2x-flip-vs-absolute-wf_vblank.html
   [474]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_162622v6/shard-mtlp-7/igt@kms_flip@2x-flip-vs-absolute-wf_vblank.html

  * igt@kms_flip@2x-flip-vs-dpms-on-nop-interruptible:
    - shard-mtlp:         [SKIP][475] ([i915#17031]) -> [SKIP][476] ([i915#9934])
   [475]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19136/shard-mtlp-7/igt@kms_flip@2x-flip-vs-dpms-on-nop-interruptible.html
   [476]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_162622v6/shard-mtlp-6/igt@kms_flip@2x-flip-vs-dpms-on-nop-interruptible.html

  * igt@kms_flip@2x-flip-vs-fences:
    - shard-mtlp:         [SKIP][477] ([i915#17031]) -> [SKIP][478] ([i915#8381])
   [477]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19136/shard-mtlp-7/igt@kms_flip@2x-flip-vs-fences.html
   [478]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_162622v6/shard-mtlp-6/igt@kms_flip@2x-flip-vs-fences.html

  * igt@kms_flip@2x-flip-vs-suspend:
    - shard-glk:          [INCOMPLETE][479] ([i915#12745] / [i915#4839]) -> [INCOMPLETE][480] ([i915#12745] / [i915#4839] / [i915#6113])
   [479]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19136/shard-glk9/igt@kms_flip@2x-flip-vs-suspend.html
   [480]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_162622v6/shard-glk3/igt@kms_flip@2x-flip-vs-suspend.html

  * igt@kms_flip@2x-modeset-vs-vblank-race:
    - shard-mtlp:         [SKIP][481] ([i915#17031]) -> [SKIP][482] ([i915#3637] / [i915#9934]) +4 other tests skip
   [481]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19136/shard-mtlp-7/igt@kms_flip@2x-modeset-vs-vblank-race.html
   [482]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_162622v6/shard-mtlp-8/igt@kms_flip@2x-modeset-vs-vblank-race.html

  * igt@kms_flip@2x-plain-flip-interruptible:
    - shard-rkl:          [SKIP][483] ([i915#14544] / [i915#9934]) -> [SKIP][484] ([i915#9934]) +5 other tests skip
   [483]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19136/shard-rkl-6/igt@kms_flip@2x-plain-flip-interruptible.html
   [484]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_162622v6/shard-rkl-7/igt@kms_flip@2x-plain-flip-interruptible.html

  * igt@kms_flip@dpms-vs-vblank-race-interruptible:
    - shard-dg1:          [ABORT][485] ([i915#16866] / [i915#16876] / [i915#16932] / [i915#4423]) -> [ABORT][486] ([i915#16876])
   [485]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19136/shard-dg1-16/igt@kms_flip@dpms-vs-vblank-race-interruptible.html
   [486]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_162622v6/shard-dg1-17/igt@kms_flip@dpms-vs-vblank-race-interruptible.html

  * igt@kms_flip_scaled_crc@flip-32bpp-yftile-to-64bpp-yftile-downscaling:
    - shard-mtlp:         [SKIP][487] ([i915#17031]) -> [SKIP][488] ([i915#15643]) +6 other tests skip
   [487]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19136/shard-mtlp-7/igt@kms_flip_scaled_crc@flip-32bpp-yftile-to-64bpp-yftile-downscaling.html
   [488]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_162622v6/shard-mtlp-6/igt@kms_flip_scaled_crc@flip-32bpp-yftile-to-64bpp-yftile-downscaling.html

  * igt@kms_flip_scaled_crc@flip-32bpp-yftileccs-to-64bpp-yftile-downscaling:
    - shard-mtlp:         [SKIP][489] ([i915#15643]) -> [SKIP][490] ([i915#17031]) +2 other tests skip
   [489]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19136/shard-mtlp-8/igt@kms_flip_scaled_crc@flip-32bpp-yftileccs-to-64bpp-yftile-downscaling.html
   [490]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_162622v6/shard-mtlp-7/igt@kms_flip_scaled_crc@flip-32bpp-yftileccs-to-64bpp-yftile-downscaling.html

  * igt@kms_flip_scaled_crc@flip-32bpp-yftileccs-to-64bpp-yftile-upscaling:
    - shard-rkl:          [SKIP][491] ([i915#15643]) -> [SKIP][492] ([i915#14544] / [i915#15643])
   [491]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19136/shard-rkl-8/igt@kms_flip_scaled_crc@flip-32bpp-yftileccs-to-64bpp-yftile-upscaling.html
   [492]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_162622v6/shard-rkl-6/igt@kms_flip_scaled_crc@flip-32bpp-yftileccs-to-64bpp-yftile-upscaling.html

  * igt@kms_flip_scaled_crc@flip-64bpp-linear-to-16bpp-linear-downscaling:
    - shard-mtlp:         [SKIP][493] ([i915#17031]) -> [SKIP][494] ([i915#3555] / [i915#8810] / [i915#8813]) +1 other test skip
   [493]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19136/shard-mtlp-7/igt@kms_flip_scaled_crc@flip-64bpp-linear-to-16bpp-linear-downscaling.html
   [494]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_162622v6/shard-mtlp-6/igt@kms_flip_scaled_crc@flip-64bpp-linear-to-16bpp-linear-downscaling.html

  * igt@kms_flip_scaled_crc@flip-p010-4tile-to-p016-4tile:
    - shard-rkl:          [SKIP][495] ([i915#14544] / [i915#15643]) -> [SKIP][496] ([i915#15643]) +2 other tests skip
   [495]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19136/shard-rkl-6/igt@kms_flip_scaled_crc@flip-p010-4tile-to-p016-4tile.html
   [496]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_162622v6/shard-rkl-7/igt@kms_flip_scaled_crc@flip-p010-4tile-to-p016-4tile.html

  * igt@kms_frontbuffer_tracking@fbc-2p-primscrn-pri-indfb-draw-blt:
    - shard-mtlp:         [SKIP][497] ([i915#17031]) -> [SKIP][498] ([i915#15991] / [i915#1825]) +36 other tests skip
   [497]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19136/shard-mtlp-7/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-pri-indfb-draw-blt.html
   [498]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_162622v6/shard-mtlp-8/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-pri-indfb-draw-blt.html

  * igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-pri-indfb-draw-mmap-cpu:
    - shard-mtlp:         [SKIP][499] ([i915#15991] / [i915#1825]) -> [SKIP][500] ([i915#17031]) +13 other tests skip
   [499]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19136/shard-mtlp-8/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-pri-indfb-draw-mmap-cpu.html
   [500]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_162622v6/shard-mtlp-7/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-pri-indfb-draw-mmap-cpu.html

  * igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-pri-indfb-draw-mmap-wc:
    - shard-rkl:          [SKIP][501] ([i915#1825]) -> [SKIP][502] ([i915#14544] / [i915#1825])
   [501]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19136/shard-rkl-8/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-pri-indfb-draw-mmap-wc.html
   [502]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_162622v6/shard-rkl-6/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-pri-indfb-draw-mmap-wc.html

  * igt@kms_frontbuffer_tracking@fbchdr-1p-primscrn-pri-shrfb-draw-mmap-gtt:
    - shard-mtlp:         [SKIP][503] ([i915#17031]) -> [SKIP][504] ([i915#15990]) +12 other tests skip
   [503]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19136/shard-mtlp-7/igt@kms_frontbuffer_tracking@fbchdr-1p-primscrn-pri-shrfb-draw-mmap-gtt.html
   [504]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_162622v6/shard-mtlp-3/igt@kms_frontbuffer_tracking@fbchdr-1p-primscrn-pri-shrfb-draw-mmap-gtt.html

  * igt@kms_frontbuffer_tracking@fbchdr-1p-primscrn-pri-shrfb-draw-pwrite:
    - shard-mtlp:         [SKIP][505] ([i915#17031]) -> [SKIP][506] ([i915#15989]) +43 other tests skip
   [505]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19136/shard-mtlp-7/igt@kms_frontbuffer_tracking@fbchdr-1p-primscrn-pri-shrfb-draw-pwrite.html
   [506]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_162622v6/shard-mtlp-6/igt@kms_frontbuffer_tracking@fbchdr-1p-primscrn-pri-shrfb-draw-pwrite.html

  * igt@kms_frontbuffer_tracking@fbchdr-2p-primscrn-indfb-pgflip-blt:
    - shard-mtlp:         [SKIP][507] ([i915#17031]) -> [SKIP][508] ([i915#15991]) +41 other tests skip
   [507]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19136/shard-mtlp-7/igt@kms_frontbuffer_tracking@fbchdr-2p-primscrn-indfb-pgflip-blt.html
   [508]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_162622v6/shard-mtlp-6/igt@kms_frontbuffer_tracking@fbchdr-2p-primscrn-indfb-pgflip-blt.html

  * igt@kms_frontbuffer_tracking@fbchdr-2p-scndscrn-spr-indfb-draw-render:
    - shard-rkl:          [SKIP][509] ([i915#14544]) -> [SKIP][510] +40 other tests skip
   [509]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19136/shard-rkl-6/igt@kms_frontbuffer_tracking@fbchdr-2p-scndscrn-spr-indfb-draw-render.html
   [510]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_162622v6/shard-rkl-7/igt@kms_frontbuffer_tracking@fbchdr-2p-scndscrn-spr-indfb-draw-render.html

  * igt@kms_frontbuffer_tracking@fbchdr-suspend:
    - shard-glk:          [INCOMPLETE][511] ([i915#16056] / [i915#16593]) -> [SKIP][512]
   [511]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19136/shard-glk8/igt@kms_frontbuffer_tracking@fbchdr-suspend.html
   [512]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_162622v6/shard-glk5/igt@kms_frontbuffer_tracking@fbchdr-suspend.html

  * igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-pri-shrfb-draw-mmap-cpu:
    - shard-rkl:          [SKIP][513] ([i915#15102]) -> [SKIP][514] ([i915#14544] / [i915#15102]) +6 other tests skip
   [513]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19136/shard-rkl-8/igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-pri-shrfb-draw-mmap-cpu.html
   [514]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_162622v6/shard-rkl-6/igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-pri-shrfb-draw-mmap-cpu.html

  * igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-pri-shrfb-draw-blt:
    - shard-dg1:          [SKIP][515] ([i915#4423]) -> [SKIP][516]
   [515]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19136/shard-dg1-16/igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-pri-shrfb-draw-blt.html
   [516]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_162622v6/shard-dg1-17/igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-pri-shrfb-draw-blt.html

  * igt@kms_frontbuffer_tracking@fbcpsr-rgb101010-draw-mmap-wc:
    - shard-rkl:          [SKIP][517] ([i915#14544] / [i915#15102]) -> [SKIP][518] ([i915#15102]) +16 other tests skip
   [517]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19136/shard-rkl-6/igt@kms_frontbuffer_tracking@fbcpsr-rgb101010-draw-mmap-wc.html
   [518]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_162622v6/shard-rkl-4/igt@kms_frontbuffer_tracking@fbcpsr-rgb101010-draw-mmap-wc.html

  * igt@kms_frontbuffer_tracking@fbcpsrhdr-rgb101010-draw-mmap-wc:
    - shard-mtlp:         [SKIP][519] ([i915#15989]) -> [SKIP][520] ([i915#17031]) +10 other tests skip
   [519]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19136/shard-mtlp-8/igt@kms_frontbuffer_tracking@fbcpsrhdr-rgb101010-draw-mmap-wc.html
   [520]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_162622v6/shard-mtlp-7/igt@kms_frontbuffer_tracking@fbcpsrhdr-rgb101010-draw-mmap-wc.html

  * igt@kms_frontbuffer_tracking@fbcpsrhdr-tiling-y:
    - shard-mtlp:         [SKIP][521] ([i915#17031]) -> [SKIP][522] ([i915#10055])
   [521]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19136/shard-mtlp-7/igt@kms_frontbuffer_tracking@fbcpsrhdr-tiling-y.html
   [522]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_162622v6/shard-mtlp-5/igt@kms_frontbuffer_tracking@fbcpsrhdr-tiling-y.html

  * igt@kms_frontbuffer_tracking@hdr-2p-scndscrn-spr-indfb-move:
    - shard-mtlp:         [SKIP][523] ([i915#15991]) -> [SKIP][524] ([i915#17031]) +17 other tests skip
   [523]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19136/shard-mtlp-8/igt@kms_frontbuffer_tracking@hdr-2p-scndscrn-spr-indfb-move.html
   [524]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_162622v6/shard-mtlp-7/igt@kms_frontbuffer_tracking@hdr-2p-scndscrn-spr-indfb-move.html

  * igt@kms_frontbuffer_tracking@psr-1p-offscreen-pri-shrfb-draw-mmap-gtt:
    - shard-mtlp:         [SKIP][525] ([i915#15104] / [i915#15990]) -> [SKIP][526] ([i915#17031])
   [525]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19136/shard-mtlp-8/igt@kms_frontbuffer_tracking@psr-1p-offscreen-pri-shrfb-draw-mmap-gtt.html
   [526]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_162622v6/shard-mtlp-7/igt@kms_frontbuffer_tracking@psr-1p-offscreen-pri-shrfb-draw-mmap-gtt.html

  * igt@kms_frontbuffer_tracking@psr-1p-primscrn-cur-indfb-draw-render:
    - shard-dg1:          [SKIP][527] ([i915#15102]) -> [SKIP][528] ([i915#15102] / [i915#4423])
   [527]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19136/shard-dg1-17/igt@kms_frontbuffer_tracking@psr-1p-primscrn-cur-indfb-draw-render.html
   [528]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_162622v6/shard-dg1-16/igt@kms_frontbuffer_tracking@psr-1p-primscrn-cur-indfb-draw-render.html

  * igt@kms_frontbuffer_tracking@psr-1p-primscrn-pri-indfb-draw-mmap-gtt:
    - shard-mtlp:         [SKIP][529] ([i915#17031]) -> [SKIP][530] ([i915#15990] / [i915#8708]) +15 other tests skip
   [529]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19136/shard-mtlp-7/igt@kms_frontbuffer_tracking@psr-1p-primscrn-pri-indfb-draw-mmap-gtt.html
   [530]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_162622v6/shard-mtlp-6/igt@kms_frontbuffer_tracking@psr-1p-primscrn-pri-indfb-draw-mmap-gtt.html

  * igt@kms_frontbuffer_tracking@psr-2p-scndscrn-pri-indfb-draw-mmap-wc:
    - shard-rkl:          [SKIP][531] ([i915#14544] / [i915#1825]) -> [SKIP][532] ([i915#1825])
   [531]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19136/shard-rkl-6/igt@kms_frontbuffer_tracking@psr-2p-scndscrn-pri-indfb-draw-mmap-wc.html
   [532]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_162622v6/shard-rkl-4/igt@kms_frontbuffer_tracking@psr-2p-scndscrn-pri-indfb-draw-mmap-wc.html

  * igt@kms_frontbuffer_tracking@psrhdr-1p-primscrn-cur-indfb-draw-mmap-gtt:
    - shard-mtlp:         [SKIP][533] ([i915#15990]) -> [SKIP][534] ([i915#17031]) +3 other tests skip
   [533]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19136/shard-mtlp-8/igt@kms_frontbuffer_tracking@psrhdr-1p-primscrn-cur-indfb-draw-mmap-gtt.html
   [534]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_162622v6/shard-mtlp-7/igt@kms_frontbuffer_tracking@psrhdr-1p-primscrn-cur-indfb-draw-mmap-gtt.html

  * igt@kms_frontbuffer_tracking@psrhdr-2p-scndscrn-spr-indfb-draw-mmap-gtt:
    - shard-rkl:          [SKIP][535] -> [SKIP][536] ([i915#14544]) +11 other tests skip
   [535]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19136/shard-rkl-8/igt@kms_frontbuffer_tracking@psrhdr-2p-scndscrn-spr-indfb-draw-mmap-gtt.html
   [536]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_162622v6/shard-rkl-6/igt@kms_frontbuffer_tracking@psrhdr-2p-scndscrn-spr-indfb-draw-mmap-gtt.html

  * igt@kms_hdr@brightness-with-hdr:
    - shard-mtlp:         [SKIP][537] ([i915#12713] / [i915#16490]) -> [SKIP][538] ([i915#17031])
   [537]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19136/shard-mtlp-8/igt@kms_hdr@brightness-with-hdr.html
   [538]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_162622v6/shard-mtlp-7/igt@kms_hdr@brightness-with-hdr.html
    - shard-tglu:         [SKIP][539] ([i915#1187] / [i915#12713]) -> [SKIP][540] ([i915#12713])
   [539]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19136/shard-tglu-2/igt@kms_hdr@brightness-with-hdr.html
   [540]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_162622v6/shard-tglu-10/igt@kms_hdr@brightness-with-hdr.html

  * igt@kms_hdr@static-toggle-dpms:
    - shard-mtlp:         [SKIP][541] ([i915#17031]) -> [SKIP][542] ([i915#12713] / [i915#16490] / [i915#3555] / [i915#8228]) +2 other tests skip
   [541]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19136/shard-mtlp-7/igt@kms_hdr@static-toggle-dpms.html
   [542]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_162622v6/shard-mtlp-6/igt@kms_hdr@static-toggle-dpms.html

  * igt@kms_hdr@static-toggle-suspend:
    - shard-rkl:          [SKIP][543] ([i915#16644] / [i915#3555] / [i915#8228]) -> [INCOMPLETE][544] ([i915#15436])
   [543]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19136/shard-rkl-2/igt@kms_hdr@static-toggle-suspend.html
   [544]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_162622v6/shard-rkl-6/igt@kms_hdr@static-toggle-suspend.html

  * igt@kms_joiner@basic-max-non-joiner:
    - shard-rkl:          [SKIP][545] ([i915#13688] / [i915#14544]) -> [SKIP][546] ([i915#13688])
   [545]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19136/shard-rkl-6/igt@kms_joiner@basic-max-non-joiner.html
   [546]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_162622v6/shard-rkl-4/igt@kms_joiner@basic-max-non-joiner.html

  * igt@kms_joiner@basic-ultra-joiner:
    - shard-rkl:          [SKIP][547] ([i915#14544] / [i915#15458]) -> [SKIP][548] ([i915#15458]) +1 other test skip
   [547]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19136/shard-rkl-6/igt@kms_joiner@basic-ultra-joiner.html
   [548]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_162622v6/shard-rkl-4/igt@kms_joiner@basic-ultra-joiner.html

  * igt@kms_joiner@invalid-modeset-big-joiner:
    - shard-mtlp:         [SKIP][549] ([i915#17031]) -> [SKIP][550] ([i915#15460])
   [549]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19136/shard-mtlp-7/igt@kms_joiner@invalid-modeset-big-joiner.html
   [550]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_162622v6/shard-mtlp-6/igt@kms_joiner@invalid-modeset-big-joiner.html

  * igt@kms_joiner@invalid-modeset-force-big-joiner:
    - shard-mtlp:         [SKIP][551] ([i915#17031]) -> [SKIP][552] ([i915#15459])
   [551]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19136/shard-mtlp-7/igt@kms_joiner@invalid-modeset-force-big-joiner.html
   [552]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_162622v6/shard-mtlp-3/igt@kms_joiner@invalid-modeset-force-big-joiner.html

  * igt@kms_joiner@switch-modeset-ultra-joiner-big-joiner:
    - shard-mtlp:         [SKIP][553] ([i915#17031]) -> [SKIP][554] ([i915#15638] / [i915#15722])
   [553]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19136/shard-mtlp-7/igt@kms_joiner@switch-modeset-ultra-joiner-big-joiner.html
   [554]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_162622v6/shard-mtlp-8/igt@kms_joiner@switch-modeset-ultra-joiner-big-joiner.html

  * igt@kms_multipipe_modeset@basic-max-pipe-crc-check:
    - shard-mtlp:         [SKIP][555] ([i915#17031]) -> [SKIP][556] ([i915#15815])
   [555]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19136/shard-mtlp-7/igt@kms_multipipe_modeset@basic-max-pipe-crc-check.html
   [556]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_162622v6/shard-mtlp-6/igt@kms_multipipe_modeset@basic-max-pipe-crc-check.html

  * igt@kms_plane@pixel-format-4-tiled-dg2-rc-ccs-cc-modifier:
    - shard-mtlp:         [SKIP][557] ([i915#15709]) -> [SKIP][558] ([i915#17031]) +1 other test skip
   [557]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19136/shard-mtlp-8/igt@kms_plane@pixel-format-4-tiled-dg2-rc-ccs-cc-modifier.html
   [558]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_162622v6/shard-mtlp-7/igt@kms_plane@pixel-format-4-tiled-dg2-rc-ccs-cc-modifier.html

  * igt@kms_plane@pixel-format-4-tiled-lnl-ccs-modifier-source-clamping:
    - shard-rkl:          [SKIP][559] ([i915#15709]) -> [SKIP][560] ([i915#14544] / [i915#15709])
   [559]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19136/shard-rkl-8/igt@kms_plane@pixel-format-4-tiled-lnl-ccs-modifier-source-clamping.html
   [560]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_162622v6/shard-rkl-6/igt@kms_plane@pixel-format-4-tiled-lnl-ccs-modifier-source-clamping.html

  * igt@kms_plane@pixel-format-y-tiled-gen12-mc-ccs-modifier-source-clamping:
    - shard-rkl:          [SKIP][561] ([i915#14544] / [i915#15709]) -> [SKIP][562] ([i915#15709])
   [561]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19136/shard-rkl-6/igt@kms_plane@pixel-format-y-tiled-gen12-mc-ccs-modifier-source-clamping.html
   [562]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_162622v6/shard-rkl-7/igt@kms_plane@pixel-format-y-tiled-gen12-mc-ccs-modifier-source-clamping.html

  * igt@kms_plane@pixel-format-y-tiled-gen12-rc-ccs-modifier@pipe-a-plane-7:
    - shard-tglu:         [ABORT][563] ([i915#16866]) -> [SKIP][564] ([i915#16386])
   [563]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19136/shard-tglu-4/igt@kms_plane@pixel-format-y-tiled-gen12-rc-ccs-modifier@pipe-a-plane-7.html
   [564]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_162622v6/shard-tglu-5/igt@kms_plane@pixel-format-y-tiled-gen12-rc-ccs-modifier@pipe-a-plane-7.html

  * igt@kms_plane@pixel-format-y-tiled-modifier:
    - shard-mtlp:         [SKIP][565] ([i915#17031]) -> [SKIP][566] ([i915#15709]) +4 other tests skip
   [565]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19136/shard-mtlp-7/igt@kms_plane@pixel-format-y-tiled-modifier.html
   [566]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_162622v6/shard-mtlp-8/igt@kms_plane@pixel-format-y-tiled-modifier.html

  * igt@kms_plane_lowres@tiling-x:
    - shard-mtlp:         [SKIP][567] ([i915#11614] / [i915#3582]) -> [SKIP][568] ([i915#17031])
   [567]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19136/shard-mtlp-8/igt@kms_plane_lowres@tiling-x.html
   [568]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_162622v6/shard-mtlp-7/igt@kms_plane_lowres@tiling-x.html

  * igt@kms_plane_multiple@2x-tiling-yf:
    - shard-mtlp:         [SKIP][569] ([i915#17031]) -> [SKIP][570] ([i915#13958])
   [569]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19136/shard-mtlp-7/igt@kms_plane_multiple@2x-tiling-yf.html
   [570]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_162622v6/shard-mtlp-3/igt@kms_plane_multiple@2x-tiling-yf.html

  * igt@kms_plane_scaling@plane-downscale-factor-0-5-with-modifiers:
    - shard-mtlp:         [SKIP][571] ([i915#15329]) -> [SKIP][572] ([i915#17031])
   [571]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19136/shard-mtlp-8/igt@kms_plane_scaling@plane-downscale-factor-0-5-with-modifiers.html
   [572]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_162622v6/shard-mtlp-7/igt@kms_plane_scaling@plane-downscale-factor-0-5-with-modifiers.html

  * igt@kms_plane_scaling@plane-downscale-factor-0-5-with-rotation:
    - shard-mtlp:         [SKIP][573] ([i915#17031]) -> [SKIP][574] ([i915#15329])
   [573]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19136/shard-mtlp-7/igt@kms_plane_scaling@plane-downscale-factor-0-5-with-rotation.html
   [574]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_162622v6/shard-mtlp-5/igt@kms_plane_scaling@plane-downscale-factor-0-5-with-rotation.html

  * igt@kms_plane_scaling@plane-scaler-unity-scaling-with-rotation@pipe-b:
    - shard-rkl:          [SKIP][575] ([i915#15329]) -> [SKIP][576] ([i915#14544] / [i915#15329]) +3 other tests skip
   [575]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19136/shard-rkl-8/igt@kms_plane_scaling@plane-scaler-unity-scaling-with-rotation@pipe-b.html
   [576]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_162622v6/shard-rkl-6/igt@kms_plane_scaling@plane-scaler-unity-scaling-with-rotation@pipe-b.html

  * igt@kms_plane_scaling@planes-unity-scaling-downscale-factor-0-5:
    - shard-mtlp:         [SKIP][577] ([i915#15329] / [i915#6953]) -> [SKIP][578] ([i915#17031])
   [577]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19136/shard-mtlp-8/igt@kms_plane_scaling@planes-unity-scaling-downscale-factor-0-5.html
   [578]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_162622v6/shard-mtlp-7/igt@kms_plane_scaling@planes-unity-scaling-downscale-factor-0-5.html

  * igt@kms_plane_scaling@planes-upscale-20x20-downscale-factor-0-75:
    - shard-mtlp:         [SKIP][579] ([i915#17031]) -> [SKIP][580] ([i915#15329] / [i915#6953])
   [579]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19136/shard-mtlp-7/igt@kms_plane_scaling@planes-upscale-20x20-downscale-factor-0-75.html
   [580]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_162622v6/shard-mtlp-6/igt@kms_plane_scaling@planes-upscale-20x20-downscale-factor-0-75.html

  * igt@kms_pm_backlight@fade:
    - shard-rkl:          [SKIP][581] ([i915#12343] / [i915#14544] / [i915#5354]) -> [SKIP][582] ([i915#12343] / [i915#5354])
   [581]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19136/shard-rkl-6/igt@kms_pm_backlight@fade.html
   [582]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_162622v6/shard-rkl-4/igt@kms_pm_backlight@fade.html

  * igt@kms_pm_dc@dc5-psr:
    - shard-rkl:          [SKIP][583] ([i915#14544] / [i915#15948]) -> [SKIP][584] ([i915#15948])
   [583]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19136/shard-rkl-6/igt@kms_pm_dc@dc5-psr.html
   [584]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_162622v6/shard-rkl-7/igt@kms_pm_dc@dc5-psr.html

  * igt@kms_pm_lpsp@kms-lpsp:
    - shard-rkl:          [SKIP][585] ([i915#9340]) -> [SKIP][586] ([i915#3828])
   [585]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19136/shard-rkl-7/igt@kms_pm_lpsp@kms-lpsp.html
   [586]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_162622v6/shard-rkl-8/igt@kms_pm_lpsp@kms-lpsp.html
    - shard-dg1:          [SKIP][587] ([i915#3828]) -> [SKIP][588] ([i915#9340])
   [587]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19136/shard-dg1-14/igt@kms_pm_lpsp@kms-lpsp.html
   [588]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_162622v6/shard-dg1-16/igt@kms_pm_lpsp@kms-lpsp.html

  * igt@kms_pm_rpm@fences:
    - shard-dg1:          [SKIP][589] ([i915#4423]) -> [SKIP][590] ([i915#4077])
   [589]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19136/shard-dg1-16/igt@kms_pm_rpm@fences.html
   [590]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_162622v6/shard-dg1-17/igt@kms_pm_rpm@fences.html

  * igt@kms_pm_rpm@modeset-non-lpsp-stress-no-wait:
    - shard-mtlp:         [SKIP][591] ([i915#17031]) -> [SKIP][592] ([i915#15073])
   [591]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19136/shard-mtlp-7/igt@kms_pm_rpm@modeset-non-lpsp-stress-no-wait.html
   [592]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_162622v6/shard-mtlp-3/igt@kms_pm_rpm@modeset-non-lpsp-stress-no-wait.html

  * igt@kms_pm_rpm@package-g7:
    - shard-mtlp:         [SKIP][593] ([i915#15403]) -> [SKIP][594] ([i915#17031])
   [593]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19136/shard-mtlp-8/igt@kms_pm_rpm@package-g7.html
   [594]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_162622v6/shard-mtlp-7/igt@kms_pm_rpm@package-g7.html

  * igt@kms_prime@d3hot:
    - shard-rkl:          [SKIP][595] ([i915#14544] / [i915#6524]) -> [SKIP][596] ([i915#6524])
   [595]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19136/shard-rkl-6/igt@kms_prime@d3hot.html
   [596]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_162622v6/shard-rkl-7/igt@kms_prime@d3hot.html
    - shard-mtlp:         [SKIP][597] ([i915#17031]) -> [SKIP][598] ([i915#6524]) +1 other test skip
   [597]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19136/shard-mtlp-7/igt@kms_prime@d3hot.html
   [598]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_162622v6/shard-mtlp-6/igt@kms_prime@d3hot.html

  * igt@kms_psr2_sf@fbc-pr-overlay-plane-update-sf-dmg-area:
    - shard-mtlp:         [SKIP][599] ([i915#12316]) -> [SKIP][600] ([i915#17031])
   [599]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19136/shard-mtlp-8/igt@kms_psr2_sf@fbc-pr-overlay-plane-update-sf-dmg-area.html
   [600]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_162622v6/shard-mtlp-7/igt@kms_psr2_sf@fbc-pr-overlay-plane-update-sf-dmg-area.html

  * igt@kms_psr2_sf@pr-cursor-plane-move-continuous-exceed-fully-sf:
    - shard-rkl:          [SKIP][601] ([i915#11520] / [i915#14544]) -> [SKIP][602] ([i915#11520]) +2 other tests skip
   [601]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19136/shard-rkl-6/igt@kms_psr2_sf@pr-cursor-plane-move-continuous-exceed-fully-sf.html
   [602]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_162622v6/shard-rkl-7/igt@kms_psr2_sf@pr-cursor-plane-move-continuous-exceed-fully-sf.html

  * igt@kms_psr2_sf@pr-cursor-plane-move-continuous-sf:
    - shard-rkl:          [SKIP][603] ([i915#11520]) -> [SKIP][604] ([i915#11520] / [i915#14544])
   [603]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19136/shard-rkl-8/igt@kms_psr2_sf@pr-cursor-plane-move-continuous-sf.html
   [604]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_162622v6/shard-rkl-6/igt@kms_psr2_sf@pr-cursor-plane-move-continuous-sf.html

  * igt@kms_psr2_sf@pr-overlay-primary-update-sf-dmg-area:
    - shard-mtlp:         [SKIP][605] ([i915#17031]) -> [SKIP][606] ([i915#12316]) +5 other tests skip
   [605]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19136/shard-mtlp-7/igt@kms_psr2_sf@pr-overlay-primary-update-sf-dmg-area.html
   [606]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_162622v6/shard-mtlp-6/igt@kms_psr2_sf@pr-overlay-primary-update-sf-dmg-area.html

  * igt@kms_psr@fbc-pr-primary-blt:
    - shard-mtlp:         [SKIP][607] ([i915#9688]) -> [SKIP][608] ([i915#17031]) +4 other tests skip
   [607]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19136/shard-mtlp-8/igt@kms_psr@fbc-pr-primary-blt.html
   [608]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_162622v6/shard-mtlp-7/igt@kms_psr@fbc-pr-primary-blt.html

  * igt@kms_psr@fbc-psr2-primary-mmap-cpu:
    - shard-mtlp:         [SKIP][609] ([i915#17031]) -> [SKIP][610] ([i915#9688]) +14 other tests skip
   [609]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19136/shard-mtlp-7/igt@kms_psr@fbc-psr2-primary-mmap-cpu.html
   [610]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_162622v6/shard-mtlp-6/igt@kms_psr@fbc-psr2-primary-mmap-cpu.html

  * igt@kms_psr@pr-primary-mmap-cpu:
    - shard-rkl:          [SKIP][611] ([i915#1072] / [i915#14544] / [i915#9732]) -> [SKIP][612] ([i915#1072] / [i915#9732]) +8 other tests skip
   [611]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19136/shard-rkl-6/igt@kms_psr@pr-primary-mmap-cpu.html
   [612]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_162622v6/shard-rkl-7/igt@kms_psr@pr-primary-mmap-cpu.html

  * igt@kms_psr@psr-cursor-plane-move:
    - shard-dg1:          [SKIP][613] ([i915#1072] / [i915#9732]) -> [SKIP][614] ([i915#1072] / [i915#4423] / [i915#9732])
   [613]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19136/shard-dg1-17/igt@kms_psr@psr-cursor-plane-move.html
   [614]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_162622v6/shard-dg1-16/igt@kms_psr@psr-cursor-plane-move.html

  * igt@kms_psr@psr-cursor-render:
    - shard-rkl:          [SKIP][615] ([i915#1072] / [i915#9732]) -> [SKIP][616] ([i915#1072] / [i915#14544] / [i915#9732]) +3 other tests skip
   [615]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19136/shard-rkl-8/igt@kms_psr@psr-cursor-render.html
   [616]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_162622v6/shard-rkl-6/igt@kms_psr@psr-cursor-render.html

  * igt@kms_psr@psr-primary-mmap-gtt:
    - shard-mtlp:         [SKIP][617] ([i915#4077] / [i915#9688]) -> [SKIP][618] ([i915#17031])
   [617]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19136/shard-mtlp-8/igt@kms_psr@psr-primary-mmap-gtt.html
   [618]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_162622v6/shard-mtlp-7/igt@kms_psr@psr-primary-mmap-gtt.html

  * igt@kms_psr@psr2-primary-mmap-gtt:
    - shard-mtlp:         [SKIP][619] ([i915#17031]) -> [SKIP][620] ([i915#4077] / [i915#9688])
   [619]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19136/shard-mtlp-7/igt@kms_psr@psr2-primary-mmap-gtt.html
   [620]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_162622v6/shard-mtlp-5/igt@kms_psr@psr2-primary-mmap-gtt.html

  * igt@kms_psr_stress_test@flip-primary-invalidate-overlay:
    - shard-rkl:          [SKIP][621] ([i915#14544] / [i915#15949]) -> [SKIP][622] ([i915#15949])
   [621]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19136/shard-rkl-6/igt@kms_psr_stress_test@flip-primary-invalidate-overlay.html
   [622]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_162622v6/shard-rkl-4/igt@kms_psr_stress_test@flip-primary-invalidate-overlay.html

  * igt@kms_rotation_crc@primary-y-tiled-reflect-x-0:
    - shard-mtlp:         [SKIP][623] ([i915#5289]) -> [SKIP][624] ([i915#17031])
   [623]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19136/shard-mtlp-8/igt@kms_rotation_crc@primary-y-tiled-reflect-x-0.html
   [624]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_162622v6/shard-mtlp-7/igt@kms_rotation_crc@primary-y-tiled-reflect-x-0.html

  * igt@kms_rotation_crc@primary-yf-tiled-reflect-x-0:
    - shard-mtlp:         [SKIP][625] ([i915#17031]) -> [SKIP][626] ([i915#5289])
   [625]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19136/shard-mtlp-7/igt@kms_rotation_crc@primary-yf-tiled-reflect-x-0.html
   [626]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_162622v6/shard-mtlp-6/igt@kms_rotation_crc@primary-yf-tiled-reflect-x-0.html

  * igt@kms_rotation_crc@primary-yf-tiled-reflect-x-270:
    - shard-mtlp:         [SKIP][627] ([i915#17031]) -> [SKIP][628] ([i915#12755] / [i915#15867]) +2 other tests skip
   [627]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19136/shard-mtlp-7/igt@kms_rotation_crc@primary-yf-tiled-reflect-x-270.html
   [628]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_162622v6/shard-mtlp-8/igt@kms_rotation_crc@primary-yf-tiled-reflect-x-270.html

  * igt@kms_rotation_crc@sprite-rotation-90-pos-100-0:
    - shard-mtlp:         [SKIP][629] ([i915#12755] / [i915#15867]) -> [SKIP][630] ([i915#17031])
   [629]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19136/shard-mtlp-1/igt@kms_rotation_crc@sprite-rotation-90-pos-100-0.html
   [630]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_162622v6/shard-mtlp-7/igt@kms_rotation_crc@sprite-rotation-90-pos-100-0.html

  * igt@kms_scaling_modes@scaling-mode-none:
    - shard-mtlp:         [SKIP][631] ([i915#17031]) -> [SKIP][632] ([i915#3555] / [i915#5030] / [i915#9041])
   [631]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19136/shard-mtlp-7/igt@kms_scaling_modes@scaling-mode-none.html
   [632]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_162622v6/shard-mtlp-3/igt@kms_scaling_modes@scaling-mode-none.html

  * igt@kms_setmode@invalid-clone-single-crtc:
    - shard-mtlp:         [SKIP][633] ([i915#3555] / [i915#8809]) -> [SKIP][634] ([i915#17031])
   [633]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19136/shard-mtlp-8/igt@kms_setmode@invalid-clone-single-crtc.html
   [634]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_162622v6/shard-mtlp-7/igt@kms_setmode@invalid-clone-single-crtc.html

  * igt@kms_vrr@flip-basic:
    - shard-mtlp:         [SKIP][635] ([i915#3555] / [i915#8808]) -> [SKIP][636] ([i915#17031])
   [635]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19136/shard-mtlp-8/igt@kms_vrr@flip-basic.html
   [636]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_162622v6/shard-mtlp-7/igt@kms_vrr@flip-basic.html

  * igt@kms_vrr@flipline:
    - shard-mtlp:         [SKIP][637] ([i915#17031]) -> [SKIP][638] ([i915#3555] / [i915#8808])
   [637]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19136/shard-mtlp-7/igt@kms_vrr@flipline.html
   [638]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_162622v6/shard-mtlp-3/igt@kms_vrr@flipline.html

  * igt@kms_vrr@lobf:
    - shard-rkl:          [SKIP][639] ([i915#11920] / [i915#14544]) -> [SKIP][640] ([i915#11920])
   [639]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19136/shard-rkl-6/igt@kms_vrr@lobf.html
   [640]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_162622v6/shard-rkl-7/igt@kms_vrr@lobf.html
    - shard-mtlp:         [SKIP][641] ([i915#17031]) -> [SKIP][642] ([i915#11920])
   [641]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19136/shard-mtlp-7/igt@kms_vrr@lobf.html
   [642]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_162622v6/shard-mtlp-6/igt@kms_vrr@lobf.html

  * igt@prime_vgem@basic-write:
    - shard-mtlp:         [SKIP][643] ([i915#17031]) -> [SKIP][644] ([i915#10216] / [i915#3708])
   [643]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19136/shard-mtlp-7/igt@prime_vgem@basic-write.html
   [644]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_162622v6/shard-mtlp-5/igt@prime_vgem@basic-write.html

  
  [i915#10055]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/10055
  [i915#10216]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/10216
  [i915#10307]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/10307
  [i915#10434]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/10434
  [i915#1072]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/1072
  [i915#1099]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/1099
  [i915#11151]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11151
  [i915#11520]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11520
  [i915#11614]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11614
  [i915#118]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/118
  [i915#1187]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/1187
  [i915#11920]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11920
  [i915#12193]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12193
  [i915#12313]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12313
  [i915#12316]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12316
  [i915#12343]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12343
  [i915#12358]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12358
  [i915#12454]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12454
  [i915#1257]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/1257
  [i915#12712]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12712
  [i915#12713]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12713
  [i915#12745]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12745
  [i915#12755]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12755
  [i915#12761]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12761
  [i915#13027]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13027
  [i915#13029]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13029
  [i915#13049]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13049
  [i915#13179]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13179
  [i915#13356]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13356
  [i915#13390]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13390
  [i915#13398]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13398
  [i915#13520]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13520
  [i915#13566]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13566
  [i915#13688]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13688
  [i915#13691]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13691
  [i915#13749]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13749
  [i915#13786]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13786
  [i915#13790]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13790
  [i915#13820]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13820
  [i915#13958]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13958
  [i915#14098]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14098
  [i915#14118]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14118
  [i915#14152]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14152
  [i915#14259]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14259
  [i915#14498]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14498
  [i915#14544]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544
  [i915#14545]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14545
  [i915#14712]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14712
  [i915#14888]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14888
  [i915#15073]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15073
  [i915#15102]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15102
  [i915#15104]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15104
  [i915#15106]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15106
  [i915#15140]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15140
  [i915#15329]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15329
  [i915#15330]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15330
  [i915#15342]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15342
  [i915#15403]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15403
  [i915#15436]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15436
  [i915#15458]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15458
  [i915#15459]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15459
  [i915#15460]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15460
  [i915#15638]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15638
  [i915#15643]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15643
  [i915#15656]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15656
  [i915#15709]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15709
  [i915#15722]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15722
  [i915#15778]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15778
  [i915#15815]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15815
  [i915#15865]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15865
  [i915#15867]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15867
  [i915#15912]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15912
  [i915#15913]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15913
  [i915#15948]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15948
  [i915#15949]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15949
  [i915#15989]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15989
  [i915#15990]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15990
  [i915#15991]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15991
  [i915#16021]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16021
  [i915#16056]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16056
  [i915#16079]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16079
  [i915#16081]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16081
  [i915#16109]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16109
  [i915#16112]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16112
  [i915#16119]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16119
  [i915#16168]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16168
  [i915#16182]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16182
  [i915#16236]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16236
  [i915#16348]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16348
  [i915#16349]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16349
  [i915#16361]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16361
  [i915#16386]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16386
  [i915#16451]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16451
  [i915#16464]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16464
  [i915#16471]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16471
  [i915#16490]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16490
  [i915#16593]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16593
  [i915#16599]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16599
  [i915#16600]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16600
  [i915#16644]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16644
  [i915#16685]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16685
  [i915#16837]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16837
  [i915#16866]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16866
  [i915#16870]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16870
  [i915#16876]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16876
  [i915#16914]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16914
  [i915#16932]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16932
  [i915#17016]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17016
  [i915#17031]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17031
  [i915#17032]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17032
  [i915#17038]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17038
  [i915#17048]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17048
  [i915#17052]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17052
  [i915#17053]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17053
  [i915#1769]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/1769
  [i915#1825]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/1825
  [i915#2065]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2065
  [i915#2527]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2527
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
  [i915#3323]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3323
  [i915#3539]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3539
  [i915#3555]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3555
  [i915#3582]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3582
  [i915#3637]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3637
  [i915#3638]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3638
  [i915#3708]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3708
  [i915#3742]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3742
  [i915#3804]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3804
  [i915#3828]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3828
  [i915#3936]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3936
  [i915#4077]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4077
  [i915#4079]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4079
  [i915#4083]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4083
  [i915#4103]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4103
  [i915#4212]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4212
  [i915#4213]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4213
  [i915#4270]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4270
  [i915#4387]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4387
  [i915#4423]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4423
  [i915#4525]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4525
  [i915#4538]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4538
  [i915#4565]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4565
  [i915#4613]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4613
  [i915#4812]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4812
  [i915#4817]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4817
  [i915#4818]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4818
  [i915#4839]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4839
  [i915#4852]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4852
  [i915#4879]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4879
  [i915#4880]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4880
  [i915#5030]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5030
  [i915#5286]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5286
  [i915#5289]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5289
  [i915#5354]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5354
  [i915#5439]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5439
  [i915#6095]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6095
  [i915#6113]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6113
  [i915#6187]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6187
  [i915#6230]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6230
  [i915#6245]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6245
  [i915#6301]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6301
  [i915#6524]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6524
  [i915#6590]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6590
  [i915#6953]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6953
  [i915#7276]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/7276
  [i915#7697]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/7697
  [i915#7828]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/7828
  [i915#7882]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/7882
  [i915#8063]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8063
  [i915#8228]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8228
  [i915#8381]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8381
  [i915#8399]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8399
  [i915#8430]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8430
  [i915#8555]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8555
  [i915#8562]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8562
  [i915#8623]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8623
  [i915#8708]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8708
  [i915#8808]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8808
  [i915#8809]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8809
  [i915#8810]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8810
  [i915#8813]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8813
  [i915#8814]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8814
  [i915#9041]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9041
  [i915#9067]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9067
  [i915#9323]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9323
  [i915#9340]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9340
  [i915#9433]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9433
  [i915#9531]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9531
  [i915#9561]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9561
  [i915#9683]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9683
  [i915#9685]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9685
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

  * Linux: CI_DRM_19136 -> Patchwork_162622v6

  CI-20190529: 20190529
  CI_DRM_19136: d0f49187686a810b5b83216805c07814ad7542dc @ git://anongit.freedesktop.org/gfx-ci/linux
  IGT_9093: 932327f15c92ecb52266ced8c0fbe72931a75880 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
  Patchwork_162622v6: d0f49187686a810b5b83216805c07814ad7542dc @ git://anongit.freedesktop.org/gfx-ci/linux
  piglit_4509: fdc5a4ca11124ab8413c7988896eec4c97336694 @ git://anongit.freedesktop.org/piglit

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_162622v6/index.html

--===============3835599521299158966==
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
<tr><td><b>Series:</b></td><td>Add support for Common SDP Transmission Line (rev6)</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/162622/">https://patchwork.freedesktop.org/series/162622/</a></td></tr>
<tr><td><b>State:</b></td><td>failure</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_162622v6/index.html">https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_162622v6/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from CI_DRM_19136_full -&gt; Patchwork_162622v6_full</h1>
<h2>Summary</h2>
<p><strong>FAILURE</strong></p>
<p>Serious unknown changes coming with Patchwork_162622v6_full absolutely need to be<br />
  verified manually.</p>
<p>If you think the reported changes have nothing to do with the changes<br />
  introduced in Patchwork_162622v6_full, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them<br />
  to document this new failure mode, which will reduce false positives in CI.</p>
<h2>Participating hosts (10 -&gt; 10)</h2>
<p>No changes in participating hosts</p>
<h2>Possible new issues</h2>
<p>Here are the unknown changes that may have been introduced in Patchwork_162622v6_full:</p>
<h3>IGT changes</h3>
<h4>Possible regressions</h4>
<ul>
<li>igt@kms_flip@flip-vs-suspend-interruptible:<ul>
<li>shard-mtlp:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19136/shard-mtlp-2/igt@kms_flip@flip-vs-suspend-interruptible.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_162622v6/shard-mtlp-2/igt@kms_flip@flip-vs-suspend-interruptible.html">ABORT</a> +1 other test abort</li>
</ul>
</li>
</ul>
<h2>Known issues</h2>
<p>Here are the changes found in Patchwork_162622v6_full that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>
<p>igt@gem_bad_reloc@negative-reloc-lut:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_162622v6/shard-rkl-5/igt@gem_bad_reloc@negative-reloc-lut.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3281">i915#3281</a>) +6 other tests skip</li>
</ul>
</li>
<li>
<p>igt@gem_busy@semaphore:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_162622v6/shard-dg1-18/igt@gem_busy@semaphore.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3936">i915#3936</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_ccs@block-multicopy-compressed:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_162622v6/shard-tglu-3/igt@gem_ccs@block-multicopy-compressed.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9323">i915#9323</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_ccs@ctrl-surf-copy:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_162622v6/shard-dg1-14/igt@gem_ccs@ctrl-surf-copy.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3555">i915#3555</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9323">i915#9323</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_ccs@suspend-resume:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_162622v6/shard-dg2-4/igt@gem_ccs@suspend-resume.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13356">i915#13356</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16348">i915#16348</a>) +1 other test incomplete</li>
</ul>
</li>
<li>
<p>igt@gem_close_race@multigpu-basic-process:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_162622v6/shard-rkl-4/igt@gem_close_race@multigpu-basic-process.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/7697">i915#7697</a>)</li>
<li>shard-tglu-1:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_162622v6/shard-tglu-1/igt@gem_close_race@multigpu-basic-process.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/7697">i915#7697</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_close_race@multigpu-basic-threads:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_162622v6/shard-tglu-7/igt@gem_close_race@multigpu-basic-threads.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/7697">i915#7697</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_create@create-ext-set-pat:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_162622v6/shard-rkl-2/igt@gem_create@create-ext-set-pat.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8562">i915#8562</a>)</li>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_162622v6/shard-tglu-4/igt@gem_create@create-ext-set-pat.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8562">i915#8562</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_ctx_freq@sysfs@gt0:</p>
<ul>
<li>shard-dg2:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19136/shard-dg2-3/igt@gem_ctx_freq@sysfs@gt0.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_162622v6/shard-dg2-8/igt@gem_ctx_freq@sysfs@gt0.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9561">i915#9561</a>) +1 other test fail</li>
</ul>
</li>
<li>
<p>igt@gem_ctx_isolation@preservation-s3:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19136/shard-rkl-8/igt@gem_ctx_isolation@preservation-s3.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_162622v6/shard-rkl-6/igt@gem_ctx_isolation@preservation-s3.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13356">i915#13356</a>) +2 other tests incomplete</li>
</ul>
</li>
<li>
<p>igt@gem_ctx_persistence@heartbeat-stop:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_162622v6/shard-dg1-14/igt@gem_ctx_persistence@heartbeat-stop.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8555">i915#8555</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_ctx_persistence@legacy-engines-queued:</p>
<ul>
<li>shard-snb:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_162622v6/shard-snb4/igt@gem_ctx_persistence@legacy-engines-queued.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/1099">i915#1099</a>) +6 other tests skip</li>
</ul>
</li>
<li>
<p>igt@gem_ctx_sseu@invalid-args:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_162622v6/shard-dg1-14/igt@gem_ctx_sseu@invalid-args.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/280">i915#280</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@gem_ctx_sseu@invalid-sseu:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_162622v6/shard-tglu-7/igt@gem_ctx_sseu@invalid-sseu.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/280">i915#280</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_ctx_sseu@mmap-args:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_162622v6/shard-rkl-4/igt@gem_ctx_sseu@mmap-args.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/280">i915#280</a>)</li>
<li>shard-tglu-1:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_162622v6/shard-tglu-1/igt@gem_ctx_sseu@mmap-args.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/280">i915#280</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_eio@in-flight-suspend:</p>
<ul>
<li>shard-glk11:        NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_162622v6/shard-glk11/igt@gem_eio@in-flight-suspend.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13390">i915#13390</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_eio@kms:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_162622v6/shard-rkl-5/igt@gem_eio@kms.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16837">i915#16837</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_exec_balancer@parallel-balancer:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_162622v6/shard-rkl-4/igt@gem_exec_balancer@parallel-balancer.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4525">i915#4525</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@gem_exec_balancer@parallel-contexts:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_162622v6/shard-tglu-8/igt@gem_exec_balancer@parallel-contexts.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4525">i915#4525</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@gem_exec_fence@submit3:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_162622v6/shard-dg1-14/igt@gem_exec_fence@submit3.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4812">i915#4812</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_exec_flush@basic-uc-ro-default:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_162622v6/shard-dg1-14/igt@gem_exec_flush@basic-uc-ro-default.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3539">i915#3539</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4852">i915#4852</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@gem_exec_reloc@basic-write-read-noreloc:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_162622v6/shard-dg1-14/igt@gem_exec_reloc@basic-write-read-noreloc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3281">i915#3281</a>) +10 other tests skip</li>
</ul>
</li>
<li>
<p>igt@gem_exec_schedule@semaphore-power:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_162622v6/shard-rkl-4/igt@gem_exec_schedule@semaphore-power.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/7276">i915#7276</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_lmem_swapping@heavy-verify-random:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_162622v6/shard-rkl-5/igt@gem_lmem_swapping@heavy-verify-random.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4613">i915#4613</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@gem_lmem_swapping@parallel-random-verify:</p>
<ul>
<li>shard-tglu-1:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_162622v6/shard-tglu-1/igt@gem_lmem_swapping@parallel-random-verify.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4613">i915#4613</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@gem_lmem_swapping@smem-oom:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_162622v6/shard-tglu-7/igt@gem_lmem_swapping@smem-oom.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4613">i915#4613</a>) +3 other tests skip</li>
<li>shard-glk:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_162622v6/shard-glk6/igt@gem_lmem_swapping@smem-oom.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4613">i915#4613</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_lmem_swapping@verify-random-ccs:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_162622v6/shard-dg1-18/igt@gem_lmem_swapping@verify-random-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12193">i915#12193</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@gem_lmem_swapping@verify-random-ccs@lmem0:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_162622v6/shard-dg1-18/igt@gem_lmem_swapping@verify-random-ccs@lmem0.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4565">i915#4565</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@gem_media_vme:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_162622v6/shard-dg1-14/igt@gem_media_vme.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/284">i915#284</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_mmap_wc@write-wc-read-gtt:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_162622v6/shard-dg1-17/igt@gem_mmap_wc@write-wc-read-gtt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4083">i915#4083</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@gem_partial_pwrite_pread@writes-after-reads:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_162622v6/shard-dg1-17/igt@gem_partial_pwrite_pread@writes-after-reads.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3282">i915#3282</a>) +6 other tests skip</li>
</ul>
</li>
<li>
<p>igt@gem_pxp@hw-rejects-pxp-buffer:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_162622v6/shard-rkl-2/igt@gem_pxp@hw-rejects-pxp-buffer.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17053">i915#17053</a>)</li>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_162622v6/shard-tglu-4/igt@gem_pxp@hw-rejects-pxp-buffer.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13398">i915#13398</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_pxp@verify-pxp-execution-after-suspend-resume:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_162622v6/shard-dg2-6/igt@gem_pxp@verify-pxp-execution-after-suspend-resume.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4270">i915#4270</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_pxp@verify-pxp-stale-buf-execution:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_162622v6/shard-dg1-17/igt@gem_pxp@verify-pxp-stale-buf-execution.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4270">i915#4270</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_readwrite@beyond-eob:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_162622v6/shard-rkl-4/igt@gem_readwrite@beyond-eob.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3282">i915#3282</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@gem_set_tiling_vs_blt@tiled-to-tiled:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_162622v6/shard-dg2-6/igt@gem_set_tiling_vs_blt@tiled-to-tiled.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4079">i915#4079</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_tiled_pread_basic@basic:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_162622v6/shard-rkl-4/igt@gem_tiled_pread_basic@basic.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15656">i915#15656</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_tiled_swapping@non-threaded:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_162622v6/shard-dg1-14/igt@gem_tiled_swapping@non-threaded.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4077">i915#4077</a>) +7 other tests skip</li>
</ul>
</li>
<li>
<p>igt@gem_unfence_active_buffers:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_162622v6/shard-dg1-18/igt@gem_unfence_active_buffers.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4879">i915#4879</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_userptr_blits@create-destroy-unsync:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_162622v6/shard-dg1-17/igt@gem_userptr_blits@create-destroy-unsync.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3297">i915#3297</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@gem_userptr_blits@dmabuf-sync:</p>
<ul>
<li>shard-tglu-1:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_162622v6/shard-tglu-1/igt@gem_userptr_blits@dmabuf-sync.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3297">i915#3297</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3323">i915#3323</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_userptr_blits@dmabuf-unsync:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_162622v6/shard-rkl-2/igt@gem_userptr_blits@dmabuf-unsync.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3297">i915#3297</a>) +1 other test skip</li>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_162622v6/shard-tglu-4/igt@gem_userptr_blits@dmabuf-unsync.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3297">i915#3297</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@gem_userptr_blits@map-fixed-invalidate-overlap-busy:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_162622v6/shard-dg1-14/igt@gem_userptr_blits@map-fixed-invalidate-overlap-busy.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3297">i915#3297</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4880">i915#4880</a>)</li>
</ul>
</li>
<li>
<p>igt@gen9_exec_parse@basic-rejected:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_162622v6/shard-tglu-3/igt@gen9_exec_parse@basic-rejected.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2527">i915#2527</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2856">i915#2856</a>) +7 other tests skip</li>
</ul>
</li>
<li>
<p>igt@gen9_exec_parse@bb-start-out:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_162622v6/shard-rkl-4/igt@gen9_exec_parse@bb-start-out.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2527">i915#2527</a>) +1 other test skip</li>
<li>shard-tglu-1:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_162622v6/shard-tglu-1/igt@gen9_exec_parse@bb-start-out.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2527">i915#2527</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2856">i915#2856</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@gen9_exec_parse@secure-batches:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_162622v6/shard-dg1-17/igt@gen9_exec_parse@secure-batches.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2527">i915#2527</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@i915_drm_fdinfo@virtual-busy:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_162622v6/shard-dg1-14/igt@i915_drm_fdinfo@virtual-busy.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14118">i915#14118</a>)</li>
</ul>
</li>
<li>
<p>igt@i915_fb_tiling@basic-x-tiling:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_162622v6/shard-dg1-18/igt@i915_fb_tiling@basic-x-tiling.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13786">i915#13786</a>)</li>
</ul>
</li>
<li>
<p>igt@i915_module_load@fault-injection@intel_connector_register:</p>
<ul>
<li>shard-snb:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_162622v6/shard-snb1/igt@i915_module_load@fault-injection@intel_connector_register.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15342">i915#15342</a>) +1 other test abort</li>
</ul>
</li>
<li>
<p>igt@i915_module_load@fault-injection@intel_guc_ct_init:</p>
<ul>
<li>shard-snb:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_162622v6/shard-snb1/igt@i915_module_load@fault-injection@intel_guc_ct_init.html">SKIP</a> +529 other tests skip</li>
</ul>
</li>
<li>
<p>igt@i915_module_load@reload-no-display:</p>
<ul>
<li>shard-tglu-1:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_162622v6/shard-tglu-1/igt@i915_module_load@reload-no-display.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13029">i915#13029</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14545">i915#14545</a>)</li>
</ul>
</li>
<li>
<p>igt@i915_pm_freq_api@freq-suspend:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_162622v6/shard-tglu-3/igt@i915_pm_freq_api@freq-suspend.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8399">i915#8399</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@i915_pm_freq_mult@media-freq@gt0:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_162622v6/shard-dg1-17/igt@i915_pm_freq_mult@media-freq@gt0.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6590">i915#6590</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@i915_pm_rc6_residency@rc6-fence:</p>
<ul>
<li>shard-tglu-1:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_162622v6/shard-tglu-1/igt@i915_pm_rc6_residency@rc6-fence.html">WARN</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13790">i915#13790</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2681">i915#2681</a>) +1 other test warn</li>
</ul>
</li>
<li>
<p>igt@i915_pm_rc6_residency@rc6-idle:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_162622v6/shard-tglu-3/igt@i915_pm_rc6_residency@rc6-idle.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14498">i915#14498</a>)</li>
</ul>
</li>
<li>
<p>igt@i915_pm_sseu@full-enable:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_162622v6/shard-rkl-4/igt@i915_pm_sseu@full-enable.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4387">i915#4387</a>)</li>
</ul>
</li>
<li>
<p>igt@i915_query@hwconfig_table:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_162622v6/shard-dg1-17/igt@i915_query@hwconfig_table.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6245">i915#6245</a>)</li>
</ul>
</li>
<li>
<p>igt@i915_query@query-topology-known-pci-ids:</p>
<ul>
<li>shard-tglu-1:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_162622v6/shard-tglu-1/igt@i915_query@query-topology-known-pci-ids.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16109">i915#16109</a>)</li>
</ul>
</li>
<li>
<p>igt@i915_query@query-topology-unsupported:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_162622v6/shard-dg1-17/igt@i915_query@query-topology-unsupported.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16079">i915#16079</a>)</li>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_162622v6/shard-tglu-5/igt@i915_query@query-topology-unsupported.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16079">i915#16079</a>)</li>
</ul>
</li>
<li>
<p>igt@i915_suspend@basic-s3-without-i915:</p>
<ul>
<li>shard-glk:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_162622v6/shard-glk9/igt@i915_suspend@basic-s3-without-i915.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16182">i915#16182</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4817">i915#4817</a>)</li>
</ul>
</li>
<li>
<p>igt@i915_suspend@forcewake:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19136/shard-rkl-2/igt@i915_suspend@forcewake.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_162622v6/shard-rkl-1/igt@i915_suspend@forcewake.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15140">i915#15140</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_addfb_basic@bo-too-small-due-to-tiling:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_162622v6/shard-dg1-14/igt@kms_addfb_basic@bo-too-small-due-to-tiling.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4212">i915#4212</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_addfb_basic@invalid-smem-bo-on-discrete:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_162622v6/shard-tglu-7/igt@kms_addfb_basic@invalid-smem-bo-on-discrete.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12454">i915#12454</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12712">i915#12712</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_async_flips@alternate-sync-async-flip-atomic@pipe-c-hdmi-a-1:</p>
<ul>
<li>shard-glk:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19136/shard-glk6/igt@kms_async_flips@alternate-sync-async-flip-atomic@pipe-c-hdmi-a-1.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_162622v6/shard-glk2/igt@kms_async_flips@alternate-sync-async-flip-atomic@pipe-c-hdmi-a-1.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14888">i915#14888</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_async_flips@async-flip-suspend-resume:</p>
<ul>
<li>shard-glk11:        NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_162622v6/shard-glk11/igt@kms_async_flips@async-flip-suspend-resume.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12761">i915#12761</a>) +1 other test incomplete</li>
</ul>
</li>
<li>
<p>igt@kms_atomic@plane-primary-overlay-mutable-zpos:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_162622v6/shard-tglu-3/igt@kms_atomic@plane-primary-overlay-mutable-zpos.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9531">i915#9531</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_atomic_transition@plane-all-modeset-transition-fencing-internal-panels:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_162622v6/shard-tglu-4/igt@kms_atomic_transition@plane-all-modeset-transition-fencing-internal-panels.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/1769">i915#1769</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3555">i915#3555</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_atomic_transition@plane-toggle-modeset-transition@pipe-b-hdmi-a-1:</p>
<ul>
<li>shard-tglu:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19136/shard-tglu-7/igt@kms_atomic_transition@plane-toggle-modeset-transition@pipe-b-hdmi-a-1.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_162622v6/shard-tglu-8/igt@kms_atomic_transition@plane-toggle-modeset-transition@pipe-b-hdmi-a-1.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16866">i915#16866</a>) +1 other test abort</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@4-tiled-32bpp-rotate-270:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_162622v6/shard-rkl-5/igt@kms_big_fb@4-tiled-32bpp-rotate-270.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5286">i915#5286</a>) +5 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@4-tiled-addfb:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_162622v6/shard-dg1-17/igt@kms_big_fb@4-tiled-addfb.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5286">i915#5286</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@4-tiled-max-hw-stride-32bpp-rotate-0-async-flip:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_162622v6/shard-tglu-4/igt@kms_big_fb@4-tiled-max-hw-stride-32bpp-rotate-0-async-flip.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5286">i915#5286</a>) +8 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@4-tiled-max-hw-stride-32bpp-rotate-180-async-flip:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_162622v6/shard-dg1-18/igt@kms_big_fb@4-tiled-max-hw-stride-32bpp-rotate-180-async-flip.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4538">i915#4538</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5286">i915#5286</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@4-tiled-max-hw-stride-32bpp-rotate-180-hflip-async-flip:</p>
<ul>
<li>shard-tglu-1:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_162622v6/shard-tglu-1/igt@kms_big_fb@4-tiled-max-hw-stride-32bpp-rotate-180-hflip-async-flip.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5286">i915#5286</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@linear-32bpp-rotate-270:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_162622v6/shard-dg2-6/igt@kms_big_fb@linear-32bpp-rotate-270.html">SKIP</a> +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@linear-8bpp-rotate-270:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_162622v6/shard-dg1-18/igt@kms_big_fb@linear-8bpp-rotate-270.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3638">i915#3638</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@linear-max-hw-stride-32bpp-rotate-180-hflip:</p>
<ul>
<li>shard-tglu-1:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_162622v6/shard-tglu-1/igt@kms_big_fb@linear-max-hw-stride-32bpp-rotate-180-hflip.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3828">i915#3828</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@linear-max-hw-stride-64bpp-rotate-0-hflip:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_162622v6/shard-rkl-2/igt@kms_big_fb@linear-max-hw-stride-64bpp-rotate-0-hflip.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3828">i915#3828</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@linear-max-hw-stride-64bpp-rotate-180-hflip:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_162622v6/shard-tglu-3/igt@kms_big_fb@linear-max-hw-stride-64bpp-rotate-180-hflip.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3828">i915#3828</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@y-tiled-8bpp-rotate-90:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_162622v6/shard-rkl-2/igt@kms_big_fb@y-tiled-8bpp-rotate-90.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3638">i915#3638</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-180-async-flip:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_162622v6/shard-dg1-18/igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-180-async-flip.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4538">i915#4538</a>) +6 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@bad-aux-stride-yf-tiled-ccs@pipe-b-hdmi-a-2:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_162622v6/shard-rkl-6/igt@kms_ccs@bad-aux-stride-yf-tiled-ccs@pipe-b-hdmi-a-2.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6095">i915#6095</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@bad-pixel-format-4-tiled-mtl-mc-ccs@pipe-c-hdmi-a-1:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_162622v6/shard-rkl-2/igt@kms_ccs@bad-pixel-format-4-tiled-mtl-mc-ccs@pipe-c-hdmi-a-1.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14098">i915#14098</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6095">i915#6095</a>) +47 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@bad-pixel-format-y-tiled-gen12-rc-ccs-cc@pipe-a-edp-1:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_162622v6/shard-mtlp-5/igt@kms_ccs@bad-pixel-format-y-tiled-gen12-rc-ccs-cc@pipe-a-edp-1.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6095">i915#6095</a>) +39 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@bad-rotation-90-4-tiled-mtl-rc-ccs@pipe-c-hdmi-a-1:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_162622v6/shard-dg2-4/igt@kms_ccs@bad-rotation-90-4-tiled-mtl-rc-ccs@pipe-c-hdmi-a-1.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/10307">i915#10307</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6095">i915#6095</a>) +46 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@bad-rotation-90-4-tiled-mtl-rc-ccs@pipe-d-hdmi-a-1:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_162622v6/shard-dg2-4/igt@kms_ccs@bad-rotation-90-4-tiled-mtl-rc-ccs@pipe-d-hdmi-a-1.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/10307">i915#10307</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/10434">i915#10434</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6095">i915#6095</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-rotation-180-4-tiled-mtl-rc-ccs@pipe-b-hdmi-a-1:</p>
<ul>
<li>shard-tglu-1:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_162622v6/shard-tglu-1/igt@kms_ccs@crc-primary-rotation-180-4-tiled-mtl-rc-ccs@pipe-b-hdmi-a-1.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6095">i915#6095</a>) +34 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-rotation-180-4-tiled-mtl-rc-ccs@pipe-b-hdmi-a-2:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_162622v6/shard-rkl-4/igt@kms_ccs@crc-primary-rotation-180-4-tiled-mtl-rc-ccs@pipe-b-hdmi-a-2.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6095">i915#6095</a>) +75 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-suspend-4-tiled-dg2-mc-ccs:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_162622v6/shard-dg1-14/igt@kms_ccs@crc-primary-suspend-4-tiled-dg2-mc-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6095">i915#6095</a>) +187 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-suspend-y-tiled-gen12-rc-ccs@pipe-c-hdmi-a-1:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_162622v6/shard-dg2-4/igt@kms_ccs@crc-primary-suspend-y-tiled-gen12-rc-ccs@pipe-c-hdmi-a-1.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6095">i915#6095</a>) +7 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-sprite-planes-basic-4-tiled-lnl-ccs:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_162622v6/shard-dg1-14/igt@kms_ccs@crc-sprite-planes-basic-4-tiled-lnl-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12313">i915#12313</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-sprite-planes-basic-4-tiled-mtl-rc-ccs-cc@pipe-b-hdmi-a-1:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_162622v6/shard-tglu-7/igt@kms_ccs@crc-sprite-planes-basic-4-tiled-mtl-rc-ccs-cc@pipe-b-hdmi-a-1.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6095">i915#6095</a>) +94 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@missing-ccs-buffer-4-tiled-mtl-mc-ccs@pipe-c-hdmi-a-2:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_162622v6/shard-rkl-6/igt@kms_ccs@missing-ccs-buffer-4-tiled-mtl-mc-ccs@pipe-c-hdmi-a-2.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14098">i915#14098</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6095">i915#6095</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@random-ccs-data-4-tiled-bmg-ccs:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_162622v6/shard-rkl-5/igt@kms_ccs@random-ccs-data-4-tiled-bmg-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12313">i915#12313</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@random-ccs-data-4-tiled-lnl-ccs:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_162622v6/shard-tglu-8/igt@kms_ccs@random-ccs-data-4-tiled-lnl-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12313">i915#12313</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_cdclk@mode-transition:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_162622v6/shard-tglu-7/igt@kms_cdclk@mode-transition.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3742">i915#3742</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cdclk@plane-scaling:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_162622v6/shard-rkl-5/igt@kms_cdclk@plane-scaling.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3742">i915#3742</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cdclk@plane-scaling@pipe-c-edp-1:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_162622v6/shard-mtlp-8/igt@kms_cdclk@plane-scaling@pipe-c-edp-1.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17016">i915#17016</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_audio@hdmi-audio-after-suspend:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_162622v6/shard-dg1-18/igt@kms_chamelium_audio@hdmi-audio-after-suspend.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11151">i915#11151</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_color_pipeline@plane-lut1d-ctm3x4-lut1d:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_162622v6/shard-tglu-4/igt@kms_chamelium_color_pipeline@plane-lut1d-ctm3x4-lut1d.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16471">i915#16471</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_color_pipeline@plane-lut1d-pre-ctm3x4:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_162622v6/shard-rkl-4/igt@kms_chamelium_color_pipeline@plane-lut1d-pre-ctm3x4.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16471">i915#16471</a>)</li>
<li>shard-tglu-1:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_162622v6/shard-tglu-1/igt@kms_chamelium_color_pipeline@plane-lut1d-pre-ctm3x4.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16471">i915#16471</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_edid@hdmi-edid-stress-resolution-non-4k:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_162622v6/shard-rkl-2/igt@kms_chamelium_edid@hdmi-edid-stress-resolution-non-4k.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11151">i915#11151</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/7828">i915#7828</a>) +5 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_frames@dp-crc-single:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_162622v6/shard-tglu-4/igt@kms_chamelium_frames@dp-crc-single.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11151">i915#11151</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/7828">i915#7828</a>) +8 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_frames@hdmi-cmp-planar-formats:</p>
<ul>
<li>shard-tglu-1:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_162622v6/shard-tglu-1/igt@kms_chamelium_frames@hdmi-cmp-planar-formats.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11151">i915#11151</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/7828">i915#7828</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_frames@hdmi-crc-fast:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_162622v6/shard-dg1-14/igt@kms_chamelium_frames@hdmi-crc-fast.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11151">i915#11151</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/7828">i915#7828</a>) +6 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@atomic-dpms-hdcp14:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_162622v6/shard-rkl-2/igt@kms_content_protection@atomic-dpms-hdcp14.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15865">i915#15865</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@dp-mst-lic-type-0:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_162622v6/shard-tglu-3/igt@kms_content_protection@dp-mst-lic-type-0.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15330">i915#15330</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3116">i915#3116</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3299">i915#3299</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@dp-mst-lic-type-0-hdcp14:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_162622v6/shard-tglu-7/igt@kms_content_protection@dp-mst-lic-type-0-hdcp14.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15330">i915#15330</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@dp-mst-type-0-hdcp14:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_162622v6/shard-dg1-17/igt@kms_content_protection@dp-mst-type-0-hdcp14.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15330">i915#15330</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@dp-mst-type-1:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_162622v6/shard-rkl-4/igt@kms_content_protection@dp-mst-type-1.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15330">i915#15330</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3116">i915#3116</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@lic-type-0:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_162622v6/shard-tglu-4/igt@kms_content_protection@lic-type-0.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15865">i915#15865</a>) +6 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@mei-interface:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_162622v6/shard-dg1-14/igt@kms_content_protection@mei-interface.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15865">i915#15865</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@type1:</p>
<ul>
<li>shard-tglu-1:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_162622v6/shard-tglu-1/igt@kms_content_protection@type1.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15865">i915#15865</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-offscreen-512x512:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_162622v6/shard-dg1-17/igt@kms_cursor_crc@cursor-offscreen-512x512.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13049">i915#13049</a>) +1 other test skip</li>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_162622v6/shard-tglu-5/igt@kms_cursor_crc@cursor-offscreen-512x512.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13049">i915#13049</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-random-32x10:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_162622v6/shard-dg2-6/igt@kms_cursor_crc@cursor-random-32x10.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3555">i915#3555</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-random-512x170:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_162622v6/shard-rkl-4/igt@kms_cursor_crc@cursor-random-512x170.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13049">i915#13049</a>) +1 other test skip</li>
<li>shard-tglu-1:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_162622v6/shard-tglu-1/igt@kms_cursor_crc@cursor-random-512x170.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13049">i915#13049</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-rapid-movement-max-size:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_162622v6/shard-rkl-4/igt@kms_cursor_crc@cursor-rapid-movement-max-size.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3555">i915#3555</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-sliding-128x42:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19136/shard-rkl-6/igt@kms_cursor_crc@cursor-sliding-128x42.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_162622v6/shard-rkl-7/igt@kms_cursor_crc@cursor-sliding-128x42.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13566">i915#13566</a>) +1 other test fail</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-sliding-256x85:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_162622v6/shard-tglu-3/igt@kms_cursor_crc@cursor-sliding-256x85.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13566">i915#13566</a>) +1 other test fail</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-sliding-32x10:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_162622v6/shard-dg1-14/igt@kms_cursor_crc@cursor-sliding-32x10.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3555">i915#3555</a>) +6 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-sliding-64x21@pipe-a-hdmi-a-1:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_162622v6/shard-rkl-8/igt@kms_cursor_crc@cursor-sliding-64x21@pipe-a-hdmi-a-1.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13566">i915#13566</a>) +1 other test fail</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-suspend:</p>
<ul>
<li>shard-glk:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_162622v6/shard-glk8/igt@kms_cursor_crc@cursor-suspend.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12358">i915#12358</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14152">i915#14152</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/7882">i915#7882</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-suspend@pipe-a-hdmi-a-1:</p>
<ul>
<li>shard-glk:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_162622v6/shard-glk8/igt@kms_cursor_crc@cursor-suspend@pipe-a-hdmi-a-1.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12358">i915#12358</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14152">i915#14152</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_edge_walk@256x256-left-edge@pipe-d-hdmi-a-1:</p>
<ul>
<li>shard-tglu:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19136/shard-tglu-7/igt@kms_cursor_edge_walk@256x256-left-edge@pipe-d-hdmi-a-1.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_162622v6/shard-tglu-7/igt@kms_cursor_edge_walk@256x256-left-edge@pipe-d-hdmi-a-1.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16685">i915#16685</a>) +1 other test dmesg-warn</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@basic-busy-flip-before-cursor-legacy:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_162622v6/shard-dg1-14/igt@kms_cursor_legacy@basic-busy-flip-before-cursor-legacy.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4103">i915#4103</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@basic-busy-flip-before-cursor-varying-size:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_162622v6/shard-tglu-3/igt@kms_cursor_legacy@basic-busy-flip-before-cursor-varying-size.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4103">i915#4103</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@basic-flip-after-cursor-legacy:</p>
<ul>
<li>shard-mtlp:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19136/shard-mtlp-8/igt@kms_cursor_legacy@basic-flip-after-cursor-legacy.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_162622v6/shard-mtlp-7/igt@kms_cursor_legacy@basic-flip-after-cursor-legacy.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17031">i915#17031</a>) +55 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@modeset-atomic-cursor-hotspot:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_162622v6/shard-tglu-7/igt@kms_cursor_legacy@modeset-atomic-cursor-hotspot.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9067">i915#9067</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_dirtyfb@psr-dirtyfb-ioctl:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_162622v6/shard-rkl-4/igt@kms_dirtyfb@psr-dirtyfb-ioctl.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9723">i915#9723</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_display_modes@extended-mode-basic:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_162622v6/shard-tglu-3/igt@kms_display_modes@extended-mode-basic.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13691">i915#13691</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_dither@fb-8bpc-vs-panel-6bpc@pipe-a-hdmi-a-2:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_162622v6/shard-rkl-7/igt@kms_dither@fb-8bpc-vs-panel-6bpc@pipe-a-hdmi-a-2.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3804">i915#3804</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_dp_aux_dev@basic:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_162622v6/shard-tglu-4/igt@kms_dp_aux_dev@basic.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/1257">i915#1257</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_dp_link_training@non-uhbr-mst:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_162622v6/shard-rkl-4/igt@kms_dp_link_training@non-uhbr-mst.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13749">i915#13749</a>)</li>
<li>shard-tglu-1:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_162622v6/shard-tglu-1/igt@kms_dp_link_training@non-uhbr-mst.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13749">i915#13749</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_dp_linktrain_fallback@uhbr-to-hbr-fallback:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_162622v6/shard-tglu-3/igt@kms_dp_linktrain_fallback@uhbr-to-hbr-fallback.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16870">i915#16870</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_dsc@dsc-fractional-bpp-ultrajoiner:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_162622v6/shard-rkl-2/igt@kms_dsc@dsc-fractional-bpp-ultrajoiner.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16361">i915#16361</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_dsc@dsc-with-bpc-formats-ultrajoiner:</p>
<ul>
<li>shard-tglu-1:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_162622v6/shard-tglu-1/igt@kms_dsc@dsc-with-bpc-formats-ultrajoiner.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16361">i915#16361</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_dsc@dsc-with-formats:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_162622v6/shard-tglu-3/igt@kms_dsc@dsc-with-formats.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16361">i915#16361</a>) +5 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_dsc@dsc-with-output-formats-bigjoiner:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_162622v6/shard-dg1-14/igt@kms_dsc@dsc-with-output-formats-bigjoiner.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16361">i915#16361</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_feature_discovery@chamelium:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_162622v6/shard-tglu-4/igt@kms_feature_discovery@chamelium.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2065">i915#2065</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_feature_discovery@display-2x:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_162622v6/shard-tglu-3/igt@kms_feature_discovery@display-2x.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16081">i915#16081</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_feature_discovery@display-3x:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_162622v6/shard-dg1-18/igt@kms_feature_discovery@display-3x.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16081">i915#16081</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_feature_discovery@dp-mst:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_162622v6/shard-dg1-14/igt@kms_feature_discovery@dp-mst.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16599">i915#16599</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_feature_discovery@dsc:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_162622v6/shard-tglu-8/igt@kms_feature_discovery@dsc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16600">i915#16600</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_feature_discovery@vrr:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_162622v6/shard-dg1-17/igt@kms_feature_discovery@vrr.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16600">i915#16600</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-fences:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_162622v6/shard-dg1-14/igt@kms_flip@2x-flip-vs-fences.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8381">i915#8381</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-suspend-interruptible:</p>
<ul>
<li>shard-glk:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_162622v6/shard-glk6/igt@kms_flip@2x-flip-vs-suspend-interruptible.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12745">i915#12745</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4839">i915#4839</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-suspend-interruptible@ac-hdmi-a1-hdmi-a2:</p>
<ul>
<li>shard-glk:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_162622v6/shard-glk6/igt@kms_flip@2x-flip-vs-suspend-interruptible@ac-hdmi-a1-hdmi-a2.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12745">i915#12745</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-modeset-vs-vblank-race:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_162622v6/shard-rkl-5/igt@kms_flip@2x-modeset-vs-vblank-race.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9934">i915#9934</a>) +5 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-plain-flip-interruptible:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_162622v6/shard-dg1-14/igt@kms_flip@2x-plain-flip-interruptible.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9934">i915#9934</a>) +6 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-wf_vblank-ts-check:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_162622v6/shard-tglu-3/igt@kms_flip@2x-wf_vblank-ts-check.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3637">i915#3637</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9934">i915#9934</a>) +12 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-wf_vblank-ts-check-interruptible:</p>
<ul>
<li>shard-tglu-1:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_162622v6/shard-tglu-1/igt@kms_flip@2x-wf_vblank-ts-check-interruptible.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3637">i915#3637</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9934">i915#9934</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@dpms-vs-vblank-race-interruptible@d-hdmi-a4:</p>
<ul>
<li>shard-dg1:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19136/shard-dg1-16/igt@kms_flip@dpms-vs-vblank-race-interruptible@d-hdmi-a4.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_162622v6/shard-dg1-17/igt@kms_flip@dpms-vs-vblank-race-interruptible@d-hdmi-a4.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16876">i915#16876</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16932">i915#16932</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-suspend:</p>
<ul>
<li>shard-glk10:        NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_162622v6/shard-glk10/igt@kms_flip@flip-vs-suspend.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12745">i915#12745</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4839">i915#4839</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-suspend@a-hdmi-a1:</p>
<ul>
<li>shard-glk10:        NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_162622v6/shard-glk10/igt@kms_flip@flip-vs-suspend@a-hdmi-a1.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12745">i915#12745</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-32bpp-4tile-to-64bpp-4tile-downscaling:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_162622v6/shard-rkl-4/igt@kms_flip_scaled_crc@flip-32bpp-4tile-to-64bpp-4tile-downscaling.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15643">i915#15643</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-32bpp-xtile-to-64bpp-xtile-downscaling@pipe-a-default-mode:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_162622v6/shard-mtlp-6/igt@kms_flip_scaled_crc@flip-32bpp-xtile-to-64bpp-xtile-downscaling@pipe-a-default-mode.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3555">i915#3555</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8810">i915#8810</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8813">i915#8813</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytileccs-upscaling:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_162622v6/shard-dg1-17/igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytileccs-upscaling.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15643">i915#15643</a>) +5 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-16bpp-4tile-downscaling:</p>
<ul>
<li>shard-tglu-1:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_162622v6/shard-tglu-1/igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-16bpp-4tile-downscaling.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15643">i915#15643</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-32bpp-yftile-upscaling:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_162622v6/shard-tglu-4/igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-32bpp-yftile-upscaling.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15643">i915#15643</a>) +6 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-2p-primscrn-pri-shrfb-draw-mmap-gtt:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_162622v6/shard-rkl-4/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-pri-shrfb-draw-mmap-gtt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/1825">i915#1825</a>) +7 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-2p-primscrn-spr-indfb-fullscreen:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_162622v6/shard-dg1-14/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-spr-indfb-fullscreen.html">SKIP</a> +79 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-tiling-4:</p>
<ul>
<li>shard-tglu-1:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_162622v6/shard-tglu-1/igt@kms_frontbuffer_tracking@fbc-tiling-4.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5439">i915#5439</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbchdr-1p-primscrn-cur-indfb-onoff:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19136/shard-rkl-6/igt@kms_frontbuffer_tracking@fbchdr-1p-primscrn-cur-indfb-onoff.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_162622v6/shard-rkl-7/igt@kms_frontbuffer_tracking@fbchdr-1p-primscrn-cur-indfb-onoff.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15989">i915#15989</a>) +13 other tests skip</li>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_162622v6/shard-dg1-14/igt@kms_frontbuffer_tracking@fbchdr-1p-primscrn-cur-indfb-onoff.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15989">i915#15989</a>) +13 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbchdr-1p-primscrn-pri-shrfb-draw-pwrite:</p>
<ul>
<li>shard-glk:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19136/shard-glk8/igt@kms_frontbuffer_tracking@fbchdr-1p-primscrn-pri-shrfb-draw-pwrite.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_162622v6/shard-glk5/igt@kms_frontbuffer_tracking@fbchdr-1p-primscrn-pri-shrfb-draw-pwrite.html">SKIP</a></li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbchdr-1p-rte:</p>
<ul>
<li>shard-tglu-1:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_162622v6/shard-tglu-1/igt@kms_frontbuffer_tracking@fbchdr-1p-rte.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15989">i915#15989</a>) +9 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbchdr-tiling-4:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_162622v6/shard-tglu-7/igt@kms_frontbuffer_tracking@fbchdr-tiling-4.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5439">i915#5439</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-1p-offscreen-pri-shrfb-draw-mmap-gtt:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_162622v6/shard-dg2-6/igt@kms_frontbuffer_tracking@fbcpsr-1p-offscreen-pri-shrfb-draw-mmap-gtt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15104">i915#15104</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15990">i915#15990</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-shrfb-plflip-blt:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_162622v6/shard-dg2-6/igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-shrfb-plflip-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15102">i915#15102</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-pri-indfb-draw-blt:</p>
<ul>
<li>shard-glk10:        NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_162622v6/shard-glk10/igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-pri-indfb-draw-blt.html">SKIP</a> +213 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-spr-indfb-fullscreen:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_162622v6/shard-tglu-4/igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-spr-indfb-fullscreen.html">SKIP</a> +148 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-rgb101010-draw-blt:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_162622v6/shard-dg1-17/igt@kms_frontbuffer_tracking@fbcpsr-rgb101010-draw-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15102">i915#15102</a>) +33 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsrhdr-2p-primscrn-spr-indfb-draw-pwrite:</p>
<ul>
<li>shard-glk11:        NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_162622v6/shard-glk11/igt@kms_frontbuffer_tracking@fbcpsrhdr-2p-primscrn-spr-indfb-draw-pwrite.html">SKIP</a> +79 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsrhdr-2p-scndscrn-indfb-msflip-blt:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_162622v6/shard-rkl-4/igt@kms_frontbuffer_tracking@fbcpsrhdr-2p-scndscrn-indfb-msflip-blt.html">SKIP</a> +62 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsrhdr-suspend:</p>
<ul>
<li>shard-tglu-1:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_162622v6/shard-tglu-1/igt@kms_frontbuffer_tracking@fbcpsrhdr-suspend.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15102">i915#15102</a>) +21 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@hdr-1p-offscreen-pri-indfb-draw-mmap-gtt:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_162622v6/shard-dg1-14/igt@kms_frontbuffer_tracking@hdr-1p-offscreen-pri-indfb-draw-mmap-gtt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15990">i915#15990</a>) +21 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@hdr-1p-offscreen-pri-shrfb-draw-mmap-gtt:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_162622v6/shard-tglu-4/igt@kms_frontbuffer_tracking@hdr-1p-offscreen-pri-shrfb-draw-mmap-gtt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15989">i915#15989</a>) +30 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@hdr-1p-primscrn-spr-indfb-draw-render:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_162622v6/shard-dg2-6/igt@kms_frontbuffer_tracking@hdr-1p-primscrn-spr-indfb-draw-render.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15989">i915#15989</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@hdr-rgb565-draw-pwrite:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_162622v6/shard-rkl-5/igt@kms_frontbuffer_tracking@hdr-rgb565-draw-pwrite.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15989">i915#15989</a>) +9 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@pipe-fbc-rte:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_162622v6/shard-tglu-8/igt@kms_frontbuffer_tracking@pipe-fbc-rte.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9766">i915#9766</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-1p-offscreen-pri-indfb-draw-mmap-wc:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_162622v6/shard-dg1-17/igt@kms_frontbuffer_tracking@psr-1p-offscreen-pri-indfb-draw-mmap-wc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15104">i915#15104</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15990">i915#15990</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-1p-primscrn-pri-shrfb-draw-mmap-gtt:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_162622v6/shard-dg1-18/igt@kms_frontbuffer_tracking@psr-1p-primscrn-pri-shrfb-draw-mmap-gtt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15990">i915#15990</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8708">i915#8708</a>) +15 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-rgb101010-draw-mmap-gtt:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_162622v6/shard-dg2-6/igt@kms_frontbuffer_tracking@psr-rgb101010-draw-mmap-gtt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15990">i915#15990</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8708">i915#8708</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-shrfb-scaledprimary:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_162622v6/shard-tglu-8/igt@kms_frontbuffer_tracking@psr-shrfb-scaledprimary.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15102">i915#15102</a>) +70 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psrhdr-2p-scndscrn-cur-indfb-draw-mmap-cpu:</p>
<ul>
<li>shard-tglu-1:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_162622v6/shard-tglu-1/igt@kms_frontbuffer_tracking@psrhdr-2p-scndscrn-cur-indfb-draw-mmap-cpu.html">SKIP</a> +52 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psrhdr-2p-scndscrn-spr-indfb-draw-mmap-cpu:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_162622v6/shard-dg2-6/igt@kms_frontbuffer_tracking@psrhdr-2p-scndscrn-spr-indfb-draw-mmap-cpu.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15991">i915#15991</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psrhdr-rgb101010-draw-blt:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_162622v6/shard-rkl-4/igt@kms_frontbuffer_tracking@psrhdr-rgb101010-draw-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15102">i915#15102</a>) +33 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_hdr@bpc-switch:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19136/shard-rkl-6/igt@kms_hdr@bpc-switch.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_162622v6/shard-rkl-4/igt@kms_hdr@bpc-switch.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16644">i915#16644</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3555">i915#3555</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8228">i915#8228</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_hdr@bpc-switch-dpms:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_162622v6/shard-tglu-8/igt@kms_hdr@bpc-switch-dpms.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3555">i915#3555</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8228">i915#8228</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_hdr@invalid-metadata-sizes:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_162622v6/shard-rkl-5/igt@kms_hdr@invalid-metadata-sizes.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16644">i915#16644</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3555">i915#3555</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8228">i915#8228</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_hdr@static-swap:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_162622v6/shard-dg1-14/igt@kms_hdr@static-swap.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3555">i915#3555</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8228">i915#8228</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_hdr@static-toggle-suspend:</p>
<ul>
<li>shard-tglu-1:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_162622v6/shard-tglu-1/igt@kms_hdr@static-toggle-suspend.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3555">i915#3555</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8228">i915#8228</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_hdr@static-toggle-suspend@pipe-a-hdmi-a-2-xrgb2101010:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_162622v6/shard-rkl-6/igt@kms_hdr@static-toggle-suspend@pipe-a-hdmi-a-2-xrgb2101010.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15436">i915#15436</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_joiner@basic-big-joiner:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_162622v6/shard-tglu-3/igt@kms_joiner@basic-big-joiner.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15460">i915#15460</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_joiner@basic-force-big-joiner:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_162622v6/shard-rkl-4/igt@kms_joiner@basic-force-big-joiner.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15459">i915#15459</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_joiner@basic-force-ultra-joiner:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_162622v6/shard-tglu-4/igt@kms_joiner@basic-force-ultra-joiner.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15458">i915#15458</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_joiner@basic-max-non-joiner:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_162622v6/shard-dg1-17/igt@kms_joiner@basic-max-non-joiner.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13688">i915#13688</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_joiner@invalid-modeset-force-big-joiner:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_162622v6/shard-dg1-14/igt@kms_joiner@invalid-modeset-force-big-joiner.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15459">i915#15459</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_joiner@invalid-modeset-ultra-joiner:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_162622v6/shard-dg1-14/igt@kms_joiner@invalid-modeset-ultra-joiner.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15458">i915#15458</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_legacy_colorkey@invalid-plane:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_162622v6/shard-dg1-14/igt@kms_legacy_colorkey@invalid-plane.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4423">i915#4423</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_mst@mst-suspend-read-crc:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_162622v6/shard-tglu-8/igt@kms_mst@mst-suspend-read-crc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16451">i915#16451</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_panel_fitting@atomic-fastset:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_162622v6/shard-tglu-4/igt@kms_panel_fitting@atomic-fastset.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6301">i915#6301</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_panel_fitting@legacy:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_162622v6/shard-rkl-4/igt@kms_panel_fitting@legacy.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6301">i915#6301</a>)</li>
<li>shard-tglu-1:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_162622v6/shard-tglu-1/igt@kms_panel_fitting@legacy.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6301">i915#6301</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pipe_stress@stress-xrgb8888-4tiled:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_162622v6/shard-dg1-17/igt@kms_pipe_stress@stress-xrgb8888-4tiled.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14712">i915#14712</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pipe_stress@stress-xrgb8888-yftiled:</p>
<ul>
<li>shard-tglu-1:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_162622v6/shard-tglu-1/igt@kms_pipe_stress@stress-xrgb8888-yftiled.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14712">i915#14712</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pipe_stress@stress-xrgb8888-ytiled:</p>
<ul>
<li>shard-glk:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_162622v6/shard-glk6/igt@kms_pipe_stress@stress-xrgb8888-ytiled.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/118">i915#118</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane@pixel-format-4-tiled-dg2-rc-ccs-cc-modifier:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_162622v6/shard-tglu-8/igt@kms_plane@pixel-format-4-tiled-dg2-rc-ccs-cc-modifier.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15709">i915#15709</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_plane@pixel-format-4-tiled-modifier@pipe-b-plane-5:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_162622v6/shard-mtlp-3/igt@kms_plane@pixel-format-4-tiled-modifier@pipe-b-plane-5.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16386">i915#16386</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_plane@pixel-format-4-tiled-mtl-mc-ccs-modifier:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_162622v6/shard-rkl-4/igt@kms_plane@pixel-format-4-tiled-mtl-mc-ccs-modifier.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15709">i915#15709</a>) +2 other tests skip</li>
<li>shard-tglu-1:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_162622v6/shard-tglu-1/igt@kms_plane@pixel-format-4-tiled-mtl-mc-ccs-modifier.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15709">i915#15709</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_plane@pixel-format-x-tiled-modifier@pipe-a-plane-7:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_162622v6/shard-tglu-3/igt@kms_plane@pixel-format-x-tiled-modifier@pipe-a-plane-7.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16386">i915#16386</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_plane@pixel-format-y-tiled-gen12-mc-ccs-modifier-source-clamping:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_162622v6/shard-dg1-14/igt@kms_plane@pixel-format-y-tiled-gen12-mc-ccs-modifier-source-clamping.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15709">i915#15709</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_plane@pixel-format-y-tiled-gen12-rc-ccs-cc-modifier-source-clamping:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_162622v6/shard-dg2-6/igt@kms_plane@pixel-format-y-tiled-gen12-rc-ccs-cc-modifier-source-clamping.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15709">i915#15709</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane@pixel-format-y-tiled-gen12-rc-ccs-modifier@pipe-a-plane-7:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_162622v6/shard-dg1-17/igt@kms_plane@pixel-format-y-tiled-gen12-rc-ccs-modifier@pipe-a-plane-7.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16386">i915#16386</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_plane@planar-pixel-format-settings@nv12-tile4-src-y:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_162622v6/shard-tglu-3/igt@kms_plane@planar-pixel-format-settings@nv12-tile4-src-y.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16112">i915#16112</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane_cursor@viewport@pipe-a-hdmi-a-2-size-256:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19136/shard-rkl-6/igt@kms_plane_cursor@viewport@pipe-a-hdmi-a-2-size-256.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_162622v6/shard-rkl-7/igt@kms_plane_cursor@viewport@pipe-a-hdmi-a-2-size-256.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15913">i915#15913</a>) +1 other test fail</li>
</ul>
</li>
<li>
<p>igt@kms_plane_cursor@viewport@pipe-a-hdmi-a-2-size-64:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19136/shard-rkl-6/igt@kms_plane_cursor@viewport@pipe-a-hdmi-a-2-size-64.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_162622v6/shard-rkl-7/igt@kms_plane_cursor@viewport@pipe-a-hdmi-a-2-size-64.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15912">i915#15912</a>) +1 other test fail</li>
</ul>
</li>
<li>
<p>igt@kms_plane_multiple@2x-tiling-none:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_162622v6/shard-tglu-7/igt@kms_plane_multiple@2x-tiling-none.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13958">i915#13958</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane_multiple@2x-tiling-y:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_162622v6/shard-rkl-4/igt@kms_plane_multiple@2x-tiling-y.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13958">i915#13958</a>)</li>
<li>shard-tglu-1:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_162622v6/shard-tglu-1/igt@kms_plane_multiple@2x-tiling-y.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13958">i915#13958</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane_multiple@2x-tiling-yf:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_162622v6/shard-dg1-14/igt@kms_plane_multiple@2x-tiling-yf.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13958">i915#13958</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_plane_multiple@tiling-yf:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_162622v6/shard-rkl-2/igt@kms_plane_multiple@tiling-yf.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14259">i915#14259</a>)</li>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_162622v6/shard-tglu-4/igt@kms_plane_multiple@tiling-yf.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14259">i915#14259</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-downscale-factor-0-5-with-rotation@pipe-d:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_162622v6/shard-dg1-18/igt@kms_plane_scaling@plane-downscale-factor-0-5-with-rotation@pipe-d.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15329">i915#15329</a>) +8 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-scaler-with-clipping-clamping-rotation:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_162622v6/shard-dg1-18/igt@kms_plane_scaling@plane-scaler-with-clipping-clamping-rotation.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15329">i915#15329</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3555">i915#3555</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@planes-upscale-20x20-downscale-factor-0-75@pipe-d:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_162622v6/shard-mtlp-6/igt@kms_plane_scaling@planes-upscale-20x20-downscale-factor-0-75@pipe-d.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15329">i915#15329</a>) +7 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_pm_backlight@brightness-with-dpms:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_162622v6/shard-tglu-3/igt@kms_pm_backlight@brightness-with-dpms.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12343">i915#12343</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pm_backlight@fade-with-suspend:</p>
<ul>
<li>shard-tglu-1:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_162622v6/shard-tglu-1/igt@kms_pm_backlight@fade-with-suspend.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12343">i915#12343</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9812">i915#9812</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pm_dc@dc5-pageflip-negative:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_162622v6/shard-tglu-3/igt@kms_pm_dc@dc5-pageflip-negative.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9685">i915#9685</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pm_dc@dc5-psr:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_162622v6/shard-dg1-14/igt@kms_pm_dc@dc5-psr.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15948">i915#15948</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pm_dc@dc5-psr-suspend-resume:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_162622v6/shard-dg1-14/igt@kms_pm_dc@dc5-psr-suspend-resume.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16914">i915#16914</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pm_dc@dc5-retention-flops:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_162622v6/shard-dg1-17/igt@kms_pm_dc@dc5-retention-flops.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3828">i915#3828</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pm_dc@dc6-psr:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_162622v6/shard-rkl-4/igt@kms_pm_dc@dc6-psr.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15948">i915#15948</a>)</li>
<li>shard-tglu-1:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_162622v6/shard-tglu-1/igt@kms_pm_dc@dc6-psr.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15948">i915#15948</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pm_lpsp@kms-lpsp:</p>
<ul>
<li>shard-dg2:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19136/shard-dg2-4/igt@kms_pm_lpsp@kms-lpsp.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_162622v6/shard-dg2-3/igt@kms_pm_lpsp@kms-lpsp.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9340">i915#9340</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pm_lpsp@screens-disabled:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_162622v6/shard-tglu-4/igt@kms_pm_lpsp@screens-disabled.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8430">i915#8430</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pm_rpm@dpms-lpsp:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19136/shard-rkl-2/igt@kms_pm_rpm@dpms-lpsp.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_162622v6/shard-rkl-3/igt@kms_pm_rpm@dpms-lpsp.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15073">i915#15073</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_pm_rpm@dpms-non-lpsp:</p>
<ul>
<li>shard-dg1:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19136/shard-dg1-17/igt@kms_pm_rpm@dpms-non-lpsp.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_162622v6/shard-dg1-15/igt@kms_pm_rpm@dpms-non-lpsp.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15073">i915#15073</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pm_rpm@modeset-non-lpsp-stress-no-wait:</p>
<ul>
<li>shard-dg2:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19136/shard-dg2-6/igt@kms_pm_rpm@modeset-non-lpsp-stress-no-wait.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_162622v6/shard-dg2-4/igt@kms_pm_rpm@modeset-non-lpsp-stress-no-wait.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15073">i915#15073</a>)</li>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_162622v6/shard-dg1-14/igt@kms_pm_rpm@modeset-non-lpsp-stress-no-wait.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15073">i915#15073</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_prime@basic-modeset-hybrid:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_162622v6/shard-dg1-18/igt@kms_prime@basic-modeset-hybrid.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6524">i915#6524</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@fbc-pr-cursor-plane-update-sf:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_162622v6/shard-tglu-3/igt@kms_psr2_sf@fbc-pr-cursor-plane-update-sf.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11520">i915#11520</a>) +12 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@fbc-psr2-cursor-plane-move-continuous-exceed-sf:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_162622v6/shard-dg1-18/igt@kms_psr2_sf@fbc-psr2-cursor-plane-move-continuous-exceed-sf.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11520">i915#11520</a>) +7 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@fbc-psr2-cursor-plane-move-continuous-exceed-sf@pipe-b-edp-1:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_162622v6/shard-mtlp-5/igt@kms_psr2_sf@fbc-psr2-cursor-plane-move-continuous-exceed-sf@pipe-b-edp-1.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12316">i915#12316</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@fbc-psr2-cursor-plane-update-sf:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_162622v6/shard-dg2-6/igt@kms_psr2_sf@fbc-psr2-cursor-plane-update-sf.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11520">i915#11520</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@fbc-psr2-overlay-plane-move-continuous-sf@pipe-a-edp-1:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_162622v6/shard-mtlp-8/igt@kms_psr2_sf@fbc-psr2-overlay-plane-move-continuous-sf@pipe-a-edp-1.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9808">i915#9808</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@fbc-psr2-overlay-plane-update-continuous-sf:</p>
<ul>
<li>shard-glk:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_162622v6/shard-glk5/igt@kms_psr2_sf@fbc-psr2-overlay-plane-update-continuous-sf.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11520">i915#11520</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@fbc-psr2-overlay-primary-update-sf-dmg-area:</p>
<ul>
<li>shard-glk11:        NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_162622v6/shard-glk11/igt@kms_psr2_sf@fbc-psr2-overlay-primary-update-sf-dmg-area.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11520">i915#11520</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@psr2-cursor-plane-move-continuous-exceed-sf:</p>
<ul>
<li>shard-glk10:        NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_162622v6/shard-glk10/igt@kms_psr2_sf@psr2-cursor-plane-move-continuous-exceed-sf.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11520">i915#11520</a>) +6 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@psr2-overlay-plane-update-continuous-sf:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_162622v6/shard-rkl-4/igt@kms_psr2_sf@psr2-overlay-plane-update-continuous-sf.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11520">i915#11520</a>) +5 other tests skip</li>
<li>shard-tglu-1:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_162622v6/shard-tglu-1/igt@kms_psr2_sf@psr2-overlay-plane-update-continuous-sf.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11520">i915#11520</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@psr2-overlay-plane-update-sf-dmg-area:</p>
<ul>
<li>shard-snb:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_162622v6/shard-snb7/igt@kms_psr2_sf@psr2-overlay-plane-update-sf-dmg-area.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11520">i915#11520</a>) +10 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_su@page_flip-xrgb8888:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_162622v6/shard-tglu-3/igt@kms_psr2_su@page_flip-xrgb8888.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9683">i915#9683</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr@fbc-pr-sprite-plane-onoff:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_162622v6/shard-dg1-14/igt@kms_psr@fbc-pr-sprite-plane-onoff.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/1072">i915#1072</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9732">i915#9732</a>) +18 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr@fbc-psr2-cursor-blt:</p>
<ul>
<li>shard-tglu-1:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_162622v6/shard-tglu-1/igt@kms_psr@fbc-psr2-cursor-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9732">i915#9732</a>) +10 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr@fbc-psr2-cursor-mmap-gtt:</p>
<ul>
<li>shard-glk:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_162622v6/shard-glk5/igt@kms_psr@fbc-psr2-cursor-mmap-gtt.html">SKIP</a> +190 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr@fbc-psr2-primary-mmap-cpu@edp-1:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_162622v6/shard-mtlp-6/igt@kms_psr@fbc-psr2-primary-mmap-cpu@edp-1.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9688">i915#9688</a>) +6 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr@pr-primary-page-flip:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_162622v6/shard-tglu-3/igt@kms_psr@pr-primary-page-flip.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9732">i915#9732</a>) +31 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr@psr-cursor-mmap-cpu:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_162622v6/shard-rkl-4/igt@kms_psr@psr-cursor-mmap-cpu.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/1072">i915#1072</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9732">i915#9732</a>) +13 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr@psr2-primary-mmap-gtt@edp-1:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_162622v6/shard-mtlp-5/igt@kms_psr@psr2-primary-mmap-gtt@edp-1.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4077">i915#4077</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9688">i915#9688</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_rotation_crc@primary-4-tiled-reflect-x-0:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_162622v6/shard-tglu-7/igt@kms_rotation_crc@primary-4-tiled-reflect-x-0.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5289">i915#5289</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_rotation_crc@primary-yf-tiled-reflect-x-270:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_162622v6/shard-rkl-5/igt@kms_rotation_crc@primary-yf-tiled-reflect-x-270.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5289">i915#5289</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_rotation_crc@primary-yf-tiled-reflect-x-90:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_162622v6/shard-dg1-18/igt@kms_rotation_crc@primary-yf-tiled-reflect-x-90.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5289">i915#5289</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_scaling_modes@scaling-mode-none@pipe-a-edp-1:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_162622v6/shard-mtlp-3/igt@kms_scaling_modes@scaling-mode-none@pipe-a-edp-1.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5030">i915#5030</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_scaling_modes@scaling-mode-none@pipe-d-edp-1:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_162622v6/shard-mtlp-3/igt@kms_scaling_modes@scaling-mode-none@pipe-d-edp-1.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5030">i915#5030</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9041">i915#9041</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_selftest@drm_framebuffer:</p>
<ul>
<li>shard-tglu-1:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_162622v6/shard-tglu-1/igt@kms_selftest@drm_framebuffer.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13179">i915#13179</a>) +1 other test abort</li>
</ul>
</li>
<li>
<p>igt@kms_setmode@basic:</p>
<ul>
<li>shard-snb:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_162622v6/shard-snb1/igt@kms_setmode@basic.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15106">i915#15106</a>) +6 other tests fail</li>
</ul>
</li>
<li>
<p>igt@kms_setmode@invalid-clone-single-crtc-stealing:</p>
<ul>
<li>shard-tglu-1:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_162622v6/shard-tglu-1/igt@kms_setmode@invalid-clone-single-crtc-stealing.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3555">i915#3555</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_tiled_display@basic-test-pattern-with-chamelium:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_162622v6/shard-dg1-17/igt@kms_tiled_display@basic-test-pattern-with-chamelium.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8623">i915#8623</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_vrr@flip-basic-fastset:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_162622v6/shard-tglu-3/igt@kms_vrr@flip-basic-fastset.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9906">i915#9906</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_vrr@flip-suspend:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_162622v6/shard-tglu-4/igt@kms_vrr@flip-suspend.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3555">i915#3555</a>) +6 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_vrr@lobf:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_162622v6/shard-dg1-14/igt@kms_vrr@lobf.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11920">i915#11920</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_vrr@seamless-rr-switch-vrr:</p>
<ul>
<li>shard-tglu-1:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_162622v6/shard-tglu-1/igt@kms_vrr@seamless-rr-switch-vrr.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9906">i915#9906</a>)</li>
</ul>
</li>
<li>
<p>igt@perf_pmu@module-unload:</p>
<ul>
<li>shard-snb:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_162622v6/shard-snb7/igt@perf_pmu@module-unload.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15778">i915#15778</a>)</li>
</ul>
</li>
<li>
<p>igt@perf_pmu@rc6-suspend:</p>
<ul>
<li>shard-glk:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19136/shard-glk4/igt@perf_pmu@rc6-suspend.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_162622v6/shard-glk8/igt@perf_pmu@rc6-suspend.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13356">i915#13356</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16236">i915#16236</a>)</li>
</ul>
</li>
<li>
<p>igt@prime_vgem@basic-fence-mmap:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_162622v6/shard-dg1-14/igt@prime_vgem@basic-fence-mmap.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3708">i915#3708</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4077">i915#4077</a>)</li>
</ul>
</li>
<li>
<p>igt@prime_vgem@basic-fence-read:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_162622v6/shard-dg1-17/igt@prime_vgem@basic-fence-read.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3708">i915#3708</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@prime_vgem@basic-read:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_162622v6/shard-rkl-4/igt@prime_vgem@basic-read.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3291">i915#3291</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3708">i915#3708</a>)</li>
</ul>
</li>
<li>
<p>igt@tools_test@sysfs_l3_parity:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_162622v6/shard-dg1-14/igt@tools_test@sysfs_l3_parity.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4818">i915#4818</a>)</li>
</ul>
</li>
</ul>
<h4>Possible fixes</h4>
<ul>
<li>
<p>igt@core_setmaster@master-drop-set-user:</p>
<ul>
<li>shard-mtlp:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19136/shard-mtlp-7/igt@core_setmaster@master-drop-set-user.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17048">i915#17048</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_162622v6/shard-mtlp-3/igt@core_setmaster@master-drop-set-user.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@gem_eio@hibernate:</p>
<ul>
<li>shard-mtlp:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19136/shard-mtlp-7/igt@gem_eio@hibernate.html">TIMEOUT</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17038">i915#17038</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_162622v6/shard-mtlp-6/igt@gem_eio@hibernate.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@gem_exec_suspend@basic-s0:</p>
<ul>
<li>shard-dg2:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19136/shard-dg2-1/igt@gem_exec_suspend@basic-s0.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13356">i915#13356</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_162622v6/shard-dg2-4/igt@gem_exec_suspend@basic-s0.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@gem_mmap_offset@clear-via-pagefault:</p>
<ul>
<li>shard-mtlp:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19136/shard-mtlp-6/igt@gem_mmap_offset@clear-via-pagefault.html">TIMEOUT</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16021">i915#16021</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16168">i915#16168</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16349">i915#16349</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_162622v6/shard-mtlp-2/igt@gem_mmap_offset@clear-via-pagefault.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@gem_pxp@display-protected-crc:</p>
<ul>
<li>shard-mtlp:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19136/shard-mtlp-7/igt@gem_pxp@display-protected-crc.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17052">i915#17052</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_162622v6/shard-mtlp-6/igt@gem_pxp@display-protected-crc.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@gem_sync@basic-each:</p>
<ul>
<li>shard-mtlp:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19136/shard-mtlp-7/igt@gem_sync@basic-each.html">FAIL</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_162622v6/shard-mtlp-5/igt@gem_sync@basic-each.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@i915_pm_freq_api@freq-suspend@gt0:</p>
<ul>
<li>shard-dg2:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19136/shard-dg2-7/igt@i915_pm_freq_api@freq-suspend@gt0.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13356">i915#13356</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13820">i915#13820</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_162622v6/shard-dg2-6/igt@i915_pm_freq_api@freq-suspend@gt0.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@i915_suspend@sysfs-reader:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19136/shard-rkl-3/igt@i915_suspend@sysfs-reader.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4817">i915#4817</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_162622v6/shard-rkl-5/igt@i915_suspend@sysfs-reader.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_async_flips@alternate-sync-async-flip-atomic@pipe-a-hdmi-a-1:</p>
<ul>
<li>shard-glk:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19136/shard-glk6/igt@kms_async_flips@alternate-sync-async-flip-atomic@pipe-a-hdmi-a-1.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14888">i915#14888</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_162622v6/shard-glk2/igt@kms_async_flips@alternate-sync-async-flip-atomic@pipe-a-hdmi-a-1.html">PASS</a> +2 other tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_atomic_transition@plane-all-modeset-transition-fencing:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19136/shard-rkl-1/igt@kms_atomic_transition@plane-all-modeset-transition-fencing.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16866">i915#16866</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_162622v6/shard-rkl-2/igt@kms_atomic_transition@plane-all-modeset-transition-fencing.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_flip@dpms-vs-vblank-race-interruptible@b-hdmi-a4:</p>
<ul>
<li>shard-dg1:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19136/shard-dg1-16/igt@kms_flip@dpms-vs-vblank-race-interruptible@b-hdmi-a4.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16866">i915#16866</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16876">i915#16876</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16932">i915#16932</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_162622v6/shard-dg1-17/igt@kms_flip@dpms-vs-vblank-race-interruptible@b-hdmi-a4.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-expired-vblank:</p>
<ul>
<li>shard-mtlp:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19136/shard-mtlp-7/igt@kms_flip@flip-vs-expired-vblank.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17031">i915#17031</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_162622v6/shard-mtlp-5/igt@kms_flip@flip-vs-expired-vblank.html">PASS</a> +164 other tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-expired-vblank-interruptible@d-hdmi-a3:</p>
<ul>
<li>shard-dg2:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19136/shard-dg2-8/igt@kms_flip@flip-vs-expired-vblank-interruptible@d-hdmi-a3.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13027">i915#13027</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_162622v6/shard-dg2-3/igt@kms_flip@flip-vs-expired-vblank-interruptible@d-hdmi-a3.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbchdr-1p-primscrn-pri-shrfb-draw-mmap-cpu:</p>
<ul>
<li>shard-glk:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19136/shard-glk4/igt@kms_frontbuffer_tracking@fbchdr-1p-primscrn-pri-shrfb-draw-mmap-cpu.html">SKIP</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_162622v6/shard-glk8/igt@kms_frontbuffer_tracking@fbchdr-1p-primscrn-pri-shrfb-draw-mmap-cpu.html">PASS</a> +5 other tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@hdr-1p-primscrn-pri-indfb-draw-pwrite:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19136/shard-rkl-8/igt@kms_frontbuffer_tracking@hdr-1p-primscrn-pri-indfb-draw-pwrite.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15989">i915#15989</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_162622v6/shard-rkl-6/igt@kms_frontbuffer_tracking@hdr-1p-primscrn-pri-indfb-draw-pwrite.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@kms_plane@pixel-format-y-tiled-gen12-rc-ccs-modifier:</p>
<ul>
<li>shard-tglu:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19136/shard-tglu-4/igt@kms_plane@pixel-format-y-tiled-gen12-rc-ccs-modifier.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16866">i915#16866</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_162622v6/shard-tglu-5/igt@kms_plane@pixel-format-y-tiled-gen12-rc-ccs-modifier.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_pm_backlight@basic-brightness:</p>
<ul>
<li>shard-mtlp:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19136/shard-mtlp-7/igt@kms_pm_backlight@basic-brightness.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17032">i915#17032</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_162622v6/shard-mtlp-8/igt@kms_pm_backlight@basic-brightness.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_pm_rpm@dpms-mode-unset-non-lpsp:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19136/shard-rkl-8/igt@kms_pm_rpm@dpms-mode-unset-non-lpsp.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15073">i915#15073</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_162622v6/shard-rkl-3/igt@kms_pm_rpm@dpms-mode-unset-non-lpsp.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@kms_pm_rpm@modeset-non-lpsp:</p>
<ul>
<li>shard-dg2:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19136/shard-dg2-4/igt@kms_pm_rpm@modeset-non-lpsp.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15073">i915#15073</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_162622v6/shard-dg2-3/igt@kms_pm_rpm@modeset-non-lpsp.html">PASS</a> +1 other test pass</li>
<li>shard-dg1:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19136/shard-dg1-14/igt@kms_pm_rpm@modeset-non-lpsp.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15073">i915#15073</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_162622v6/shard-dg1-16/igt@kms_pm_rpm@modeset-non-lpsp.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@perf_pmu@rc6-suspend:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19136/shard-rkl-6/igt@perf_pmu@rc6-suspend.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13520">i915#13520</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_162622v6/shard-rkl-4/igt@perf_pmu@rc6-suspend.html">PASS</a></li>
</ul>
</li>
</ul>
<h4>Warnings</h4>
<ul>
<li>
<p>igt@api_intel_bb@crc32:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19136/shard-rkl-8/igt@api_intel_bb@crc32.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6230">i915#6230</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_162622v6/shard-rkl-6/igt@api_intel_bb@crc32.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6230">i915#6230</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_busy@semaphore:</p>
<ul>
<li>shard-mtlp:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19136/shard-mtlp-7/igt@gem_busy@semaphore.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17031">i915#17031</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_162622v6/shard-mtlp-5/igt@gem_busy@semaphore.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3936">i915#3936</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_ctx_sseu@invalid-args:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19136/shard-rkl-6/igt@gem_ctx_sseu@invalid-args.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/280">i915#280</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_162622v6/shard-rkl-7/igt@gem_ctx_sseu@invalid-args.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/280">i915#280</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_exec_reloc@basic-wc-cpu:</p>
<ul>
<li>shard-mtlp:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19136/shard-mtlp-8/igt@gem_exec_reloc@basic-wc-cpu.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3281">i915#3281</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_162622v6/shard-mtlp-7/igt@gem_exec_reloc@basic-wc-cpu.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17031">i915#17031</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@gem_exec_reloc@basic-write-read-noreloc:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19136/shard-rkl-6/igt@gem_exec_reloc@basic-write-read-noreloc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3281">i915#3281</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_162622v6/shard-rkl-7/igt@gem_exec_reloc@basic-write-read-noreloc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3281">i915#3281</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@gem_exec_reloc@basic-write-wc:</p>
<ul>
<li>shard-mtlp:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19136/shard-mtlp-7/igt@gem_exec_reloc@basic-write-wc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17031">i915#17031</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_162622v6/shard-mtlp-5/igt@gem_exec_reloc@basic-write-wc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3281">i915#3281</a>) +11 other tests skip</li>
</ul>
</li>
<li>
<p>igt@gem_exec_reloc@basic-write-wc-active:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19136/shard-rkl-8/igt@gem_exec_reloc@basic-write-wc-active.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3281">i915#3281</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_162622v6/shard-rkl-6/igt@gem_exec_reloc@basic-write-wc-active.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3281">i915#3281</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_lmem_swapping@random:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19136/shard-rkl-6/igt@gem_lmem_swapping@random.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4613">i915#4613</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_162622v6/shard-rkl-4/igt@gem_lmem_swapping@random.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4613">i915#4613</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@gem_partial_pwrite_pread@writes-after-reads-display:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19136/shard-rkl-6/igt@gem_partial_pwrite_pread@writes-after-reads-display.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3282">i915#3282</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_162622v6/shard-rkl-7/igt@gem_partial_pwrite_pread@writes-after-reads-display.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3282">i915#3282</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@gem_userptr_blits@create-destroy-unsync:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19136/shard-rkl-6/igt@gem_userptr_blits@create-destroy-unsync.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3297">i915#3297</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_162622v6/shard-rkl-4/igt@gem_userptr_blits@create-destroy-unsync.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3297">i915#3297</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@gen9_exec_parse@secure-batches:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19136/shard-rkl-6/igt@gen9_exec_parse@secure-batches.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2527">i915#2527</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_162622v6/shard-rkl-4/igt@gen9_exec_parse@secure-batches.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2527">i915#2527</a>)</li>
</ul>
</li>
<li>
<p>igt@i915_fb_tiling@basic-x-tiling:</p>
<ul>
<li>shard-mtlp:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19136/shard-mtlp-7/igt@i915_fb_tiling@basic-x-tiling.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17031">i915#17031</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_162622v6/shard-mtlp-5/igt@i915_fb_tiling@basic-x-tiling.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13786">i915#13786</a>)</li>
</ul>
</li>
<li>
<p>igt@i915_pm_rpm@gem-evict-pwrite:</p>
<ul>
<li>shard-mtlp:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19136/shard-mtlp-7/igt@i915_pm_rpm@gem-evict-pwrite.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17031">i915#17031</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_162622v6/shard-mtlp-5/igt@i915_pm_rpm@gem-evict-pwrite.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4077">i915#4077</a>)</li>
</ul>
</li>
<li>
<p>igt@i915_query@hwconfig_table:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19136/shard-rkl-6/igt@i915_query@hwconfig_table.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6245">i915#6245</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_162622v6/shard-rkl-4/igt@i915_query@hwconfig_table.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6245">i915#6245</a>)</li>
</ul>
</li>
<li>
<p>igt@i915_query@query-topology-known-pci-ids:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19136/shard-rkl-3/igt@i915_query@query-topology-known-pci-ids.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16109">i915#16109</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_162622v6/shard-rkl-6/igt@i915_query@query-topology-known-pci-ids.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16109">i915#16109</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_addfb_basic@tile-pitch-mismatch:</p>
<ul>
<li>shard-mtlp:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19136/shard-mtlp-8/igt@kms_addfb_basic@tile-pitch-mismatch.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4212">i915#4212</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_162622v6/shard-mtlp-7/igt@kms_addfb_basic@tile-pitch-mismatch.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17031">i915#17031</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@4-tiled-32bpp-rotate-180:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19136/shard-rkl-6/igt@kms_big_fb@4-tiled-32bpp-rotate-180.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5286">i915#5286</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_162622v6/shard-rkl-7/igt@kms_big_fb@4-tiled-32bpp-rotate-180.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5286">i915#5286</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@4-tiled-max-hw-stride-32bpp-rotate-180-hflip:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19136/shard-rkl-8/igt@kms_big_fb@4-tiled-max-hw-stride-32bpp-rotate-180-hflip.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5286">i915#5286</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_162622v6/shard-rkl-6/igt@kms_big_fb@4-tiled-max-hw-stride-32bpp-rotate-180-hflip.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5286">i915#5286</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@linear-max-hw-stride-32bpp-rotate-0-hflip:</p>
<ul>
<li>shard-mtlp:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19136/shard-mtlp-7/igt@kms_big_fb@linear-max-hw-stride-32bpp-rotate-0-hflip.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17031">i915#17031</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_162622v6/shard-mtlp-6/igt@kms_big_fb@linear-max-hw-stride-32bpp-rotate-0-hflip.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3828">i915#3828</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@x-tiled-32bpp-rotate-270:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19136/shard-rkl-6/igt@kms_big_fb@x-tiled-32bpp-rotate-270.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3638">i915#3638</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_162622v6/shard-rkl-7/igt@kms_big_fb@x-tiled-32bpp-rotate-270.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3638">i915#3638</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@y-tiled-addfb-size-offset-overflow:</p>
<ul>
<li>shard-mtlp:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19136/shard-mtlp-7/igt@kms_big_fb@y-tiled-addfb-size-offset-overflow.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17031">i915#17031</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_162622v6/shard-mtlp-8/igt@kms_big_fb@y-tiled-addfb-size-offset-overflow.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6187">i915#6187</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@yf-tiled-max-hw-stride-64bpp-rotate-0-hflip:</p>
<ul>
<li>shard-mtlp:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19136/shard-mtlp-8/igt@kms_big_fb@yf-tiled-max-hw-stride-64bpp-rotate-0-hflip.html">SKIP</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_162622v6/shard-mtlp-7/igt@kms_big_fb@yf-tiled-max-hw-stride-64bpp-rotate-0-hflip.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17031">i915#17031</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@yf-tiled-max-hw-stride-64bpp-rotate-180-hflip-async-flip:</p>
<ul>
<li>shard-mtlp:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19136/shard-mtlp-7/igt@kms_big_fb@yf-tiled-max-hw-stride-64bpp-rotate-180-hflip-async-flip.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17031">i915#17031</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_162622v6/shard-mtlp-5/igt@kms_big_fb@yf-tiled-max-hw-stride-64bpp-rotate-180-hflip-async-flip.html">SKIP</a> +21 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@bad-pixel-format-4-tiled-dg2-rc-ccs:</p>
<ul>
<li>shard-mtlp:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19136/shard-mtlp-8/igt@kms_ccs@bad-pixel-format-4-tiled-dg2-rc-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6095">i915#6095</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_162622v6/shard-mtlp-7/igt@kms_ccs@bad-pixel-format-4-tiled-dg2-rc-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17031">i915#17031</a>) +5 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-suspend-4-tiled-dg2-mc-ccs:</p>
<ul>
<li>shard-mtlp:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19136/shard-mtlp-7/igt@kms_ccs@crc-primary-suspend-4-tiled-dg2-mc-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17031">i915#17031</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_162622v6/shard-mtlp-6/igt@kms_ccs@crc-primary-suspend-4-tiled-dg2-mc-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6095">i915#6095</a>) +9 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-sprite-planes-basic-4-tiled-bmg-ccs:</p>
<ul>
<li>shard-mtlp:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19136/shard-mtlp-7/igt@kms_ccs@crc-sprite-planes-basic-4-tiled-bmg-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17031">i915#17031</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_162622v6/shard-mtlp-6/igt@kms_ccs@crc-sprite-planes-basic-4-tiled-bmg-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12313">i915#12313</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-sprite-planes-basic-4-tiled-lnl-ccs:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19136/shard-rkl-6/igt@kms_ccs@crc-sprite-planes-basic-4-tiled-lnl-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12313">i915#12313</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_162622v6/shard-rkl-7/igt@kms_ccs@crc-sprite-planes-basic-4-tiled-lnl-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12313">i915#12313</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@missing-ccs-buffer-4-tiled-mtl-mc-ccs:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19136/shard-rkl-8/igt@kms_ccs@missing-ccs-buffer-4-tiled-mtl-mc-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14098">i915#14098</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6095">i915#6095</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_162622v6/shard-rkl-6/igt@kms_ccs@missing-ccs-buffer-4-tiled-mtl-mc-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14098">i915#14098</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6095">i915#6095</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@random-ccs-data-4-tiled-dg2-mc-ccs@pipe-c-hdmi-a-2:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19136/shard-rkl-6/igt@kms_ccs@random-ccs-data-4-tiled-dg2-mc-ccs@pipe-c-hdmi-a-2.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14098">i915#14098</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6095">i915#6095</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_162622v6/shard-rkl-7/igt@kms_ccs@random-ccs-data-4-tiled-dg2-mc-ccs@pipe-c-hdmi-a-2.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14098">i915#14098</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6095">i915#6095</a>) +9 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@random-ccs-data-4-tiled-lnl-ccs:</p>
<ul>
<li>shard-mtlp:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19136/shard-mtlp-8/igt@kms_ccs@random-ccs-data-4-tiled-lnl-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12313">i915#12313</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_162622v6/shard-mtlp-7/igt@kms_ccs@random-ccs-data-4-tiled-lnl-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17031">i915#17031</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@random-ccs-data-4-tiled-mtl-rc-ccs@pipe-b-hdmi-a-2:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19136/shard-rkl-6/igt@kms_ccs@random-ccs-data-4-tiled-mtl-rc-ccs@pipe-b-hdmi-a-2.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6095">i915#6095</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_162622v6/shard-rkl-4/igt@kms_ccs@random-ccs-data-4-tiled-mtl-rc-ccs@pipe-b-hdmi-a-2.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6095">i915#6095</a>) +8 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_cdclk@plane-scaling:</p>
<ul>
<li>shard-mtlp:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19136/shard-mtlp-7/igt@kms_cdclk@plane-scaling.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17031">i915#17031</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_162622v6/shard-mtlp-8/igt@kms_cdclk@plane-scaling.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17016">i915#17016</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_audio@dp-audio-after-suspend:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19136/shard-rkl-6/igt@kms_chamelium_audio@dp-audio-after-suspend.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11151">i915#11151</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_162622v6/shard-rkl-4/igt@kms_chamelium_audio@dp-audio-after-suspend.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11151">i915#11151</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_audio@hdmi-audio-after-suspend:</p>
<ul>
<li>shard-mtlp:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19136/shard-mtlp-7/igt@kms_chamelium_audio@hdmi-audio-after-suspend.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17031">i915#17031</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_162622v6/shard-mtlp-5/igt@kms_chamelium_audio@hdmi-audio-after-suspend.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11151">i915#11151</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_color_pipeline@plane-lut1d:</p>
<ul>
<li>shard-mtlp:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19136/shard-mtlp-8/igt@kms_chamelium_color_pipeline@plane-lut1d.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16464">i915#16464</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16471">i915#16471</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_162622v6/shard-mtlp-7/igt@kms_chamelium_color_pipeline@plane-lut1d.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17031">i915#17031</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_frames@hdmi-crc-multiple:</p>
<ul>
<li>shard-mtlp:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19136/shard-mtlp-1/igt@kms_chamelium_frames@hdmi-crc-multiple.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11151">i915#11151</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/7828">i915#7828</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_162622v6/shard-mtlp-7/igt@kms_chamelium_frames@hdmi-crc-multiple.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17031">i915#17031</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_hpd@dp-hpd-after-suspend:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19136/shard-rkl-6/igt@kms_chamelium_hpd@dp-hpd-after-suspend.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11151">i915#11151</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/7828">i915#7828</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_162622v6/shard-rkl-4/igt@kms_chamelium_hpd@dp-hpd-after-suspend.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11151">i915#11151</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/7828">i915#7828</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_hpd@dp-hpd-storm-disable:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19136/shard-rkl-8/igt@kms_chamelium_hpd@dp-hpd-storm-disable.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11151">i915#11151</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/7828">i915#7828</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_162622v6/shard-rkl-6/igt@kms_chamelium_hpd@dp-hpd-storm-disable.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11151">i915#11151</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/7828">i915#7828</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_hpd@hdmi-hpd-enable-disable-mode:</p>
<ul>
<li>shard-mtlp:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19136/shard-mtlp-7/igt@kms_chamelium_hpd@hdmi-hpd-enable-disable-mode.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17031">i915#17031</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_162622v6/shard-mtlp-6/igt@kms_chamelium_hpd@hdmi-hpd-enable-disable-mode.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11151">i915#11151</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/7828">i915#7828</a>) +9 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@dp-mst-lic-type-1:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19136/shard-rkl-8/igt@kms_content_protection@dp-mst-lic-type-1.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15330">i915#15330</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3116">i915#3116</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_162622v6/shard-rkl-6/igt@kms_content_protection@dp-mst-lic-type-1.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15330">i915#15330</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3116">i915#3116</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@legacy-hdcp14:</p>
<ul>
<li>shard-mtlp:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19136/shard-mtlp-7/igt@kms_content_protection@legacy-hdcp14.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17031">i915#17031</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_162622v6/shard-mtlp-6/igt@kms_content_protection@legacy-hdcp14.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15865">i915#15865</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@lic-type-0-hdcp14:</p>
<ul>
<li>shard-mtlp:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19136/shard-mtlp-8/igt@kms_content_protection@lic-type-0-hdcp14.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15865">i915#15865</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_162622v6/shard-mtlp-7/igt@kms_content_protection@lic-type-0-hdcp14.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17031">i915#17031</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@lic-type-1:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19136/shard-rkl-8/igt@kms_content_protection@lic-type-1.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15865">i915#15865</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_162622v6/shard-rkl-6/igt@kms_content_protection@lic-type-1.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15865">i915#15865</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@mei-interface:</p>
<ul>
<li>shard-mtlp:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19136/shard-mtlp-7/igt@kms_content_protection@mei-interface.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17031">i915#17031</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_162622v6/shard-mtlp-3/igt@kms_content_protection@mei-interface.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8063">i915#8063</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9433">i915#9433</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-offscreen-512x170:</p>
<ul>
<li>shard-mtlp:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19136/shard-mtlp-8/igt@kms_cursor_crc@cursor-offscreen-512x170.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13049">i915#13049</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_162622v6/shard-mtlp-7/igt@kms_cursor_crc@cursor-offscreen-512x170.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17031">i915#17031</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-offscreen-64x21:</p>
<ul>
<li>shard-mtlp:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19136/shard-mtlp-7/igt@kms_cursor_crc@cursor-offscreen-64x21.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17031">i915#17031</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_162622v6/shard-mtlp-8/igt@kms_cursor_crc@cursor-offscreen-64x21.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8814">i915#8814</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-onscreen-32x32:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19136/shard-rkl-6/igt@kms_cursor_crc@cursor-onscreen-32x32.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3555">i915#3555</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_162622v6/shard-rkl-4/igt@kms_cursor_crc@cursor-onscreen-32x32.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3555">i915#3555</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-random-64x21:</p>
<ul>
<li>shard-mtlp:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19136/shard-mtlp-8/igt@kms_cursor_crc@cursor-random-64x21.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8814">i915#8814</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_162622v6/shard-mtlp-7/igt@kms_cursor_crc@cursor-random-64x21.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17031">i915#17031</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-rapid-movement-512x512:</p>
<ul>
<li>shard-mtlp:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19136/shard-mtlp-7/igt@kms_cursor_crc@cursor-rapid-movement-512x512.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17031">i915#17031</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_162622v6/shard-mtlp-5/igt@kms_cursor_crc@cursor-rapid-movement-512x512.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13049">i915#13049</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-sliding-32x32:</p>
<ul>
<li>shard-mtlp:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19136/shard-mtlp-7/igt@kms_cursor_crc@cursor-sliding-32x32.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17031">i915#17031</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_162622v6/shard-mtlp-8/igt@kms_cursor_crc@cursor-sliding-32x32.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3555">i915#3555</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8814">i915#8814</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@basic-busy-flip-before-cursor-legacy:</p>
<ul>
<li>shard-mtlp:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19136/shard-mtlp-7/igt@kms_cursor_legacy@basic-busy-flip-before-cursor-legacy.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17031">i915#17031</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_162622v6/shard-mtlp-3/igt@kms_cursor_legacy@basic-busy-flip-before-cursor-legacy.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16119">i915#16119</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4213">i915#4213</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@cursorb-vs-flipa-legacy:</p>
<ul>
<li>shard-mtlp:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19136/shard-mtlp-8/igt@kms_cursor_legacy@cursorb-vs-flipa-legacy.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9809">i915#9809</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_162622v6/shard-mtlp-7/igt@kms_cursor_legacy@cursorb-vs-flipa-legacy.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17031">i915#17031</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@cursorb-vs-flipa-varying-size:</p>
<ul>
<li>shard-mtlp:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19136/shard-mtlp-7/igt@kms_cursor_legacy@cursorb-vs-flipa-varying-size.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17031">i915#17031</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_162622v6/shard-mtlp-8/igt@kms_cursor_legacy@cursorb-vs-flipa-varying-size.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9809">i915#9809</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@short-busy-flip-before-cursor-atomic-transitions:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19136/shard-rkl-8/igt@kms_cursor_legacy@short-busy-flip-before-cursor-atomic-transitions.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4103">i915#4103</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_162622v6/shard-rkl-6/igt@kms_cursor_legacy@short-busy-flip-before-cursor-atomic-transitions.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4103">i915#4103</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@short-busy-flip-before-cursor-toggle:</p>
<ul>
<li>shard-mtlp:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19136/shard-mtlp-8/igt@kms_cursor_legacy@short-busy-flip-before-cursor-toggle.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16119">i915#16119</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4213">i915#4213</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_162622v6/shard-mtlp-7/igt@kms_cursor_legacy@short-busy-flip-before-cursor-toggle.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17031">i915#17031</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_dsc@dsc-with-formats-ultrajoiner:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19136/shard-rkl-6/igt@kms_dsc@dsc-with-formats-ultrajoiner.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16361">i915#16361</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_162622v6/shard-rkl-7/igt@kms_dsc@dsc-with-formats-ultrajoiner.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16361">i915#16361</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_dsc@dsc-with-output-formats-bigjoiner:</p>
<ul>
<li>shard-mtlp:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19136/shard-mtlp-7/igt@kms_dsc@dsc-with-output-formats-bigjoiner.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17031">i915#17031</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_162622v6/shard-mtlp-3/igt@kms_dsc@dsc-with-output-formats-bigjoiner.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16361">i915#16361</a>) +6 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_feature_discovery@display-3x:</p>
<ul>
<li>shard-mtlp:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19136/shard-mtlp-7/igt@kms_feature_discovery@display-3x.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17031">i915#17031</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_162622v6/shard-mtlp-5/igt@kms_feature_discovery@display-3x.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16081">i915#16081</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_feature_discovery@dp-mst:</p>
<ul>
<li>shard-mtlp:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19136/shard-mtlp-7/igt@kms_feature_discovery@dp-mst.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17031">i915#17031</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_162622v6/shard-mtlp-3/igt@kms_feature_discovery@dp-mst.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16599">i915#16599</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-absolute-wf_vblank:</p>
<ul>
<li>shard-mtlp:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19136/shard-mtlp-8/igt@kms_flip@2x-flip-vs-absolute-wf_vblank.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3637">i915#3637</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9934">i915#9934</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_162622v6/shard-mtlp-7/igt@kms_flip@2x-flip-vs-absolute-wf_vblank.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17031">i915#17031</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-dpms-on-nop-interruptible:</p>
<ul>
<li>shard-mtlp:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19136/shard-mtlp-7/igt@kms_flip@2x-flip-vs-dpms-on-nop-interruptible.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17031">i915#17031</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_162622v6/shard-mtlp-6/igt@kms_flip@2x-flip-vs-dpms-on-nop-interruptible.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9934">i915#9934</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-fences:</p>
<ul>
<li>shard-mtlp:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19136/shard-mtlp-7/igt@kms_flip@2x-flip-vs-fences.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17031">i915#17031</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_162622v6/shard-mtlp-6/igt@kms_flip@2x-flip-vs-fences.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8381">i915#8381</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-suspend:</p>
<ul>
<li>shard-glk:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19136/shard-glk9/igt@kms_flip@2x-flip-vs-suspend.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12745">i915#12745</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4839">i915#4839</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_162622v6/shard-glk3/igt@kms_flip@2x-flip-vs-suspend.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12745">i915#12745</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4839">i915#4839</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6113">i915#6113</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-modeset-vs-vblank-race:</p>
<ul>
<li>shard-mtlp:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19136/shard-mtlp-7/igt@kms_flip@2x-modeset-vs-vblank-race.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17031">i915#17031</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_162622v6/shard-mtlp-8/igt@kms_flip@2x-modeset-vs-vblank-race.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3637">i915#3637</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9934">i915#9934</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-plain-flip-interruptible:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19136/shard-rkl-6/igt@kms_flip@2x-plain-flip-interruptible.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9934">i915#9934</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_162622v6/shard-rkl-7/igt@kms_flip@2x-plain-flip-interruptible.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9934">i915#9934</a>) +5 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip@dpms-vs-vblank-race-interruptible:</p>
<ul>
<li>shard-dg1:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19136/shard-dg1-16/igt@kms_flip@dpms-vs-vblank-race-interruptible.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16866">i915#16866</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16876">i915#16876</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16932">i915#16932</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4423">i915#4423</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_162622v6/shard-dg1-17/igt@kms_flip@dpms-vs-vblank-race-interruptible.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16876">i915#16876</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-32bpp-yftile-to-64bpp-yftile-downscaling:</p>
<ul>
<li>shard-mtlp:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19136/shard-mtlp-7/igt@kms_flip_scaled_crc@flip-32bpp-yftile-to-64bpp-yftile-downscaling.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17031">i915#17031</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_162622v6/shard-mtlp-6/igt@kms_flip_scaled_crc@flip-32bpp-yftile-to-64bpp-yftile-downscaling.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15643">i915#15643</a>) +6 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-32bpp-yftileccs-to-64bpp-yftile-downscaling:</p>
<ul>
<li>shard-mtlp:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19136/shard-mtlp-8/igt@kms_flip_scaled_crc@flip-32bpp-yftileccs-to-64bpp-yftile-downscaling.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15643">i915#15643</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_162622v6/shard-mtlp-7/igt@kms_flip_scaled_crc@flip-32bpp-yftileccs-to-64bpp-yftile-downscaling.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17031">i915#17031</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-32bpp-yftileccs-to-64bpp-yftile-upscaling:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19136/shard-rkl-8/igt@kms_flip_scaled_crc@flip-32bpp-yftileccs-to-64bpp-yftile-upscaling.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15643">i915#15643</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_162622v6/shard-rkl-6/igt@kms_flip_scaled_crc@flip-32bpp-yftileccs-to-64bpp-yftile-upscaling.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15643">i915#15643</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-64bpp-linear-to-16bpp-linear-downscaling:</p>
<ul>
<li>shard-mtlp:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19136/shard-mtlp-7/igt@kms_flip_scaled_crc@flip-64bpp-linear-to-16bpp-linear-downscaling.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17031">i915#17031</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_162622v6/shard-mtlp-6/igt@kms_flip_scaled_crc@flip-64bpp-linear-to-16bpp-linear-downscaling.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3555">i915#3555</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8810">i915#8810</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8813">i915#8813</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-p010-4tile-to-p016-4tile:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19136/shard-rkl-6/igt@kms_flip_scaled_crc@flip-p010-4tile-to-p016-4tile.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15643">i915#15643</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_162622v6/shard-rkl-7/igt@kms_flip_scaled_crc@flip-p010-4tile-to-p016-4tile.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15643">i915#15643</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-2p-primscrn-pri-indfb-draw-blt:</p>
<ul>
<li>shard-mtlp:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19136/shard-mtlp-7/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-pri-indfb-draw-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17031">i915#17031</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_162622v6/shard-mtlp-8/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-pri-indfb-draw-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15991">i915#15991</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/1825">i915#1825</a>) +36 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-pri-indfb-draw-mmap-cpu:</p>
<ul>
<li>shard-mtlp:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19136/shard-mtlp-8/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-pri-indfb-draw-mmap-cpu.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15991">i915#15991</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/1825">i915#1825</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_162622v6/shard-mtlp-7/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-pri-indfb-draw-mmap-cpu.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17031">i915#17031</a>) +13 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-pri-indfb-draw-mmap-wc:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19136/shard-rkl-8/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-pri-indfb-draw-mmap-wc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/1825">i915#1825</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_162622v6/shard-rkl-6/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-pri-indfb-draw-mmap-wc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/1825">i915#1825</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbchdr-1p-primscrn-pri-shrfb-draw-mmap-gtt:</p>
<ul>
<li>shard-mtlp:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19136/shard-mtlp-7/igt@kms_frontbuffer_tracking@fbchdr-1p-primscrn-pri-shrfb-draw-mmap-gtt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17031">i915#17031</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_162622v6/shard-mtlp-3/igt@kms_frontbuffer_tracking@fbchdr-1p-primscrn-pri-shrfb-draw-mmap-gtt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15990">i915#15990</a>) +12 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbchdr-1p-primscrn-pri-shrfb-draw-pwrite:</p>
<ul>
<li>shard-mtlp:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19136/shard-mtlp-7/igt@kms_frontbuffer_tracking@fbchdr-1p-primscrn-pri-shrfb-draw-pwrite.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17031">i915#17031</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_162622v6/shard-mtlp-6/igt@kms_frontbuffer_tracking@fbchdr-1p-primscrn-pri-shrfb-draw-pwrite.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15989">i915#15989</a>) +43 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbchdr-2p-primscrn-indfb-pgflip-blt:</p>
<ul>
<li>shard-mtlp:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19136/shard-mtlp-7/igt@kms_frontbuffer_tracking@fbchdr-2p-primscrn-indfb-pgflip-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17031">i915#17031</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_162622v6/shard-mtlp-6/igt@kms_frontbuffer_tracking@fbchdr-2p-primscrn-indfb-pgflip-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15991">i915#15991</a>) +41 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbchdr-2p-scndscrn-spr-indfb-draw-render:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19136/shard-rkl-6/igt@kms_frontbuffer_tracking@fbchdr-2p-scndscrn-spr-indfb-draw-render.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_162622v6/shard-rkl-7/igt@kms_frontbuffer_tracking@fbchdr-2p-scndscrn-spr-indfb-draw-render.html">SKIP</a> +40 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbchdr-suspend:</p>
<ul>
<li>shard-glk:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19136/shard-glk8/igt@kms_frontbuffer_tracking@fbchdr-suspend.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16056">i915#16056</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16593">i915#16593</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_162622v6/shard-glk5/igt@kms_frontbuffer_tracking@fbchdr-suspend.html">SKIP</a></li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-pri-shrfb-draw-mmap-cpu:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19136/shard-rkl-8/igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-pri-shrfb-draw-mmap-cpu.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15102">i915#15102</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_162622v6/shard-rkl-6/igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-pri-shrfb-draw-mmap-cpu.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15102">i915#15102</a>) +6 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-pri-shrfb-draw-blt:</p>
<ul>
<li>shard-dg1:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19136/shard-dg1-16/igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-pri-shrfb-draw-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4423">i915#4423</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_162622v6/shard-dg1-17/igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-pri-shrfb-draw-blt.html">SKIP</a></li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-rgb101010-draw-mmap-wc:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19136/shard-rkl-6/igt@kms_frontbuffer_tracking@fbcpsr-rgb101010-draw-mmap-wc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15102">i915#15102</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_162622v6/shard-rkl-4/igt@kms_frontbuffer_tracking@fbcpsr-rgb101010-draw-mmap-wc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15102">i915#15102</a>) +16 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsrhdr-rgb101010-draw-mmap-wc:</p>
<ul>
<li>shard-mtlp:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19136/shard-mtlp-8/igt@kms_frontbuffer_tracking@fbcpsrhdr-rgb101010-draw-mmap-wc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15989">i915#15989</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_162622v6/shard-mtlp-7/igt@kms_frontbuffer_tracking@fbcpsrhdr-rgb101010-draw-mmap-wc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17031">i915#17031</a>) +10 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsrhdr-tiling-y:</p>
<ul>
<li>shard-mtlp:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19136/shard-mtlp-7/igt@kms_frontbuffer_tracking@fbcpsrhdr-tiling-y.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17031">i915#17031</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_162622v6/shard-mtlp-5/igt@kms_frontbuffer_tracking@fbcpsrhdr-tiling-y.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/10055">i915#10055</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@hdr-2p-scndscrn-spr-indfb-move:</p>
<ul>
<li>shard-mtlp:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19136/shard-mtlp-8/igt@kms_frontbuffer_tracking@hdr-2p-scndscrn-spr-indfb-move.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15991">i915#15991</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_162622v6/shard-mtlp-7/igt@kms_frontbuffer_tracking@hdr-2p-scndscrn-spr-indfb-move.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17031">i915#17031</a>) +17 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-1p-offscreen-pri-shrfb-draw-mmap-gtt:</p>
<ul>
<li>shard-mtlp:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19136/shard-mtlp-8/igt@kms_frontbuffer_tracking@psr-1p-offscreen-pri-shrfb-draw-mmap-gtt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15104">i915#15104</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15990">i915#15990</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_162622v6/shard-mtlp-7/igt@kms_frontbuffer_tracking@psr-1p-offscreen-pri-shrfb-draw-mmap-gtt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17031">i915#17031</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-1p-primscrn-cur-indfb-draw-render:</p>
<ul>
<li>shard-dg1:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19136/shard-dg1-17/igt@kms_frontbuffer_tracking@psr-1p-primscrn-cur-indfb-draw-render.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15102">i915#15102</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_162622v6/shard-dg1-16/igt@kms_frontbuffer_tracking@psr-1p-primscrn-cur-indfb-draw-render.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15102">i915#15102</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4423">i915#4423</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-1p-primscrn-pri-indfb-draw-mmap-gtt:</p>
<ul>
<li>shard-mtlp:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19136/shard-mtlp-7/igt@kms_frontbuffer_tracking@psr-1p-primscrn-pri-indfb-draw-mmap-gtt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17031">i915#17031</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_162622v6/shard-mtlp-6/igt@kms_frontbuffer_tracking@psr-1p-primscrn-pri-indfb-draw-mmap-gtt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15990">i915#15990</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8708">i915#8708</a>) +15 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-2p-scndscrn-pri-indfb-draw-mmap-wc:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19136/shard-rkl-6/igt@kms_frontbuffer_tracking@psr-2p-scndscrn-pri-indfb-draw-mmap-wc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/1825">i915#1825</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_162622v6/shard-rkl-4/igt@kms_frontbuffer_tracking@psr-2p-scndscrn-pri-indfb-draw-mmap-wc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/1825">i915#1825</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psrhdr-1p-primscrn-cur-indfb-draw-mmap-gtt:</p>
<ul>
<li>shard-mtlp:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19136/shard-mtlp-8/igt@kms_frontbuffer_tracking@psrhdr-1p-primscrn-cur-indfb-draw-mmap-gtt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15990">i915#15990</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_162622v6/shard-mtlp-7/igt@kms_frontbuffer_tracking@psrhdr-1p-primscrn-cur-indfb-draw-mmap-gtt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17031">i915#17031</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psrhdr-2p-scndscrn-spr-indfb-draw-mmap-gtt:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19136/shard-rkl-8/igt@kms_frontbuffer_tracking@psrhdr-2p-scndscrn-spr-indfb-draw-mmap-gtt.html">SKIP</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_162622v6/shard-rkl-6/igt@kms_frontbuffer_tracking@psrhdr-2p-scndscrn-spr-indfb-draw-mmap-gtt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a>) +11 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_hdr@brightness-with-hdr:</p>
<ul>
<li>shard-mtlp:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19136/shard-mtlp-8/igt@kms_hdr@brightness-with-hdr.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12713">i915#12713</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16490">i915#16490</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_162622v6/shard-mtlp-7/igt@kms_hdr@brightness-with-hdr.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17031">i915#17031</a>)</li>
<li>shard-tglu:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19136/shard-tglu-2/igt@kms_hdr@brightness-with-hdr.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/1187">i915#1187</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12713">i915#12713</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_162622v6/shard-tglu-10/igt@kms_hdr@brightness-with-hdr.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12713">i915#12713</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_hdr@static-toggle-dpms:</p>
<ul>
<li>shard-mtlp:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19136/shard-mtlp-7/igt@kms_hdr@static-toggle-dpms.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17031">i915#17031</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_162622v6/shard-mtlp-6/igt@kms_hdr@static-toggle-dpms.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12713">i915#12713</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16490">i915#16490</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3555">i915#3555</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8228">i915#8228</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_hdr@static-toggle-suspend:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19136/shard-rkl-2/igt@kms_hdr@static-toggle-suspend.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16644">i915#16644</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3555">i915#3555</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8228">i915#8228</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_162622v6/shard-rkl-6/igt@kms_hdr@static-toggle-suspend.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15436">i915#15436</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_joiner@basic-max-non-joiner:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19136/shard-rkl-6/igt@kms_joiner@basic-max-non-joiner.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13688">i915#13688</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_162622v6/shard-rkl-4/igt@kms_joiner@basic-max-non-joiner.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13688">i915#13688</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_joiner@basic-ultra-joiner:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19136/shard-rkl-6/igt@kms_joiner@basic-ultra-joiner.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15458">i915#15458</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_162622v6/shard-rkl-4/igt@kms_joiner@basic-ultra-joiner.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15458">i915#15458</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_joiner@invalid-modeset-big-joiner:</p>
<ul>
<li>shard-mtlp:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19136/shard-mtlp-7/igt@kms_joiner@invalid-modeset-big-joiner.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17031">i915#17031</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_162622v6/shard-mtlp-6/igt@kms_joiner@invalid-modeset-big-joiner.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15460">i915#15460</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_joiner@invalid-modeset-force-big-joiner:</p>
<ul>
<li>shard-mtlp:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19136/shard-mtlp-7/igt@kms_joiner@invalid-modeset-force-big-joiner.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17031">i915#17031</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_162622v6/shard-mtlp-3/igt@kms_joiner@invalid-modeset-force-big-joiner.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15459">i915#15459</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_joiner@switch-modeset-ultra-joiner-big-joiner:</p>
<ul>
<li>shard-mtlp:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19136/shard-mtlp-7/igt@kms_joiner@switch-modeset-ultra-joiner-big-joiner.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17031">i915#17031</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_162622v6/shard-mtlp-8/igt@kms_joiner@switch-modeset-ultra-joiner-big-joiner.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15638">i915#15638</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15722">i915#15722</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_multipipe_modeset@basic-max-pipe-crc-check:</p>
<ul>
<li>shard-mtlp:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19136/shard-mtlp-7/igt@kms_multipipe_modeset@basic-max-pipe-crc-check.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17031">i915#17031</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_162622v6/shard-mtlp-6/igt@kms_multipipe_modeset@basic-max-pipe-crc-check.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15815">i915#15815</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane@pixel-format-4-tiled-dg2-rc-ccs-cc-modifier:</p>
<ul>
<li>shard-mtlp:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19136/shard-mtlp-8/igt@kms_plane@pixel-format-4-tiled-dg2-rc-ccs-cc-modifier.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15709">i915#15709</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_162622v6/shard-mtlp-7/igt@kms_plane@pixel-format-4-tiled-dg2-rc-ccs-cc-modifier.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17031">i915#17031</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_plane@pixel-format-4-tiled-lnl-ccs-modifier-source-clamping:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19136/shard-rkl-8/igt@kms_plane@pixel-format-4-tiled-lnl-ccs-modifier-source-clamping.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15709">i915#15709</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_162622v6/shard-rkl-6/igt@kms_plane@pixel-format-4-tiled-lnl-ccs-modifier-source-clamping.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15709">i915#15709</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane@pixel-format-y-tiled-gen12-mc-ccs-modifier-source-clamping:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19136/shard-rkl-6/igt@kms_plane@pixel-format-y-tiled-gen12-mc-ccs-modifier-source-clamping.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15709">i915#15709</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_162622v6/shard-rkl-7/igt@kms_plane@pixel-format-y-tiled-gen12-mc-ccs-modifier-source-clamping.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15709">i915#15709</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane@pixel-format-y-tiled-gen12-rc-ccs-modifier@pipe-a-plane-7:</p>
<ul>
<li>shard-tglu:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19136/shard-tglu-4/igt@kms_plane@pixel-format-y-tiled-gen12-rc-ccs-modifier@pipe-a-plane-7.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16866">i915#16866</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_162622v6/shard-tglu-5/igt@kms_plane@pixel-format-y-tiled-gen12-rc-ccs-modifier@pipe-a-plane-7.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16386">i915#16386</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane@pixel-format-y-tiled-modifier:</p>
<ul>
<li>shard-mtlp:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19136/shard-mtlp-7/igt@kms_plane@pixel-format-y-tiled-modifier.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17031">i915#17031</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_162622v6/shard-mtlp-8/igt@kms_plane@pixel-format-y-tiled-modifier.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15709">i915#15709</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_plane_lowres@tiling-x:</p>
<ul>
<li>shard-mtlp:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19136/shard-mtlp-8/igt@kms_plane_lowres@tiling-x.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11614">i915#11614</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3582">i915#3582</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_162622v6/shard-mtlp-7/igt@kms_plane_lowres@tiling-x.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17031">i915#17031</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane_multiple@2x-tiling-yf:</p>
<ul>
<li>shard-mtlp:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19136/shard-mtlp-7/igt@kms_plane_multiple@2x-tiling-yf.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17031">i915#17031</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_162622v6/shard-mtlp-3/igt@kms_plane_multiple@2x-tiling-yf.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13958">i915#13958</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-downscale-factor-0-5-with-modifiers:</p>
<ul>
<li>shard-mtlp:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19136/shard-mtlp-8/igt@kms_plane_scaling@plane-downscale-factor-0-5-with-modifiers.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15329">i915#15329</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_162622v6/shard-mtlp-7/igt@kms_plane_scaling@plane-downscale-factor-0-5-with-modifiers.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17031">i915#17031</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-downscale-factor-0-5-with-rotation:</p>
<ul>
<li>shard-mtlp:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19136/shard-mtlp-7/igt@kms_plane_scaling@plane-downscale-factor-0-5-with-rotation.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17031">i915#17031</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_162622v6/shard-mtlp-5/igt@kms_plane_scaling@plane-downscale-factor-0-5-with-rotation.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15329">i915#15329</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-scaler-unity-scaling-with-rotation@pipe-b:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19136/shard-rkl-8/igt@kms_plane_scaling@plane-scaler-unity-scaling-with-rotation@pipe-b.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15329">i915#15329</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_162622v6/shard-rkl-6/igt@kms_plane_scaling@plane-scaler-unity-scaling-with-rotation@pipe-b.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15329">i915#15329</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@planes-unity-scaling-downscale-factor-0-5:</p>
<ul>
<li>shard-mtlp:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19136/shard-mtlp-8/igt@kms_plane_scaling@planes-unity-scaling-downscale-factor-0-5.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15329">i915#15329</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6953">i915#6953</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_162622v6/shard-mtlp-7/igt@kms_plane_scaling@planes-unity-scaling-downscale-factor-0-5.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17031">i915#17031</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@planes-upscale-20x20-downscale-factor-0-75:</p>
<ul>
<li>shard-mtlp:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19136/shard-mtlp-7/igt@kms_plane_scaling@planes-upscale-20x20-downscale-factor-0-75.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17031">i915#17031</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_162622v6/shard-mtlp-6/igt@kms_plane_scaling@planes-upscale-20x20-downscale-factor-0-75.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15329">i915#15329</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6953">i915#6953</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pm_backlight@fade:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19136/shard-rkl-6/igt@kms_pm_backlight@fade.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12343">i915#12343</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5354">i915#5354</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_162622v6/shard-rkl-4/igt@kms_pm_backlight@fade.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12343">i915#12343</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5354">i915#5354</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pm_dc@dc5-psr:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19136/shard-rkl-6/igt@kms_pm_dc@dc5-psr.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15948">i915#15948</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_162622v6/shard-rkl-7/igt@kms_pm_dc@dc5-psr.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15948">i915#15948</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pm_lpsp@kms-lpsp:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19136/shard-rkl-7/igt@kms_pm_lpsp@kms-lpsp.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9340">i915#9340</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_162622v6/shard-rkl-8/igt@kms_pm_lpsp@kms-lpsp.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3828">i915#3828</a>)</li>
<li>shard-dg1:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19136/shard-dg1-14/igt@kms_pm_lpsp@kms-lpsp.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3828">i915#3828</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_162622v6/shard-dg1-16/igt@kms_pm_lpsp@kms-lpsp.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9340">i915#9340</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pm_rpm@fences:</p>
<ul>
<li>shard-dg1:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19136/shard-dg1-16/igt@kms_pm_rpm@fences.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4423">i915#4423</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_162622v6/shard-dg1-17/igt@kms_pm_rpm@fences.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4077">i915#4077</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pm_rpm@modeset-non-lpsp-stress-no-wait:</p>
<ul>
<li>shard-mtlp:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19136/shard-mtlp-7/igt@kms_pm_rpm@modeset-non-lpsp-stress-no-wait.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17031">i915#17031</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_162622v6/shard-mtlp-3/igt@kms_pm_rpm@modeset-non-lpsp-stress-no-wait.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15073">i915#15073</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pm_rpm@package-g7:</p>
<ul>
<li>shard-mtlp:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19136/shard-mtlp-8/igt@kms_pm_rpm@package-g7.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15403">i915#15403</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_162622v6/shard-mtlp-7/igt@kms_pm_rpm@package-g7.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17031">i915#17031</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_prime@d3hot:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19136/shard-rkl-6/igt@kms_prime@d3hot.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6524">i915#6524</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_162622v6/shard-rkl-7/igt@kms_prime@d3hot.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6524">i915#6524</a>)</li>
<li>shard-mtlp:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19136/shard-mtlp-7/igt@kms_prime@d3hot.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17031">i915#17031</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_162622v6/shard-mtlp-6/igt@kms_prime@d3hot.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6524">i915#6524</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@fbc-pr-overlay-plane-update-sf-dmg-area:</p>
<ul>
<li>shard-mtlp:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19136/shard-mtlp-8/igt@kms_psr2_sf@fbc-pr-overlay-plane-update-sf-dmg-area.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12316">i915#12316</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_162622v6/shard-mtlp-7/igt@kms_psr2_sf@fbc-pr-overlay-plane-update-sf-dmg-area.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17031">i915#17031</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@pr-cursor-plane-move-continuous-exceed-fully-sf:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19136/shard-rkl-6/igt@kms_psr2_sf@pr-cursor-plane-move-continuous-exceed-fully-sf.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11520">i915#11520</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_162622v6/shard-rkl-7/igt@kms_psr2_sf@pr-cursor-plane-move-continuous-exceed-fully-sf.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11520">i915#11520</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@pr-cursor-plane-move-continuous-sf:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19136/shard-rkl-8/igt@kms_psr2_sf@pr-cursor-plane-move-continuous-sf.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11520">i915#11520</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_162622v6/shard-rkl-6/igt@kms_psr2_sf@pr-cursor-plane-move-continuous-sf.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11520">i915#11520</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@pr-overlay-primary-update-sf-dmg-area:</p>
<ul>
<li>shard-mtlp:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19136/shard-mtlp-7/igt@kms_psr2_sf@pr-overlay-primary-update-sf-dmg-area.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17031">i915#17031</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_162622v6/shard-mtlp-6/igt@kms_psr2_sf@pr-overlay-primary-update-sf-dmg-area.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12316">i915#12316</a>) +5 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr@fbc-pr-primary-blt:</p>
<ul>
<li>shard-mtlp:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19136/shard-mtlp-8/igt@kms_psr@fbc-pr-primary-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9688">i915#9688</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_162622v6/shard-mtlp-7/igt@kms_psr@fbc-pr-primary-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17031">i915#17031</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr@fbc-psr2-primary-mmap-cpu:</p>
<ul>
<li>shard-mtlp:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19136/shard-mtlp-7/igt@kms_psr@fbc-psr2-primary-mmap-cpu.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17031">i915#17031</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_162622v6/shard-mtlp-6/igt@kms_psr@fbc-psr2-primary-mmap-cpu.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9688">i915#9688</a>) +14 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr@pr-primary-mmap-cpu:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19136/shard-rkl-6/igt@kms_psr@pr-primary-mmap-cpu.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/1072">i915#1072</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9732">i915#9732</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_162622v6/shard-rkl-7/igt@kms_psr@pr-primary-mmap-cpu.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/1072">i915#1072</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9732">i915#9732</a>) +8 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr@psr-cursor-plane-move:</p>
<ul>
<li>shard-dg1:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19136/shard-dg1-17/igt@kms_psr@psr-cursor-plane-move.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/1072">i915#1072</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9732">i915#9732</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_162622v6/shard-dg1-16/igt@kms_psr@psr-cursor-plane-move.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/1072">i915#1072</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4423">i915#4423</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9732">i915#9732</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr@psr-cursor-render:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19136/shard-rkl-8/igt@kms_psr@psr-cursor-render.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/1072">i915#1072</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9732">i915#9732</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_162622v6/shard-rkl-6/igt@kms_psr@psr-cursor-render.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/1072">i915#1072</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9732">i915#9732</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr@psr-primary-mmap-gtt:</p>
<ul>
<li>shard-mtlp:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19136/shard-mtlp-8/igt@kms_psr@psr-primary-mmap-gtt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4077">i915#4077</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9688">i915#9688</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_162622v6/shard-mtlp-7/igt@kms_psr@psr-primary-mmap-gtt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17031">i915#17031</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr@psr2-primary-mmap-gtt:</p>
<ul>
<li>shard-mtlp:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19136/shard-mtlp-7/igt@kms_psr@psr2-primary-mmap-gtt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17031">i915#17031</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_162622v6/shard-mtlp-5/igt@kms_psr@psr2-primary-mmap-gtt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4077">i915#4077</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9688">i915#9688</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr_stress_test@flip-primary-invalidate-overlay:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19136/shard-rkl-6/igt@kms_psr_stress_test@flip-primary-invalidate-overlay.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15949">i915#15949</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_162622v6/shard-rkl-4/igt@kms_psr_stress_test@flip-primary-invalidate-overlay.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15949">i915#15949</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_rotation_crc@primary-y-tiled-reflect-x-0:</p>
<ul>
<li>shard-mtlp:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19136/shard-mtlp-8/igt@kms_rotation_crc@primary-y-tiled-reflect-x-0.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5289">i915#5289</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_162622v6/shard-mtlp-7/igt@kms_rotation_crc@primary-y-tiled-reflect-x-0.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17031">i915#17031</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_rotation_crc@primary-yf-tiled-reflect-x-0:</p>
<ul>
<li>shard-mtlp:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19136/shard-mtlp-7/igt@kms_rotation_crc@primary-yf-tiled-reflect-x-0.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17031">i915#17031</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_162622v6/shard-mtlp-6/igt@kms_rotation_crc@primary-yf-tiled-reflect-x-0.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5289">i915#5289</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_rotation_crc@primary-yf-tiled-reflect-x-270:</p>
<ul>
<li>shard-mtlp:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19136/shard-mtlp-7/igt@kms_rotation_crc@primary-yf-tiled-reflect-x-270.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17031">i915#17031</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_162622v6/shard-mtlp-8/igt@kms_rotation_crc@primary-yf-tiled-reflect-x-270.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12755">i915#12755</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15867">i915#15867</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_rotation_crc@sprite-rotation-90-pos-100-0:</p>
<ul>
<li>shard-mtlp:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19136/shard-mtlp-1/igt@kms_rotation_crc@sprite-rotation-90-pos-100-0.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12755">i915#12755</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15867">i915#15867</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_162622v6/shard-mtlp-7/igt@kms_rotation_crc@sprite-rotation-90-pos-100-0.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17031">i915#17031</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_scaling_modes@scaling-mode-none:</p>
<ul>
<li>shard-mtlp:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19136/shard-mtlp-7/igt@kms_scaling_modes@scaling-mode-none.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17031">i915#17031</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_162622v6/shard-mtlp-3/igt@kms_scaling_modes@scaling-mode-none.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3555">i915#3555</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5030">i915#5030</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9041">i915#9041</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_setmode@invalid-clone-single-crtc:</p>
<ul>
<li>shard-mtlp:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19136/shard-mtlp-8/igt@kms_setmode@invalid-clone-single-crtc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3555">i915#3555</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8809">i915#8809</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_162622v6/shard-mtlp-7/igt@kms_setmode@invalid-clone-single-crtc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17031">i915#17031</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_vrr@flip-basic:</p>
<ul>
<li>shard-mtlp:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19136/shard-mtlp-8/igt@kms_vrr@flip-basic.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3555">i915#3555</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8808">i915#8808</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_162622v6/shard-mtlp-7/igt@kms_vrr@flip-basic.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17031">i915#17031</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_vrr@flipline:</p>
<ul>
<li>shard-mtlp:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19136/shard-mtlp-7/igt@kms_vrr@flipline.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17031">i915#17031</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_162622v6/shard-mtlp-3/igt@kms_vrr@flipline.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3555">i915#3555</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8808">i915#8808</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_vrr@lobf:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19136/shard-rkl-6/igt@kms_vrr@lobf.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11920">i915#11920</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_162622v6/shard-rkl-7/igt@kms_vrr@lobf.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11920">i915#11920</a>)</li>
<li>shard-mtlp:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19136/shard-mtlp-7/igt@kms_vrr@lobf.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17031">i915#17031</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_162622v6/shard-mtlp-6/igt@kms_vrr@lobf.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11920">i915#11920</a>)</li>
</ul>
</li>
<li>
<p>igt@prime_vgem@basic-write:</p>
<ul>
<li>shard-mtlp:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19136/shard-mtlp-7/igt@prime_vgem@basic-write.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17031">i915#17031</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_162622v6/shard-mtlp-5/igt@prime_vgem@basic-write.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/10216">i915#10216</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3708">i915#3708</a>)</li>
</ul>
</li>
</ul>
<h2>Build changes</h2>
<ul>
<li>Linux: CI_DRM_19136 -&gt; Patchwork_162622v6</li>
</ul>
<p>CI-20190529: 20190529<br />
  CI_DRM_19136: d0f49187686a810b5b83216805c07814ad7542dc @ git://anongit.freedesktop.org/gfx-ci/linux<br />
  IGT_9093: 932327f15c92ecb52266ced8c0fbe72931a75880 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git<br />
  Patchwork_162622v6: d0f49187686a810b5b83216805c07814ad7542dc @ git://anongit.freedesktop.org/gfx-ci/linux<br />
  piglit_4509: fdc5a4ca11124ab8413c7988896eec4c97336694 @ git://anongit.freedesktop.org/piglit</p>

</body>
</html>

--===============3835599521299158966==--
