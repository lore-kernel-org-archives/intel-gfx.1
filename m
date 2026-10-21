Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ADA58606A31B
	for <intel-gfx@archiver.kernel.org>; Wed, 21 Oct 2026 19:38:41 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1BB77112056;
	Wed, 21 Oct 2026 19:38:41 +0000 (UTC)
Received: from 221881a7231d (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 97393112056;
 Wed, 21 Oct 2026 19:38:39 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============6349502425141903180=="
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=97_i915=2ECI=2EFull=3A_failure_for_drm/i915/display=3A_guar?=
 =?utf-8?q?d_intel=5Falpm=5Fget=5Ferror=28=29_against_non-ALPM_sinks_=28rev4?=
 =?utf-8?q?=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Stephen J. Fuhry" <fuhrysteve@gmail.com>
Cc: intel-gfx@lists.freedesktop.org
Date: Wed, 21 Oct 2026 19:38:39 -0000
Message-ID: <179261151959.53642.11408618063799228133@221881a7231d>
X-Patchwork-Hint: ignore
References: <20261014152526.2523534-1-fuhrysteve@gmail.com>
In-Reply-To: <20261014152526.2523534-1-fuhrysteve@gmail.com>
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

--===============6349502425141903180==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: drm/i915/display: guard intel_alpm_get_error() against non-ALPM sinks (rev4)
URL   : https://patchwork.freedesktop.org/series/168435/
State : failure

== Summary ==

CI Bug Log - changes from CI_DRM_19375_full -> Patchwork_168435v4_full
====================================================

Summary
-------

  **FAILURE**

  Serious unknown changes coming with Patchwork_168435v4_full absolutely need to be
  verified manually.
  
  If you think the reported changes have nothing to do with the changes
  introduced in Patchwork_168435v4_full, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them
  to document this new failure mode, which will reduce false positives in CI.

  

Participating hosts (10 -> 10)
------------------------------

  No changes in participating hosts

Possible new issues
-------------------

  Here are the unknown changes that may have been introduced in Patchwork_168435v4_full:

### IGT changes ###

#### Possible regressions ####

  * igt@gem_exec_schedule@wide:
    - shard-rkl:          [PASS][1] -> [FAIL][2] +1 other test fail
   [1]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19375/shard-rkl-8/igt@gem_exec_schedule@wide.html
   [2]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_168435v4/shard-rkl-8/igt@gem_exec_schedule@wide.html

  
Known issues
------------

  Here are the changes found in Patchwork_168435v4_full that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@api_intel_bb@crc32:
    - shard-tglu:         NOTRUN -> [SKIP][3] ([i915#6230])
   [3]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_168435v4/shard-tglu-8/igt@api_intel_bb@crc32.html

  * igt@api_intel_bb@object-reloc-purge-cache:
    - shard-rkl:          NOTRUN -> [SKIP][4] ([i915#8411])
   [4]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_168435v4/shard-rkl-5/igt@api_intel_bb@object-reloc-purge-cache.html

  * igt@device_reset@unbind-cold-reset-rebind:
    - shard-tglu-1:       NOTRUN -> [SKIP][5] ([i915#11078])
   [5]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_168435v4/shard-tglu-1/igt@device_reset@unbind-cold-reset-rebind.html

  * igt@drm_read@short-buffer-block:
    - shard-dg2:          [PASS][6] -> [SKIP][7] ([i915#17359]) +1 other test skip
   [6]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19375/shard-dg2-8/igt@drm_read@short-buffer-block.html
   [7]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_168435v4/shard-dg2-7/igt@drm_read@short-buffer-block.html

  * igt@fbdev@pan:
    - shard-dg2:          [PASS][8] -> [SKIP][9] ([i915#2582])
   [8]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19375/shard-dg2-8/igt@fbdev@pan.html
   [9]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_168435v4/shard-dg2-7/igt@fbdev@pan.html

  * igt@gem_ccs@ctrl-surf-copy:
    - shard-rkl:          NOTRUN -> [SKIP][10] ([i915#3555] / [i915#9323])
   [10]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_168435v4/shard-rkl-2/igt@gem_ccs@ctrl-surf-copy.html

  * igt@gem_ccs@large-ctrl-surf-copy:
    - shard-dg1:          NOTRUN -> [SKIP][11] ([i915#13008])
   [11]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_168435v4/shard-dg1-15/igt@gem_ccs@large-ctrl-surf-copy.html

  * igt@gem_close_race@multigpu-basic-process:
    - shard-dg1:          NOTRUN -> [SKIP][12] ([i915#7697])
   [12]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_168435v4/shard-dg1-16/igt@gem_close_race@multigpu-basic-process.html

  * igt@gem_create@create-ext-cpu-access-big:
    - shard-tglu-1:       NOTRUN -> [SKIP][13] ([i915#6335])
   [13]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_168435v4/shard-tglu-1/igt@gem_create@create-ext-cpu-access-big.html

  * igt@gem_ctx_isolation@preservation-s3:
    - shard-rkl:          [PASS][14] -> [INCOMPLETE][15] ([i915#13356]) +3 other tests incomplete
   [14]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19375/shard-rkl-8/igt@gem_ctx_isolation@preservation-s3.html
   [15]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_168435v4/shard-rkl-6/igt@gem_ctx_isolation@preservation-s3.html

  * igt@gem_ctx_sseu@engines:
    - shard-dg1:          NOTRUN -> [SKIP][16] ([i915#280])
   [16]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_168435v4/shard-dg1-16/igt@gem_ctx_sseu@engines.html

  * igt@gem_ctx_sseu@invalid-sseu:
    - shard-dg2:          NOTRUN -> [SKIP][17] ([i915#280])
   [17]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_168435v4/shard-dg2-4/igt@gem_ctx_sseu@invalid-sseu.html
    - shard-tglu:         NOTRUN -> [SKIP][18] ([i915#280])
   [18]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_168435v4/shard-tglu-8/igt@gem_ctx_sseu@invalid-sseu.html

  * igt@gem_exec_balancer@bonded-false-hang:
    - shard-dg1:          NOTRUN -> [SKIP][19] ([i915#4812])
   [19]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_168435v4/shard-dg1-16/igt@gem_exec_balancer@bonded-false-hang.html

  * igt@gem_exec_balancer@parallel-bb-first:
    - shard-rkl:          NOTRUN -> [SKIP][20] ([i915#4525])
   [20]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_168435v4/shard-rkl-2/igt@gem_exec_balancer@parallel-bb-first.html

  * igt@gem_exec_balancer@parallel-keep-submit-fence:
    - shard-tglu:         NOTRUN -> [SKIP][21] ([i915#4525]) +1 other test skip
   [21]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_168435v4/shard-tglu-8/igt@gem_exec_balancer@parallel-keep-submit-fence.html

  * igt@gem_exec_capture@capture-invisible@smem0:
    - shard-tglu-1:       NOTRUN -> [SKIP][22] ([i915#6334]) +1 other test skip
   [22]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_168435v4/shard-tglu-1/igt@gem_exec_capture@capture-invisible@smem0.html

  * igt@gem_exec_flush@basic-wb-set-default:
    - shard-dg1:          NOTRUN -> [SKIP][23] ([i915#3539] / [i915#4852])
   [23]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_168435v4/shard-dg1-16/igt@gem_exec_flush@basic-wb-set-default.html

  * igt@gem_exec_reloc@basic-cpu-gtt:
    - shard-rkl:          NOTRUN -> [SKIP][24] ([i915#3281]) +7 other tests skip
   [24]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_168435v4/shard-rkl-4/igt@gem_exec_reloc@basic-cpu-gtt.html

  * igt@gem_exec_reloc@basic-gtt-wc-active:
    - shard-mtlp:         NOTRUN -> [SKIP][25] ([i915#3281])
   [25]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_168435v4/shard-mtlp-8/igt@gem_exec_reloc@basic-gtt-wc-active.html

  * igt@gem_exec_reloc@basic-wc-read-active:
    - shard-dg1:          NOTRUN -> [SKIP][26] ([i915#3281]) +6 other tests skip
   [26]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_168435v4/shard-dg1-16/igt@gem_exec_reloc@basic-wc-read-active.html

  * igt@gem_exec_schedule@reorder-wide:
    - shard-dg2:          NOTRUN -> [SKIP][27] ([i915#4537] / [i915#4812])
   [27]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_168435v4/shard-dg2-4/igt@gem_exec_schedule@reorder-wide.html

  * igt@gem_huc_copy@huc-copy:
    - shard-tglu:         NOTRUN -> [SKIP][28] ([i915#2190])
   [28]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_168435v4/shard-tglu-7/igt@gem_huc_copy@huc-copy.html
    - shard-glk:          NOTRUN -> [SKIP][29] ([i915#2190])
   [29]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_168435v4/shard-glk4/igt@gem_huc_copy@huc-copy.html

  * igt@gem_lmem_swapping@massive-random:
    - shard-tglu-1:       NOTRUN -> [SKIP][30] ([i915#4613])
   [30]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_168435v4/shard-tglu-1/igt@gem_lmem_swapping@massive-random.html

  * igt@gem_lmem_swapping@parallel-random-verify-ccs:
    - shard-rkl:          NOTRUN -> [SKIP][31] ([i915#4613]) +3 other tests skip
   [31]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_168435v4/shard-rkl-2/igt@gem_lmem_swapping@parallel-random-verify-ccs.html

  * igt@gem_lmem_swapping@random-engines:
    - shard-glk:          NOTRUN -> [SKIP][32] ([i915#4613]) +1 other test skip
   [32]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_168435v4/shard-glk2/igt@gem_lmem_swapping@random-engines.html

  * igt@gem_lmem_swapping@smem-oom:
    - shard-tglu:         NOTRUN -> [SKIP][33] ([i915#4613]) +1 other test skip
   [33]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_168435v4/shard-tglu-8/igt@gem_lmem_swapping@smem-oom.html

  * igt@gem_lmem_swapping@verify:
    - shard-mtlp:         NOTRUN -> [SKIP][34] ([i915#4613])
   [34]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_168435v4/shard-mtlp-8/igt@gem_lmem_swapping@verify.html

  * igt@gem_mmap_gtt@close-race:
    - shard-dg1:          NOTRUN -> [SKIP][35] ([i915#4077]) +4 other tests skip
   [35]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_168435v4/shard-dg1-16/igt@gem_mmap_gtt@close-race.html

  * igt@gem_mmap_gtt@fault-concurrent-y:
    - shard-dg2:          NOTRUN -> [SKIP][36] ([i915#4077]) +2 other tests skip
   [36]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_168435v4/shard-dg2-8/igt@gem_mmap_gtt@fault-concurrent-y.html

  * igt@gem_partial_pwrite_pread@reads-uncached:
    - shard-dg1:          NOTRUN -> [SKIP][37] ([i915#3282]) +1 other test skip
   [37]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_168435v4/shard-dg1-16/igt@gem_partial_pwrite_pread@reads-uncached.html

  * igt@gem_partial_pwrite_pread@writes-after-reads:
    - shard-dg2:          NOTRUN -> [SKIP][38] ([i915#3282])
   [38]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_168435v4/shard-dg2-4/igt@gem_partial_pwrite_pread@writes-after-reads.html

  * igt@gem_partial_pwrite_pread@writes-after-reads-display:
    - shard-rkl:          NOTRUN -> [SKIP][39] ([i915#3282]) +5 other tests skip
   [39]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_168435v4/shard-rkl-2/igt@gem_partial_pwrite_pread@writes-after-reads-display.html

  * igt@gem_pread@exhaustion:
    - shard-glk:          NOTRUN -> [WARN][40] ([i915#2658])
   [40]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_168435v4/shard-glk2/igt@gem_pread@exhaustion.html

  * igt@gem_pread@self:
    - shard-mtlp:         NOTRUN -> [SKIP][41] ([i915#3282])
   [41]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_168435v4/shard-mtlp-8/igt@gem_pread@self.html

  * igt@gem_pxp@dmabuf-shared-protected-dst-is-context-refcounted:
    - shard-dg1:          NOTRUN -> [SKIP][42] ([i915#4270]) +2 other tests skip
   [42]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_168435v4/shard-dg1-16/igt@gem_pxp@dmabuf-shared-protected-dst-is-context-refcounted.html

  * igt@gem_pxp@hw-rejects-pxp-buffer:
    - shard-tglu-1:       NOTRUN -> [SKIP][43] ([i915#13398])
   [43]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_168435v4/shard-tglu-1/igt@gem_pxp@hw-rejects-pxp-buffer.html

  * igt@gem_userptr_blits@coherency-sync:
    - shard-dg1:          NOTRUN -> [SKIP][44] ([i915#3297]) +2 other tests skip
   [44]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_168435v4/shard-dg1-16/igt@gem_userptr_blits@coherency-sync.html

  * igt@gem_userptr_blits@create-destroy-unsync:
    - shard-rkl:          NOTRUN -> [SKIP][45] ([i915#3297])
   [45]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_168435v4/shard-rkl-8/igt@gem_userptr_blits@create-destroy-unsync.html
    - shard-mtlp:         NOTRUN -> [SKIP][46] ([i915#3297])
   [46]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_168435v4/shard-mtlp-8/igt@gem_userptr_blits@create-destroy-unsync.html

  * igt@gem_userptr_blits@dmabuf-sync:
    - shard-glk:          NOTRUN -> [SKIP][47] ([i915#3323])
   [47]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_168435v4/shard-glk2/igt@gem_userptr_blits@dmabuf-sync.html

  * igt@gem_userptr_blits@dmabuf-unsync:
    - shard-tglu-1:       NOTRUN -> [SKIP][48] ([i915#3297])
   [48]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_168435v4/shard-tglu-1/igt@gem_userptr_blits@dmabuf-unsync.html

  * igt@gem_userptr_blits@forbidden-operations:
    - shard-dg1:          NOTRUN -> [SKIP][49] ([i915#3282] / [i915#3297])
   [49]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_168435v4/shard-dg1-15/igt@gem_userptr_blits@forbidden-operations.html

  * igt@gem_userptr_blits@readonly-pwrite-unsync:
    - shard-dg2:          NOTRUN -> [SKIP][50] ([i915#3297])
   [50]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_168435v4/shard-dg2-8/igt@gem_userptr_blits@readonly-pwrite-unsync.html

  * igt@gem_userptr_blits@relocations:
    - shard-dg1:          NOTRUN -> [SKIP][51] ([i915#3281] / [i915#3297])
   [51]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_168435v4/shard-dg1-15/igt@gem_userptr_blits@relocations.html

  * igt@gem_userptr_blits@unsync-unmap-cycles:
    - shard-tglu:         NOTRUN -> [SKIP][52] ([i915#3297])
   [52]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_168435v4/shard-tglu-7/igt@gem_userptr_blits@unsync-unmap-cycles.html

  * igt@gen9_exec_parse@allowed-single:
    - shard-dg2:          NOTRUN -> [SKIP][53] ([i915#2856])
   [53]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_168435v4/shard-dg2-8/igt@gen9_exec_parse@allowed-single.html

  * igt@gen9_exec_parse@bb-chained:
    - shard-dg1:          NOTRUN -> [SKIP][54] ([i915#2527]) +1 other test skip
   [54]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_168435v4/shard-dg1-15/igt@gen9_exec_parse@bb-chained.html

  * igt@gen9_exec_parse@bb-oversize:
    - shard-rkl:          NOTRUN -> [SKIP][55] ([i915#2527]) +1 other test skip
   [55]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_168435v4/shard-rkl-8/igt@gen9_exec_parse@bb-oversize.html
    - shard-mtlp:         NOTRUN -> [SKIP][56] ([i915#2856])
   [56]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_168435v4/shard-mtlp-8/igt@gen9_exec_parse@bb-oversize.html

  * igt@gen9_exec_parse@unaligned-jump:
    - shard-tglu:         NOTRUN -> [SKIP][57] ([i915#2527] / [i915#2856]) +1 other test skip
   [57]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_168435v4/shard-tglu-8/igt@gen9_exec_parse@unaligned-jump.html

  * igt@i915_drm_fdinfo@virtual-busy-hang-all:
    - shard-dg1:          NOTRUN -> [SKIP][58] ([i915#14118])
   [58]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_168435v4/shard-dg1-15/igt@i915_drm_fdinfo@virtual-busy-hang-all.html

  * igt@i915_module_load@fault-injection:
    - shard-dg2:          NOTRUN -> [ABORT][59] ([i915#15342] / [i915#15481])
   [59]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_168435v4/shard-dg2-8/igt@i915_module_load@fault-injection.html

  * igt@i915_module_load@fault-injection@__uc_init:
    - shard-dg2:          NOTRUN -> [ABORT][60] ([i915#15481])
   [60]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_168435v4/shard-dg2-8/igt@i915_module_load@fault-injection@__uc_init.html

  * igt@i915_module_load@fault-injection@intel_connector_register:
    - shard-dg2:          NOTRUN -> [DMESG-WARN][61] ([i915#15342])
   [61]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_168435v4/shard-dg2-8/igt@i915_module_load@fault-injection@intel_connector_register.html

  * igt@i915_module_load@reload-no-display:
    - shard-tglu-1:       NOTRUN -> [DMESG-WARN][62] ([i915#13029] / [i915#14545])
   [62]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_168435v4/shard-tglu-1/igt@i915_module_load@reload-no-display.html

  * igt@i915_module_load@resize-bar:
    - shard-tglu:         NOTRUN -> [SKIP][63] ([i915#6412])
   [63]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_168435v4/shard-tglu-9/igt@i915_module_load@resize-bar.html

  * igt@i915_pm_rc6_residency@rc6-accuracy:
    - shard-dg2:          [PASS][64] -> [FAIL][65] ([i915#12964]) +1 other test fail
   [64]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19375/shard-dg2-7/igt@i915_pm_rc6_residency@rc6-accuracy.html
   [65]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_168435v4/shard-dg2-1/igt@i915_pm_rc6_residency@rc6-accuracy.html

  * igt@i915_pm_rps@basic-api:
    - shard-dg1:          NOTRUN -> [SKIP][66] ([i915#11681] / [i915#6621])
   [66]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_168435v4/shard-dg1-16/igt@i915_pm_rps@basic-api.html

  * igt@i915_pm_sseu@full-enable:
    - shard-rkl:          NOTRUN -> [SKIP][67] ([i915#4387])
   [67]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_168435v4/shard-rkl-8/igt@i915_pm_sseu@full-enable.html

  * igt@i915_query@hwconfig_table:
    - shard-tglu:         NOTRUN -> [SKIP][68] ([i915#6245])
   [68]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_168435v4/shard-tglu-9/igt@i915_query@hwconfig_table.html

  * igt@i915_query@query-topology-known-pci-ids:
    - shard-mtlp:         NOTRUN -> [SKIP][69] ([i915#16109])
   [69]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_168435v4/shard-mtlp-8/igt@i915_query@query-topology-known-pci-ids.html
    - shard-rkl:          NOTRUN -> [SKIP][70] ([i915#16109])
   [70]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_168435v4/shard-rkl-8/igt@i915_query@query-topology-known-pci-ids.html

  * igt@i915_suspend@sysfs-reader:
    - shard-glk:          NOTRUN -> [INCOMPLETE][71] ([i915#13356] / [i915#16182] / [i915#4817])
   [71]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_168435v4/shard-glk1/igt@i915_suspend@sysfs-reader.html

  * igt@kms_addfb_basic@invalid-smem-bo-on-discrete:
    - shard-tglu:         NOTRUN -> [SKIP][72] ([i915#12454] / [i915#12712])
   [72]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_168435v4/shard-tglu-8/igt@kms_addfb_basic@invalid-smem-bo-on-discrete.html

  * igt@kms_atomic@plane-primary-overlay-mutable-zpos:
    - shard-dg1:          NOTRUN -> [SKIP][73] ([i915#9531])
   [73]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_168435v4/shard-dg1-15/igt@kms_atomic@plane-primary-overlay-mutable-zpos.html

  * igt@kms_big_fb@4-tiled-32bpp-rotate-180:
    - shard-tglu-1:       NOTRUN -> [SKIP][74] ([i915#5286])
   [74]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_168435v4/shard-tglu-1/igt@kms_big_fb@4-tiled-32bpp-rotate-180.html

  * igt@kms_big_fb@4-tiled-8bpp-rotate-90:
    - shard-dg1:          NOTRUN -> [SKIP][75] ([i915#4538] / [i915#5286]) +1 other test skip
   [75]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_168435v4/shard-dg1-16/igt@kms_big_fb@4-tiled-8bpp-rotate-90.html

  * igt@kms_big_fb@4-tiled-max-hw-stride-32bpp-rotate-0-async-flip:
    - shard-tglu:         NOTRUN -> [SKIP][76] ([i915#5286]) +3 other tests skip
   [76]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_168435v4/shard-tglu-8/igt@kms_big_fb@4-tiled-max-hw-stride-32bpp-rotate-0-async-flip.html

  * igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-0-hflip-async-flip:
    - shard-rkl:          NOTRUN -> [SKIP][77] ([i915#5286]) +2 other tests skip
   [77]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_168435v4/shard-rkl-2/igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-0-hflip-async-flip.html

  * igt@kms_big_fb@linear-16bpp-rotate-270:
    - shard-dg1:          NOTRUN -> [SKIP][78] ([i915#3638])
   [78]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_168435v4/shard-dg1-15/igt@kms_big_fb@linear-16bpp-rotate-270.html

  * igt@kms_big_fb@linear-max-hw-stride-32bpp-rotate-0-hflip:
    - shard-tglu:         NOTRUN -> [SKIP][79] ([i915#3828])
   [79]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_168435v4/shard-tglu-8/igt@kms_big_fb@linear-max-hw-stride-32bpp-rotate-0-hflip.html

  * igt@kms_big_fb@x-tiled-64bpp-rotate-180:
    - shard-dg2:          [PASS][80] -> [SKIP][81] ([i915#17356]) +45 other tests skip
   [80]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19375/shard-dg2-8/igt@kms_big_fb@x-tiled-64bpp-rotate-180.html
   [81]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_168435v4/shard-dg2-7/igt@kms_big_fb@x-tiled-64bpp-rotate-180.html

  * igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-180-hflip:
    - shard-dg2:          NOTRUN -> [SKIP][82] ([i915#4538] / [i915#5190])
   [82]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_168435v4/shard-dg2-8/igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-180-hflip.html

  * igt@kms_big_fb@yf-tiled-16bpp-rotate-90:
    - shard-dg1:          NOTRUN -> [SKIP][83] ([i915#4538]) +2 other tests skip
   [83]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_168435v4/shard-dg1-16/igt@kms_big_fb@yf-tiled-16bpp-rotate-90.html

  * igt@kms_ccs@bad-aux-stride-4-tiled-mtl-mc-ccs@pipe-a-hdmi-a-4:
    - shard-dg1:          NOTRUN -> [SKIP][84] ([i915#6095]) +186 other tests skip
   [84]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_168435v4/shard-dg1-16/igt@kms_ccs@bad-aux-stride-4-tiled-mtl-mc-ccs@pipe-a-hdmi-a-4.html

  * igt@kms_ccs@bad-aux-stride-y-tiled-gen12-rc-ccs-cc@pipe-c-hdmi-a-2:
    - shard-glk10:        NOTRUN -> [SKIP][85] +73 other tests skip
   [85]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_168435v4/shard-glk10/igt@kms_ccs@bad-aux-stride-y-tiled-gen12-rc-ccs-cc@pipe-c-hdmi-a-2.html

  * igt@kms_ccs@bad-pixel-format-y-tiled-ccs@pipe-d-hdmi-a-1:
    - shard-dg2:          NOTRUN -> [SKIP][86] ([i915#10307] / [i915#10434] / [i915#6095])
   [86]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_168435v4/shard-dg2-4/igt@kms_ccs@bad-pixel-format-y-tiled-ccs@pipe-d-hdmi-a-1.html

  * igt@kms_ccs@bad-rotation-90-yf-tiled-ccs@pipe-b-hdmi-a-1:
    - shard-tglu:         NOTRUN -> [SKIP][87] ([i915#6095]) +39 other tests skip
   [87]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_168435v4/shard-tglu-7/igt@kms_ccs@bad-rotation-90-yf-tiled-ccs@pipe-b-hdmi-a-1.html

  * igt@kms_ccs@crc-primary-basic-4-tiled-bmg-ccs:
    - shard-tglu-1:       NOTRUN -> [SKIP][88] ([i915#12313])
   [88]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_168435v4/shard-tglu-1/igt@kms_ccs@crc-primary-basic-4-tiled-bmg-ccs.html

  * igt@kms_ccs@crc-primary-rotation-180-4-tiled-bmg-ccs:
    - shard-rkl:          NOTRUN -> [SKIP][89] ([i915#12313])
   [89]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_168435v4/shard-rkl-5/igt@kms_ccs@crc-primary-rotation-180-4-tiled-bmg-ccs.html

  * igt@kms_ccs@crc-primary-rotation-180-4-tiled-mtl-mc-ccs@pipe-c-hdmi-a-2:
    - shard-glk:          NOTRUN -> [SKIP][90] +186 other tests skip
   [90]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_168435v4/shard-glk2/igt@kms_ccs@crc-primary-rotation-180-4-tiled-mtl-mc-ccs@pipe-c-hdmi-a-2.html

  * igt@kms_ccs@crc-primary-rotation-180-y-tiled-ccs@pipe-c-hdmi-a-1:
    - shard-glk11:        NOTRUN -> [SKIP][91] +191 other tests skip
   [91]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_168435v4/shard-glk11/igt@kms_ccs@crc-primary-rotation-180-y-tiled-ccs@pipe-c-hdmi-a-1.html

  * igt@kms_ccs@crc-primary-suspend-4-tiled-bmg-ccs:
    - shard-dg1:          NOTRUN -> [SKIP][92] ([i915#12805])
   [92]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_168435v4/shard-dg1-16/igt@kms_ccs@crc-primary-suspend-4-tiled-bmg-ccs.html

  * igt@kms_ccs@crc-primary-suspend-4-tiled-lnl-ccs:
    - shard-tglu:         NOTRUN -> [SKIP][93] ([i915#12805])
   [93]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_168435v4/shard-tglu-8/igt@kms_ccs@crc-primary-suspend-4-tiled-lnl-ccs.html

  * igt@kms_ccs@crc-primary-suspend-4-tiled-mtl-rc-ccs@pipe-c-hdmi-a-1:
    - shard-dg2:          NOTRUN -> [SKIP][94] ([i915#6095]) +11 other tests skip
   [94]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_168435v4/shard-dg2-4/igt@kms_ccs@crc-primary-suspend-4-tiled-mtl-rc-ccs@pipe-c-hdmi-a-1.html

  * igt@kms_ccs@crc-primary-suspend-y-tiled-gen12-mc-ccs@pipe-b-edp-1:
    - shard-mtlp:         NOTRUN -> [SKIP][95] ([i915#6095]) +9 other tests skip
   [95]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_168435v4/shard-mtlp-8/igt@kms_ccs@crc-primary-suspend-y-tiled-gen12-mc-ccs@pipe-b-edp-1.html

  * igt@kms_ccs@crc-primary-suspend-y-tiled-gen12-rc-ccs-cc:
    - shard-rkl:          [PASS][96] -> [INCOMPLETE][97] ([i915#14694] / [i915#15582])
   [96]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19375/shard-rkl-5/igt@kms_ccs@crc-primary-suspend-y-tiled-gen12-rc-ccs-cc.html
   [97]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_168435v4/shard-rkl-3/igt@kms_ccs@crc-primary-suspend-y-tiled-gen12-rc-ccs-cc.html

  * igt@kms_ccs@crc-primary-suspend-y-tiled-gen12-rc-ccs-cc@pipe-a-hdmi-a-2:
    - shard-rkl:          NOTRUN -> [INCOMPLETE][98] ([i915#14694] / [i915#15582])
   [98]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_168435v4/shard-rkl-3/igt@kms_ccs@crc-primary-suspend-y-tiled-gen12-rc-ccs-cc@pipe-a-hdmi-a-2.html

  * igt@kms_ccs@crc-sprite-planes-basic-4-tiled-bmg-ccs:
    - shard-tglu:         NOTRUN -> [SKIP][99] ([i915#12313])
   [99]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_168435v4/shard-tglu-9/igt@kms_ccs@crc-sprite-planes-basic-4-tiled-bmg-ccs.html

  * igt@kms_ccs@crc-sprite-planes-basic-4-tiled-dg2-rc-ccs@pipe-b-hdmi-a-2:
    - shard-rkl:          NOTRUN -> [SKIP][100] ([i915#6095]) +43 other tests skip
   [100]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_168435v4/shard-rkl-4/igt@kms_ccs@crc-sprite-planes-basic-4-tiled-dg2-rc-ccs@pipe-b-hdmi-a-2.html

  * igt@kms_ccs@crc-sprite-planes-basic-4-tiled-mtl-mc-ccs:
    - shard-rkl:          NOTRUN -> [SKIP][101] ([i915#14098] / [i915#6095]) +33 other tests skip
   [101]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_168435v4/shard-rkl-5/igt@kms_ccs@crc-sprite-planes-basic-4-tiled-mtl-mc-ccs.html

  * igt@kms_ccs@missing-ccs-buffer-4-tiled-mtl-mc-ccs@pipe-b-hdmi-a-1:
    - shard-dg2:          NOTRUN -> [SKIP][102] ([i915#10307] / [i915#6095]) +84 other tests skip
   [102]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_168435v4/shard-dg2-4/igt@kms_ccs@missing-ccs-buffer-4-tiled-mtl-mc-ccs@pipe-b-hdmi-a-1.html

  * igt@kms_ccs@missing-ccs-buffer-y-tiled-gen12-mc-ccs@pipe-b-hdmi-a-1:
    - shard-tglu-1:       NOTRUN -> [SKIP][103] ([i915#6095]) +14 other tests skip
   [103]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_168435v4/shard-tglu-1/igt@kms_ccs@missing-ccs-buffer-y-tiled-gen12-mc-ccs@pipe-b-hdmi-a-1.html

  * igt@kms_cdclk@mode-transition-all-outputs:
    - shard-tglu:         NOTRUN -> [SKIP][104] ([i915#3742])
   [104]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_168435v4/shard-tglu-8/igt@kms_cdclk@mode-transition-all-outputs.html

  * igt@kms_cdclk@mode-transition@pipe-d-hdmi-a-3:
    - shard-dg2:          NOTRUN -> [SKIP][105] ([i915#13781]) +3 other tests skip
   [105]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_168435v4/shard-dg2-6/igt@kms_cdclk@mode-transition@pipe-d-hdmi-a-3.html

  * igt@kms_chamelium_audio@dp-audio-after-suspend:
    - shard-tglu:         NOTRUN -> [SKIP][106] ([i915#11151])
   [106]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_168435v4/shard-tglu-7/igt@kms_chamelium_audio@dp-audio-after-suspend.html

  * igt@kms_chamelium_audio@hdmi-audio-edid:
    - shard-tglu:         NOTRUN -> [SKIP][107] ([i915#11151] / [i915#7828]) +6 other tests skip
   [107]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_168435v4/shard-tglu-9/igt@kms_chamelium_audio@hdmi-audio-edid.html

  * igt@kms_chamelium_color_pipeline@plane-fixed-matrix-yuv-rgb-bt601-lut1d:
    - shard-mtlp:         NOTRUN -> [SKIP][108] +2 other tests skip
   [108]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_168435v4/shard-mtlp-8/igt@kms_chamelium_color_pipeline@plane-fixed-matrix-yuv-rgb-bt601-lut1d.html

  * igt@kms_chamelium_color_pipeline@plane-lut1d:
    - shard-tglu:         NOTRUN -> [SKIP][109] ([i915#16471])
   [109]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_168435v4/shard-tglu-7/igt@kms_chamelium_color_pipeline@plane-lut1d.html

  * igt@kms_chamelium_color_pipeline@plane-lut1d-lut1d:
    - shard-tglu-1:       NOTRUN -> [SKIP][110] ([i915#16471])
   [110]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_168435v4/shard-tglu-1/igt@kms_chamelium_color_pipeline@plane-lut1d-lut1d.html

  * igt@kms_chamelium_color_pipeline@plane-lut3d-green-only:
    - shard-rkl:          NOTRUN -> [SKIP][111] ([i915#16471])
   [111]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_168435v4/shard-rkl-2/igt@kms_chamelium_color_pipeline@plane-lut3d-green-only.html

  * igt@kms_chamelium_edid@hdmi-edid-read:
    - shard-rkl:          NOTRUN -> [SKIP][112] ([i915#11151] / [i915#7828]) +9 other tests skip
   [112]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_168435v4/shard-rkl-2/igt@kms_chamelium_edid@hdmi-edid-read.html

  * igt@kms_chamelium_hpd@dp-hpd-with-enabled-mode:
    - shard-mtlp:         NOTRUN -> [SKIP][113] ([i915#11151] / [i915#7828])
   [113]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_168435v4/shard-mtlp-8/igt@kms_chamelium_hpd@dp-hpd-with-enabled-mode.html

  * igt@kms_chamelium_hpd@hdmi-hpd-after-suspend:
    - shard-tglu-1:       NOTRUN -> [SKIP][114] ([i915#11151] / [i915#7828])
   [114]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_168435v4/shard-tglu-1/igt@kms_chamelium_hpd@hdmi-hpd-after-suspend.html

  * igt@kms_chamelium_hpd@vga-hpd-for-each-pipe:
    - shard-dg1:          NOTRUN -> [SKIP][115] ([i915#11151] / [i915#7828]) +5 other tests skip
   [115]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_168435v4/shard-dg1-15/igt@kms_chamelium_hpd@vga-hpd-for-each-pipe.html

  * igt@kms_color@ctm-negative:
    - shard-dg2:          [PASS][116] -> [SKIP][117] ([i915#12655] / [i915#17373])
   [116]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19375/shard-dg2-8/igt@kms_color@ctm-negative.html
   [117]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_168435v4/shard-dg2-7/igt@kms_color@ctm-negative.html

  * igt@kms_color_pipeline@plane-lut1d-lut1d:
    - shard-dg2:          [PASS][118] -> [SKIP][119] ([i915#15529]) +4 other tests skip
   [118]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19375/shard-dg2-3/igt@kms_color_pipeline@plane-lut1d-lut1d.html
   [119]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_168435v4/shard-dg2-7/igt@kms_color_pipeline@plane-lut1d-lut1d.html

  * igt@kms_color_pipeline@plane-lut1d-pre-ctm3x4@pipe-a-plane-4:
    - shard-rkl:          NOTRUN -> [SKIP][120] ([i915#16990]) +5 other tests skip
   [120]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_168435v4/shard-rkl-4/igt@kms_color_pipeline@plane-lut1d-pre-ctm3x4@pipe-a-plane-4.html

  * igt@kms_content_protection@atomic-hdcp14:
    - shard-tglu:         NOTRUN -> [SKIP][121] ([i915#15865]) +2 other tests skip
   [121]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_168435v4/shard-tglu-8/igt@kms_content_protection@atomic-hdcp14.html

  * igt@kms_content_protection@dp-mst-lic-type-1:
    - shard-tglu:         NOTRUN -> [SKIP][122] ([i915#15330] / [i915#3116] / [i915#3299])
   [122]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_168435v4/shard-tglu-7/igt@kms_content_protection@dp-mst-lic-type-1.html

  * igt@kms_content_protection@legacy:
    - shard-tglu-1:       NOTRUN -> [SKIP][123] ([i915#15865])
   [123]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_168435v4/shard-tglu-1/igt@kms_content_protection@legacy.html

  * igt@kms_content_protection@lic-type-0-hdcp14:
    - shard-dg2:          NOTRUN -> [SKIP][124] ([i915#15865])
   [124]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_168435v4/shard-dg2-4/igt@kms_content_protection@lic-type-0-hdcp14.html

  * igt@kms_content_protection@srm:
    - shard-dg1:          NOTRUN -> [SKIP][125] ([i915#15865]) +2 other tests skip
   [125]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_168435v4/shard-dg1-15/igt@kms_content_protection@srm.html

  * igt@kms_cursor_crc@cursor-offscreen-32x32:
    - shard-mtlp:         NOTRUN -> [SKIP][126] ([i915#3555] / [i915#8814])
   [126]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_168435v4/shard-mtlp-8/igt@kms_cursor_crc@cursor-offscreen-32x32.html

  * igt@kms_cursor_crc@cursor-offscreen-512x170:
    - shard-rkl:          NOTRUN -> [SKIP][127] ([i915#13049])
   [127]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_168435v4/shard-rkl-2/igt@kms_cursor_crc@cursor-offscreen-512x170.html

  * igt@kms_cursor_crc@cursor-onscreen-256x85:
    - shard-tglu-1:       NOTRUN -> [FAIL][128] ([i915#13566]) +1 other test fail
   [128]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_168435v4/shard-tglu-1/igt@kms_cursor_crc@cursor-onscreen-256x85.html

  * igt@kms_cursor_crc@cursor-onscreen-32x32:
    - shard-rkl:          NOTRUN -> [SKIP][129] ([i915#3555]) +4 other tests skip
   [129]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_168435v4/shard-rkl-8/igt@kms_cursor_crc@cursor-onscreen-32x32.html

  * igt@kms_cursor_crc@cursor-random-256x85@pipe-a-hdmi-a-1:
    - shard-rkl:          NOTRUN -> [FAIL][130] ([i915#13566]) +2 other tests fail
   [130]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_168435v4/shard-rkl-2/igt@kms_cursor_crc@cursor-random-256x85@pipe-a-hdmi-a-1.html

  * igt@kms_cursor_crc@cursor-random-512x170:
    - shard-dg2:          NOTRUN -> [SKIP][131] ([i915#13049]) +1 other test skip
   [131]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_168435v4/shard-dg2-4/igt@kms_cursor_crc@cursor-random-512x170.html

  * igt@kms_cursor_crc@cursor-rapid-movement-256x85:
    - shard-mtlp:         NOTRUN -> [SKIP][132] ([i915#8814])
   [132]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_168435v4/shard-mtlp-8/igt@kms_cursor_crc@cursor-rapid-movement-256x85.html

  * igt@kms_cursor_crc@cursor-rapid-movement-512x512:
    - shard-tglu:         NOTRUN -> [SKIP][133] ([i915#13049]) +1 other test skip
   [133]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_168435v4/shard-tglu-7/igt@kms_cursor_crc@cursor-rapid-movement-512x512.html

  * igt@kms_cursor_crc@cursor-suspend:
    - shard-glk11:        NOTRUN -> [INCOMPLETE][134] ([i915#12358] / [i915#13356] / [i915#14152] / [i915#7882])
   [134]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_168435v4/shard-glk11/igt@kms_cursor_crc@cursor-suspend.html

  * igt@kms_cursor_crc@cursor-suspend@pipe-a-hdmi-a-1:
    - shard-glk11:        NOTRUN -> [INCOMPLETE][135] ([i915#12358] / [i915#13356] / [i915#14152])
   [135]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_168435v4/shard-glk11/igt@kms_cursor_crc@cursor-suspend@pipe-a-hdmi-a-1.html

  * igt@kms_cursor_crc@cursor-suspend@pipe-a-hdmi-a-3:
    - shard-dg2:          NOTRUN -> [INCOMPLETE][136] ([i915#12358] / [i915#13356] / [i915#14152])
   [136]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_168435v4/shard-dg2-3/igt@kms_cursor_crc@cursor-suspend@pipe-a-hdmi-a-3.html

  * igt@kms_cursor_legacy@basic-busy-flip-before-cursor-atomic:
    - shard-tglu:         NOTRUN -> [SKIP][137] ([i915#4103])
   [137]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_168435v4/shard-tglu-9/igt@kms_cursor_legacy@basic-busy-flip-before-cursor-atomic.html

  * igt@kms_cursor_legacy@cursorb-vs-flipb-varying-size:
    - shard-dg2:          NOTRUN -> [SKIP][138] ([i915#13046] / [i915#5354])
   [138]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_168435v4/shard-dg2-8/igt@kms_cursor_legacy@cursorb-vs-flipb-varying-size.html

  * igt@kms_cursor_legacy@modeset-atomic-cursor-hotspot:
    - shard-tglu:         NOTRUN -> [SKIP][139] ([i915#9067])
   [139]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_168435v4/shard-tglu-9/igt@kms_cursor_legacy@modeset-atomic-cursor-hotspot.html

  * igt@kms_dirtyfb@psr-dirtyfb-ioctl:
    - shard-rkl:          NOTRUN -> [SKIP][140] ([i915#9723])
   [140]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_168435v4/shard-rkl-2/igt@kms_dirtyfb@psr-dirtyfb-ioctl.html

  * igt@kms_dither@fb-8bpc-vs-panel-6bpc@pipe-a-hdmi-a-2:
    - shard-rkl:          NOTRUN -> [SKIP][141] ([i915#3804])
   [141]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_168435v4/shard-rkl-7/igt@kms_dither@fb-8bpc-vs-panel-6bpc@pipe-a-hdmi-a-2.html

  * igt@kms_dp_link_training@non-uhbr-mst-direct-train:
    - shard-tglu:         NOTRUN -> [SKIP][142] ([i915#17287])
   [142]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_168435v4/shard-tglu-7/igt@kms_dp_link_training@non-uhbr-mst-direct-train.html

  * igt@kms_dp_link_training@non-uhbr-sst-tbtalt-train:
    - shard-tglu:         NOTRUN -> [SKIP][143] ([i915#17290])
   [143]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_168435v4/shard-tglu-8/igt@kms_dp_link_training@non-uhbr-sst-tbtalt-train.html

  * igt@kms_dp_link_training@uhbr-mst:
    - shard-rkl:          NOTRUN -> [SKIP][144] ([i915#13748])
   [144]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_168435v4/shard-rkl-4/igt@kms_dp_link_training@uhbr-mst.html

  * igt@kms_dp_link_training@uhbr-sst-direct-train:
    - shard-rkl:          NOTRUN -> [SKIP][145] ([i915#17285])
   [145]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_168435v4/shard-rkl-8/igt@kms_dp_link_training@uhbr-sst-direct-train.html

  * igt@kms_dp_link_training@uhbr-sst-tbtalt-train:
    - shard-tglu:         NOTRUN -> [SKIP][146] ([i915#17285])
   [146]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_168435v4/shard-tglu-9/igt@kms_dp_link_training@uhbr-sst-tbtalt-train.html

  * igt@kms_dp_linktrain_fallback@dp-fallback:
    - shard-dg1:          NOTRUN -> [SKIP][147] ([i915#16867])
   [147]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_168435v4/shard-dg1-15/igt@kms_dp_linktrain_fallback@dp-fallback.html

  * igt@kms_draw_crc@draw-method-mmap-wc:
    - shard-dg1:          NOTRUN -> [SKIP][148] ([i915#8812])
   [148]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_168435v4/shard-dg1-15/igt@kms_draw_crc@draw-method-mmap-wc.html

  * igt@kms_dsc@dsc-with-bpc-formats:
    - shard-tglu:         NOTRUN -> [SKIP][149] ([i915#16361]) +1 other test skip
   [149]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_168435v4/shard-tglu-7/igt@kms_dsc@dsc-with-bpc-formats.html

  * igt@kms_dsc@dsc-with-formats-bigjoiner:
    - shard-tglu-1:       NOTRUN -> [SKIP][150] ([i915#16361])
   [150]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_168435v4/shard-tglu-1/igt@kms_dsc@dsc-with-formats-bigjoiner.html

  * igt@kms_dsc@dsc-with-formats-ultrajoiner:
    - shard-dg2:          NOTRUN -> [SKIP][151] ([i915#16361])
   [151]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_168435v4/shard-dg2-8/igt@kms_dsc@dsc-with-formats-ultrajoiner.html

  * igt@kms_dsc@dsc-with-output-formats-with-bpc:
    - shard-dg1:          NOTRUN -> [SKIP][152] ([i915#16361]) +1 other test skip
   [152]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_168435v4/shard-dg1-16/igt@kms_dsc@dsc-with-output-formats-with-bpc.html

  * igt@kms_dsc@dsc-with-output-formats-with-bpc-bigjoiner:
    - shard-rkl:          NOTRUN -> [SKIP][153] ([i915#16361]) +2 other tests skip
   [153]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_168435v4/shard-rkl-2/igt@kms_dsc@dsc-with-output-formats-with-bpc-bigjoiner.html

  * igt@kms_fbcon_fbt@fbc:
    - shard-dg2:          [PASS][154] -> [SKIP][155] ([i915#1849])
   [154]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19375/shard-dg2-8/igt@kms_fbcon_fbt@fbc.html
   [155]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_168435v4/shard-dg2-7/igt@kms_fbcon_fbt@fbc.html

  * igt@kms_fbcon_fbt@fbc-suspend:
    - shard-glk11:        NOTRUN -> [INCOMPLETE][156] ([i915#13356] / [i915#9878])
   [156]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_168435v4/shard-glk11/igt@kms_fbcon_fbt@fbc-suspend.html

  * igt@kms_fbcon_fbt@psr:
    - shard-tglu:         NOTRUN -> [SKIP][157] ([i915#16680])
   [157]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_168435v4/shard-tglu-9/igt@kms_fbcon_fbt@psr.html

  * igt@kms_feature_discovery@chamelium:
    - shard-tglu:         NOTRUN -> [SKIP][158] ([i915#2065])
   [158]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_168435v4/shard-tglu-7/igt@kms_feature_discovery@chamelium.html

  * igt@kms_feature_discovery@hdr:
    - shard-rkl:          NOTRUN -> [SKIP][159] ([i915#16600])
   [159]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_168435v4/shard-rkl-4/igt@kms_feature_discovery@hdr.html

  * igt@kms_feature_discovery@vrr:
    - shard-dg1:          NOTRUN -> [SKIP][160] ([i915#16600])
   [160]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_168435v4/shard-dg1-15/igt@kms_feature_discovery@vrr.html

  * igt@kms_flip@2x-flip-vs-dpms:
    - shard-rkl:          NOTRUN -> [SKIP][161] ([i915#9934]) +3 other tests skip
   [161]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_168435v4/shard-rkl-8/igt@kms_flip@2x-flip-vs-dpms.html
    - shard-mtlp:         NOTRUN -> [SKIP][162] ([i915#3637] / [i915#9934])
   [162]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_168435v4/shard-mtlp-8/igt@kms_flip@2x-flip-vs-dpms.html

  * igt@kms_flip@2x-flip-vs-suspend-interruptible:
    - shard-tglu-1:       NOTRUN -> [SKIP][163] ([i915#3637] / [i915#9934])
   [163]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_168435v4/shard-tglu-1/igt@kms_flip@2x-flip-vs-suspend-interruptible.html

  * igt@kms_flip@2x-plain-flip-interruptible:
    - shard-dg1:          NOTRUN -> [SKIP][164] ([i915#9934]) +4 other tests skip
   [164]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_168435v4/shard-dg1-15/igt@kms_flip@2x-plain-flip-interruptible.html

  * igt@kms_flip@2x-plain-flip-ts-check:
    - shard-tglu:         NOTRUN -> [SKIP][165] ([i915#3637] / [i915#9934]) +1 other test skip
   [165]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_168435v4/shard-tglu-9/igt@kms_flip@2x-plain-flip-ts-check.html

  * igt@kms_flip@dpms-off-confusion-interruptible:
    - shard-dg2:          [PASS][166] -> [SKIP][167] ([i915#5354]) +3 other tests skip
   [166]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19375/shard-dg2-8/igt@kms_flip@dpms-off-confusion-interruptible.html
   [167]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_168435v4/shard-dg2-7/igt@kms_flip@dpms-off-confusion-interruptible.html

  * igt@kms_flip@flip-vs-suspend:
    - shard-rkl:          [PASS][168] -> [INCOMPLETE][169] ([i915#16276] / [i915#6113])
   [168]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19375/shard-rkl-5/igt@kms_flip@flip-vs-suspend.html
   [169]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_168435v4/shard-rkl-3/igt@kms_flip@flip-vs-suspend.html

  * igt@kms_flip@flip-vs-suspend-interruptible:
    - shard-glk10:        NOTRUN -> [INCOMPLETE][170] ([i915#12745] / [i915#13356] / [i915#17183] / [i915#4839])
   [170]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_168435v4/shard-glk10/igt@kms_flip@flip-vs-suspend-interruptible.html

  * igt@kms_flip@flip-vs-suspend-interruptible@a-hdmi-a1:
    - shard-glk10:        NOTRUN -> [INCOMPLETE][171] ([i915#12745] / [i915#13356] / [i915#17183])
   [171]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_168435v4/shard-glk10/igt@kms_flip@flip-vs-suspend-interruptible@a-hdmi-a1.html

  * igt@kms_flip@flip-vs-suspend@a-hdmi-a2:
    - shard-rkl:          NOTRUN -> [INCOMPLETE][172] ([i915#16276] / [i915#6113])
   [172]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_168435v4/shard-rkl-3/igt@kms_flip@flip-vs-suspend@a-hdmi-a2.html

  * igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytileccs-downscaling:
    - shard-rkl:          NOTRUN -> [SKIP][173] ([i915#15643]) +2 other tests skip
   [173]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_168435v4/shard-rkl-2/igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytileccs-downscaling.html

  * igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-32bpp-4tile-upscaling:
    - shard-tglu:         NOTRUN -> [SKIP][174] ([i915#15643]) +2 other tests skip
   [174]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_168435v4/shard-tglu-9/igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-32bpp-4tile-upscaling.html

  * igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-32bpp-4tiledg2rcccs-downscaling:
    - shard-dg2:          [PASS][175] -> [SKIP][176] ([i915#3555] / [i915#8813]) +3 other tests skip
   [175]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19375/shard-dg2-4/igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-32bpp-4tiledg2rcccs-downscaling.html
   [176]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_168435v4/shard-dg2-7/igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-32bpp-4tiledg2rcccs-downscaling.html

  * igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-32bpp-yftile-upscaling:
    - shard-dg1:          NOTRUN -> [SKIP][177] ([i915#15643]) +1 other test skip
   [177]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_168435v4/shard-dg1-16/igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-32bpp-yftile-upscaling.html

  * igt@kms_flip_scaled_crc@flip-p010-4tile-to-p016-4tile:
    - shard-tglu-1:       NOTRUN -> [SKIP][178] ([i915#15643])
   [178]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_168435v4/shard-tglu-1/igt@kms_flip_scaled_crc@flip-p010-4tile-to-p016-4tile.html

  * igt@kms_frontbuffer_tracking@fbc-1p-offscreen-pri-shrfb-draw-mmap-cpu:
    - shard-dg2:          [PASS][179] -> [SKIP][180] ([i915#16708]) +1 other test skip
   [179]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19375/shard-dg2-4/igt@kms_frontbuffer_tracking@fbc-1p-offscreen-pri-shrfb-draw-mmap-cpu.html
   [180]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_168435v4/shard-dg2-7/igt@kms_frontbuffer_tracking@fbc-1p-offscreen-pri-shrfb-draw-mmap-cpu.html

  * igt@kms_frontbuffer_tracking@fbc-1p-offscreen-pri-shrfb-draw-mmap-gtt:
    - shard-dg1:          NOTRUN -> [SKIP][181] ([i915#15104] / [i915#15990])
   [181]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_168435v4/shard-dg1-16/igt@kms_frontbuffer_tracking@fbc-1p-offscreen-pri-shrfb-draw-mmap-gtt.html

  * igt@kms_frontbuffer_tracking@fbc-1p-primscrn-spr-indfb-draw-mmap-cpu:
    - shard-dg2:          [PASS][182] -> [SKIP][183] ([i915#16708] / [i915#5354]) +6 other tests skip
   [182]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19375/shard-dg2-3/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-spr-indfb-draw-mmap-cpu.html
   [183]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_168435v4/shard-dg2-7/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-spr-indfb-draw-mmap-cpu.html

  * igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-indfb-plflip-blt:
    - shard-dg2:          NOTRUN -> [SKIP][184] ([i915#15991] / [i915#5354]) +3 other tests skip
   [184]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_168435v4/shard-dg2-4/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-indfb-plflip-blt.html

  * igt@kms_frontbuffer_tracking@fbc-suspend:
    - shard-rkl:          [PASS][185] -> [INCOMPLETE][186] ([i915#10056])
   [185]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19375/shard-rkl-8/igt@kms_frontbuffer_tracking@fbc-suspend.html
   [186]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_168435v4/shard-rkl-7/igt@kms_frontbuffer_tracking@fbc-suspend.html

  * igt@kms_frontbuffer_tracking@fbchdr-1p-offscreen-pri-shrfb-draw-blt:
    - shard-mtlp:         NOTRUN -> [SKIP][187] ([i915#15989]) +5 other tests skip
   [187]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_168435v4/shard-mtlp-8/igt@kms_frontbuffer_tracking@fbchdr-1p-offscreen-pri-shrfb-draw-blt.html

  * igt@kms_frontbuffer_tracking@fbchdr-1p-primscrn-spr-indfb-draw-mmap-gtt:
    - shard-dg2:          NOTRUN -> [SKIP][188] ([i915#15990]) +3 other tests skip
   [188]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_168435v4/shard-dg2-8/igt@kms_frontbuffer_tracking@fbchdr-1p-primscrn-spr-indfb-draw-mmap-gtt.html

  * igt@kms_frontbuffer_tracking@fbchdr-2p-primscrn-pri-indfb-draw-blt:
    - shard-rkl:          NOTRUN -> [SKIP][189] +80 other tests skip
   [189]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_168435v4/shard-rkl-4/igt@kms_frontbuffer_tracking@fbchdr-2p-primscrn-pri-indfb-draw-blt.html

  * igt@kms_frontbuffer_tracking@fbchdr-2p-primscrn-spr-indfb-move:
    - shard-dg2:          NOTRUN -> [SKIP][190] ([i915#15991]) +4 other tests skip
   [190]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_168435v4/shard-dg2-8/igt@kms_frontbuffer_tracking@fbchdr-2p-primscrn-spr-indfb-move.html

  * igt@kms_frontbuffer_tracking@fbcpsr-1p-pri-indfb-multidraw:
    - shard-tglu-1:       NOTRUN -> [SKIP][191] ([i915#15102]) +10 other tests skip
   [191]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_168435v4/shard-tglu-1/igt@kms_frontbuffer_tracking@fbcpsr-1p-pri-indfb-multidraw.html

  * igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-cur-indfb-move:
    - shard-dg1:          NOTRUN -> [SKIP][192] ([i915#15102]) +17 other tests skip
   [192]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_168435v4/shard-dg1-15/igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-cur-indfb-move.html

  * igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-pri-indfb-draw-mmap-wc:
    - shard-dg2:          NOTRUN -> [SKIP][193] ([i915#15990] / [i915#8708]) +4 other tests skip
   [193]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_168435v4/shard-dg2-8/igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-pri-indfb-draw-mmap-wc.html

  * igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-spr-indfb-draw-mmap-gtt:
    - shard-rkl:          NOTRUN -> [SKIP][194] ([i915#1825]) +1 other test skip
   [194]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_168435v4/shard-rkl-2/igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-spr-indfb-draw-mmap-gtt.html

  * igt@kms_frontbuffer_tracking@fbcpsr-rgb101010-draw-mmap-wc:
    - shard-dg1:          NOTRUN -> [SKIP][195] ([i915#15990] / [i915#8708]) +5 other tests skip
   [195]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_168435v4/shard-dg1-16/igt@kms_frontbuffer_tracking@fbcpsr-rgb101010-draw-mmap-wc.html

  * igt@kms_frontbuffer_tracking@fbcpsr-tiling-4:
    - shard-tglu-1:       NOTRUN -> [SKIP][196] ([i915#5439])
   [196]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_168435v4/shard-tglu-1/igt@kms_frontbuffer_tracking@fbcpsr-tiling-4.html

  * igt@kms_frontbuffer_tracking@fbcpsrhdr-1p-indfb-fliptrack-mmap-gtt:
    - shard-tglu:         NOTRUN -> [SKIP][197] ([i915#15102]) +31 other tests skip
   [197]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_168435v4/shard-tglu-8/igt@kms_frontbuffer_tracking@fbcpsrhdr-1p-indfb-fliptrack-mmap-gtt.html

  * igt@kms_frontbuffer_tracking@fbcpsrhdr-2p-scndscrn-spr-indfb-draw-mmap-wc:
    - shard-tglu-1:       NOTRUN -> [SKIP][198] +31 other tests skip
   [198]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_168435v4/shard-tglu-1/igt@kms_frontbuffer_tracking@fbcpsrhdr-2p-scndscrn-spr-indfb-draw-mmap-wc.html

  * igt@kms_frontbuffer_tracking@fbcpsrhdr-2p-shrfb-fliptrack-mmap-gtt:
    - shard-dg1:          NOTRUN -> [SKIP][199] ([i915#15990]) +6 other tests skip
   [199]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_168435v4/shard-dg1-16/igt@kms_frontbuffer_tracking@fbcpsrhdr-2p-shrfb-fliptrack-mmap-gtt.html

  * igt@kms_frontbuffer_tracking@fbcpsrhdr-rgb101010-draw-mmap-gtt:
    - shard-mtlp:         NOTRUN -> [SKIP][200] ([i915#15990]) +1 other test skip
   [200]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_168435v4/shard-mtlp-8/igt@kms_frontbuffer_tracking@fbcpsrhdr-rgb101010-draw-mmap-gtt.html

  * igt@kms_frontbuffer_tracking@fbcpsrhdr-tiling-4:
    - shard-rkl:          NOTRUN -> [SKIP][201] ([i915#5439])
   [201]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_168435v4/shard-rkl-5/igt@kms_frontbuffer_tracking@fbcpsrhdr-tiling-4.html

  * igt@kms_frontbuffer_tracking@hdr-1p-offscreen-pri-shrfb-draw-mmap-gtt:
    - shard-tglu:         NOTRUN -> [SKIP][202] ([i915#15989]) +18 other tests skip
   [202]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_168435v4/shard-tglu-9/igt@kms_frontbuffer_tracking@hdr-1p-offscreen-pri-shrfb-draw-mmap-gtt.html

  * igt@kms_frontbuffer_tracking@hdr-1p-offscreen-pri-shrfb-draw-render:
    - shard-dg2:          NOTRUN -> [SKIP][203] ([i915#15989]) +1 other test skip
   [203]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_168435v4/shard-dg2-8/igt@kms_frontbuffer_tracking@hdr-1p-offscreen-pri-shrfb-draw-render.html

  * igt@kms_frontbuffer_tracking@hdr-1p-primscrn-cur-indfb-draw-blt:
    - shard-rkl:          NOTRUN -> [SKIP][204] ([i915#15989]) +23 other tests skip
   [204]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_168435v4/shard-rkl-8/igt@kms_frontbuffer_tracking@hdr-1p-primscrn-cur-indfb-draw-blt.html

  * igt@kms_frontbuffer_tracking@hdr-1p-primscrn-spr-indfb-draw-mmap-cpu:
    - shard-dg1:          NOTRUN -> [SKIP][205] ([i915#15989]) +8 other tests skip
   [205]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_168435v4/shard-dg1-15/igt@kms_frontbuffer_tracking@hdr-1p-primscrn-spr-indfb-draw-mmap-cpu.html

  * igt@kms_frontbuffer_tracking@hdr-1p-primscrn-spr-indfb-draw-mmap-wc:
    - shard-tglu-1:       NOTRUN -> [SKIP][206] ([i915#15989]) +4 other tests skip
   [206]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_168435v4/shard-tglu-1/igt@kms_frontbuffer_tracking@hdr-1p-primscrn-spr-indfb-draw-mmap-wc.html

  * igt@kms_frontbuffer_tracking@hdr-1p-primscrn-spr-indfb-draw-pwrite:
    - shard-rkl:          [PASS][207] -> [SKIP][208] ([i915#15989]) +8 other tests skip
   [207]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19375/shard-rkl-6/igt@kms_frontbuffer_tracking@hdr-1p-primscrn-spr-indfb-draw-pwrite.html
   [208]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_168435v4/shard-rkl-4/igt@kms_frontbuffer_tracking@hdr-1p-primscrn-spr-indfb-draw-pwrite.html

  * igt@kms_frontbuffer_tracking@psr-1p-offscreen-pri-indfb-draw-mmap-gtt:
    - shard-dg2:          NOTRUN -> [SKIP][209] ([i915#15104] / [i915#15990])
   [209]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_168435v4/shard-dg2-8/igt@kms_frontbuffer_tracking@psr-1p-offscreen-pri-indfb-draw-mmap-gtt.html

  * igt@kms_frontbuffer_tracking@psr-2p-scndscrn-pri-shrfb-draw-mmap-wc:
    - shard-tglu:         NOTRUN -> [SKIP][210] +79 other tests skip
   [210]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_168435v4/shard-tglu-9/igt@kms_frontbuffer_tracking@psr-2p-scndscrn-pri-shrfb-draw-mmap-wc.html

  * igt@kms_frontbuffer_tracking@psr-2p-scndscrn-spr-indfb-draw-mmap-cpu:
    - shard-mtlp:         NOTRUN -> [SKIP][211] ([i915#15991] / [i915#1825]) +2 other tests skip
   [211]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_168435v4/shard-mtlp-8/igt@kms_frontbuffer_tracking@psr-2p-scndscrn-spr-indfb-draw-mmap-cpu.html

  * igt@kms_frontbuffer_tracking@psrhdr-1p-offscreen-pri-indfb-draw-mmap-cpu:
    - shard-dg2:          NOTRUN -> [SKIP][212] ([i915#15102]) +3 other tests skip
   [212]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_168435v4/shard-dg2-8/igt@kms_frontbuffer_tracking@psrhdr-1p-offscreen-pri-indfb-draw-mmap-cpu.html

  * igt@kms_frontbuffer_tracking@psrhdr-1p-primscrn-cur-indfb-draw-mmap-gtt:
    - shard-rkl:          NOTRUN -> [SKIP][213] ([i915#15102]) +29 other tests skip
   [213]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_168435v4/shard-rkl-5/igt@kms_frontbuffer_tracking@psrhdr-1p-primscrn-cur-indfb-draw-mmap-gtt.html

  * igt@kms_frontbuffer_tracking@psrhdr-2p-primscrn-cur-indfb-draw-blt:
    - shard-dg1:          NOTRUN -> [SKIP][214] +41 other tests skip
   [214]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_168435v4/shard-dg1-15/igt@kms_frontbuffer_tracking@psrhdr-2p-primscrn-cur-indfb-draw-blt.html

  * igt@kms_frontbuffer_tracking@psrhdr-2p-scndscrn-pri-indfb-draw-mmap-cpu:
    - shard-mtlp:         NOTRUN -> [SKIP][215] ([i915#15991]) +1 other test skip
   [215]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_168435v4/shard-mtlp-8/igt@kms_frontbuffer_tracking@psrhdr-2p-scndscrn-pri-indfb-draw-mmap-cpu.html

  * igt@kms_hdmi_audio_bw@audio-bw-hblank160:
    - shard-glk11:        NOTRUN -> [FAIL][216] ([i915#17102])
   [216]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_168435v4/shard-glk11/igt@kms_hdmi_audio_bw@audio-bw-hblank160.html

  * igt@kms_hdmi_audio_bw@suspend-disk-audio-recovery:
    - shard-rkl:          NOTRUN -> [FAIL][217] ([i915#17122] / [i915#17137])
   [217]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_168435v4/shard-rkl-8/igt@kms_hdmi_audio_bw@suspend-disk-audio-recovery.html
    - shard-mtlp:         NOTRUN -> [SKIP][218] ([i915#17103])
   [218]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_168435v4/shard-mtlp-8/igt@kms_hdmi_audio_bw@suspend-disk-audio-recovery.html

  * igt@kms_hdmi_inject@inject-audio:
    - shard-glk:          [PASS][219] -> [SKIP][220]
   [219]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19375/shard-glk1/igt@kms_hdmi_inject@inject-audio.html
   [220]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_168435v4/shard-glk8/igt@kms_hdmi_inject@inject-audio.html

  * igt@kms_hdr@bpc-switch-suspend:
    - shard-tglu:         NOTRUN -> [SKIP][221] ([i915#3555] / [i915#8228])
   [221]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_168435v4/shard-tglu-7/igt@kms_hdr@bpc-switch-suspend.html

  * igt@kms_hdr@invalid-metadata-sizes:
    - shard-rkl:          NOTRUN -> [SKIP][222] ([i915#16644] / [i915#3555] / [i915#8228])
   [222]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_168435v4/shard-rkl-2/igt@kms_hdr@invalid-metadata-sizes.html

  * igt@kms_invalid_mode@bad-hsync-end:
    - shard-dg2:          [PASS][223] -> [SKIP][224] ([i915#16746] / [i915#3555]) +1 other test skip
   [223]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19375/shard-dg2-3/igt@kms_invalid_mode@bad-hsync-end.html
   [224]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_168435v4/shard-dg2-7/igt@kms_invalid_mode@bad-hsync-end.html

  * igt@kms_invalid_mode@overflow-vrefresh:
    - shard-dg2:          [PASS][225] -> [SKIP][226] ([i915#16746])
   [225]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19375/shard-dg2-4/igt@kms_invalid_mode@overflow-vrefresh.html
   [226]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_168435v4/shard-dg2-7/igt@kms_invalid_mode@overflow-vrefresh.html

  * igt@kms_joiner@basic-force-big-joiner:
    - shard-rkl:          NOTRUN -> [SKIP][227] ([i915#15459])
   [227]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_168435v4/shard-rkl-2/igt@kms_joiner@basic-force-big-joiner.html

  * igt@kms_joiner@basic-max-non-joiner:
    - shard-rkl:          NOTRUN -> [SKIP][228] ([i915#13688])
   [228]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_168435v4/shard-rkl-5/igt@kms_joiner@basic-max-non-joiner.html

  * igt@kms_joiner@basic-ultra-joiner:
    - shard-rkl:          NOTRUN -> [SKIP][229] ([i915#15458])
   [229]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_168435v4/shard-rkl-8/igt@kms_joiner@basic-ultra-joiner.html
    - shard-mtlp:         NOTRUN -> [SKIP][230] ([i915#15458])
   [230]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_168435v4/shard-mtlp-8/igt@kms_joiner@basic-ultra-joiner.html

  * igt@kms_joiner@invalid-modeset-big-joiner:
    - shard-tglu:         NOTRUN -> [SKIP][231] ([i915#15460])
   [231]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_168435v4/shard-tglu-9/igt@kms_joiner@invalid-modeset-big-joiner.html

  * igt@kms_joiner@switch-modeset-ultra-joiner-big-joiner:
    - shard-tglu-1:       NOTRUN -> [SKIP][232] ([i915#15638] / [i915#15722])
   [232]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_168435v4/shard-tglu-1/igt@kms_joiner@switch-modeset-ultra-joiner-big-joiner.html

  * igt@kms_multipipe_modeset@basic-max-pipe-crc-check:
    - shard-rkl:          NOTRUN -> [SKIP][233] ([i915#15815])
   [233]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_168435v4/shard-rkl-8/igt@kms_multipipe_modeset@basic-max-pipe-crc-check.html

  * igt@kms_panel_fitting@atomic-fastset:
    - shard-dg2:          NOTRUN -> [SKIP][234] ([i915#6301])
   [234]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_168435v4/shard-dg2-4/igt@kms_panel_fitting@atomic-fastset.html
    - shard-tglu:         NOTRUN -> [SKIP][235] ([i915#6301])
   [235]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_168435v4/shard-tglu-8/igt@kms_panel_fitting@atomic-fastset.html

  * igt@kms_panel_fitting@legacy:
    - shard-dg1:          NOTRUN -> [SKIP][236] ([i915#6301])
   [236]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_168435v4/shard-dg1-15/igt@kms_panel_fitting@legacy.html

  * igt@kms_pipe_crc_basic@hang-read-crc:
    - shard-dg2:          [PASS][237] -> [SKIP][238] ([i915#11190] / [i915#17356]) +2 other tests skip
   [237]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19375/shard-dg2-8/igt@kms_pipe_crc_basic@hang-read-crc.html
   [238]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_168435v4/shard-dg2-7/igt@kms_pipe_crc_basic@hang-read-crc.html

  * igt@kms_pipe_stress@stress-xrgb8888-4tiled:
    - shard-tglu-1:       NOTRUN -> [SKIP][239] ([i915#14712])
   [239]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_168435v4/shard-tglu-1/igt@kms_pipe_stress@stress-xrgb8888-4tiled.html

  * igt@kms_pipe_stress@stress-xrgb8888-yftiled:
    - shard-dg1:          NOTRUN -> [SKIP][240] ([i915#14712])
   [240]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_168435v4/shard-dg1-16/igt@kms_pipe_stress@stress-xrgb8888-yftiled.html

  * igt@kms_plane@pixel-format-4-tiled-dg2-rc-ccs-cc-modifier@pipe-a-plane-5:
    - shard-dg2:          NOTRUN -> [SKIP][241] ([i915#16386]) +1 other test skip
   [241]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_168435v4/shard-dg2-4/igt@kms_plane@pixel-format-4-tiled-dg2-rc-ccs-cc-modifier@pipe-a-plane-5.html

  * igt@kms_plane@pixel-format-4-tiled-mtl-rc-ccs-cc-modifier:
    - shard-rkl:          NOTRUN -> [SKIP][242] ([i915#15709]) +3 other tests skip
   [242]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_168435v4/shard-rkl-8/igt@kms_plane@pixel-format-4-tiled-mtl-rc-ccs-cc-modifier.html

  * igt@kms_plane@pixel-format-4-tiled-mtl-rc-ccs-cc-modifier@pipe-a-plane-5:
    - shard-mtlp:         NOTRUN -> [SKIP][243] ([i915#16386]) +1 other test skip
   [243]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_168435v4/shard-mtlp-8/igt@kms_plane@pixel-format-4-tiled-mtl-rc-ccs-cc-modifier@pipe-a-plane-5.html

  * igt@kms_plane@pixel-format-x-tiled-modifier:
    - shard-dg2:          [PASS][244] -> [SKIP][245] ([i915#8825])
   [244]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19375/shard-dg2-4/igt@kms_plane@pixel-format-x-tiled-modifier.html
   [245]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_168435v4/shard-dg2-7/igt@kms_plane@pixel-format-x-tiled-modifier.html

  * igt@kms_plane@pixel-format-y-tiled-ccs-modifier:
    - shard-dg1:          NOTRUN -> [SKIP][246] ([i915#15709]) +2 other tests skip
   [246]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_168435v4/shard-dg1-15/igt@kms_plane@pixel-format-y-tiled-ccs-modifier.html

  * igt@kms_plane@pixel-format-y-tiled-ccs-modifier-source-clamping:
    - shard-tglu:         NOTRUN -> [SKIP][247] ([i915#15709]) +3 other tests skip
   [247]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_168435v4/shard-tglu-7/igt@kms_plane@pixel-format-y-tiled-ccs-modifier-source-clamping.html

  * igt@kms_plane@pixel-format-y-tiled-gen12-rc-ccs-modifier@pipe-b-plane-5:
    - shard-rkl:          NOTRUN -> [SKIP][248] ([i915#16386]) +3 other tests skip
   [248]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_168435v4/shard-rkl-2/igt@kms_plane@pixel-format-y-tiled-gen12-rc-ccs-modifier@pipe-b-plane-5.html

  * igt@kms_plane@pixel-format-y-tiled-modifier@pipe-b-plane-7:
    - shard-tglu:         NOTRUN -> [SKIP][249] ([i915#16386]) +1 other test skip
   [249]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_168435v4/shard-tglu-8/igt@kms_plane@pixel-format-y-tiled-modifier@pipe-b-plane-7.html

  * igt@kms_plane_alpha_blend@alpha-opaque-fb:
    - shard-glk10:        NOTRUN -> [FAIL][250] ([i915#10647] / [i915#12169])
   [250]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_168435v4/shard-glk10/igt@kms_plane_alpha_blend@alpha-opaque-fb.html

  * igt@kms_plane_alpha_blend@alpha-opaque-fb@pipe-c-hdmi-a-1:
    - shard-glk10:        NOTRUN -> [FAIL][251] ([i915#10647]) +1 other test fail
   [251]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_168435v4/shard-glk10/igt@kms_plane_alpha_blend@alpha-opaque-fb@pipe-c-hdmi-a-1.html

  * igt@kms_plane_multiple@2x-tiling-none:
    - shard-tglu:         NOTRUN -> [SKIP][252] ([i915#13958])
   [252]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_168435v4/shard-tglu-9/igt@kms_plane_multiple@2x-tiling-none.html

  * igt@kms_plane_multiple@2x-tiling-y:
    - shard-rkl:          NOTRUN -> [SKIP][253] ([i915#13958])
   [253]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_168435v4/shard-rkl-8/igt@kms_plane_multiple@2x-tiling-y.html
    - shard-mtlp:         NOTRUN -> [SKIP][254] ([i915#13958])
   [254]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_168435v4/shard-mtlp-8/igt@kms_plane_multiple@2x-tiling-y.html

  * igt@kms_plane_multiple@2x-tiling-yf:
    - shard-dg1:          NOTRUN -> [SKIP][255] ([i915#13958])
   [255]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_168435v4/shard-dg1-15/igt@kms_plane_multiple@2x-tiling-yf.html

  * igt@kms_plane_scaling@invalid-num-scalers:
    - shard-dg2:          [PASS][256] -> [SKIP][257] ([i915#17356] / [i915#3555] / [i915#6953] / [i915#9423])
   [256]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19375/shard-dg2-3/igt@kms_plane_scaling@invalid-num-scalers.html
   [257]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_168435v4/shard-dg2-7/igt@kms_plane_scaling@invalid-num-scalers.html

  * igt@kms_plane_scaling@plane-downscale-factor-0-75-with-rotation@pipe-a:
    - shard-tglu:         NOTRUN -> [SKIP][258] ([i915#15329]) +4 other tests skip
   [258]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_168435v4/shard-tglu-7/igt@kms_plane_scaling@plane-downscale-factor-0-75-with-rotation@pipe-a.html

  * igt@kms_plane_scaling@plane-upscale-20x20-with-modifiers:
    - shard-dg2:          [PASS][259] -> [SKIP][260] ([i915#15329] / [i915#17356] / [i915#9423]) +3 other tests skip
   [259]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19375/shard-dg2-8/igt@kms_plane_scaling@plane-upscale-20x20-with-modifiers.html
   [260]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_168435v4/shard-dg2-7/igt@kms_plane_scaling@plane-upscale-20x20-with-modifiers.html

  * igt@kms_plane_scaling@plane-upscale-20x20-with-modifiers@pipe-d:
    - shard-dg2:          [PASS][261] -> [SKIP][262] ([i915#15329] / [i915#17356]) +6 other tests skip
   [261]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19375/shard-dg2-8/igt@kms_plane_scaling@plane-upscale-20x20-with-modifiers@pipe-d.html
   [262]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_168435v4/shard-dg2-7/igt@kms_plane_scaling@plane-upscale-20x20-with-modifiers@pipe-d.html

  * igt@kms_plane_scaling@planes-downscale-factor-0-75:
    - shard-dg2:          [PASS][263] -> [SKIP][264] ([i915#15329] / [i915#17356] / [i915#3555] / [i915#6953] / [i915#9423])
   [263]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19375/shard-dg2-8/igt@kms_plane_scaling@planes-downscale-factor-0-75.html
   [264]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_168435v4/shard-dg2-7/igt@kms_plane_scaling@planes-downscale-factor-0-75.html

  * igt@kms_plane_scaling@planes-scaler-unity-scaling:
    - shard-dg2:          [PASS][265] -> [SKIP][266] ([i915#15329] / [i915#17356] / [i915#3555] / [i915#9423])
   [265]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19375/shard-dg2-8/igt@kms_plane_scaling@planes-scaler-unity-scaling.html
   [266]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_168435v4/shard-dg2-7/igt@kms_plane_scaling@planes-scaler-unity-scaling.html

  * igt@kms_plane_scaling@planes-scaler-unity-scaling@pipe-a:
    - shard-dg2:          [PASS][267] -> [SKIP][268] ([i915#15329]) +20 other tests skip
   [267]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19375/shard-dg2-8/igt@kms_plane_scaling@planes-scaler-unity-scaling@pipe-a.html
   [268]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_168435v4/shard-dg2-7/igt@kms_plane_scaling@planes-scaler-unity-scaling@pipe-a.html

  * igt@kms_plane_scaling@planes-upscale-20x20:
    - shard-dg2:          [PASS][269] -> [SKIP][270] ([i915#15329] / [i915#17356] / [i915#6953] / [i915#9423])
   [269]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19375/shard-dg2-3/igt@kms_plane_scaling@planes-upscale-20x20.html
   [270]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_168435v4/shard-dg2-7/igt@kms_plane_scaling@planes-upscale-20x20.html

  * igt@kms_pm_backlight@bad-brightness:
    - shard-tglu:         NOTRUN -> [SKIP][271] ([i915#12343] / [i915#9812])
   [271]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_168435v4/shard-tglu-8/igt@kms_pm_backlight@bad-brightness.html

  * igt@kms_pm_backlight@fade:
    - shard-dg2:          NOTRUN -> [SKIP][272] ([i915#12343] / [i915#5354])
   [272]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_168435v4/shard-dg2-8/igt@kms_pm_backlight@fade.html

  * igt@kms_pm_backlight@fade-with-suspend:
    - shard-dg1:          NOTRUN -> [SKIP][273] ([i915#12343] / [i915#5354])
   [273]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_168435v4/shard-dg1-16/igt@kms_pm_backlight@fade-with-suspend.html

  * igt@kms_pm_dc@dc5-psr-suspend-resume:
    - shard-dg2:          NOTRUN -> [SKIP][274] ([i915#16914])
   [274]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_168435v4/shard-dg2-8/igt@kms_pm_dc@dc5-psr-suspend-resume.html

  * igt@kms_pm_lpsp@kms-lpsp:
    - shard-tglu-1:       NOTRUN -> [SKIP][275] ([i915#3828])
   [275]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_168435v4/shard-tglu-1/igt@kms_pm_lpsp@kms-lpsp.html

  * igt@kms_pm_lpsp@screens-disabled:
    - shard-tglu:         NOTRUN -> [SKIP][276] ([i915#8430])
   [276]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_168435v4/shard-tglu-7/igt@kms_pm_lpsp@screens-disabled.html

  * igt@kms_pm_rpm@dpms-mode-unset-non-lpsp:
    - shard-rkl:          NOTRUN -> [SKIP][277] ([i915#15073])
   [277]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_168435v4/shard-rkl-8/igt@kms_pm_rpm@dpms-mode-unset-non-lpsp.html

  * igt@kms_pm_rpm@dpms-non-lpsp:
    - shard-tglu:         NOTRUN -> [SKIP][278] ([i915#15073])
   [278]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_168435v4/shard-tglu-9/igt@kms_pm_rpm@dpms-non-lpsp.html

  * igt@kms_pm_rpm@i2c:
    - shard-dg2:          [PASS][279] -> [SKIP][280]
   [279]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19375/shard-dg2-8/igt@kms_pm_rpm@i2c.html
   [280]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_168435v4/shard-dg2-7/igt@kms_pm_rpm@i2c.html
    - shard-dg1:          [PASS][281] -> [DMESG-WARN][282] ([i915#4423])
   [281]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19375/shard-dg1-18/igt@kms_pm_rpm@i2c.html
   [282]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_168435v4/shard-dg1-18/igt@kms_pm_rpm@i2c.html

  * igt@kms_pm_rpm@modeset-lpsp-stress:
    - shard-rkl:          [PASS][283] -> [SKIP][284] ([i915#15073]) +1 other test skip
   [283]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19375/shard-rkl-8/igt@kms_pm_rpm@modeset-lpsp-stress.html
   [284]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_168435v4/shard-rkl-7/igt@kms_pm_rpm@modeset-lpsp-stress.html

  * igt@kms_pm_rpm@modeset-non-lpsp:
    - shard-dg2:          [PASS][285] -> [SKIP][286] ([i915#15073]) +1 other test skip
   [285]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19375/shard-dg2-3/igt@kms_pm_rpm@modeset-non-lpsp.html
   [286]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_168435v4/shard-dg2-7/igt@kms_pm_rpm@modeset-non-lpsp.html

  * igt@kms_prime@basic-crc-hybrid:
    - shard-dg1:          NOTRUN -> [SKIP][287] ([i915#6524])
   [287]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_168435v4/shard-dg1-15/igt@kms_prime@basic-crc-hybrid.html

  * igt@kms_prime@basic-modeset-hybrid:
    - shard-rkl:          NOTRUN -> [SKIP][288] ([i915#6524])
   [288]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_168435v4/shard-rkl-8/igt@kms_prime@basic-modeset-hybrid.html

  * igt@kms_psr2_sf@fbc-pr-overlay-plane-move-continuous-sf:
    - shard-mtlp:         NOTRUN -> [SKIP][289] ([i915#12316])
   [289]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_168435v4/shard-mtlp-8/igt@kms_psr2_sf@fbc-pr-overlay-plane-move-continuous-sf.html

  * igt@kms_psr2_sf@fbc-pr-overlay-plane-update-continuous-sf:
    - shard-glk11:        NOTRUN -> [SKIP][290] ([i915#11520]) +6 other tests skip
   [290]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_168435v4/shard-glk11/igt@kms_psr2_sf@fbc-pr-overlay-plane-update-continuous-sf.html

  * igt@kms_psr2_sf@fbc-pr-plane-move-sf-dmg-area:
    - shard-glk:          NOTRUN -> [SKIP][291] ([i915#11520]) +2 other tests skip
   [291]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_168435v4/shard-glk2/igt@kms_psr2_sf@fbc-pr-plane-move-sf-dmg-area.html

  * igt@kms_psr2_sf@fbc-pr-primary-plane-update-sf-dmg-area:
    - shard-rkl:          NOTRUN -> [SKIP][292] ([i915#11520]) +5 other tests skip
   [292]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_168435v4/shard-rkl-2/igt@kms_psr2_sf@fbc-pr-primary-plane-update-sf-dmg-area.html

  * igt@kms_psr2_sf@pr-cursor-plane-move-continuous-exceed-sf:
    - shard-glk10:        NOTRUN -> [SKIP][293] ([i915#11520]) +1 other test skip
   [293]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_168435v4/shard-glk10/igt@kms_psr2_sf@pr-cursor-plane-move-continuous-exceed-sf.html

  * igt@kms_psr2_sf@pr-overlay-plane-move-continuous-exceed-fully-sf:
    - shard-tglu:         NOTRUN -> [SKIP][294] ([i915#11520]) +5 other tests skip
   [294]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_168435v4/shard-tglu-7/igt@kms_psr2_sf@pr-overlay-plane-move-continuous-exceed-fully-sf.html

  * igt@kms_psr2_sf@pr-overlay-plane-move-continuous-exceed-sf:
    - shard-dg1:          NOTRUN -> [SKIP][295] ([i915#11520]) +2 other tests skip
   [295]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_168435v4/shard-dg1-16/igt@kms_psr2_sf@pr-overlay-plane-move-continuous-exceed-sf.html

  * igt@kms_psr2_sf@pr-primary-plane-update-sf-dmg-area-big-fb:
    - shard-tglu-1:       NOTRUN -> [SKIP][296] ([i915#11520])
   [296]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_168435v4/shard-tglu-1/igt@kms_psr2_sf@pr-primary-plane-update-sf-dmg-area-big-fb.html

  * igt@kms_psr2_sf@psr2-cursor-plane-move-continuous-exceed-fully-sf:
    - shard-dg2:          NOTRUN -> [SKIP][297] ([i915#11520])
   [297]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_168435v4/shard-dg2-8/igt@kms_psr2_sf@psr2-cursor-plane-move-continuous-exceed-fully-sf.html

  * igt@kms_psr2_su@frontbuffer-xrgb8888:
    - shard-rkl:          NOTRUN -> [SKIP][298] ([i915#9683])
   [298]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_168435v4/shard-rkl-8/igt@kms_psr2_su@frontbuffer-xrgb8888.html

  * igt@kms_psr@fbc-pr-sprite-render:
    - shard-dg1:          NOTRUN -> [SKIP][299] ([i915#1072] / [i915#9732]) +9 other tests skip
   [299]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_168435v4/shard-dg1-16/igt@kms_psr@fbc-pr-sprite-render.html

  * igt@kms_psr@fbc-psr-no-drrs:
    - shard-tglu:         NOTRUN -> [SKIP][300] ([i915#9732]) +14 other tests skip
   [300]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_168435v4/shard-tglu-8/igt@kms_psr@fbc-psr-no-drrs.html

  * igt@kms_psr@fbc-psr2-cursor-plane-onoff:
    - shard-mtlp:         NOTRUN -> [SKIP][301] ([i915#9688]) +2 other tests skip
   [301]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_168435v4/shard-mtlp-8/igt@kms_psr@fbc-psr2-cursor-plane-onoff.html

  * igt@kms_psr@fbc-psr2-primary-render:
    - shard-dg2:          NOTRUN -> [SKIP][302] ([i915#1072] / [i915#9732])
   [302]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_168435v4/shard-dg2-8/igt@kms_psr@fbc-psr2-primary-render.html

  * igt@kms_psr@pr-cursor-plane-onoff:
    - shard-rkl:          NOTRUN -> [SKIP][303] ([i915#1072] / [i915#9732]) +12 other tests skip
   [303]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_168435v4/shard-rkl-4/igt@kms_psr@pr-cursor-plane-onoff.html

  * igt@kms_psr@psr-cursor-plane-move:
    - shard-tglu-1:       NOTRUN -> [SKIP][304] ([i915#9732]) +4 other tests skip
   [304]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_168435v4/shard-tglu-1/igt@kms_psr@psr-cursor-plane-move.html

  * igt@kms_rotation_crc@exhaust-fences:
    - shard-dg1:          NOTRUN -> [SKIP][305] ([i915#4884])
   [305]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_168435v4/shard-dg1-16/igt@kms_rotation_crc@exhaust-fences.html

  * igt@kms_rotation_crc@multiplane-rotation:
    - shard-glk11:        NOTRUN -> [INCOMPLETE][306] ([i915#15492] / [i915#16184])
   [306]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_168435v4/shard-glk11/igt@kms_rotation_crc@multiplane-rotation.html

  * igt@kms_rotation_crc@primary-4-tiled-reflect-x-0:
    - shard-tglu-1:       NOTRUN -> [SKIP][307] ([i915#5289])
   [307]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_168435v4/shard-tglu-1/igt@kms_rotation_crc@primary-4-tiled-reflect-x-0.html

  * igt@kms_rotation_crc@primary-yf-tiled-reflect-x-180:
    - shard-rkl:          NOTRUN -> [SKIP][308] ([i915#5289]) +2 other tests skip
   [308]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_168435v4/shard-rkl-2/igt@kms_rotation_crc@primary-yf-tiled-reflect-x-180.html

  * igt@kms_scaling_modes@scaling-mode-center:
    - shard-dg2:          NOTRUN -> [SKIP][309] ([i915#3555])
   [309]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_168435v4/shard-dg2-4/igt@kms_scaling_modes@scaling-mode-center.html
    - shard-tglu:         NOTRUN -> [SKIP][310] ([i915#3555]) +2 other tests skip
   [310]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_168435v4/shard-tglu-8/igt@kms_scaling_modes@scaling-mode-center.html

  * igt@kms_setmode@basic-clone-single-crtc:
    - shard-dg1:          NOTRUN -> [SKIP][311] ([i915#3555]) +2 other tests skip
   [311]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_168435v4/shard-dg1-16/igt@kms_setmode@basic-clone-single-crtc.html

  * igt@kms_tiled_display@basic-test-pattern:
    - shard-rkl:          NOTRUN -> [SKIP][312] ([i915#8623])
   [312]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_168435v4/shard-rkl-4/igt@kms_tiled_display@basic-test-pattern.html

  * igt@kms_vrr@flip-basic:
    - shard-rkl:          NOTRUN -> [SKIP][313] ([i915#15243] / [i915#3555])
   [313]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_168435v4/shard-rkl-8/igt@kms_vrr@flip-basic.html
    - shard-mtlp:         NOTRUN -> [SKIP][314] ([i915#3555] / [i915#8808])
   [314]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_168435v4/shard-mtlp-8/igt@kms_vrr@flip-basic.html

  * igt@kms_vrr@flip-basic-fastset:
    - shard-rkl:          NOTRUN -> [SKIP][315] ([i915#9906])
   [315]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_168435v4/shard-rkl-4/igt@kms_vrr@flip-basic-fastset.html

  * igt@kms_vrr@lobf:
    - shard-dg1:          NOTRUN -> [SKIP][316] ([i915#11920])
   [316]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_168435v4/shard-dg1-16/igt@kms_vrr@lobf.html

  * igt@kms_vrr@max-min:
    - shard-tglu-1:       NOTRUN -> [SKIP][317] ([i915#9906])
   [317]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_168435v4/shard-tglu-1/igt@kms_vrr@max-min.html

  * igt@perf_pmu@busy-double-start@vecs0:
    - shard-mtlp:         [PASS][318] -> [FAIL][319] ([i915#4349])
   [318]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19375/shard-mtlp-8/igt@perf_pmu@busy-double-start@vecs0.html
   [319]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_168435v4/shard-mtlp-4/igt@perf_pmu@busy-double-start@vecs0.html

  * igt@perf_pmu@busy-start@bcs0:
    - shard-snb:          [PASS][320] -> [FAIL][321] ([i915#17084]) +2 other tests fail
   [320]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19375/shard-snb4/igt@perf_pmu@busy-start@bcs0.html
   [321]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_168435v4/shard-snb6/igt@perf_pmu@busy-start@bcs0.html

  * igt@perf_pmu@rc6-suspend:
    - shard-mtlp:         NOTRUN -> [INCOMPLETE][322] ([i915#13520])
   [322]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_168435v4/shard-mtlp-8/igt@perf_pmu@rc6-suspend.html

  * igt@perf_pmu@rc6@other-idle-gt0:
    - shard-rkl:          NOTRUN -> [SKIP][323] ([i915#8516])
   [323]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_168435v4/shard-rkl-2/igt@perf_pmu@rc6@other-idle-gt0.html

  * igt@prime_udl@share-import:
    - shard-rkl:          NOTRUN -> [SKIP][324] ([i915#16420])
   [324]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_168435v4/shard-rkl-4/igt@prime_udl@share-import.html

  * igt@prime_vgem@basic-fence-read:
    - shard-rkl:          NOTRUN -> [SKIP][325] ([i915#3291] / [i915#3708]) +1 other test skip
   [325]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_168435v4/shard-rkl-2/igt@prime_vgem@basic-fence-read.html

  * igt@prime_vgem@basic-gtt:
    - shard-dg2:          NOTRUN -> [SKIP][326] ([i915#3708] / [i915#4077])
   [326]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_168435v4/shard-dg2-4/igt@prime_vgem@basic-gtt.html

  * igt@prime_vgem@basic-write:
    - shard-mtlp:         NOTRUN -> [SKIP][327] ([i915#10216] / [i915#3708])
   [327]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_168435v4/shard-mtlp-8/igt@prime_vgem@basic-write.html

  
#### Possible fixes ####

  * igt@drm_read@short-buffer-wakeup:
    - shard-dg2:          [SKIP][328] ([i915#17359]) -> [PASS][329]
   [328]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19375/shard-dg2-7/igt@drm_read@short-buffer-wakeup.html
   [329]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_168435v4/shard-dg2-8/igt@drm_read@short-buffer-wakeup.html

  * igt@gem_ccs@suspend-resume:
    - shard-dg2:          [INCOMPLETE][330] ([i915#13356] / [i915#16348]) -> [PASS][331] +1 other test pass
   [330]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19375/shard-dg2-7/igt@gem_ccs@suspend-resume.html
   [331]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_168435v4/shard-dg2-8/igt@gem_ccs@suspend-resume.html

  * igt@gem_eio@in-flight-suspend:
    - shard-dg2:          [ABORT][332] -> [PASS][333]
   [332]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19375/shard-dg2-5/igt@gem_eio@in-flight-suspend.html
   [333]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_168435v4/shard-dg2-4/igt@gem_eio@in-flight-suspend.html

  * igt@i915_pm_rpm@system-suspend-execbuf:
    - shard-rkl:          [INCOMPLETE][334] ([i915#13356]) -> [PASS][335]
   [334]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19375/shard-rkl-7/igt@i915_pm_rpm@system-suspend-execbuf.html
   [335]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_168435v4/shard-rkl-5/igt@i915_pm_rpm@system-suspend-execbuf.html

  * igt@i915_suspend@fence-restore-untiled:
    - shard-rkl:          [INCOMPLETE][336] ([i915#4817]) -> [PASS][337]
   [336]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19375/shard-rkl-6/igt@i915_suspend@fence-restore-untiled.html
   [337]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_168435v4/shard-rkl-4/igt@i915_suspend@fence-restore-untiled.html

  * igt@i915_suspend@sysfs-reader:
    - shard-rkl:          [ABORT][338] ([i915#15140]) -> [PASS][339]
   [338]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19375/shard-rkl-1/igt@i915_suspend@sysfs-reader.html
   [339]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_168435v4/shard-rkl-8/igt@i915_suspend@sysfs-reader.html

  * igt@kms_ccs@crc-primary-suspend-4-tiled-mtl-rc-ccs@pipe-c-edp-1:
    - shard-mtlp:         [FAIL][340] ([i915#17158]) -> [PASS][341]
   [340]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19375/shard-mtlp-7/igt@kms_ccs@crc-primary-suspend-4-tiled-mtl-rc-ccs@pipe-c-edp-1.html
   [341]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_168435v4/shard-mtlp-8/igt@kms_ccs@crc-primary-suspend-4-tiled-mtl-rc-ccs@pipe-c-edp-1.html

  * igt@kms_ccs@crc-primary-suspend-4-tiled-mtl-rc-ccs@pipe-d-edp-1:
    - shard-mtlp:         [INCOMPLETE][342] ([i915#15582]) -> [PASS][343] +1 other test pass
   [342]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19375/shard-mtlp-7/igt@kms_ccs@crc-primary-suspend-4-tiled-mtl-rc-ccs@pipe-d-edp-1.html
   [343]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_168435v4/shard-mtlp-8/igt@kms_ccs@crc-primary-suspend-4-tiled-mtl-rc-ccs@pipe-d-edp-1.html

  * igt@kms_color@legacy-gamma-reset:
    - shard-dg2:          [SKIP][344] ([i915#12655] / [i915#17373]) -> [PASS][345] +1 other test pass
   [344]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19375/shard-dg2-7/igt@kms_color@legacy-gamma-reset.html
   [345]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_168435v4/shard-dg2-1/igt@kms_color@legacy-gamma-reset.html

  * igt@kms_cursor_crc@cursor-random-256x85:
    - shard-dg1:          [DMESG-WARN][346] ([i915#4423]) -> [PASS][347] +4 other tests pass
   [346]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19375/shard-dg1-17/igt@kms_cursor_crc@cursor-random-256x85.html
   [347]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_168435v4/shard-dg1-18/igt@kms_cursor_crc@cursor-random-256x85.html

  * igt@kms_cursor_crc@cursor-random-64x21:
    - shard-rkl:          [FAIL][348] ([i915#13566]) -> [PASS][349] +1 other test pass
   [348]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19375/shard-rkl-6/igt@kms_cursor_crc@cursor-random-64x21.html
   [349]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_168435v4/shard-rkl-4/igt@kms_cursor_crc@cursor-random-64x21.html

  * igt@kms_cursor_crc@cursor-suspend:
    - shard-rkl:          [INCOMPLETE][350] ([i915#12358] / [i915#14152]) -> [PASS][351]
   [350]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19375/shard-rkl-3/igt@kms_cursor_crc@cursor-suspend.html
   [351]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_168435v4/shard-rkl-2/igt@kms_cursor_crc@cursor-suspend.html

  * igt@kms_flip@flip-vs-expired-vblank-interruptible:
    - shard-dg1:          [FAIL][352] ([i915#13027]) -> [PASS][353]
   [352]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19375/shard-dg1-14/igt@kms_flip@flip-vs-expired-vblank-interruptible.html
   [353]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_168435v4/shard-dg1-19/igt@kms_flip@flip-vs-expired-vblank-interruptible.html

  * igt@kms_flip@plain-flip-fb-recreate:
    - shard-dg1:          [FAIL][354] ([i915#14600]) -> [PASS][355]
   [354]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19375/shard-dg1-12/igt@kms_flip@plain-flip-fb-recreate.html
   [355]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_168435v4/shard-dg1-14/igt@kms_flip@plain-flip-fb-recreate.html

  * igt@kms_flip@single-buffer-flip-vs-dpms-off-vs-modeset-interruptible:
    - shard-dg2:          [SKIP][356] ([i915#5354]) -> [PASS][357] +4 other tests pass
   [356]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19375/shard-dg2-7/igt@kms_flip@single-buffer-flip-vs-dpms-off-vs-modeset-interruptible.html
   [357]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_168435v4/shard-dg2-1/igt@kms_flip@single-buffer-flip-vs-dpms-off-vs-modeset-interruptible.html

  * igt@kms_flip_scaled_crc@flip-32bpp-4tile-to-64bpp-4tile-upscaling:
    - shard-dg2:          [SKIP][358] ([i915#3555] / [i915#8813]) -> [PASS][359] +1 other test pass
   [358]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19375/shard-dg2-7/igt@kms_flip_scaled_crc@flip-32bpp-4tile-to-64bpp-4tile-upscaling.html
   [359]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_168435v4/shard-dg2-8/igt@kms_flip_scaled_crc@flip-32bpp-4tile-to-64bpp-4tile-upscaling.html

  * igt@kms_frontbuffer_tracking@fbc-1p-offscreen-pri-indfb-draw-blt:
    - shard-dg2:          [SKIP][360] ([i915#16708]) -> [PASS][361]
   [360]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19375/shard-dg2-7/igt@kms_frontbuffer_tracking@fbc-1p-offscreen-pri-indfb-draw-blt.html
   [361]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_168435v4/shard-dg2-1/igt@kms_frontbuffer_tracking@fbc-1p-offscreen-pri-indfb-draw-blt.html

  * igt@kms_frontbuffer_tracking@fbc-1p-primscrn-spr-indfb-draw-blt:
    - shard-dg2:          [SKIP][362] ([i915#16708] / [i915#5354]) -> [PASS][363] +2 other tests pass
   [362]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19375/shard-dg2-7/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-spr-indfb-draw-blt.html
   [363]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_168435v4/shard-dg2-1/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-spr-indfb-draw-blt.html

  * igt@kms_frontbuffer_tracking@fbchdr-rgb101010-draw-mmap-wc:
    - shard-glk:          [SKIP][364] -> [PASS][365] +9 other tests pass
   [364]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19375/shard-glk1/igt@kms_frontbuffer_tracking@fbchdr-rgb101010-draw-mmap-wc.html
   [365]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_168435v4/shard-glk8/igt@kms_frontbuffer_tracking@fbchdr-rgb101010-draw-mmap-wc.html

  * igt@kms_frontbuffer_tracking@hdr-1p-primscrn-cur-indfb-move:
    - shard-rkl:          [SKIP][366] ([i915#15989]) -> [PASS][367] +2 other tests pass
   [366]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19375/shard-rkl-3/igt@kms_frontbuffer_tracking@hdr-1p-primscrn-cur-indfb-move.html
   [367]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_168435v4/shard-rkl-1/igt@kms_frontbuffer_tracking@hdr-1p-primscrn-cur-indfb-move.html

  * igt@kms_invalid_mode@bad-htotal:
    - shard-dg2:          [SKIP][368] ([i915#16746] / [i915#3555]) -> [PASS][369]
   [368]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19375/shard-dg2-7/igt@kms_invalid_mode@bad-htotal.html
   [369]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_168435v4/shard-dg2-4/igt@kms_invalid_mode@bad-htotal.html

  * igt@kms_plane@pixel-format-x-tiled-modifier-source-clamping:
    - shard-dg2:          [SKIP][370] ([i915#8825]) -> [PASS][371] +3 other tests pass
   [370]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19375/shard-dg2-7/igt@kms_plane@pixel-format-x-tiled-modifier-source-clamping.html
   [371]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_168435v4/shard-dg2-1/igt@kms_plane@pixel-format-x-tiled-modifier-source-clamping.html

  * igt@kms_plane_scaling@planes-downscale-factor-0-5-unity-scaling:
    - shard-dg2:          [SKIP][372] ([i915#15329] / [i915#17356] / [i915#9423]) -> [PASS][373]
   [372]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19375/shard-dg2-7/igt@kms_plane_scaling@planes-downscale-factor-0-5-unity-scaling.html
   [373]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_168435v4/shard-dg2-1/igt@kms_plane_scaling@planes-downscale-factor-0-5-unity-scaling.html

  * igt@kms_plane_scaling@planes-upscale-20x20-downscale-factor-0-5:
    - shard-dg2:          [SKIP][374] ([i915#15329] / [i915#17356] / [i915#3555] / [i915#6953] / [i915#9423]) -> [PASS][375]
   [374]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19375/shard-dg2-7/igt@kms_plane_scaling@planes-upscale-20x20-downscale-factor-0-5.html
   [375]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_168435v4/shard-dg2-1/igt@kms_plane_scaling@planes-upscale-20x20-downscale-factor-0-5.html

  * igt@kms_plane_scaling@planes-upscale-20x20-downscale-factor-0-5@pipe-a:
    - shard-dg2:          [SKIP][376] ([i915#15329]) -> [PASS][377] +5 other tests pass
   [376]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19375/shard-dg2-7/igt@kms_plane_scaling@planes-upscale-20x20-downscale-factor-0-5@pipe-a.html
   [377]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_168435v4/shard-dg2-1/igt@kms_plane_scaling@planes-upscale-20x20-downscale-factor-0-5@pipe-a.html

  * igt@kms_plane_scaling@planes-upscale-20x20-downscale-factor-0-5@pipe-d:
    - shard-dg2:          [SKIP][378] ([i915#15329] / [i915#17356]) -> [PASS][379] +1 other test pass
   [378]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19375/shard-dg2-7/igt@kms_plane_scaling@planes-upscale-20x20-downscale-factor-0-5@pipe-d.html
   [379]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_168435v4/shard-dg2-1/igt@kms_plane_scaling@planes-upscale-20x20-downscale-factor-0-5@pipe-d.html

  * igt@kms_pm_rpm@dpms-lpsp:
    - shard-dg1:          [SKIP][380] ([i915#15073]) -> [PASS][381] +2 other tests pass
   [380]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19375/shard-dg1-17/igt@kms_pm_rpm@dpms-lpsp.html
   [381]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_168435v4/shard-dg1-14/igt@kms_pm_rpm@dpms-lpsp.html

  * igt@kms_pm_rpm@dpms-mode-unset-lpsp:
    - shard-rkl:          [SKIP][382] ([i915#15073]) -> [PASS][383]
   [382]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19375/shard-rkl-3/igt@kms_pm_rpm@dpms-mode-unset-lpsp.html
   [383]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_168435v4/shard-rkl-2/igt@kms_pm_rpm@dpms-mode-unset-lpsp.html

  * igt@kms_pm_rpm@system-suspend-idle:
    - shard-dg2:          [SKIP][384] ([i915#9519]) -> [PASS][385]
   [384]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19375/shard-dg2-7/igt@kms_pm_rpm@system-suspend-idle.html
   [385]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_168435v4/shard-dg2-4/igt@kms_pm_rpm@system-suspend-idle.html

  * igt@kms_pm_rpm@system-suspend-modeset:
    - shard-rkl:          [INCOMPLETE][386] ([i915#14419]) -> [PASS][387]
   [386]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19375/shard-rkl-3/igt@kms_pm_rpm@system-suspend-modeset.html
   [387]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_168435v4/shard-rkl-2/igt@kms_pm_rpm@system-suspend-modeset.html

  * igt@kms_vblank@ts-continuation-modeset:
    - shard-dg2:          [SKIP][388] ([i915#17356]) -> [PASS][389] +37 other tests pass
   [388]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19375/shard-dg2-7/igt@kms_vblank@ts-continuation-modeset.html
   [389]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_168435v4/shard-dg2-1/igt@kms_vblank@ts-continuation-modeset.html

  
#### Warnings ####

  * igt@api_intel_bb@blit-reloc-keep-cache:
    - shard-rkl:          [SKIP][390] ([i915#14544] / [i915#8411]) -> [SKIP][391] ([i915#8411])
   [390]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19375/shard-rkl-6/igt@api_intel_bb@blit-reloc-keep-cache.html
   [391]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_168435v4/shard-rkl-4/igt@api_intel_bb@blit-reloc-keep-cache.html

  * igt@gem_bad_reloc@negative-reloc-lut:
    - shard-rkl:          [SKIP][392] ([i915#3281]) -> [SKIP][393] ([i915#14544] / [i915#3281]) +3 other tests skip
   [392]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19375/shard-rkl-1/igt@gem_bad_reloc@negative-reloc-lut.html
   [393]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_168435v4/shard-rkl-6/igt@gem_bad_reloc@negative-reloc-lut.html

  * igt@gem_ccs@block-multicopy-inplace:
    - shard-rkl:          [SKIP][394] ([i915#14544] / [i915#3555] / [i915#9323]) -> [SKIP][395] ([i915#3555] / [i915#9323])
   [394]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19375/shard-rkl-6/igt@gem_ccs@block-multicopy-inplace.html
   [395]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_168435v4/shard-rkl-4/igt@gem_ccs@block-multicopy-inplace.html

  * igt@gem_exec_balancer@parallel-balancer:
    - shard-rkl:          [SKIP][396] ([i915#4525]) -> [SKIP][397] ([i915#14544] / [i915#4525])
   [396]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19375/shard-rkl-1/igt@gem_exec_balancer@parallel-balancer.html
   [397]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_168435v4/shard-rkl-6/igt@gem_exec_balancer@parallel-balancer.html

  * igt@gem_exec_capture@capture-recoverable:
    - shard-rkl:          [SKIP][398] ([i915#6344]) -> [SKIP][399] ([i915#14544] / [i915#6344])
   [398]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19375/shard-rkl-1/igt@gem_exec_capture@capture-recoverable.html
   [399]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_168435v4/shard-rkl-6/igt@gem_exec_capture@capture-recoverable.html

  * igt@gem_exec_reloc@basic-concurrent16:
    - shard-rkl:          [SKIP][400] ([i915#14544] / [i915#3281]) -> [SKIP][401] ([i915#3281]) +2 other tests skip
   [400]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19375/shard-rkl-6/igt@gem_exec_reloc@basic-concurrent16.html
   [401]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_168435v4/shard-rkl-4/igt@gem_exec_reloc@basic-concurrent16.html

  * igt@gem_lmem_evict@dontneed-evict-race:
    - shard-rkl:          [SKIP][402] ([i915#14544] / [i915#4613] / [i915#7582]) -> [SKIP][403] ([i915#4613] / [i915#7582])
   [402]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19375/shard-rkl-6/igt@gem_lmem_evict@dontneed-evict-race.html
   [403]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_168435v4/shard-rkl-4/igt@gem_lmem_evict@dontneed-evict-race.html

  * igt@gem_lmem_swapping@heavy-multi:
    - shard-rkl:          [SKIP][404] ([i915#4613]) -> [SKIP][405] ([i915#14544] / [i915#4613]) +1 other test skip
   [404]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19375/shard-rkl-1/igt@gem_lmem_swapping@heavy-multi.html
   [405]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_168435v4/shard-rkl-6/igt@gem_lmem_swapping@heavy-multi.html

  * igt@gem_pread@display:
    - shard-rkl:          [SKIP][406] ([i915#14544] / [i915#3282]) -> [SKIP][407] ([i915#3282]) +2 other tests skip
   [406]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19375/shard-rkl-6/igt@gem_pread@display.html
   [407]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_168435v4/shard-rkl-4/igt@gem_pread@display.html

  * igt@gem_readwrite@beyond-eob:
    - shard-rkl:          [SKIP][408] ([i915#3282]) -> [SKIP][409] ([i915#14544] / [i915#3282])
   [408]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19375/shard-rkl-1/igt@gem_readwrite@beyond-eob.html
   [409]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_168435v4/shard-rkl-6/igt@gem_readwrite@beyond-eob.html

  * igt@gem_userptr_blits@readonly-unsync:
    - shard-rkl:          [SKIP][410] ([i915#3297]) -> [SKIP][411] ([i915#14544] / [i915#3297])
   [410]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19375/shard-rkl-4/igt@gem_userptr_blits@readonly-unsync.html
   [411]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_168435v4/shard-rkl-6/igt@gem_userptr_blits@readonly-unsync.html

  * igt@gen9_exec_parse@bb-start-cmd:
    - shard-rkl:          [SKIP][412] ([i915#2527]) -> [SKIP][413] ([i915#14544] / [i915#2527])
   [412]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19375/shard-rkl-1/igt@gen9_exec_parse@bb-start-cmd.html
   [413]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_168435v4/shard-rkl-6/igt@gen9_exec_parse@bb-start-cmd.html

  * igt@gen9_exec_parse@bb-start-param:
    - shard-rkl:          [SKIP][414] ([i915#14544] / [i915#2527]) -> [SKIP][415] ([i915#2527]) +1 other test skip
   [414]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19375/shard-rkl-6/igt@gen9_exec_parse@bb-start-param.html
   [415]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_168435v4/shard-rkl-4/igt@gen9_exec_parse@bb-start-param.html

  * igt@i915_pm_rc6_residency@rc6-idle:
    - shard-rkl:          [SKIP][416] ([i915#14498]) -> [SKIP][417] ([i915#14498] / [i915#14544])
   [416]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19375/shard-rkl-1/igt@i915_pm_rc6_residency@rc6-idle.html
   [417]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_168435v4/shard-rkl-6/igt@i915_pm_rc6_residency@rc6-idle.html

  * igt@i915_query@test-query-geometry-subslices:
    - shard-rkl:          [SKIP][418] ([i915#14544] / [i915#5723]) -> [SKIP][419] ([i915#5723])
   [418]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19375/shard-rkl-6/igt@i915_query@test-query-geometry-subslices.html
   [419]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_168435v4/shard-rkl-4/igt@i915_query@test-query-geometry-subslices.html

  * igt@kms_atomic_transition@plane-all-modeset-transition-fencing-internal-panels:
    - shard-dg2:          [SKIP][420] ([i915#1769] / [i915#3555]) -> [SKIP][421] ([i915#17356])
   [420]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19375/shard-dg2-3/igt@kms_atomic_transition@plane-all-modeset-transition-fencing-internal-panels.html
   [421]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_168435v4/shard-dg2-7/igt@kms_atomic_transition@plane-all-modeset-transition-fencing-internal-panels.html

  * igt@kms_atomic_transition@plane-all-modeset-transition-internal-panels:
    - shard-rkl:          [SKIP][422] ([i915#14544] / [i915#1769] / [i915#3555]) -> [SKIP][423] ([i915#1769] / [i915#3555])
   [422]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19375/shard-rkl-6/igt@kms_atomic_transition@plane-all-modeset-transition-internal-panels.html
   [423]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_168435v4/shard-rkl-4/igt@kms_atomic_transition@plane-all-modeset-transition-internal-panels.html

  * igt@kms_big_fb@4-tiled-16bpp-rotate-0:
    - shard-rkl:          [SKIP][424] ([i915#5286]) -> [SKIP][425] ([i915#14544] / [i915#5286]) +2 other tests skip
   [424]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19375/shard-rkl-1/igt@kms_big_fb@4-tiled-16bpp-rotate-0.html
   [425]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_168435v4/shard-rkl-6/igt@kms_big_fb@4-tiled-16bpp-rotate-0.html

  * igt@kms_big_fb@4-tiled-16bpp-rotate-90:
    - shard-dg2:          [SKIP][426] -> [SKIP][427] ([i915#17356]) +5 other tests skip
   [426]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19375/shard-dg2-8/igt@kms_big_fb@4-tiled-16bpp-rotate-90.html
   [427]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_168435v4/shard-dg2-7/igt@kms_big_fb@4-tiled-16bpp-rotate-90.html

  * igt@kms_big_fb@4-tiled-64bpp-rotate-90:
    - shard-dg2:          [SKIP][428] ([i915#17356]) -> [SKIP][429] +1 other test skip
   [428]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19375/shard-dg2-7/igt@kms_big_fb@4-tiled-64bpp-rotate-90.html
   [429]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_168435v4/shard-dg2-1/igt@kms_big_fb@4-tiled-64bpp-rotate-90.html

  * igt@kms_big_fb@4-tiled-addfb-size-overflow:
    - shard-rkl:          [SKIP][430] ([i915#14544] / [i915#5286]) -> [SKIP][431] ([i915#5286]) +2 other tests skip
   [430]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19375/shard-rkl-6/igt@kms_big_fb@4-tiled-addfb-size-overflow.html
   [431]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_168435v4/shard-rkl-4/igt@kms_big_fb@4-tiled-addfb-size-overflow.html

  * igt@kms_big_fb@linear-32bpp-rotate-90:
    - shard-rkl:          [SKIP][432] ([i915#14544] / [i915#3638]) -> [SKIP][433] ([i915#3638]) +1 other test skip
   [432]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19375/shard-rkl-6/igt@kms_big_fb@linear-32bpp-rotate-90.html
   [433]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_168435v4/shard-rkl-4/igt@kms_big_fb@linear-32bpp-rotate-90.html

  * igt@kms_big_fb@linear-max-hw-stride-64bpp-rotate-180-hflip:
    - shard-dg2:          [SKIP][434] ([i915#17356]) -> [SKIP][435] ([i915#3828])
   [434]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19375/shard-dg2-7/igt@kms_big_fb@linear-max-hw-stride-64bpp-rotate-180-hflip.html
   [435]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_168435v4/shard-dg2-8/igt@kms_big_fb@linear-max-hw-stride-64bpp-rotate-180-hflip.html

  * igt@kms_big_fb@y-tiled-8bpp-rotate-90:
    - shard-dg2:          [SKIP][436] ([i915#4538] / [i915#5190]) -> [SKIP][437] ([i915#17356] / [i915#5190]) +5 other tests skip
   [436]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19375/shard-dg2-3/igt@kms_big_fb@y-tiled-8bpp-rotate-90.html
   [437]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_168435v4/shard-dg2-7/igt@kms_big_fb@y-tiled-8bpp-rotate-90.html

  * igt@kms_big_fb@y-tiled-addfb-size-overflow:
    - shard-dg2:          [SKIP][438] ([i915#5190]) -> [SKIP][439] ([i915#17356] / [i915#5190]) +3 other tests skip
   [438]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19375/shard-dg2-8/igt@kms_big_fb@y-tiled-addfb-size-overflow.html
   [439]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_168435v4/shard-dg2-7/igt@kms_big_fb@y-tiled-addfb-size-overflow.html

  * igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-0-async-flip:
    - shard-dg2:          [SKIP][440] ([i915#17356] / [i915#5190]) -> [SKIP][441] ([i915#4538] / [i915#5190]) +6 other tests skip
   [440]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19375/shard-dg2-7/igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-0-async-flip.html
   [441]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_168435v4/shard-dg2-1/igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-0-async-flip.html

  * igt@kms_big_fb@yf-tiled-16bpp-rotate-270:
    - shard-rkl:          [SKIP][442] -> [SKIP][443] ([i915#14544]) +34 other tests skip
   [442]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19375/shard-rkl-1/igt@kms_big_fb@yf-tiled-16bpp-rotate-270.html
   [443]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_168435v4/shard-rkl-6/igt@kms_big_fb@yf-tiled-16bpp-rotate-270.html

  * igt@kms_big_fb@yf-tiled-8bpp-rotate-90:
    - shard-dg1:          [SKIP][444] ([i915#4423] / [i915#4538]) -> [SKIP][445] ([i915#4538]) +1 other test skip
   [444]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19375/shard-dg1-17/igt@kms_big_fb@yf-tiled-8bpp-rotate-90.html
   [445]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_168435v4/shard-dg1-18/igt@kms_big_fb@yf-tiled-8bpp-rotate-90.html

  * igt@kms_ccs@bad-aux-stride-y-tiled-gen12-rc-ccs-cc:
    - shard-dg2:          [SKIP][446] ([i915#17356]) -> [SKIP][447] ([i915#10307] / [i915#6095]) +7 other tests skip
   [446]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19375/shard-dg2-7/igt@kms_ccs@bad-aux-stride-y-tiled-gen12-rc-ccs-cc.html
   [447]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_168435v4/shard-dg2-1/igt@kms_ccs@bad-aux-stride-y-tiled-gen12-rc-ccs-cc.html

  * igt@kms_ccs@bad-rotation-90-4-tiled-lnl-ccs:
    - shard-dg2:          [SKIP][448] ([i915#12313]) -> [SKIP][449] ([i915#17356]) +2 other tests skip
   [448]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19375/shard-dg2-4/igt@kms_ccs@bad-rotation-90-4-tiled-lnl-ccs.html
   [449]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_168435v4/shard-dg2-7/igt@kms_ccs@bad-rotation-90-4-tiled-lnl-ccs.html

  * igt@kms_ccs@bad-rotation-90-4-tiled-mtl-rc-ccs@pipe-b-hdmi-a-2:
    - shard-rkl:          [SKIP][450] ([i915#6095]) -> [SKIP][451] ([i915#14544] / [i915#6095]) +9 other tests skip
   [450]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19375/shard-rkl-1/igt@kms_ccs@bad-rotation-90-4-tiled-mtl-rc-ccs@pipe-b-hdmi-a-2.html
   [451]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_168435v4/shard-rkl-6/igt@kms_ccs@bad-rotation-90-4-tiled-mtl-rc-ccs@pipe-b-hdmi-a-2.html

  * igt@kms_ccs@crc-primary-rotation-180-4-tiled-dg2-rc-ccs@pipe-c-hdmi-a-2:
    - shard-rkl:          [SKIP][452] ([i915#14098] / [i915#6095]) -> [SKIP][453] ([i915#14098] / [i915#14544] / [i915#6095]) +9 other tests skip
   [452]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19375/shard-rkl-1/igt@kms_ccs@crc-primary-rotation-180-4-tiled-dg2-rc-ccs@pipe-c-hdmi-a-2.html
   [453]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_168435v4/shard-rkl-6/igt@kms_ccs@crc-primary-rotation-180-4-tiled-dg2-rc-ccs@pipe-c-hdmi-a-2.html

  * igt@kms_ccs@crc-primary-rotation-180-4-tiled-mtl-rc-ccs@pipe-b-hdmi-a-2:
    - shard-rkl:          [SKIP][454] ([i915#14544] / [i915#6095]) -> [SKIP][455] ([i915#6095]) +6 other tests skip
   [454]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19375/shard-rkl-6/igt@kms_ccs@crc-primary-rotation-180-4-tiled-mtl-rc-ccs@pipe-b-hdmi-a-2.html
   [455]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_168435v4/shard-rkl-4/igt@kms_ccs@crc-primary-rotation-180-4-tiled-mtl-rc-ccs@pipe-b-hdmi-a-2.html

  * igt@kms_ccs@crc-primary-rotation-180-y-tiled-gen12-mc-ccs@pipe-a-hdmi-a-4:
    - shard-dg1:          [SKIP][456] ([i915#4423] / [i915#6095]) -> [SKIP][457] ([i915#6095]) +3 other tests skip
   [456]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19375/shard-dg1-17/igt@kms_ccs@crc-primary-rotation-180-y-tiled-gen12-mc-ccs@pipe-a-hdmi-a-4.html
   [457]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_168435v4/shard-dg1-18/igt@kms_ccs@crc-primary-rotation-180-y-tiled-gen12-mc-ccs@pipe-a-hdmi-a-4.html

  * igt@kms_ccs@crc-primary-suspend-4-tiled-bmg-ccs:
    - shard-dg2:          [SKIP][458] ([i915#17356]) -> [SKIP][459] ([i915#12805])
   [458]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19375/shard-dg2-7/igt@kms_ccs@crc-primary-suspend-4-tiled-bmg-ccs.html
   [459]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_168435v4/shard-dg2-4/igt@kms_ccs@crc-primary-suspend-4-tiled-bmg-ccs.html

  * igt@kms_ccs@crc-primary-suspend-4-tiled-dg2-rc-ccs@pipe-c-hdmi-a-2:
    - shard-rkl:          [SKIP][460] ([i915#14098] / [i915#14544] / [i915#6095]) -> [SKIP][461] ([i915#14098] / [i915#6095]) +7 other tests skip
   [460]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19375/shard-rkl-6/igt@kms_ccs@crc-primary-suspend-4-tiled-dg2-rc-ccs@pipe-c-hdmi-a-2.html
   [461]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_168435v4/shard-rkl-4/igt@kms_ccs@crc-primary-suspend-4-tiled-dg2-rc-ccs@pipe-c-hdmi-a-2.html

  * igt@kms_ccs@crc-primary-suspend-y-tiled-gen12-rc-ccs:
    - shard-dg2:          [SKIP][462] ([i915#17356]) -> [SKIP][463] ([i915#6095])
   [462]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19375/shard-dg2-7/igt@kms_ccs@crc-primary-suspend-y-tiled-gen12-rc-ccs.html
   [463]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_168435v4/shard-dg2-1/igt@kms_ccs@crc-primary-suspend-y-tiled-gen12-rc-ccs.html

  * igt@kms_ccs@crc-sprite-planes-basic-4-tiled-mtl-rc-ccs-cc:
    - shard-dg2:          [SKIP][464] ([i915#10307] / [i915#6095]) -> [SKIP][465] ([i915#17356]) +11 other tests skip
   [464]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19375/shard-dg2-3/igt@kms_ccs@crc-sprite-planes-basic-4-tiled-mtl-rc-ccs-cc.html
   [465]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_168435v4/shard-dg2-7/igt@kms_ccs@crc-sprite-planes-basic-4-tiled-mtl-rc-ccs-cc.html

  * igt@kms_ccs@random-ccs-data-4-tiled-bmg-ccs:
    - shard-rkl:          [SKIP][466] ([i915#12313]) -> [SKIP][467] ([i915#12313] / [i915#14544])
   [466]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19375/shard-rkl-1/igt@kms_ccs@random-ccs-data-4-tiled-bmg-ccs.html
   [467]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_168435v4/shard-rkl-6/igt@kms_ccs@random-ccs-data-4-tiled-bmg-ccs.html

  * igt@kms_cdclk@mode-transition:
    - shard-rkl:          [SKIP][468] ([i915#14544] / [i915#3742]) -> [SKIP][469] ([i915#3742])
   [468]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19375/shard-rkl-6/igt@kms_cdclk@mode-transition.html
   [469]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_168435v4/shard-rkl-4/igt@kms_cdclk@mode-transition.html

  * igt@kms_chamelium_color_pipeline@plane-ctm3x4:
    - shard-rkl:          [SKIP][470] ([i915#16471]) -> [SKIP][471] ([i915#14544] / [i915#16471])
   [470]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19375/shard-rkl-1/igt@kms_chamelium_color_pipeline@plane-ctm3x4.html
   [471]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_168435v4/shard-rkl-6/igt@kms_chamelium_color_pipeline@plane-ctm3x4.html

  * igt@kms_chamelium_color_pipeline@plane-lut1d-ctm3x4:
    - shard-dg1:          [SKIP][472] ([i915#16471] / [i915#4423]) -> [SKIP][473] ([i915#16471])
   [472]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19375/shard-dg1-17/igt@kms_chamelium_color_pipeline@plane-lut1d-ctm3x4.html
   [473]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_168435v4/shard-dg1-18/igt@kms_chamelium_color_pipeline@plane-lut1d-ctm3x4.html

  * igt@kms_chamelium_color_pipeline@plane-lut1d-ctm3x4-lut1d:
    - shard-rkl:          [SKIP][474] ([i915#14544] / [i915#16471]) -> [SKIP][475] ([i915#16471]) +1 other test skip
   [474]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19375/shard-rkl-6/igt@kms_chamelium_color_pipeline@plane-lut1d-ctm3x4-lut1d.html
   [475]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_168435v4/shard-rkl-4/igt@kms_chamelium_color_pipeline@plane-lut1d-ctm3x4-lut1d.html

  * igt@kms_chamelium_edid@vga-edid-read:
    - shard-rkl:          [SKIP][476] ([i915#11151] / [i915#14544] / [i915#7828]) -> [SKIP][477] ([i915#11151] / [i915#7828]) +1 other test skip
   [476]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19375/shard-rkl-6/igt@kms_chamelium_edid@vga-edid-read.html
   [477]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_168435v4/shard-rkl-4/igt@kms_chamelium_edid@vga-edid-read.html

  * igt@kms_chamelium_hpd@hdmi-hpd-after-suspend:
    - shard-dg1:          [SKIP][478] ([i915#11151] / [i915#4423] / [i915#7828]) -> [SKIP][479] ([i915#11151] / [i915#7828])
   [478]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19375/shard-dg1-12/igt@kms_chamelium_hpd@hdmi-hpd-after-suspend.html
   [479]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_168435v4/shard-dg1-14/igt@kms_chamelium_hpd@hdmi-hpd-after-suspend.html

  * igt@kms_chamelium_hpd@vga-hpd-fast:
    - shard-rkl:          [SKIP][480] ([i915#11151] / [i915#7828]) -> [SKIP][481] ([i915#11151] / [i915#14544] / [i915#7828]) +2 other tests skip
   [480]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19375/shard-rkl-1/igt@kms_chamelium_hpd@vga-hpd-fast.html
   [481]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_168435v4/shard-rkl-6/igt@kms_chamelium_hpd@vga-hpd-fast.html

  * igt@kms_content_protection@content-type-change:
    - shard-dg2:          [SKIP][482] ([i915#17356]) -> [SKIP][483] ([i915#15865]) +3 other tests skip
   [482]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19375/shard-dg2-7/igt@kms_content_protection@content-type-change.html
   [483]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_168435v4/shard-dg2-1/igt@kms_content_protection@content-type-change.html

  * igt@kms_content_protection@dp-mst-lic-type-0:
    - shard-dg2:          [SKIP][484] ([i915#17356]) -> [SKIP][485] ([i915#15330] / [i915#3299])
   [484]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19375/shard-dg2-7/igt@kms_content_protection@dp-mst-lic-type-0.html
   [485]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_168435v4/shard-dg2-3/igt@kms_content_protection@dp-mst-lic-type-0.html

  * igt@kms_content_protection@dp-mst-type-0:
    - shard-rkl:          [SKIP][486] ([i915#14544] / [i915#15330] / [i915#3116]) -> [SKIP][487] ([i915#15330] / [i915#3116])
   [486]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19375/shard-rkl-6/igt@kms_content_protection@dp-mst-type-0.html
   [487]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_168435v4/shard-rkl-4/igt@kms_content_protection@dp-mst-type-0.html

  * igt@kms_content_protection@dp-mst-type-0-suspend-resume:
    - shard-dg2:          [SKIP][488] ([i915#15330]) -> [SKIP][489] ([i915#17356])
   [488]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19375/shard-dg2-4/igt@kms_content_protection@dp-mst-type-0-suspend-resume.html
   [489]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_168435v4/shard-dg2-7/igt@kms_content_protection@dp-mst-type-0-suspend-resume.html

  * igt@kms_content_protection@legacy-hdcp14:
    - shard-dg2:          [SKIP][490] ([i915#15865]) -> [SKIP][491] ([i915#17356]) +2 other tests skip
   [490]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19375/shard-dg2-8/igt@kms_content_protection@legacy-hdcp14.html
   [491]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_168435v4/shard-dg2-7/igt@kms_content_protection@legacy-hdcp14.html

  * igt@kms_content_protection@mei-interface:
    - shard-rkl:          [SKIP][492] ([i915#15865]) -> [SKIP][493] ([i915#14544] / [i915#15865])
   [492]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19375/shard-rkl-1/igt@kms_content_protection@mei-interface.html
   [493]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_168435v4/shard-rkl-6/igt@kms_content_protection@mei-interface.html

  * igt@kms_cursor_crc@cursor-rapid-movement-32x10:
    - shard-rkl:          [SKIP][494] ([i915#14544] / [i915#3555]) -> [SKIP][495] ([i915#3555]) +1 other test skip
   [494]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19375/shard-rkl-6/igt@kms_cursor_crc@cursor-rapid-movement-32x10.html
   [495]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_168435v4/shard-rkl-4/igt@kms_cursor_crc@cursor-rapid-movement-32x10.html

  * igt@kms_cursor_crc@cursor-rapid-movement-32x32:
    - shard-dg2:          [SKIP][496] ([i915#3555]) -> [SKIP][497] ([i915#17356]) +3 other tests skip
   [496]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19375/shard-dg2-8/igt@kms_cursor_crc@cursor-rapid-movement-32x32.html
   [497]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_168435v4/shard-dg2-7/igt@kms_cursor_crc@cursor-rapid-movement-32x32.html

  * igt@kms_cursor_crc@cursor-sliding-32x10:
    - shard-dg2:          [SKIP][498] ([i915#17356]) -> [SKIP][499] ([i915#3555]) +1 other test skip
   [498]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19375/shard-dg2-7/igt@kms_cursor_crc@cursor-sliding-32x10.html
   [499]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_168435v4/shard-dg2-8/igt@kms_cursor_crc@cursor-sliding-32x10.html

  * igt@kms_cursor_crc@cursor-sliding-32x32:
    - shard-rkl:          [SKIP][500] ([i915#3555]) -> [SKIP][501] ([i915#14544] / [i915#3555])
   [500]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19375/shard-rkl-1/igt@kms_cursor_crc@cursor-sliding-32x32.html
   [501]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_168435v4/shard-rkl-6/igt@kms_cursor_crc@cursor-sliding-32x32.html

  * igt@kms_cursor_crc@cursor-sliding-512x170:
    - shard-dg2:          [SKIP][502] ([i915#13049]) -> [SKIP][503] ([i915#17356])
   [502]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19375/shard-dg2-8/igt@kms_cursor_crc@cursor-sliding-512x170.html
   [503]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_168435v4/shard-dg2-7/igt@kms_cursor_crc@cursor-sliding-512x170.html

  * igt@kms_cursor_crc@cursor-sliding-512x512:
    - shard-dg2:          [SKIP][504] ([i915#17356]) -> [SKIP][505] ([i915#13049])
   [504]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19375/shard-dg2-7/igt@kms_cursor_crc@cursor-sliding-512x512.html
   [505]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_168435v4/shard-dg2-1/igt@kms_cursor_crc@cursor-sliding-512x512.html
    - shard-rkl:          [SKIP][506] ([i915#13049] / [i915#14544]) -> [SKIP][507] ([i915#13049])
   [506]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19375/shard-rkl-6/igt@kms_cursor_crc@cursor-sliding-512x512.html
   [507]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_168435v4/shard-rkl-4/igt@kms_cursor_crc@cursor-sliding-512x512.html

  * igt@kms_cursor_crc@cursor-suspend:
    - shard-dg2:          [SKIP][508] ([i915#17356]) -> [INCOMPLETE][509] ([i915#12358] / [i915#13356] / [i915#14152] / [i915#7882])
   [508]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19375/shard-dg2-7/igt@kms_cursor_crc@cursor-suspend.html
   [509]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_168435v4/shard-dg2-3/igt@kms_cursor_crc@cursor-suspend.html

  * igt@kms_cursor_legacy@basic-busy-flip-before-cursor-legacy:
    - shard-rkl:          [SKIP][510] ([i915#14544] / [i915#4103]) -> [SKIP][511] ([i915#4103])
   [510]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19375/shard-rkl-6/igt@kms_cursor_legacy@basic-busy-flip-before-cursor-legacy.html
   [511]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_168435v4/shard-rkl-4/igt@kms_cursor_legacy@basic-busy-flip-before-cursor-legacy.html
    - shard-dg2:          [SKIP][512] ([i915#11190] / [i915#17356]) -> [SKIP][513] ([i915#4103])
   [512]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19375/shard-dg2-7/igt@kms_cursor_legacy@basic-busy-flip-before-cursor-legacy.html
   [513]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_168435v4/shard-dg2-1/igt@kms_cursor_legacy@basic-busy-flip-before-cursor-legacy.html

  * igt@kms_cursor_legacy@cursorb-vs-flipa-atomic-transitions-varying-size:
    - shard-dg2:          [SKIP][514] ([i915#17356]) -> [SKIP][515] ([i915#13046] / [i915#5354]) +4 other tests skip
   [514]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19375/shard-dg2-7/igt@kms_cursor_legacy@cursorb-vs-flipa-atomic-transitions-varying-size.html
   [515]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_168435v4/shard-dg2-4/igt@kms_cursor_legacy@cursorb-vs-flipa-atomic-transitions-varying-size.html

  * igt@kms_cursor_legacy@cursorb-vs-flipa-legacy:
    - shard-rkl:          [SKIP][516] ([i915#14544]) -> [SKIP][517] +31 other tests skip
   [516]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19375/shard-rkl-6/igt@kms_cursor_legacy@cursorb-vs-flipa-legacy.html
   [517]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_168435v4/shard-rkl-4/igt@kms_cursor_legacy@cursorb-vs-flipa-legacy.html

  * igt@kms_cursor_legacy@cursorb-vs-flipb-legacy:
    - shard-dg2:          [SKIP][518] ([i915#13046] / [i915#5354]) -> [SKIP][519] ([i915#17356]) +5 other tests skip
   [518]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19375/shard-dg2-8/igt@kms_cursor_legacy@cursorb-vs-flipb-legacy.html
   [519]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_168435v4/shard-dg2-7/igt@kms_cursor_legacy@cursorb-vs-flipb-legacy.html

  * igt@kms_cursor_legacy@short-busy-flip-before-cursor-atomic-transitions-varying-size:
    - shard-dg2:          [SKIP][520] ([i915#17356]) -> [SKIP][521] ([i915#4103])
   [520]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19375/shard-dg2-7/igt@kms_cursor_legacy@short-busy-flip-before-cursor-atomic-transitions-varying-size.html
   [521]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_168435v4/shard-dg2-1/igt@kms_cursor_legacy@short-busy-flip-before-cursor-atomic-transitions-varying-size.html

  * igt@kms_cursor_legacy@short-busy-flip-before-cursor-toggle:
    - shard-dg2:          [SKIP][522] ([i915#4103]) -> [SKIP][523] ([i915#17356])
   [522]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19375/shard-dg2-8/igt@kms_cursor_legacy@short-busy-flip-before-cursor-toggle.html
   [523]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_168435v4/shard-dg2-7/igt@kms_cursor_legacy@short-busy-flip-before-cursor-toggle.html

  * igt@kms_display_modes@extended-mode-basic:
    - shard-dg2:          [SKIP][524] ([i915#13691]) -> [SKIP][525] ([i915#17356])
   [524]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19375/shard-dg2-4/igt@kms_display_modes@extended-mode-basic.html
   [525]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_168435v4/shard-dg2-7/igt@kms_display_modes@extended-mode-basic.html

  * igt@kms_dp_link_training@non-uhbr-mst-tbtalt-train:
    - shard-rkl:          [SKIP][526] ([i915#14544] / [i915#17291]) -> [SKIP][527] ([i915#17291])
   [526]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19375/shard-rkl-6/igt@kms_dp_link_training@non-uhbr-mst-tbtalt-train.html
   [527]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_168435v4/shard-rkl-4/igt@kms_dp_link_training@non-uhbr-mst-tbtalt-train.html

  * igt@kms_dp_link_training@uhbr-mst-tbtalt-train:
    - shard-dg2:          [SKIP][528] ([i915#17285]) -> [SKIP][529] ([i915#17356]) +1 other test skip
   [528]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19375/shard-dg2-8/igt@kms_dp_link_training@uhbr-mst-tbtalt-train.html
   [529]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_168435v4/shard-dg2-7/igt@kms_dp_link_training@uhbr-mst-tbtalt-train.html
    - shard-rkl:          [SKIP][530] ([i915#17285]) -> [SKIP][531] ([i915#14544] / [i915#17285])
   [530]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19375/shard-rkl-4/igt@kms_dp_link_training@uhbr-mst-tbtalt-train.html
   [531]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_168435v4/shard-rkl-6/igt@kms_dp_link_training@uhbr-mst-tbtalt-train.html

  * igt@kms_dp_link_training@uhbr-sst:
    - shard-rkl:          [SKIP][532] ([i915#13748] / [i915#14544]) -> [SKIP][533] ([i915#13748])
   [532]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19375/shard-rkl-6/igt@kms_dp_link_training@uhbr-sst.html
   [533]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_168435v4/shard-rkl-4/igt@kms_dp_link_training@uhbr-sst.html
    - shard-dg2:          [SKIP][534] ([i915#17356]) -> [SKIP][535] ([i915#13748])
   [534]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19375/shard-dg2-7/igt@kms_dp_link_training@uhbr-sst.html
   [535]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_168435v4/shard-dg2-1/igt@kms_dp_link_training@uhbr-sst.html

  * igt@kms_dp_linktrain_fallback@uhbr-to-hbr-fallback:
    - shard-rkl:          [SKIP][536] ([i915#16867]) -> [SKIP][537] ([i915#14544] / [i915#16867])
   [536]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19375/shard-rkl-1/igt@kms_dp_linktrain_fallback@uhbr-to-hbr-fallback.html
   [537]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_168435v4/shard-rkl-6/igt@kms_dp_linktrain_fallback@uhbr-to-hbr-fallback.html

  * igt@kms_dsc@dsc-fractional-bpp:
    - shard-dg2:          [SKIP][538] ([i915#16361]) -> [SKIP][539] ([i915#17356]) +5 other tests skip
   [538]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19375/shard-dg2-3/igt@kms_dsc@dsc-fractional-bpp.html
   [539]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_168435v4/shard-dg2-7/igt@kms_dsc@dsc-fractional-bpp.html

  * igt@kms_dsc@dsc-with-output-formats-bigjoiner:
    - shard-rkl:          [SKIP][540] ([i915#14544] / [i915#16361]) -> [SKIP][541] ([i915#16361])
   [540]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19375/shard-rkl-6/igt@kms_dsc@dsc-with-output-formats-bigjoiner.html
   [541]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_168435v4/shard-rkl-4/igt@kms_dsc@dsc-with-output-formats-bigjoiner.html

  * igt@kms_dsc@dsc-with-output-formats-with-bpc:
    - shard-dg2:          [SKIP][542] ([i915#17356]) -> [SKIP][543] ([i915#16361]) +2 other tests skip
   [542]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19375/shard-dg2-7/igt@kms_dsc@dsc-with-output-formats-with-bpc.html
   [543]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_168435v4/shard-dg2-4/igt@kms_dsc@dsc-with-output-formats-with-bpc.html

  * igt@kms_feature_discovery@dp-mst:
    - shard-rkl:          [SKIP][544] ([i915#14544] / [i915#16599]) -> [SKIP][545] ([i915#16599])
   [544]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19375/shard-rkl-6/igt@kms_feature_discovery@dp-mst.html
   [545]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_168435v4/shard-rkl-4/igt@kms_feature_discovery@dp-mst.html

  * igt@kms_fence_pin_leak:
    - shard-dg2:          [SKIP][546] ([i915#4881]) -> [SKIP][547] ([i915#17356])
   [546]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19375/shard-dg2-4/igt@kms_fence_pin_leak.html
   [547]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_168435v4/shard-dg2-7/igt@kms_fence_pin_leak.html

  * igt@kms_flip@2x-flip-vs-panning-vs-hang:
    - shard-rkl:          [SKIP][548] ([i915#9934]) -> [SKIP][549] ([i915#14544] / [i915#9934]) +4 other tests skip
   [548]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19375/shard-rkl-1/igt@kms_flip@2x-flip-vs-panning-vs-hang.html
   [549]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_168435v4/shard-rkl-6/igt@kms_flip@2x-flip-vs-panning-vs-hang.html

  * igt@kms_flip_scaled_crc@flip-32bpp-yftile-to-32bpp-yftileccs-upscaling:
    - shard-rkl:          [SKIP][550] ([i915#14544] / [i915#15643]) -> [SKIP][551] ([i915#15643])
   [550]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19375/shard-rkl-6/igt@kms_flip_scaled_crc@flip-32bpp-yftile-to-32bpp-yftileccs-upscaling.html
   [551]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_168435v4/shard-rkl-4/igt@kms_flip_scaled_crc@flip-32bpp-yftile-to-32bpp-yftileccs-upscaling.html

  * igt@kms_flip_scaled_crc@flip-32bpp-yftileccs-to-64bpp-yftile-downscaling:
    - shard-rkl:          [SKIP][552] ([i915#15643]) -> [SKIP][553] ([i915#14544] / [i915#15643]) +1 other test skip
   [552]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19375/shard-rkl-1/igt@kms_flip_scaled_crc@flip-32bpp-yftileccs-to-64bpp-yftile-downscaling.html
   [553]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_168435v4/shard-rkl-6/igt@kms_flip_scaled_crc@flip-32bpp-yftileccs-to-64bpp-yftile-downscaling.html

  * igt@kms_frontbuffer_tracking@fbc-2p-primscrn-shrfb-plflip-blt:
    - shard-dg1:          [SKIP][554] ([i915#4423]) -> [SKIP][555] +1 other test skip
   [554]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19375/shard-dg1-17/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-shrfb-plflip-blt.html
   [555]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_168435v4/shard-dg1-18/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-shrfb-plflip-blt.html

  * igt@kms_frontbuffer_tracking@fbc-tiling-4:
    - shard-rkl:          [SKIP][556] ([i915#14544] / [i915#5439]) -> [SKIP][557] ([i915#5439])
   [556]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19375/shard-rkl-6/igt@kms_frontbuffer_tracking@fbc-tiling-4.html
   [557]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_168435v4/shard-rkl-4/igt@kms_frontbuffer_tracking@fbc-tiling-4.html

  * igt@kms_frontbuffer_tracking@fbchdr-1p-rte:
    - shard-dg2:          [SKIP][558] ([i915#15989]) -> [SKIP][559] ([i915#16708]) +10 other tests skip
   [558]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19375/shard-dg2-8/igt@kms_frontbuffer_tracking@fbchdr-1p-rte.html
   [559]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_168435v4/shard-dg2-7/igt@kms_frontbuffer_tracking@fbchdr-1p-rte.html

  * igt@kms_frontbuffer_tracking@fbcpsr-1p-offscreen-pri-indfb-draw-mmap-wc:
    - shard-dg2:          [SKIP][560] ([i915#16708]) -> [SKIP][561] ([i915#15104] / [i915#15990]) +1 other test skip
   [560]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19375/shard-dg2-7/igt@kms_frontbuffer_tracking@fbcpsr-1p-offscreen-pri-indfb-draw-mmap-wc.html
   [561]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_168435v4/shard-dg2-1/igt@kms_frontbuffer_tracking@fbcpsr-1p-offscreen-pri-indfb-draw-mmap-wc.html

  * igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-pri-shrfb-draw-mmap-gtt:
    - shard-dg2:          [SKIP][562] ([i915#16708] / [i915#5354]) -> [SKIP][563] ([i915#15990] / [i915#8708]) +9 other tests skip
   [562]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19375/shard-dg2-7/igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-pri-shrfb-draw-mmap-gtt.html
   [563]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_168435v4/shard-dg2-4/igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-pri-shrfb-draw-mmap-gtt.html

  * igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-cur-indfb-draw-mmap-wc:
    - shard-rkl:          [SKIP][564] ([i915#1825]) -> [SKIP][565] ([i915#14544] / [i915#1825]) +1 other test skip
   [564]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19375/shard-rkl-1/igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-cur-indfb-draw-mmap-wc.html
   [565]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_168435v4/shard-rkl-6/igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-cur-indfb-draw-mmap-wc.html

  * igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-spr-indfb-draw-mmap-wc:
    - shard-rkl:          [SKIP][566] ([i915#14544] / [i915#1825]) -> [SKIP][567] ([i915#1825]) +5 other tests skip
   [566]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19375/shard-rkl-6/igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-spr-indfb-draw-mmap-wc.html
   [567]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_168435v4/shard-rkl-4/igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-spr-indfb-draw-mmap-wc.html

  * igt@kms_frontbuffer_tracking@fbcpsr-tiling-y:
    - shard-dg2:          [SKIP][568] ([i915#16708] / [i915#5354]) -> [SKIP][569] ([i915#10055])
   [568]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19375/shard-dg2-7/igt@kms_frontbuffer_tracking@fbcpsr-tiling-y.html
   [569]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_168435v4/shard-dg2-4/igt@kms_frontbuffer_tracking@fbcpsr-tiling-y.html

  * igt@kms_frontbuffer_tracking@fbcpsrhdr-1p-rte:
    - shard-rkl:          [SKIP][570] ([i915#15102]) -> [SKIP][571] ([i915#14544] / [i915#15102]) +11 other tests skip
   [570]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19375/shard-rkl-4/igt@kms_frontbuffer_tracking@fbcpsrhdr-1p-rte.html
   [571]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_168435v4/shard-rkl-6/igt@kms_frontbuffer_tracking@fbcpsrhdr-1p-rte.html

  * igt@kms_frontbuffer_tracking@fbcpsrhdr-2p-shrfb-fliptrack-mmap-gtt:
    - shard-dg2:          [SKIP][572] ([i915#16708]) -> [SKIP][573] ([i915#15990]) +5 other tests skip
   [572]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19375/shard-dg2-7/igt@kms_frontbuffer_tracking@fbcpsrhdr-2p-shrfb-fliptrack-mmap-gtt.html
   [573]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_168435v4/shard-dg2-4/igt@kms_frontbuffer_tracking@fbcpsrhdr-2p-shrfb-fliptrack-mmap-gtt.html

  * igt@kms_frontbuffer_tracking@fbcpsrhdr-rgb565-draw-blt:
    - shard-dg1:          [SKIP][574] ([i915#15102] / [i915#4423]) -> [SKIP][575] ([i915#15102]) +1 other test skip
   [574]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19375/shard-dg1-17/igt@kms_frontbuffer_tracking@fbcpsrhdr-rgb565-draw-blt.html
   [575]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_168435v4/shard-dg1-18/igt@kms_frontbuffer_tracking@fbcpsrhdr-rgb565-draw-blt.html

  * igt@kms_frontbuffer_tracking@hdr-2p-pri-indfb-multidraw:
    - shard-dg2:          [SKIP][576] ([i915#15991]) -> [SKIP][577] ([i915#16708]) +33 other tests skip
   [576]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19375/shard-dg2-8/igt@kms_frontbuffer_tracking@hdr-2p-pri-indfb-multidraw.html
   [577]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_168435v4/shard-dg2-7/igt@kms_frontbuffer_tracking@hdr-2p-pri-indfb-multidraw.html

  * igt@kms_frontbuffer_tracking@hdr-rgb565-draw-mmap-gtt:
    - shard-dg1:          [SKIP][578] ([i915#15990] / [i915#4423]) -> [SKIP][579] ([i915#15990]) +1 other test skip
   [578]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19375/shard-dg1-17/igt@kms_frontbuffer_tracking@hdr-rgb565-draw-mmap-gtt.html
   [579]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_168435v4/shard-dg1-18/igt@kms_frontbuffer_tracking@hdr-rgb565-draw-mmap-gtt.html

  * igt@kms_frontbuffer_tracking@hdr-shrfb-scaledprimary:
    - shard-dg2:          [SKIP][580] ([i915#16708]) -> [SKIP][581] ([i915#15989]) +8 other tests skip
   [580]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19375/shard-dg2-7/igt@kms_frontbuffer_tracking@hdr-shrfb-scaledprimary.html
   [581]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_168435v4/shard-dg2-1/igt@kms_frontbuffer_tracking@hdr-shrfb-scaledprimary.html

  * igt@kms_frontbuffer_tracking@hdr-suspend:
    - shard-rkl:          [SKIP][582] ([i915#15989]) -> [ABORT][583] ([i915#15132])
   [582]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19375/shard-rkl-3/igt@kms_frontbuffer_tracking@hdr-suspend.html
   [583]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_168435v4/shard-rkl-1/igt@kms_frontbuffer_tracking@hdr-suspend.html

  * igt@kms_frontbuffer_tracking@psr-1p-primscrn-cur-indfb-move:
    - shard-dg2:          [SKIP][584] ([i915#16708] / [i915#5354]) -> [SKIP][585] ([i915#15102]) +9 other tests skip
   [584]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19375/shard-dg2-7/igt@kms_frontbuffer_tracking@psr-1p-primscrn-cur-indfb-move.html
   [585]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_168435v4/shard-dg2-4/igt@kms_frontbuffer_tracking@psr-1p-primscrn-cur-indfb-move.html

  * igt@kms_frontbuffer_tracking@psr-1p-primscrn-indfb-plflip-blt:
    - shard-rkl:          [SKIP][586] ([i915#14544] / [i915#15102]) -> [SKIP][587] ([i915#15102]) +18 other tests skip
   [586]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19375/shard-rkl-6/igt@kms_frontbuffer_tracking@psr-1p-primscrn-indfb-plflip-blt.html
   [587]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_168435v4/shard-rkl-4/igt@kms_frontbuffer_tracking@psr-1p-primscrn-indfb-plflip-blt.html

  * igt@kms_frontbuffer_tracking@psr-2p-primscrn-pri-shrfb-draw-mmap-gtt:
    - shard-dg2:          [SKIP][588] ([i915#15990] / [i915#8708]) -> [SKIP][589] ([i915#16708] / [i915#5354]) +17 other tests skip
   [588]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19375/shard-dg2-8/igt@kms_frontbuffer_tracking@psr-2p-primscrn-pri-shrfb-draw-mmap-gtt.html
   [589]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_168435v4/shard-dg2-7/igt@kms_frontbuffer_tracking@psr-2p-primscrn-pri-shrfb-draw-mmap-gtt.html

  * igt@kms_frontbuffer_tracking@psr-2p-primscrn-pri-shrfb-draw-render:
    - shard-dg2:          [SKIP][590] ([i915#16708] / [i915#5354]) -> [SKIP][591] ([i915#15991] / [i915#5354]) +13 other tests skip
   [590]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19375/shard-dg2-7/igt@kms_frontbuffer_tracking@psr-2p-primscrn-pri-shrfb-draw-render.html
   [591]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_168435v4/shard-dg2-4/igt@kms_frontbuffer_tracking@psr-2p-primscrn-pri-shrfb-draw-render.html

  * igt@kms_frontbuffer_tracking@psr-2p-scndscrn-cur-indfb-move:
    - shard-dg2:          [SKIP][592] ([i915#15991] / [i915#5354]) -> [SKIP][593] ([i915#16708] / [i915#5354]) +26 other tests skip
   [592]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19375/shard-dg2-3/igt@kms_frontbuffer_tracking@psr-2p-scndscrn-cur-indfb-move.html
   [593]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_168435v4/shard-dg2-7/igt@kms_frontbuffer_tracking@psr-2p-scndscrn-cur-indfb-move.html

  * igt@kms_frontbuffer_tracking@psr-rgb101010-draw-render:
    - shard-dg2:          [SKIP][594] ([i915#15102]) -> [SKIP][595] ([i915#16708] / [i915#5354]) +10 other tests skip
   [594]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19375/shard-dg2-8/igt@kms_frontbuffer_tracking@psr-rgb101010-draw-render.html
   [595]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_168435v4/shard-dg2-7/igt@kms_frontbuffer_tracking@psr-rgb101010-draw-render.html

  * igt@kms_frontbuffer_tracking@psrhdr-1p-primscrn-pri-shrfb-draw-render:
    - shard-dg2:          [SKIP][596] ([i915#16708]) -> [SKIP][597] ([i915#15102]) +10 other tests skip
   [596]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19375/shard-dg2-7/igt@kms_frontbuffer_tracking@psrhdr-1p-primscrn-pri-shrfb-draw-render.html
   [597]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_168435v4/shard-dg2-8/igt@kms_frontbuffer_tracking@psrhdr-1p-primscrn-pri-shrfb-draw-render.html

  * igt@kms_frontbuffer_tracking@psrhdr-2p-pri-indfb-multidraw:
    - shard-dg2:          [SKIP][598] ([i915#16708]) -> [SKIP][599] ([i915#15991]) +25 other tests skip
   [598]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19375/shard-dg2-7/igt@kms_frontbuffer_tracking@psrhdr-2p-pri-indfb-multidraw.html
   [599]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_168435v4/shard-dg2-4/igt@kms_frontbuffer_tracking@psrhdr-2p-pri-indfb-multidraw.html

  * igt@kms_frontbuffer_tracking@psrhdr-2p-primscrn-pri-indfb-draw-mmap-gtt:
    - shard-dg2:          [SKIP][600] ([i915#15990]) -> [SKIP][601] ([i915#16708]) +25 other tests skip
   [600]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19375/shard-dg2-8/igt@kms_frontbuffer_tracking@psrhdr-2p-primscrn-pri-indfb-draw-mmap-gtt.html
   [601]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_168435v4/shard-dg2-7/igt@kms_frontbuffer_tracking@psrhdr-2p-primscrn-pri-indfb-draw-mmap-gtt.html

  * igt@kms_frontbuffer_tracking@psrhdr-rgb101010-draw-pwrite:
    - shard-dg2:          [SKIP][602] ([i915#15102]) -> [SKIP][603] ([i915#16708]) +19 other tests skip
   [602]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19375/shard-dg2-4/igt@kms_frontbuffer_tracking@psrhdr-rgb101010-draw-pwrite.html
   [603]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_168435v4/shard-dg2-7/igt@kms_frontbuffer_tracking@psrhdr-rgb101010-draw-pwrite.html

  * igt@kms_hdr@brightness-with-hdr:
    - shard-rkl:          [SKIP][604] ([i915#14544] / [i915#16644]) -> [SKIP][605] ([i915#12713] / [i915#16644])
   [604]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19375/shard-rkl-6/igt@kms_hdr@brightness-with-hdr.html
   [605]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_168435v4/shard-rkl-4/igt@kms_hdr@brightness-with-hdr.html
    - shard-tglu:         [SKIP][606] ([i915#1187] / [i915#12713]) -> [SKIP][607] ([i915#12713])
   [606]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19375/shard-tglu-2/igt@kms_hdr@brightness-with-hdr.html
   [607]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_168435v4/shard-tglu-10/igt@kms_hdr@brightness-with-hdr.html

  * igt@kms_hdr@static-toggle:
    - shard-dg2:          [SKIP][608] ([i915#16518] / [i915#3555] / [i915#8228]) -> [SKIP][609] ([i915#17356]) +2 other tests skip
   [608]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19375/shard-dg2-8/igt@kms_hdr@static-toggle.html
   [609]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_168435v4/shard-dg2-7/igt@kms_hdr@static-toggle.html

  * igt@kms_joiner@basic-big-joiner:
    - shard-rkl:          [SKIP][610] ([i915#14544] / [i915#15460]) -> [SKIP][611] ([i915#15460])
   [610]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19375/shard-rkl-6/igt@kms_joiner@basic-big-joiner.html
   [611]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_168435v4/shard-rkl-4/igt@kms_joiner@basic-big-joiner.html

  * igt@kms_joiner@invalid-modeset-ultra-joiner:
    - shard-rkl:          [SKIP][612] ([i915#14544] / [i915#15458]) -> [SKIP][613] ([i915#15458])
   [612]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19375/shard-rkl-6/igt@kms_joiner@invalid-modeset-ultra-joiner.html
   [613]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_168435v4/shard-rkl-4/igt@kms_joiner@invalid-modeset-ultra-joiner.html

  * igt@kms_pipe_stress@stress-xrgb8888-yftiled:
    - shard-dg2:          [SKIP][614] ([i915#17356]) -> [SKIP][615] ([i915#14712])
   [614]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19375/shard-dg2-7/igt@kms_pipe_stress@stress-xrgb8888-yftiled.html
   [615]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_168435v4/shard-dg2-4/igt@kms_pipe_stress@stress-xrgb8888-yftiled.html

  * igt@kms_plane@pixel-format-4-tiled-dg2-mc-ccs-modifier:
    - shard-rkl:          [SKIP][616] ([i915#14544] / [i915#15709]) -> [SKIP][617] ([i915#15709])
   [616]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19375/shard-rkl-6/igt@kms_plane@pixel-format-4-tiled-dg2-mc-ccs-modifier.html
   [617]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_168435v4/shard-rkl-4/igt@kms_plane@pixel-format-4-tiled-dg2-mc-ccs-modifier.html

  * igt@kms_plane@pixel-format-4-tiled-lnl-ccs-modifier-source-clamping:
    - shard-rkl:          [SKIP][618] ([i915#15709]) -> [SKIP][619] ([i915#14544] / [i915#15709])
   [618]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19375/shard-rkl-1/igt@kms_plane@pixel-format-4-tiled-lnl-ccs-modifier-source-clamping.html
   [619]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_168435v4/shard-rkl-6/igt@kms_plane@pixel-format-4-tiled-lnl-ccs-modifier-source-clamping.html

  * igt@kms_plane_lowres@tiling-yf:
    - shard-dg2:          [SKIP][620] ([i915#3555] / [i915#8821]) -> [SKIP][621] ([i915#17356])
   [620]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19375/shard-dg2-8/igt@kms_plane_lowres@tiling-yf.html
   [621]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_168435v4/shard-dg2-7/igt@kms_plane_lowres@tiling-yf.html

  * igt@kms_plane_multiple@2x-tiling-x:
    - shard-dg2:          [SKIP][622] ([i915#17356]) -> [SKIP][623] ([i915#13958])
   [622]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19375/shard-dg2-7/igt@kms_plane_multiple@2x-tiling-x.html
   [623]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_168435v4/shard-dg2-1/igt@kms_plane_multiple@2x-tiling-x.html

  * igt@kms_plane_multiple@tiling-yf:
    - shard-dg2:          [SKIP][624] ([i915#14259]) -> [SKIP][625] ([i915#17356])
   [624]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19375/shard-dg2-4/igt@kms_plane_multiple@tiling-yf.html
   [625]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_168435v4/shard-dg2-7/igt@kms_plane_multiple@tiling-yf.html

  * igt@kms_plane_scaling@plane-scaler-unity-scaling-with-rotation@pipe-b:
    - shard-rkl:          [SKIP][626] ([i915#15329]) -> [SKIP][627] ([i915#14544] / [i915#15329]) +3 other tests skip
   [626]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19375/shard-rkl-4/igt@kms_plane_scaling@plane-scaler-unity-scaling-with-rotation@pipe-b.html
   [627]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_168435v4/shard-rkl-6/igt@kms_plane_scaling@plane-scaler-unity-scaling-with-rotation@pipe-b.html

  * igt@kms_pm_backlight@brightness-with-dpms:
    - shard-rkl:          [SKIP][628] ([i915#12343]) -> [SKIP][629] ([i915#12343] / [i915#14544])
   [628]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19375/shard-rkl-1/igt@kms_pm_backlight@brightness-with-dpms.html
   [629]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_168435v4/shard-rkl-6/igt@kms_pm_backlight@brightness-with-dpms.html

  * igt@kms_pm_dc@dc5-pageflip-negative:
    - shard-rkl:          [SKIP][630] ([i915#14544] / [i915#9685]) -> [SKIP][631] ([i915#9685])
   [630]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19375/shard-rkl-6/igt@kms_pm_dc@dc5-pageflip-negative.html
   [631]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_168435v4/shard-rkl-4/igt@kms_pm_dc@dc5-pageflip-negative.html

  * igt@kms_pm_dc@dc6-psr:
    - shard-rkl:          [SKIP][632] ([i915#15948]) -> [SKIP][633] ([i915#14544] / [i915#15948])
   [632]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19375/shard-rkl-1/igt@kms_pm_dc@dc6-psr.html
   [633]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_168435v4/shard-rkl-6/igt@kms_pm_dc@dc6-psr.html

  * igt@kms_pm_lpsp@kms-lpsp:
    - shard-dg1:          [SKIP][634] ([i915#9340]) -> [SKIP][635] ([i915#3828])
   [634]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19375/shard-dg1-12/igt@kms_pm_lpsp@kms-lpsp.html
   [635]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_168435v4/shard-dg1-14/igt@kms_pm_lpsp@kms-lpsp.html

  * igt@kms_prime@d3hot:
    - shard-rkl:          [SKIP][636] ([i915#6524]) -> [SKIP][637] ([i915#14544] / [i915#6524])
   [636]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19375/shard-rkl-1/igt@kms_prime@d3hot.html
   [637]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_168435v4/shard-rkl-6/igt@kms_prime@d3hot.html

  * igt@kms_psr2_sf@fbc-pr-cursor-plane-move-continuous-exceed-sf:
    - shard-rkl:          [SKIP][638] ([i915#11520]) -> [SKIP][639] ([i915#11520] / [i915#14544]) +1 other test skip
   [638]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19375/shard-rkl-1/igt@kms_psr2_sf@fbc-pr-cursor-plane-move-continuous-exceed-sf.html
   [639]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_168435v4/shard-rkl-6/igt@kms_psr2_sf@fbc-pr-cursor-plane-move-continuous-exceed-sf.html

  * igt@kms_psr2_sf@fbc-psr2-overlay-plane-move-continuous-exceed-sf:
    - shard-rkl:          [SKIP][640] ([i915#11520] / [i915#14544]) -> [SKIP][641] ([i915#11520]) +3 other tests skip
   [640]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19375/shard-rkl-6/igt@kms_psr2_sf@fbc-psr2-overlay-plane-move-continuous-exceed-sf.html
   [641]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_168435v4/shard-rkl-4/igt@kms_psr2_sf@fbc-psr2-overlay-plane-move-continuous-exceed-sf.html

  * igt@kms_psr@fbc-psr-cursor-blt:
    - shard-rkl:          [SKIP][642] ([i915#1072] / [i915#14544] / [i915#9732]) -> [SKIP][643] ([i915#1072] / [i915#9732]) +6 other tests skip
   [642]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19375/shard-rkl-6/igt@kms_psr@fbc-psr-cursor-blt.html
   [643]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_168435v4/shard-rkl-4/igt@kms_psr@fbc-psr-cursor-blt.html

  * igt@kms_psr@psr-cursor-plane-move:
    - shard-dg1:          [SKIP][644] ([i915#1072] / [i915#4423] / [i915#9732]) -> [SKIP][645] ([i915#1072] / [i915#9732])
   [644]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19375/shard-dg1-12/igt@kms_psr@psr-cursor-plane-move.html
   [645]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_168435v4/shard-dg1-14/igt@kms_psr@psr-cursor-plane-move.html

  * igt@kms_psr@psr2-sprite-mmap-cpu:
    - shard-rkl:          [SKIP][646] ([i915#1072] / [i915#9732]) -> [SKIP][647] ([i915#1072] / [i915#14544] / [i915#9732]) +7 other tests skip
   [646]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19375/shard-rkl-1/igt@kms_psr@psr2-sprite-mmap-cpu.html
   [647]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_168435v4/shard-rkl-6/igt@kms_psr@psr2-sprite-mmap-cpu.html

  * igt@kms_rotation_crc@exhaust-fences:
    - shard-dg2:          [SKIP][648] ([i915#17356]) -> [SKIP][649] ([i915#4235])
   [648]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19375/shard-dg2-7/igt@kms_rotation_crc@exhaust-fences.html
   [649]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_168435v4/shard-dg2-4/igt@kms_rotation_crc@exhaust-fences.html

  * igt@kms_rotation_crc@primary-y-tiled-reflect-x-180:
    - shard-dg2:          [SKIP][650] ([i915#17356] / [i915#5190]) -> [SKIP][651] ([i915#5190]) +1 other test skip
   [650]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19375/shard-dg2-7/igt@kms_rotation_crc@primary-y-tiled-reflect-x-180.html
   [651]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_168435v4/shard-dg2-4/igt@kms_rotation_crc@primary-y-tiled-reflect-x-180.html

  * igt@kms_rotation_crc@primary-y-tiled-reflect-x-90:
    - shard-dg2:          [SKIP][652] ([i915#17356] / [i915#5190]) -> [SKIP][653] ([i915#12755] / [i915#15867] / [i915#5190])
   [652]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19375/shard-dg2-7/igt@kms_rotation_crc@primary-y-tiled-reflect-x-90.html
   [653]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_168435v4/shard-dg2-1/igt@kms_rotation_crc@primary-y-tiled-reflect-x-90.html

  * igt@kms_rotation_crc@primary-yf-tiled-reflect-x-270:
    - shard-dg2:          [SKIP][654] ([i915#12755] / [i915#15867] / [i915#5190]) -> [SKIP][655] ([i915#17356] / [i915#5190])
   [654]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19375/shard-dg2-3/igt@kms_rotation_crc@primary-yf-tiled-reflect-x-270.html
   [655]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_168435v4/shard-dg2-7/igt@kms_rotation_crc@primary-yf-tiled-reflect-x-270.html

  * igt@kms_rotation_crc@sprite-rotation-270:
    - shard-dg2:          [SKIP][656] ([i915#17356]) -> [SKIP][657] ([i915#12755] / [i915#15867]) +1 other test skip
   [656]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19375/shard-dg2-7/igt@kms_rotation_crc@sprite-rotation-270.html
   [657]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_168435v4/shard-dg2-4/igt@kms_rotation_crc@sprite-rotation-270.html

  * igt@kms_tiled_display@basic-test-pattern-with-chamelium:
    - shard-rkl:          [SKIP][658] ([i915#8623]) -> [SKIP][659] ([i915#14544] / [i915#8623])
   [658]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19375/shard-rkl-1/igt@kms_tiled_display@basic-test-pattern-with-chamelium.html
   [659]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_168435v4/shard-rkl-6/igt@kms_tiled_display@basic-test-pattern-with-chamelium.html

  * igt@kms_vrr@flip-dpms:
    - shard-rkl:          [SKIP][660] ([i915#15243] / [i915#3555]) -> [SKIP][661] ([i915#14544] / [i915#15243] / [i915#3555])
   [660]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19375/shard-rkl-1/igt@kms_vrr@flip-dpms.html
   [661]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_168435v4/shard-rkl-6/igt@kms_vrr@flip-dpms.html

  * igt@kms_vrr@lobf:
    - shard-dg2:          [SKIP][662] ([i915#17356]) -> [SKIP][663] ([i915#11920])
   [662]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19375/shard-dg2-7/igt@kms_vrr@lobf.html
   [663]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_168435v4/shard-dg2-4/igt@kms_vrr@lobf.html

  * igt@kms_vrr@seamless-rr-switch-drrs:
    - shard-dg2:          [SKIP][664] ([i915#9906]) -> [SKIP][665] ([i915#17356])
   [664]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19375/shard-dg2-8/igt@kms_vrr@seamless-rr-switch-drrs.html
   [665]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_168435v4/shard-dg2-7/igt@kms_vrr@seamless-rr-switch-drrs.html

  * igt@kms_vrr@seamless-rr-switch-vrr:
    - shard-rkl:          [SKIP][666] ([i915#9906]) -> [SKIP][667] ([i915#14544] / [i915#9906])
   [666]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19375/shard-rkl-8/igt@kms_vrr@seamless-rr-switch-vrr.html
   [667]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_168435v4/shard-rkl-6/igt@kms_vrr@seamless-rr-switch-vrr.html

  * igt@prime_vgem@basic-read:
    - shard-rkl:          [SKIP][668] ([i915#14544] / [i915#3291] / [i915#3708]) -> [SKIP][669] ([i915#3291] / [i915#3708])
   [668]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19375/shard-rkl-6/igt@prime_vgem@basic-read.html
   [669]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_168435v4/shard-rkl-4/igt@prime_vgem@basic-read.html

  * igt@prime_vgem@fence-flip-hang:
    - shard-rkl:          [SKIP][670] ([i915#14544] / [i915#3708]) -> [SKIP][671] ([i915#3708])
   [670]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19375/shard-rkl-6/igt@prime_vgem@fence-flip-hang.html
   [671]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_168435v4/shard-rkl-4/igt@prime_vgem@fence-flip-hang.html

  * igt@prime_vgem@fence-write-hang:
    - shard-rkl:          [SKIP][672] ([i915#3708]) -> [SKIP][673] ([i915#14544] / [i915#3708])
   [672]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19375/shard-rkl-1/igt@prime_vgem@fence-write-hang.html
   [673]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_168435v4/shard-rkl-6/igt@prime_vgem@fence-write-hang.html

  
  [i915#10055]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/10055
  [i915#10056]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/10056
  [i915#10216]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/10216
  [i915#10307]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/10307
  [i915#10434]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/10434
  [i915#10647]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/10647
  [i915#1072]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/1072
  [i915#11078]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11078
  [i915#11151]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11151
  [i915#11190]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11190
  [i915#11520]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11520
  [i915#11681]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11681
  [i915#1187]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/1187
  [i915#11920]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11920
  [i915#12169]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12169
  [i915#12313]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12313
  [i915#12316]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12316
  [i915#12343]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12343
  [i915#12358]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12358
  [i915#12454]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12454
  [i915#12655]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12655
  [i915#12712]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12712
  [i915#12713]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12713
  [i915#12745]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12745
  [i915#12755]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12755
  [i915#12805]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12805
  [i915#12964]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12964
  [i915#13008]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13008
  [i915#13027]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13027
  [i915#13029]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13029
  [i915#13046]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13046
  [i915#13049]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13049
  [i915#13356]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13356
  [i915#13398]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13398
  [i915#13520]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13520
  [i915#13566]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13566
  [i915#13688]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13688
  [i915#13691]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13691
  [i915#13748]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13748
  [i915#13781]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13781
  [i915#13958]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13958
  [i915#14098]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14098
  [i915#14118]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14118
  [i915#14152]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14152
  [i915#14259]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14259
  [i915#14419]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14419
  [i915#14498]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14498
  [i915#14544]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544
  [i915#14545]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14545
  [i915#14600]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14600
  [i915#14694]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14694
  [i915#14712]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14712
  [i915#15073]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15073
  [i915#15102]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15102
  [i915#15104]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15104
  [i915#15132]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15132
  [i915#15140]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15140
  [i915#15243]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15243
  [i915#15329]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15329
  [i915#15330]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15330
  [i915#15342]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15342
  [i915#15458]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15458
  [i915#15459]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15459
  [i915#15460]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15460
  [i915#15481]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15481
  [i915#15492]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15492
  [i915#15529]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15529
  [i915#15582]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15582
  [i915#15638]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15638
  [i915#15643]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15643
  [i915#15709]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15709
  [i915#15722]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15722
  [i915#15815]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15815
  [i915#15865]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15865
  [i915#15867]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15867
  [i915#15948]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15948
  [i915#15989]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15989
  [i915#15990]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15990
  [i915#15991]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15991
  [i915#16109]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16109
  [i915#16182]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16182
  [i915#16184]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16184
  [i915#16276]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16276
  [i915#16348]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16348
  [i915#16361]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16361
  [i915#16386]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16386
  [i915#16420]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16420
  [i915#16471]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16471
  [i915#16518]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16518
  [i915#16599]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16599
  [i915#16600]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16600
  [i915#16644]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16644
  [i915#16680]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16680
  [i915#16708]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16708
  [i915#16746]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16746
  [i915#16867]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16867
  [i915#16914]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16914
  [i915#16990]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16990
  [i915#17084]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17084
  [i915#17102]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17102
  [i915#17103]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17103
  [i915#17122]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17122
  [i915#17137]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17137
  [i915#17158]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17158
  [i915#17183]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17183
  [i915#17285]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17285
  [i915#17287]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17287
  [i915#17290]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17290
  [i915#17291]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17291
  [i915#17356]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17356
  [i915#17359]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17359
  [i915#17373]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17373
  [i915#1769]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/1769
  [i915#1825]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/1825
  [i915#1849]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/1849
  [i915#2065]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2065
  [i915#2190]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2190
  [i915#2527]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2527
  [i915#2582]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2582
  [i915#2658]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2658
  [i915#280]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/280
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
  [i915#3637]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3637
  [i915#3638]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3638
  [i915#3708]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3708
  [i915#3742]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3742
  [i915#3804]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3804
  [i915#3828]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3828
  [i915#4077]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4077
  [i915#4103]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4103
  [i915#4235]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4235
  [i915#4270]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4270
  [i915#4349]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4349
  [i915#4387]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4387
  [i915#4423]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4423
  [i915#4525]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4525
  [i915#4537]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4537
  [i915#4538]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4538
  [i915#4613]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4613
  [i915#4812]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4812
  [i915#4817]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4817
  [i915#4839]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4839
  [i915#4852]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4852
  [i915#4881]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4881
  [i915#4884]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4884
  [i915#5190]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5190
  [i915#5286]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5286
  [i915#5289]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5289
  [i915#5354]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5354
  [i915#5439]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5439
  [i915#5723]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5723
  [i915#6095]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6095
  [i915#6113]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6113
  [i915#6230]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6230
  [i915#6245]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6245
  [i915#6301]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6301
  [i915#6334]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6334
  [i915#6335]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6335
  [i915#6344]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6344
  [i915#6412]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6412
  [i915#6524]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6524
  [i915#6621]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6621
  [i915#6953]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6953
  [i915#7582]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/7582
  [i915#7697]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/7697
  [i915#7828]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/7828
  [i915#7882]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/7882
  [i915#8228]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8228
  [i915#8411]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8411
  [i915#8430]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8430
  [i915#8516]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8516
  [i915#8623]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8623
  [i915#8708]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8708
  [i915#8808]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8808
  [i915#8812]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8812
  [i915#8813]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8813
  [i915#8814]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8814
  [i915#8821]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8821
  [i915#8825]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8825
  [i915#9067]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9067
  [i915#9323]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9323
  [i915#9340]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9340
  [i915#9423]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9423
  [i915#9519]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9519
  [i915#9531]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9531
  [i915#9683]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9683
  [i915#9685]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9685
  [i915#9688]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9688
  [i915#9723]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9723
  [i915#9732]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9732
  [i915#9812]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9812
  [i915#9878]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9878
  [i915#9906]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9906
  [i915#9934]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9934


Build changes
-------------

  * Linux: CI_DRM_19375 -> Patchwork_168435v4

  CI-20190529: 20190529
  CI_DRM_19375: 0be91e56eb2afd32a5793865231161cfb3b12569 @ git://anongit.freedesktop.org/gfx-ci/linux
  IGT_9156: 9156
  Patchwork_168435v4: 0be91e56eb2afd32a5793865231161cfb3b12569 @ git://anongit.freedesktop.org/gfx-ci/linux
  piglit_4509: fdc5a4ca11124ab8413c7988896eec4c97336694 @ git://anongit.freedesktop.org/piglit

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_168435v4/index.html

--===============6349502425141903180==
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
<tr><td><b>Series:</b></td><td>drm/i915/display: guard intel_alpm_get_error() against non-ALPM sinks (rev4)</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/168435/">https://patchwork.freedesktop.org/series/168435/</a></td></tr>
<tr><td><b>State:</b></td><td>failure</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_168435v4/index.html">https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_168435v4/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from CI_DRM_19375_full -&gt; Patchwork_168435v4_full</h1>
<h2>Summary</h2>
<p><strong>FAILURE</strong></p>
<p>Serious unknown changes coming with Patchwork_168435v4_full absolutely need to be<br />
  verified manually.</p>
<p>If you think the reported changes have nothing to do with the changes<br />
  introduced in Patchwork_168435v4_full, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them<br />
  to document this new failure mode, which will reduce false positives in CI.</p>
<h2>Participating hosts (10 -&gt; 10)</h2>
<p>No changes in participating hosts</p>
<h2>Possible new issues</h2>
<p>Here are the unknown changes that may have been introduced in Patchwork_168435v4_full:</p>
<h3>IGT changes</h3>
<h4>Possible regressions</h4>
<ul>
<li>igt@gem_exec_schedule@wide:<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19375/shard-rkl-8/igt@gem_exec_schedule@wide.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_168435v4/shard-rkl-8/igt@gem_exec_schedule@wide.html">FAIL</a> +1 other test fail</li>
</ul>
</li>
</ul>
<h2>Known issues</h2>
<p>Here are the changes found in Patchwork_168435v4_full that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>
<p>igt@api_intel_bb@crc32:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_168435v4/shard-tglu-8/igt@api_intel_bb@crc32.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6230">i915#6230</a>)</li>
</ul>
</li>
<li>
<p>igt@api_intel_bb@object-reloc-purge-cache:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_168435v4/shard-rkl-5/igt@api_intel_bb@object-reloc-purge-cache.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8411">i915#8411</a>)</li>
</ul>
</li>
<li>
<p>igt@device_reset@unbind-cold-reset-rebind:</p>
<ul>
<li>shard-tglu-1:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_168435v4/shard-tglu-1/igt@device_reset@unbind-cold-reset-rebind.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11078">i915#11078</a>)</li>
</ul>
</li>
<li>
<p>igt@drm_read@short-buffer-block:</p>
<ul>
<li>shard-dg2:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19375/shard-dg2-8/igt@drm_read@short-buffer-block.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_168435v4/shard-dg2-7/igt@drm_read@short-buffer-block.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17359">i915#17359</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@fbdev@pan:</p>
<ul>
<li>shard-dg2:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19375/shard-dg2-8/igt@fbdev@pan.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_168435v4/shard-dg2-7/igt@fbdev@pan.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2582">i915#2582</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_ccs@ctrl-surf-copy:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_168435v4/shard-rkl-2/igt@gem_ccs@ctrl-surf-copy.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3555">i915#3555</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9323">i915#9323</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_ccs@large-ctrl-surf-copy:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_168435v4/shard-dg1-15/igt@gem_ccs@large-ctrl-surf-copy.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13008">i915#13008</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_close_race@multigpu-basic-process:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_168435v4/shard-dg1-16/igt@gem_close_race@multigpu-basic-process.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/7697">i915#7697</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_create@create-ext-cpu-access-big:</p>
<ul>
<li>shard-tglu-1:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_168435v4/shard-tglu-1/igt@gem_create@create-ext-cpu-access-big.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6335">i915#6335</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_ctx_isolation@preservation-s3:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19375/shard-rkl-8/igt@gem_ctx_isolation@preservation-s3.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_168435v4/shard-rkl-6/igt@gem_ctx_isolation@preservation-s3.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13356">i915#13356</a>) +3 other tests incomplete</li>
</ul>
</li>
<li>
<p>igt@gem_ctx_sseu@engines:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_168435v4/shard-dg1-16/igt@gem_ctx_sseu@engines.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/280">i915#280</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_ctx_sseu@invalid-sseu:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_168435v4/shard-dg2-4/igt@gem_ctx_sseu@invalid-sseu.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/280">i915#280</a>)</li>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_168435v4/shard-tglu-8/igt@gem_ctx_sseu@invalid-sseu.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/280">i915#280</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_exec_balancer@bonded-false-hang:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_168435v4/shard-dg1-16/igt@gem_exec_balancer@bonded-false-hang.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4812">i915#4812</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_exec_balancer@parallel-bb-first:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_168435v4/shard-rkl-2/igt@gem_exec_balancer@parallel-bb-first.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4525">i915#4525</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_exec_balancer@parallel-keep-submit-fence:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_168435v4/shard-tglu-8/igt@gem_exec_balancer@parallel-keep-submit-fence.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4525">i915#4525</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@gem_exec_capture@capture-invisible@smem0:</p>
<ul>
<li>shard-tglu-1:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_168435v4/shard-tglu-1/igt@gem_exec_capture@capture-invisible@smem0.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6334">i915#6334</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@gem_exec_flush@basic-wb-set-default:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_168435v4/shard-dg1-16/igt@gem_exec_flush@basic-wb-set-default.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3539">i915#3539</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4852">i915#4852</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_exec_reloc@basic-cpu-gtt:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_168435v4/shard-rkl-4/igt@gem_exec_reloc@basic-cpu-gtt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3281">i915#3281</a>) +7 other tests skip</li>
</ul>
</li>
<li>
<p>igt@gem_exec_reloc@basic-gtt-wc-active:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_168435v4/shard-mtlp-8/igt@gem_exec_reloc@basic-gtt-wc-active.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3281">i915#3281</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_exec_reloc@basic-wc-read-active:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_168435v4/shard-dg1-16/igt@gem_exec_reloc@basic-wc-read-active.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3281">i915#3281</a>) +6 other tests skip</li>
</ul>
</li>
<li>
<p>igt@gem_exec_schedule@reorder-wide:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_168435v4/shard-dg2-4/igt@gem_exec_schedule@reorder-wide.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4537">i915#4537</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4812">i915#4812</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_huc_copy@huc-copy:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_168435v4/shard-tglu-7/igt@gem_huc_copy@huc-copy.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2190">i915#2190</a>)</li>
<li>shard-glk:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_168435v4/shard-glk4/igt@gem_huc_copy@huc-copy.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2190">i915#2190</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_lmem_swapping@massive-random:</p>
<ul>
<li>shard-tglu-1:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_168435v4/shard-tglu-1/igt@gem_lmem_swapping@massive-random.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4613">i915#4613</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_lmem_swapping@parallel-random-verify-ccs:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_168435v4/shard-rkl-2/igt@gem_lmem_swapping@parallel-random-verify-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4613">i915#4613</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@gem_lmem_swapping@random-engines:</p>
<ul>
<li>shard-glk:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_168435v4/shard-glk2/igt@gem_lmem_swapping@random-engines.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4613">i915#4613</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@gem_lmem_swapping@smem-oom:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_168435v4/shard-tglu-8/igt@gem_lmem_swapping@smem-oom.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4613">i915#4613</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@gem_lmem_swapping@verify:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_168435v4/shard-mtlp-8/igt@gem_lmem_swapping@verify.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4613">i915#4613</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_mmap_gtt@close-race:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_168435v4/shard-dg1-16/igt@gem_mmap_gtt@close-race.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4077">i915#4077</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@gem_mmap_gtt@fault-concurrent-y:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_168435v4/shard-dg2-8/igt@gem_mmap_gtt@fault-concurrent-y.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4077">i915#4077</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@gem_partial_pwrite_pread@reads-uncached:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_168435v4/shard-dg1-16/igt@gem_partial_pwrite_pread@reads-uncached.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3282">i915#3282</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@gem_partial_pwrite_pread@writes-after-reads:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_168435v4/shard-dg2-4/igt@gem_partial_pwrite_pread@writes-after-reads.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3282">i915#3282</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_partial_pwrite_pread@writes-after-reads-display:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_168435v4/shard-rkl-2/igt@gem_partial_pwrite_pread@writes-after-reads-display.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3282">i915#3282</a>) +5 other tests skip</li>
</ul>
</li>
<li>
<p>igt@gem_pread@exhaustion:</p>
<ul>
<li>shard-glk:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_168435v4/shard-glk2/igt@gem_pread@exhaustion.html">WARN</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2658">i915#2658</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_pread@self:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_168435v4/shard-mtlp-8/igt@gem_pread@self.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3282">i915#3282</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_pxp@dmabuf-shared-protected-dst-is-context-refcounted:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_168435v4/shard-dg1-16/igt@gem_pxp@dmabuf-shared-protected-dst-is-context-refcounted.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4270">i915#4270</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@gem_pxp@hw-rejects-pxp-buffer:</p>
<ul>
<li>shard-tglu-1:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_168435v4/shard-tglu-1/igt@gem_pxp@hw-rejects-pxp-buffer.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13398">i915#13398</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_userptr_blits@coherency-sync:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_168435v4/shard-dg1-16/igt@gem_userptr_blits@coherency-sync.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3297">i915#3297</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@gem_userptr_blits@create-destroy-unsync:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_168435v4/shard-rkl-8/igt@gem_userptr_blits@create-destroy-unsync.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3297">i915#3297</a>)</li>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_168435v4/shard-mtlp-8/igt@gem_userptr_blits@create-destroy-unsync.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3297">i915#3297</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_userptr_blits@dmabuf-sync:</p>
<ul>
<li>shard-glk:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_168435v4/shard-glk2/igt@gem_userptr_blits@dmabuf-sync.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3323">i915#3323</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_userptr_blits@dmabuf-unsync:</p>
<ul>
<li>shard-tglu-1:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_168435v4/shard-tglu-1/igt@gem_userptr_blits@dmabuf-unsync.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3297">i915#3297</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_userptr_blits@forbidden-operations:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_168435v4/shard-dg1-15/igt@gem_userptr_blits@forbidden-operations.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3282">i915#3282</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3297">i915#3297</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_userptr_blits@readonly-pwrite-unsync:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_168435v4/shard-dg2-8/igt@gem_userptr_blits@readonly-pwrite-unsync.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3297">i915#3297</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_userptr_blits@relocations:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_168435v4/shard-dg1-15/igt@gem_userptr_blits@relocations.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3281">i915#3281</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3297">i915#3297</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_userptr_blits@unsync-unmap-cycles:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_168435v4/shard-tglu-7/igt@gem_userptr_blits@unsync-unmap-cycles.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3297">i915#3297</a>)</li>
</ul>
</li>
<li>
<p>igt@gen9_exec_parse@allowed-single:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_168435v4/shard-dg2-8/igt@gen9_exec_parse@allowed-single.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2856">i915#2856</a>)</li>
</ul>
</li>
<li>
<p>igt@gen9_exec_parse@bb-chained:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_168435v4/shard-dg1-15/igt@gen9_exec_parse@bb-chained.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2527">i915#2527</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@gen9_exec_parse@bb-oversize:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_168435v4/shard-rkl-8/igt@gen9_exec_parse@bb-oversize.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2527">i915#2527</a>) +1 other test skip</li>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_168435v4/shard-mtlp-8/igt@gen9_exec_parse@bb-oversize.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2856">i915#2856</a>)</li>
</ul>
</li>
<li>
<p>igt@gen9_exec_parse@unaligned-jump:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_168435v4/shard-tglu-8/igt@gen9_exec_parse@unaligned-jump.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2527">i915#2527</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2856">i915#2856</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@i915_drm_fdinfo@virtual-busy-hang-all:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_168435v4/shard-dg1-15/igt@i915_drm_fdinfo@virtual-busy-hang-all.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14118">i915#14118</a>)</li>
</ul>
</li>
<li>
<p>igt@i915_module_load@fault-injection:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_168435v4/shard-dg2-8/igt@i915_module_load@fault-injection.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15342">i915#15342</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15481">i915#15481</a>)</li>
</ul>
</li>
<li>
<p>igt@i915_module_load@fault-injection@__uc_init:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_168435v4/shard-dg2-8/igt@i915_module_load@fault-injection@__uc_init.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15481">i915#15481</a>)</li>
</ul>
</li>
<li>
<p>igt@i915_module_load@fault-injection@intel_connector_register:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_168435v4/shard-dg2-8/igt@i915_module_load@fault-injection@intel_connector_register.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15342">i915#15342</a>)</li>
</ul>
</li>
<li>
<p>igt@i915_module_load@reload-no-display:</p>
<ul>
<li>shard-tglu-1:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_168435v4/shard-tglu-1/igt@i915_module_load@reload-no-display.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13029">i915#13029</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14545">i915#14545</a>)</li>
</ul>
</li>
<li>
<p>igt@i915_module_load@resize-bar:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_168435v4/shard-tglu-9/igt@i915_module_load@resize-bar.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6412">i915#6412</a>)</li>
</ul>
</li>
<li>
<p>igt@i915_pm_rc6_residency@rc6-accuracy:</p>
<ul>
<li>shard-dg2:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19375/shard-dg2-7/igt@i915_pm_rc6_residency@rc6-accuracy.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_168435v4/shard-dg2-1/igt@i915_pm_rc6_residency@rc6-accuracy.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12964">i915#12964</a>) +1 other test fail</li>
</ul>
</li>
<li>
<p>igt@i915_pm_rps@basic-api:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_168435v4/shard-dg1-16/igt@i915_pm_rps@basic-api.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11681">i915#11681</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6621">i915#6621</a>)</li>
</ul>
</li>
<li>
<p>igt@i915_pm_sseu@full-enable:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_168435v4/shard-rkl-8/igt@i915_pm_sseu@full-enable.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4387">i915#4387</a>)</li>
</ul>
</li>
<li>
<p>igt@i915_query@hwconfig_table:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_168435v4/shard-tglu-9/igt@i915_query@hwconfig_table.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6245">i915#6245</a>)</li>
</ul>
</li>
<li>
<p>igt@i915_query@query-topology-known-pci-ids:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_168435v4/shard-mtlp-8/igt@i915_query@query-topology-known-pci-ids.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16109">i915#16109</a>)</li>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_168435v4/shard-rkl-8/igt@i915_query@query-topology-known-pci-ids.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16109">i915#16109</a>)</li>
</ul>
</li>
<li>
<p>igt@i915_suspend@sysfs-reader:</p>
<ul>
<li>shard-glk:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_168435v4/shard-glk1/igt@i915_suspend@sysfs-reader.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13356">i915#13356</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16182">i915#16182</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4817">i915#4817</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_addfb_basic@invalid-smem-bo-on-discrete:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_168435v4/shard-tglu-8/igt@kms_addfb_basic@invalid-smem-bo-on-discrete.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12454">i915#12454</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12712">i915#12712</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_atomic@plane-primary-overlay-mutable-zpos:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_168435v4/shard-dg1-15/igt@kms_atomic@plane-primary-overlay-mutable-zpos.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9531">i915#9531</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@4-tiled-32bpp-rotate-180:</p>
<ul>
<li>shard-tglu-1:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_168435v4/shard-tglu-1/igt@kms_big_fb@4-tiled-32bpp-rotate-180.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5286">i915#5286</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@4-tiled-8bpp-rotate-90:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_168435v4/shard-dg1-16/igt@kms_big_fb@4-tiled-8bpp-rotate-90.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4538">i915#4538</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5286">i915#5286</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@4-tiled-max-hw-stride-32bpp-rotate-0-async-flip:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_168435v4/shard-tglu-8/igt@kms_big_fb@4-tiled-max-hw-stride-32bpp-rotate-0-async-flip.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5286">i915#5286</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-0-hflip-async-flip:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_168435v4/shard-rkl-2/igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-0-hflip-async-flip.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5286">i915#5286</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@linear-16bpp-rotate-270:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_168435v4/shard-dg1-15/igt@kms_big_fb@linear-16bpp-rotate-270.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3638">i915#3638</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@linear-max-hw-stride-32bpp-rotate-0-hflip:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_168435v4/shard-tglu-8/igt@kms_big_fb@linear-max-hw-stride-32bpp-rotate-0-hflip.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3828">i915#3828</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@x-tiled-64bpp-rotate-180:</p>
<ul>
<li>shard-dg2:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19375/shard-dg2-8/igt@kms_big_fb@x-tiled-64bpp-rotate-180.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_168435v4/shard-dg2-7/igt@kms_big_fb@x-tiled-64bpp-rotate-180.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17356">i915#17356</a>) +45 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-180-hflip:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_168435v4/shard-dg2-8/igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-180-hflip.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4538">i915#4538</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5190">i915#5190</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@yf-tiled-16bpp-rotate-90:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_168435v4/shard-dg1-16/igt@kms_big_fb@yf-tiled-16bpp-rotate-90.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4538">i915#4538</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@bad-aux-stride-4-tiled-mtl-mc-ccs@pipe-a-hdmi-a-4:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_168435v4/shard-dg1-16/igt@kms_ccs@bad-aux-stride-4-tiled-mtl-mc-ccs@pipe-a-hdmi-a-4.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6095">i915#6095</a>) +186 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@bad-aux-stride-y-tiled-gen12-rc-ccs-cc@pipe-c-hdmi-a-2:</p>
<ul>
<li>shard-glk10:        NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_168435v4/shard-glk10/igt@kms_ccs@bad-aux-stride-y-tiled-gen12-rc-ccs-cc@pipe-c-hdmi-a-2.html">SKIP</a> +73 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@bad-pixel-format-y-tiled-ccs@pipe-d-hdmi-a-1:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_168435v4/shard-dg2-4/igt@kms_ccs@bad-pixel-format-y-tiled-ccs@pipe-d-hdmi-a-1.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/10307">i915#10307</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/10434">i915#10434</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6095">i915#6095</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@bad-rotation-90-yf-tiled-ccs@pipe-b-hdmi-a-1:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_168435v4/shard-tglu-7/igt@kms_ccs@bad-rotation-90-yf-tiled-ccs@pipe-b-hdmi-a-1.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6095">i915#6095</a>) +39 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-basic-4-tiled-bmg-ccs:</p>
<ul>
<li>shard-tglu-1:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_168435v4/shard-tglu-1/igt@kms_ccs@crc-primary-basic-4-tiled-bmg-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12313">i915#12313</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-rotation-180-4-tiled-bmg-ccs:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_168435v4/shard-rkl-5/igt@kms_ccs@crc-primary-rotation-180-4-tiled-bmg-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12313">i915#12313</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-rotation-180-4-tiled-mtl-mc-ccs@pipe-c-hdmi-a-2:</p>
<ul>
<li>shard-glk:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_168435v4/shard-glk2/igt@kms_ccs@crc-primary-rotation-180-4-tiled-mtl-mc-ccs@pipe-c-hdmi-a-2.html">SKIP</a> +186 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-rotation-180-y-tiled-ccs@pipe-c-hdmi-a-1:</p>
<ul>
<li>shard-glk11:        NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_168435v4/shard-glk11/igt@kms_ccs@crc-primary-rotation-180-y-tiled-ccs@pipe-c-hdmi-a-1.html">SKIP</a> +191 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-suspend-4-tiled-bmg-ccs:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_168435v4/shard-dg1-16/igt@kms_ccs@crc-primary-suspend-4-tiled-bmg-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12805">i915#12805</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-suspend-4-tiled-lnl-ccs:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_168435v4/shard-tglu-8/igt@kms_ccs@crc-primary-suspend-4-tiled-lnl-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12805">i915#12805</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-suspend-4-tiled-mtl-rc-ccs@pipe-c-hdmi-a-1:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_168435v4/shard-dg2-4/igt@kms_ccs@crc-primary-suspend-4-tiled-mtl-rc-ccs@pipe-c-hdmi-a-1.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6095">i915#6095</a>) +11 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-suspend-y-tiled-gen12-mc-ccs@pipe-b-edp-1:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_168435v4/shard-mtlp-8/igt@kms_ccs@crc-primary-suspend-y-tiled-gen12-mc-ccs@pipe-b-edp-1.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6095">i915#6095</a>) +9 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-suspend-y-tiled-gen12-rc-ccs-cc:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19375/shard-rkl-5/igt@kms_ccs@crc-primary-suspend-y-tiled-gen12-rc-ccs-cc.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_168435v4/shard-rkl-3/igt@kms_ccs@crc-primary-suspend-y-tiled-gen12-rc-ccs-cc.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14694">i915#14694</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15582">i915#15582</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-suspend-y-tiled-gen12-rc-ccs-cc@pipe-a-hdmi-a-2:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_168435v4/shard-rkl-3/igt@kms_ccs@crc-primary-suspend-y-tiled-gen12-rc-ccs-cc@pipe-a-hdmi-a-2.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14694">i915#14694</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15582">i915#15582</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-sprite-planes-basic-4-tiled-bmg-ccs:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_168435v4/shard-tglu-9/igt@kms_ccs@crc-sprite-planes-basic-4-tiled-bmg-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12313">i915#12313</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-sprite-planes-basic-4-tiled-dg2-rc-ccs@pipe-b-hdmi-a-2:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_168435v4/shard-rkl-4/igt@kms_ccs@crc-sprite-planes-basic-4-tiled-dg2-rc-ccs@pipe-b-hdmi-a-2.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6095">i915#6095</a>) +43 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-sprite-planes-basic-4-tiled-mtl-mc-ccs:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_168435v4/shard-rkl-5/igt@kms_ccs@crc-sprite-planes-basic-4-tiled-mtl-mc-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14098">i915#14098</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6095">i915#6095</a>) +33 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@missing-ccs-buffer-4-tiled-mtl-mc-ccs@pipe-b-hdmi-a-1:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_168435v4/shard-dg2-4/igt@kms_ccs@missing-ccs-buffer-4-tiled-mtl-mc-ccs@pipe-b-hdmi-a-1.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/10307">i915#10307</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6095">i915#6095</a>) +84 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@missing-ccs-buffer-y-tiled-gen12-mc-ccs@pipe-b-hdmi-a-1:</p>
<ul>
<li>shard-tglu-1:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_168435v4/shard-tglu-1/igt@kms_ccs@missing-ccs-buffer-y-tiled-gen12-mc-ccs@pipe-b-hdmi-a-1.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6095">i915#6095</a>) +14 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_cdclk@mode-transition-all-outputs:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_168435v4/shard-tglu-8/igt@kms_cdclk@mode-transition-all-outputs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3742">i915#3742</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cdclk@mode-transition@pipe-d-hdmi-a-3:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_168435v4/shard-dg2-6/igt@kms_cdclk@mode-transition@pipe-d-hdmi-a-3.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13781">i915#13781</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_audio@dp-audio-after-suspend:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_168435v4/shard-tglu-7/igt@kms_chamelium_audio@dp-audio-after-suspend.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11151">i915#11151</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_audio@hdmi-audio-edid:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_168435v4/shard-tglu-9/igt@kms_chamelium_audio@hdmi-audio-edid.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11151">i915#11151</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/7828">i915#7828</a>) +6 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_color_pipeline@plane-fixed-matrix-yuv-rgb-bt601-lut1d:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_168435v4/shard-mtlp-8/igt@kms_chamelium_color_pipeline@plane-fixed-matrix-yuv-rgb-bt601-lut1d.html">SKIP</a> +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_color_pipeline@plane-lut1d:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_168435v4/shard-tglu-7/igt@kms_chamelium_color_pipeline@plane-lut1d.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16471">i915#16471</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_color_pipeline@plane-lut1d-lut1d:</p>
<ul>
<li>shard-tglu-1:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_168435v4/shard-tglu-1/igt@kms_chamelium_color_pipeline@plane-lut1d-lut1d.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16471">i915#16471</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_color_pipeline@plane-lut3d-green-only:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_168435v4/shard-rkl-2/igt@kms_chamelium_color_pipeline@plane-lut3d-green-only.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16471">i915#16471</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_edid@hdmi-edid-read:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_168435v4/shard-rkl-2/igt@kms_chamelium_edid@hdmi-edid-read.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11151">i915#11151</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/7828">i915#7828</a>) +9 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_hpd@dp-hpd-with-enabled-mode:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_168435v4/shard-mtlp-8/igt@kms_chamelium_hpd@dp-hpd-with-enabled-mode.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11151">i915#11151</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/7828">i915#7828</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_hpd@hdmi-hpd-after-suspend:</p>
<ul>
<li>shard-tglu-1:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_168435v4/shard-tglu-1/igt@kms_chamelium_hpd@hdmi-hpd-after-suspend.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11151">i915#11151</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/7828">i915#7828</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_hpd@vga-hpd-for-each-pipe:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_168435v4/shard-dg1-15/igt@kms_chamelium_hpd@vga-hpd-for-each-pipe.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11151">i915#11151</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/7828">i915#7828</a>) +5 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-negative:</p>
<ul>
<li>shard-dg2:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19375/shard-dg2-8/igt@kms_color@ctm-negative.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_168435v4/shard-dg2-7/igt@kms_color@ctm-negative.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12655">i915#12655</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17373">i915#17373</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_color_pipeline@plane-lut1d-lut1d:</p>
<ul>
<li>shard-dg2:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19375/shard-dg2-3/igt@kms_color_pipeline@plane-lut1d-lut1d.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_168435v4/shard-dg2-7/igt@kms_color_pipeline@plane-lut1d-lut1d.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15529">i915#15529</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_color_pipeline@plane-lut1d-pre-ctm3x4@pipe-a-plane-4:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_168435v4/shard-rkl-4/igt@kms_color_pipeline@plane-lut1d-pre-ctm3x4@pipe-a-plane-4.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16990">i915#16990</a>) +5 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@atomic-hdcp14:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_168435v4/shard-tglu-8/igt@kms_content_protection@atomic-hdcp14.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15865">i915#15865</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@dp-mst-lic-type-1:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_168435v4/shard-tglu-7/igt@kms_content_protection@dp-mst-lic-type-1.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15330">i915#15330</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3116">i915#3116</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3299">i915#3299</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@legacy:</p>
<ul>
<li>shard-tglu-1:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_168435v4/shard-tglu-1/igt@kms_content_protection@legacy.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15865">i915#15865</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@lic-type-0-hdcp14:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_168435v4/shard-dg2-4/igt@kms_content_protection@lic-type-0-hdcp14.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15865">i915#15865</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@srm:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_168435v4/shard-dg1-15/igt@kms_content_protection@srm.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15865">i915#15865</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-offscreen-32x32:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_168435v4/shard-mtlp-8/igt@kms_cursor_crc@cursor-offscreen-32x32.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3555">i915#3555</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8814">i915#8814</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-offscreen-512x170:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_168435v4/shard-rkl-2/igt@kms_cursor_crc@cursor-offscreen-512x170.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13049">i915#13049</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-onscreen-256x85:</p>
<ul>
<li>shard-tglu-1:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_168435v4/shard-tglu-1/igt@kms_cursor_crc@cursor-onscreen-256x85.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13566">i915#13566</a>) +1 other test fail</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-onscreen-32x32:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_168435v4/shard-rkl-8/igt@kms_cursor_crc@cursor-onscreen-32x32.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3555">i915#3555</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-random-256x85@pipe-a-hdmi-a-1:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_168435v4/shard-rkl-2/igt@kms_cursor_crc@cursor-random-256x85@pipe-a-hdmi-a-1.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13566">i915#13566</a>) +2 other tests fail</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-random-512x170:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_168435v4/shard-dg2-4/igt@kms_cursor_crc@cursor-random-512x170.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13049">i915#13049</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-rapid-movement-256x85:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_168435v4/shard-mtlp-8/igt@kms_cursor_crc@cursor-rapid-movement-256x85.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8814">i915#8814</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-rapid-movement-512x512:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_168435v4/shard-tglu-7/igt@kms_cursor_crc@cursor-rapid-movement-512x512.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13049">i915#13049</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-suspend:</p>
<ul>
<li>shard-glk11:        NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_168435v4/shard-glk11/igt@kms_cursor_crc@cursor-suspend.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12358">i915#12358</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13356">i915#13356</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14152">i915#14152</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/7882">i915#7882</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-suspend@pipe-a-hdmi-a-1:</p>
<ul>
<li>shard-glk11:        NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_168435v4/shard-glk11/igt@kms_cursor_crc@cursor-suspend@pipe-a-hdmi-a-1.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12358">i915#12358</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13356">i915#13356</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14152">i915#14152</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-suspend@pipe-a-hdmi-a-3:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_168435v4/shard-dg2-3/igt@kms_cursor_crc@cursor-suspend@pipe-a-hdmi-a-3.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12358">i915#12358</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13356">i915#13356</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14152">i915#14152</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@basic-busy-flip-before-cursor-atomic:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_168435v4/shard-tglu-9/igt@kms_cursor_legacy@basic-busy-flip-before-cursor-atomic.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4103">i915#4103</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@cursorb-vs-flipb-varying-size:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_168435v4/shard-dg2-8/igt@kms_cursor_legacy@cursorb-vs-flipb-varying-size.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13046">i915#13046</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5354">i915#5354</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@modeset-atomic-cursor-hotspot:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_168435v4/shard-tglu-9/igt@kms_cursor_legacy@modeset-atomic-cursor-hotspot.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9067">i915#9067</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_dirtyfb@psr-dirtyfb-ioctl:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_168435v4/shard-rkl-2/igt@kms_dirtyfb@psr-dirtyfb-ioctl.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9723">i915#9723</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_dither@fb-8bpc-vs-panel-6bpc@pipe-a-hdmi-a-2:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_168435v4/shard-rkl-7/igt@kms_dither@fb-8bpc-vs-panel-6bpc@pipe-a-hdmi-a-2.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3804">i915#3804</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_dp_link_training@non-uhbr-mst-direct-train:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_168435v4/shard-tglu-7/igt@kms_dp_link_training@non-uhbr-mst-direct-train.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17287">i915#17287</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_dp_link_training@non-uhbr-sst-tbtalt-train:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_168435v4/shard-tglu-8/igt@kms_dp_link_training@non-uhbr-sst-tbtalt-train.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17290">i915#17290</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_dp_link_training@uhbr-mst:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_168435v4/shard-rkl-4/igt@kms_dp_link_training@uhbr-mst.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13748">i915#13748</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_dp_link_training@uhbr-sst-direct-train:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_168435v4/shard-rkl-8/igt@kms_dp_link_training@uhbr-sst-direct-train.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17285">i915#17285</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_dp_link_training@uhbr-sst-tbtalt-train:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_168435v4/shard-tglu-9/igt@kms_dp_link_training@uhbr-sst-tbtalt-train.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17285">i915#17285</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_dp_linktrain_fallback@dp-fallback:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_168435v4/shard-dg1-15/igt@kms_dp_linktrain_fallback@dp-fallback.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16867">i915#16867</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_draw_crc@draw-method-mmap-wc:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_168435v4/shard-dg1-15/igt@kms_draw_crc@draw-method-mmap-wc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8812">i915#8812</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_dsc@dsc-with-bpc-formats:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_168435v4/shard-tglu-7/igt@kms_dsc@dsc-with-bpc-formats.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16361">i915#16361</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_dsc@dsc-with-formats-bigjoiner:</p>
<ul>
<li>shard-tglu-1:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_168435v4/shard-tglu-1/igt@kms_dsc@dsc-with-formats-bigjoiner.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16361">i915#16361</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_dsc@dsc-with-formats-ultrajoiner:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_168435v4/shard-dg2-8/igt@kms_dsc@dsc-with-formats-ultrajoiner.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16361">i915#16361</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_dsc@dsc-with-output-formats-with-bpc:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_168435v4/shard-dg1-16/igt@kms_dsc@dsc-with-output-formats-with-bpc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16361">i915#16361</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_dsc@dsc-with-output-formats-with-bpc-bigjoiner:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_168435v4/shard-rkl-2/igt@kms_dsc@dsc-with-output-formats-with-bpc-bigjoiner.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16361">i915#16361</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_fbcon_fbt@fbc:</p>
<ul>
<li>shard-dg2:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19375/shard-dg2-8/igt@kms_fbcon_fbt@fbc.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_168435v4/shard-dg2-7/igt@kms_fbcon_fbt@fbc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/1849">i915#1849</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_fbcon_fbt@fbc-suspend:</p>
<ul>
<li>shard-glk11:        NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_168435v4/shard-glk11/igt@kms_fbcon_fbt@fbc-suspend.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13356">i915#13356</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9878">i915#9878</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_fbcon_fbt@psr:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_168435v4/shard-tglu-9/igt@kms_fbcon_fbt@psr.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16680">i915#16680</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_feature_discovery@chamelium:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_168435v4/shard-tglu-7/igt@kms_feature_discovery@chamelium.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2065">i915#2065</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_feature_discovery@hdr:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_168435v4/shard-rkl-4/igt@kms_feature_discovery@hdr.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16600">i915#16600</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_feature_discovery@vrr:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_168435v4/shard-dg1-15/igt@kms_feature_discovery@vrr.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16600">i915#16600</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-dpms:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_168435v4/shard-rkl-8/igt@kms_flip@2x-flip-vs-dpms.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9934">i915#9934</a>) +3 other tests skip</li>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_168435v4/shard-mtlp-8/igt@kms_flip@2x-flip-vs-dpms.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3637">i915#3637</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9934">i915#9934</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-suspend-interruptible:</p>
<ul>
<li>shard-tglu-1:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_168435v4/shard-tglu-1/igt@kms_flip@2x-flip-vs-suspend-interruptible.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3637">i915#3637</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9934">i915#9934</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-plain-flip-interruptible:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_168435v4/shard-dg1-15/igt@kms_flip@2x-plain-flip-interruptible.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9934">i915#9934</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-plain-flip-ts-check:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_168435v4/shard-tglu-9/igt@kms_flip@2x-plain-flip-ts-check.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3637">i915#3637</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9934">i915#9934</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip@dpms-off-confusion-interruptible:</p>
<ul>
<li>shard-dg2:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19375/shard-dg2-8/igt@kms_flip@dpms-off-confusion-interruptible.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_168435v4/shard-dg2-7/igt@kms_flip@dpms-off-confusion-interruptible.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5354">i915#5354</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-suspend:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19375/shard-rkl-5/igt@kms_flip@flip-vs-suspend.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_168435v4/shard-rkl-3/igt@kms_flip@flip-vs-suspend.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16276">i915#16276</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6113">i915#6113</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-suspend-interruptible:</p>
<ul>
<li>shard-glk10:        NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_168435v4/shard-glk10/igt@kms_flip@flip-vs-suspend-interruptible.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12745">i915#12745</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13356">i915#13356</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17183">i915#17183</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4839">i915#4839</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-suspend-interruptible@a-hdmi-a1:</p>
<ul>
<li>shard-glk10:        NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_168435v4/shard-glk10/igt@kms_flip@flip-vs-suspend-interruptible@a-hdmi-a1.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12745">i915#12745</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13356">i915#13356</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17183">i915#17183</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-suspend@a-hdmi-a2:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_168435v4/shard-rkl-3/igt@kms_flip@flip-vs-suspend@a-hdmi-a2.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16276">i915#16276</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6113">i915#6113</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytileccs-downscaling:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_168435v4/shard-rkl-2/igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytileccs-downscaling.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15643">i915#15643</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-32bpp-4tile-upscaling:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_168435v4/shard-tglu-9/igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-32bpp-4tile-upscaling.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15643">i915#15643</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-32bpp-4tiledg2rcccs-downscaling:</p>
<ul>
<li>shard-dg2:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19375/shard-dg2-4/igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-32bpp-4tiledg2rcccs-downscaling.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_168435v4/shard-dg2-7/igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-32bpp-4tiledg2rcccs-downscaling.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3555">i915#3555</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8813">i915#8813</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-32bpp-yftile-upscaling:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_168435v4/shard-dg1-16/igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-32bpp-yftile-upscaling.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15643">i915#15643</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-p010-4tile-to-p016-4tile:</p>
<ul>
<li>shard-tglu-1:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_168435v4/shard-tglu-1/igt@kms_flip_scaled_crc@flip-p010-4tile-to-p016-4tile.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15643">i915#15643</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-1p-offscreen-pri-shrfb-draw-mmap-cpu:</p>
<ul>
<li>shard-dg2:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19375/shard-dg2-4/igt@kms_frontbuffer_tracking@fbc-1p-offscreen-pri-shrfb-draw-mmap-cpu.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_168435v4/shard-dg2-7/igt@kms_frontbuffer_tracking@fbc-1p-offscreen-pri-shrfb-draw-mmap-cpu.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16708">i915#16708</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-1p-offscreen-pri-shrfb-draw-mmap-gtt:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_168435v4/shard-dg1-16/igt@kms_frontbuffer_tracking@fbc-1p-offscreen-pri-shrfb-draw-mmap-gtt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15104">i915#15104</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15990">i915#15990</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-1p-primscrn-spr-indfb-draw-mmap-cpu:</p>
<ul>
<li>shard-dg2:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19375/shard-dg2-3/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-spr-indfb-draw-mmap-cpu.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_168435v4/shard-dg2-7/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-spr-indfb-draw-mmap-cpu.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16708">i915#16708</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5354">i915#5354</a>) +6 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-indfb-plflip-blt:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_168435v4/shard-dg2-4/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-indfb-plflip-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15991">i915#15991</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5354">i915#5354</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-suspend:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19375/shard-rkl-8/igt@kms_frontbuffer_tracking@fbc-suspend.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_168435v4/shard-rkl-7/igt@kms_frontbuffer_tracking@fbc-suspend.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/10056">i915#10056</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbchdr-1p-offscreen-pri-shrfb-draw-blt:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_168435v4/shard-mtlp-8/igt@kms_frontbuffer_tracking@fbchdr-1p-offscreen-pri-shrfb-draw-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15989">i915#15989</a>) +5 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbchdr-1p-primscrn-spr-indfb-draw-mmap-gtt:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_168435v4/shard-dg2-8/igt@kms_frontbuffer_tracking@fbchdr-1p-primscrn-spr-indfb-draw-mmap-gtt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15990">i915#15990</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbchdr-2p-primscrn-pri-indfb-draw-blt:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_168435v4/shard-rkl-4/igt@kms_frontbuffer_tracking@fbchdr-2p-primscrn-pri-indfb-draw-blt.html">SKIP</a> +80 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbchdr-2p-primscrn-spr-indfb-move:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_168435v4/shard-dg2-8/igt@kms_frontbuffer_tracking@fbchdr-2p-primscrn-spr-indfb-move.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15991">i915#15991</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-1p-pri-indfb-multidraw:</p>
<ul>
<li>shard-tglu-1:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_168435v4/shard-tglu-1/igt@kms_frontbuffer_tracking@fbcpsr-1p-pri-indfb-multidraw.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15102">i915#15102</a>) +10 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-cur-indfb-move:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_168435v4/shard-dg1-15/igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-cur-indfb-move.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15102">i915#15102</a>) +17 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-pri-indfb-draw-mmap-wc:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_168435v4/shard-dg2-8/igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-pri-indfb-draw-mmap-wc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15990">i915#15990</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8708">i915#8708</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-spr-indfb-draw-mmap-gtt:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_168435v4/shard-rkl-2/igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-spr-indfb-draw-mmap-gtt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/1825">i915#1825</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-rgb101010-draw-mmap-wc:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_168435v4/shard-dg1-16/igt@kms_frontbuffer_tracking@fbcpsr-rgb101010-draw-mmap-wc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15990">i915#15990</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8708">i915#8708</a>) +5 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-tiling-4:</p>
<ul>
<li>shard-tglu-1:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_168435v4/shard-tglu-1/igt@kms_frontbuffer_tracking@fbcpsr-tiling-4.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5439">i915#5439</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsrhdr-1p-indfb-fliptrack-mmap-gtt:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_168435v4/shard-tglu-8/igt@kms_frontbuffer_tracking@fbcpsrhdr-1p-indfb-fliptrack-mmap-gtt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15102">i915#15102</a>) +31 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsrhdr-2p-scndscrn-spr-indfb-draw-mmap-wc:</p>
<ul>
<li>shard-tglu-1:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_168435v4/shard-tglu-1/igt@kms_frontbuffer_tracking@fbcpsrhdr-2p-scndscrn-spr-indfb-draw-mmap-wc.html">SKIP</a> +31 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsrhdr-2p-shrfb-fliptrack-mmap-gtt:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_168435v4/shard-dg1-16/igt@kms_frontbuffer_tracking@fbcpsrhdr-2p-shrfb-fliptrack-mmap-gtt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15990">i915#15990</a>) +6 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsrhdr-rgb101010-draw-mmap-gtt:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_168435v4/shard-mtlp-8/igt@kms_frontbuffer_tracking@fbcpsrhdr-rgb101010-draw-mmap-gtt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15990">i915#15990</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsrhdr-tiling-4:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_168435v4/shard-rkl-5/igt@kms_frontbuffer_tracking@fbcpsrhdr-tiling-4.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5439">i915#5439</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@hdr-1p-offscreen-pri-shrfb-draw-mmap-gtt:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_168435v4/shard-tglu-9/igt@kms_frontbuffer_tracking@hdr-1p-offscreen-pri-shrfb-draw-mmap-gtt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15989">i915#15989</a>) +18 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@hdr-1p-offscreen-pri-shrfb-draw-render:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_168435v4/shard-dg2-8/igt@kms_frontbuffer_tracking@hdr-1p-offscreen-pri-shrfb-draw-render.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15989">i915#15989</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@hdr-1p-primscrn-cur-indfb-draw-blt:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_168435v4/shard-rkl-8/igt@kms_frontbuffer_tracking@hdr-1p-primscrn-cur-indfb-draw-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15989">i915#15989</a>) +23 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@hdr-1p-primscrn-spr-indfb-draw-mmap-cpu:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_168435v4/shard-dg1-15/igt@kms_frontbuffer_tracking@hdr-1p-primscrn-spr-indfb-draw-mmap-cpu.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15989">i915#15989</a>) +8 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@hdr-1p-primscrn-spr-indfb-draw-mmap-wc:</p>
<ul>
<li>shard-tglu-1:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_168435v4/shard-tglu-1/igt@kms_frontbuffer_tracking@hdr-1p-primscrn-spr-indfb-draw-mmap-wc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15989">i915#15989</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@hdr-1p-primscrn-spr-indfb-draw-pwrite:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19375/shard-rkl-6/igt@kms_frontbuffer_tracking@hdr-1p-primscrn-spr-indfb-draw-pwrite.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_168435v4/shard-rkl-4/igt@kms_frontbuffer_tracking@hdr-1p-primscrn-spr-indfb-draw-pwrite.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15989">i915#15989</a>) +8 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-1p-offscreen-pri-indfb-draw-mmap-gtt:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_168435v4/shard-dg2-8/igt@kms_frontbuffer_tracking@psr-1p-offscreen-pri-indfb-draw-mmap-gtt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15104">i915#15104</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15990">i915#15990</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-2p-scndscrn-pri-shrfb-draw-mmap-wc:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_168435v4/shard-tglu-9/igt@kms_frontbuffer_tracking@psr-2p-scndscrn-pri-shrfb-draw-mmap-wc.html">SKIP</a> +79 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-2p-scndscrn-spr-indfb-draw-mmap-cpu:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_168435v4/shard-mtlp-8/igt@kms_frontbuffer_tracking@psr-2p-scndscrn-spr-indfb-draw-mmap-cpu.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15991">i915#15991</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/1825">i915#1825</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psrhdr-1p-offscreen-pri-indfb-draw-mmap-cpu:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_168435v4/shard-dg2-8/igt@kms_frontbuffer_tracking@psrhdr-1p-offscreen-pri-indfb-draw-mmap-cpu.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15102">i915#15102</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psrhdr-1p-primscrn-cur-indfb-draw-mmap-gtt:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_168435v4/shard-rkl-5/igt@kms_frontbuffer_tracking@psrhdr-1p-primscrn-cur-indfb-draw-mmap-gtt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15102">i915#15102</a>) +29 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psrhdr-2p-primscrn-cur-indfb-draw-blt:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_168435v4/shard-dg1-15/igt@kms_frontbuffer_tracking@psrhdr-2p-primscrn-cur-indfb-draw-blt.html">SKIP</a> +41 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psrhdr-2p-scndscrn-pri-indfb-draw-mmap-cpu:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_168435v4/shard-mtlp-8/igt@kms_frontbuffer_tracking@psrhdr-2p-scndscrn-pri-indfb-draw-mmap-cpu.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15991">i915#15991</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_hdmi_audio_bw@audio-bw-hblank160:</p>
<ul>
<li>shard-glk11:        NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_168435v4/shard-glk11/igt@kms_hdmi_audio_bw@audio-bw-hblank160.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17102">i915#17102</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_hdmi_audio_bw@suspend-disk-audio-recovery:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_168435v4/shard-rkl-8/igt@kms_hdmi_audio_bw@suspend-disk-audio-recovery.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17122">i915#17122</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17137">i915#17137</a>)</li>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_168435v4/shard-mtlp-8/igt@kms_hdmi_audio_bw@suspend-disk-audio-recovery.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17103">i915#17103</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_hdmi_inject@inject-audio:</p>
<ul>
<li>shard-glk:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19375/shard-glk1/igt@kms_hdmi_inject@inject-audio.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_168435v4/shard-glk8/igt@kms_hdmi_inject@inject-audio.html">SKIP</a></li>
</ul>
</li>
<li>
<p>igt@kms_hdr@bpc-switch-suspend:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_168435v4/shard-tglu-7/igt@kms_hdr@bpc-switch-suspend.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3555">i915#3555</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8228">i915#8228</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_hdr@invalid-metadata-sizes:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_168435v4/shard-rkl-2/igt@kms_hdr@invalid-metadata-sizes.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16644">i915#16644</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3555">i915#3555</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8228">i915#8228</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_invalid_mode@bad-hsync-end:</p>
<ul>
<li>shard-dg2:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19375/shard-dg2-3/igt@kms_invalid_mode@bad-hsync-end.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_168435v4/shard-dg2-7/igt@kms_invalid_mode@bad-hsync-end.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16746">i915#16746</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3555">i915#3555</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_invalid_mode@overflow-vrefresh:</p>
<ul>
<li>shard-dg2:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19375/shard-dg2-4/igt@kms_invalid_mode@overflow-vrefresh.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_168435v4/shard-dg2-7/igt@kms_invalid_mode@overflow-vrefresh.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16746">i915#16746</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_joiner@basic-force-big-joiner:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_168435v4/shard-rkl-2/igt@kms_joiner@basic-force-big-joiner.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15459">i915#15459</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_joiner@basic-max-non-joiner:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_168435v4/shard-rkl-5/igt@kms_joiner@basic-max-non-joiner.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13688">i915#13688</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_joiner@basic-ultra-joiner:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_168435v4/shard-rkl-8/igt@kms_joiner@basic-ultra-joiner.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15458">i915#15458</a>)</li>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_168435v4/shard-mtlp-8/igt@kms_joiner@basic-ultra-joiner.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15458">i915#15458</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_joiner@invalid-modeset-big-joiner:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_168435v4/shard-tglu-9/igt@kms_joiner@invalid-modeset-big-joiner.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15460">i915#15460</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_joiner@switch-modeset-ultra-joiner-big-joiner:</p>
<ul>
<li>shard-tglu-1:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_168435v4/shard-tglu-1/igt@kms_joiner@switch-modeset-ultra-joiner-big-joiner.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15638">i915#15638</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15722">i915#15722</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_multipipe_modeset@basic-max-pipe-crc-check:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_168435v4/shard-rkl-8/igt@kms_multipipe_modeset@basic-max-pipe-crc-check.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15815">i915#15815</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_panel_fitting@atomic-fastset:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_168435v4/shard-dg2-4/igt@kms_panel_fitting@atomic-fastset.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6301">i915#6301</a>)</li>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_168435v4/shard-tglu-8/igt@kms_panel_fitting@atomic-fastset.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6301">i915#6301</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_panel_fitting@legacy:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_168435v4/shard-dg1-15/igt@kms_panel_fitting@legacy.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6301">i915#6301</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pipe_crc_basic@hang-read-crc:</p>
<ul>
<li>shard-dg2:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19375/shard-dg2-8/igt@kms_pipe_crc_basic@hang-read-crc.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_168435v4/shard-dg2-7/igt@kms_pipe_crc_basic@hang-read-crc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11190">i915#11190</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17356">i915#17356</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_pipe_stress@stress-xrgb8888-4tiled:</p>
<ul>
<li>shard-tglu-1:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_168435v4/shard-tglu-1/igt@kms_pipe_stress@stress-xrgb8888-4tiled.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14712">i915#14712</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pipe_stress@stress-xrgb8888-yftiled:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_168435v4/shard-dg1-16/igt@kms_pipe_stress@stress-xrgb8888-yftiled.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14712">i915#14712</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane@pixel-format-4-tiled-dg2-rc-ccs-cc-modifier@pipe-a-plane-5:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_168435v4/shard-dg2-4/igt@kms_plane@pixel-format-4-tiled-dg2-rc-ccs-cc-modifier@pipe-a-plane-5.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16386">i915#16386</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_plane@pixel-format-4-tiled-mtl-rc-ccs-cc-modifier:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_168435v4/shard-rkl-8/igt@kms_plane@pixel-format-4-tiled-mtl-rc-ccs-cc-modifier.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15709">i915#15709</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_plane@pixel-format-4-tiled-mtl-rc-ccs-cc-modifier@pipe-a-plane-5:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_168435v4/shard-mtlp-8/igt@kms_plane@pixel-format-4-tiled-mtl-rc-ccs-cc-modifier@pipe-a-plane-5.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16386">i915#16386</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_plane@pixel-format-x-tiled-modifier:</p>
<ul>
<li>shard-dg2:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19375/shard-dg2-4/igt@kms_plane@pixel-format-x-tiled-modifier.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_168435v4/shard-dg2-7/igt@kms_plane@pixel-format-x-tiled-modifier.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8825">i915#8825</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane@pixel-format-y-tiled-ccs-modifier:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_168435v4/shard-dg1-15/igt@kms_plane@pixel-format-y-tiled-ccs-modifier.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15709">i915#15709</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_plane@pixel-format-y-tiled-ccs-modifier-source-clamping:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_168435v4/shard-tglu-7/igt@kms_plane@pixel-format-y-tiled-ccs-modifier-source-clamping.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15709">i915#15709</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_plane@pixel-format-y-tiled-gen12-rc-ccs-modifier@pipe-b-plane-5:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_168435v4/shard-rkl-2/igt@kms_plane@pixel-format-y-tiled-gen12-rc-ccs-modifier@pipe-b-plane-5.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16386">i915#16386</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_plane@pixel-format-y-tiled-modifier@pipe-b-plane-7:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_168435v4/shard-tglu-8/igt@kms_plane@pixel-format-y-tiled-modifier@pipe-b-plane-7.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16386">i915#16386</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_plane_alpha_blend@alpha-opaque-fb:</p>
<ul>
<li>shard-glk10:        NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_168435v4/shard-glk10/igt@kms_plane_alpha_blend@alpha-opaque-fb.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/10647">i915#10647</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12169">i915#12169</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane_alpha_blend@alpha-opaque-fb@pipe-c-hdmi-a-1:</p>
<ul>
<li>shard-glk10:        NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_168435v4/shard-glk10/igt@kms_plane_alpha_blend@alpha-opaque-fb@pipe-c-hdmi-a-1.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/10647">i915#10647</a>) +1 other test fail</li>
</ul>
</li>
<li>
<p>igt@kms_plane_multiple@2x-tiling-none:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_168435v4/shard-tglu-9/igt@kms_plane_multiple@2x-tiling-none.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13958">i915#13958</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane_multiple@2x-tiling-y:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_168435v4/shard-rkl-8/igt@kms_plane_multiple@2x-tiling-y.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13958">i915#13958</a>)</li>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_168435v4/shard-mtlp-8/igt@kms_plane_multiple@2x-tiling-y.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13958">i915#13958</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane_multiple@2x-tiling-yf:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_168435v4/shard-dg1-15/igt@kms_plane_multiple@2x-tiling-yf.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13958">i915#13958</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@invalid-num-scalers:</p>
<ul>
<li>shard-dg2:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19375/shard-dg2-3/igt@kms_plane_scaling@invalid-num-scalers.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_168435v4/shard-dg2-7/igt@kms_plane_scaling@invalid-num-scalers.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17356">i915#17356</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3555">i915#3555</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6953">i915#6953</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9423">i915#9423</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-downscale-factor-0-75-with-rotation@pipe-a:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_168435v4/shard-tglu-7/igt@kms_plane_scaling@plane-downscale-factor-0-75-with-rotation@pipe-a.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15329">i915#15329</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-upscale-20x20-with-modifiers:</p>
<ul>
<li>shard-dg2:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19375/shard-dg2-8/igt@kms_plane_scaling@plane-upscale-20x20-with-modifiers.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_168435v4/shard-dg2-7/igt@kms_plane_scaling@plane-upscale-20x20-with-modifiers.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15329">i915#15329</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17356">i915#17356</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9423">i915#9423</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-upscale-20x20-with-modifiers@pipe-d:</p>
<ul>
<li>shard-dg2:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19375/shard-dg2-8/igt@kms_plane_scaling@plane-upscale-20x20-with-modifiers@pipe-d.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_168435v4/shard-dg2-7/igt@kms_plane_scaling@plane-upscale-20x20-with-modifiers@pipe-d.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15329">i915#15329</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17356">i915#17356</a>) +6 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@planes-downscale-factor-0-75:</p>
<ul>
<li>shard-dg2:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19375/shard-dg2-8/igt@kms_plane_scaling@planes-downscale-factor-0-75.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_168435v4/shard-dg2-7/igt@kms_plane_scaling@planes-downscale-factor-0-75.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15329">i915#15329</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17356">i915#17356</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3555">i915#3555</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6953">i915#6953</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9423">i915#9423</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@planes-scaler-unity-scaling:</p>
<ul>
<li>shard-dg2:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19375/shard-dg2-8/igt@kms_plane_scaling@planes-scaler-unity-scaling.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_168435v4/shard-dg2-7/igt@kms_plane_scaling@planes-scaler-unity-scaling.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15329">i915#15329</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17356">i915#17356</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3555">i915#3555</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9423">i915#9423</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@planes-scaler-unity-scaling@pipe-a:</p>
<ul>
<li>shard-dg2:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19375/shard-dg2-8/igt@kms_plane_scaling@planes-scaler-unity-scaling@pipe-a.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_168435v4/shard-dg2-7/igt@kms_plane_scaling@planes-scaler-unity-scaling@pipe-a.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15329">i915#15329</a>) +20 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@planes-upscale-20x20:</p>
<ul>
<li>shard-dg2:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19375/shard-dg2-3/igt@kms_plane_scaling@planes-upscale-20x20.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_168435v4/shard-dg2-7/igt@kms_plane_scaling@planes-upscale-20x20.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15329">i915#15329</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17356">i915#17356</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6953">i915#6953</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9423">i915#9423</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pm_backlight@bad-brightness:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_168435v4/shard-tglu-8/igt@kms_pm_backlight@bad-brightness.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12343">i915#12343</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9812">i915#9812</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pm_backlight@fade:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_168435v4/shard-dg2-8/igt@kms_pm_backlight@fade.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12343">i915#12343</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5354">i915#5354</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pm_backlight@fade-with-suspend:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_168435v4/shard-dg1-16/igt@kms_pm_backlight@fade-with-suspend.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12343">i915#12343</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5354">i915#5354</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pm_dc@dc5-psr-suspend-resume:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_168435v4/shard-dg2-8/igt@kms_pm_dc@dc5-psr-suspend-resume.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16914">i915#16914</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pm_lpsp@kms-lpsp:</p>
<ul>
<li>shard-tglu-1:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_168435v4/shard-tglu-1/igt@kms_pm_lpsp@kms-lpsp.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3828">i915#3828</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pm_lpsp@screens-disabled:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_168435v4/shard-tglu-7/igt@kms_pm_lpsp@screens-disabled.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8430">i915#8430</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pm_rpm@dpms-mode-unset-non-lpsp:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_168435v4/shard-rkl-8/igt@kms_pm_rpm@dpms-mode-unset-non-lpsp.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15073">i915#15073</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pm_rpm@dpms-non-lpsp:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_168435v4/shard-tglu-9/igt@kms_pm_rpm@dpms-non-lpsp.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15073">i915#15073</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pm_rpm@i2c:</p>
<ul>
<li>shard-dg2:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19375/shard-dg2-8/igt@kms_pm_rpm@i2c.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_168435v4/shard-dg2-7/igt@kms_pm_rpm@i2c.html">SKIP</a></li>
<li>shard-dg1:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19375/shard-dg1-18/igt@kms_pm_rpm@i2c.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_168435v4/shard-dg1-18/igt@kms_pm_rpm@i2c.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4423">i915#4423</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pm_rpm@modeset-lpsp-stress:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19375/shard-rkl-8/igt@kms_pm_rpm@modeset-lpsp-stress.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_168435v4/shard-rkl-7/igt@kms_pm_rpm@modeset-lpsp-stress.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15073">i915#15073</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_pm_rpm@modeset-non-lpsp:</p>
<ul>
<li>shard-dg2:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19375/shard-dg2-3/igt@kms_pm_rpm@modeset-non-lpsp.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_168435v4/shard-dg2-7/igt@kms_pm_rpm@modeset-non-lpsp.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15073">i915#15073</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_prime@basic-crc-hybrid:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_168435v4/shard-dg1-15/igt@kms_prime@basic-crc-hybrid.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6524">i915#6524</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_prime@basic-modeset-hybrid:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_168435v4/shard-rkl-8/igt@kms_prime@basic-modeset-hybrid.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6524">i915#6524</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@fbc-pr-overlay-plane-move-continuous-sf:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_168435v4/shard-mtlp-8/igt@kms_psr2_sf@fbc-pr-overlay-plane-move-continuous-sf.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12316">i915#12316</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@fbc-pr-overlay-plane-update-continuous-sf:</p>
<ul>
<li>shard-glk11:        NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_168435v4/shard-glk11/igt@kms_psr2_sf@fbc-pr-overlay-plane-update-continuous-sf.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11520">i915#11520</a>) +6 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@fbc-pr-plane-move-sf-dmg-area:</p>
<ul>
<li>shard-glk:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_168435v4/shard-glk2/igt@kms_psr2_sf@fbc-pr-plane-move-sf-dmg-area.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11520">i915#11520</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@fbc-pr-primary-plane-update-sf-dmg-area:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_168435v4/shard-rkl-2/igt@kms_psr2_sf@fbc-pr-primary-plane-update-sf-dmg-area.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11520">i915#11520</a>) +5 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@pr-cursor-plane-move-continuous-exceed-sf:</p>
<ul>
<li>shard-glk10:        NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_168435v4/shard-glk10/igt@kms_psr2_sf@pr-cursor-plane-move-continuous-exceed-sf.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11520">i915#11520</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@pr-overlay-plane-move-continuous-exceed-fully-sf:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_168435v4/shard-tglu-7/igt@kms_psr2_sf@pr-overlay-plane-move-continuous-exceed-fully-sf.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11520">i915#11520</a>) +5 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@pr-overlay-plane-move-continuous-exceed-sf:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_168435v4/shard-dg1-16/igt@kms_psr2_sf@pr-overlay-plane-move-continuous-exceed-sf.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11520">i915#11520</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@pr-primary-plane-update-sf-dmg-area-big-fb:</p>
<ul>
<li>shard-tglu-1:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_168435v4/shard-tglu-1/igt@kms_psr2_sf@pr-primary-plane-update-sf-dmg-area-big-fb.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11520">i915#11520</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@psr2-cursor-plane-move-continuous-exceed-fully-sf:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_168435v4/shard-dg2-8/igt@kms_psr2_sf@psr2-cursor-plane-move-continuous-exceed-fully-sf.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11520">i915#11520</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_su@frontbuffer-xrgb8888:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_168435v4/shard-rkl-8/igt@kms_psr2_su@frontbuffer-xrgb8888.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9683">i915#9683</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr@fbc-pr-sprite-render:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_168435v4/shard-dg1-16/igt@kms_psr@fbc-pr-sprite-render.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/1072">i915#1072</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9732">i915#9732</a>) +9 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr@fbc-psr-no-drrs:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_168435v4/shard-tglu-8/igt@kms_psr@fbc-psr-no-drrs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9732">i915#9732</a>) +14 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr@fbc-psr2-cursor-plane-onoff:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_168435v4/shard-mtlp-8/igt@kms_psr@fbc-psr2-cursor-plane-onoff.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9688">i915#9688</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr@fbc-psr2-primary-render:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_168435v4/shard-dg2-8/igt@kms_psr@fbc-psr2-primary-render.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/1072">i915#1072</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9732">i915#9732</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr@pr-cursor-plane-onoff:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_168435v4/shard-rkl-4/igt@kms_psr@pr-cursor-plane-onoff.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/1072">i915#1072</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9732">i915#9732</a>) +12 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr@psr-cursor-plane-move:</p>
<ul>
<li>shard-tglu-1:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_168435v4/shard-tglu-1/igt@kms_psr@psr-cursor-plane-move.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9732">i915#9732</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_rotation_crc@exhaust-fences:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_168435v4/shard-dg1-16/igt@kms_rotation_crc@exhaust-fences.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4884">i915#4884</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_rotation_crc@multiplane-rotation:</p>
<ul>
<li>shard-glk11:        NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_168435v4/shard-glk11/igt@kms_rotation_crc@multiplane-rotation.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15492">i915#15492</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16184">i915#16184</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_rotation_crc@primary-4-tiled-reflect-x-0:</p>
<ul>
<li>shard-tglu-1:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_168435v4/shard-tglu-1/igt@kms_rotation_crc@primary-4-tiled-reflect-x-0.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5289">i915#5289</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_rotation_crc@primary-yf-tiled-reflect-x-180:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_168435v4/shard-rkl-2/igt@kms_rotation_crc@primary-yf-tiled-reflect-x-180.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5289">i915#5289</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_scaling_modes@scaling-mode-center:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_168435v4/shard-dg2-4/igt@kms_scaling_modes@scaling-mode-center.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3555">i915#3555</a>)</li>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_168435v4/shard-tglu-8/igt@kms_scaling_modes@scaling-mode-center.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3555">i915#3555</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_setmode@basic-clone-single-crtc:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_168435v4/shard-dg1-16/igt@kms_setmode@basic-clone-single-crtc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3555">i915#3555</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_tiled_display@basic-test-pattern:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_168435v4/shard-rkl-4/igt@kms_tiled_display@basic-test-pattern.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8623">i915#8623</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_vrr@flip-basic:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_168435v4/shard-rkl-8/igt@kms_vrr@flip-basic.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15243">i915#15243</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3555">i915#3555</a>)</li>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_168435v4/shard-mtlp-8/igt@kms_vrr@flip-basic.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3555">i915#3555</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8808">i915#8808</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_vrr@flip-basic-fastset:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_168435v4/shard-rkl-4/igt@kms_vrr@flip-basic-fastset.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9906">i915#9906</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_vrr@lobf:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_168435v4/shard-dg1-16/igt@kms_vrr@lobf.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11920">i915#11920</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_vrr@max-min:</p>
<ul>
<li>shard-tglu-1:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_168435v4/shard-tglu-1/igt@kms_vrr@max-min.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9906">i915#9906</a>)</li>
</ul>
</li>
<li>
<p>igt@perf_pmu@busy-double-start@vecs0:</p>
<ul>
<li>shard-mtlp:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19375/shard-mtlp-8/igt@perf_pmu@busy-double-start@vecs0.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_168435v4/shard-mtlp-4/igt@perf_pmu@busy-double-start@vecs0.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4349">i915#4349</a>)</li>
</ul>
</li>
<li>
<p>igt@perf_pmu@busy-start@bcs0:</p>
<ul>
<li>shard-snb:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19375/shard-snb4/igt@perf_pmu@busy-start@bcs0.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_168435v4/shard-snb6/igt@perf_pmu@busy-start@bcs0.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17084">i915#17084</a>) +2 other tests fail</li>
</ul>
</li>
<li>
<p>igt@perf_pmu@rc6-suspend:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_168435v4/shard-mtlp-8/igt@perf_pmu@rc6-suspend.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13520">i915#13520</a>)</li>
</ul>
</li>
<li>
<p>igt@perf_pmu@rc6@other-idle-gt0:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_168435v4/shard-rkl-2/igt@perf_pmu@rc6@other-idle-gt0.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8516">i915#8516</a>)</li>
</ul>
</li>
<li>
<p>igt@prime_udl@share-import:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_168435v4/shard-rkl-4/igt@prime_udl@share-import.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16420">i915#16420</a>)</li>
</ul>
</li>
<li>
<p>igt@prime_vgem@basic-fence-read:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_168435v4/shard-rkl-2/igt@prime_vgem@basic-fence-read.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3291">i915#3291</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3708">i915#3708</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@prime_vgem@basic-gtt:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_168435v4/shard-dg2-4/igt@prime_vgem@basic-gtt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3708">i915#3708</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4077">i915#4077</a>)</li>
</ul>
</li>
<li>
<p>igt@prime_vgem@basic-write:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_168435v4/shard-mtlp-8/igt@prime_vgem@basic-write.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/10216">i915#10216</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3708">i915#3708</a>)</li>
</ul>
</li>
</ul>
<h4>Possible fixes</h4>
<ul>
<li>
<p>igt@drm_read@short-buffer-wakeup:</p>
<ul>
<li>shard-dg2:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19375/shard-dg2-7/igt@drm_read@short-buffer-wakeup.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17359">i915#17359</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_168435v4/shard-dg2-8/igt@drm_read@short-buffer-wakeup.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@gem_ccs@suspend-resume:</p>
<ul>
<li>shard-dg2:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19375/shard-dg2-7/igt@gem_ccs@suspend-resume.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13356">i915#13356</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16348">i915#16348</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_168435v4/shard-dg2-8/igt@gem_ccs@suspend-resume.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@gem_eio@in-flight-suspend:</p>
<ul>
<li>shard-dg2:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19375/shard-dg2-5/igt@gem_eio@in-flight-suspend.html">ABORT</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_168435v4/shard-dg2-4/igt@gem_eio@in-flight-suspend.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@i915_pm_rpm@system-suspend-execbuf:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19375/shard-rkl-7/igt@i915_pm_rpm@system-suspend-execbuf.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13356">i915#13356</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_168435v4/shard-rkl-5/igt@i915_pm_rpm@system-suspend-execbuf.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@i915_suspend@fence-restore-untiled:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19375/shard-rkl-6/igt@i915_suspend@fence-restore-untiled.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4817">i915#4817</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_168435v4/shard-rkl-4/igt@i915_suspend@fence-restore-untiled.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@i915_suspend@sysfs-reader:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19375/shard-rkl-1/igt@i915_suspend@sysfs-reader.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15140">i915#15140</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_168435v4/shard-rkl-8/igt@i915_suspend@sysfs-reader.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-suspend-4-tiled-mtl-rc-ccs@pipe-c-edp-1:</p>
<ul>
<li>shard-mtlp:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19375/shard-mtlp-7/igt@kms_ccs@crc-primary-suspend-4-tiled-mtl-rc-ccs@pipe-c-edp-1.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17158">i915#17158</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_168435v4/shard-mtlp-8/igt@kms_ccs@crc-primary-suspend-4-tiled-mtl-rc-ccs@pipe-c-edp-1.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-suspend-4-tiled-mtl-rc-ccs@pipe-d-edp-1:</p>
<ul>
<li>shard-mtlp:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19375/shard-mtlp-7/igt@kms_ccs@crc-primary-suspend-4-tiled-mtl-rc-ccs@pipe-d-edp-1.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15582">i915#15582</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_168435v4/shard-mtlp-8/igt@kms_ccs@crc-primary-suspend-4-tiled-mtl-rc-ccs@pipe-d-edp-1.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@kms_color@legacy-gamma-reset:</p>
<ul>
<li>shard-dg2:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19375/shard-dg2-7/igt@kms_color@legacy-gamma-reset.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12655">i915#12655</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17373">i915#17373</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_168435v4/shard-dg2-1/igt@kms_color@legacy-gamma-reset.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-random-256x85:</p>
<ul>
<li>shard-dg1:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19375/shard-dg1-17/igt@kms_cursor_crc@cursor-random-256x85.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4423">i915#4423</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_168435v4/shard-dg1-18/igt@kms_cursor_crc@cursor-random-256x85.html">PASS</a> +4 other tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-random-64x21:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19375/shard-rkl-6/igt@kms_cursor_crc@cursor-random-64x21.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13566">i915#13566</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_168435v4/shard-rkl-4/igt@kms_cursor_crc@cursor-random-64x21.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-suspend:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19375/shard-rkl-3/igt@kms_cursor_crc@cursor-suspend.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12358">i915#12358</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14152">i915#14152</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_168435v4/shard-rkl-2/igt@kms_cursor_crc@cursor-suspend.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-expired-vblank-interruptible:</p>
<ul>
<li>shard-dg1:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19375/shard-dg1-14/igt@kms_flip@flip-vs-expired-vblank-interruptible.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13027">i915#13027</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_168435v4/shard-dg1-19/igt@kms_flip@flip-vs-expired-vblank-interruptible.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_flip@plain-flip-fb-recreate:</p>
<ul>
<li>shard-dg1:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19375/shard-dg1-12/igt@kms_flip@plain-flip-fb-recreate.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14600">i915#14600</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_168435v4/shard-dg1-14/igt@kms_flip@plain-flip-fb-recreate.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_flip@single-buffer-flip-vs-dpms-off-vs-modeset-interruptible:</p>
<ul>
<li>shard-dg2:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19375/shard-dg2-7/igt@kms_flip@single-buffer-flip-vs-dpms-off-vs-modeset-interruptible.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5354">i915#5354</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_168435v4/shard-dg2-1/igt@kms_flip@single-buffer-flip-vs-dpms-off-vs-modeset-interruptible.html">PASS</a> +4 other tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-32bpp-4tile-to-64bpp-4tile-upscaling:</p>
<ul>
<li>shard-dg2:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19375/shard-dg2-7/igt@kms_flip_scaled_crc@flip-32bpp-4tile-to-64bpp-4tile-upscaling.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3555">i915#3555</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8813">i915#8813</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_168435v4/shard-dg2-8/igt@kms_flip_scaled_crc@flip-32bpp-4tile-to-64bpp-4tile-upscaling.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-1p-offscreen-pri-indfb-draw-blt:</p>
<ul>
<li>shard-dg2:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19375/shard-dg2-7/igt@kms_frontbuffer_tracking@fbc-1p-offscreen-pri-indfb-draw-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16708">i915#16708</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_168435v4/shard-dg2-1/igt@kms_frontbuffer_tracking@fbc-1p-offscreen-pri-indfb-draw-blt.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-1p-primscrn-spr-indfb-draw-blt:</p>
<ul>
<li>shard-dg2:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19375/shard-dg2-7/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-spr-indfb-draw-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16708">i915#16708</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5354">i915#5354</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_168435v4/shard-dg2-1/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-spr-indfb-draw-blt.html">PASS</a> +2 other tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbchdr-rgb101010-draw-mmap-wc:</p>
<ul>
<li>shard-glk:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19375/shard-glk1/igt@kms_frontbuffer_tracking@fbchdr-rgb101010-draw-mmap-wc.html">SKIP</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_168435v4/shard-glk8/igt@kms_frontbuffer_tracking@fbchdr-rgb101010-draw-mmap-wc.html">PASS</a> +9 other tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@hdr-1p-primscrn-cur-indfb-move:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19375/shard-rkl-3/igt@kms_frontbuffer_tracking@hdr-1p-primscrn-cur-indfb-move.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15989">i915#15989</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_168435v4/shard-rkl-1/igt@kms_frontbuffer_tracking@hdr-1p-primscrn-cur-indfb-move.html">PASS</a> +2 other tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_invalid_mode@bad-htotal:</p>
<ul>
<li>shard-dg2:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19375/shard-dg2-7/igt@kms_invalid_mode@bad-htotal.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16746">i915#16746</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3555">i915#3555</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_168435v4/shard-dg2-4/igt@kms_invalid_mode@bad-htotal.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_plane@pixel-format-x-tiled-modifier-source-clamping:</p>
<ul>
<li>shard-dg2:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19375/shard-dg2-7/igt@kms_plane@pixel-format-x-tiled-modifier-source-clamping.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8825">i915#8825</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_168435v4/shard-dg2-1/igt@kms_plane@pixel-format-x-tiled-modifier-source-clamping.html">PASS</a> +3 other tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@planes-downscale-factor-0-5-unity-scaling:</p>
<ul>
<li>shard-dg2:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19375/shard-dg2-7/igt@kms_plane_scaling@planes-downscale-factor-0-5-unity-scaling.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15329">i915#15329</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17356">i915#17356</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9423">i915#9423</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_168435v4/shard-dg2-1/igt@kms_plane_scaling@planes-downscale-factor-0-5-unity-scaling.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@planes-upscale-20x20-downscale-factor-0-5:</p>
<ul>
<li>shard-dg2:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19375/shard-dg2-7/igt@kms_plane_scaling@planes-upscale-20x20-downscale-factor-0-5.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15329">i915#15329</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17356">i915#17356</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3555">i915#3555</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6953">i915#6953</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9423">i915#9423</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_168435v4/shard-dg2-1/igt@kms_plane_scaling@planes-upscale-20x20-downscale-factor-0-5.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@planes-upscale-20x20-downscale-factor-0-5@pipe-a:</p>
<ul>
<li>shard-dg2:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19375/shard-dg2-7/igt@kms_plane_scaling@planes-upscale-20x20-downscale-factor-0-5@pipe-a.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15329">i915#15329</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_168435v4/shard-dg2-1/igt@kms_plane_scaling@planes-upscale-20x20-downscale-factor-0-5@pipe-a.html">PASS</a> +5 other tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@planes-upscale-20x20-downscale-factor-0-5@pipe-d:</p>
<ul>
<li>shard-dg2:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19375/shard-dg2-7/igt@kms_plane_scaling@planes-upscale-20x20-downscale-factor-0-5@pipe-d.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15329">i915#15329</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17356">i915#17356</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_168435v4/shard-dg2-1/igt@kms_plane_scaling@planes-upscale-20x20-downscale-factor-0-5@pipe-d.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@kms_pm_rpm@dpms-lpsp:</p>
<ul>
<li>shard-dg1:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19375/shard-dg1-17/igt@kms_pm_rpm@dpms-lpsp.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15073">i915#15073</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_168435v4/shard-dg1-14/igt@kms_pm_rpm@dpms-lpsp.html">PASS</a> +2 other tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_pm_rpm@dpms-mode-unset-lpsp:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19375/shard-rkl-3/igt@kms_pm_rpm@dpms-mode-unset-lpsp.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15073">i915#15073</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_168435v4/shard-rkl-2/igt@kms_pm_rpm@dpms-mode-unset-lpsp.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_pm_rpm@system-suspend-idle:</p>
<ul>
<li>shard-dg2:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19375/shard-dg2-7/igt@kms_pm_rpm@system-suspend-idle.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9519">i915#9519</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_168435v4/shard-dg2-4/igt@kms_pm_rpm@system-suspend-idle.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_pm_rpm@system-suspend-modeset:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19375/shard-rkl-3/igt@kms_pm_rpm@system-suspend-modeset.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14419">i915#14419</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_168435v4/shard-rkl-2/igt@kms_pm_rpm@system-suspend-modeset.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_vblank@ts-continuation-modeset:</p>
<ul>
<li>shard-dg2:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19375/shard-dg2-7/igt@kms_vblank@ts-continuation-modeset.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17356">i915#17356</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_168435v4/shard-dg2-1/igt@kms_vblank@ts-continuation-modeset.html">PASS</a> +37 other tests pass</li>
</ul>
</li>
</ul>
<h4>Warnings</h4>
<ul>
<li>
<p>igt@api_intel_bb@blit-reloc-keep-cache:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19375/shard-rkl-6/igt@api_intel_bb@blit-reloc-keep-cache.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8411">i915#8411</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_168435v4/shard-rkl-4/igt@api_intel_bb@blit-reloc-keep-cache.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8411">i915#8411</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_bad_reloc@negative-reloc-lut:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19375/shard-rkl-1/igt@gem_bad_reloc@negative-reloc-lut.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3281">i915#3281</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_168435v4/shard-rkl-6/igt@gem_bad_reloc@negative-reloc-lut.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3281">i915#3281</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@gem_ccs@block-multicopy-inplace:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19375/shard-rkl-6/igt@gem_ccs@block-multicopy-inplace.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3555">i915#3555</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9323">i915#9323</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_168435v4/shard-rkl-4/igt@gem_ccs@block-multicopy-inplace.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3555">i915#3555</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9323">i915#9323</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_exec_balancer@parallel-balancer:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19375/shard-rkl-1/igt@gem_exec_balancer@parallel-balancer.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4525">i915#4525</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_168435v4/shard-rkl-6/igt@gem_exec_balancer@parallel-balancer.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4525">i915#4525</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_exec_capture@capture-recoverable:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19375/shard-rkl-1/igt@gem_exec_capture@capture-recoverable.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6344">i915#6344</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_168435v4/shard-rkl-6/igt@gem_exec_capture@capture-recoverable.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6344">i915#6344</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_exec_reloc@basic-concurrent16:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19375/shard-rkl-6/igt@gem_exec_reloc@basic-concurrent16.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3281">i915#3281</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_168435v4/shard-rkl-4/igt@gem_exec_reloc@basic-concurrent16.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3281">i915#3281</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@gem_lmem_evict@dontneed-evict-race:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19375/shard-rkl-6/igt@gem_lmem_evict@dontneed-evict-race.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4613">i915#4613</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/7582">i915#7582</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_168435v4/shard-rkl-4/igt@gem_lmem_evict@dontneed-evict-race.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4613">i915#4613</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/7582">i915#7582</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_lmem_swapping@heavy-multi:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19375/shard-rkl-1/igt@gem_lmem_swapping@heavy-multi.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4613">i915#4613</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_168435v4/shard-rkl-6/igt@gem_lmem_swapping@heavy-multi.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4613">i915#4613</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@gem_pread@display:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19375/shard-rkl-6/igt@gem_pread@display.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3282">i915#3282</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_168435v4/shard-rkl-4/igt@gem_pread@display.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3282">i915#3282</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@gem_readwrite@beyond-eob:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19375/shard-rkl-1/igt@gem_readwrite@beyond-eob.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3282">i915#3282</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_168435v4/shard-rkl-6/igt@gem_readwrite@beyond-eob.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3282">i915#3282</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_userptr_blits@readonly-unsync:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19375/shard-rkl-4/igt@gem_userptr_blits@readonly-unsync.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3297">i915#3297</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_168435v4/shard-rkl-6/igt@gem_userptr_blits@readonly-unsync.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3297">i915#3297</a>)</li>
</ul>
</li>
<li>
<p>igt@gen9_exec_parse@bb-start-cmd:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19375/shard-rkl-1/igt@gen9_exec_parse@bb-start-cmd.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2527">i915#2527</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_168435v4/shard-rkl-6/igt@gen9_exec_parse@bb-start-cmd.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2527">i915#2527</a>)</li>
</ul>
</li>
<li>
<p>igt@gen9_exec_parse@bb-start-param:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19375/shard-rkl-6/igt@gen9_exec_parse@bb-start-param.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2527">i915#2527</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_168435v4/shard-rkl-4/igt@gen9_exec_parse@bb-start-param.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2527">i915#2527</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@i915_pm_rc6_residency@rc6-idle:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19375/shard-rkl-1/igt@i915_pm_rc6_residency@rc6-idle.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14498">i915#14498</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_168435v4/shard-rkl-6/igt@i915_pm_rc6_residency@rc6-idle.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14498">i915#14498</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a>)</li>
</ul>
</li>
<li>
<p>igt@i915_query@test-query-geometry-subslices:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19375/shard-rkl-6/igt@i915_query@test-query-geometry-subslices.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5723">i915#5723</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_168435v4/shard-rkl-4/igt@i915_query@test-query-geometry-subslices.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5723">i915#5723</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_atomic_transition@plane-all-modeset-transition-fencing-internal-panels:</p>
<ul>
<li>shard-dg2:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19375/shard-dg2-3/igt@kms_atomic_transition@plane-all-modeset-transition-fencing-internal-panels.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/1769">i915#1769</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3555">i915#3555</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_168435v4/shard-dg2-7/igt@kms_atomic_transition@plane-all-modeset-transition-fencing-internal-panels.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17356">i915#17356</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_atomic_transition@plane-all-modeset-transition-internal-panels:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19375/shard-rkl-6/igt@kms_atomic_transition@plane-all-modeset-transition-internal-panels.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/1769">i915#1769</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3555">i915#3555</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_168435v4/shard-rkl-4/igt@kms_atomic_transition@plane-all-modeset-transition-internal-panels.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/1769">i915#1769</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3555">i915#3555</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@4-tiled-16bpp-rotate-0:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19375/shard-rkl-1/igt@kms_big_fb@4-tiled-16bpp-rotate-0.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5286">i915#5286</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_168435v4/shard-rkl-6/igt@kms_big_fb@4-tiled-16bpp-rotate-0.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5286">i915#5286</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@4-tiled-16bpp-rotate-90:</p>
<ul>
<li>shard-dg2:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19375/shard-dg2-8/igt@kms_big_fb@4-tiled-16bpp-rotate-90.html">SKIP</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_168435v4/shard-dg2-7/igt@kms_big_fb@4-tiled-16bpp-rotate-90.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17356">i915#17356</a>) +5 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@4-tiled-64bpp-rotate-90:</p>
<ul>
<li>shard-dg2:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19375/shard-dg2-7/igt@kms_big_fb@4-tiled-64bpp-rotate-90.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17356">i915#17356</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_168435v4/shard-dg2-1/igt@kms_big_fb@4-tiled-64bpp-rotate-90.html">SKIP</a> +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@4-tiled-addfb-size-overflow:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19375/shard-rkl-6/igt@kms_big_fb@4-tiled-addfb-size-overflow.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5286">i915#5286</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_168435v4/shard-rkl-4/igt@kms_big_fb@4-tiled-addfb-size-overflow.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5286">i915#5286</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@linear-32bpp-rotate-90:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19375/shard-rkl-6/igt@kms_big_fb@linear-32bpp-rotate-90.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3638">i915#3638</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_168435v4/shard-rkl-4/igt@kms_big_fb@linear-32bpp-rotate-90.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3638">i915#3638</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@linear-max-hw-stride-64bpp-rotate-180-hflip:</p>
<ul>
<li>shard-dg2:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19375/shard-dg2-7/igt@kms_big_fb@linear-max-hw-stride-64bpp-rotate-180-hflip.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17356">i915#17356</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_168435v4/shard-dg2-8/igt@kms_big_fb@linear-max-hw-stride-64bpp-rotate-180-hflip.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3828">i915#3828</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@y-tiled-8bpp-rotate-90:</p>
<ul>
<li>shard-dg2:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19375/shard-dg2-3/igt@kms_big_fb@y-tiled-8bpp-rotate-90.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4538">i915#4538</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5190">i915#5190</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_168435v4/shard-dg2-7/igt@kms_big_fb@y-tiled-8bpp-rotate-90.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17356">i915#17356</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5190">i915#5190</a>) +5 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@y-tiled-addfb-size-overflow:</p>
<ul>
<li>shard-dg2:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19375/shard-dg2-8/igt@kms_big_fb@y-tiled-addfb-size-overflow.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5190">i915#5190</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_168435v4/shard-dg2-7/igt@kms_big_fb@y-tiled-addfb-size-overflow.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17356">i915#17356</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5190">i915#5190</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-0-async-flip:</p>
<ul>
<li>shard-dg2:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19375/shard-dg2-7/igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-0-async-flip.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17356">i915#17356</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5190">i915#5190</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_168435v4/shard-dg2-1/igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-0-async-flip.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4538">i915#4538</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5190">i915#5190</a>) +6 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@yf-tiled-16bpp-rotate-270:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19375/shard-rkl-1/igt@kms_big_fb@yf-tiled-16bpp-rotate-270.html">SKIP</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_168435v4/shard-rkl-6/igt@kms_big_fb@yf-tiled-16bpp-rotate-270.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a>) +34 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@yf-tiled-8bpp-rotate-90:</p>
<ul>
<li>shard-dg1:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19375/shard-dg1-17/igt@kms_big_fb@yf-tiled-8bpp-rotate-90.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4423">i915#4423</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4538">i915#4538</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_168435v4/shard-dg1-18/igt@kms_big_fb@yf-tiled-8bpp-rotate-90.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4538">i915#4538</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@bad-aux-stride-y-tiled-gen12-rc-ccs-cc:</p>
<ul>
<li>shard-dg2:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19375/shard-dg2-7/igt@kms_ccs@bad-aux-stride-y-tiled-gen12-rc-ccs-cc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17356">i915#17356</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_168435v4/shard-dg2-1/igt@kms_ccs@bad-aux-stride-y-tiled-gen12-rc-ccs-cc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/10307">i915#10307</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6095">i915#6095</a>) +7 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@bad-rotation-90-4-tiled-lnl-ccs:</p>
<ul>
<li>shard-dg2:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19375/shard-dg2-4/igt@kms_ccs@bad-rotation-90-4-tiled-lnl-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12313">i915#12313</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_168435v4/shard-dg2-7/igt@kms_ccs@bad-rotation-90-4-tiled-lnl-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17356">i915#17356</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@bad-rotation-90-4-tiled-mtl-rc-ccs@pipe-b-hdmi-a-2:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19375/shard-rkl-1/igt@kms_ccs@bad-rotation-90-4-tiled-mtl-rc-ccs@pipe-b-hdmi-a-2.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6095">i915#6095</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_168435v4/shard-rkl-6/igt@kms_ccs@bad-rotation-90-4-tiled-mtl-rc-ccs@pipe-b-hdmi-a-2.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6095">i915#6095</a>) +9 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-rotation-180-4-tiled-dg2-rc-ccs@pipe-c-hdmi-a-2:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19375/shard-rkl-1/igt@kms_ccs@crc-primary-rotation-180-4-tiled-dg2-rc-ccs@pipe-c-hdmi-a-2.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14098">i915#14098</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6095">i915#6095</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_168435v4/shard-rkl-6/igt@kms_ccs@crc-primary-rotation-180-4-tiled-dg2-rc-ccs@pipe-c-hdmi-a-2.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14098">i915#14098</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6095">i915#6095</a>) +9 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-rotation-180-4-tiled-mtl-rc-ccs@pipe-b-hdmi-a-2:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19375/shard-rkl-6/igt@kms_ccs@crc-primary-rotation-180-4-tiled-mtl-rc-ccs@pipe-b-hdmi-a-2.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6095">i915#6095</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_168435v4/shard-rkl-4/igt@kms_ccs@crc-primary-rotation-180-4-tiled-mtl-rc-ccs@pipe-b-hdmi-a-2.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6095">i915#6095</a>) +6 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-rotation-180-y-tiled-gen12-mc-ccs@pipe-a-hdmi-a-4:</p>
<ul>
<li>shard-dg1:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19375/shard-dg1-17/igt@kms_ccs@crc-primary-rotation-180-y-tiled-gen12-mc-ccs@pipe-a-hdmi-a-4.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4423">i915#4423</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6095">i915#6095</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_168435v4/shard-dg1-18/igt@kms_ccs@crc-primary-rotation-180-y-tiled-gen12-mc-ccs@pipe-a-hdmi-a-4.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6095">i915#6095</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-suspend-4-tiled-bmg-ccs:</p>
<ul>
<li>shard-dg2:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19375/shard-dg2-7/igt@kms_ccs@crc-primary-suspend-4-tiled-bmg-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17356">i915#17356</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_168435v4/shard-dg2-4/igt@kms_ccs@crc-primary-suspend-4-tiled-bmg-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12805">i915#12805</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-suspend-4-tiled-dg2-rc-ccs@pipe-c-hdmi-a-2:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19375/shard-rkl-6/igt@kms_ccs@crc-primary-suspend-4-tiled-dg2-rc-ccs@pipe-c-hdmi-a-2.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14098">i915#14098</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6095">i915#6095</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_168435v4/shard-rkl-4/igt@kms_ccs@crc-primary-suspend-4-tiled-dg2-rc-ccs@pipe-c-hdmi-a-2.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14098">i915#14098</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6095">i915#6095</a>) +7 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-suspend-y-tiled-gen12-rc-ccs:</p>
<ul>
<li>shard-dg2:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19375/shard-dg2-7/igt@kms_ccs@crc-primary-suspend-y-tiled-gen12-rc-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17356">i915#17356</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_168435v4/shard-dg2-1/igt@kms_ccs@crc-primary-suspend-y-tiled-gen12-rc-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6095">i915#6095</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-sprite-planes-basic-4-tiled-mtl-rc-ccs-cc:</p>
<ul>
<li>shard-dg2:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19375/shard-dg2-3/igt@kms_ccs@crc-sprite-planes-basic-4-tiled-mtl-rc-ccs-cc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/10307">i915#10307</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6095">i915#6095</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_168435v4/shard-dg2-7/igt@kms_ccs@crc-sprite-planes-basic-4-tiled-mtl-rc-ccs-cc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17356">i915#17356</a>) +11 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@random-ccs-data-4-tiled-bmg-ccs:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19375/shard-rkl-1/igt@kms_ccs@random-ccs-data-4-tiled-bmg-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12313">i915#12313</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_168435v4/shard-rkl-6/igt@kms_ccs@random-ccs-data-4-tiled-bmg-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12313">i915#12313</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cdclk@mode-transition:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19375/shard-rkl-6/igt@kms_cdclk@mode-transition.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3742">i915#3742</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_168435v4/shard-rkl-4/igt@kms_cdclk@mode-transition.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3742">i915#3742</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_color_pipeline@plane-ctm3x4:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19375/shard-rkl-1/igt@kms_chamelium_color_pipeline@plane-ctm3x4.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16471">i915#16471</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_168435v4/shard-rkl-6/igt@kms_chamelium_color_pipeline@plane-ctm3x4.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16471">i915#16471</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_color_pipeline@plane-lut1d-ctm3x4:</p>
<ul>
<li>shard-dg1:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19375/shard-dg1-17/igt@kms_chamelium_color_pipeline@plane-lut1d-ctm3x4.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16471">i915#16471</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4423">i915#4423</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_168435v4/shard-dg1-18/igt@kms_chamelium_color_pipeline@plane-lut1d-ctm3x4.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16471">i915#16471</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_color_pipeline@plane-lut1d-ctm3x4-lut1d:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19375/shard-rkl-6/igt@kms_chamelium_color_pipeline@plane-lut1d-ctm3x4-lut1d.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16471">i915#16471</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_168435v4/shard-rkl-4/igt@kms_chamelium_color_pipeline@plane-lut1d-ctm3x4-lut1d.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16471">i915#16471</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_edid@vga-edid-read:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19375/shard-rkl-6/igt@kms_chamelium_edid@vga-edid-read.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11151">i915#11151</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/7828">i915#7828</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_168435v4/shard-rkl-4/igt@kms_chamelium_edid@vga-edid-read.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11151">i915#11151</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/7828">i915#7828</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_hpd@hdmi-hpd-after-suspend:</p>
<ul>
<li>shard-dg1:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19375/shard-dg1-12/igt@kms_chamelium_hpd@hdmi-hpd-after-suspend.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11151">i915#11151</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4423">i915#4423</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/7828">i915#7828</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_168435v4/shard-dg1-14/igt@kms_chamelium_hpd@hdmi-hpd-after-suspend.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11151">i915#11151</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/7828">i915#7828</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_hpd@vga-hpd-fast:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19375/shard-rkl-1/igt@kms_chamelium_hpd@vga-hpd-fast.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11151">i915#11151</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/7828">i915#7828</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_168435v4/shard-rkl-6/igt@kms_chamelium_hpd@vga-hpd-fast.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11151">i915#11151</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/7828">i915#7828</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@content-type-change:</p>
<ul>
<li>shard-dg2:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19375/shard-dg2-7/igt@kms_content_protection@content-type-change.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17356">i915#17356</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_168435v4/shard-dg2-1/igt@kms_content_protection@content-type-change.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15865">i915#15865</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@dp-mst-lic-type-0:</p>
<ul>
<li>shard-dg2:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19375/shard-dg2-7/igt@kms_content_protection@dp-mst-lic-type-0.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17356">i915#17356</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_168435v4/shard-dg2-3/igt@kms_content_protection@dp-mst-lic-type-0.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15330">i915#15330</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3299">i915#3299</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@dp-mst-type-0:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19375/shard-rkl-6/igt@kms_content_protection@dp-mst-type-0.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15330">i915#15330</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3116">i915#3116</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_168435v4/shard-rkl-4/igt@kms_content_protection@dp-mst-type-0.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15330">i915#15330</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3116">i915#3116</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@dp-mst-type-0-suspend-resume:</p>
<ul>
<li>shard-dg2:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19375/shard-dg2-4/igt@kms_content_protection@dp-mst-type-0-suspend-resume.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15330">i915#15330</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_168435v4/shard-dg2-7/igt@kms_content_protection@dp-mst-type-0-suspend-resume.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17356">i915#17356</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@legacy-hdcp14:</p>
<ul>
<li>shard-dg2:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19375/shard-dg2-8/igt@kms_content_protection@legacy-hdcp14.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15865">i915#15865</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_168435v4/shard-dg2-7/igt@kms_content_protection@legacy-hdcp14.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17356">i915#17356</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@mei-interface:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19375/shard-rkl-1/igt@kms_content_protection@mei-interface.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15865">i915#15865</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_168435v4/shard-rkl-6/igt@kms_content_protection@mei-interface.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15865">i915#15865</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-rapid-movement-32x10:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19375/shard-rkl-6/igt@kms_cursor_crc@cursor-rapid-movement-32x10.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3555">i915#3555</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_168435v4/shard-rkl-4/igt@kms_cursor_crc@cursor-rapid-movement-32x10.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3555">i915#3555</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-rapid-movement-32x32:</p>
<ul>
<li>shard-dg2:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19375/shard-dg2-8/igt@kms_cursor_crc@cursor-rapid-movement-32x32.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3555">i915#3555</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_168435v4/shard-dg2-7/igt@kms_cursor_crc@cursor-rapid-movement-32x32.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17356">i915#17356</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-sliding-32x10:</p>
<ul>
<li>shard-dg2:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19375/shard-dg2-7/igt@kms_cursor_crc@cursor-sliding-32x10.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17356">i915#17356</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_168435v4/shard-dg2-8/igt@kms_cursor_crc@cursor-sliding-32x10.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3555">i915#3555</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-sliding-32x32:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19375/shard-rkl-1/igt@kms_cursor_crc@cursor-sliding-32x32.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3555">i915#3555</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_168435v4/shard-rkl-6/igt@kms_cursor_crc@cursor-sliding-32x32.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3555">i915#3555</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-sliding-512x170:</p>
<ul>
<li>shard-dg2:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19375/shard-dg2-8/igt@kms_cursor_crc@cursor-sliding-512x170.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13049">i915#13049</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_168435v4/shard-dg2-7/igt@kms_cursor_crc@cursor-sliding-512x170.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17356">i915#17356</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-sliding-512x512:</p>
<ul>
<li>shard-dg2:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19375/shard-dg2-7/igt@kms_cursor_crc@cursor-sliding-512x512.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17356">i915#17356</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_168435v4/shard-dg2-1/igt@kms_cursor_crc@cursor-sliding-512x512.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13049">i915#13049</a>)</li>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19375/shard-rkl-6/igt@kms_cursor_crc@cursor-sliding-512x512.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13049">i915#13049</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_168435v4/shard-rkl-4/igt@kms_cursor_crc@cursor-sliding-512x512.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13049">i915#13049</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-suspend:</p>
<ul>
<li>shard-dg2:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19375/shard-dg2-7/igt@kms_cursor_crc@cursor-suspend.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17356">i915#17356</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_168435v4/shard-dg2-3/igt@kms_cursor_crc@cursor-suspend.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12358">i915#12358</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13356">i915#13356</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14152">i915#14152</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/7882">i915#7882</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@basic-busy-flip-before-cursor-legacy:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19375/shard-rkl-6/igt@kms_cursor_legacy@basic-busy-flip-before-cursor-legacy.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4103">i915#4103</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_168435v4/shard-rkl-4/igt@kms_cursor_legacy@basic-busy-flip-before-cursor-legacy.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4103">i915#4103</a>)</li>
<li>shard-dg2:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19375/shard-dg2-7/igt@kms_cursor_legacy@basic-busy-flip-before-cursor-legacy.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11190">i915#11190</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17356">i915#17356</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_168435v4/shard-dg2-1/igt@kms_cursor_legacy@basic-busy-flip-before-cursor-legacy.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4103">i915#4103</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@cursorb-vs-flipa-atomic-transitions-varying-size:</p>
<ul>
<li>shard-dg2:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19375/shard-dg2-7/igt@kms_cursor_legacy@cursorb-vs-flipa-atomic-transitions-varying-size.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17356">i915#17356</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_168435v4/shard-dg2-4/igt@kms_cursor_legacy@cursorb-vs-flipa-atomic-transitions-varying-size.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13046">i915#13046</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5354">i915#5354</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@cursorb-vs-flipa-legacy:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19375/shard-rkl-6/igt@kms_cursor_legacy@cursorb-vs-flipa-legacy.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_168435v4/shard-rkl-4/igt@kms_cursor_legacy@cursorb-vs-flipa-legacy.html">SKIP</a> +31 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@cursorb-vs-flipb-legacy:</p>
<ul>
<li>shard-dg2:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19375/shard-dg2-8/igt@kms_cursor_legacy@cursorb-vs-flipb-legacy.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13046">i915#13046</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5354">i915#5354</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_168435v4/shard-dg2-7/igt@kms_cursor_legacy@cursorb-vs-flipb-legacy.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17356">i915#17356</a>) +5 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@short-busy-flip-before-cursor-atomic-transitions-varying-size:</p>
<ul>
<li>shard-dg2:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19375/shard-dg2-7/igt@kms_cursor_legacy@short-busy-flip-before-cursor-atomic-transitions-varying-size.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17356">i915#17356</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_168435v4/shard-dg2-1/igt@kms_cursor_legacy@short-busy-flip-before-cursor-atomic-transitions-varying-size.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4103">i915#4103</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@short-busy-flip-before-cursor-toggle:</p>
<ul>
<li>shard-dg2:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19375/shard-dg2-8/igt@kms_cursor_legacy@short-busy-flip-before-cursor-toggle.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4103">i915#4103</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_168435v4/shard-dg2-7/igt@kms_cursor_legacy@short-busy-flip-before-cursor-toggle.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17356">i915#17356</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_display_modes@extended-mode-basic:</p>
<ul>
<li>shard-dg2:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19375/shard-dg2-4/igt@kms_display_modes@extended-mode-basic.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13691">i915#13691</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_168435v4/shard-dg2-7/igt@kms_display_modes@extended-mode-basic.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17356">i915#17356</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_dp_link_training@non-uhbr-mst-tbtalt-train:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19375/shard-rkl-6/igt@kms_dp_link_training@non-uhbr-mst-tbtalt-train.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17291">i915#17291</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_168435v4/shard-rkl-4/igt@kms_dp_link_training@non-uhbr-mst-tbtalt-train.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17291">i915#17291</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_dp_link_training@uhbr-mst-tbtalt-train:</p>
<ul>
<li>shard-dg2:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19375/shard-dg2-8/igt@kms_dp_link_training@uhbr-mst-tbtalt-train.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17285">i915#17285</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_168435v4/shard-dg2-7/igt@kms_dp_link_training@uhbr-mst-tbtalt-train.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17356">i915#17356</a>) +1 other test skip</li>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19375/shard-rkl-4/igt@kms_dp_link_training@uhbr-mst-tbtalt-train.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17285">i915#17285</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_168435v4/shard-rkl-6/igt@kms_dp_link_training@uhbr-mst-tbtalt-train.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17285">i915#17285</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_dp_link_training@uhbr-sst:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19375/shard-rkl-6/igt@kms_dp_link_training@uhbr-sst.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13748">i915#13748</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_168435v4/shard-rkl-4/igt@kms_dp_link_training@uhbr-sst.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13748">i915#13748</a>)</li>
<li>shard-dg2:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19375/shard-dg2-7/igt@kms_dp_link_training@uhbr-sst.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17356">i915#17356</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_168435v4/shard-dg2-1/igt@kms_dp_link_training@uhbr-sst.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13748">i915#13748</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_dp_linktrain_fallback@uhbr-to-hbr-fallback:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19375/shard-rkl-1/igt@kms_dp_linktrain_fallback@uhbr-to-hbr-fallback.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16867">i915#16867</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_168435v4/shard-rkl-6/igt@kms_dp_linktrain_fallback@uhbr-to-hbr-fallback.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16867">i915#16867</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_dsc@dsc-fractional-bpp:</p>
<ul>
<li>shard-dg2:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19375/shard-dg2-3/igt@kms_dsc@dsc-fractional-bpp.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16361">i915#16361</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_168435v4/shard-dg2-7/igt@kms_dsc@dsc-fractional-bpp.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17356">i915#17356</a>) +5 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_dsc@dsc-with-output-formats-bigjoiner:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19375/shard-rkl-6/igt@kms_dsc@dsc-with-output-formats-bigjoiner.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16361">i915#16361</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_168435v4/shard-rkl-4/igt@kms_dsc@dsc-with-output-formats-bigjoiner.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16361">i915#16361</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_dsc@dsc-with-output-formats-with-bpc:</p>
<ul>
<li>shard-dg2:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19375/shard-dg2-7/igt@kms_dsc@dsc-with-output-formats-with-bpc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17356">i915#17356</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_168435v4/shard-dg2-4/igt@kms_dsc@dsc-with-output-formats-with-bpc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16361">i915#16361</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_feature_discovery@dp-mst:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19375/shard-rkl-6/igt@kms_feature_discovery@dp-mst.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16599">i915#16599</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_168435v4/shard-rkl-4/igt@kms_feature_discovery@dp-mst.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16599">i915#16599</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_fence_pin_leak:</p>
<ul>
<li>shard-dg2:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19375/shard-dg2-4/igt@kms_fence_pin_leak.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4881">i915#4881</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_168435v4/shard-dg2-7/igt@kms_fence_pin_leak.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17356">i915#17356</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-panning-vs-hang:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19375/shard-rkl-1/igt@kms_flip@2x-flip-vs-panning-vs-hang.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9934">i915#9934</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_168435v4/shard-rkl-6/igt@kms_flip@2x-flip-vs-panning-vs-hang.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9934">i915#9934</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-32bpp-yftile-to-32bpp-yftileccs-upscaling:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19375/shard-rkl-6/igt@kms_flip_scaled_crc@flip-32bpp-yftile-to-32bpp-yftileccs-upscaling.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15643">i915#15643</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_168435v4/shard-rkl-4/igt@kms_flip_scaled_crc@flip-32bpp-yftile-to-32bpp-yftileccs-upscaling.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15643">i915#15643</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-32bpp-yftileccs-to-64bpp-yftile-downscaling:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19375/shard-rkl-1/igt@kms_flip_scaled_crc@flip-32bpp-yftileccs-to-64bpp-yftile-downscaling.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15643">i915#15643</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_168435v4/shard-rkl-6/igt@kms_flip_scaled_crc@flip-32bpp-yftileccs-to-64bpp-yftile-downscaling.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15643">i915#15643</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-2p-primscrn-shrfb-plflip-blt:</p>
<ul>
<li>shard-dg1:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19375/shard-dg1-17/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-shrfb-plflip-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4423">i915#4423</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_168435v4/shard-dg1-18/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-shrfb-plflip-blt.html">SKIP</a> +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-tiling-4:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19375/shard-rkl-6/igt@kms_frontbuffer_tracking@fbc-tiling-4.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5439">i915#5439</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_168435v4/shard-rkl-4/igt@kms_frontbuffer_tracking@fbc-tiling-4.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5439">i915#5439</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbchdr-1p-rte:</p>
<ul>
<li>shard-dg2:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19375/shard-dg2-8/igt@kms_frontbuffer_tracking@fbchdr-1p-rte.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15989">i915#15989</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_168435v4/shard-dg2-7/igt@kms_frontbuffer_tracking@fbchdr-1p-rte.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16708">i915#16708</a>) +10 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-1p-offscreen-pri-indfb-draw-mmap-wc:</p>
<ul>
<li>shard-dg2:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19375/shard-dg2-7/igt@kms_frontbuffer_tracking@fbcpsr-1p-offscreen-pri-indfb-draw-mmap-wc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16708">i915#16708</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_168435v4/shard-dg2-1/igt@kms_frontbuffer_tracking@fbcpsr-1p-offscreen-pri-indfb-draw-mmap-wc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15104">i915#15104</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15990">i915#15990</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-pri-shrfb-draw-mmap-gtt:</p>
<ul>
<li>shard-dg2:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19375/shard-dg2-7/igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-pri-shrfb-draw-mmap-gtt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16708">i915#16708</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5354">i915#5354</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_168435v4/shard-dg2-4/igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-pri-shrfb-draw-mmap-gtt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15990">i915#15990</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8708">i915#8708</a>) +9 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-cur-indfb-draw-mmap-wc:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19375/shard-rkl-1/igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-cur-indfb-draw-mmap-wc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/1825">i915#1825</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_168435v4/shard-rkl-6/igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-cur-indfb-draw-mmap-wc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/1825">i915#1825</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-spr-indfb-draw-mmap-wc:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19375/shard-rkl-6/igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-spr-indfb-draw-mmap-wc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/1825">i915#1825</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_168435v4/shard-rkl-4/igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-spr-indfb-draw-mmap-wc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/1825">i915#1825</a>) +5 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-tiling-y:</p>
<ul>
<li>shard-dg2:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19375/shard-dg2-7/igt@kms_frontbuffer_tracking@fbcpsr-tiling-y.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16708">i915#16708</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5354">i915#5354</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_168435v4/shard-dg2-4/igt@kms_frontbuffer_tracking@fbcpsr-tiling-y.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/10055">i915#10055</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsrhdr-1p-rte:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19375/shard-rkl-4/igt@kms_frontbuffer_tracking@fbcpsrhdr-1p-rte.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15102">i915#15102</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_168435v4/shard-rkl-6/igt@kms_frontbuffer_tracking@fbcpsrhdr-1p-rte.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15102">i915#15102</a>) +11 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsrhdr-2p-shrfb-fliptrack-mmap-gtt:</p>
<ul>
<li>shard-dg2:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19375/shard-dg2-7/igt@kms_frontbuffer_tracking@fbcpsrhdr-2p-shrfb-fliptrack-mmap-gtt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16708">i915#16708</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_168435v4/shard-dg2-4/igt@kms_frontbuffer_tracking@fbcpsrhdr-2p-shrfb-fliptrack-mmap-gtt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15990">i915#15990</a>) +5 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsrhdr-rgb565-draw-blt:</p>
<ul>
<li>shard-dg1:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19375/shard-dg1-17/igt@kms_frontbuffer_tracking@fbcpsrhdr-rgb565-draw-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15102">i915#15102</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4423">i915#4423</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_168435v4/shard-dg1-18/igt@kms_frontbuffer_tracking@fbcpsrhdr-rgb565-draw-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15102">i915#15102</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@hdr-2p-pri-indfb-multidraw:</p>
<ul>
<li>shard-dg2:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19375/shard-dg2-8/igt@kms_frontbuffer_tracking@hdr-2p-pri-indfb-multidraw.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15991">i915#15991</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_168435v4/shard-dg2-7/igt@kms_frontbuffer_tracking@hdr-2p-pri-indfb-multidraw.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16708">i915#16708</a>) +33 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@hdr-rgb565-draw-mmap-gtt:</p>
<ul>
<li>shard-dg1:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19375/shard-dg1-17/igt@kms_frontbuffer_tracking@hdr-rgb565-draw-mmap-gtt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15990">i915#15990</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4423">i915#4423</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_168435v4/shard-dg1-18/igt@kms_frontbuffer_tracking@hdr-rgb565-draw-mmap-gtt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15990">i915#15990</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@hdr-shrfb-scaledprimary:</p>
<ul>
<li>shard-dg2:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19375/shard-dg2-7/igt@kms_frontbuffer_tracking@hdr-shrfb-scaledprimary.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16708">i915#16708</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_168435v4/shard-dg2-1/igt@kms_frontbuffer_tracking@hdr-shrfb-scaledprimary.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15989">i915#15989</a>) +8 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@hdr-suspend:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19375/shard-rkl-3/igt@kms_frontbuffer_tracking@hdr-suspend.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15989">i915#15989</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_168435v4/shard-rkl-1/igt@kms_frontbuffer_tracking@hdr-suspend.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15132">i915#15132</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-1p-primscrn-cur-indfb-move:</p>
<ul>
<li>shard-dg2:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19375/shard-dg2-7/igt@kms_frontbuffer_tracking@psr-1p-primscrn-cur-indfb-move.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16708">i915#16708</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5354">i915#5354</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_168435v4/shard-dg2-4/igt@kms_frontbuffer_tracking@psr-1p-primscrn-cur-indfb-move.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15102">i915#15102</a>) +9 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-1p-primscrn-indfb-plflip-blt:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19375/shard-rkl-6/igt@kms_frontbuffer_tracking@psr-1p-primscrn-indfb-plflip-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15102">i915#15102</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_168435v4/shard-rkl-4/igt@kms_frontbuffer_tracking@psr-1p-primscrn-indfb-plflip-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15102">i915#15102</a>) +18 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-2p-primscrn-pri-shrfb-draw-mmap-gtt:</p>
<ul>
<li>shard-dg2:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19375/shard-dg2-8/igt@kms_frontbuffer_tracking@psr-2p-primscrn-pri-shrfb-draw-mmap-gtt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15990">i915#15990</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8708">i915#8708</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_168435v4/shard-dg2-7/igt@kms_frontbuffer_tracking@psr-2p-primscrn-pri-shrfb-draw-mmap-gtt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16708">i915#16708</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5354">i915#5354</a>) +17 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-2p-primscrn-pri-shrfb-draw-render:</p>
<ul>
<li>shard-dg2:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19375/shard-dg2-7/igt@kms_frontbuffer_tracking@psr-2p-primscrn-pri-shrfb-draw-render.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16708">i915#16708</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5354">i915#5354</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_168435v4/shard-dg2-4/igt@kms_frontbuffer_tracking@psr-2p-primscrn-pri-shrfb-draw-render.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15991">i915#15991</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5354">i915#5354</a>) +13 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-2p-scndscrn-cur-indfb-move:</p>
<ul>
<li>shard-dg2:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19375/shard-dg2-3/igt@kms_frontbuffer_tracking@psr-2p-scndscrn-cur-indfb-move.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15991">i915#15991</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5354">i915#5354</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_168435v4/shard-dg2-7/igt@kms_frontbuffer_tracking@psr-2p-scndscrn-cur-indfb-move.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16708">i915#16708</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5354">i915#5354</a>) +26 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-rgb101010-draw-render:</p>
<ul>
<li>shard-dg2:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19375/shard-dg2-8/igt@kms_frontbuffer_tracking@psr-rgb101010-draw-render.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15102">i915#15102</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_168435v4/shard-dg2-7/igt@kms_frontbuffer_tracking@psr-rgb101010-draw-render.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16708">i915#16708</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5354">i915#5354</a>) +10 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psrhdr-1p-primscrn-pri-shrfb-draw-render:</p>
<ul>
<li>shard-dg2:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19375/shard-dg2-7/igt@kms_frontbuffer_tracking@psrhdr-1p-primscrn-pri-shrfb-draw-render.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16708">i915#16708</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_168435v4/shard-dg2-8/igt@kms_frontbuffer_tracking@psrhdr-1p-primscrn-pri-shrfb-draw-render.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15102">i915#15102</a>) +10 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psrhdr-2p-pri-indfb-multidraw:</p>
<ul>
<li>shard-dg2:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19375/shard-dg2-7/igt@kms_frontbuffer_tracking@psrhdr-2p-pri-indfb-multidraw.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16708">i915#16708</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_168435v4/shard-dg2-4/igt@kms_frontbuffer_tracking@psrhdr-2p-pri-indfb-multidraw.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15991">i915#15991</a>) +25 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psrhdr-2p-primscrn-pri-indfb-draw-mmap-gtt:</p>
<ul>
<li>shard-dg2:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19375/shard-dg2-8/igt@kms_frontbuffer_tracking@psrhdr-2p-primscrn-pri-indfb-draw-mmap-gtt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15990">i915#15990</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_168435v4/shard-dg2-7/igt@kms_frontbuffer_tracking@psrhdr-2p-primscrn-pri-indfb-draw-mmap-gtt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16708">i915#16708</a>) +25 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psrhdr-rgb101010-draw-pwrite:</p>
<ul>
<li>shard-dg2:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19375/shard-dg2-4/igt@kms_frontbuffer_tracking@psrhdr-rgb101010-draw-pwrite.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15102">i915#15102</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_168435v4/shard-dg2-7/igt@kms_frontbuffer_tracking@psrhdr-rgb101010-draw-pwrite.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16708">i915#16708</a>) +19 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_hdr@brightness-with-hdr:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19375/shard-rkl-6/igt@kms_hdr@brightness-with-hdr.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16644">i915#16644</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_168435v4/shard-rkl-4/igt@kms_hdr@brightness-with-hdr.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12713">i915#12713</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16644">i915#16644</a>)</li>
<li>shard-tglu:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19375/shard-tglu-2/igt@kms_hdr@brightness-with-hdr.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/1187">i915#1187</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12713">i915#12713</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_168435v4/shard-tglu-10/igt@kms_hdr@brightness-with-hdr.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12713">i915#12713</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_hdr@static-toggle:</p>
<ul>
<li>shard-dg2:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19375/shard-dg2-8/igt@kms_hdr@static-toggle.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16518">i915#16518</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3555">i915#3555</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8228">i915#8228</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_168435v4/shard-dg2-7/igt@kms_hdr@static-toggle.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17356">i915#17356</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_joiner@basic-big-joiner:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19375/shard-rkl-6/igt@kms_joiner@basic-big-joiner.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15460">i915#15460</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_168435v4/shard-rkl-4/igt@kms_joiner@basic-big-joiner.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15460">i915#15460</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_joiner@invalid-modeset-ultra-joiner:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19375/shard-rkl-6/igt@kms_joiner@invalid-modeset-ultra-joiner.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15458">i915#15458</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_168435v4/shard-rkl-4/igt@kms_joiner@invalid-modeset-ultra-joiner.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15458">i915#15458</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pipe_stress@stress-xrgb8888-yftiled:</p>
<ul>
<li>shard-dg2:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19375/shard-dg2-7/igt@kms_pipe_stress@stress-xrgb8888-yftiled.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17356">i915#17356</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_168435v4/shard-dg2-4/igt@kms_pipe_stress@stress-xrgb8888-yftiled.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14712">i915#14712</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane@pixel-format-4-tiled-dg2-mc-ccs-modifier:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19375/shard-rkl-6/igt@kms_plane@pixel-format-4-tiled-dg2-mc-ccs-modifier.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15709">i915#15709</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_168435v4/shard-rkl-4/igt@kms_plane@pixel-format-4-tiled-dg2-mc-ccs-modifier.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15709">i915#15709</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane@pixel-format-4-tiled-lnl-ccs-modifier-source-clamping:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19375/shard-rkl-1/igt@kms_plane@pixel-format-4-tiled-lnl-ccs-modifier-source-clamping.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15709">i915#15709</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_168435v4/shard-rkl-6/igt@kms_plane@pixel-format-4-tiled-lnl-ccs-modifier-source-clamping.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15709">i915#15709</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane_lowres@tiling-yf:</p>
<ul>
<li>shard-dg2:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19375/shard-dg2-8/igt@kms_plane_lowres@tiling-yf.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3555">i915#3555</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8821">i915#8821</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_168435v4/shard-dg2-7/igt@kms_plane_lowres@tiling-yf.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17356">i915#17356</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane_multiple@2x-tiling-x:</p>
<ul>
<li>shard-dg2:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19375/shard-dg2-7/igt@kms_plane_multiple@2x-tiling-x.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17356">i915#17356</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_168435v4/shard-dg2-1/igt@kms_plane_multiple@2x-tiling-x.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13958">i915#13958</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane_multiple@tiling-yf:</p>
<ul>
<li>shard-dg2:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19375/shard-dg2-4/igt@kms_plane_multiple@tiling-yf.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14259">i915#14259</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_168435v4/shard-dg2-7/igt@kms_plane_multiple@tiling-yf.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17356">i915#17356</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-scaler-unity-scaling-with-rotation@pipe-b:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19375/shard-rkl-4/igt@kms_plane_scaling@plane-scaler-unity-scaling-with-rotation@pipe-b.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15329">i915#15329</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_168435v4/shard-rkl-6/igt@kms_plane_scaling@plane-scaler-unity-scaling-with-rotation@pipe-b.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15329">i915#15329</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_pm_backlight@brightness-with-dpms:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19375/shard-rkl-1/igt@kms_pm_backlight@brightness-with-dpms.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12343">i915#12343</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_168435v4/shard-rkl-6/igt@kms_pm_backlight@brightness-with-dpms.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12343">i915#12343</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pm_dc@dc5-pageflip-negative:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19375/shard-rkl-6/igt@kms_pm_dc@dc5-pageflip-negative.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9685">i915#9685</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_168435v4/shard-rkl-4/igt@kms_pm_dc@dc5-pageflip-negative.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9685">i915#9685</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pm_dc@dc6-psr:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19375/shard-rkl-1/igt@kms_pm_dc@dc6-psr.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15948">i915#15948</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_168435v4/shard-rkl-6/igt@kms_pm_dc@dc6-psr.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15948">i915#15948</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pm_lpsp@kms-lpsp:</p>
<ul>
<li>shard-dg1:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19375/shard-dg1-12/igt@kms_pm_lpsp@kms-lpsp.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9340">i915#9340</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_168435v4/shard-dg1-14/igt@kms_pm_lpsp@kms-lpsp.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3828">i915#3828</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_prime@d3hot:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19375/shard-rkl-1/igt@kms_prime@d3hot.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6524">i915#6524</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_168435v4/shard-rkl-6/igt@kms_prime@d3hot.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6524">i915#6524</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@fbc-pr-cursor-plane-move-continuous-exceed-sf:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19375/shard-rkl-1/igt@kms_psr2_sf@fbc-pr-cursor-plane-move-continuous-exceed-sf.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11520">i915#11520</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_168435v4/shard-rkl-6/igt@kms_psr2_sf@fbc-pr-cursor-plane-move-continuous-exceed-sf.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11520">i915#11520</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@fbc-psr2-overlay-plane-move-continuous-exceed-sf:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19375/shard-rkl-6/igt@kms_psr2_sf@fbc-psr2-overlay-plane-move-continuous-exceed-sf.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11520">i915#11520</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_168435v4/shard-rkl-4/igt@kms_psr2_sf@fbc-psr2-overlay-plane-move-continuous-exceed-sf.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11520">i915#11520</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr@fbc-psr-cursor-blt:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19375/shard-rkl-6/igt@kms_psr@fbc-psr-cursor-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/1072">i915#1072</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9732">i915#9732</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_168435v4/shard-rkl-4/igt@kms_psr@fbc-psr-cursor-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/1072">i915#1072</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9732">i915#9732</a>) +6 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr@psr-cursor-plane-move:</p>
<ul>
<li>shard-dg1:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19375/shard-dg1-12/igt@kms_psr@psr-cursor-plane-move.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/1072">i915#1072</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4423">i915#4423</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9732">i915#9732</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_168435v4/shard-dg1-14/igt@kms_psr@psr-cursor-plane-move.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/1072">i915#1072</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9732">i915#9732</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr@psr2-sprite-mmap-cpu:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19375/shard-rkl-1/igt@kms_psr@psr2-sprite-mmap-cpu.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/1072">i915#1072</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9732">i915#9732</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_168435v4/shard-rkl-6/igt@kms_psr@psr2-sprite-mmap-cpu.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/1072">i915#1072</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9732">i915#9732</a>) +7 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_rotation_crc@exhaust-fences:</p>
<ul>
<li>shard-dg2:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19375/shard-dg2-7/igt@kms_rotation_crc@exhaust-fences.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17356">i915#17356</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_168435v4/shard-dg2-4/igt@kms_rotation_crc@exhaust-fences.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4235">i915#4235</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_rotation_crc@primary-y-tiled-reflect-x-180:</p>
<ul>
<li>shard-dg2:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19375/shard-dg2-7/igt@kms_rotation_crc@primary-y-tiled-reflect-x-180.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17356">i915#17356</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5190">i915#5190</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_168435v4/shard-dg2-4/igt@kms_rotation_crc@primary-y-tiled-reflect-x-180.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5190">i915#5190</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_rotation_crc@primary-y-tiled-reflect-x-90:</p>
<ul>
<li>shard-dg2:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19375/shard-dg2-7/igt@kms_rotation_crc@primary-y-tiled-reflect-x-90.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17356">i915#17356</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5190">i915#5190</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_168435v4/shard-dg2-1/igt@kms_rotation_crc@primary-y-tiled-reflect-x-90.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12755">i915#12755</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15867">i915#15867</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5190">i915#5190</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_rotation_crc@primary-yf-tiled-reflect-x-270:</p>
<ul>
<li>shard-dg2:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19375/shard-dg2-3/igt@kms_rotation_crc@primary-yf-tiled-reflect-x-270.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12755">i915#12755</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15867">i915#15867</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5190">i915#5190</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_168435v4/shard-dg2-7/igt@kms_rotation_crc@primary-yf-tiled-reflect-x-270.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17356">i915#17356</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5190">i915#5190</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_rotation_crc@sprite-rotation-270:</p>
<ul>
<li>shard-dg2:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19375/shard-dg2-7/igt@kms_rotation_crc@sprite-rotation-270.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17356">i915#17356</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_168435v4/shard-dg2-4/igt@kms_rotation_crc@sprite-rotation-270.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12755">i915#12755</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15867">i915#15867</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_tiled_display@basic-test-pattern-with-chamelium:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19375/shard-rkl-1/igt@kms_tiled_display@basic-test-pattern-with-chamelium.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8623">i915#8623</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_168435v4/shard-rkl-6/igt@kms_tiled_display@basic-test-pattern-with-chamelium.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8623">i915#8623</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_vrr@flip-dpms:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19375/shard-rkl-1/igt@kms_vrr@flip-dpms.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15243">i915#15243</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3555">i915#3555</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_168435v4/shard-rkl-6/igt@kms_vrr@flip-dpms.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15243">i915#15243</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3555">i915#3555</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_vrr@lobf:</p>
<ul>
<li>shard-dg2:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19375/shard-dg2-7/igt@kms_vrr@lobf.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17356">i915#17356</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_168435v4/shard-dg2-4/igt@kms_vrr@lobf.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11920">i915#11920</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_vrr@seamless-rr-switch-drrs:</p>
<ul>
<li>shard-dg2:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19375/shard-dg2-8/igt@kms_vrr@seamless-rr-switch-drrs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9906">i915#9906</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_168435v4/shard-dg2-7/igt@kms_vrr@seamless-rr-switch-drrs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17356">i915#17356</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_vrr@seamless-rr-switch-vrr:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19375/shard-rkl-8/igt@kms_vrr@seamless-rr-switch-vrr.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9906">i915#9906</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_168435v4/shard-rkl-6/igt@kms_vrr@seamless-rr-switch-vrr.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9906">i915#9906</a>)</li>
</ul>
</li>
<li>
<p>igt@prime_vgem@basic-read:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19375/shard-rkl-6/igt@prime_vgem@basic-read.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3291">i915#3291</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3708">i915#3708</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_168435v4/shard-rkl-4/igt@prime_vgem@basic-read.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3291">i915#3291</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3708">i915#3708</a>)</li>
</ul>
</li>
<li>
<p>igt@prime_vgem@fence-flip-hang:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19375/shard-rkl-6/igt@prime_vgem@fence-flip-hang.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3708">i915#3708</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_168435v4/shard-rkl-4/igt@prime_vgem@fence-flip-hang.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3708">i915#3708</a>)</li>
</ul>
</li>
<li>
<p>igt@prime_vgem@fence-write-hang:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19375/shard-rkl-1/igt@prime_vgem@fence-write-hang.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3708">i915#3708</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_168435v4/shard-rkl-6/igt@prime_vgem@fence-write-hang.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3708">i915#3708</a>)</li>
</ul>
</li>
</ul>
<h2>Build changes</h2>
<ul>
<li>Linux: CI_DRM_19375 -&gt; Patchwork_168435v4</li>
</ul>
<p>CI-20190529: 20190529<br />
  CI_DRM_19375: 0be91e56eb2afd32a5793865231161cfb3b12569 @ git://anongit.freedesktop.org/gfx-ci/linux<br />
  IGT_9156: 9156<br />
  Patchwork_168435v4: 0be91e56eb2afd32a5793865231161cfb3b12569 @ git://anongit.freedesktop.org/gfx-ci/linux<br />
  piglit_4509: fdc5a4ca11124ab8413c7988896eec4c97336694 @ git://anongit.freedesktop.org/piglit</p>

</body>
</html>

--===============6349502425141903180==--
