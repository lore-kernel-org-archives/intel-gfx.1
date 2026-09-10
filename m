Return-Path: <intel-gfx-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5946DC79FBF
	for <intel-gfx@archiver.kernel.org>; Thu, 10 Sep 2026 10:09:36 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C9DD310F430;
	Thu, 10 Sep 2026 10:09:35 +0000 (UTC)
Received: from coelho.fi (coelho.fi [88.99.146.29])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E577310F42C;
 Thu, 10 Sep 2026 10:09:33 +0000 (UTC)
Received: from 91-158-54-113.elisa-laajakaista.fi ([91.158.54.113]
 helo=[192.168.100.133])
 by coelho.fi with esmtpsa (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
 (Exim 4.98.2) (envelope-from <luca@coelho.fi>)
 id 1x4bil-00000003PfN-28ce; Thu, 10 Sep 2026 13:09:32 +0300
Message-ID: <597f17501418df59c7fdb2e2d45c85662be77334.camel@coelho.fi>
Subject: Re: =?UTF-8?Q?=E2=9C=97?= i915.CI.Full: failure for
 drm/i915/display: check configuration index before shifting
From: Luca Coelho <luca@coelho.fi>
To: I915-ci-infra@lists.freedesktop.org
Cc: intel-gfx@lists.freedesktop.org
Date: Thu, 10 Sep 2026 13:09:28 +0300
In-Reply-To: <178890444593.138035.18265467920080934935@61270ab9df2a>
References: <20260908100659.113555-1-luciano.coelho@intel.com>
 <178890444593.138035.18265467920080934935@61270ab9df2a>
Content-Type: multipart/alternative; boundary="=-UAfPUPpp5KjpsDBhkDAt"
User-Agent: Evolution 3.56.2-10 
MIME-Version: 1.0
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
Errors-To: intel-gfx-bounces@lists.freedesktop.org
Sender: "Intel-gfx" <intel-gfx-bounces@lists.freedesktop.org>

--=-UAfPUPpp5KjpsDBhkDAt
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi,

These regressions are not related to my patch:

The patch only adds a negative-index check before setting a bit in the
DP link-configuration filter. Valid configurations are unchanged, and
the new warning does not appear in the available logs.

The two reported regressions are:

1. =C2=A0gem_exec_parallel@userptr=C2=A0 on shard-dg1-14:
The rcs0, bcs0, vcs0 and vcs1 dynamic subtests passed, then output
stopped during vecs0. The additional incomplete result is the
corresponding vecs0 dynamic subtest. The runner and kernel log files
end abruptly with NUL padding, without a diagnostic establishing the
cause. This is a GEM userptr execution workload, unrelated to the
changed DP filtering code.
https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_173589v1/shard-dg1-14/ig=
t@gem_exec_parallel@userptr.html

2. =C2=A0kms_flip@flip-vs-wf_vblank-interruptible@c-hdmi-a4=C2=A0 on shard-=
dg1-
18:
This failed in =C2=A0calibrate_ts()=C2=A0 at the assertion =C2=A03 * stddev=
 / mean <
0.005=C2=A0, reporting 13.29% variation against a 0.5% limit. The display
snapshot shows HDMI-A-4 connected and all DP connectors disconnected.
The failure is in HDMI frame-timing calibration, outside the modified
DP path. This was also NOTRUN in the baseline, rather than a passing
instance becoming a failure.
https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_173589v1/shard-dg1-18/ig=
t@kms_flip@flip-vs-wf_vblank-interruptible@c-hdmi-a4.html

(Analysis assisted by Copilot)

Thanks,
Luca


On Tue, 2026-09-08 at 21:54 +0000, Patchwork wrote:
> Patch Details
>=20
> Series:drm/i915/display: check configuration index before shifting
>=20
> URL:https://patchwork.freedesktop.org/series/173589/
>=20
> State:failure
> Details:
> https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_173589v1/index.html
> CI Bug Log - changes from CI_DRM_19102_full -> Patchwork_173589v1_fullSum=
maryFAILURE
> Serious unknown changes coming with Patchwork_173589v1_full
> absolutely need to be
> verified manually.
> If you think the reported changes have nothing to do with the changes
> introduced in Patchwork_173589v1_full, please notify your bug team
> (I915-ci-infra@lists.freedesktop.org) to allow them
> to document this new failure mode, which will reduce false positives
> in CI.
> Participating hosts (10 -> 11)Additional (1): pig-kbl-iris=20
> Possible new issuesHere are the unknown changes that may have been introd=
uced in
> Patchwork_173589v1_full:
> IGT changesPossible regressions *=20
>    igt@gem_exec_parallel@userptr:shard-dg1: PASS [659] -> INCOMPLETE
>    [658] +1 other test incomplete
>  *=20
>    igt@kms_flip@flip-vs-wf_vblank-interruptible@c-hdmi-a4:shard-dg1:
>    NOTRUN -> FAIL [657]
> New testsNew tests have been introduced between CI_DRM_19102_full and
> Patchwork_173589v1_full:
> New IGT tests (3) *=20
>    igt@kms_cursor_crc@cursor-sliding-256x85@pipe-a-hdmi-a-3:Statuses :
>    1 pass(s)Exec time: [4.42] s
>  *=20
>    igt@kms_cursor_crc@cursor-sliding-256x85@pipe-c-hdmi-a-1:Statuses :
>    1 pass(s)Exec time: [4.12] s
>  *=20
>    igt@kms_cursor_crc@cursor-sliding-256x85@pipe-d-hdmi-a-3:Statuses :
>    1 pass(s)Exec time: [4.32] s
> Known issuesHere are the changes found in Patchwork_173589v1_full that co=
me from
> known issues:
> IGT changesIssues hit *=20
>    igt@api_intel_bb@crc32:shard-rkl: NOTRUN -> SKIP [656] (i915#6230
>    [655])
>  *=20
>    igt@api_intel_bb@object-reloc-keep-cache:shard-dg1: NOTRUN -> SKIP
>    [654] (i915#8411 [596])
>  *=20
>    igt@device_reset@unbind-cold-reset-rebind:shard-tglu: NOTRUN -> SKIP
>    [653] (i915#11078 [175])
>  *=20
>    igt@gem_basic@multigpu-create-close:shard-tglu-1: NOTRUN -> SKIP
>    [652] (i915#7697 [641])
>  *=20
>    igt@gem_busy@semaphore:shard-dg2: NOTRUN -> SKIP [651] (i915#3936
>    [650])
>  *=20
>    igt@gem_ccs@ctrl-surf-copy:shard-rkl: NOTRUN -> SKIP [649]
>    (i915#3555 [8] / i915#9323 [648])
>  *=20
>    igt@gem_ccs@large-ctrl-surf-copy:shard-tglu: NOTRUN -> SKIP [647]
>    (i915#13008 [646])
>  *=20
>    igt@gem_ccs@suspend-resume@linear-compressed-compfmt0-smem-
>    lmem0:shard-dg2: PASS [645] -> INCOMPLETE [644] (i915#13356 [230] /
>    i915#16348 [643])
>  *=20
>    igt@gem_close_race@multigpu-basic-threads:shard-dg1: NOTRUN -> SKIP
>    [642] (i915#7697 [641])
>  *=20
>    igt@gem_create@create-ext-set-pat:shard-rkl: NOTRUN -> SKIP [640]
>    (i915#8562 [639])
>  *=20
>    igt@gem_ctx_persistence@heartbeat-many:shard-dg2: NOTRUN -> SKIP
>    [638] (i915#8555 [637])
>  *=20
>    igt@gem_ctx_sseu@invalid-args:shard-rkl: NOTRUN -> SKIP [635]
>    (i915#280 [634]) +1 other test skipshard-tglu: NOTRUN -> SKIP [636]
>    (i915#280 [634])
>  *=20
>    igt@gem_exec_balancer@bonded-pair:shard-dg1: NOTRUN -> SKIP [633]
>    (i915#4771 [632])
>  *=20
>    igt@gem_exec_balancer@parallel-balancer:shard-tglu-1: NOTRUN -> SKIP
>    [631] (i915#4525 [629])
>  *=20
>    igt@gem_exec_balancer@parallel-ordering:shard-rkl: NOTRUN -> SKIP
>    [630] (i915#4525 [629])
>  *=20
>    igt@gem_exec_capture@capture-invisible@smem0:shard-tglu-1: NOTRUN ->
>    SKIP [628] (i915#6334 [627]) +1 other test skip
>  *=20
>    igt@gem_exec_flush@basic-uc-ro-default:shard-dg1: NOTRUN -> SKIP
>    [626] (i915#3539 [625] / i915#4852 [624])
>  *=20
>    igt@gem_exec_reloc@basic-write-cpu-noreloc:shard-dg2: NOTRUN -> SKIP
>    [623] (i915#3281 [160]) +1 other test skip
>  *=20
>    igt@gem_exec_reloc@basic-write-read:shard-rkl: NOTRUN -> SKIP [622]
>    (i915#3281 [160]) +5 other tests skip
>  *=20
>    igt@gem_exec_reloc@basic-write-read-active:shard-dg1: NOTRUN -> SKIP
>    [621] (i915#3281 [160]) +3 other tests skip
>  *=20
>    igt@gem_exec_schedule@preempt-queue:shard-dg1: NOTRUN -> SKIP [620]
>    (i915#4812 [619])
>  *=20
>    igt@gem_exec_suspend@basic-s0:shard-dg2: PASS [618] -> INCOMPLETE
>    [617] (i915#13356 [230]) +1 other test incomplete
>  *=20
>    igt@gem_huc_copy@huc-copy:shard-rkl: NOTRUN -> SKIP [616] (i915#2190
>    [615])
>  *=20
>    igt@gem_lmem_evict@dontneed-evict-race:shard-tglu: NOTRUN -> SKIP
>    [614] (i915#4613 [152] / i915#7582 [157])
>  *=20
>    igt@gem_lmem_swapping@massive:shard-rkl: NOTRUN -> SKIP [613]
>    (i915#4613 [152]) +1 other test skip
>  *=20
>    igt@gem_lmem_swapping@massive-random:shard-glk: NOTRUN -> SKIP [612]
>    (i915#4613 [152]) +1 other test skip
>  *=20
>    igt@gem_lmem_swapping@parallel-random-verify-ccs:shard-tglu: NOTRUN
>    -> SKIP [611] (i915#4613 [152]) +3 other tests skip
>  *=20
>    igt@gem_lmem_swapping@verify:shard-tglu-1: NOTRUN -> SKIP [610]
>    (i915#4613 [152]) +1 other test skip
>  *=20
>    igt@gem_mmap_gtt@cpuset-basic-small-copy-xy:shard-dg2: NOTRUN ->
>    SKIP [609] (i915#4077 [291]) +2 other tests skip
>  *=20
>    igt@gem_mmap_wc@invalid-flags:shard-dg1: NOTRUN -> SKIP [608]
>    (i915#4083 [606]) +1 other test skip
>  *=20
>    igt@gem_mmap_wc@write-prefaulted:shard-dg2: NOTRUN -> SKIP [607]
>    (i915#4083 [606]) +1 other test skip
>  *=20
>    igt@gem_partial_pwrite_pread@writes-after-reads-snoop:shard-dg2:
>    NOTRUN -> SKIP [605] (i915#3282 [149]) +2 other tests skip
>  *=20
>    igt@gem_pread@exhaustion:shard-tglu-1: NOTRUN -> WARN [604]
>    (i915#2658 [603])
>  *=20
>    igt@gem_pwrite_snooped:shard-dg1: NOTRUN -> SKIP [602] (i915#3282
>    [149])
>  *=20
>    igt@gem_pxp@create-regular-context-1:shard-dg1: NOTRUN -> SKIP [601]
>    (i915#4270 [600])
>  *=20
>    igt@gem_render_copy@y-tiled-ccs-to-y-tiled-ccs:shard-dg2: NOTRUN ->
>    SKIP [599] (i915#5190 [531] / i915#8428 [598]) +1 other test skip
>  *=20
>    igt@gem_set_tiling_vs_blt@untiled-to-tiled:shard-rkl: NOTRUN -> SKIP
>    [597] (i915#8411 [596])
>  *=20
>    igt@gem_set_tiling_vs_pwrite:shard-rkl: NOTRUN -> SKIP [595]
>    (i915#3282 [149]) +5 other tests skip
>  *=20
>    igt@gem_softpin@noreloc-s3:shard-glk: PASS [594] -> INCOMPLETE [593]
>    (i915#13809 [592] / i915#16193 [591])
>  *=20
>    igt@gem_userptr_blits@access-control:shard-dg2: NOTRUN -> SKIP [590]
>    (i915#3297 [146])
>  *=20
>    igt@gem_userptr_blits@coherency-sync:shard-tglu: NOTRUN -> SKIP
>    [589] (i915#3297 [146]) +1 other test skip
>  *=20
>    igt@gem_userptr_blits@coherency-unsync:shard-rkl: NOTRUN -> SKIP
>    [588] (i915#3297 [146])
>  *=20
>    igt@gem_userptr_blits@forbidden-operations:shard-rkl: NOTRUN -> SKIP
>    [587] (i915#3282 [149] / i915#3297 [146])
>  *=20
>    igt@gem_userptr_blits@map-fixed-invalidate-busy:shard-dg2: NOTRUN ->
>    SKIP [586] (i915#3297 [146] / i915#4880 [585])
>  *=20
>    igt@gem_userptr_blits@readonly-pwrite-unsync:shard-dg1: NOTRUN ->
>    SKIP [584] (i915#3297 [146])
>  *=20
>    igt@gem_userptr_blits@unsync-unmap-after-close:shard-tglu-1: NOTRUN
>    -> SKIP [583] (i915#3297 [146])
>  *=20
>    igt@gen9_exec_parse@basic-rejected-ctx-param:shard-rkl: NOTRUN ->
>    SKIP [582] (i915#2527 [141])
>  *=20
>    igt@gen9_exec_parse@bb-start-cmd:shard-tglu: NOTRUN -> SKIP [581]
>    (i915#2527 [141] / i915#2856 [578]) +1 other test skip
>  *=20
>    igt@gen9_exec_parse@unaligned-jump:shard-dg1: NOTRUN -> SKIP [580]
>    (i915#2527 [141]) +2 other tests skip
>  *=20
>    igt@gen9_exec_parse@valid-registers:shard-tglu-1: NOTRUN -> SKIP
>    [579] (i915#2527 [141] / i915#2856 [578]) +2 other tests skip
>  *=20
>    igt@gpu_buddy@gpu_buddy:shard-tglu-1: NOTRUN -> SKIP [577]
>    (i915#15678 [576])
>  *=20
>    igt@i915_drm_fdinfo@all-busy-idle-check-all:shard-dg2: NOTRUN ->
>    SKIP [575] (i915#14123 [574])
>  *=20
>    igt@i915_drm_fdinfo@virtual-busy-idle:shard-dg2: NOTRUN -> SKIP
>    [573] (i915#14118 [572])
>  *=20
>    igt@i915_module_load@reload:shard-dg1: NOTRUN -> DMESG-WARN [571]
>    (i915#14545 [570])
>  *=20
>    igt@i915_pm_freq_api@freq-reset:shard-tglu-1: NOTRUN -> SKIP [569]
>    (i915#8399 [135])
>  *=20
>    igt@i915_pm_freq_api@freq-reset-multiple:shard-tglu: NOTRUN -> SKIP
>    [568] (i915#8399 [135])
>  *=20
>    igt@i915_pm_rc6_residency@media-rc6-accuracy:shard-dg2: NOTRUN ->
>    SKIP [567] (i915#16080 [566] / i915#16166 [565])
>  *=20
>    igt@i915_pm_rps@min-max-config-idle:shard-dg1: NOTRUN -> SKIP [564]
>    (i915#11681 [561] / i915#6621 [563])
>  *=20
>    igt@i915_pm_rps@thresholds-park:shard-dg1: NOTRUN -> SKIP [562]
>    (i915#11681 [561])
>  *=20
>    igt@i915_query@query-topology-known-pci-ids:shard-tglu-1: NOTRUN ->
>    SKIP [560] (i915#16109 [559])
>  *=20
>    igt@i915_query@query-topology-unsupported:shard-tglu-1: NOTRUN ->
>    SKIP [558] (i915#16079 [557])
>  *=20
>    igt@i915_query@test-query-geometry-subslices:shard-rkl: NOTRUN ->
>    SKIP [556] (i915#5723 [555])
>  *=20
>    igt@kms_addfb_basic@clobberred-modifier:shard-dg1: NOTRUN -> SKIP
>    [554] (i915#4212 [553])
>  *=20
>    igt@kms_addfb_basic@invalid-smem-bo-on-discrete:shard-tglu: NOTRUN -
>    > SKIP [552] (i915#12454 [551] / i915#12712 [550])
>  *=20
>    igt@kms_async_flips@alternate-sync-async-flip-atomic@pipe-b-hdmi-a-
>    2:shard-glk: PASS [549] -> FAIL [548] (i915#14888 [221])
>  *=20
>    igt@kms_async_flips@async-flip-suspend-resume:shard-rkl: PASS [547]
>    -> INCOMPLETE [546] (i915#12761 [544])
>  *=20
>    igt@kms_async_flips@async-flip-suspend-resume@pipe-a-hdmi-a-2:shard-
>    rkl: NOTRUN -> INCOMPLETE [545] (i915#12761 [544])
>  *=20
>    igt@kms_atomic@plane-primary-overlay-mutable-zpos:shard-rkl: NOTRUN
>    -> SKIP [543] (i915#9531 [542])
>  *=20
>    igt@kms_big_fb@4-tiled-16bpp-rotate-0:shard-rkl: NOTRUN -> SKIP
>    [541] (i915#5286 [130]) +4 other tests skip
>  *=20
>    igt@kms_big_fb@4-tiled-max-hw-stride-32bpp-rotate-0-async-
>    flip:shard-tglu: NOTRUN -> SKIP [540] (i915#5286 [130]) +5 other
>    tests skip
>  *=20
>    igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-180-async-
>    flip:shard-tglu-1: NOTRUN -> SKIP [538] (i915#5286 [130]) +4 other
>    tests skipshard-dg1: NOTRUN -> SKIP [539] (i915#4538 [532] /
>    i915#5286 [130]) +3 other tests skip
>  *=20
>    igt@kms_big_fb@linear-16bpp-rotate-90:shard-rkl: NOTRUN -> SKIP
>    [537] (i915#3638 [125]) +3 other tests skip
>  *=20
>    igt@kms_big_fb@linear-max-hw-stride-32bpp-rotate-0-hflip:shard-rkl:
>    NOTRUN -> SKIP [536] (i915#3828 [36])
>  *=20
>    igt@kms_big_fb@y-tiled-8bpp-rotate-270:shard-dg1: NOTRUN -> SKIP
>    [535] (i915#3638 [125]) +3 other tests skip
>  *=20
>    igt@kms_big_fb@yf-tiled-16bpp-rotate-270:shard-dg1: NOTRUN -> SKIP
>    [534] (i915#4538 [532]) +2 other tests skip
>  *=20
>    igt@kms_big_fb@yf-tiled-8bpp-rotate-0:shard-dg2: NOTRUN -> SKIP
>    [533] (i915#4538 [532] / i915#5190 [531]) +3 other tests skip
>  *=20
>    igt@kms_ccs@bad-rotation-90-4-tiled-dg2-rc-ccs-cc@pipe-a-hdmi-a-
>    2:shard-rkl: NOTRUN -> SKIP [530] (i915#14544 [2] / i915#6095 [112])
>    +5 other tests skip
>  *=20
>    igt@kms_ccs@bad-rotation-90-4-tiled-dg2-rc-ccs-cc@pipe-c-hdmi-a-
>    2:shard-rkl: NOTRUN -> SKIP [529] (i915#14098 [113] / i915#14544 [2]
>    / i915#6095 [112]) +2 other tests skip
>  *=20
>    igt@kms_ccs@bad-rotation-90-4-tiled-lnl-ccs:shard-tglu-1: NOTRUN ->
>    SKIP [528] (i915#12313 [516])
>  *=20
>    igt@kms_ccs@crc-primary-basic-4-tiled-lnl-ccs:shard-dg1: NOTRUN ->
>    SKIP [527] (i915#12313 [516])
>  *=20
>    igt@kms_ccs@crc-primary-rotation-180-4-tiled-mtl-rc-ccs-cc@pipe-b-
>    hdmi-a-1:shard-tglu-1: NOTRUN -> SKIP [526] (i915#6095 [112]) +39
>    other tests skip
>  *=20
>    igt@kms_ccs@crc-primary-suspend-4-tiled-bmg-ccs:shard-tglu-1: NOTRUN
>    -> SKIP [525] (i915#12805 [523])
>  *=20
>    igt@kms_ccs@crc-primary-suspend-4-tiled-lnl-ccs:shard-tglu: NOTRUN -
>    > SKIP [524] (i915#12805 [523])
>  *=20
>    igt@kms_ccs@crc-primary-suspend-y-tiled-gen12-rc-ccs-cc@pipe-d-hdmi-
>    a-1:shard-dg2: NOTRUN -> SKIP [522] (i915#6095 [112]) +16 other
>    tests skip
>  *=20
>    igt@kms_ccs@crc-primary-suspend-yf-tiled-ccs:shard-glk: NOTRUN ->
>    INCOMPLETE [521] (i915#15582 [520]) +1 other test incomplete
>  *=20
>    igt@kms_ccs@crc-primary-suspend-yf-tiled-ccs@pipe-c-hdmi-a-2:shard-
>    rkl: NOTRUN -> SKIP [519] (i915#14098 [113] / i915#6095 [112]) +41
>    other tests skip
>  *=20
>    igt@kms_ccs@crc-sprite-planes-basic-4-tiled-bmg-ccs:shard-tglu:
>    NOTRUN -> SKIP [518] (i915#12313 [516]) +1 other test skip
>  *=20
>    igt@kms_ccs@crc-sprite-planes-basic-4-tiled-lnl-ccs:shard-rkl:
>    NOTRUN -> SKIP [517] (i915#12313 [516]) +3 other tests skip
>  *=20
>    igt@kms_ccs@crc-sprite-planes-basic-4-tiled-mtl-mc-ccs@pipe-a-hdmi-
>    a-3:shard-dg2: NOTRUN -> SKIP [515] (i915#10307 [512] / i915#6095
>    [112]) +61 other tests skip
>  *=20
>    igt@kms_ccs@missing-ccs-buffer-4-tiled-mtl-mc-ccs@pipe-d-hdmi-a-
>    1:shard-tglu: NOTRUN -> SKIP [514] (i915#6095 [112]) +49 other tests
>    skip
>  *=20
>    igt@kms_ccs@missing-ccs-buffer-y-tiled-ccs@pipe-d-hdmi-a-1:shard-
>    dg2: NOTRUN -> SKIP [513] (i915#10307 [512] / i915#10434 [511] /
>    i915#6095 [112]) +2 other tests skip
>  *=20
>    igt@kms_ccs@missing-ccs-buffer-yf-tiled-ccs@pipe-b-hdmi-a-1:shard-
>    dg1: NOTRUN -> SKIP [510] (i915#6095 [112]) +183 other tests skip
>  *=20
>    igt@kms_ccs@random-ccs-data-4-tiled-mtl-rc-ccs@pipe-b-hdmi-a-
>    2:shard-rkl: NOTRUN -> SKIP [509] (i915#6095 [112]) +55 other tests
>    skip
>  *=20
>    igt@kms_cdclk@mode-transition:shard-rkl: NOTRUN -> SKIP [508]
>    (i915#3742 [507])
>  *=20
>    igt@kms_cdclk@plane-scaling@pipe-d-hdmi-a-1:shard-dg2: NOTRUN ->
>    SKIP [506] (i915#13783 [505]) +3 other tests skip
>  *=20
>    igt@kms_chamelium_audio@dp-audio-after-suspend:shard-tglu-1: NOTRUN
>    -> SKIP [504] (i915#11151 [107])
>  *=20
>    igt@kms_chamelium_audio@dp-audio-edid:shard-dg2: NOTRUN -> SKIP
>    [503] (i915#11151 [107] / i915#7828 [106]) +1 other test skip
>  *=20
>    igt@kms_chamelium_audio@hdmi-audio-after-suspend:shard-rkl: NOTRUN -
>    > SKIP [502] (i915#11151 [107])
>  *=20
>    igt@kms_chamelium_color@ctm-green-to-red:shard-dg2: NOTRUN -> SKIP
>    [501] +2 other tests skip
>  *=20
>    igt@kms_chamelium_color_pipeline@plane-lut1d-ctm3x4:shard-tglu-1:
>    NOTRUN -> SKIP [500] (i915#16471 [496]) +1 other test skip
>  *=20
>    igt@kms_chamelium_color_pipeline@plane-lut1d-ctm3x4-lut1d:shard-dg1:
>    NOTRUN -> SKIP [499] (i915#16471 [496])
>  *=20
>    igt@kms_chamelium_color_pipeline@plane-lut1d-pre-ctm3x4:shard-rkl:
>    NOTRUN -> SKIP [497] (i915#16471 [496]) +1 other test skipshard-
>    tglu: NOTRUN -> SKIP [498] (i915#16471 [496])
>  *=20
>    igt@kms_chamelium_edid@dp-edid-change-during-suspend:shard-tglu-1:
>    NOTRUN -> SKIP [495] (i915#11151 [107] / i915#7828 [106]) +3 other
>    tests skip
>  *=20
>    igt@kms_chamelium_hpd@vga-hpd-fast:shard-rkl: NOTRUN -> SKIP [493]
>    (i915#11151 [107] / i915#7828 [106]) +6 other tests skipshard-dg1:
>    NOTRUN -> SKIP [494] (i915#11151 [107] / i915#7828 [106]) +5 other
>    tests skip
>  *=20
>    igt@kms_chamelium_hpd@vga-hpd-for-each-pipe:shard-tglu: NOTRUN ->
>    SKIP [492] (i915#11151 [107] / i915#7828 [106]) +9 other tests skip
>  *=20
>    igt@kms_color@deep-color:shard-dg2: NOTRUN -> SKIP [491] (i915#12655
>    [490] / i915#3555 [8])
>  *=20
>    igt@kms_content_protection@dp-mst-lic-type-0:shard-tglu: NOTRUN ->
>    SKIP [489] (i915#15330 [481] / i915#3116 [484] / i915#3299 [483])
>  *=20
>    igt@kms_content_protection@dp-mst-lic-type-1:shard-rkl: NOTRUN ->
>    SKIP [487] (i915#15330 [481] / i915#3116 [484])shard-dg1: NOTRUN ->
>    SKIP [488] (i915#15330 [481] / i915#3299 [483])
>  *=20
>    igt@kms_content_protection@dp-mst-type-0:shard-dg2: NOTRUN -> SKIP
>    [486] (i915#15330 [481] / i915#3299 [483])
>  *=20
>    igt@kms_content_protection@dp-mst-type-1:shard-tglu-1: NOTRUN ->
>    SKIP [485] (i915#15330 [481] / i915#3116 [484] / i915#3299 [483])
>  *=20
>    igt@kms_content_protection@dp-mst-type-1-suspend-resume:shard-dg2:
>    NOTRUN -> SKIP [482] (i915#15330 [481])
>  *=20
>    igt@kms_content_protection@legacy-hdcp14:shard-tglu: NOTRUN -> SKIP
>    [480] (i915#15865 [102]) +3 other tests skip
>  *=20
>    igt@kms_content_protection@type1:shard-tglu-1: NOTRUN -> SKIP [479]
>    (i915#15865 [102])
>  *=20
>    igt@kms_content_protection@uevent-hdcp14:shard-rkl: NOTRUN -> SKIP
>    [478] (i915#15865 [102])
>  *=20
>    igt@kms_cursor_crc@cursor-offscreen-512x170:shard-dg1: NOTRUN ->
>    SKIP [477] (i915#13049 [97])
>  *=20
>    igt@kms_cursor_crc@cursor-onscreen-128x42:shard-rkl: PASS [476] ->
>    FAIL [475] (i915#13566 [218]) +4 other tests fail
>  *=20
>    igt@kms_cursor_crc@cursor-onscreen-32x32:shard-tglu-1: NOTRUN ->
>    SKIP [474] (i915#3555 [8]) +4 other tests skip
>  *=20
>    igt@kms_cursor_crc@cursor-random-512x170:shard-rkl: NOTRUN -> SKIP
>    [473] (i915#13049 [97])
>  *=20
>    igt@kms_cursor_crc@cursor-rapid-movement-32x10:shard-tglu: NOTRUN ->
>    SKIP [472] (i915#3555 [8]) +3 other tests skip
>  *=20
>    igt@kms_cursor_crc@cursor-rapid-movement-512x512:shard-tglu: NOTRUN
>    -> SKIP [471] (i915#13049 [97])
>  *=20
>    igt@kms_cursor_crc@cursor-sliding-128x42@pipe-a-hdmi-a-1:shard-rkl:
>    NOTRUN -> FAIL [468] (i915#13566 [218]) +6 other tests failshard-
>    tglu: PASS [470] -> FAIL [469] (i915#13566 [218]) +1 other test fail
>  *=20
>    igt@kms_cursor_crc@cursor-suspend:shard-glk: NOTRUN -> INCOMPLETE
>    [467] (i915#12358 [464] / i915#14152 [463] / i915#7882 [466])
>  *=20
>    igt@kms_cursor_crc@cursor-suspend@pipe-a-hdmi-a-1:shard-glk: NOTRUN
>    -> INCOMPLETE [465] (i915#12358 [464] / i915#14152 [463])
>  *=20
>    igt@kms_cursor_edge_walk@64x64-right-edge:shard-tglu: PASS [462] ->
>    DMESG-WARN [461] (i915#16685 [460]) +1 other test dmesg-warn
>  *=20
>    igt@kms_cursor_legacy@2x-flip-vs-cursor-legacy:shard-rkl: NOTRUN ->
>    SKIP [459] +87 other tests skip
>  *=20
>    igt@kms_cursor_legacy@basic-busy-flip-before-cursor-varying-
>    size:shard-tglu-1: NOTRUN -> SKIP [457] (i915#4103 [456]) +1 other
>    test skipshard-dg1: NOTRUN -> SKIP [458] (i915#4103 [456]) +2 other
>    tests skip
>  *=20
>    igt@kms_cursor_legacy@modeset-atomic-cursor-hotspot:shard-tglu-1:
>    NOTRUN -> SKIP [455] (i915#9067 [454])
>  *=20
>    igt@kms_dither@fb-8bpc-vs-panel-8bpc:shard-dg1: NOTRUN -> SKIP [453]
>    (i915#3555 [8]) +2 other tests skip
>  *=20
>    igt@kms_dp_link_training@non-uhbr-sst:shard-rkl: NOTRUN -> SKIP
>    [452] (i915#13749 [451])
>  *=20
>    igt@kms_dp_link_training@uhbr-sst:shard-dg1: NOTRUN -> SKIP [450]
>    (i915#13748 [449])
>  *=20
>    igt@kms_dp_linktrain_fallback@dp-fallback:shard-tglu-1: NOTRUN ->
>    SKIP [448] (i915#16867 [447])
>  *=20
>    igt@kms_dp_linktrain_fallback@dsc-fallback:shard-tglu-1: NOTRUN ->
>    SKIP [446] (i915#13707 [445])
>  *=20
>    igt@kms_dp_linktrain_fallback@uhbr-to-hbr-fallback:shard-tglu:
>    NOTRUN -> SKIP [444] (i915#16870 [443])
>  *=20
>    igt@kms_draw_crc@draw-method-mmap-gtt:shard-dg2: NOTRUN -> SKIP
>    [442] (i915#8812 [441])
>  *=20
>    igt@kms_dsc@dsc-basic:shard-rkl: NOTRUN -> SKIP [440] (i915#16361
>    [87]) +3 other tests skip
>  *=20
>    igt@kms_dsc@dsc-basic-ultrajoiner:shard-tglu: NOTRUN -> SKIP [439]
>    (i915#16361 [87]) +2 other tests skip
>  *=20
>    igt@kms_dsc@dsc-with-bpc-bigjoiner:shard-dg1: NOTRUN -> SKIP [438]
>    (i915#16361 [87]) +1 other test skip
>  *=20
>    igt@kms_dsc@dsc-with-formats-ultrajoiner:shard-dg2: NOTRUN -> SKIP
>    [437] (i915#16361 [87])
>  *=20
>    igt@kms_dsc@dsc-with-output-formats-bigjoiner:shard-tglu-1: NOTRUN -
>    > SKIP [436] (i915#16361 [87]) +1 other test skip
>  *=20
>    igt@kms_fbcon_fbt@psr:shard-rkl: NOTRUN -> SKIP [435] (i915#16680
>    [434])
>  *=20
>    igt@kms_feature_discovery@display-3x:shard-rkl: NOTRUN -> SKIP [432]
>    (i915#16081 [430])shard-tglu: NOTRUN -> SKIP [433] (i915#16081
>    [430])
>  *=20
>    igt@kms_feature_discovery@display-4x:shard-tglu-1: NOTRUN -> SKIP
>    [431] (i915#16081 [430])
>  *=20
>    igt@kms_feature_discovery@psr1:shard-dg2: NOTRUN -> SKIP [429]
>    (i915#658 [84])
>  *=20
>    igt@kms_fence_pin_leak:shard-dg2: NOTRUN -> SKIP [428] (i915#4881
>    [427])
>  *=20
>    igt@kms_flip@2x-absolute-wf_vblank:shard-tglu: NOTRUN -> SKIP [426]
>    (i915#3637 [421] / i915#9934 [79]) +7 other tests skip
>  *=20
>    igt@kms_flip@2x-absolute-wf_vblank-interruptible:shard-dg2: NOTRUN -
>    > SKIP [425] (i915#9934 [79]) +1 other test skip
>  *=20
>    igt@kms_flip@2x-flip-vs-fences-interruptible:shard-dg1: NOTRUN ->
>    SKIP [424] (i915#8381 [423]) +1 other test skip
>  *=20
>    igt@kms_flip@2x-flip-vs-panning-vs-hang:shard-tglu-1: NOTRUN -> SKIP
>    [422] (i915#3637 [421] / i915#9934 [79]) +5 other tests skip
>  *=20
>    igt@kms_flip@2x-single-buffer-flip-vs-dpms-off-vs-modeset:shard-dg1:
>    NOTRUN -> SKIP [420] (i915#9934 [79]) +1 other test skip
>  *=20
>    igt@kms_flip@2x-wf_vblank-ts-check:shard-rkl: NOTRUN -> SKIP [419]
>    (i915#9934 [79]) +4 other tests skip
>  *=20
>    igt@kms_flip@flip-vs-blocking-wf-vblank@b-hdmi-a4:shard-dg1: PASS
>    [418] -> FAIL [417] (i915#14600 [199])
>  *=20
>    igt@kms_flip@flip-vs-dpms-on-nop-interruptible:shard-snb: PASS [416]
>    -> FAIL [415] (i915#10826 [395]) +1 other test fail
>  *=20
>    igt@kms_flip@flip-vs-expired-vblank-interruptible:shard-dg2: PASS
>    [414] -> FAIL [413] (i915#13027 [206])
>  *=20
>    igt@kms_flip@flip-vs-expired-vblank-interruptible@a-hdmi-a2:shard-
>    glk11: PASS [412] -> FAIL [411] (i915#13027 [206])
>  *=20
>    igt@kms_flip@flip-vs-expired-vblank-interruptible@c-hdmi-a1:shard-
>    dg2: NOTRUN -> FAIL [410] (i915#13027 [206])
>  *=20
>    igt@kms_flip@flip-vs-suspend:shard-rkl: PASS [407] -> ABORT [406]
>    (i915#15132 [399] / i915#16925 [398])shard-glk10: NOTRUN ->
>    INCOMPLETE [409] (i915#12745 [401] / i915#4839 [408])
>  *=20
>    igt@kms_flip@flip-vs-suspend-interruptible:shard-mtlp: PASS [405] ->
>    INCOMPLETE [404] (i915#16472 [403] / i915#6113 [202]) +1 other test
>    incomplete
>  *=20
>    igt@kms_flip@flip-vs-suspend@a-hdmi-a1:shard-glk10: NOTRUN ->
>    INCOMPLETE [402] (i915#12745 [401])
>  *=20
>    igt@kms_flip@flip-vs-suspend@a-hdmi-a2:shard-rkl: NOTRUN -> ABORT
>    [400] (i915#15132 [399] / i915#16925 [398])
>  *=20
>    igt@kms_flip@flip-vs-wf_vblank-interruptible:shard-dg1: PASS [397] -
>    > FAIL [396] (i915#10826 [395])
>  *=20
>    igt@kms_flip_scaled_crc@flip-32bpp-4tile-to-64bpp-4tile-
>    upscaling:shard-dg1: NOTRUN -> SKIP [394] (i915#15643 [76]) +4 other
>    tests skip
>  *=20
>    igt@kms_flip_scaled_crc@flip-32bpp-yftile-to-32bpp-yftileccs-
>    upscaling:shard-dg2: NOTRUN -> SKIP [393] (i915#15643 [76])
>  *=20
>    igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-16bpp-4tile-
>    downscaling:shard-tglu: NOTRUN -> SKIP [392] (i915#15643 [76]) +3
>    other tests skip
>  *=20
>    igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-16bpp-4tile-
>    upscaling:shard-rkl: NOTRUN -> SKIP [391] (i915#15643 [76]) +2 other
>    tests skip
>  *=20
>    igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-32bpp-4tiledg2rcccs-
>    upscaling:shard-tglu-1: NOTRUN -> SKIP [390] (i915#15643 [76]) +2
>    other tests skip
>  *=20
>    igt@kms_frontbuffer_tracking@fbc-1p-primscrn-spr-indfb-draw-mmap-
>    wc:shard-dg2: NOTRUN -> SKIP [389] (i915#15990 [67] / i915#8708
>    [66]) +3 other tests skip
>  *=20
>    igt@kms_frontbuffer_tracking@fbc-suspend:shard-rkl: PASS [386] ->
>    INCOMPLETE [385] (i915#10056 [384])shard-glk10: NOTRUN -> INCOMPLETE
>    [388] (i915#10056 [384] / i915#16593 [387])
>  *=20
>    igt@kms_frontbuffer_tracking@fbchdr-1p-offscreen-pri-indfb-draw-
>    mmap-wc:shard-tglu: NOTRUN -> SKIP [383] (i915#15989 [194]) +23
>    other tests skip
>  *=20
>    igt@kms_frontbuffer_tracking@fbchdr-1p-primscrn-spr-indfb-draw-
>    render:shard-dg2: NOTRUN -> SKIP [382] (i915#15989 [194]) +6 other
>    tests skip
>  *=20
>    igt@kms_frontbuffer_tracking@fbchdr-1p-primscrn-spr-indfb-
>    onoff:shard-rkl: NOTRUN -> SKIP [381] (i915#15989 [194]) +16 other
>    tests skip
>  *=20
>    igt@kms_frontbuffer_tracking@fbchdr-2p-primscrn-spr-indfb-draw-mmap-
>    cpu:shard-glk: PASS [380] -> SKIP [379] +2 other tests skip
>  *=20
>    igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-pri-indfb-draw-
>    pwrite:shard-dg2: NOTRUN -> SKIP [378] (i915#15102 [59]) +13 other
>    tests skip
>  *=20
>    igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-pri-indfb-draw-mmap-
>    gtt:shard-glk10: NOTRUN -> SKIP [377] +70 other tests skip
>  *=20
>    igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-pri-shrfb-draw-mmap-
>    wc:shard-rkl: NOTRUN -> SKIP [375] (i915#1825 [71]) +5 other tests
>    skipshard-dg1: NOTRUN -> SKIP [376] (i915#15990 [67] / i915#8708
>    [66]) +9 other tests skip
>  *=20
>    igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-spr-indfb-
>    fullscreen:shard-tglu: NOTRUN -> SKIP [374] +103 other tests skip
>  *=20
>    igt@kms_frontbuffer_tracking@fbcpsr-tiling-4:shard-rkl: NOTRUN ->
>    SKIP [373] (i915#5439 [372])
>  *=20
>    igt@kms_frontbuffer_tracking@fbcpsrhdr-1p-offscreen-pri-shrfb-draw-
>    mmap-cpu:shard-tglu-1: NOTRUN -> SKIP [371] (i915#15102 [59]) +27
>    other tests skip
>  *=20
>    igt@kms_frontbuffer_tracking@fbcpsrhdr-1p-primscrn-cur-indfb-draw-
>    mmap-wc:shard-glk: NOTRUN -> SKIP [370] +185 other tests skip
>  *=20
>    igt@kms_frontbuffer_tracking@fbcpsrhdr-2p-primscrn-cur-indfb-draw-
>    mmap-gtt:shard-dg1: NOTRUN -> SKIP [369] (i915#15990 [67]) +14 other
>    tests skip
>  *=20
>    igt@kms_frontbuffer_tracking@fbcpsrhdr-2p-primscrn-shrfb-plflip-
>    blt:shard-tglu-1: NOTRUN -> SKIP [368] +61 other tests skip
>  *=20
>    igt@kms_frontbuffer_tracking@fbcpsrhdr-2p-scndscrn-pri-indfb-draw-
>    mmap-wc:shard-dg2: NOTRUN -> SKIP [367] (i915#15990 [67]) +4 other
>    tests skip
>  *=20
>    igt@kms_frontbuffer_tracking@hdr-1p-primscrn-pri-shrfb-draw-mmap-
>    cpu:shard-tglu-1: NOTRUN -> SKIP [366] (i915#15989 [194]) +8 other
>    tests skip
>  *=20
>    igt@kms_frontbuffer_tracking@hdr-farfromfence-mmap-gtt:shard-rkl:
>    PASS [365] -> SKIP [364] (i915#15989 [194]) +17 other tests skip
>  *=20
>    igt@kms_frontbuffer_tracking@hdr-modesetfrombusy:shard-dg1: NOTRUN -
>    > SKIP [363] (i915#15989 [194]) +8 other tests skip
>  *=20
>    igt@kms_frontbuffer_tracking@psr-1p-offscreen-pri-shrfb-draw-mmap-
>    gtt:shard-dg1: NOTRUN -> SKIP [362] (i915#15104 [361] / i915#15990
>    [67]) +1 other test skip
>  *=20
>    igt@kms_frontbuffer_tracking@psr-1p-primscrn-pri-shrfb-draw-
>    pwrite:shard-tglu: NOTRUN -> SKIP [360] (i915#15102 [59]) +38 other
>    tests skip
>  *=20
>    igt@kms_frontbuffer_tracking@psr-2p-primscrn-indfb-msflip-blt:shard-
>    glk11: NOTRUN -> SKIP [359] +113 other tests skip
>  *=20
>    igt@kms_frontbuffer_tracking@psr-2p-scndscrn-pri-shrfb-draw-
>    blt:shard-dg2: NOTRUN -> SKIP [358] (i915#15991 [354] / i915#5354
>    [302]) +3 other tests skip
>  *=20
>    igt@kms_frontbuffer_tracking@psrhdr-1p-primscrn-spr-indfb-
>    move:shard-rkl: NOTRUN -> SKIP [357] (i915#15102 [59]) +41 other
>    tests skip
>  *=20
>    igt@kms_frontbuffer_tracking@psrhdr-2p-primscrn-spr-indfb-
>    onoff:shard-dg1: NOTRUN -> SKIP [356] +39 other tests skip
>  *=20
>    igt@kms_frontbuffer_tracking@psrhdr-2p-scndscrn-shrfb-plflip-
>    blt:shard-dg2: NOTRUN -> SKIP [355] (i915#15991 [354]) +4 other
>    tests skip
>  *=20
>    igt@kms_frontbuffer_tracking@psrhdr-rgb565-draw-render:shard-dg1:
>    NOTRUN -> SKIP [353] (i915#15102 [59]) +22 other tests skip
>  *=20
>    igt@kms_hdr@bpc-switch:shard-rkl: PASS [351] -> SKIP [350]
>    (i915#16644 [345] / i915#3555 [8] / i915#8228 [344])shard-tglu:
>    NOTRUN -> SKIP [352] (i915#3555 [8] / i915#8228 [344])
>  *=20
>    igt@kms_hdr@brightness-with-hdr:shard-rkl: NOTRUN -> SKIP [349]
>    (i915#12713 [348] / i915#16644 [345])
>  *=20
>    igt@kms_hdr@invalid-metadata-sizes:shard-tglu-1: NOTRUN -> SKIP
>    [347] (i915#3555 [8] / i915#8228 [344])
>  *=20
>    igt@kms_hdr@static-toggle:shard-rkl: NOTRUN -> SKIP [346]
>    (i915#16644 [345] / i915#3555 [8] / i915#8228 [344])
>  *=20
>    igt@kms_joiner@basic-big-joiner:shard-rkl: NOTRUN -> SKIP [342]
>    (i915#15460 [341])shard-dg1: NOTRUN -> SKIP [343] (i915#15460 [341])
>  *=20
>    igt@kms_joiner@basic-force-big-joiner:shard-dg1: NOTRUN -> SKIP
>    [340] (i915#15459 [51])
>  *=20
>    igt@kms_joiner@invalid-modeset-ultra-joiner:shard-dg2: NOTRUN ->
>    SKIP [339] (i915#15458 [54])
>  *=20
>    igt@kms_mst@mst-suspend-read-crc:shard-rkl: NOTRUN -> SKIP [338]
>    (i915#16451 [337])
>  *=20
>    igt@kms_panel_fitting@atomic-fastset:shard-rkl: NOTRUN -> SKIP [336]
>    (i915#6301 [335]) +1 other test skip
>  *=20
>    igt@kms_pipe_crc_basic@suspend-read-crc@pipe-c-hdmi-a-2:shard-rkl:
>    NOTRUN -> INCOMPLETE [334] (i915#12756 [333])
>  *=20
>    igt@kms_pipe_stress@stress-xrgb8888-4tiled:shard-tglu: NOTRUN ->
>    SKIP [332] (i915#14712 [48])
>  *=20
>    igt@kms_plane@pixel-format-4-tiled-mtl-mc-ccs-modifier-source-
>    clamping:shard-tglu: NOTRUN -> SKIP [331] (i915#15709 [43]) +2 other
>    tests skip
>  *=20
>    igt@kms_plane@pixel-format-y-tiled-ccs-modifier:shard-dg1: NOTRUN ->
>    SKIP [330] (i915#15709 [43]) +2 other tests skip
>  *=20
>    igt@kms_plane@pixel-format-y-tiled-gen12-mc-ccs-modifier:shard-tglu-
>    1: NOTRUN -> SKIP [329] (i915#15709 [43]) +3 other tests skip
>  *=20
>    igt@kms_plane@pixel-format-y-tiled-modifier@pipe-b-plane-7:shard-
>    dg1: NOTRUN -> SKIP [328] (i915#16386 [327]) +1 other test skip
>  *=20
>    igt@kms_plane@pixel-format-yf-tiled-ccs-modifier-source-
>    clamping:shard-dg2: NOTRUN -> SKIP [326] (i915#15709 [43])
>  *=20
>    igt@kms_plane@pixel-format-yf-tiled-modifier:shard-rkl: NOTRUN ->
>    SKIP [325] (i915#15709 [43]) +2 other tests skip
>  *=20
>    igt@kms_plane@planar-pixel-format-settings@nv12-tile4-src-y:shard-
>    dg1: NOTRUN -> SKIP [324] (i915#16112 [323])
>  *=20
>    igt@kms_plane_alpha_blend@alpha-basic:shard-glk: NOTRUN -> FAIL
>    [322] (i915#12178 [321])
>  *=20
>    igt@kms_plane_alpha_blend@alpha-basic@pipe-a-hdmi-a-1:shard-glk:
>    NOTRUN -> FAIL [320] (i915#7862 [319]) +1 other test fail
>  *=20
>    igt@kms_plane_cursor@viewport@pipe-a-hdmi-a-1-size-128:shard-rkl:
>    NOTRUN -> FAIL [318] (i915#15913 [317]) +1 other test fail
>  *=20
>    igt@kms_plane_cursor@viewport@pipe-a-hdmi-a-1-size-64:shard-rkl:
>    NOTRUN -> FAIL [316] (i915#15912 [315])
>  *=20
>    igt@kms_plane_multiple@2x-tiling-4:shard-rkl: NOTRUN -> SKIP [314]
>    (i915#13958 [312])
>  *=20
>    igt@kms_plane_multiple@2x-tiling-x:shard-dg2: NOTRUN -> SKIP [313]
>    (i915#13958 [312])
>  *=20
>    igt@kms_plane_multiple@tiling-yf:shard-tglu: NOTRUN -> SKIP [311]
>    (i915#14259 [310])
>  *=20
>    igt@kms_plane_scaling@plane-downscale-factor-0-5-with-rotation@pipe-
>    d:shard-tglu-1: NOTRUN -> SKIP [309] (i915#15329 [308]) +4 other
>    tests skip
>  *=20
>    igt@kms_pm_backlight@brightness-with-dpms:shard-dg2: NOTRUN -> SKIP
>    [307] (i915#12343 [303])
>  *=20
>    igt@kms_pm_backlight@fade-with-dpms:shard-tglu: NOTRUN -> SKIP [306]
>    (i915#12343 [303] / i915#9812 [305]) +1 other test skip
>  *=20
>    igt@kms_pm_backlight@fade-with-suspend:shard-rkl: NOTRUN -> SKIP
>    [304] (i915#12343 [303] / i915#5354 [302]) +1 other test skip
>  *=20
>    igt@kms_pm_dc@dc5-psr-suspend-resume:shard-tglu-1: NOTRUN -> SKIP
>    [301] (i915#16914 [300])
>  *=20
>    igt@kms_pm_dc@dc6-dpms:shard-tglu: NOTRUN -> FAIL [299] (i915#16479
>    [298])
>  *=20
>    igt@kms_pm_dc@dc6-psr:shard-dg1: NOTRUN -> SKIP [297] (i915#15948
>    [40])
>  *=20
>    igt@kms_pm_lpsp@kms-lpsp:shard-dg1: NOTRUN -> SKIP [296] (i915#9340
>    [38])
>  *=20
>    igt@kms_pm_rpm@dpms-mode-unset-lpsp:shard-rkl: PASS [295] -> SKIP
>    [294] (i915#14544 [2] / i915#15073 [182])
>  *=20
>    igt@kms_pm_rpm@dpms-non-lpsp:shard-tglu: NOTRUN -> SKIP [293]
>    (i915#15073 [182]) +1 other test skip
>  *=20
>    igt@kms_pm_rpm@fences:shard-dg1: NOTRUN -> SKIP [292] (i915#4077
>    [291]) +9 other tests skip
>  *=20
>    igt@kms_pm_rpm@modeset-non-lpsp:shard-dg2: PASS [290] -> SKIP [289]
>    (i915#15073 [182])
>  *=20
>    igt@kms_pm_rpm@modeset-non-lpsp-stress:shard-dg1: PASS [288] -> SKIP
>    [287] (i915#15073 [182]) +1 other test skip
>  *=20
>    igt@kms_pm_rpm@modeset-non-lpsp-stress-no-wait:shard-rkl: PASS [286]
>    -> SKIP [285] (i915#15073 [182])
>  *=20
>    igt@kms_psr2_sf@fbc-pr-cursor-plane-move-continuous-exceed-sf:shard-
>    dg2: NOTRUN -> SKIP [284] (i915#11520 [31]) +1 other test skip
>  *=20
>    igt@kms_psr2_sf@fbc-pr-cursor-plane-update-sf:shard-tglu: NOTRUN ->
>    SKIP [283] (i915#11520 [31]) +7 other tests skip
>  *=20
>    igt@kms_psr2_sf@fbc-pr-primary-plane-update-sf-dmg-area:shard-rkl:
>    NOTRUN -> SKIP [282] (i915#11520 [31]) +7 other tests skip
>  *=20
>    igt@kms_psr2_sf@fbc-psr2-cursor-plane-move-continuous-exceed-
>    sf:shard-dg1: NOTRUN -> SKIP [281] (i915#11520 [31]) +4 other tests
>    skip
>  *=20
>    igt@kms_psr2_sf@fbc-psr2-cursor-plane-move-continuous-sf:shard-glk:
>    NOTRUN -> SKIP [280] (i915#11520 [31]) +4 other tests skip
>  *=20
>    igt@kms_psr2_sf@pr-overlay-plane-move-continuous-exceed-sf:shard-
>    tglu-1: NOTRUN -> SKIP [278] (i915#11520 [31]) +3 other tests
>    skipshard-glk10: NOTRUN -> SKIP [279] (i915#11520 [31])
>  *=20
>    igt@kms_psr2_sf@psr2-overlay-plane-move-continuous-exceed-fully-
>    sf:shard-glk11: NOTRUN -> SKIP [277] (i915#11520 [31]) +4 other
>    tests skip
>  *=20
>    igt@kms_psr2_su@page_flip-nv12:shard-tglu-1: NOTRUN -> SKIP [276]
>    (i915#9683 [274])
>  *=20
>    igt@kms_psr2_su@page_flip-xrgb8888:shard-tglu: NOTRUN -> SKIP [275]
>    (i915#9683 [274])
>  *=20
>    igt@kms_psr@pr-primary-blt:shard-dg2: NOTRUN -> SKIP [273]
>    (i915#1072 [26] / i915#9732 [25]) +5 other tests skip
>  *=20
>    igt@kms_psr@psr2-cursor-mmap-gtt:shard-rkl: NOTRUN -> SKIP [272]
>    (i915#1072 [26] / i915#9732 [25]) +20 other tests skip
>  *=20
>    igt@kms_psr@psr2-cursor-plane-onoff:shard-tglu: NOTRUN -> SKIP [271]
>    (i915#9732 [25]) +18 other tests skip
>  *=20
>    igt@kms_psr@psr2-sprite-mmap-gtt:shard-tglu-1: NOTRUN -> SKIP [269]
>    (i915#9732 [25]) +9 other tests skipshard-dg1: NOTRUN -> SKIP [270]
>    (i915#1072 [26] / i915#9732 [25]) +10 other tests skip
>  *=20
>    igt@kms_psr_stress_test@flip-primary-invalidate-overlay:shard-tglu-
>    1: NOTRUN -> SKIP [268] (i915#15949 [22])
>  *=20
>    igt@kms_psr_stress_test@invalidate-primary-flip-overlay:shard-tglu:
>    NOTRUN -> SKIP [267] (i915#15949 [22])
>  *=20
>    igt@kms_rotation_crc@primary-4-tiled-reflect-x-180:shard-tglu:
>    NOTRUN -> SKIP [266] (i915#5289 [17]) +1 other test skip
>  *=20
>    igt@kms_rotation_crc@primary-yf-tiled-reflect-x-0:shard-tglu-1:
>    NOTRUN -> SKIP [265] (i915#5289 [17])
>  *=20
>    igt@kms_rotation_crc@primary-yf-tiled-reflect-x-270:shard-dg1:
>    NOTRUN -> SKIP [264] (i915#5289 [17])
>  *=20
>    igt@kms_scaling_modes@scaling-mode-none:shard-rkl: NOTRUN -> SKIP
>    [263] (i915#3555 [8]) +1 other test skip
>  *=20
>    igt@kms_tiled_display@basic-test-pattern:shard-glk: NOTRUN -> FAIL
>    [262] (i915#10959 [261])
>  *=20
>    igt@kms_vblank@ts-continuation-dpms-suspend:shard-rkl: PASS [260] ->
>    INCOMPLETE [259] (i915#12276 [256])
>  *=20
>    igt@kms_vblank@ts-continuation-dpms-suspend@pipe-a-hdmi-a-2:shard-
>    rkl: NOTRUN -> INCOMPLETE [258] (i915#12276 [256])
>  *=20
>    igt@kms_vblank@ts-continuation-suspend:shard-glk11: NOTRUN ->
>    INCOMPLETE [257] (i915#12276 [256]) +1 other test incomplete
>  *=20
>    igt@kms_vrr@max-min:shard-dg2: NOTRUN -> SKIP [255] (i915#9906
>    [252])
>  *=20
>    igt@kms_vrr@seamless-rr-switch-drrs:shard-tglu: NOTRUN -> SKIP [254]
>    (i915#9906 [252])
>  *=20
>    igt@kms_vrr@seamless-rr-switch-vrr:shard-rkl: NOTRUN -> SKIP [253]
>    (i915#9906 [252])
>  *=20
>    igt@perf@per-context-mode-unprivileged:shard-rkl: NOTRUN -> SKIP
>    [251] (i915#2435 [250])
>  *=20
>    igt@perf_pmu@busy-double-start:shard-mtlp: PASS [249] -> FAIL [248]
>    (i915#4349 [247]) +3 other tests fail
>  *=20
>    igt@perf_pmu@module-unload:shard-tglu-1: NOTRUN -> ABORT [245]
>    (i915#13029 [244] / i915#15778 [243])shard-dg1: NOTRUN -> ABORT
>    [246] (i915#13029 [244] / i915#15778 [243])
>  *=20
>    igt@prime_udl@share-import:shard-tglu: NOTRUN -> SKIP [242]
>    (i915#16420 [241]) +1 other test skip
>  *=20
>    igt@prime_vgem@basic-write:shard-rkl: NOTRUN -> SKIP [240]
>    (i915#3291 [5] / i915#3708 [1])
>  *=20
>    igt@tools_test@sysfs_l3_parity:shard-dg1: NOTRUN -> SKIP [239]
>    (i915#4818 [238])
> Possible fixes *=20
>    igt@gem_eio@hibernate:shard-rkl: ABORT [237] (i915#7975 [236]) ->
>    PASS [235]
>  *=20
>    igt@gem_eio@in-flight-suspend:shard-dg2: ABORT [234] (i915#16784
>    [233]) -> PASS [232]
>  *=20
>    igt@gem_workarounds@suspend-resume-fd:shard-rkl: INCOMPLETE [231]
>    (i915#13356 [230]) -> PASS [229]
>  *=20
>    igt@i915_suspend@fence-restore-untiled:shard-glk: INCOMPLETE [228]
>    (i915#16182 [227] / i915#4817 [224]) -> PASS [226]
>  *=20
>    igt@i915_suspend@sysfs-reader:shard-rkl: INCOMPLETE [225] (i915#4817
>    [224]) -> PASS [223]
>  *=20
>    igt@kms_async_flips@alternate-sync-async-flip-atomic@pipe-b-hdmi-a-
>    1:shard-glk: FAIL [222] (i915#14888 [221]) -> PASS [220] +2 other
>    tests pass
>  *=20
>    igt@kms_cursor_crc@cursor-onscreen-64x21@pipe-a-hdmi-a-1:shard-tglu:
>    FAIL [219] (i915#13566 [218]) -> PASS [217] +1 other test pass
>  *=20
>    igt@kms_flip@dpms-vs-vblank-race-interruptible:shard-tglu: ABORT
>    [216] (i915#16876 [213]) -> PASS [215]
>  *=20
>    igt@kms_flip@dpms-vs-vblank-race-interruptible@d-hdmi-a1:shard-tglu:
>    ABORT [214] (i915#16866 [118] / i915#16876 [213]) -> PASS [212]
>  *=20
>    igt@kms_flip@flip-vs-blocking-wf-vblank@a-hdmi-a4:shard-dg1: FAIL
>    [211] (i915#14600 [199]) -> PASS [210]
>  *=20
>    igt@kms_flip@flip-vs-expired-vblank:shard-glk: FAIL [209]
>    (i915#13027 [206]) -> PASS [208] +1 other test pass
>  *=20
>    igt@kms_flip@flip-vs-expired-vblank-interruptible@b-hdmi-a1:shard-
>    glk11: FAIL [207] (i915#13027 [206]) -> PASS [205]
>  *=20
>    igt@kms_flip@flip-vs-suspend-interruptible:shard-rkl: INCOMPLETE
>    [204] (i915#16276 [203] / i915#6113 [202]) -> PASS [201]
>  *=20
>    igt@kms_flip@wf_vblank-ts-check:shard-tglu: FAIL [200] (i915#14600
>    [199]) -> PASS [198] +1 other test pass
>  *=20
>    igt@kms_frontbuffer_tracking@fbchdr-1p-primscrn-cur-indfb-
>    move:shard-glk: SKIP [197] -> PASS [196] +15 other tests pass
>  *=20
>    igt@kms_frontbuffer_tracking@fbchdr-1p-rte:shard-rkl: SKIP [195]
>    (i915#15989 [194]) -> PASS [193] +8 other tests pass
>  *=20
>    igt@kms_pipe_crc_basic@suspend-read-crc@pipe-a-hdmi-a-2:shard-rkl:
>    INCOMPLETE [192] (i915#13476 [191]) -> PASS [190]
>  *=20
>    igt@kms_plane_lowres@tiling-y:shard-rkl: ABORT [189] (i915#16866
>    [118]) -> PASS [188]
>  *=20
>    igt@kms_pm_rpm@dpms-lpsp:shard-rkl: SKIP [185] (i915#15073 [182]) ->
>    PASS [184] +1 other test passshard-dg1: SKIP [187] (i915#15073
>    [182]) -> PASS [186] +1 other test pass
>  *=20
>    igt@kms_pm_rpm@modeset-non-lpsp-stress-no-wait:shard-dg2: SKIP [183]
>    (i915#15073 [182]) -> PASS [181]
>  *=20
>    igt@kms_pm_rpm@system-suspend-idle:shard-dg2: INCOMPLETE [180]
>    (i915#14419 [179]) -> PASS [178]
> Warnings *=20
>    igt@device_reset@cold-reset-bound:shard-rkl: SKIP [177] (i915#11078
>    [175]) -> SKIP [176] (i915#11078 [175] / i915#14544 [2])
>  *=20
>    igt@gem_create@create-ext-cpu-access-sanity-check:shard-rkl: SKIP
>    [174] (i915#6335 [172]) -> SKIP [173] (i915#14544 [2] / i915#6335
>    [172])
>  *=20
>    igt@gem_eio@kms:shard-rkl: ABORT [171] (i915#16837 [169]) -> ABORT
>    [170] (i915#16837 [169] / i915#16931 [168])
>  *=20
>    igt@gem_exec_capture@capture-recoverable:shard-rkl: SKIP [167]
>    (i915#14544 [2] / i915#6344 [165]) -> SKIP [166] (i915#6344 [165])
>  *=20
>    igt@gem_exec_reloc@basic-cpu-gtt-noreloc:shard-rkl: SKIP [164]
>    (i915#3281 [160]) -> SKIP [163] (i915#14544 [2] / i915#3281 [160])
>    +2 other tests skip
>  *=20
>    igt@gem_exec_reloc@basic-write-read-active:shard-rkl: SKIP [162]
>    (i915#14544 [2] / i915#3281 [160]) -> SKIP [161] (i915#3281 [160])
>  *=20
>    igt@gem_lmem_evict@dontneed-evict-race:shard-rkl: SKIP [159]
>    (i915#4613 [152] / i915#7582 [157]) -> SKIP [158] (i915#14544 [2] /
>    i915#4613 [152] / i915#7582 [157])
>  *=20
>    igt@gem_lmem_swapping@parallel-random-verify:shard-rkl: SKIP [156]
>    (i915#14544 [2] / i915#4613 [152]) -> SKIP [155] (i915#4613 [152])
>    +1 other test skip
>  *=20
>    igt@gem_lmem_swapping@verify-ccs:shard-rkl: SKIP [154] (i915#4613
>    [152]) -> SKIP [153] (i915#14544 [2] / i915#4613 [152])
>  *=20
>    igt@gem_tiled_pread_pwrite:shard-rkl: SKIP [151] (i915#3282 [149]) -
>    > SKIP [150] (i915#14544 [2] / i915#3282 [149])
>  *=20
>    igt@gem_userptr_blits@invalid-mmap-offset-unsync:shard-rkl: SKIP
>    [148] (i915#3297 [146]) -> SKIP [147] (i915#14544 [2] / i915#3297
>    [146])
>  *=20
>    igt@gen9_exec_parse@bb-start-param:shard-rkl: SKIP [145] (i915#2527
>    [141]) -> SKIP [144] (i915#14544 [2] / i915#2527 [141]) +1 other
>    test skip
>  *=20
>    igt@gen9_exec_parse@unaligned-jump:shard-rkl: SKIP [143] (i915#14544
>    [2] / i915#2527 [141]) -> SKIP [142] (i915#2527 [141]) +1 other test
>    skip
>  *=20
>    igt@i915_module_load@fault-injection@__uc_init:shard-rkl: SKIP [140]
>    (i915#15479 [138]) -> SKIP [139] (i915#14544 [2] / i915#15479 [138])
>    +4 other tests skip
>  *=20
>    igt@i915_pm_freq_api@freq-reset-multiple:shard-rkl: SKIP [137]
>    (i915#8399 [135]) -> SKIP [136] (i915#14544 [2] / i915#8399 [135])
>  *=20
>    igt@kms_big_fb@4-tiled-max-hw-stride-32bpp-rotate-0-async-
>    flip:shard-rkl: SKIP [134] (i915#5286 [130]) -> SKIP [133]
>    (i915#14544 [2] / i915#5286 [130])
>  *=20
>    igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-180-hflip:shard-
>    rkl: SKIP [132] (i915#14544 [2] / i915#5286 [130]) -> SKIP [131]
>    (i915#5286 [130]) +1 other test skip
>  *=20
>    igt@kms_big_fb@linear-8bpp-rotate-270:shard-rkl: SKIP [129]
>    (i915#3638 [125]) -> SKIP [128] (i915#14544 [2] / i915#3638 [125])
>    +1 other test skip
>  *=20
>    igt@kms_big_fb@y-tiled-8bpp-rotate-90:shard-rkl: SKIP [127]
>    (i915#14544 [2] / i915#3638 [125]) -> SKIP [126] (i915#3638 [125])
>    +1 other test skip
>  *=20
>    igt@kms_big_fb@yf-tiled-16bpp-rotate-270:shard-rkl: SKIP [124]
>    (i915#14544 [2]) -> SKIP [123] +31 other tests skip
>  *=20
>    igt@kms_ccs@bad-rotation-90-4-tiled-mtl-mc-ccs@pipe-b-hdmi-a-
>    2:shard-rkl: SKIP [122] (i915#14544 [2] / i915#6095 [112]) -> SKIP
>    [121] (i915#6095 [112]) +6 other tests skip
>  *=20
>    igt@kms_ccs@crc-primary-rotation-180-4-tiled-dg2-rc-ccs@pipe-c-hdmi-
>    a-2:shard-rkl: SKIP [120] (i915#14098 [113] / i915#6095 [112]) ->
>    ABORT [119] (i915#16866 [118]) +1 other test abort
>  *=20
>    igt@kms_ccs@crc-primary-suspend-4-tiled-dg2-rc-ccs@pipe-c-hdmi-a-
>    2:shard-rkl: SKIP [117] (i915#14098 [113] / i915#14544 [2] /
>    i915#6095 [112]) -> SKIP [116] (i915#14098 [113] / i915#6095 [112])
>    +7 other tests skip
>  *=20
>    igt@kms_ccs@missing-ccs-buffer-4-tiled-mtl-mc-ccs:shard-rkl: SKIP
>    [115] (i915#14098 [113] / i915#6095 [112]) -> SKIP [114] (i915#14098
>    [113] / i915#14544 [2] / i915#6095 [112]) +2 other tests skip
>  *=20
>    igt@kms_chamelium_edid@hdmi-edid-stress-resolution-non-4k:shard-rkl:
>    SKIP [111] (i915#11151 [107] / i915#14544 [2] / i915#7828 [106]) ->
>    SKIP [110] (i915#11151 [107] / i915#7828 [106]) +2 other tests skip
>  *=20
>    igt@kms_chamelium_frames@dp-crc-fast:shard-rkl: SKIP [109]
>    (i915#11151 [107] / i915#7828 [106]) -> SKIP [108] (i915#11151 [107]
>    / i915#14544 [2] / i915#7828 [106]) +5 other tests skip
>  *=20
>    igt@kms_content_protection@atomic-hdcp14:shard-rkl: SKIP [105]
>    (i915#15865 [102]) -> SKIP [104] (i915#14544 [2] / i915#15865 [102])
>  *=20
>    igt@kms_content_protection@mei-interface:shard-dg1: SKIP [103]
>    (i915#15865 [102]) -> SKIP [101] (i915#9433 [100])
>  *=20
>    igt@kms_cursor_crc@cursor-offscreen-512x170:shard-rkl: SKIP [99]
>    (i915#13049 [97] / i915#14544 [2]) -> SKIP [98] (i915#13049 [97])
>  *=20
>    igt@kms_cursor_crc@cursor-random-32x32:shard-rkl: SKIP [96]
>    (i915#14544 [2] / i915#3555 [8]) -> SKIP [95] (i915#3555 [8])
>  *=20
>    igt@kms_dp_aux_dev@basic:shard-rkl: SKIP [94] (i915#1257 [92]) ->
>    SKIP [93] (i915#1257 [92] / i915#14544 [2])
>  *=20
>    igt@kms_dsc@dsc-basic-ultrajoiner:shard-rkl: SKIP [91] (i915#16361
>    [87]) -> SKIP [90] (i915#14544 [2] / i915#16361 [87])
>  *=20
>    igt@kms_dsc@dsc-with-bpc:shard-rkl: SKIP [89] (i915#14544 [2] /
>    i915#16361 [87]) -> SKIP [88] (i915#16361 [87])
>  *=20
>    igt@kms_feature_discovery@psr2:shard-rkl: SKIP [86] (i915#658 [84])
>    -> SKIP [85] (i915#14544 [2] / i915#658 [84])
>  *=20
>    igt@kms_flip@2x-absolute-wf_vblank:shard-rkl: SKIP [83] (i915#9934
>    [79]) -> SKIP [82] (i915#14544 [2] / i915#9934 [79]) +1 other test
>    skip
>  *=20
>    igt@kms_flip@2x-flip-vs-fences-interruptible:shard-rkl: SKIP [81]
>    (i915#14544 [2] / i915#9934 [79]) -> SKIP [80] (i915#9934 [79])
>  *=20
>    igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-16bpp-yftile-
>    upscaling:shard-rkl: SKIP [78] (i915#14544 [2] / i915#15643 [76]) ->
>    SKIP [77] (i915#15643 [76]) +2 other tests skip
>  *=20
>    igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-pri-shrfb-draw-mmap-
>    gtt:shard-rkl: SKIP [75] (i915#1825 [71]) -> SKIP [74] (i915#14544
>    [2] / i915#1825 [71]) +2 other tests skip
>  *=20
>    igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-pri-indfb-draw-mmap-
>    wc:shard-rkl: SKIP [73] (i915#14544 [2] / i915#1825 [71]) -> SKIP
>    [72] (i915#1825 [71]) +2 other tests skip
>  *=20
>    igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-cur-indfb-draw-mmap-
>    wc:shard-dg1: SKIP [70] (i915#15990 [67] / i915#4423 [69] /
>    i915#8708 [66]) -> SKIP [68] (i915#15990 [67] / i915#8708 [66])
>  *=20
>    igt@kms_frontbuffer_tracking@fbcpsrhdr-1p-primscrn-spr-indfb-draw-
>    blt:shard-rkl: SKIP [65] (i915#14544 [2] / i915#15102 [59]) -> SKIP
>    [64] (i915#15102 [59]) +13 other tests skip
>  *=20
>    igt@kms_frontbuffer_tracking@hdr-2p-primscrn-pri-shrfb-draw-mmap-
>    cpu:shard-rkl: SKIP [63] -> SKIP [62] (i915#14544 [2]) +29 other
>    tests skip
>  *=20
>    igt@kms_frontbuffer_tracking@psr-indfb-scaledprimary:shard-rkl: SKIP
>    [61] (i915#15102 [59]) -> SKIP [60] (i915#14544 [2] / i915#15102
>    [59]) +14 other tests skip
>  *=20
>    igt@kms_joiner@basic-force-big-joiner:shard-rkl: SKIP [58]
>    (i915#14544 [2] / i915#15459 [51]) -> SKIP [57] (i915#15459 [51])
>  *=20
>    igt@kms_joiner@basic-force-ultra-joiner:shard-rkl: SKIP [56]
>    (i915#15458 [54]) -> SKIP [55] (i915#14544 [2] / i915#15458 [54])
>  *=20
>    igt@kms_joiner@invalid-modeset-force-big-joiner:shard-rkl: SKIP [53]
>    (i915#15459 [51]) -> SKIP [52] (i915#14544 [2] / i915#15459 [51])
>  *=20
>    igt@kms_pipe_stress@stress-xrgb8888-yftiled:shard-rkl: SKIP [50]
>    (i915#14712 [48]) -> SKIP [49] (i915#14544 [2] / i915#14712 [48])
>  *=20
>    igt@kms_plane@pixel-format-4-tiled-lnl-ccs-modifier-source-
>    clamping:shard-rkl: SKIP [47] (i915#15709 [43]) -> SKIP [46]
>    (i915#14544 [2] / i915#15709 [43]) +1 other test skip
>  *=20
>    igt@kms_plane@pixel-format-y-tiled-ccs-modifier:shard-rkl: SKIP [45]
>    (i915#14544 [2] / i915#15709 [43]) -> SKIP [44] (i915#15709 [43]) +1
>    other test skip
>  *=20
>    igt@kms_pm_dc@dc6-psr:shard-rkl: SKIP [42] (i915#14544 [2] /
>    i915#15948 [40]) -> SKIP [41] (i915#15948 [40])
>  *=20
>    igt@kms_pm_lpsp@kms-lpsp:shard-rkl: SKIP [39] (i915#9340 [38]) ->
>    SKIP [37] (i915#3828 [36])
>  *=20
>    igt@kms_psr2_sf@pr-primary-plane-update-sf-dmg-area-big-fb:shard-
>    rkl: SKIP [35] (i915#11520 [31]) -> SKIP [34] (i915#11520 [31] /
>    i915#14544 [2]) +3 other tests skip
>  *=20
>    igt@kms_psr2_sf@psr2-overlay-plane-move-continuous-exceed-sf:shard-
>    rkl: SKIP [33] (i915#11520 [31] / i915#14544 [2]) -> SKIP [32]
>    (i915#11520 [31]) +1 other test skip
>  *=20
>    igt@kms_psr@fbc-psr2-no-drrs:shard-rkl: SKIP [30] (i915#1072 [26] /
>    i915#9732 [25]) -> SKIP [29] (i915#1072 [26] / i915#14544 [2] /
>    i915#9732 [25]) +4 other tests skip
>  *=20
>    igt@kms_psr@pr-no-drrs:shard-rkl: SKIP [28] (i915#1072 [26] /
>    i915#14544 [2] / i915#9732 [25]) -> SKIP [27] (i915#1072 [26] /
>    i915#9732 [25]) +5 other tests skip
>  *=20
>    igt@kms_psr_stress_test@invalidate-primary-flip-overlay:shard-rkl:
>    SKIP [24] (i915#15949 [22]) -> SKIP [23] (i915#14544 [2] /
>    i915#15949 [22])
>  *=20
>    igt@kms_rotation_crc@primary-yf-tiled-reflect-x-180:shard-rkl: SKIP
>    [21] (i915#5289 [17]) -> SKIP [20] (i915#14544 [2] / i915#5289 [17])
>  *=20
>    igt@kms_rotation_crc@primary-yf-tiled-reflect-x-270:shard-rkl: SKIP
>    [19] (i915#14544 [2] / i915#5289 [17]) -> SKIP [18] (i915#5289 [17])
>    +1 other test skip
>  *=20
>    igt@kms_setmode@clone-exclusive-crtc:shard-rkl: SKIP [16] (i915#3555
>    [8]) -> SKIP [15] (i915#14544 [2] / i915#3555 [8])
>  *=20
>    igt@kms_tiled_display@basic-test-pattern-with-chamelium:shard-rkl:
>    SKIP [14] (i915#8623 [12]) -> SKIP [13] (i915#14544 [2] / i915#8623
>    [12])
>  *=20
>    igt@kms_vrr@flipline:shard-rkl: SKIP [11] (i915#15243 [9] /
>    i915#3555 [8]) -> SKIP [10] (i915#14544 [2] / i915#15243 [9] /
>    i915#3555 [8])
>  *=20
>    igt@prime_vgem@basic-read:shard-rkl: SKIP [7] (i915#3291 [5] /
>    i915#3708 [1]) -> SKIP [6] (i915#14544 [2] / i915#3291 [5] /
>    i915#3708 [1])
>  *=20
>    igt@prime_vgem@fence-read-hang:shard-rkl: SKIP [4] (i915#3708 [1]) -
>    > SKIP [3] (i915#14544 [2] / i915#3708 [1])
> Piglit changes{name}: This element is suppressed. This means it is ignore=
d when
> computing
> the status of the difference (SUCCESS, WARNING, or FAILURE).
> Build changes * Linux: CI_DRM_19102 -> Patchwork_173589v1
> CI-20190529: 20190529
> CI_DRM_19102: 06602b51786b6c2a0f97e58f0e0f168be1ada27e @
> git://anongit.freedesktop.org/gfx-ci/linux
> IGT_9085: 9085
> Patchwork_173589v1: 06602b51786b6c2a0f97e58f0e0f168be1ada27e @
> git://anongit.freedesktop.org/gfx-ci/linux
> piglit_4509: fdc5a4ca11124ab8413c7988896eec4c97336694 @
> git://anongit.freedesktop.org/piglit


[1] i915#3708
    https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3708
[2] i915#14544
    https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544
[3] SKIP
    https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_173589v1/shard-rkl-6=
/igt@prime_vgem@fence-read-hang.html
[4] SKIP
    https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19102/shard-rkl-2/igt@p=
rime_vgem@fence-read-hang.html
[5] i915#3291
    https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3291
[6] SKIP
    https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_173589v1/shard-rkl-6=
/igt@prime_vgem@basic-read.html
[7] SKIP
    https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19102/shard-rkl-2/igt@p=
rime_vgem@basic-read.html
[8] i915#3555
    https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3555
[9] i915#15243
    https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15243
[10] SKIP
     https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_173589v1/shard-rkl-=
6/igt@kms_vrr@flipline.html
[11] SKIP
     https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19102/shard-rkl-2/igt@=
kms_vrr@flipline.html
[12] i915#8623
     https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8623
[13] SKIP
     https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_173589v1/shard-rkl-=
6/igt@kms_tiled_display@basic-test-pattern-with-chamelium.html
[14] SKIP
     https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19102/shard-rkl-2/igt@=
kms_tiled_display@basic-test-pattern-with-chamelium.html
[15] SKIP
     https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_173589v1/shard-rkl-=
6/igt@kms_setmode@clone-exclusive-crtc.html
[16] SKIP
     https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19102/shard-rkl-2/igt@=
kms_setmode@clone-exclusive-crtc.html
[17] i915#5289
     https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5289
[18] SKIP
     https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_173589v1/shard-rkl-=
4/igt@kms_rotation_crc@primary-yf-tiled-reflect-x-270.html
[19] SKIP
     https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19102/shard-rkl-6/igt@=
kms_rotation_crc@primary-yf-tiled-reflect-x-270.html
[20] SKIP
     https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_173589v1/shard-rkl-=
6/igt@kms_rotation_crc@primary-yf-tiled-reflect-x-180.html
[21] SKIP
     https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19102/shard-rkl-2/igt@=
kms_rotation_crc@primary-yf-tiled-reflect-x-180.html
[22] i915#15949
     https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15949
[23] SKIP
     https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_173589v1/shard-rkl-=
6/igt@kms_psr_stress_test@invalidate-primary-flip-overlay.html
[24] SKIP
     https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19102/shard-rkl-2/igt@=
kms_psr_stress_test@invalidate-primary-flip-overlay.html
[25] i915#9732
     https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9732
[26] i915#1072
     https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/1072
[27] SKIP
     https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_173589v1/shard-rkl-=
4/igt@kms_psr@pr-no-drrs.html
[28] SKIP
     https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19102/shard-rkl-6/igt@=
kms_psr@pr-no-drrs.html
[29] SKIP
     https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_173589v1/shard-rkl-=
6/igt@kms_psr@fbc-psr2-no-drrs.html
[30] SKIP
     https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19102/shard-rkl-2/igt@=
kms_psr@fbc-psr2-no-drrs.html
[31] i915#11520
     https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11520
[32] SKIP
     https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_173589v1/shard-rkl-=
4/igt@kms_psr2_sf@psr2-overlay-plane-move-continuous-exceed-sf.html
[33] SKIP
     https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19102/shard-rkl-6/igt@=
kms_psr2_sf@psr2-overlay-plane-move-continuous-exceed-sf.html
[34] SKIP
     https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_173589v1/shard-rkl-=
6/igt@kms_psr2_sf@pr-primary-plane-update-sf-dmg-area-big-fb.html
[35] SKIP
     https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19102/shard-rkl-2/igt@=
kms_psr2_sf@pr-primary-plane-update-sf-dmg-area-big-fb.html
[36] i915#3828
     https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3828
[37] SKIP
     https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_173589v1/shard-rkl-=
8/igt@kms_pm_lpsp@kms-lpsp.html
[38] i915#9340
     https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9340
[39] SKIP
     https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19102/shard-rkl-1/igt@=
kms_pm_lpsp@kms-lpsp.html
[40] i915#15948
     https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15948
[41] SKIP
     https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_173589v1/shard-rkl-=
4/igt@kms_pm_dc@dc6-psr.html
[42] SKIP
     https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19102/shard-rkl-6/igt@=
kms_pm_dc@dc6-psr.html
[43] i915#15709
     https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15709
[44] SKIP
     https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_173589v1/shard-rkl-=
4/igt@kms_plane@pixel-format-y-tiled-ccs-modifier.html
[45] SKIP
     https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19102/shard-rkl-6/igt@=
kms_plane@pixel-format-y-tiled-ccs-modifier.html
[46] SKIP
     https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_173589v1/shard-rkl-=
6/igt@kms_plane@pixel-format-4-tiled-lnl-ccs-modifier-source-clamping.html
[47] SKIP
     https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19102/shard-rkl-2/igt@=
kms_plane@pixel-format-4-tiled-lnl-ccs-modifier-source-clamping.html
[48] i915#14712
     https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14712
[49] SKIP
     https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_173589v1/shard-rkl-=
6/igt@kms_pipe_stress@stress-xrgb8888-yftiled.html
[50] SKIP
     https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19102/shard-rkl-2/igt@=
kms_pipe_stress@stress-xrgb8888-yftiled.html
[51] i915#15459
     https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15459
[52] SKIP
     https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_173589v1/shard-rkl-=
6/igt@kms_joiner@invalid-modeset-force-big-joiner.html
[53] SKIP
     https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19102/shard-rkl-2/igt@=
kms_joiner@invalid-modeset-force-big-joiner.html
[54] i915#15458
     https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15458
[55] SKIP
     https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_173589v1/shard-rkl-=
6/igt@kms_joiner@basic-force-ultra-joiner.html
[56] SKIP
     https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19102/shard-rkl-2/igt@=
kms_joiner@basic-force-ultra-joiner.html
[57] SKIP
     https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_173589v1/shard-rkl-=
4/igt@kms_joiner@basic-force-big-joiner.html
[58] SKIP
     https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19102/shard-rkl-6/igt@=
kms_joiner@basic-force-big-joiner.html
[59] i915#15102
     https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15102
[60] SKIP
     https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_173589v1/shard-rkl-=
6/igt@kms_frontbuffer_tracking@psr-indfb-scaledprimary.html
[61] SKIP
     https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19102/shard-rkl-2/igt@=
kms_frontbuffer_tracking@psr-indfb-scaledprimary.html
[62] SKIP
     https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_173589v1/shard-rkl-=
6/igt@kms_frontbuffer_tracking@hdr-2p-primscrn-pri-shrfb-draw-mmap-cpu.html
[63] SKIP
     https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19102/shard-rkl-2/igt@=
kms_frontbuffer_tracking@hdr-2p-primscrn-pri-shrfb-draw-mmap-cpu.html
[64] SKIP
     https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_173589v1/shard-rkl-=
4/igt@kms_frontbuffer_tracking@fbcpsrhdr-1p-primscrn-spr-indfb-draw-blt.htm=
l
[65] SKIP
     https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19102/shard-rkl-6/igt@=
kms_frontbuffer_tracking@fbcpsrhdr-1p-primscrn-spr-indfb-draw-blt.html
[66] i915#8708
     https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8708
[67] i915#15990
     https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15990
[68] SKIP
     https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_173589v1/shard-dg1-=
14/igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-cur-indfb-draw-mmap-wc.h=
tml
[69] i915#4423
     https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4423
[70] SKIP
     https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19102/shard-dg1-19/igt=
@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-cur-indfb-draw-mmap-wc.html
[71] i915#1825
     https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/1825
[72] SKIP
     https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_173589v1/shard-rkl-=
4/igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-pri-indfb-draw-mmap-wc.ht=
ml
[73] SKIP
     https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19102/shard-rkl-6/igt@=
kms_frontbuffer_tracking@fbcpsr-2p-primscrn-pri-indfb-draw-mmap-wc.html
[74] SKIP
     https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_173589v1/shard-rkl-=
6/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-pri-shrfb-draw-mmap-gtt.html
[75] SKIP
     https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19102/shard-rkl-2/igt@=
kms_frontbuffer_tracking@fbc-2p-scndscrn-pri-shrfb-draw-mmap-gtt.html
[76] i915#15643
     https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15643
[77] SKIP
     https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_173589v1/shard-rkl-=
4/igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-16bpp-yftile-upscaling.html
[78] SKIP
     https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19102/shard-rkl-6/igt@=
kms_flip_scaled_crc@flip-64bpp-yftile-to-16bpp-yftile-upscaling.html
[79] i915#9934
     https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9934
[80] SKIP
     https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_173589v1/shard-rkl-=
4/igt@kms_flip@2x-flip-vs-fences-interruptible.html
[81] SKIP
     https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19102/shard-rkl-6/igt@=
kms_flip@2x-flip-vs-fences-interruptible.html
[82] SKIP
     https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_173589v1/shard-rkl-=
6/igt@kms_flip@2x-absolute-wf_vblank.html
[83] SKIP
     https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19102/shard-rkl-2/igt@=
kms_flip@2x-absolute-wf_vblank.html
[84] i915#658
     https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/658
[85] SKIP
     https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_173589v1/shard-rkl-=
6/igt@kms_feature_discovery@psr2.html
[86] SKIP
     https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19102/shard-rkl-2/igt@=
kms_feature_discovery@psr2.html
[87] i915#16361
     https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16361
[88] SKIP
     https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_173589v1/shard-rkl-=
4/igt@kms_dsc@dsc-with-bpc.html
[89] SKIP
     https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19102/shard-rkl-6/igt@=
kms_dsc@dsc-with-bpc.html
[90] SKIP
     https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_173589v1/shard-rkl-=
6/igt@kms_dsc@dsc-basic-ultrajoiner.html
[91] SKIP
     https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19102/shard-rkl-2/igt@=
kms_dsc@dsc-basic-ultrajoiner.html
[92] i915#1257
     https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/1257
[93] SKIP
     https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_173589v1/shard-rkl-=
6/igt@kms_dp_aux_dev@basic.html
[94] SKIP
     https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19102/shard-rkl-2/igt@=
kms_dp_aux_dev@basic.html
[95] SKIP
     https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_173589v1/shard-rkl-=
4/igt@kms_cursor_crc@cursor-random-32x32.html
[96] SKIP
     https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19102/shard-rkl-6/igt@=
kms_cursor_crc@cursor-random-32x32.html
[97] i915#13049
     https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13049
[98] SKIP
     https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_173589v1/shard-rkl-=
4/igt@kms_cursor_crc@cursor-offscreen-512x170.html
[99] SKIP
     https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19102/shard-rkl-6/igt@=
kms_cursor_crc@cursor-offscreen-512x170.html
[100] i915#9433
      https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9433
[101] SKIP
      https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_173589v1/shard-dg1=
-12/igt@kms_content_protection@mei-interface.html
[102] i915#15865
      https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15865
[103] SKIP
      https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19102/shard-dg1-14/ig=
t@kms_content_protection@mei-interface.html
[104] SKIP
      https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_173589v1/shard-rkl=
-6/igt@kms_content_protection@atomic-hdcp14.html
[105] SKIP
      https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19102/shard-rkl-2/igt=
@kms_content_protection@atomic-hdcp14.html
[106] i915#7828
      https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/7828
[107] i915#11151
      https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11151
[108] SKIP
      https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_173589v1/shard-rkl=
-6/igt@kms_chamelium_frames@dp-crc-fast.html
[109] SKIP
      https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19102/shard-rkl-2/igt=
@kms_chamelium_frames@dp-crc-fast.html
[110] SKIP
      https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_173589v1/shard-rkl=
-4/igt@kms_chamelium_edid@hdmi-edid-stress-resolution-non-4k.html
[111] SKIP
      https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19102/shard-rkl-6/igt=
@kms_chamelium_edid@hdmi-edid-stress-resolution-non-4k.html
[112] i915#6095
      https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6095
[113] i915#14098
      https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14098
[114] SKIP
      https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_173589v1/shard-rkl=
-6/igt@kms_ccs@missing-ccs-buffer-4-tiled-mtl-mc-ccs.html
[115] SKIP
      https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19102/shard-rkl-2/igt=
@kms_ccs@missing-ccs-buffer-4-tiled-mtl-mc-ccs.html
[116] SKIP
      https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_173589v1/shard-rkl=
-4/igt@kms_ccs@crc-primary-suspend-4-tiled-dg2-rc-ccs@pipe-c-hdmi-a-2.html
[117] SKIP
      https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19102/shard-rkl-6/igt=
@kms_ccs@crc-primary-suspend-4-tiled-dg2-rc-ccs@pipe-c-hdmi-a-2.html
[118] i915#16866
      https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16866
[119] ABORT
      https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_173589v1/shard-rkl=
-3/igt@kms_ccs@crc-primary-rotation-180-4-tiled-dg2-rc-ccs@pipe-c-hdmi-a-2.=
html
[120] SKIP
      https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19102/shard-rkl-3/igt=
@kms_ccs@crc-primary-rotation-180-4-tiled-dg2-rc-ccs@pipe-c-hdmi-a-2.html
[121] SKIP
      https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_173589v1/shard-rkl=
-4/igt@kms_ccs@bad-rotation-90-4-tiled-mtl-mc-ccs@pipe-b-hdmi-a-2.html
[122] SKIP
      https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19102/shard-rkl-6/igt=
@kms_ccs@bad-rotation-90-4-tiled-mtl-mc-ccs@pipe-b-hdmi-a-2.html
[123] SKIP
      https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_173589v1/shard-rkl=
-4/igt@kms_big_fb@yf-tiled-16bpp-rotate-270.html
[124] SKIP
      https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19102/shard-rkl-6/igt=
@kms_big_fb@yf-tiled-16bpp-rotate-270.html
[125] i915#3638
      https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3638
[126] SKIP
      https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_173589v1/shard-rkl=
-4/igt@kms_big_fb@y-tiled-8bpp-rotate-90.html
[127] SKIP
      https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19102/shard-rkl-6/igt=
@kms_big_fb@y-tiled-8bpp-rotate-90.html
[128] SKIP
      https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_173589v1/shard-rkl=
-6/igt@kms_big_fb@linear-8bpp-rotate-270.html
[129] SKIP
      https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19102/shard-rkl-2/igt=
@kms_big_fb@linear-8bpp-rotate-270.html
[130] i915#5286
      https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5286
[131] SKIP
      https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_173589v1/shard-rkl=
-4/igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-180-hflip.html
[132] SKIP
      https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19102/shard-rkl-6/igt=
@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-180-hflip.html
[133] SKIP
      https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_173589v1/shard-rkl=
-6/igt@kms_big_fb@4-tiled-max-hw-stride-32bpp-rotate-0-async-flip.html
[134] SKIP
      https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19102/shard-rkl-2/igt=
@kms_big_fb@4-tiled-max-hw-stride-32bpp-rotate-0-async-flip.html
[135] i915#8399
      https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8399
[136] SKIP
      https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_173589v1/shard-rkl=
-6/igt@i915_pm_freq_api@freq-reset-multiple.html
[137] SKIP
      https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19102/shard-rkl-2/igt=
@i915_pm_freq_api@freq-reset-multiple.html
[138] i915#15479
      https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15479
[139] SKIP
      https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_173589v1/shard-rkl=
-6/igt@i915_module_load@fault-injection@__uc_init.html
[140] SKIP
      https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19102/shard-rkl-2/igt=
@i915_module_load@fault-injection@__uc_init.html
[141] i915#2527
      https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2527
[142] SKIP
      https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_173589v1/shard-rkl=
-4/igt@gen9_exec_parse@unaligned-jump.html
[143] SKIP
      https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19102/shard-rkl-6/igt=
@gen9_exec_parse@unaligned-jump.html
[144] SKIP
      https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_173589v1/shard-rkl=
-6/igt@gen9_exec_parse@bb-start-param.html
[145] SKIP
      https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19102/shard-rkl-2/igt=
@gen9_exec_parse@bb-start-param.html
[146] i915#3297
      https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3297
[147] SKIP
      https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_173589v1/shard-rkl=
-6/igt@gem_userptr_blits@invalid-mmap-offset-unsync.html
[148] SKIP
      https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19102/shard-rkl-2/igt=
@gem_userptr_blits@invalid-mmap-offset-unsync.html
[149] i915#3282
      https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3282
[150] SKIP
      https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_173589v1/shard-rkl=
-6/igt@gem_tiled_pread_pwrite.html
[151] SKIP
      https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19102/shard-rkl-2/igt=
@gem_tiled_pread_pwrite.html
[152] i915#4613
      https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4613
[153] SKIP
      https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_173589v1/shard-rkl=
-6/igt@gem_lmem_swapping@verify-ccs.html
[154] SKIP
      https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19102/shard-rkl-2/igt=
@gem_lmem_swapping@verify-ccs.html
[155] SKIP
      https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_173589v1/shard-rkl=
-4/igt@gem_lmem_swapping@parallel-random-verify.html
[156] SKIP
      https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19102/shard-rkl-6/igt=
@gem_lmem_swapping@parallel-random-verify.html
[157] i915#7582
      https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/7582
[158] SKIP
      https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_173589v1/shard-rkl=
-6/igt@gem_lmem_evict@dontneed-evict-race.html
[159] SKIP
      https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19102/shard-rkl-2/igt=
@gem_lmem_evict@dontneed-evict-race.html
[160] i915#3281
      https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3281
[161] SKIP
      https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_173589v1/shard-rkl=
-4/igt@gem_exec_reloc@basic-write-read-active.html
[162] SKIP
      https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19102/shard-rkl-6/igt=
@gem_exec_reloc@basic-write-read-active.html
[163] SKIP
      https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_173589v1/shard-rkl=
-6/igt@gem_exec_reloc@basic-cpu-gtt-noreloc.html
[164] SKIP
      https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19102/shard-rkl-2/igt=
@gem_exec_reloc@basic-cpu-gtt-noreloc.html
[165] i915#6344
      https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6344
[166] SKIP
      https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_173589v1/shard-rkl=
-4/igt@gem_exec_capture@capture-recoverable.html
[167] SKIP
      https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19102/shard-rkl-6/igt=
@gem_exec_capture@capture-recoverable.html
[168] i915#16931
      https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16931
[169] i915#16837
      https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16837
[170] ABORT
      https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_173589v1/shard-rkl=
-2/igt@gem_eio@kms.html
[171] ABORT
      https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19102/shard-rkl-3/igt=
@gem_eio@kms.html
[172] i915#6335
      https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6335
[173] SKIP
      https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_173589v1/shard-rkl=
-6/igt@gem_create@create-ext-cpu-access-sanity-check.html
[174] SKIP
      https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19102/shard-rkl-2/igt=
@gem_create@create-ext-cpu-access-sanity-check.html
[175] i915#11078
      https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11078
[176] SKIP
      https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_173589v1/shard-rkl=
-6/igt@device_reset@cold-reset-bound.html
[177] SKIP
      https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19102/shard-rkl-2/igt=
@device_reset@cold-reset-bound.html
[178] PASS
      https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_173589v1/shard-dg2=
-8/igt@kms_pm_rpm@system-suspend-idle.html
[179] i915#14419
      https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14419
[180] INCOMPLETE
      https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19102/shard-dg2-7/igt=
@kms_pm_rpm@system-suspend-idle.html
[181] PASS
      https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_173589v1/shard-dg2=
-1/igt@kms_pm_rpm@modeset-non-lpsp-stress-no-wait.html
[182] i915#15073
      https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15073
[183] SKIP
      https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19102/shard-dg2-4/igt=
@kms_pm_rpm@modeset-non-lpsp-stress-no-wait.html
[184] PASS
      https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_173589v1/shard-rkl=
-5/igt@kms_pm_rpm@dpms-lpsp.html
[185] SKIP
      https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19102/shard-rkl-7/igt=
@kms_pm_rpm@dpms-lpsp.html
[186] PASS
      https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_173589v1/shard-dg1=
-15/igt@kms_pm_rpm@dpms-lpsp.html
[187] SKIP
      https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19102/shard-dg1-16/ig=
t@kms_pm_rpm@dpms-lpsp.html
[188] PASS
      https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_173589v1/shard-rkl=
-2/igt@kms_plane_lowres@tiling-y.html
[189] ABORT
      https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19102/shard-rkl-4/igt=
@kms_plane_lowres@tiling-y.html
[190] PASS
      https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_173589v1/shard-rkl=
-3/igt@kms_pipe_crc_basic@suspend-read-crc@pipe-a-hdmi-a-2.html
[191] i915#13476
      https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13476
[192] INCOMPLETE
      https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19102/shard-rkl-4/igt=
@kms_pipe_crc_basic@suspend-read-crc@pipe-a-hdmi-a-2.html
[193] PASS
      https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_173589v1/shard-rkl=
-6/igt@kms_frontbuffer_tracking@fbchdr-1p-rte.html
[194] i915#15989
      https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15989
[195] SKIP
      https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19102/shard-rkl-2/igt=
@kms_frontbuffer_tracking@fbchdr-1p-rte.html
[196] PASS
      https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_173589v1/shard-glk=
8/igt@kms_frontbuffer_tracking@fbchdr-1p-primscrn-cur-indfb-move.html
[197] SKIP
      https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19102/shard-glk3/igt@=
kms_frontbuffer_tracking@fbchdr-1p-primscrn-cur-indfb-move.html
[198] PASS
      https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_173589v1/shard-tgl=
u-4/igt@kms_flip@wf_vblank-ts-check.html
[199] i915#14600
      https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14600
[200] FAIL
      https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19102/shard-tglu-5/ig=
t@kms_flip@wf_vblank-ts-check.html
[201] PASS
      https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_173589v1/shard-rkl=
-2/igt@kms_flip@flip-vs-suspend-interruptible.html
[202] i915#6113
      https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6113
[203] i915#16276
      https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16276
[204] INCOMPLETE
      https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19102/shard-rkl-3/igt=
@kms_flip@flip-vs-suspend-interruptible.html
[205] PASS
      https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_173589v1/shard-glk=
11/igt@kms_flip@flip-vs-expired-vblank-interruptible@b-hdmi-a1.html
[206] i915#13027
      https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13027
[207] FAIL
      https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19102/shard-glk11/igt=
@kms_flip@flip-vs-expired-vblank-interruptible@b-hdmi-a1.html
[208] PASS
      https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_173589v1/shard-glk=
6/igt@kms_flip@flip-vs-expired-vblank.html
[209] FAIL
      https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19102/shard-glk9/igt@=
kms_flip@flip-vs-expired-vblank.html
[210] PASS
      https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_173589v1/shard-dg1=
-17/igt@kms_flip@flip-vs-blocking-wf-vblank@a-hdmi-a4.html
[211] FAIL
      https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19102/shard-dg1-19/ig=
t@kms_flip@flip-vs-blocking-wf-vblank@a-hdmi-a4.html
[212] PASS
      https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_173589v1/shard-tgl=
u-4/igt@kms_flip@dpms-vs-vblank-race-interruptible@d-hdmi-a1.html
[213] i915#16876
      https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16876
[214] ABORT
      https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19102/shard-tglu-5/ig=
t@kms_flip@dpms-vs-vblank-race-interruptible@d-hdmi-a1.html
[215] PASS
      https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_173589v1/shard-tgl=
u-4/igt@kms_flip@dpms-vs-vblank-race-interruptible.html
[216] ABORT
      https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19102/shard-tglu-5/ig=
t@kms_flip@dpms-vs-vblank-race-interruptible.html
[217] PASS
      https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_173589v1/shard-tgl=
u-4/igt@kms_cursor_crc@cursor-onscreen-64x21@pipe-a-hdmi-a-1.html
[218] i915#13566
      https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13566
[219] FAIL
      https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19102/shard-tglu-5/ig=
t@kms_cursor_crc@cursor-onscreen-64x21@pipe-a-hdmi-a-1.html
[220] PASS
      https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_173589v1/shard-glk=
8/igt@kms_async_flips@alternate-sync-async-flip-atomic@pipe-b-hdmi-a-1.html
[221] i915#14888
      https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14888
[222] FAIL
      https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19102/shard-glk3/igt@=
kms_async_flips@alternate-sync-async-flip-atomic@pipe-b-hdmi-a-1.html
[223] PASS
      https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_173589v1/shard-rkl=
-2/igt@i915_suspend@sysfs-reader.html
[224] i915#4817
      https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4817
[225] INCOMPLETE
      https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19102/shard-rkl-6/igt=
@i915_suspend@sysfs-reader.html
[226] PASS
      https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_173589v1/shard-glk=
9/igt@i915_suspend@fence-restore-untiled.html
[227] i915#16182
      https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16182
[228] INCOMPLETE
      https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19102/shard-glk8/igt@=
i915_suspend@fence-restore-untiled.html
[229] PASS
      https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_173589v1/shard-rkl=
-4/igt@gem_workarounds@suspend-resume-fd.html
[230] i915#13356
      https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13356
[231] INCOMPLETE
      https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19102/shard-rkl-6/igt=
@gem_workarounds@suspend-resume-fd.html
[232] PASS
      https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_173589v1/shard-dg2=
-8/igt@gem_eio@in-flight-suspend.html
[233] i915#16784
      https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16784
[234] ABORT
      https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19102/shard-dg2-8/igt=
@gem_eio@in-flight-suspend.html
[235] PASS
      https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_173589v1/shard-rkl=
-8/igt@gem_eio@hibernate.html
[236] i915#7975
      https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/7975
[237] ABORT
      https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19102/shard-rkl-1/igt=
@gem_eio@hibernate.html
[238] i915#4818
      https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4818
[239] SKIP
      https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_173589v1/shard-dg1=
-16/igt@tools_test@sysfs_l3_parity.html
[240] SKIP
      https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_173589v1/shard-rkl=
-7/igt@prime_vgem@basic-write.html
[241] i915#16420
      https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16420
[242] SKIP
      https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_173589v1/shard-tgl=
u-3/igt@prime_udl@share-import.html
[243] i915#15778
      https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15778
[244] i915#13029
      https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13029
[245] ABORT
      https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_173589v1/shard-tgl=
u-1/igt@perf_pmu@module-unload.html
[246] ABORT
      https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_173589v1/shard-dg1=
-19/igt@perf_pmu@module-unload.html
[247] i915#4349
      https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4349
[248] FAIL
      https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_173589v1/shard-mtl=
p-8/igt@perf_pmu@busy-double-start.html
[249] PASS
      https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19102/shard-mtlp-3/ig=
t@perf_pmu@busy-double-start.html
[250] i915#2435
      https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2435
[251] SKIP
      https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_173589v1/shard-rkl=
-2/igt@perf@per-context-mode-unprivileged.html
[252] i915#9906
      https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9906
[253] SKIP
      https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_173589v1/shard-rkl=
-2/igt@kms_vrr@seamless-rr-switch-vrr.html
[254] SKIP
      https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_173589v1/shard-tgl=
u-10/igt@kms_vrr@seamless-rr-switch-drrs.html
[255] SKIP
      https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_173589v1/shard-dg2=
-8/igt@kms_vrr@max-min.html
[256] i915#12276
      https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12276
[257] INCOMPLETE
      https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_173589v1/shard-glk=
11/igt@kms_vblank@ts-continuation-suspend.html
[258] INCOMPLETE
      https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_173589v1/shard-rkl=
-6/igt@kms_vblank@ts-continuation-dpms-suspend@pipe-a-hdmi-a-2.html
[259] INCOMPLETE
      https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_173589v1/shard-rkl=
-6/igt@kms_vblank@ts-continuation-dpms-suspend.html
[260] PASS
      https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19102/shard-rkl-2/igt=
@kms_vblank@ts-continuation-dpms-suspend.html
[261] i915#10959
      https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/10959
[262] FAIL
      https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_173589v1/shard-glk=
4/igt@kms_tiled_display@basic-test-pattern.html
[263] SKIP
      https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_173589v1/shard-rkl=
-2/igt@kms_scaling_modes@scaling-mode-none.html
[264] SKIP
      https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_173589v1/shard-dg1=
-16/igt@kms_rotation_crc@primary-yf-tiled-reflect-x-270.html
[265] SKIP
      https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_173589v1/shard-tgl=
u-1/igt@kms_rotation_crc@primary-yf-tiled-reflect-x-0.html
[266] SKIP
      https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_173589v1/shard-tgl=
u-10/igt@kms_rotation_crc@primary-4-tiled-reflect-x-180.html
[267] SKIP
      https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_173589v1/shard-tgl=
u-4/igt@kms_psr_stress_test@invalidate-primary-flip-overlay.html
[268] SKIP
      https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_173589v1/shard-tgl=
u-1/igt@kms_psr_stress_test@flip-primary-invalidate-overlay.html
[269] SKIP
      https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_173589v1/shard-tgl=
u-1/igt@kms_psr@psr2-sprite-mmap-gtt.html
[270] SKIP
      https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_173589v1/shard-dg1=
-19/igt@kms_psr@psr2-sprite-mmap-gtt.html
[271] SKIP
      https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_173589v1/shard-tgl=
u-3/igt@kms_psr@psr2-cursor-plane-onoff.html
[272] SKIP
      https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_173589v1/shard-rkl=
-7/igt@kms_psr@psr2-cursor-mmap-gtt.html
[273] SKIP
      https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_173589v1/shard-dg2=
-8/igt@kms_psr@pr-primary-blt.html
[274] i915#9683
      https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9683
[275] SKIP
      https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_173589v1/shard-tgl=
u-10/igt@kms_psr2_su@page_flip-xrgb8888.html
[276] SKIP
      https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_173589v1/shard-tgl=
u-1/igt@kms_psr2_su@page_flip-nv12.html
[277] SKIP
      https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_173589v1/shard-glk=
11/igt@kms_psr2_sf@psr2-overlay-plane-move-continuous-exceed-fully-sf.html
[278] SKIP
      https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_173589v1/shard-tgl=
u-1/igt@kms_psr2_sf@pr-overlay-plane-move-continuous-exceed-sf.html
[279] SKIP
      https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_173589v1/shard-glk=
10/igt@kms_psr2_sf@pr-overlay-plane-move-continuous-exceed-sf.html
[280] SKIP
      https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_173589v1/shard-glk=
4/igt@kms_psr2_sf@fbc-psr2-cursor-plane-move-continuous-sf.html
[281] SKIP
      https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_173589v1/shard-dg1=
-16/igt@kms_psr2_sf@fbc-psr2-cursor-plane-move-continuous-exceed-sf.html
[282] SKIP
      https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_173589v1/shard-rkl=
-2/igt@kms_psr2_sf@fbc-pr-primary-plane-update-sf-dmg-area.html
[283] SKIP
      https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_173589v1/shard-tgl=
u-4/igt@kms_psr2_sf@fbc-pr-cursor-plane-update-sf.html
[284] SKIP
      https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_173589v1/shard-dg2=
-8/igt@kms_psr2_sf@fbc-pr-cursor-plane-move-continuous-exceed-sf.html
[285] SKIP
      https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_173589v1/shard-rkl=
-2/igt@kms_pm_rpm@modeset-non-lpsp-stress-no-wait.html
[286] PASS
      https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19102/shard-rkl-4/igt=
@kms_pm_rpm@modeset-non-lpsp-stress-no-wait.html
[287] SKIP
      https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_173589v1/shard-dg1=
-15/igt@kms_pm_rpm@modeset-non-lpsp-stress.html
[288] PASS
      https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19102/shard-dg1-12/ig=
t@kms_pm_rpm@modeset-non-lpsp-stress.html
[289] SKIP
      https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_173589v1/shard-dg2=
-4/igt@kms_pm_rpm@modeset-non-lpsp.html
[290] PASS
      https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19102/shard-dg2-5/igt=
@kms_pm_rpm@modeset-non-lpsp.html
[291] i915#4077
      https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4077
[292] SKIP
      https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_173589v1/shard-dg1=
-16/igt@kms_pm_rpm@fences.html
[293] SKIP
      https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_173589v1/shard-tgl=
u-10/igt@kms_pm_rpm@dpms-non-lpsp.html
[294] SKIP
      https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_173589v1/shard-rkl=
-6/igt@kms_pm_rpm@dpms-mode-unset-lpsp.html
[295] PASS
      https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19102/shard-rkl-2/igt=
@kms_pm_rpm@dpms-mode-unset-lpsp.html
[296] SKIP
      https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_173589v1/shard-dg1=
-16/igt@kms_pm_lpsp@kms-lpsp.html
[297] SKIP
      https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_173589v1/shard-dg1=
-16/igt@kms_pm_dc@dc6-psr.html
[298] i915#16479
      https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16479
[299] FAIL
      https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_173589v1/shard-tgl=
u-3/igt@kms_pm_dc@dc6-dpms.html
[300] i915#16914
      https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16914
[301] SKIP
      https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_173589v1/shard-tgl=
u-1/igt@kms_pm_dc@dc5-psr-suspend-resume.html
[302] i915#5354
      https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5354
[303] i915#12343
      https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12343
[304] SKIP
      https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_173589v1/shard-rkl=
-4/igt@kms_pm_backlight@fade-with-suspend.html
[305] i915#9812
      https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9812
[306] SKIP
      https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_173589v1/shard-tgl=
u-10/igt@kms_pm_backlight@fade-with-dpms.html
[307] SKIP
      https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_173589v1/shard-dg2=
-8/igt@kms_pm_backlight@brightness-with-dpms.html
[308] i915#15329
      https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15329
[309] SKIP
      https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_173589v1/shard-tgl=
u-1/igt@kms_plane_scaling@plane-downscale-factor-0-5-with-rotation@pipe-d.h=
tml
[310] i915#14259
      https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14259
[311] SKIP
      https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_173589v1/shard-tgl=
u-10/igt@kms_plane_multiple@tiling-yf.html
[312] i915#13958
      https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13958
[313] SKIP
      https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_173589v1/shard-dg2=
-8/igt@kms_plane_multiple@2x-tiling-x.html
[314] SKIP
      https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_173589v1/shard-rkl=
-2/igt@kms_plane_multiple@2x-tiling-4.html
[315] i915#15912
      https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15912
[316] FAIL
      https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_173589v1/shard-rkl=
-2/igt@kms_plane_cursor@viewport@pipe-a-hdmi-a-1-size-64.html
[317] i915#15913
      https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15913
[318] FAIL
      https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_173589v1/shard-rkl=
-2/igt@kms_plane_cursor@viewport@pipe-a-hdmi-a-1-size-128.html
[319] i915#7862
      https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/7862
[320] FAIL
      https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_173589v1/shard-glk=
5/igt@kms_plane_alpha_blend@alpha-basic@pipe-a-hdmi-a-1.html
[321] i915#12178
      https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12178
[322] FAIL
      https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_173589v1/shard-glk=
5/igt@kms_plane_alpha_blend@alpha-basic.html
[323] i915#16112
      https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16112
[324] SKIP
      https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_173589v1/shard-dg1=
-16/igt@kms_plane@planar-pixel-format-settings@nv12-tile4-src-y.html
[325] SKIP
      https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_173589v1/shard-rkl=
-4/igt@kms_plane@pixel-format-yf-tiled-modifier.html
[326] SKIP
      https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_173589v1/shard-dg2=
-8/igt@kms_plane@pixel-format-yf-tiled-ccs-modifier-source-clamping.html
[327] i915#16386
      https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16386
[328] SKIP
      https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_173589v1/shard-dg1=
-16/igt@kms_plane@pixel-format-y-tiled-modifier@pipe-b-plane-7.html
[329] SKIP
      https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_173589v1/shard-tgl=
u-1/igt@kms_plane@pixel-format-y-tiled-gen12-mc-ccs-modifier.html
[330] SKIP
      https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_173589v1/shard-dg1=
-16/igt@kms_plane@pixel-format-y-tiled-ccs-modifier.html
[331] SKIP
      https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_173589v1/shard-tgl=
u-3/igt@kms_plane@pixel-format-4-tiled-mtl-mc-ccs-modifier-source-clamping.=
html
[332] SKIP
      https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_173589v1/shard-tgl=
u-10/igt@kms_pipe_stress@stress-xrgb8888-4tiled.html
[333] i915#12756
      https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12756
[334] INCOMPLETE
      https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_173589v1/shard-rkl=
-3/igt@kms_pipe_crc_basic@suspend-read-crc@pipe-c-hdmi-a-2.html
[335] i915#6301
      https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6301
[336] SKIP
      https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_173589v1/shard-rkl=
-2/igt@kms_panel_fitting@atomic-fastset.html
[337] i915#16451
      https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16451
[338] SKIP
      https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_173589v1/shard-rkl=
-2/igt@kms_mst@mst-suspend-read-crc.html
[339] SKIP
      https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_173589v1/shard-dg2=
-8/igt@kms_joiner@invalid-modeset-ultra-joiner.html
[340] SKIP
      https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_173589v1/shard-dg1=
-16/igt@kms_joiner@basic-force-big-joiner.html
[341] i915#15460
      https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15460
[342] SKIP
      https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_173589v1/shard-rkl=
-8/igt@kms_joiner@basic-big-joiner.html
[343] SKIP
      https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_173589v1/shard-dg1=
-16/igt@kms_joiner@basic-big-joiner.html
[344] i915#8228
      https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8228
[345] i915#16644
      https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16644
[346] SKIP
      https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_173589v1/shard-rkl=
-2/igt@kms_hdr@static-toggle.html
[347] SKIP
      https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_173589v1/shard-tgl=
u-1/igt@kms_hdr@invalid-metadata-sizes.html
[348] i915#12713
      https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12713
[349] SKIP
      https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_173589v1/shard-rkl=
-7/igt@kms_hdr@brightness-with-hdr.html
[350] SKIP
      https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_173589v1/shard-rkl=
-4/igt@kms_hdr@bpc-switch.html
[351] PASS
      https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19102/shard-rkl-6/igt=
@kms_hdr@bpc-switch.html
[352] SKIP
      https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_173589v1/shard-tgl=
u-10/igt@kms_hdr@bpc-switch.html
[353] SKIP
      https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_173589v1/shard-dg1=
-16/igt@kms_frontbuffer_tracking@psrhdr-rgb565-draw-render.html
[354] i915#15991
      https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15991
[355] SKIP
      https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_173589v1/shard-dg2=
-8/igt@kms_frontbuffer_tracking@psrhdr-2p-scndscrn-shrfb-plflip-blt.html
[356] SKIP
      https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_173589v1/shard-dg1=
-16/igt@kms_frontbuffer_tracking@psrhdr-2p-primscrn-spr-indfb-onoff.html
[357] SKIP
      https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_173589v1/shard-rkl=
-2/igt@kms_frontbuffer_tracking@psrhdr-1p-primscrn-spr-indfb-move.html
[358] SKIP
      https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_173589v1/shard-dg2=
-8/igt@kms_frontbuffer_tracking@psr-2p-scndscrn-pri-shrfb-draw-blt.html
[359] SKIP
      https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_173589v1/shard-glk=
11/igt@kms_frontbuffer_tracking@psr-2p-primscrn-indfb-msflip-blt.html
[360] SKIP
      https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_173589v1/shard-tgl=
u-3/igt@kms_frontbuffer_tracking@psr-1p-primscrn-pri-shrfb-draw-pwrite.html
[361] i915#15104
      https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15104
[362] SKIP
      https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_173589v1/shard-dg1=
-16/igt@kms_frontbuffer_tracking@psr-1p-offscreen-pri-shrfb-draw-mmap-gtt.h=
tml
[363] SKIP
      https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_173589v1/shard-dg1=
-16/igt@kms_frontbuffer_tracking@hdr-modesetfrombusy.html
[364] SKIP
      https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_173589v1/shard-rkl=
-4/igt@kms_frontbuffer_tracking@hdr-farfromfence-mmap-gtt.html
[365] PASS
      https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19102/shard-rkl-6/igt=
@kms_frontbuffer_tracking@hdr-farfromfence-mmap-gtt.html
[366] SKIP
      https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_173589v1/shard-tgl=
u-1/igt@kms_frontbuffer_tracking@hdr-1p-primscrn-pri-shrfb-draw-mmap-cpu.ht=
ml
[367] SKIP
      https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_173589v1/shard-dg2=
-8/igt@kms_frontbuffer_tracking@fbcpsrhdr-2p-scndscrn-pri-indfb-draw-mmap-w=
c.html
[368] SKIP
      https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_173589v1/shard-tgl=
u-1/igt@kms_frontbuffer_tracking@fbcpsrhdr-2p-primscrn-shrfb-plflip-blt.htm=
l
[369] SKIP
      https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_173589v1/shard-dg1=
-16/igt@kms_frontbuffer_tracking@fbcpsrhdr-2p-primscrn-cur-indfb-draw-mmap-=
gtt.html
[370] SKIP
      https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_173589v1/shard-glk=
4/igt@kms_frontbuffer_tracking@fbcpsrhdr-1p-primscrn-cur-indfb-draw-mmap-wc=
.html
[371] SKIP
      https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_173589v1/shard-tgl=
u-1/igt@kms_frontbuffer_tracking@fbcpsrhdr-1p-offscreen-pri-shrfb-draw-mmap=
-cpu.html
[372] i915#5439
      https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5439
[373] SKIP
      https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_173589v1/shard-rkl=
-2/igt@kms_frontbuffer_tracking@fbcpsr-tiling-4.html
[374] SKIP
      https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_173589v1/shard-tgl=
u-10/igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-spr-indfb-fullscreen.h=
tml
[375] SKIP
      https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_173589v1/shard-rkl=
-8/igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-pri-shrfb-draw-mmap-wc.h=
tml
[376] SKIP
      https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_173589v1/shard-dg1=
-16/igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-pri-shrfb-draw-mmap-wc.=
html
[377] SKIP
      https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_173589v1/shard-glk=
10/igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-pri-indfb-draw-mmap-gtt.=
html
[378] SKIP
      https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_173589v1/shard-dg2=
-8/igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-pri-indfb-draw-pwrite.ht=
ml
[379] SKIP
      https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_173589v1/shard-glk=
9/igt@kms_frontbuffer_tracking@fbchdr-2p-primscrn-spr-indfb-draw-mmap-cpu.h=
tml
[380] PASS
      https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19102/shard-glk8/igt@=
kms_frontbuffer_tracking@fbchdr-2p-primscrn-spr-indfb-draw-mmap-cpu.html
[381] SKIP
      https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_173589v1/shard-rkl=
-4/igt@kms_frontbuffer_tracking@fbchdr-1p-primscrn-spr-indfb-onoff.html
[382] SKIP
      https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_173589v1/shard-dg2=
-8/igt@kms_frontbuffer_tracking@fbchdr-1p-primscrn-spr-indfb-draw-render.ht=
ml
[383] SKIP
      https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_173589v1/shard-tgl=
u-4/igt@kms_frontbuffer_tracking@fbchdr-1p-offscreen-pri-indfb-draw-mmap-wc=
.html
[384] i915#10056
      https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/10056
[385] INCOMPLETE
      https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_173589v1/shard-rkl=
-7/igt@kms_frontbuffer_tracking@fbc-suspend.html
[386] PASS
      https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19102/shard-rkl-7/igt=
@kms_frontbuffer_tracking@fbc-suspend.html
[387] i915#16593
      https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16593
[388] INCOMPLETE
      https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_173589v1/shard-glk=
10/igt@kms_frontbuffer_tracking@fbc-suspend.html
[389] SKIP
      https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_173589v1/shard-dg2=
-8/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-spr-indfb-draw-mmap-wc.html
[390] SKIP
      https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_173589v1/shard-tgl=
u-1/igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-32bpp-4tiledg2rcccs-upscali=
ng.html
[391] SKIP
      https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_173589v1/shard-rkl=
-2/igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-16bpp-4tile-upscaling.html
[392] SKIP
      https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_173589v1/shard-tgl=
u-10/igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-16bpp-4tile-downscaling.ht=
ml
[393] SKIP
      https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_173589v1/shard-dg2=
-8/igt@kms_flip_scaled_crc@flip-32bpp-yftile-to-32bpp-yftileccs-upscaling.h=
tml
[394] SKIP
      https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_173589v1/shard-dg1=
-16/igt@kms_flip_scaled_crc@flip-32bpp-4tile-to-64bpp-4tile-upscaling.html
[395] i915#10826
      https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/10826
[396] FAIL
      https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_173589v1/shard-dg1=
-18/igt@kms_flip@flip-vs-wf_vblank-interruptible.html
[397] PASS
      https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19102/shard-dg1-15/ig=
t@kms_flip@flip-vs-wf_vblank-interruptible.html
[398] i915#16925
      https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16925
[399] i915#15132
      https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15132
[400] ABORT
      https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_173589v1/shard-rkl=
-1/igt@kms_flip@flip-vs-suspend@a-hdmi-a2.html
[401] i915#12745
      https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12745
[402] INCOMPLETE
      https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_173589v1/shard-glk=
10/igt@kms_flip@flip-vs-suspend@a-hdmi-a1.html
[403] i915#16472
      https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16472
[404] INCOMPLETE
      https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_173589v1/shard-mtl=
p-3/igt@kms_flip@flip-vs-suspend-interruptible.html
[405] PASS
      https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19102/shard-mtlp-4/ig=
t@kms_flip@flip-vs-suspend-interruptible.html
[406] ABORT
      https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_173589v1/shard-rkl=
-1/igt@kms_flip@flip-vs-suspend.html
[407] PASS
      https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19102/shard-rkl-8/igt=
@kms_flip@flip-vs-suspend.html
[408] i915#4839
      https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4839
[409] INCOMPLETE
      https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_173589v1/shard-glk=
10/igt@kms_flip@flip-vs-suspend.html
[410] FAIL
      https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_173589v1/shard-dg2=
-4/igt@kms_flip@flip-vs-expired-vblank-interruptible@c-hdmi-a1.html
[411] FAIL
      https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_173589v1/shard-glk=
11/igt@kms_flip@flip-vs-expired-vblank-interruptible@a-hdmi-a2.html
[412] PASS
      https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19102/shard-glk11/igt=
@kms_flip@flip-vs-expired-vblank-interruptible@a-hdmi-a2.html
[413] FAIL
      https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_173589v1/shard-dg2=
-4/igt@kms_flip@flip-vs-expired-vblank-interruptible.html
[414] PASS
      https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19102/shard-dg2-6/igt=
@kms_flip@flip-vs-expired-vblank-interruptible.html
[415] FAIL
      https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_173589v1/shard-snb=
5/igt@kms_flip@flip-vs-dpms-on-nop-interruptible.html
[416] PASS
      https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19102/shard-snb7/igt@=
kms_flip@flip-vs-dpms-on-nop-interruptible.html
[417] FAIL
      https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_173589v1/shard-dg1=
-17/igt@kms_flip@flip-vs-blocking-wf-vblank@b-hdmi-a4.html
[418] PASS
      https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19102/shard-dg1-19/ig=
t@kms_flip@flip-vs-blocking-wf-vblank@b-hdmi-a4.html
[419] SKIP
      https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_173589v1/shard-rkl=
-2/igt@kms_flip@2x-wf_vblank-ts-check.html
[420] SKIP
      https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_173589v1/shard-dg1=
-16/igt@kms_flip@2x-single-buffer-flip-vs-dpms-off-vs-modeset.html
[421] i915#3637
      https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3637
[422] SKIP
      https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_173589v1/shard-tgl=
u-1/igt@kms_flip@2x-flip-vs-panning-vs-hang.html
[423] i915#8381
      https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8381
[424] SKIP
      https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_173589v1/shard-dg1=
-16/igt@kms_flip@2x-flip-vs-fences-interruptible.html
[425] SKIP
      https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_173589v1/shard-dg2=
-8/igt@kms_flip@2x-absolute-wf_vblank-interruptible.html
[426] SKIP
      https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_173589v1/shard-tgl=
u-4/igt@kms_flip@2x-absolute-wf_vblank.html
[427] i915#4881
      https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4881
[428] SKIP
      https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_173589v1/shard-dg2=
-8/igt@kms_fence_pin_leak.html
[429] SKIP
      https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_173589v1/shard-dg2=
-8/igt@kms_feature_discovery@psr1.html
[430] i915#16081
      https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16081
[431] SKIP
      https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_173589v1/shard-tgl=
u-1/igt@kms_feature_discovery@display-4x.html
[432] SKIP
      https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_173589v1/shard-rkl=
-4/igt@kms_feature_discovery@display-3x.html
[433] SKIP
      https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_173589v1/shard-tgl=
u-10/igt@kms_feature_discovery@display-3x.html
[434] i915#16680
      https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16680
[435] SKIP
      https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_173589v1/shard-rkl=
-7/igt@kms_fbcon_fbt@psr.html
[436] SKIP
      https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_173589v1/shard-tgl=
u-1/igt@kms_dsc@dsc-with-output-formats-bigjoiner.html
[437] SKIP
      https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_173589v1/shard-dg2=
-8/igt@kms_dsc@dsc-with-formats-ultrajoiner.html
[438] SKIP
      https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_173589v1/shard-dg1=
-16/igt@kms_dsc@dsc-with-bpc-bigjoiner.html
[439] SKIP
      https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_173589v1/shard-tgl=
u-4/igt@kms_dsc@dsc-basic-ultrajoiner.html
[440] SKIP
      https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_173589v1/shard-rkl=
-2/igt@kms_dsc@dsc-basic.html
[441] i915#8812
      https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8812
[442] SKIP
      https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_173589v1/shard-dg2=
-8/igt@kms_draw_crc@draw-method-mmap-gtt.html
[443] i915#16870
      https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16870
[444] SKIP
      https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_173589v1/shard-tgl=
u-3/igt@kms_dp_linktrain_fallback@uhbr-to-hbr-fallback.html
[445] i915#13707
      https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13707
[446] SKIP
      https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_173589v1/shard-tgl=
u-1/igt@kms_dp_linktrain_fallback@dsc-fallback.html
[447] i915#16867
      https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16867
[448] SKIP
      https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_173589v1/shard-tgl=
u-1/igt@kms_dp_linktrain_fallback@dp-fallback.html
[449] i915#13748
      https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13748
[450] SKIP
      https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_173589v1/shard-dg1=
-16/igt@kms_dp_link_training@uhbr-sst.html
[451] i915#13749
      https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13749
[452] SKIP
      https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_173589v1/shard-rkl=
-7/igt@kms_dp_link_training@non-uhbr-sst.html
[453] SKIP
      https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_173589v1/shard-dg1=
-16/igt@kms_dither@fb-8bpc-vs-panel-8bpc.html
[454] i915#9067
      https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9067
[455] SKIP
      https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_173589v1/shard-tgl=
u-1/igt@kms_cursor_legacy@modeset-atomic-cursor-hotspot.html
[456] i915#4103
      https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4103
[457] SKIP
      https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_173589v1/shard-tgl=
u-1/igt@kms_cursor_legacy@basic-busy-flip-before-cursor-varying-size.html
[458] SKIP
      https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_173589v1/shard-dg1=
-19/igt@kms_cursor_legacy@basic-busy-flip-before-cursor-varying-size.html
[459] SKIP
      https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_173589v1/shard-rkl=
-2/igt@kms_cursor_legacy@2x-flip-vs-cursor-legacy.html
[460] i915#16685
      https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16685
[461] DMESG-WARN
      https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_173589v1/shard-tgl=
u-8/igt@kms_cursor_edge_walk@64x64-right-edge.html
[462] PASS
      https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19102/shard-tglu-2/ig=
t@kms_cursor_edge_walk@64x64-right-edge.html
[463] i915#14152
      https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14152
[464] i915#12358
      https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12358
[465] INCOMPLETE
      https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_173589v1/shard-glk=
8/igt@kms_cursor_crc@cursor-suspend@pipe-a-hdmi-a-1.html
[466] i915#7882
      https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/7882
[467] INCOMPLETE
      https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_173589v1/shard-glk=
8/igt@kms_cursor_crc@cursor-suspend.html
[468] FAIL
      https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_173589v1/shard-rkl=
-2/igt@kms_cursor_crc@cursor-sliding-128x42@pipe-a-hdmi-a-1.html
[469] FAIL
      https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_173589v1/shard-tgl=
u-2/igt@kms_cursor_crc@cursor-sliding-128x42@pipe-a-hdmi-a-1.html
[470] PASS
      https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19102/shard-tglu-4/ig=
t@kms_cursor_crc@cursor-sliding-128x42@pipe-a-hdmi-a-1.html
[471] SKIP
      https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_173589v1/shard-tgl=
u-4/igt@kms_cursor_crc@cursor-rapid-movement-512x512.html
[472] SKIP
      https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_173589v1/shard-tgl=
u-10/igt@kms_cursor_crc@cursor-rapid-movement-32x10.html
[473] SKIP
      https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_173589v1/shard-rkl=
-7/igt@kms_cursor_crc@cursor-random-512x170.html
[474] SKIP
      https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_173589v1/shard-tgl=
u-1/igt@kms_cursor_crc@cursor-onscreen-32x32.html
[475] FAIL
      https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_173589v1/shard-rkl=
-8/igt@kms_cursor_crc@cursor-onscreen-128x42.html
[476] PASS
      https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19102/shard-rkl-8/igt=
@kms_cursor_crc@cursor-onscreen-128x42.html
[477] SKIP
      https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_173589v1/shard-dg1=
-16/igt@kms_cursor_crc@cursor-offscreen-512x170.html
[478] SKIP
      https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_173589v1/shard-rkl=
-4/igt@kms_content_protection@uevent-hdcp14.html
[479] SKIP
      https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_173589v1/shard-tgl=
u-1/igt@kms_content_protection@type1.html
[480] SKIP
      https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_173589v1/shard-tgl=
u-3/igt@kms_content_protection@legacy-hdcp14.html
[481] i915#15330
      https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15330
[482] SKIP
      https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_173589v1/shard-dg2=
-8/igt@kms_content_protection@dp-mst-type-1-suspend-resume.html
[483] i915#3299
      https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3299
[484] i915#3116
      https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3116
[485] SKIP
      https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_173589v1/shard-tgl=
u-1/igt@kms_content_protection@dp-mst-type-1.html
[486] SKIP
      https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_173589v1/shard-dg2=
-8/igt@kms_content_protection@dp-mst-type-0.html
[487] SKIP
      https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_173589v1/shard-rkl=
-8/igt@kms_content_protection@dp-mst-lic-type-1.html
[488] SKIP
      https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_173589v1/shard-dg1=
-16/igt@kms_content_protection@dp-mst-lic-type-1.html
[489] SKIP
      https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_173589v1/shard-tgl=
u-3/igt@kms_content_protection@dp-mst-lic-type-0.html
[490] i915#12655
      https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12655
[491] SKIP
      https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_173589v1/shard-dg2=
-8/igt@kms_color@deep-color.html
[492] SKIP
      https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_173589v1/shard-tgl=
u-3/igt@kms_chamelium_hpd@vga-hpd-for-each-pipe.html
[493] SKIP
      https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_173589v1/shard-rkl=
-8/igt@kms_chamelium_hpd@vga-hpd-fast.html
[494] SKIP
      https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_173589v1/shard-dg1=
-16/igt@kms_chamelium_hpd@vga-hpd-fast.html
[495] SKIP
      https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_173589v1/shard-tgl=
u-1/igt@kms_chamelium_edid@dp-edid-change-during-suspend.html
[496] i915#16471
      https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16471
[497] SKIP
      https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_173589v1/shard-rkl=
-4/igt@kms_chamelium_color_pipeline@plane-lut1d-pre-ctm3x4.html
[498] SKIP
      https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_173589v1/shard-tgl=
u-10/igt@kms_chamelium_color_pipeline@plane-lut1d-pre-ctm3x4.html
[499] SKIP
      https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_173589v1/shard-dg1=
-16/igt@kms_chamelium_color_pipeline@plane-lut1d-ctm3x4-lut1d.html
[500] SKIP
      https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_173589v1/shard-tgl=
u-1/igt@kms_chamelium_color_pipeline@plane-lut1d-ctm3x4.html
[501] SKIP
      https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_173589v1/shard-dg2=
-8/igt@kms_chamelium_color@ctm-green-to-red.html
[502] SKIP
      https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_173589v1/shard-rkl=
-7/igt@kms_chamelium_audio@hdmi-audio-after-suspend.html
[503] SKIP
      https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_173589v1/shard-dg2=
-8/igt@kms_chamelium_audio@dp-audio-edid.html
[504] SKIP
      https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_173589v1/shard-tgl=
u-1/igt@kms_chamelium_audio@dp-audio-after-suspend.html
[505] i915#13783
      https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13783
[506] SKIP
      https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_173589v1/shard-dg2=
-4/igt@kms_cdclk@plane-scaling@pipe-d-hdmi-a-1.html
[507] i915#3742
      https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3742
[508] SKIP
      https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_173589v1/shard-rkl=
-2/igt@kms_cdclk@mode-transition.html
[509] SKIP
      https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_173589v1/shard-rkl=
-3/igt@kms_ccs@random-ccs-data-4-tiled-mtl-rc-ccs@pipe-b-hdmi-a-2.html
[510] SKIP
      https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_173589v1/shard-dg1=
-14/igt@kms_ccs@missing-ccs-buffer-yf-tiled-ccs@pipe-b-hdmi-a-1.html
[511] i915#10434
      https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/10434
[512] i915#10307
      https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/10307
[513] SKIP
      https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_173589v1/shard-dg2=
-4/igt@kms_ccs@missing-ccs-buffer-y-tiled-ccs@pipe-d-hdmi-a-1.html
[514] SKIP
      https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_173589v1/shard-tgl=
u-4/igt@kms_ccs@missing-ccs-buffer-4-tiled-mtl-mc-ccs@pipe-d-hdmi-a-1.html
[515] SKIP
      https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_173589v1/shard-dg2=
-1/igt@kms_ccs@crc-sprite-planes-basic-4-tiled-mtl-mc-ccs@pipe-a-hdmi-a-3.h=
tml
[516] i915#12313
      https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12313
[517] SKIP
      https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_173589v1/shard-rkl=
-4/igt@kms_ccs@crc-sprite-planes-basic-4-tiled-lnl-ccs.html
[518] SKIP
      https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_173589v1/shard-tgl=
u-10/igt@kms_ccs@crc-sprite-planes-basic-4-tiled-bmg-ccs.html
[519] SKIP
      https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_173589v1/shard-rkl=
-3/igt@kms_ccs@crc-primary-suspend-yf-tiled-ccs@pipe-c-hdmi-a-2.html
[520] i915#15582
      https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15582
[521] INCOMPLETE
      https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_173589v1/shard-glk=
5/igt@kms_ccs@crc-primary-suspend-yf-tiled-ccs.html
[522] SKIP
      https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_173589v1/shard-dg2=
-4/igt@kms_ccs@crc-primary-suspend-y-tiled-gen12-rc-ccs-cc@pipe-d-hdmi-a-1.=
html
[523] i915#12805
      https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12805
[524] SKIP
      https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_173589v1/shard-tgl=
u-10/igt@kms_ccs@crc-primary-suspend-4-tiled-lnl-ccs.html
[525] SKIP
      https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_173589v1/shard-tgl=
u-1/igt@kms_ccs@crc-primary-suspend-4-tiled-bmg-ccs.html
[526] SKIP
      https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_173589v1/shard-tgl=
u-1/igt@kms_ccs@crc-primary-rotation-180-4-tiled-mtl-rc-ccs-cc@pipe-b-hdmi-=
a-1.html
[527] SKIP
      https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_173589v1/shard-dg1=
-16/igt@kms_ccs@crc-primary-basic-4-tiled-lnl-ccs.html
[528] SKIP
      https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_173589v1/shard-tgl=
u-1/igt@kms_ccs@bad-rotation-90-4-tiled-lnl-ccs.html
[529] SKIP
      https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_173589v1/shard-rkl=
-6/igt@kms_ccs@bad-rotation-90-4-tiled-dg2-rc-ccs-cc@pipe-c-hdmi-a-2.html
[530] SKIP
      https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_173589v1/shard-rkl=
-6/igt@kms_ccs@bad-rotation-90-4-tiled-dg2-rc-ccs-cc@pipe-a-hdmi-a-2.html
[531] i915#5190
      https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5190
[532] i915#4538
      https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4538
[533] SKIP
      https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_173589v1/shard-dg2=
-8/igt@kms_big_fb@yf-tiled-8bpp-rotate-0.html
[534] SKIP
      https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_173589v1/shard-dg1=
-16/igt@kms_big_fb@yf-tiled-16bpp-rotate-270.html
[535] SKIP
      https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_173589v1/shard-dg1=
-16/igt@kms_big_fb@y-tiled-8bpp-rotate-270.html
[536] SKIP
      https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_173589v1/shard-rkl=
-7/igt@kms_big_fb@linear-max-hw-stride-32bpp-rotate-0-hflip.html
[537] SKIP
      https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_173589v1/shard-rkl=
-2/igt@kms_big_fb@linear-16bpp-rotate-90.html
[538] SKIP
      https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_173589v1/shard-tgl=
u-1/igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-180-async-flip.html
[539] SKIP
      https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_173589v1/shard-dg1=
-19/igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-180-async-flip.html
[540] SKIP
      https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_173589v1/shard-tgl=
u-4/igt@kms_big_fb@4-tiled-max-hw-stride-32bpp-rotate-0-async-flip.html
[541] SKIP
      https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_173589v1/shard-rkl=
-2/igt@kms_big_fb@4-tiled-16bpp-rotate-0.html
[542] i915#9531
      https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9531
[543] SKIP
      https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_173589v1/shard-rkl=
-7/igt@kms_atomic@plane-primary-overlay-mutable-zpos.html
[544] i915#12761
      https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12761
[545] INCOMPLETE
      https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_173589v1/shard-rkl=
-6/igt@kms_async_flips@async-flip-suspend-resume@pipe-a-hdmi-a-2.html
[546] INCOMPLETE
      https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_173589v1/shard-rkl=
-6/igt@kms_async_flips@async-flip-suspend-resume.html
[547] PASS
      https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19102/shard-rkl-2/igt=
@kms_async_flips@async-flip-suspend-resume.html
[548] FAIL
      https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_173589v1/shard-glk=
8/igt@kms_async_flips@alternate-sync-async-flip-atomic@pipe-b-hdmi-a-2.html
[549] PASS
      https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19102/shard-glk3/igt@=
kms_async_flips@alternate-sync-async-flip-atomic@pipe-b-hdmi-a-2.html
[550] i915#12712
      https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12712
[551] i915#12454
      https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12454
[552] SKIP
      https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_173589v1/shard-tgl=
u-3/igt@kms_addfb_basic@invalid-smem-bo-on-discrete.html
[553] i915#4212
      https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4212
[554] SKIP
      https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_173589v1/shard-dg1=
-16/igt@kms_addfb_basic@clobberred-modifier.html
[555] i915#5723
      https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5723
[556] SKIP
      https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_173589v1/shard-rkl=
-2/igt@i915_query@test-query-geometry-subslices.html
[557] i915#16079
      https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16079
[558] SKIP
      https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_173589v1/shard-tgl=
u-1/igt@i915_query@query-topology-unsupported.html
[559] i915#16109
      https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16109
[560] SKIP
      https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_173589v1/shard-tgl=
u-1/igt@i915_query@query-topology-known-pci-ids.html
[561] i915#11681
      https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11681
[562] SKIP
      https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_173589v1/shard-dg1=
-16/igt@i915_pm_rps@thresholds-park.html
[563] i915#6621
      https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6621
[564] SKIP
      https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_173589v1/shard-dg1=
-16/igt@i915_pm_rps@min-max-config-idle.html
[565] i915#16166
      https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16166
[566] i915#16080
      https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16080
[567] SKIP
      https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_173589v1/shard-dg2=
-8/igt@i915_pm_rc6_residency@media-rc6-accuracy.html
[568] SKIP
      https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_173589v1/shard-tgl=
u-4/igt@i915_pm_freq_api@freq-reset-multiple.html
[569] SKIP
      https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_173589v1/shard-tgl=
u-1/igt@i915_pm_freq_api@freq-reset.html
[570] i915#14545
      https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14545
[571] DMESG-WARN
      https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_173589v1/shard-dg1=
-16/igt@i915_module_load@reload.html
[572] i915#14118
      https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14118
[573] SKIP
      https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_173589v1/shard-dg2=
-8/igt@i915_drm_fdinfo@virtual-busy-idle.html
[574] i915#14123
      https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14123
[575] SKIP
      https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_173589v1/shard-dg2=
-8/igt@i915_drm_fdinfo@all-busy-idle-check-all.html
[576] i915#15678
      https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15678
[577] SKIP
      https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_173589v1/shard-tgl=
u-1/igt@gpu_buddy@gpu_buddy.html
[578] i915#2856
      https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2856
[579] SKIP
      https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_173589v1/shard-tgl=
u-1/igt@gen9_exec_parse@valid-registers.html
[580] SKIP
      https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_173589v1/shard-dg1=
-16/igt@gen9_exec_parse@unaligned-jump.html
[581] SKIP
      https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_173589v1/shard-tgl=
u-10/igt@gen9_exec_parse@bb-start-cmd.html
[582] SKIP
      https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_173589v1/shard-rkl=
-2/igt@gen9_exec_parse@basic-rejected-ctx-param.html
[583] SKIP
      https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_173589v1/shard-tgl=
u-1/igt@gem_userptr_blits@unsync-unmap-after-close.html
[584] SKIP
      https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_173589v1/shard-dg1=
-16/igt@gem_userptr_blits@readonly-pwrite-unsync.html
[585] i915#4880
      https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4880
[586] SKIP
      https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_173589v1/shard-dg2=
-8/igt@gem_userptr_blits@map-fixed-invalidate-busy.html
[587] SKIP
      https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_173589v1/shard-rkl=
-4/igt@gem_userptr_blits@forbidden-operations.html
[588] SKIP
      https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_173589v1/shard-rkl=
-2/igt@gem_userptr_blits@coherency-unsync.html
[589] SKIP
      https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_173589v1/shard-tgl=
u-10/igt@gem_userptr_blits@coherency-sync.html
[590] SKIP
      https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_173589v1/shard-dg2=
-8/igt@gem_userptr_blits@access-control.html
[591] i915#16193
      https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16193
[592] i915#13809
      https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13809
[593] INCOMPLETE
      https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_173589v1/shard-glk=
8/igt@gem_softpin@noreloc-s3.html
[594] PASS
      https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19102/shard-glk3/igt@=
gem_softpin@noreloc-s3.html
[595] SKIP
      https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_173589v1/shard-rkl=
-4/igt@gem_set_tiling_vs_pwrite.html
[596] i915#8411
      https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8411
[597] SKIP
      https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_173589v1/shard-rkl=
-7/igt@gem_set_tiling_vs_blt@untiled-to-tiled.html
[598] i915#8428
      https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8428
[599] SKIP
      https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_173589v1/shard-dg2=
-8/igt@gem_render_copy@y-tiled-ccs-to-y-tiled-ccs.html
[600] i915#4270
      https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4270
[601] SKIP
      https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_173589v1/shard-dg1=
-19/igt@gem_pxp@create-regular-context-1.html
[602] SKIP
      https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_173589v1/shard-dg1=
-16/igt@gem_pwrite_snooped.html
[603] i915#2658
      https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2658
[604] WARN
      https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_173589v1/shard-tgl=
u-1/igt@gem_pread@exhaustion.html
[605] SKIP
      https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_173589v1/shard-dg2=
-8/igt@gem_partial_pwrite_pread@writes-after-reads-snoop.html
[606] i915#4083
      https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4083
[607] SKIP
      https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_173589v1/shard-dg2=
-8/igt@gem_mmap_wc@write-prefaulted.html
[608] SKIP
      https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_173589v1/shard-dg1=
-16/igt@gem_mmap_wc@invalid-flags.html
[609] SKIP
      https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_173589v1/shard-dg2=
-8/igt@gem_mmap_gtt@cpuset-basic-small-copy-xy.html
[610] SKIP
      https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_173589v1/shard-tgl=
u-1/igt@gem_lmem_swapping@verify.html
[611] SKIP
      https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_173589v1/shard-tgl=
u-10/igt@gem_lmem_swapping@parallel-random-verify-ccs.html
[612] SKIP
      https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_173589v1/shard-glk=
4/igt@gem_lmem_swapping@massive-random.html
[613] SKIP
      https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_173589v1/shard-rkl=
-4/igt@gem_lmem_swapping@massive.html
[614] SKIP
      https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_173589v1/shard-tgl=
u-4/igt@gem_lmem_evict@dontneed-evict-race.html
[615] i915#2190
      https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2190
[616] SKIP
      https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_173589v1/shard-rkl=
-2/igt@gem_huc_copy@huc-copy.html
[617] INCOMPLETE
      https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_173589v1/shard-dg2=
-1/igt@gem_exec_suspend@basic-s0.html
[618] PASS
      https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19102/shard-dg2-4/igt=
@gem_exec_suspend@basic-s0.html
[619] i915#4812
      https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4812
[620] SKIP
      https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_173589v1/shard-dg1=
-19/igt@gem_exec_schedule@preempt-queue.html
[621] SKIP
      https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_173589v1/shard-dg1=
-16/igt@gem_exec_reloc@basic-write-read-active.html
[622] SKIP
      https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_173589v1/shard-rkl=
-2/igt@gem_exec_reloc@basic-write-read.html
[623] SKIP
      https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_173589v1/shard-dg2=
-8/igt@gem_exec_reloc@basic-write-cpu-noreloc.html
[624] i915#4852
      https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4852
[625] i915#3539
      https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3539
[626] SKIP
      https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_173589v1/shard-dg1=
-16/igt@gem_exec_flush@basic-uc-ro-default.html
[627] i915#6334
      https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6334
[628] SKIP
      https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_173589v1/shard-tgl=
u-1/igt@gem_exec_capture@capture-invisible@smem0.html
[629] i915#4525
      https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4525
[630] SKIP
      https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_173589v1/shard-rkl=
-7/igt@gem_exec_balancer@parallel-ordering.html
[631] SKIP
      https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_173589v1/shard-tgl=
u-1/igt@gem_exec_balancer@parallel-balancer.html
[632] i915#4771
      https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4771
[633] SKIP
      https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_173589v1/shard-dg1=
-16/igt@gem_exec_balancer@bonded-pair.html
[634] i915#280
      https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/280
[635] SKIP
      https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_173589v1/shard-rkl=
-4/igt@gem_ctx_sseu@invalid-args.html
[636] SKIP
      https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_173589v1/shard-tgl=
u-10/igt@gem_ctx_sseu@invalid-args.html
[637] i915#8555
      https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8555
[638] SKIP
      https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_173589v1/shard-dg2=
-8/igt@gem_ctx_persistence@heartbeat-many.html
[639] i915#8562
      https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8562
[640] SKIP
      https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_173589v1/shard-rkl=
-7/igt@gem_create@create-ext-set-pat.html
[641] i915#7697
      https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/7697
[642] SKIP
      https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_173589v1/shard-dg1=
-16/igt@gem_close_race@multigpu-basic-threads.html
[643] i915#16348
      https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16348
[644] INCOMPLETE
      https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_173589v1/shard-dg2=
-4/igt@gem_ccs@suspend-resume@linear-compressed-compfmt0-smem-lmem0.html
[645] PASS
      https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19102/shard-dg2-1/igt=
@gem_ccs@suspend-resume@linear-compressed-compfmt0-smem-lmem0.html
[646] i915#13008
      https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13008
[647] SKIP
      https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_173589v1/shard-tgl=
u-3/igt@gem_ccs@large-ctrl-surf-copy.html
[648] i915#9323
      https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9323
[649] SKIP
      https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_173589v1/shard-rkl=
-7/igt@gem_ccs@ctrl-surf-copy.html
[650] i915#3936
      https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3936
[651] SKIP
      https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_173589v1/shard-dg2=
-8/igt@gem_busy@semaphore.html
[652] SKIP
      https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_173589v1/shard-tgl=
u-1/igt@gem_basic@multigpu-create-close.html
[653] SKIP
      https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_173589v1/shard-tgl=
u-3/igt@device_reset@unbind-cold-reset-rebind.html
[654] SKIP
      https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_173589v1/shard-dg1=
-16/igt@api_intel_bb@object-reloc-keep-cache.html
[655] i915#6230
      https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6230
[656] SKIP
      https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_173589v1/shard-rkl=
-2/igt@api_intel_bb@crc32.html
[657] FAIL
      https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_173589v1/shard-dg1=
-18/igt@kms_flip@flip-vs-wf_vblank-interruptible@c-hdmi-a4.html
[658] INCOMPLETE
      https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_173589v1/shard-dg1=
-14/igt@gem_exec_parallel@userptr.html
[659] PASS
      https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19102/shard-dg1-17/ig=
t@gem_exec_parallel@userptr.html

--=-UAfPUPpp5KjpsDBhkDAt
Content-Type: text/html; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

<html><head>
 =20
  <title>Project List - Patchwork</title>
  <style id=3D"css-table-select" type=3D"text/css">
   td { padding: 2pt; }
  </style>
<style>pre,code,address {
  margin: 0px;
}
h1,h2,h3,h4,h5,h6 {
  margin-top: 0.2em;
  margin-bottom: 0.2em;
}
ol,ul {
  margin-top: 0em;
  margin-bottom: 0em;
}
blockquote {
  margin-top: 0em;
  margin-bottom: 0em;
}
</style></head>
<body><div>Hi,</div><div><br></div><div>These regressions are not related t=
o my patch:</div><div></div><div><br></div><div>The patch only adds a negat=
ive-index check before setting a bit in the DP link-configuration filter. V=
alid configurations are unchanged, and the new warning does not appear in t=
he available logs.</div><div><br></div><div>The two reported regressions ar=
e:</div><div><br></div><div>1. &nbsp;<a href=3D"mailto:gem_exec_parallel@us=
erptr">gem_exec_parallel@userptr</a>&nbsp; on shard-dg1-14:</div><div>The r=
cs0, bcs0, vcs0 and vcs1 dynamic subtests passed, then output stopped durin=
g vecs0. The additional incomplete result is the corresponding vecs0 dynami=
c subtest. The runner and kernel log files end abruptly with NUL padding, w=
ithout a diagnostic establishing the cause. This is a GEM userptr execution=
 workload, unrelated to the changed DP filtering code.</div><div><a href=3D=
"https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_173589v1/shard-dg1-14/i=
gt@gem_exec_parallel@userptr.html">https://intel-gfx-ci.01.org/tree/drm-tip=
/Patchwork_173589v1/shard-dg1-14/igt@gem_exec_parallel@userptr.html</a></di=
v><div><br></div><div>2. &nbsp;<a href=3D"mailto:kms_flip@flip-vs-wf">kms_f=
lip@flip-vs-wf</a><a href=3D"mailto:_vblank-interruptible@c-hdmi-a4">_vblan=
k-interruptible@c-hdmi-a4</a>&nbsp; on shard-dg1-18:</div><div>This failed =
in &nbsp;calibrate_ts()&nbsp; at the assertion &nbsp;3 * stddev / mean &lt;=
 0.005&nbsp;, reporting 13.29% variation against a 0.5% limit. The display =
snapshot shows HDMI-A-4 connected and all DP connectors disconnected. The f=
ailure is in HDMI frame-timing calibration, outside the modified DP path. T=
his was also NOTRUN in the baseline, rather than a passing instance becomin=
g a failure.</div><div><a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/=
Patchwork_173589v1/shard-dg1-18/igt@kms_flip@flip-vs-wf_vblank-interruptibl=
e@c-hdmi-a4.html">https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_173589=
v1/shard-dg1-18/igt@kms_flip@flip-vs-wf_vblank-interruptible@c-hdmi-a4.html=
</a></div><div><br></div><div>(Analysis assisted by Copilot)</div><div><br>=
</div><div>Thanks,</div><div>Luca</div><div><br></div><div><br></div><div>O=
n Tue, 2026-09-08 at 21:54 +0000, Patchwork wrote:</div><blockquote type=3D=
"cite" style=3D"margin:0 0 0 .8ex; border-left:2px #729fcf solid;padding-le=
ft:1ex"><div><b>Patch Details</b></div>
<div><table>
<tbody><tr><td><b>Series:</b></td><td>drm/i915/display: check configuration=
 index before shifting</td></tr>
<tr><td><b>URL:</b></td><td><a href=3D"https://patchwork.freedesktop.org/se=
ries/173589/">https://patchwork.freedesktop.org/series/173589/</a></td></tr=
>
<tr><td><b>State:</b></td><td>failure</td></tr> <tr><td><b>Details:</b></td=
><td><a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_173589v1=
/index.html">https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_173589v1/in=
dex.html</a></td></tr></tbody></table> </div><h1>CI Bug Log - changes from =
CI_DRM_19102_full -&gt; Patchwork_173589v1_full</h1><h2>Summary</h2><p><str=
ong>FAILURE</strong></p><p>Serious unknown changes coming with Patchwork_17=
3589v1_full absolutely need to be<br> verified manually.</p><p>If you think=
 the reported changes have nothing to do with the changes<br> introduced in=
 Patchwork_173589v1_full, please notify your bug team (I915-ci-infra@lists.=
freedesktop.org) to allow them<br> to document this new failure mode, which=
 will reduce false positives in CI.</p><h2>Participating hosts (10 -&gt; 11=
)</h2><p>Additional (1): pig-kbl-iris </p><h2>Possible new issues</h2><p>He=
re are the unknown changes that may have been introduced in Patchwork_17358=
9v1_full:</p><h3>IGT changes</h3><h4>Possible regressions</h4><ul>
<li>
<p>igt@gem_exec_parallel@userptr:</p><ul>
<li>shard-dg1:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_19102/shard-dg1-17/igt@gem_exec_parallel@userptr.html">PASS</a> -&g=
t; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_173589v1/s=
hard-dg1-14/igt@gem_exec_parallel@userptr.html">INCOMPLETE</a> +1 other tes=
t incomplete</li>
</ul></li>
<li>
<p>igt@kms_flip@flip-vs-wf_vblank-interruptible@c-hdmi-a4:</p><ul>
<li>shard-dg1:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/Patchwork_173589v1/shard-dg1-18/igt@kms_flip@flip-vs-wf_vblan=
k-interruptible@c-hdmi-a4.html">FAIL</a></li>
</ul></li>
</ul><h2>New tests</h2><p>New tests have been introduced between CI_DRM_191=
02_full and Patchwork_173589v1_full:</p><h3>New IGT tests (3)</h3><ul>
<li>
<p>igt@kms_cursor_crc@cursor-sliding-256x85@pipe-a-hdmi-a-3:</p><ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [4.42] s</li>
</ul></li>
<li>
<p>igt@kms_cursor_crc@cursor-sliding-256x85@pipe-c-hdmi-a-1:</p><ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [4.12] s</li>
</ul></li>
<li>
<p>igt@kms_cursor_crc@cursor-sliding-256x85@pipe-d-hdmi-a-3:</p><ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [4.32] s</li>
</ul></li>
</ul><h2>Known issues</h2><p>Here are the changes found in Patchwork_173589=
v1_full that come from known issues:</p><h3>IGT changes</h3><h4>Issues hit<=
/h4><ul>
<li>
<p>igt@api_intel_bb@crc32:</p><ul>
<li>shard-rkl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/Patchwork_173589v1/shard-rkl-2/igt@api_intel_bb@crc32.html">S=
KIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues=
/6230">i915#6230</a>)</li>
</ul></li>
<li>
<p>igt@api_intel_bb@object-reloc-keep-cache:</p><ul>
<li>shard-dg1:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/Patchwork_173589v1/shard-dg1-16/igt@api_intel_bb@object-reloc=
-keep-cache.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i=
915/kernel/-/issues/8411">i915#8411</a>)</li>
</ul></li>
<li>
<p>igt@device_reset@unbind-cold-reset-rebind:</p><ul>
<li>shard-tglu:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/Patchwork_173589v1/shard-tglu-3/igt@device_reset@unbind-cold-=
reset-rebind.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/=
i915/kernel/-/issues/11078">i915#11078</a>)</li>
</ul></li>
<li>
<p>igt@gem_basic@multigpu-create-close:</p><ul>
<li>shard-tglu-1:       NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/Patchwork_173589v1/shard-tglu-1/igt@gem_basic@multigpu-create=
-close.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/k=
ernel/-/issues/7697">i915#7697</a>)</li>
</ul></li>
<li>
<p>igt@gem_busy@semaphore:</p><ul>
<li>shard-dg2:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/Patchwork_173589v1/shard-dg2-8/igt@gem_busy@semaphore.html">S=
KIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues=
/3936">i915#3936</a>)</li>
</ul></li>
<li>
<p>igt@gem_ccs@ctrl-surf-copy:</p><ul>
<li>shard-rkl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/Patchwork_173589v1/shard-rkl-7/igt@gem_ccs@ctrl-surf-copy.htm=
l">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/is=
sues/3555">i915#3555</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i9=
15/kernel/-/issues/9323">i915#9323</a>)</li>
</ul></li>
<li>
<p>igt@gem_ccs@large-ctrl-surf-copy:</p><ul>
<li>shard-tglu:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/Patchwork_173589v1/shard-tglu-3/igt@gem_ccs@large-ctrl-surf-c=
opy.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kern=
el/-/issues/13008">i915#13008</a>)</li>
</ul></li>
<li>
<p>igt@gem_ccs@suspend-resume@linear-compressed-compfmt0-smem-lmem0:</p><ul=
>
<li>shard-dg2:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_19102/shard-dg2-1/igt@gem_ccs@suspend-resume@linear-compressed-comp=
fmt0-smem-lmem0.html">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/Patchwork_173589v1/shard-dg2-4/igt@gem_ccs@suspend-resume@lin=
ear-compressed-compfmt0-smem-lmem0.html">INCOMPLETE</a> (<a href=3D"https:/=
/gitlab.freedesktop.org/drm/i915/kernel/-/issues/13356">i915#13356</a> / <a=
 href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16348">i91=
5#16348</a>)</li>
</ul></li>
<li>
<p>igt@gem_close_race@multigpu-basic-threads:</p><ul>
<li>shard-dg1:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/Patchwork_173589v1/shard-dg1-16/igt@gem_close_race@multigpu-b=
asic-threads.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/=
i915/kernel/-/issues/7697">i915#7697</a>)</li>
</ul></li>
<li>
<p>igt@gem_create@create-ext-set-pat:</p><ul>
<li>shard-rkl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/Patchwork_173589v1/shard-rkl-7/igt@gem_create@create-ext-set-=
pat.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kern=
el/-/issues/8562">i915#8562</a>)</li>
</ul></li>
<li>
<p>igt@gem_ctx_persistence@heartbeat-many:</p><ul>
<li>shard-dg2:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/Patchwork_173589v1/shard-dg2-8/igt@gem_ctx_persistence@heartb=
eat-many.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915=
/kernel/-/issues/8555">i915#8555</a>)</li>
</ul></li>
<li>
<p>igt@gem_ctx_sseu@invalid-args:</p><ul>
<li>shard-rkl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/Patchwork_173589v1/shard-rkl-4/igt@gem_ctx_sseu@invalid-args.=
html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-=
/issues/280">i915#280</a>) +1 other test skip</li>
<li>shard-tglu:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/Patchwork_173589v1/shard-tglu-10/igt@gem_ctx_sseu@invalid-arg=
s.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel=
/-/issues/280">i915#280</a>)</li>
</ul></li>
<li>
<p>igt@gem_exec_balancer@bonded-pair:</p><ul>
<li>shard-dg1:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/Patchwork_173589v1/shard-dg1-16/igt@gem_exec_balancer@bonded-=
pair.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/ker=
nel/-/issues/4771">i915#4771</a>)</li>
</ul></li>
<li>
<p>igt@gem_exec_balancer@parallel-balancer:</p><ul>
<li>shard-tglu-1:       NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/Patchwork_173589v1/shard-tglu-1/igt@gem_exec_balancer@paralle=
l-balancer.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i9=
15/kernel/-/issues/4525">i915#4525</a>)</li>
</ul></li>
<li>
<p>igt@gem_exec_balancer@parallel-ordering:</p><ul>
<li>shard-rkl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/Patchwork_173589v1/shard-rkl-7/igt@gem_exec_balancer@parallel=
-ordering.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i91=
5/kernel/-/issues/4525">i915#4525</a>)</li>
</ul></li>
<li>
<p>igt@gem_exec_capture@capture-invisible@smem0:</p><ul>
<li>shard-tglu-1:       NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/Patchwork_173589v1/shard-tglu-1/igt@gem_exec_capture@capture-=
invisible@smem0.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/d=
rm/i915/kernel/-/issues/6334">i915#6334</a>) +1 other test skip</li>
</ul></li>
<li>
<p>igt@gem_exec_flush@basic-uc-ro-default:</p><ul>
<li>shard-dg1:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/Patchwork_173589v1/shard-dg1-16/igt@gem_exec_flush@basic-uc-r=
o-default.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i91=
5/kernel/-/issues/3539">i915#3539</a> / <a href=3D"https://gitlab.freedeskt=
op.org/drm/i915/kernel/-/issues/4852">i915#4852</a>)</li>
</ul></li>
<li>
<p>igt@gem_exec_reloc@basic-write-cpu-noreloc:</p><ul>
<li>shard-dg2:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/Patchwork_173589v1/shard-dg2-8/igt@gem_exec_reloc@basic-write=
-cpu-noreloc.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/=
i915/kernel/-/issues/3281">i915#3281</a>) +1 other test skip</li>
</ul></li>
<li>
<p>igt@gem_exec_reloc@basic-write-read:</p><ul>
<li>shard-rkl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/Patchwork_173589v1/shard-rkl-2/igt@gem_exec_reloc@basic-write=
-read.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/ke=
rnel/-/issues/3281">i915#3281</a>) +5 other tests skip</li>
</ul></li>
<li>
<p>igt@gem_exec_reloc@basic-write-read-active:</p><ul>
<li>shard-dg1:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/Patchwork_173589v1/shard-dg1-16/igt@gem_exec_reloc@basic-writ=
e-read-active.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm=
/i915/kernel/-/issues/3281">i915#3281</a>) +3 other tests skip</li>
</ul></li>
<li>
<p>igt@gem_exec_schedule@preempt-queue:</p><ul>
<li>shard-dg1:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/Patchwork_173589v1/shard-dg1-19/igt@gem_exec_schedule@preempt=
-queue.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/k=
ernel/-/issues/4812">i915#4812</a>)</li>
</ul></li>
<li>
<p>igt@gem_exec_suspend@basic-s0:</p><ul>
<li>shard-dg2:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_19102/shard-dg2-4/igt@gem_exec_suspend@basic-s0.html">PASS</a> -&gt=
; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_173589v1/sh=
ard-dg2-1/igt@gem_exec_suspend@basic-s0.html">INCOMPLETE</a> (<a href=3D"ht=
tps://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13356">i915#13356</a>=
) +1 other test incomplete</li>
</ul></li>
<li>
<p>igt@gem_huc_copy@huc-copy:</p><ul>
<li>shard-rkl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/Patchwork_173589v1/shard-rkl-2/igt@gem_huc_copy@huc-copy.html=
">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/iss=
ues/2190">i915#2190</a>)</li>
</ul></li>
<li>
<p>igt@gem_lmem_evict@dontneed-evict-race:</p><ul>
<li>shard-tglu:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/Patchwork_173589v1/shard-tglu-4/igt@gem_lmem_evict@dontneed-e=
vict-race.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i91=
5/kernel/-/issues/4613">i915#4613</a> / <a href=3D"https://gitlab.freedeskt=
op.org/drm/i915/kernel/-/issues/7582">i915#7582</a>)</li>
</ul></li>
<li>
<p>igt@gem_lmem_swapping@massive:</p><ul>
<li>shard-rkl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/Patchwork_173589v1/shard-rkl-4/igt@gem_lmem_swapping@massive.=
html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-=
/issues/4613">i915#4613</a>) +1 other test skip</li>
</ul></li>
<li>
<p>igt@gem_lmem_swapping@massive-random:</p><ul>
<li>shard-glk:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/Patchwork_173589v1/shard-glk4/igt@gem_lmem_swapping@massive-r=
andom.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/ke=
rnel/-/issues/4613">i915#4613</a>) +1 other test skip</li>
</ul></li>
<li>
<p>igt@gem_lmem_swapping@parallel-random-verify-ccs:</p><ul>
<li>shard-tglu:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/Patchwork_173589v1/shard-tglu-10/igt@gem_lmem_swapping@parall=
el-random-verify-ccs.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.=
org/drm/i915/kernel/-/issues/4613">i915#4613</a>) +3 other tests skip</li>
</ul></li>
<li>
<p>igt@gem_lmem_swapping@verify:</p><ul>
<li>shard-tglu-1:       NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/Patchwork_173589v1/shard-tglu-1/igt@gem_lmem_swapping@verify.=
html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-=
/issues/4613">i915#4613</a>) +1 other test skip</li>
</ul></li>
<li>
<p>igt@gem_mmap_gtt@cpuset-basic-small-copy-xy:</p><ul>
<li>shard-dg2:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/Patchwork_173589v1/shard-dg2-8/igt@gem_mmap_gtt@cpuset-basic-=
small-copy-xy.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm=
/i915/kernel/-/issues/4077">i915#4077</a>) +2 other tests skip</li>
</ul></li>
<li>
<p>igt@gem_mmap_wc@invalid-flags:</p><ul>
<li>shard-dg1:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/Patchwork_173589v1/shard-dg1-16/igt@gem_mmap_wc@invalid-flags=
.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/=
-/issues/4083">i915#4083</a>) +1 other test skip</li>
</ul></li>
<li>
<p>igt@gem_mmap_wc@write-prefaulted:</p><ul>
<li>shard-dg2:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/Patchwork_173589v1/shard-dg2-8/igt@gem_mmap_wc@write-prefault=
ed.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kerne=
l/-/issues/4083">i915#4083</a>) +1 other test skip</li>
</ul></li>
<li>
<p>igt@gem_partial_pwrite_pread@writes-after-reads-snoop:</p><ul>
<li>shard-dg2:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/Patchwork_173589v1/shard-dg2-8/igt@gem_partial_pwrite_pread@w=
rites-after-reads-snoop.html">SKIP</a> (<a href=3D"https://gitlab.freedeskt=
op.org/drm/i915/kernel/-/issues/3282">i915#3282</a>) +2 other tests skip</l=
i>
</ul></li>
<li>
<p>igt@gem_pread@exhaustion:</p><ul>
<li>shard-tglu-1:       NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/Patchwork_173589v1/shard-tglu-1/igt@gem_pread@exhaustion.html=
">WARN</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/iss=
ues/2658">i915#2658</a>)</li>
</ul></li>
<li>
<p>igt@gem_pwrite_snooped:</p><ul>
<li>shard-dg1:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/Patchwork_173589v1/shard-dg1-16/igt@gem_pwrite_snooped.html">=
SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issue=
s/3282">i915#3282</a>)</li>
</ul></li>
<li>
<p>igt@gem_pxp@create-regular-context-1:</p><ul>
<li>shard-dg1:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/Patchwork_173589v1/shard-dg1-19/igt@gem_pxp@create-regular-co=
ntext-1.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/=
kernel/-/issues/4270">i915#4270</a>)</li>
</ul></li>
<li>
<p>igt@gem_render_copy@y-tiled-ccs-to-y-tiled-ccs:</p><ul>
<li>shard-dg2:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/Patchwork_173589v1/shard-dg2-8/igt@gem_render_copy@y-tiled-cc=
s-to-y-tiled-ccs.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/=
drm/i915/kernel/-/issues/5190">i915#5190</a> / <a href=3D"https://gitlab.fr=
eedesktop.org/drm/i915/kernel/-/issues/8428">i915#8428</a>) +1 other test s=
kip</li>
</ul></li>
<li>
<p>igt@gem_set_tiling_vs_blt@untiled-to-tiled:</p><ul>
<li>shard-rkl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/Patchwork_173589v1/shard-rkl-7/igt@gem_set_tiling_vs_blt@unti=
led-to-tiled.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/=
i915/kernel/-/issues/8411">i915#8411</a>)</li>
</ul></li>
<li>
<p>igt@gem_set_tiling_vs_pwrite:</p><ul>
<li>shard-rkl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/Patchwork_173589v1/shard-rkl-4/igt@gem_set_tiling_vs_pwrite.h=
tml">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/=
issues/3282">i915#3282</a>) +5 other tests skip</li>
</ul></li>
<li>
<p>igt@gem_softpin@noreloc-s3:</p><ul>
<li>shard-glk:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_19102/shard-glk3/igt@gem_softpin@noreloc-s3.html">PASS</a> -&gt; <a=
 href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_173589v1/shard-=
glk8/igt@gem_softpin@noreloc-s3.html">INCOMPLETE</a> (<a href=3D"https://gi=
tlab.freedesktop.org/drm/i915/kernel/-/issues/13809">i915#13809</a> / <a hr=
ef=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16193">i915#1=
6193</a>)</li>
</ul></li>
<li>
<p>igt@gem_userptr_blits@access-control:</p><ul>
<li>shard-dg2:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/Patchwork_173589v1/shard-dg2-8/igt@gem_userptr_blits@access-c=
ontrol.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/k=
ernel/-/issues/3297">i915#3297</a>)</li>
</ul></li>
<li>
<p>igt@gem_userptr_blits@coherency-sync:</p><ul>
<li>shard-tglu:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/Patchwork_173589v1/shard-tglu-10/igt@gem_userptr_blits@cohere=
ncy-sync.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915=
/kernel/-/issues/3297">i915#3297</a>) +1 other test skip</li>
</ul></li>
<li>
<p>igt@gem_userptr_blits@coherency-unsync:</p><ul>
<li>shard-rkl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/Patchwork_173589v1/shard-rkl-2/igt@gem_userptr_blits@coherenc=
y-unsync.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915=
/kernel/-/issues/3297">i915#3297</a>)</li>
</ul></li>
<li>
<p>igt@gem_userptr_blits@forbidden-operations:</p><ul>
<li>shard-rkl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/Patchwork_173589v1/shard-rkl-4/igt@gem_userptr_blits@forbidde=
n-operations.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/=
i915/kernel/-/issues/3282">i915#3282</a> / <a href=3D"https://gitlab.freede=
sktop.org/drm/i915/kernel/-/issues/3297">i915#3297</a>)</li>
</ul></li>
<li>
<p>igt@gem_userptr_blits@map-fixed-invalidate-busy:</p><ul>
<li>shard-dg2:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/Patchwork_173589v1/shard-dg2-8/igt@gem_userptr_blits@map-fixe=
d-invalidate-busy.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org=
/drm/i915/kernel/-/issues/3297">i915#3297</a> / <a href=3D"https://gitlab.f=
reedesktop.org/drm/i915/kernel/-/issues/4880">i915#4880</a>)</li>
</ul></li>
<li>
<p>igt@gem_userptr_blits@readonly-pwrite-unsync:</p><ul>
<li>shard-dg1:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/Patchwork_173589v1/shard-dg1-16/igt@gem_userptr_blits@readonl=
y-pwrite-unsync.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/d=
rm/i915/kernel/-/issues/3297">i915#3297</a>)</li>
</ul></li>
<li>
<p>igt@gem_userptr_blits@unsync-unmap-after-close:</p><ul>
<li>shard-tglu-1:       NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/Patchwork_173589v1/shard-tglu-1/igt@gem_userptr_blits@unsync-=
unmap-after-close.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org=
/drm/i915/kernel/-/issues/3297">i915#3297</a>)</li>
</ul></li>
<li>
<p>igt@gen9_exec_parse@basic-rejected-ctx-param:</p><ul>
<li>shard-rkl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/Patchwork_173589v1/shard-rkl-2/igt@gen9_exec_parse@basic-reje=
cted-ctx-param.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/dr=
m/i915/kernel/-/issues/2527">i915#2527</a>)</li>
</ul></li>
<li>
<p>igt@gen9_exec_parse@bb-start-cmd:</p><ul>
<li>shard-tglu:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/Patchwork_173589v1/shard-tglu-10/igt@gen9_exec_parse@bb-start=
-cmd.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/ker=
nel/-/issues/2527">i915#2527</a> / <a href=3D"https://gitlab.freedesktop.or=
g/drm/i915/kernel/-/issues/2856">i915#2856</a>) +1 other test skip</li>
</ul></li>
<li>
<p>igt@gen9_exec_parse@unaligned-jump:</p><ul>
<li>shard-dg1:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/Patchwork_173589v1/shard-dg1-16/igt@gen9_exec_parse@unaligned=
-jump.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/ke=
rnel/-/issues/2527">i915#2527</a>) +2 other tests skip</li>
</ul></li>
<li>
<p>igt@gen9_exec_parse@valid-registers:</p><ul>
<li>shard-tglu-1:       NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/Patchwork_173589v1/shard-tglu-1/igt@gen9_exec_parse@valid-reg=
isters.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/k=
ernel/-/issues/2527">i915#2527</a> / <a href=3D"https://gitlab.freedesktop.=
org/drm/i915/kernel/-/issues/2856">i915#2856</a>) +2 other tests skip</li>
</ul></li>
<li>
<p>igt@gpu_buddy@gpu_buddy:</p><ul>
<li>shard-tglu-1:       NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/Patchwork_173589v1/shard-tglu-1/igt@gpu_buddy@gpu_buddy.html"=
>SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issu=
es/15678">i915#15678</a>)</li>
</ul></li>
<li>
<p>igt@i915_drm_fdinfo@all-busy-idle-check-all:</p><ul>
<li>shard-dg2:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/Patchwork_173589v1/shard-dg2-8/igt@i915_drm_fdinfo@all-busy-i=
dle-check-all.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm=
/i915/kernel/-/issues/14123">i915#14123</a>)</li>
</ul></li>
<li>
<p>igt@i915_drm_fdinfo@virtual-busy-idle:</p><ul>
<li>shard-dg2:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/Patchwork_173589v1/shard-dg2-8/igt@i915_drm_fdinfo@virtual-bu=
sy-idle.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/=
kernel/-/issues/14118">i915#14118</a>)</li>
</ul></li>
<li>
<p>igt@i915_module_load@reload:</p><ul>
<li>shard-dg1:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/Patchwork_173589v1/shard-dg1-16/igt@i915_module_load@reload.h=
tml">DMESG-WARN</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/ker=
nel/-/issues/14545">i915#14545</a>)</li>
</ul></li>
<li>
<p>igt@i915_pm_freq_api@freq-reset:</p><ul>
<li>shard-tglu-1:       NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/Patchwork_173589v1/shard-tglu-1/igt@i915_pm_freq_api@freq-res=
et.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kerne=
l/-/issues/8399">i915#8399</a>)</li>
</ul></li>
<li>
<p>igt@i915_pm_freq_api@freq-reset-multiple:</p><ul>
<li>shard-tglu:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/Patchwork_173589v1/shard-tglu-4/igt@i915_pm_freq_api@freq-res=
et-multiple.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i=
915/kernel/-/issues/8399">i915#8399</a>)</li>
</ul></li>
<li>
<p>igt@i915_pm_rc6_residency@media-rc6-accuracy:</p><ul>
<li>shard-dg2:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/Patchwork_173589v1/shard-dg2-8/igt@i915_pm_rc6_residency@medi=
a-rc6-accuracy.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/dr=
m/i915/kernel/-/issues/16080">i915#16080</a> / <a href=3D"https://gitlab.fr=
eedesktop.org/drm/i915/kernel/-/issues/16166">i915#16166</a>)</li>
</ul></li>
<li>
<p>igt@i915_pm_rps@min-max-config-idle:</p><ul>
<li>shard-dg1:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/Patchwork_173589v1/shard-dg1-16/igt@i915_pm_rps@min-max-confi=
g-idle.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/k=
ernel/-/issues/11681">i915#11681</a> / <a href=3D"https://gitlab.freedeskto=
p.org/drm/i915/kernel/-/issues/6621">i915#6621</a>)</li>
</ul></li>
<li>
<p>igt@i915_pm_rps@thresholds-park:</p><ul>
<li>shard-dg1:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/Patchwork_173589v1/shard-dg1-16/igt@i915_pm_rps@thresholds-pa=
rk.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kerne=
l/-/issues/11681">i915#11681</a>)</li>
</ul></li>
<li>
<p>igt@i915_query@query-topology-known-pci-ids:</p><ul>
<li>shard-tglu-1:       NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/Patchwork_173589v1/shard-tglu-1/igt@i915_query@query-topology=
-known-pci-ids.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/dr=
m/i915/kernel/-/issues/16109">i915#16109</a>)</li>
</ul></li>
<li>
<p>igt@i915_query@query-topology-unsupported:</p><ul>
<li>shard-tglu-1:       NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/Patchwork_173589v1/shard-tglu-1/igt@i915_query@query-topology=
-unsupported.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/=
i915/kernel/-/issues/16079">i915#16079</a>)</li>
</ul></li>
<li>
<p>igt@i915_query@test-query-geometry-subslices:</p><ul>
<li>shard-rkl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/Patchwork_173589v1/shard-rkl-2/igt@i915_query@test-query-geom=
etry-subslices.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/dr=
m/i915/kernel/-/issues/5723">i915#5723</a>)</li>
</ul></li>
<li>
<p>igt@kms_addfb_basic@clobberred-modifier:</p><ul>
<li>shard-dg1:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/Patchwork_173589v1/shard-dg1-16/igt@kms_addfb_basic@clobberre=
d-modifier.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i9=
15/kernel/-/issues/4212">i915#4212</a>)</li>
</ul></li>
<li>
<p>igt@kms_addfb_basic@invalid-smem-bo-on-discrete:</p><ul>
<li>shard-tglu:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/Patchwork_173589v1/shard-tglu-3/igt@kms_addfb_basic@invalid-s=
mem-bo-on-discrete.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.or=
g/drm/i915/kernel/-/issues/12454">i915#12454</a> / <a href=3D"https://gitla=
b.freedesktop.org/drm/i915/kernel/-/issues/12712">i915#12712</a>)</li>
</ul></li>
<li>
<p>igt@kms_async_flips@alternate-sync-async-flip-atomic@pipe-b-hdmi-a-2:</p=
><ul>
<li>shard-glk:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_19102/shard-glk3/igt@kms_async_flips@alternate-sync-async-flip-atom=
ic@pipe-b-hdmi-a-2.html">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.=
org/tree/drm-tip/Patchwork_173589v1/shard-glk8/igt@kms_async_flips@alternat=
e-sync-async-flip-atomic@pipe-b-hdmi-a-2.html">FAIL</a> (<a href=3D"https:/=
/gitlab.freedesktop.org/drm/i915/kernel/-/issues/14888">i915#14888</a>)</li=
>
</ul></li>
<li>
<p>igt@kms_async_flips@async-flip-suspend-resume:</p><ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_19102/shard-rkl-2/igt@kms_async_flips@async-flip-suspend-resume.htm=
l">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/Patch=
work_173589v1/shard-rkl-6/igt@kms_async_flips@async-flip-suspend-resume.htm=
l">INCOMPLETE</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kerne=
l/-/issues/12761">i915#12761</a>)</li>
</ul></li>
<li>
<p>igt@kms_async_flips@async-flip-suspend-resume@pipe-a-hdmi-a-2:</p><ul>
<li>shard-rkl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/Patchwork_173589v1/shard-rkl-6/igt@kms_async_flips@async-flip=
-suspend-resume@pipe-a-hdmi-a-2.html">INCOMPLETE</a> (<a href=3D"https://gi=
tlab.freedesktop.org/drm/i915/kernel/-/issues/12761">i915#12761</a>)</li>
</ul></li>
<li>
<p>igt@kms_atomic@plane-primary-overlay-mutable-zpos:</p><ul>
<li>shard-rkl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/Patchwork_173589v1/shard-rkl-7/igt@kms_atomic@plane-primary-o=
verlay-mutable-zpos.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.o=
rg/drm/i915/kernel/-/issues/9531">i915#9531</a>)</li>
</ul></li>
<li>
<p>igt@kms_big_fb@4-tiled-16bpp-rotate-0:</p><ul>
<li>shard-rkl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/Patchwork_173589v1/shard-rkl-2/igt@kms_big_fb@4-tiled-16bpp-r=
otate-0.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/=
kernel/-/issues/5286">i915#5286</a>) +4 other tests skip</li>
</ul></li>
<li>
<p>igt@kms_big_fb@4-tiled-max-hw-stride-32bpp-rotate-0-async-flip:</p><ul>
<li>shard-tglu:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/Patchwork_173589v1/shard-tglu-4/igt@kms_big_fb@4-tiled-max-hw=
-stride-32bpp-rotate-0-async-flip.html">SKIP</a> (<a href=3D"https://gitlab=
.freedesktop.org/drm/i915/kernel/-/issues/5286">i915#5286</a>) +5 other tes=
ts skip</li>
</ul></li>
<li>
<p>igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-180-async-flip:</p><ul=
>
<li>shard-tglu-1:       NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/Patchwork_173589v1/shard-tglu-1/igt@kms_big_fb@4-tiled-max-hw=
-stride-64bpp-rotate-180-async-flip.html">SKIP</a> (<a href=3D"https://gitl=
ab.freedesktop.org/drm/i915/kernel/-/issues/5286">i915#5286</a>) +4 other t=
ests skip</li>
<li>shard-dg1:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/Patchwork_173589v1/shard-dg1-19/igt@kms_big_fb@4-tiled-max-hw=
-stride-64bpp-rotate-180-async-flip.html">SKIP</a> (<a href=3D"https://gitl=
ab.freedesktop.org/drm/i915/kernel/-/issues/4538">i915#4538</a> / <a href=
=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5286">i915#5286=
</a>) +3 other tests skip</li>
</ul></li>
<li>
<p>igt@kms_big_fb@linear-16bpp-rotate-90:</p><ul>
<li>shard-rkl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/Patchwork_173589v1/shard-rkl-2/igt@kms_big_fb@linear-16bpp-ro=
tate-90.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/=
kernel/-/issues/3638">i915#3638</a>) +3 other tests skip</li>
</ul></li>
<li>
<p>igt@kms_big_fb@linear-max-hw-stride-32bpp-rotate-0-hflip:</p><ul>
<li>shard-rkl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/Patchwork_173589v1/shard-rkl-7/igt@kms_big_fb@linear-max-hw-s=
tride-32bpp-rotate-0-hflip.html">SKIP</a> (<a href=3D"https://gitlab.freede=
sktop.org/drm/i915/kernel/-/issues/3828">i915#3828</a>)</li>
</ul></li>
<li>
<p>igt@kms_big_fb@y-tiled-8bpp-rotate-270:</p><ul>
<li>shard-dg1:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/Patchwork_173589v1/shard-dg1-16/igt@kms_big_fb@y-tiled-8bpp-r=
otate-270.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i91=
5/kernel/-/issues/3638">i915#3638</a>) +3 other tests skip</li>
</ul></li>
<li>
<p>igt@kms_big_fb@yf-tiled-16bpp-rotate-270:</p><ul>
<li>shard-dg1:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/Patchwork_173589v1/shard-dg1-16/igt@kms_big_fb@yf-tiled-16bpp=
-rotate-270.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i=
915/kernel/-/issues/4538">i915#4538</a>) +2 other tests skip</li>
</ul></li>
<li>
<p>igt@kms_big_fb@yf-tiled-8bpp-rotate-0:</p><ul>
<li>shard-dg2:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/Patchwork_173589v1/shard-dg2-8/igt@kms_big_fb@yf-tiled-8bpp-r=
otate-0.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/=
kernel/-/issues/4538">i915#4538</a> / <a href=3D"https://gitlab.freedesktop=
.org/drm/i915/kernel/-/issues/5190">i915#5190</a>) +3 other tests skip</li>
</ul></li>
<li>
<p>igt@kms_ccs@bad-rotation-90-4-tiled-dg2-rc-ccs-cc@pipe-a-hdmi-a-2:</p><u=
l>
<li>shard-rkl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/Patchwork_173589v1/shard-rkl-6/igt@kms_ccs@bad-rotation-90-4-=
tiled-dg2-rc-ccs-cc@pipe-a-hdmi-a-2.html">SKIP</a> (<a href=3D"https://gitl=
ab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a> / <a href=
=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6095">i915#6095=
</a>) +5 other tests skip</li>
</ul></li>
<li>
<p>igt@kms_ccs@bad-rotation-90-4-tiled-dg2-rc-ccs-cc@pipe-c-hdmi-a-2:</p><u=
l>
<li>shard-rkl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/Patchwork_173589v1/shard-rkl-6/igt@kms_ccs@bad-rotation-90-4-=
tiled-dg2-rc-ccs-cc@pipe-c-hdmi-a-2.html">SKIP</a> (<a href=3D"https://gitl=
ab.freedesktop.org/drm/i915/kernel/-/issues/14098">i915#14098</a> / <a href=
=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#145=
44</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues=
/6095">i915#6095</a>) +2 other tests skip</li>
</ul></li>
<li>
<p>igt@kms_ccs@bad-rotation-90-4-tiled-lnl-ccs:</p><ul>
<li>shard-tglu-1:       NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/Patchwork_173589v1/shard-tglu-1/igt@kms_ccs@bad-rotation-90-4=
-tiled-lnl-ccs.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/dr=
m/i915/kernel/-/issues/12313">i915#12313</a>)</li>
</ul></li>
<li>
<p>igt@kms_ccs@crc-primary-basic-4-tiled-lnl-ccs:</p><ul>
<li>shard-dg1:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/Patchwork_173589v1/shard-dg1-16/igt@kms_ccs@crc-primary-basic=
-4-tiled-lnl-ccs.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/=
drm/i915/kernel/-/issues/12313">i915#12313</a>)</li>
</ul></li>
<li>
<p>igt@kms_ccs@crc-primary-rotation-180-4-tiled-mtl-rc-ccs-cc@pipe-b-hdmi-a=
-1:</p><ul>
<li>shard-tglu-1:       NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/Patchwork_173589v1/shard-tglu-1/igt@kms_ccs@crc-primary-rotat=
ion-180-4-tiled-mtl-rc-ccs-cc@pipe-b-hdmi-a-1.html">SKIP</a> (<a href=3D"ht=
tps://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6095">i915#6095</a>) =
+39 other tests skip</li>
</ul></li>
<li>
<p>igt@kms_ccs@crc-primary-suspend-4-tiled-bmg-ccs:</p><ul>
<li>shard-tglu-1:       NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/Patchwork_173589v1/shard-tglu-1/igt@kms_ccs@crc-primary-suspe=
nd-4-tiled-bmg-ccs.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.or=
g/drm/i915/kernel/-/issues/12805">i915#12805</a>)</li>
</ul></li>
<li>
<p>igt@kms_ccs@crc-primary-suspend-4-tiled-lnl-ccs:</p><ul>
<li>shard-tglu:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/Patchwork_173589v1/shard-tglu-10/igt@kms_ccs@crc-primary-susp=
end-4-tiled-lnl-ccs.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.o=
rg/drm/i915/kernel/-/issues/12805">i915#12805</a>)</li>
</ul></li>
<li>
<p>igt@kms_ccs@crc-primary-suspend-y-tiled-gen12-rc-ccs-cc@pipe-d-hdmi-a-1:=
</p><ul>
<li>shard-dg2:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/Patchwork_173589v1/shard-dg2-4/igt@kms_ccs@crc-primary-suspen=
d-y-tiled-gen12-rc-ccs-cc@pipe-d-hdmi-a-1.html">SKIP</a> (<a href=3D"https:=
//gitlab.freedesktop.org/drm/i915/kernel/-/issues/6095">i915#6095</a>) +16 =
other tests skip</li>
</ul></li>
<li>
<p>igt@kms_ccs@crc-primary-suspend-yf-tiled-ccs:</p><ul>
<li>shard-glk:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/Patchwork_173589v1/shard-glk5/igt@kms_ccs@crc-primary-suspend=
-yf-tiled-ccs.html">INCOMPLETE</a> (<a href=3D"https://gitlab.freedesktop.o=
rg/drm/i915/kernel/-/issues/15582">i915#15582</a>) +1 other test incomplete=
</li>
</ul></li>
<li>
<p>igt@kms_ccs@crc-primary-suspend-yf-tiled-ccs@pipe-c-hdmi-a-2:</p><ul>
<li>shard-rkl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/Patchwork_173589v1/shard-rkl-3/igt@kms_ccs@crc-primary-suspen=
d-yf-tiled-ccs@pipe-c-hdmi-a-2.html">SKIP</a> (<a href=3D"https://gitlab.fr=
eedesktop.org/drm/i915/kernel/-/issues/14098">i915#14098</a> / <a href=3D"h=
ttps://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6095">i915#6095</a>)=
 +41 other tests skip</li>
</ul></li>
<li>
<p>igt@kms_ccs@crc-sprite-planes-basic-4-tiled-bmg-ccs:</p><ul>
<li>shard-tglu:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/Patchwork_173589v1/shard-tglu-10/igt@kms_ccs@crc-sprite-plane=
s-basic-4-tiled-bmg-ccs.html">SKIP</a> (<a href=3D"https://gitlab.freedeskt=
op.org/drm/i915/kernel/-/issues/12313">i915#12313</a>) +1 other test skip</=
li>
</ul></li>
<li>
<p>igt@kms_ccs@crc-sprite-planes-basic-4-tiled-lnl-ccs:</p><ul>
<li>shard-rkl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/Patchwork_173589v1/shard-rkl-4/igt@kms_ccs@crc-sprite-planes-=
basic-4-tiled-lnl-ccs.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop=
.org/drm/i915/kernel/-/issues/12313">i915#12313</a>) +3 other tests skip</l=
i>
</ul></li>
<li>
<p>igt@kms_ccs@crc-sprite-planes-basic-4-tiled-mtl-mc-ccs@pipe-a-hdmi-a-3:<=
/p><ul>
<li>shard-dg2:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/Patchwork_173589v1/shard-dg2-1/igt@kms_ccs@crc-sprite-planes-=
basic-4-tiled-mtl-mc-ccs@pipe-a-hdmi-a-3.html">SKIP</a> (<a href=3D"https:/=
/gitlab.freedesktop.org/drm/i915/kernel/-/issues/10307">i915#10307</a> / <a=
 href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6095">i915=
#6095</a>) +61 other tests skip</li>
</ul></li>
<li>
<p>igt@kms_ccs@missing-ccs-buffer-4-tiled-mtl-mc-ccs@pipe-d-hdmi-a-1:</p><u=
l>
<li>shard-tglu:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/Patchwork_173589v1/shard-tglu-4/igt@kms_ccs@missing-ccs-buffe=
r-4-tiled-mtl-mc-ccs@pipe-d-hdmi-a-1.html">SKIP</a> (<a href=3D"https://git=
lab.freedesktop.org/drm/i915/kernel/-/issues/6095">i915#6095</a>) +49 other=
 tests skip</li>
</ul></li>
<li>
<p>igt@kms_ccs@missing-ccs-buffer-y-tiled-ccs@pipe-d-hdmi-a-1:</p><ul>
<li>shard-dg2:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/Patchwork_173589v1/shard-dg2-4/igt@kms_ccs@missing-ccs-buffer=
-y-tiled-ccs@pipe-d-hdmi-a-1.html">SKIP</a> (<a href=3D"https://gitlab.free=
desktop.org/drm/i915/kernel/-/issues/10307">i915#10307</a> / <a href=3D"htt=
ps://gitlab.freedesktop.org/drm/i915/kernel/-/issues/10434">i915#10434</a> =
/ <a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6095">=
i915#6095</a>) +2 other tests skip</li>
</ul></li>
<li>
<p>igt@kms_ccs@missing-ccs-buffer-yf-tiled-ccs@pipe-b-hdmi-a-1:</p><ul>
<li>shard-dg1:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/Patchwork_173589v1/shard-dg1-14/igt@kms_ccs@missing-ccs-buffe=
r-yf-tiled-ccs@pipe-b-hdmi-a-1.html">SKIP</a> (<a href=3D"https://gitlab.fr=
eedesktop.org/drm/i915/kernel/-/issues/6095">i915#6095</a>) +183 other test=
s skip</li>
</ul></li>
<li>
<p>igt@kms_ccs@random-ccs-data-4-tiled-mtl-rc-ccs@pipe-b-hdmi-a-2:</p><ul>
<li>shard-rkl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/Patchwork_173589v1/shard-rkl-3/igt@kms_ccs@random-ccs-data-4-=
tiled-mtl-rc-ccs@pipe-b-hdmi-a-2.html">SKIP</a> (<a href=3D"https://gitlab.=
freedesktop.org/drm/i915/kernel/-/issues/6095">i915#6095</a>) +55 other tes=
ts skip</li>
</ul></li>
<li>
<p>igt@kms_cdclk@mode-transition:</p><ul>
<li>shard-rkl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/Patchwork_173589v1/shard-rkl-2/igt@kms_cdclk@mode-transition.=
html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-=
/issues/3742">i915#3742</a>)</li>
</ul></li>
<li>
<p>igt@kms_cdclk@plane-scaling@pipe-d-hdmi-a-1:</p><ul>
<li>shard-dg2:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/Patchwork_173589v1/shard-dg2-4/igt@kms_cdclk@plane-scaling@pi=
pe-d-hdmi-a-1.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm=
/i915/kernel/-/issues/13783">i915#13783</a>) +3 other tests skip</li>
</ul></li>
<li>
<p>igt@kms_chamelium_audio@dp-audio-after-suspend:</p><ul>
<li>shard-tglu-1:       NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/Patchwork_173589v1/shard-tglu-1/igt@kms_chamelium_audio@dp-au=
dio-after-suspend.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org=
/drm/i915/kernel/-/issues/11151">i915#11151</a>)</li>
</ul></li>
<li>
<p>igt@kms_chamelium_audio@dp-audio-edid:</p><ul>
<li>shard-dg2:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/Patchwork_173589v1/shard-dg2-8/igt@kms_chamelium_audio@dp-aud=
io-edid.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/=
kernel/-/issues/11151">i915#11151</a> / <a href=3D"https://gitlab.freedeskt=
op.org/drm/i915/kernel/-/issues/7828">i915#7828</a>) +1 other test skip</li=
>
</ul></li>
<li>
<p>igt@kms_chamelium_audio@hdmi-audio-after-suspend:</p><ul>
<li>shard-rkl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/Patchwork_173589v1/shard-rkl-7/igt@kms_chamelium_audio@hdmi-a=
udio-after-suspend.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.or=
g/drm/i915/kernel/-/issues/11151">i915#11151</a>)</li>
</ul></li>
<li>
<p>igt@kms_chamelium_color@ctm-green-to-red:</p><ul>
<li>shard-dg2:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/Patchwork_173589v1/shard-dg2-8/igt@kms_chamelium_color@ctm-gr=
een-to-red.html">SKIP</a> +2 other tests skip</li>
</ul></li>
<li>
<p>igt@kms_chamelium_color_pipeline@plane-lut1d-ctm3x4:</p><ul>
<li>shard-tglu-1:       NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/Patchwork_173589v1/shard-tglu-1/igt@kms_chamelium_color_pipel=
ine@plane-lut1d-ctm3x4.html">SKIP</a> (<a href=3D"https://gitlab.freedeskto=
p.org/drm/i915/kernel/-/issues/16471">i915#16471</a>) +1 other test skip</l=
i>
</ul></li>
<li>
<p>igt@kms_chamelium_color_pipeline@plane-lut1d-ctm3x4-lut1d:</p><ul>
<li>shard-dg1:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/Patchwork_173589v1/shard-dg1-16/igt@kms_chamelium_color_pipel=
ine@plane-lut1d-ctm3x4-lut1d.html">SKIP</a> (<a href=3D"https://gitlab.free=
desktop.org/drm/i915/kernel/-/issues/16471">i915#16471</a>)</li>
</ul></li>
<li>
<p>igt@kms_chamelium_color_pipeline@plane-lut1d-pre-ctm3x4:</p><ul>
<li>shard-rkl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/Patchwork_173589v1/shard-rkl-4/igt@kms_chamelium_color_pipeli=
ne@plane-lut1d-pre-ctm3x4.html">SKIP</a> (<a href=3D"https://gitlab.freedes=
ktop.org/drm/i915/kernel/-/issues/16471">i915#16471</a>) +1 other test skip=
</li>
<li>shard-tglu:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/Patchwork_173589v1/shard-tglu-10/igt@kms_chamelium_color_pipe=
line@plane-lut1d-pre-ctm3x4.html">SKIP</a> (<a href=3D"https://gitlab.freed=
esktop.org/drm/i915/kernel/-/issues/16471">i915#16471</a>)</li>
</ul></li>
<li>
<p>igt@kms_chamelium_edid@dp-edid-change-during-suspend:</p><ul>
<li>shard-tglu-1:       NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/Patchwork_173589v1/shard-tglu-1/igt@kms_chamelium_edid@dp-edi=
d-change-during-suspend.html">SKIP</a> (<a href=3D"https://gitlab.freedeskt=
op.org/drm/i915/kernel/-/issues/11151">i915#11151</a> / <a href=3D"https://=
gitlab.freedesktop.org/drm/i915/kernel/-/issues/7828">i915#7828</a>) +3 oth=
er tests skip</li>
</ul></li>
<li>
<p>igt@kms_chamelium_hpd@vga-hpd-fast:</p><ul>
<li>shard-rkl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/Patchwork_173589v1/shard-rkl-8/igt@kms_chamelium_hpd@vga-hpd-=
fast.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/ker=
nel/-/issues/11151">i915#11151</a> / <a href=3D"https://gitlab.freedesktop.=
org/drm/i915/kernel/-/issues/7828">i915#7828</a>) +6 other tests skip</li>
<li>shard-dg1:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/Patchwork_173589v1/shard-dg1-16/igt@kms_chamelium_hpd@vga-hpd=
-fast.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/ke=
rnel/-/issues/11151">i915#11151</a> / <a href=3D"https://gitlab.freedesktop=
.org/drm/i915/kernel/-/issues/7828">i915#7828</a>) +5 other tests skip</li>
</ul></li>
<li>
<p>igt@kms_chamelium_hpd@vga-hpd-for-each-pipe:</p><ul>
<li>shard-tglu:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/Patchwork_173589v1/shard-tglu-3/igt@kms_chamelium_hpd@vga-hpd=
-for-each-pipe.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/dr=
m/i915/kernel/-/issues/11151">i915#11151</a> / <a href=3D"https://gitlab.fr=
eedesktop.org/drm/i915/kernel/-/issues/7828">i915#7828</a>) +9 other tests =
skip</li>
</ul></li>
<li>
<p>igt@kms_color@deep-color:</p><ul>
<li>shard-dg2:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/Patchwork_173589v1/shard-dg2-8/igt@kms_color@deep-color.html"=
>SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issu=
es/12655">i915#12655</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i9=
15/kernel/-/issues/3555">i915#3555</a>)</li>
</ul></li>
<li>
<p>igt@kms_content_protection@dp-mst-lic-type-0:</p><ul>
<li>shard-tglu:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/Patchwork_173589v1/shard-tglu-3/igt@kms_content_protection@dp=
-mst-lic-type-0.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/d=
rm/i915/kernel/-/issues/15330">i915#15330</a> / <a href=3D"https://gitlab.f=
reedesktop.org/drm/i915/kernel/-/issues/3116">i915#3116</a> / <a href=3D"ht=
tps://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3299">i915#3299</a>)<=
/li>
</ul></li>
<li>
<p>igt@kms_content_protection@dp-mst-lic-type-1:</p><ul>
<li>shard-rkl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/Patchwork_173589v1/shard-rkl-8/igt@kms_content_protection@dp-=
mst-lic-type-1.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/dr=
m/i915/kernel/-/issues/15330">i915#15330</a> / <a href=3D"https://gitlab.fr=
eedesktop.org/drm/i915/kernel/-/issues/3116">i915#3116</a>)</li>
<li>shard-dg1:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/Patchwork_173589v1/shard-dg1-16/igt@kms_content_protection@dp=
-mst-lic-type-1.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/d=
rm/i915/kernel/-/issues/15330">i915#15330</a> / <a href=3D"https://gitlab.f=
reedesktop.org/drm/i915/kernel/-/issues/3299">i915#3299</a>)</li>
</ul></li>
<li>
<p>igt@kms_content_protection@dp-mst-type-0:</p><ul>
<li>shard-dg2:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/Patchwork_173589v1/shard-dg2-8/igt@kms_content_protection@dp-=
mst-type-0.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i9=
15/kernel/-/issues/15330">i915#15330</a> / <a href=3D"https://gitlab.freede=
sktop.org/drm/i915/kernel/-/issues/3299">i915#3299</a>)</li>
</ul></li>
<li>
<p>igt@kms_content_protection@dp-mst-type-1:</p><ul>
<li>shard-tglu-1:       NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/Patchwork_173589v1/shard-tglu-1/igt@kms_content_protection@dp=
-mst-type-1.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i=
915/kernel/-/issues/15330">i915#15330</a> / <a href=3D"https://gitlab.freed=
esktop.org/drm/i915/kernel/-/issues/3116">i915#3116</a> / <a href=3D"https:=
//gitlab.freedesktop.org/drm/i915/kernel/-/issues/3299">i915#3299</a>)</li>
</ul></li>
<li>
<p>igt@kms_content_protection@dp-mst-type-1-suspend-resume:</p><ul>
<li>shard-dg2:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/Patchwork_173589v1/shard-dg2-8/igt@kms_content_protection@dp-=
mst-type-1-suspend-resume.html">SKIP</a> (<a href=3D"https://gitlab.freedes=
ktop.org/drm/i915/kernel/-/issues/15330">i915#15330</a>)</li>
</ul></li>
<li>
<p>igt@kms_content_protection@legacy-hdcp14:</p><ul>
<li>shard-tglu:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/Patchwork_173589v1/shard-tglu-3/igt@kms_content_protection@le=
gacy-hdcp14.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i=
915/kernel/-/issues/15865">i915#15865</a>) +3 other tests skip</li>
</ul></li>
<li>
<p>igt@kms_content_protection@type1:</p><ul>
<li>shard-tglu-1:       NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/Patchwork_173589v1/shard-tglu-1/igt@kms_content_protection@ty=
pe1.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kern=
el/-/issues/15865">i915#15865</a>)</li>
</ul></li>
<li>
<p>igt@kms_content_protection@uevent-hdcp14:</p><ul>
<li>shard-rkl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/Patchwork_173589v1/shard-rkl-4/igt@kms_content_protection@uev=
ent-hdcp14.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i9=
15/kernel/-/issues/15865">i915#15865</a>)</li>
</ul></li>
<li>
<p>igt@kms_cursor_crc@cursor-offscreen-512x170:</p><ul>
<li>shard-dg1:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/Patchwork_173589v1/shard-dg1-16/igt@kms_cursor_crc@cursor-off=
screen-512x170.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/dr=
m/i915/kernel/-/issues/13049">i915#13049</a>)</li>
</ul></li>
<li>
<p>igt@kms_cursor_crc@cursor-onscreen-128x42:</p><ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_19102/shard-rkl-8/igt@kms_cursor_crc@cursor-onscreen-128x42.html">P=
ASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork=
_173589v1/shard-rkl-8/igt@kms_cursor_crc@cursor-onscreen-128x42.html">FAIL<=
/a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/135=
66">i915#13566</a>) +4 other tests fail</li>
</ul></li>
<li>
<p>igt@kms_cursor_crc@cursor-onscreen-32x32:</p><ul>
<li>shard-tglu-1:       NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/Patchwork_173589v1/shard-tglu-1/igt@kms_cursor_crc@cursor-ons=
creen-32x32.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i=
915/kernel/-/issues/3555">i915#3555</a>) +4 other tests skip</li>
</ul></li>
<li>
<p>igt@kms_cursor_crc@cursor-random-512x170:</p><ul>
<li>shard-rkl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/Patchwork_173589v1/shard-rkl-7/igt@kms_cursor_crc@cursor-rand=
om-512x170.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i9=
15/kernel/-/issues/13049">i915#13049</a>)</li>
</ul></li>
<li>
<p>igt@kms_cursor_crc@cursor-rapid-movement-32x10:</p><ul>
<li>shard-tglu:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/Patchwork_173589v1/shard-tglu-10/igt@kms_cursor_crc@cursor-ra=
pid-movement-32x10.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.or=
g/drm/i915/kernel/-/issues/3555">i915#3555</a>) +3 other tests skip</li>
</ul></li>
<li>
<p>igt@kms_cursor_crc@cursor-rapid-movement-512x512:</p><ul>
<li>shard-tglu:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/Patchwork_173589v1/shard-tglu-4/igt@kms_cursor_crc@cursor-rap=
id-movement-512x512.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.o=
rg/drm/i915/kernel/-/issues/13049">i915#13049</a>)</li>
</ul></li>
<li>
<p>igt@kms_cursor_crc@cursor-sliding-128x42@pipe-a-hdmi-a-1:</p><ul>
<li>shard-rkl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/Patchwork_173589v1/shard-rkl-2/igt@kms_cursor_crc@cursor-slid=
ing-128x42@pipe-a-hdmi-a-1.html">FAIL</a> (<a href=3D"https://gitlab.freede=
sktop.org/drm/i915/kernel/-/issues/13566">i915#13566</a>) +6 other tests fa=
il</li>
<li>shard-tglu:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_19102/shard-tglu-4/igt@kms_cursor_crc@cursor-sliding-128x42@pipe-a-=
hdmi-a-1.html">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/d=
rm-tip/Patchwork_173589v1/shard-tglu-2/igt@kms_cursor_crc@cursor-sliding-12=
8x42@pipe-a-hdmi-a-1.html">FAIL</a> (<a href=3D"https://gitlab.freedesktop.=
org/drm/i915/kernel/-/issues/13566">i915#13566</a>) +1 other test fail</li>
</ul></li>
<li>
<p>igt@kms_cursor_crc@cursor-suspend:</p><ul>
<li>shard-glk:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/Patchwork_173589v1/shard-glk8/igt@kms_cursor_crc@cursor-suspe=
nd.html">INCOMPLETE</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915=
/kernel/-/issues/12358">i915#12358</a> / <a href=3D"https://gitlab.freedesk=
top.org/drm/i915/kernel/-/issues/14152">i915#14152</a> / <a href=3D"https:/=
/gitlab.freedesktop.org/drm/i915/kernel/-/issues/7882">i915#7882</a>)</li>
</ul></li>
<li>
<p>igt@kms_cursor_crc@cursor-suspend@pipe-a-hdmi-a-1:</p><ul>
<li>shard-glk:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/Patchwork_173589v1/shard-glk8/igt@kms_cursor_crc@cursor-suspe=
nd@pipe-a-hdmi-a-1.html">INCOMPLETE</a> (<a href=3D"https://gitlab.freedesk=
top.org/drm/i915/kernel/-/issues/12358">i915#12358</a> / <a href=3D"https:/=
/gitlab.freedesktop.org/drm/i915/kernel/-/issues/14152">i915#14152</a>)</li=
>
</ul></li>
<li>
<p>igt@kms_cursor_edge_walk@64x64-right-edge:</p><ul>
<li>shard-tglu:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_19102/shard-tglu-2/igt@kms_cursor_edge_walk@64x64-right-edge.html">=
PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/Patchwor=
k_173589v1/shard-tglu-8/igt@kms_cursor_edge_walk@64x64-right-edge.html">DME=
SG-WARN</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/is=
sues/16685">i915#16685</a>) +1 other test dmesg-warn</li>
</ul></li>
<li>
<p>igt@kms_cursor_legacy@2x-flip-vs-cursor-legacy:</p><ul>
<li>shard-rkl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/Patchwork_173589v1/shard-rkl-2/igt@kms_cursor_legacy@2x-flip-=
vs-cursor-legacy.html">SKIP</a> +87 other tests skip</li>
</ul></li>
<li>
<p>igt@kms_cursor_legacy@basic-busy-flip-before-cursor-varying-size:</p><ul=
>
<li>shard-tglu-1:       NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/Patchwork_173589v1/shard-tglu-1/igt@kms_cursor_legacy@basic-b=
usy-flip-before-cursor-varying-size.html">SKIP</a> (<a href=3D"https://gitl=
ab.freedesktop.org/drm/i915/kernel/-/issues/4103">i915#4103</a>) +1 other t=
est skip</li>
<li>shard-dg1:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/Patchwork_173589v1/shard-dg1-19/igt@kms_cursor_legacy@basic-b=
usy-flip-before-cursor-varying-size.html">SKIP</a> (<a href=3D"https://gitl=
ab.freedesktop.org/drm/i915/kernel/-/issues/4103">i915#4103</a>) +2 other t=
ests skip</li>
</ul></li>
<li>
<p>igt@kms_cursor_legacy@modeset-atomic-cursor-hotspot:</p><ul>
<li>shard-tglu-1:       NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/Patchwork_173589v1/shard-tglu-1/igt@kms_cursor_legacy@modeset=
-atomic-cursor-hotspot.html">SKIP</a> (<a href=3D"https://gitlab.freedeskto=
p.org/drm/i915/kernel/-/issues/9067">i915#9067</a>)</li>
</ul></li>
<li>
<p>igt@kms_dither@fb-8bpc-vs-panel-8bpc:</p><ul>
<li>shard-dg1:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/Patchwork_173589v1/shard-dg1-16/igt@kms_dither@fb-8bpc-vs-pan=
el-8bpc.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/=
kernel/-/issues/3555">i915#3555</a>) +2 other tests skip</li>
</ul></li>
<li>
<p>igt@kms_dp_link_training@non-uhbr-sst:</p><ul>
<li>shard-rkl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/Patchwork_173589v1/shard-rkl-7/igt@kms_dp_link_training@non-u=
hbr-sst.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/=
kernel/-/issues/13749">i915#13749</a>)</li>
</ul></li>
<li>
<p>igt@kms_dp_link_training@uhbr-sst:</p><ul>
<li>shard-dg1:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/Patchwork_173589v1/shard-dg1-16/igt@kms_dp_link_training@uhbr=
-sst.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/ker=
nel/-/issues/13748">i915#13748</a>)</li>
</ul></li>
<li>
<p>igt@kms_dp_linktrain_fallback@dp-fallback:</p><ul>
<li>shard-tglu-1:       NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/Patchwork_173589v1/shard-tglu-1/igt@kms_dp_linktrain_fallback=
@dp-fallback.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/=
i915/kernel/-/issues/16867">i915#16867</a>)</li>
</ul></li>
<li>
<p>igt@kms_dp_linktrain_fallback@dsc-fallback:</p><ul>
<li>shard-tglu-1:       NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/Patchwork_173589v1/shard-tglu-1/igt@kms_dp_linktrain_fallback=
@dsc-fallback.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm=
/i915/kernel/-/issues/13707">i915#13707</a>)</li>
</ul></li>
<li>
<p>igt@kms_dp_linktrain_fallback@uhbr-to-hbr-fallback:</p><ul>
<li>shard-tglu:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/Patchwork_173589v1/shard-tglu-3/igt@kms_dp_linktrain_fallback=
@uhbr-to-hbr-fallback.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop=
.org/drm/i915/kernel/-/issues/16870">i915#16870</a>)</li>
</ul></li>
<li>
<p>igt@kms_draw_crc@draw-method-mmap-gtt:</p><ul>
<li>shard-dg2:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/Patchwork_173589v1/shard-dg2-8/igt@kms_draw_crc@draw-method-m=
map-gtt.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/=
kernel/-/issues/8812">i915#8812</a>)</li>
</ul></li>
<li>
<p>igt@kms_dsc@dsc-basic:</p><ul>
<li>shard-rkl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/Patchwork_173589v1/shard-rkl-2/igt@kms_dsc@dsc-basic.html">SK=
IP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/=
16361">i915#16361</a>) +3 other tests skip</li>
</ul></li>
<li>
<p>igt@kms_dsc@dsc-basic-ultrajoiner:</p><ul>
<li>shard-tglu:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/Patchwork_173589v1/shard-tglu-4/igt@kms_dsc@dsc-basic-ultrajo=
iner.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/ker=
nel/-/issues/16361">i915#16361</a>) +2 other tests skip</li>
</ul></li>
<li>
<p>igt@kms_dsc@dsc-with-bpc-bigjoiner:</p><ul>
<li>shard-dg1:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/Patchwork_173589v1/shard-dg1-16/igt@kms_dsc@dsc-with-bpc-bigj=
oiner.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/ke=
rnel/-/issues/16361">i915#16361</a>) +1 other test skip</li>
</ul></li>
<li>
<p>igt@kms_dsc@dsc-with-formats-ultrajoiner:</p><ul>
<li>shard-dg2:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/Patchwork_173589v1/shard-dg2-8/igt@kms_dsc@dsc-with-formats-u=
ltrajoiner.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i9=
15/kernel/-/issues/16361">i915#16361</a>)</li>
</ul></li>
<li>
<p>igt@kms_dsc@dsc-with-output-formats-bigjoiner:</p><ul>
<li>shard-tglu-1:       NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/Patchwork_173589v1/shard-tglu-1/igt@kms_dsc@dsc-with-output-f=
ormats-bigjoiner.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/=
drm/i915/kernel/-/issues/16361">i915#16361</a>) +1 other test skip</li>
</ul></li>
<li>
<p>igt@kms_fbcon_fbt@psr:</p><ul>
<li>shard-rkl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/Patchwork_173589v1/shard-rkl-7/igt@kms_fbcon_fbt@psr.html">SK=
IP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/=
16680">i915#16680</a>)</li>
</ul></li>
<li>
<p>igt@kms_feature_discovery@display-3x:</p><ul>
<li>shard-rkl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/Patchwork_173589v1/shard-rkl-4/igt@kms_feature_discovery@disp=
lay-3x.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/k=
ernel/-/issues/16081">i915#16081</a>)</li>
<li>shard-tglu:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/Patchwork_173589v1/shard-tglu-10/igt@kms_feature_discovery@di=
splay-3x.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915=
/kernel/-/issues/16081">i915#16081</a>)</li>
</ul></li>
<li>
<p>igt@kms_feature_discovery@display-4x:</p><ul>
<li>shard-tglu-1:       NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/Patchwork_173589v1/shard-tglu-1/igt@kms_feature_discovery@dis=
play-4x.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/=
kernel/-/issues/16081">i915#16081</a>)</li>
</ul></li>
<li>
<p>igt@kms_feature_discovery@psr1:</p><ul>
<li>shard-dg2:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/Patchwork_173589v1/shard-dg2-8/igt@kms_feature_discovery@psr1=
.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/=
-/issues/658">i915#658</a>)</li>
</ul></li>
<li>
<p>igt@kms_fence_pin_leak:</p><ul>
<li>shard-dg2:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/Patchwork_173589v1/shard-dg2-8/igt@kms_fence_pin_leak.html">S=
KIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues=
/4881">i915#4881</a>)</li>
</ul></li>
<li>
<p>igt@kms_flip@2x-absolute-wf_vblank:</p><ul>
<li>shard-tglu:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/Patchwork_173589v1/shard-tglu-4/igt@kms_flip@2x-absolute-wf_v=
blank.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/ke=
rnel/-/issues/3637">i915#3637</a> / <a href=3D"https://gitlab.freedesktop.o=
rg/drm/i915/kernel/-/issues/9934">i915#9934</a>) +7 other tests skip</li>
</ul></li>
<li>
<p>igt@kms_flip@2x-absolute-wf_vblank-interruptible:</p><ul>
<li>shard-dg2:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/Patchwork_173589v1/shard-dg2-8/igt@kms_flip@2x-absolute-wf_vb=
lank-interruptible.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.or=
g/drm/i915/kernel/-/issues/9934">i915#9934</a>) +1 other test skip</li>
</ul></li>
<li>
<p>igt@kms_flip@2x-flip-vs-fences-interruptible:</p><ul>
<li>shard-dg1:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/Patchwork_173589v1/shard-dg1-16/igt@kms_flip@2x-flip-vs-fence=
s-interruptible.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/d=
rm/i915/kernel/-/issues/8381">i915#8381</a>) +1 other test skip</li>
</ul></li>
<li>
<p>igt@kms_flip@2x-flip-vs-panning-vs-hang:</p><ul>
<li>shard-tglu-1:       NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/Patchwork_173589v1/shard-tglu-1/igt@kms_flip@2x-flip-vs-panni=
ng-vs-hang.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i9=
15/kernel/-/issues/3637">i915#3637</a> / <a href=3D"https://gitlab.freedesk=
top.org/drm/i915/kernel/-/issues/9934">i915#9934</a>) +5 other tests skip</=
li>
</ul></li>
<li>
<p>igt@kms_flip@2x-single-buffer-flip-vs-dpms-off-vs-modeset:</p><ul>
<li>shard-dg1:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/Patchwork_173589v1/shard-dg1-16/igt@kms_flip@2x-single-buffer=
-flip-vs-dpms-off-vs-modeset.html">SKIP</a> (<a href=3D"https://gitlab.free=
desktop.org/drm/i915/kernel/-/issues/9934">i915#9934</a>) +1 other test ski=
p</li>
</ul></li>
<li>
<p>igt@kms_flip@2x-wf_vblank-ts-check:</p><ul>
<li>shard-rkl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/Patchwork_173589v1/shard-rkl-2/igt@kms_flip@2x-wf_vblank-ts-c=
heck.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/ker=
nel/-/issues/9934">i915#9934</a>) +4 other tests skip</li>
</ul></li>
<li>
<p>igt@kms_flip@flip-vs-blocking-wf-vblank@b-hdmi-a4:</p><ul>
<li>shard-dg1:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_19102/shard-dg1-19/igt@kms_flip@flip-vs-blocking-wf-vblank@b-hdmi-a=
4.html">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/=
Patchwork_173589v1/shard-dg1-17/igt@kms_flip@flip-vs-blocking-wf-vblank@b-h=
dmi-a4.html">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/k=
ernel/-/issues/14600">i915#14600</a>)</li>
</ul></li>
<li>
<p>igt@kms_flip@flip-vs-dpms-on-nop-interruptible:</p><ul>
<li>shard-snb:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_19102/shard-snb7/igt@kms_flip@flip-vs-dpms-on-nop-interruptible.htm=
l">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/Patch=
work_173589v1/shard-snb5/igt@kms_flip@flip-vs-dpms-on-nop-interruptible.htm=
l">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/is=
sues/10826">i915#10826</a>) +1 other test fail</li>
</ul></li>
<li>
<p>igt@kms_flip@flip-vs-expired-vblank-interruptible:</p><ul>
<li>shard-dg2:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_19102/shard-dg2-6/igt@kms_flip@flip-vs-expired-vblank-interruptible=
.html">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/P=
atchwork_173589v1/shard-dg2-4/igt@kms_flip@flip-vs-expired-vblank-interrupt=
ible.html">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/ker=
nel/-/issues/13027">i915#13027</a>)</li>
</ul></li>
<li>
<p>igt@kms_flip@flip-vs-expired-vblank-interruptible@a-hdmi-a2:</p><ul>
<li>shard-glk11:        <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_19102/shard-glk11/igt@kms_flip@flip-vs-expired-vblank-interruptible=
@a-hdmi-a2.html">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree=
/drm-tip/Patchwork_173589v1/shard-glk11/igt@kms_flip@flip-vs-expired-vblank=
-interruptible@a-hdmi-a2.html">FAIL</a> (<a href=3D"https://gitlab.freedesk=
top.org/drm/i915/kernel/-/issues/13027">i915#13027</a>)</li>
</ul></li>
<li>
<p>igt@kms_flip@flip-vs-expired-vblank-interruptible@c-hdmi-a1:</p><ul>
<li>shard-dg2:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/Patchwork_173589v1/shard-dg2-4/igt@kms_flip@flip-vs-expired-v=
blank-interruptible@c-hdmi-a1.html">FAIL</a> (<a href=3D"https://gitlab.fre=
edesktop.org/drm/i915/kernel/-/issues/13027">i915#13027</a>)</li>
</ul></li>
<li>
<p>igt@kms_flip@flip-vs-suspend:</p><ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_19102/shard-rkl-8/igt@kms_flip@flip-vs-suspend.html">PASS</a> -&gt;=
 <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_173589v1/sha=
rd-rkl-1/igt@kms_flip@flip-vs-suspend.html">ABORT</a> (<a href=3D"https://g=
itlab.freedesktop.org/drm/i915/kernel/-/issues/15132">i915#15132</a> / <a h=
ref=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16925">i915#=
16925</a>)</li>
<li>shard-glk10:        NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/Patchwork_173589v1/shard-glk10/igt@kms_flip@flip-vs-suspend.h=
tml">INCOMPLETE</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/ker=
nel/-/issues/12745">i915#12745</a> / <a href=3D"https://gitlab.freedesktop.=
org/drm/i915/kernel/-/issues/4839">i915#4839</a>)</li>
</ul></li>
<li>
<p>igt@kms_flip@flip-vs-suspend-interruptible:</p><ul>
<li>shard-mtlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_19102/shard-mtlp-4/igt@kms_flip@flip-vs-suspend-interruptible.html"=
>PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/Patchwo=
rk_173589v1/shard-mtlp-3/igt@kms_flip@flip-vs-suspend-interruptible.html">I=
NCOMPLETE</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/=
issues/16472">i915#16472</a> / <a href=3D"https://gitlab.freedesktop.org/dr=
m/i915/kernel/-/issues/6113">i915#6113</a>) +1 other test incomplete</li>
</ul></li>
<li>
<p>igt@kms_flip@flip-vs-suspend@a-hdmi-a1:</p><ul>
<li>shard-glk10:        NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/Patchwork_173589v1/shard-glk10/igt@kms_flip@flip-vs-suspend@a=
-hdmi-a1.html">INCOMPLETE</a> (<a href=3D"https://gitlab.freedesktop.org/dr=
m/i915/kernel/-/issues/12745">i915#12745</a>)</li>
</ul></li>
<li>
<p>igt@kms_flip@flip-vs-suspend@a-hdmi-a2:</p><ul>
<li>shard-rkl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/Patchwork_173589v1/shard-rkl-1/igt@kms_flip@flip-vs-suspend@a=
-hdmi-a2.html">ABORT</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i91=
5/kernel/-/issues/15132">i915#15132</a> / <a href=3D"https://gitlab.freedes=
ktop.org/drm/i915/kernel/-/issues/16925">i915#16925</a>)</li>
</ul></li>
<li>
<p>igt@kms_flip@flip-vs-wf_vblank-interruptible:</p><ul>
<li>shard-dg1:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_19102/shard-dg1-15/igt@kms_flip@flip-vs-wf_vblank-interruptible.htm=
l">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/Patch=
work_173589v1/shard-dg1-18/igt@kms_flip@flip-vs-wf_vblank-interruptible.htm=
l">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/is=
sues/10826">i915#10826</a>)</li>
</ul></li>
<li>
<p>igt@kms_flip_scaled_crc@flip-32bpp-4tile-to-64bpp-4tile-upscaling:</p><u=
l>
<li>shard-dg1:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/Patchwork_173589v1/shard-dg1-16/igt@kms_flip_scaled_crc@flip-=
32bpp-4tile-to-64bpp-4tile-upscaling.html">SKIP</a> (<a href=3D"https://git=
lab.freedesktop.org/drm/i915/kernel/-/issues/15643">i915#15643</a>) +4 othe=
r tests skip</li>
</ul></li>
<li>
<p>igt@kms_flip_scaled_crc@flip-32bpp-yftile-to-32bpp-yftileccs-upscaling:<=
/p><ul>
<li>shard-dg2:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/Patchwork_173589v1/shard-dg2-8/igt@kms_flip_scaled_crc@flip-3=
2bpp-yftile-to-32bpp-yftileccs-upscaling.html">SKIP</a> (<a href=3D"https:/=
/gitlab.freedesktop.org/drm/i915/kernel/-/issues/15643">i915#15643</a>)</li=
>
</ul></li>
<li>
<p>igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-16bpp-4tile-downscaling:</p>=
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/Patchwork_173589v1/shard-tglu-10/igt@kms_flip_scaled_crc@flip=
-64bpp-4tile-to-16bpp-4tile-downscaling.html">SKIP</a> (<a href=3D"https://=
gitlab.freedesktop.org/drm/i915/kernel/-/issues/15643">i915#15643</a>) +3 o=
ther tests skip</li>
</ul></li>
<li>
<p>igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-16bpp-4tile-upscaling:</p><u=
l>
<li>shard-rkl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/Patchwork_173589v1/shard-rkl-2/igt@kms_flip_scaled_crc@flip-6=
4bpp-4tile-to-16bpp-4tile-upscaling.html">SKIP</a> (<a href=3D"https://gitl=
ab.freedesktop.org/drm/i915/kernel/-/issues/15643">i915#15643</a>) +2 other=
 tests skip</li>
</ul></li>
<li>
<p>igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-32bpp-4tiledg2rcccs-upscalin=
g:</p><ul>
<li>shard-tglu-1:       NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/Patchwork_173589v1/shard-tglu-1/igt@kms_flip_scaled_crc@flip-=
64bpp-4tile-to-32bpp-4tiledg2rcccs-upscaling.html">SKIP</a> (<a href=3D"htt=
ps://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15643">i915#15643</a>)=
 +2 other tests skip</li>
</ul></li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-1p-primscrn-spr-indfb-draw-mmap-wc:</p>=
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/Patchwork_173589v1/shard-dg2-8/igt@kms_frontbuffer_tracking@f=
bc-1p-primscrn-spr-indfb-draw-mmap-wc.html">SKIP</a> (<a href=3D"https://gi=
tlab.freedesktop.org/drm/i915/kernel/-/issues/15990">i915#15990</a> / <a hr=
ef=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8708">i915#87=
08</a>) +3 other tests skip</li>
</ul></li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-suspend:</p><ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_19102/shard-rkl-7/igt@kms_frontbuffer_tracking@fbc-suspend.html">PA=
SS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_=
173589v1/shard-rkl-7/igt@kms_frontbuffer_tracking@fbc-suspend.html">INCOMPL=
ETE</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues=
/10056">i915#10056</a>)</li>
<li>shard-glk10:        NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/Patchwork_173589v1/shard-glk10/igt@kms_frontbuffer_tracking@f=
bc-suspend.html">INCOMPLETE</a> (<a href=3D"https://gitlab.freedesktop.org/=
drm/i915/kernel/-/issues/10056">i915#10056</a> / <a href=3D"https://gitlab.=
freedesktop.org/drm/i915/kernel/-/issues/16593">i915#16593</a>)</li>
</ul></li>
<li>
<p>igt@kms_frontbuffer_tracking@fbchdr-1p-offscreen-pri-indfb-draw-mmap-wc:=
</p><ul>
<li>shard-tglu:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/Patchwork_173589v1/shard-tglu-4/igt@kms_frontbuffer_tracking@=
fbchdr-1p-offscreen-pri-indfb-draw-mmap-wc.html">SKIP</a> (<a href=3D"https=
://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15989">i915#15989</a>) +=
23 other tests skip</li>
</ul></li>
<li>
<p>igt@kms_frontbuffer_tracking@fbchdr-1p-primscrn-spr-indfb-draw-render:</=
p><ul>
<li>shard-dg2:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/Patchwork_173589v1/shard-dg2-8/igt@kms_frontbuffer_tracking@f=
bchdr-1p-primscrn-spr-indfb-draw-render.html">SKIP</a> (<a href=3D"https://=
gitlab.freedesktop.org/drm/i915/kernel/-/issues/15989">i915#15989</a>) +6 o=
ther tests skip</li>
</ul></li>
<li>
<p>igt@kms_frontbuffer_tracking@fbchdr-1p-primscrn-spr-indfb-onoff:</p><ul>
<li>shard-rkl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/Patchwork_173589v1/shard-rkl-4/igt@kms_frontbuffer_tracking@f=
bchdr-1p-primscrn-spr-indfb-onoff.html">SKIP</a> (<a href=3D"https://gitlab=
.freedesktop.org/drm/i915/kernel/-/issues/15989">i915#15989</a>) +16 other =
tests skip</li>
</ul></li>
<li>
<p>igt@kms_frontbuffer_tracking@fbchdr-2p-primscrn-spr-indfb-draw-mmap-cpu:=
</p><ul>
<li>shard-glk:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_19102/shard-glk8/igt@kms_frontbuffer_tracking@fbchdr-2p-primscrn-sp=
r-indfb-draw-mmap-cpu.html">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.=
01.org/tree/drm-tip/Patchwork_173589v1/shard-glk9/igt@kms_frontbuffer_track=
ing@fbchdr-2p-primscrn-spr-indfb-draw-mmap-cpu.html">SKIP</a> +2 other test=
s skip</li>
</ul></li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-pri-indfb-draw-pwrite:</=
p><ul>
<li>shard-dg2:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/Patchwork_173589v1/shard-dg2-8/igt@kms_frontbuffer_tracking@f=
bcpsr-1p-primscrn-pri-indfb-draw-pwrite.html">SKIP</a> (<a href=3D"https://=
gitlab.freedesktop.org/drm/i915/kernel/-/issues/15102">i915#15102</a>) +13 =
other tests skip</li>
</ul></li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-pri-indfb-draw-mmap-gtt:=
</p><ul>
<li>shard-glk10:        NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/Patchwork_173589v1/shard-glk10/igt@kms_frontbuffer_tracking@f=
bcpsr-2p-primscrn-pri-indfb-draw-mmap-gtt.html">SKIP</a> +70 other tests sk=
ip</li>
</ul></li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-pri-shrfb-draw-mmap-wc:<=
/p><ul>
<li>shard-rkl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/Patchwork_173589v1/shard-rkl-8/igt@kms_frontbuffer_tracking@f=
bcpsr-2p-primscrn-pri-shrfb-draw-mmap-wc.html">SKIP</a> (<a href=3D"https:/=
/gitlab.freedesktop.org/drm/i915/kernel/-/issues/1825">i915#1825</a>) +5 ot=
her tests skip</li>
<li>shard-dg1:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/Patchwork_173589v1/shard-dg1-16/igt@kms_frontbuffer_tracking@=
fbcpsr-2p-primscrn-pri-shrfb-draw-mmap-wc.html">SKIP</a> (<a href=3D"https:=
//gitlab.freedesktop.org/drm/i915/kernel/-/issues/15990">i915#15990</a> / <=
a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8708">i91=
5#8708</a>) +9 other tests skip</li>
</ul></li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-spr-indfb-fullscreen:</p=
><ul>
<li>shard-tglu:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/Patchwork_173589v1/shard-tglu-10/igt@kms_frontbuffer_tracking=
@fbcpsr-2p-scndscrn-spr-indfb-fullscreen.html">SKIP</a> +103 other tests sk=
ip</li>
</ul></li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-tiling-4:</p><ul>
<li>shard-rkl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/Patchwork_173589v1/shard-rkl-2/igt@kms_frontbuffer_tracking@f=
bcpsr-tiling-4.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/dr=
m/i915/kernel/-/issues/5439">i915#5439</a>)</li>
</ul></li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsrhdr-1p-offscreen-pri-shrfb-draw-mmap-=
cpu:</p><ul>
<li>shard-tglu-1:       NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/Patchwork_173589v1/shard-tglu-1/igt@kms_frontbuffer_tracking@=
fbcpsrhdr-1p-offscreen-pri-shrfb-draw-mmap-cpu.html">SKIP</a> (<a href=3D"h=
ttps://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15102">i915#15102</a=
>) +27 other tests skip</li>
</ul></li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsrhdr-1p-primscrn-cur-indfb-draw-mmap-w=
c:</p><ul>
<li>shard-glk:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/Patchwork_173589v1/shard-glk4/igt@kms_frontbuffer_tracking@fb=
cpsrhdr-1p-primscrn-cur-indfb-draw-mmap-wc.html">SKIP</a> +185 other tests =
skip</li>
</ul></li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsrhdr-2p-primscrn-cur-indfb-draw-mmap-g=
tt:</p><ul>
<li>shard-dg1:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/Patchwork_173589v1/shard-dg1-16/igt@kms_frontbuffer_tracking@=
fbcpsrhdr-2p-primscrn-cur-indfb-draw-mmap-gtt.html">SKIP</a> (<a href=3D"ht=
tps://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15990">i915#15990</a>=
) +14 other tests skip</li>
</ul></li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsrhdr-2p-primscrn-shrfb-plflip-blt:</p>=
<ul>
<li>shard-tglu-1:       NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/Patchwork_173589v1/shard-tglu-1/igt@kms_frontbuffer_tracking@=
fbcpsrhdr-2p-primscrn-shrfb-plflip-blt.html">SKIP</a> +61 other tests skip<=
/li>
</ul></li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsrhdr-2p-scndscrn-pri-indfb-draw-mmap-w=
c:</p><ul>
<li>shard-dg2:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/Patchwork_173589v1/shard-dg2-8/igt@kms_frontbuffer_tracking@f=
bcpsrhdr-2p-scndscrn-pri-indfb-draw-mmap-wc.html">SKIP</a> (<a href=3D"http=
s://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15990">i915#15990</a>) =
+4 other tests skip</li>
</ul></li>
<li>
<p>igt@kms_frontbuffer_tracking@hdr-1p-primscrn-pri-shrfb-draw-mmap-cpu:</p=
><ul>
<li>shard-tglu-1:       NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/Patchwork_173589v1/shard-tglu-1/igt@kms_frontbuffer_tracking@=
hdr-1p-primscrn-pri-shrfb-draw-mmap-cpu.html">SKIP</a> (<a href=3D"https://=
gitlab.freedesktop.org/drm/i915/kernel/-/issues/15989">i915#15989</a>) +8 o=
ther tests skip</li>
</ul></li>
<li>
<p>igt@kms_frontbuffer_tracking@hdr-farfromfence-mmap-gtt:</p><ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_19102/shard-rkl-6/igt@kms_frontbuffer_tracking@hdr-farfromfence-mma=
p-gtt.html">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-=
tip/Patchwork_173589v1/shard-rkl-4/igt@kms_frontbuffer_tracking@hdr-farfrom=
fence-mmap-gtt.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/dr=
m/i915/kernel/-/issues/15989">i915#15989</a>) +17 other tests skip</li>
</ul></li>
<li>
<p>igt@kms_frontbuffer_tracking@hdr-modesetfrombusy:</p><ul>
<li>shard-dg1:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/Patchwork_173589v1/shard-dg1-16/igt@kms_frontbuffer_tracking@=
hdr-modesetfrombusy.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.o=
rg/drm/i915/kernel/-/issues/15989">i915#15989</a>) +8 other tests skip</li>
</ul></li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-1p-offscreen-pri-shrfb-draw-mmap-gtt:</=
p><ul>
<li>shard-dg1:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/Patchwork_173589v1/shard-dg1-16/igt@kms_frontbuffer_tracking@=
psr-1p-offscreen-pri-shrfb-draw-mmap-gtt.html">SKIP</a> (<a href=3D"https:/=
/gitlab.freedesktop.org/drm/i915/kernel/-/issues/15104">i915#15104</a> / <a=
 href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15990">i91=
5#15990</a>) +1 other test skip</li>
</ul></li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-1p-primscrn-pri-shrfb-draw-pwrite:</p><=
ul>
<li>shard-tglu:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/Patchwork_173589v1/shard-tglu-3/igt@kms_frontbuffer_tracking@=
psr-1p-primscrn-pri-shrfb-draw-pwrite.html">SKIP</a> (<a href=3D"https://gi=
tlab.freedesktop.org/drm/i915/kernel/-/issues/15102">i915#15102</a>) +38 ot=
her tests skip</li>
</ul></li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-2p-primscrn-indfb-msflip-blt:</p><ul>
<li>shard-glk11:        NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/Patchwork_173589v1/shard-glk11/igt@kms_frontbuffer_tracking@p=
sr-2p-primscrn-indfb-msflip-blt.html">SKIP</a> +113 other tests skip</li>
</ul></li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-2p-scndscrn-pri-shrfb-draw-blt:</p><ul>
<li>shard-dg2:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/Patchwork_173589v1/shard-dg2-8/igt@kms_frontbuffer_tracking@p=
sr-2p-scndscrn-pri-shrfb-draw-blt.html">SKIP</a> (<a href=3D"https://gitlab=
.freedesktop.org/drm/i915/kernel/-/issues/15991">i915#15991</a> / <a href=
=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5354">i915#5354=
</a>) +3 other tests skip</li>
</ul></li>
<li>
<p>igt@kms_frontbuffer_tracking@psrhdr-1p-primscrn-spr-indfb-move:</p><ul>
<li>shard-rkl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/Patchwork_173589v1/shard-rkl-2/igt@kms_frontbuffer_tracking@p=
srhdr-1p-primscrn-spr-indfb-move.html">SKIP</a> (<a href=3D"https://gitlab.=
freedesktop.org/drm/i915/kernel/-/issues/15102">i915#15102</a>) +41 other t=
ests skip</li>
</ul></li>
<li>
<p>igt@kms_frontbuffer_tracking@psrhdr-2p-primscrn-spr-indfb-onoff:</p><ul>
<li>shard-dg1:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/Patchwork_173589v1/shard-dg1-16/igt@kms_frontbuffer_tracking@=
psrhdr-2p-primscrn-spr-indfb-onoff.html">SKIP</a> +39 other tests skip</li>
</ul></li>
<li>
<p>igt@kms_frontbuffer_tracking@psrhdr-2p-scndscrn-shrfb-plflip-blt:</p><ul=
>
<li>shard-dg2:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/Patchwork_173589v1/shard-dg2-8/igt@kms_frontbuffer_tracking@p=
srhdr-2p-scndscrn-shrfb-plflip-blt.html">SKIP</a> (<a href=3D"https://gitla=
b.freedesktop.org/drm/i915/kernel/-/issues/15991">i915#15991</a>) +4 other =
tests skip</li>
</ul></li>
<li>
<p>igt@kms_frontbuffer_tracking@psrhdr-rgb565-draw-render:</p><ul>
<li>shard-dg1:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/Patchwork_173589v1/shard-dg1-16/igt@kms_frontbuffer_tracking@=
psrhdr-rgb565-draw-render.html">SKIP</a> (<a href=3D"https://gitlab.freedes=
ktop.org/drm/i915/kernel/-/issues/15102">i915#15102</a>) +22 other tests sk=
ip</li>
</ul></li>
<li>
<p>igt@kms_hdr@bpc-switch:</p><ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_19102/shard-rkl-6/igt@kms_hdr@bpc-switch.html">PASS</a> -&gt; <a hr=
ef=3D"https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_173589v1/shard-rkl=
-4/igt@kms_hdr@bpc-switch.html">SKIP</a> (<a href=3D"https://gitlab.freedes=
ktop.org/drm/i915/kernel/-/issues/16644">i915#16644</a> / <a href=3D"https:=
//gitlab.freedesktop.org/drm/i915/kernel/-/issues/3555">i915#3555</a> / <a =
href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8228">i915#=
8228</a>)</li>
<li>shard-tglu:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/Patchwork_173589v1/shard-tglu-10/igt@kms_hdr@bpc-switch.html"=
>SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issu=
es/3555">i915#3555</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i915=
/kernel/-/issues/8228">i915#8228</a>)</li>
</ul></li>
<li>
<p>igt@kms_hdr@brightness-with-hdr:</p><ul>
<li>shard-rkl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/Patchwork_173589v1/shard-rkl-7/igt@kms_hdr@brightness-with-hd=
r.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel=
/-/issues/12713">i915#12713</a> / <a href=3D"https://gitlab.freedesktop.org=
/drm/i915/kernel/-/issues/16644">i915#16644</a>)</li>
</ul></li>
<li>
<p>igt@kms_hdr@invalid-metadata-sizes:</p><ul>
<li>shard-tglu-1:       NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/Patchwork_173589v1/shard-tglu-1/igt@kms_hdr@invalid-metadata-=
sizes.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/ke=
rnel/-/issues/3555">i915#3555</a> / <a href=3D"https://gitlab.freedesktop.o=
rg/drm/i915/kernel/-/issues/8228">i915#8228</a>)</li>
</ul></li>
<li>
<p>igt@kms_hdr@static-toggle:</p><ul>
<li>shard-rkl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/Patchwork_173589v1/shard-rkl-2/igt@kms_hdr@static-toggle.html=
">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/iss=
ues/16644">i915#16644</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i=
915/kernel/-/issues/3555">i915#3555</a> / <a href=3D"https://gitlab.freedes=
ktop.org/drm/i915/kernel/-/issues/8228">i915#8228</a>)</li>
</ul></li>
<li>
<p>igt@kms_joiner@basic-big-joiner:</p><ul>
<li>shard-rkl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/Patchwork_173589v1/shard-rkl-8/igt@kms_joiner@basic-big-joine=
r.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel=
/-/issues/15460">i915#15460</a>)</li>
<li>shard-dg1:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/Patchwork_173589v1/shard-dg1-16/igt@kms_joiner@basic-big-join=
er.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kerne=
l/-/issues/15460">i915#15460</a>)</li>
</ul></li>
<li>
<p>igt@kms_joiner@basic-force-big-joiner:</p><ul>
<li>shard-dg1:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/Patchwork_173589v1/shard-dg1-16/igt@kms_joiner@basic-force-bi=
g-joiner.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915=
/kernel/-/issues/15459">i915#15459</a>)</li>
</ul></li>
<li>
<p>igt@kms_joiner@invalid-modeset-ultra-joiner:</p><ul>
<li>shard-dg2:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/Patchwork_173589v1/shard-dg2-8/igt@kms_joiner@invalid-modeset=
-ultra-joiner.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm=
/i915/kernel/-/issues/15458">i915#15458</a>)</li>
</ul></li>
<li>
<p>igt@kms_mst@mst-suspend-read-crc:</p><ul>
<li>shard-rkl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/Patchwork_173589v1/shard-rkl-2/igt@kms_mst@mst-suspend-read-c=
rc.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kerne=
l/-/issues/16451">i915#16451</a>)</li>
</ul></li>
<li>
<p>igt@kms_panel_fitting@atomic-fastset:</p><ul>
<li>shard-rkl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/Patchwork_173589v1/shard-rkl-2/igt@kms_panel_fitting@atomic-f=
astset.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/k=
ernel/-/issues/6301">i915#6301</a>) +1 other test skip</li>
</ul></li>
<li>
<p>igt@kms_pipe_crc_basic@suspend-read-crc@pipe-c-hdmi-a-2:</p><ul>
<li>shard-rkl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/Patchwork_173589v1/shard-rkl-3/igt@kms_pipe_crc_basic@suspend=
-read-crc@pipe-c-hdmi-a-2.html">INCOMPLETE</a> (<a href=3D"https://gitlab.f=
reedesktop.org/drm/i915/kernel/-/issues/12756">i915#12756</a>)</li>
</ul></li>
<li>
<p>igt@kms_pipe_stress@stress-xrgb8888-4tiled:</p><ul>
<li>shard-tglu:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/Patchwork_173589v1/shard-tglu-10/igt@kms_pipe_stress@stress-x=
rgb8888-4tiled.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/dr=
m/i915/kernel/-/issues/14712">i915#14712</a>)</li>
</ul></li>
<li>
<p>igt@kms_plane@pixel-format-4-tiled-mtl-mc-ccs-modifier-source-clamping:<=
/p><ul>
<li>shard-tglu:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/Patchwork_173589v1/shard-tglu-3/igt@kms_plane@pixel-format-4-=
tiled-mtl-mc-ccs-modifier-source-clamping.html">SKIP</a> (<a href=3D"https:=
//gitlab.freedesktop.org/drm/i915/kernel/-/issues/15709">i915#15709</a>) +2=
 other tests skip</li>
</ul></li>
<li>
<p>igt@kms_plane@pixel-format-y-tiled-ccs-modifier:</p><ul>
<li>shard-dg1:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/Patchwork_173589v1/shard-dg1-16/igt@kms_plane@pixel-format-y-=
tiled-ccs-modifier.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.or=
g/drm/i915/kernel/-/issues/15709">i915#15709</a>) +2 other tests skip</li>
</ul></li>
<li>
<p>igt@kms_plane@pixel-format-y-tiled-gen12-mc-ccs-modifier:</p><ul>
<li>shard-tglu-1:       NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/Patchwork_173589v1/shard-tglu-1/igt@kms_plane@pixel-format-y-=
tiled-gen12-mc-ccs-modifier.html">SKIP</a> (<a href=3D"https://gitlab.freed=
esktop.org/drm/i915/kernel/-/issues/15709">i915#15709</a>) +3 other tests s=
kip</li>
</ul></li>
<li>
<p>igt@kms_plane@pixel-format-y-tiled-modifier@pipe-b-plane-7:</p><ul>
<li>shard-dg1:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/Patchwork_173589v1/shard-dg1-16/igt@kms_plane@pixel-format-y-=
tiled-modifier@pipe-b-plane-7.html">SKIP</a> (<a href=3D"https://gitlab.fre=
edesktop.org/drm/i915/kernel/-/issues/16386">i915#16386</a>) +1 other test =
skip</li>
</ul></li>
<li>
<p>igt@kms_plane@pixel-format-yf-tiled-ccs-modifier-source-clamping:</p><ul=
>
<li>shard-dg2:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/Patchwork_173589v1/shard-dg2-8/igt@kms_plane@pixel-format-yf-=
tiled-ccs-modifier-source-clamping.html">SKIP</a> (<a href=3D"https://gitla=
b.freedesktop.org/drm/i915/kernel/-/issues/15709">i915#15709</a>)</li>
</ul></li>
<li>
<p>igt@kms_plane@pixel-format-yf-tiled-modifier:</p><ul>
<li>shard-rkl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/Patchwork_173589v1/shard-rkl-4/igt@kms_plane@pixel-format-yf-=
tiled-modifier.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/dr=
m/i915/kernel/-/issues/15709">i915#15709</a>) +2 other tests skip</li>
</ul></li>
<li>
<p>igt@kms_plane@planar-pixel-format-settings@nv12-tile4-src-y:</p><ul>
<li>shard-dg1:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/Patchwork_173589v1/shard-dg1-16/igt@kms_plane@planar-pixel-fo=
rmat-settings@nv12-tile4-src-y.html">SKIP</a> (<a href=3D"https://gitlab.fr=
eedesktop.org/drm/i915/kernel/-/issues/16112">i915#16112</a>)</li>
</ul></li>
<li>
<p>igt@kms_plane_alpha_blend@alpha-basic:</p><ul>
<li>shard-glk:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/Patchwork_173589v1/shard-glk5/igt@kms_plane_alpha_blend@alpha=
-basic.html">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/k=
ernel/-/issues/12178">i915#12178</a>)</li>
</ul></li>
<li>
<p>igt@kms_plane_alpha_blend@alpha-basic@pipe-a-hdmi-a-1:</p><ul>
<li>shard-glk:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/Patchwork_173589v1/shard-glk5/igt@kms_plane_alpha_blend@alpha=
-basic@pipe-a-hdmi-a-1.html">FAIL</a> (<a href=3D"https://gitlab.freedeskto=
p.org/drm/i915/kernel/-/issues/7862">i915#7862</a>) +1 other test fail</li>
</ul></li>
<li>
<p>igt@kms_plane_cursor@viewport@pipe-a-hdmi-a-1-size-128:</p><ul>
<li>shard-rkl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/Patchwork_173589v1/shard-rkl-2/igt@kms_plane_cursor@viewport@=
pipe-a-hdmi-a-1-size-128.html">FAIL</a> (<a href=3D"https://gitlab.freedesk=
top.org/drm/i915/kernel/-/issues/15913">i915#15913</a>) +1 other test fail<=
/li>
</ul></li>
<li>
<p>igt@kms_plane_cursor@viewport@pipe-a-hdmi-a-1-size-64:</p><ul>
<li>shard-rkl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/Patchwork_173589v1/shard-rkl-2/igt@kms_plane_cursor@viewport@=
pipe-a-hdmi-a-1-size-64.html">FAIL</a> (<a href=3D"https://gitlab.freedeskt=
op.org/drm/i915/kernel/-/issues/15912">i915#15912</a>)</li>
</ul></li>
<li>
<p>igt@kms_plane_multiple@2x-tiling-4:</p><ul>
<li>shard-rkl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/Patchwork_173589v1/shard-rkl-2/igt@kms_plane_multiple@2x-tili=
ng-4.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/ker=
nel/-/issues/13958">i915#13958</a>)</li>
</ul></li>
<li>
<p>igt@kms_plane_multiple@2x-tiling-x:</p><ul>
<li>shard-dg2:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/Patchwork_173589v1/shard-dg2-8/igt@kms_plane_multiple@2x-tili=
ng-x.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/ker=
nel/-/issues/13958">i915#13958</a>)</li>
</ul></li>
<li>
<p>igt@kms_plane_multiple@tiling-yf:</p><ul>
<li>shard-tglu:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/Patchwork_173589v1/shard-tglu-10/igt@kms_plane_multiple@tilin=
g-yf.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/ker=
nel/-/issues/14259">i915#14259</a>)</li>
</ul></li>
<li>
<p>igt@kms_plane_scaling@plane-downscale-factor-0-5-with-rotation@pipe-d:</=
p><ul>
<li>shard-tglu-1:       NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/Patchwork_173589v1/shard-tglu-1/igt@kms_plane_scaling@plane-d=
ownscale-factor-0-5-with-rotation@pipe-d.html">SKIP</a> (<a href=3D"https:/=
/gitlab.freedesktop.org/drm/i915/kernel/-/issues/15329">i915#15329</a>) +4 =
other tests skip</li>
</ul></li>
<li>
<p>igt@kms_pm_backlight@brightness-with-dpms:</p><ul>
<li>shard-dg2:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/Patchwork_173589v1/shard-dg2-8/igt@kms_pm_backlight@brightnes=
s-with-dpms.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i=
915/kernel/-/issues/12343">i915#12343</a>)</li>
</ul></li>
<li>
<p>igt@kms_pm_backlight@fade-with-dpms:</p><ul>
<li>shard-tglu:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/Patchwork_173589v1/shard-tglu-10/igt@kms_pm_backlight@fade-wi=
th-dpms.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/=
kernel/-/issues/12343">i915#12343</a> / <a href=3D"https://gitlab.freedeskt=
op.org/drm/i915/kernel/-/issues/9812">i915#9812</a>) +1 other test skip</li=
>
</ul></li>
<li>
<p>igt@kms_pm_backlight@fade-with-suspend:</p><ul>
<li>shard-rkl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/Patchwork_173589v1/shard-rkl-4/igt@kms_pm_backlight@fade-with=
-suspend.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915=
/kernel/-/issues/12343">i915#12343</a> / <a href=3D"https://gitlab.freedesk=
top.org/drm/i915/kernel/-/issues/5354">i915#5354</a>) +1 other test skip</l=
i>
</ul></li>
<li>
<p>igt@kms_pm_dc@dc5-psr-suspend-resume:</p><ul>
<li>shard-tglu-1:       NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/Patchwork_173589v1/shard-tglu-1/igt@kms_pm_dc@dc5-psr-suspend=
-resume.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/=
kernel/-/issues/16914">i915#16914</a>)</li>
</ul></li>
<li>
<p>igt@kms_pm_dc@dc6-dpms:</p><ul>
<li>shard-tglu:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/Patchwork_173589v1/shard-tglu-3/igt@kms_pm_dc@dc6-dpms.html">=
FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issue=
s/16479">i915#16479</a>)</li>
</ul></li>
<li>
<p>igt@kms_pm_dc@dc6-psr:</p><ul>
<li>shard-dg1:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/Patchwork_173589v1/shard-dg1-16/igt@kms_pm_dc@dc6-psr.html">S=
KIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues=
/15948">i915#15948</a>)</li>
</ul></li>
<li>
<p>igt@kms_pm_lpsp@kms-lpsp:</p><ul>
<li>shard-dg1:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/Patchwork_173589v1/shard-dg1-16/igt@kms_pm_lpsp@kms-lpsp.html=
">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/iss=
ues/9340">i915#9340</a>)</li>
</ul></li>
<li>
<p>igt@kms_pm_rpm@dpms-mode-unset-lpsp:</p><ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_19102/shard-rkl-2/igt@kms_pm_rpm@dpms-mode-unset-lpsp.html">PASS</a=
> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_17358=
9v1/shard-rkl-6/igt@kms_pm_rpm@dpms-mode-unset-lpsp.html">SKIP</a> (<a href=
=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#145=
44</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues=
/15073">i915#15073</a>)</li>
</ul></li>
<li>
<p>igt@kms_pm_rpm@dpms-non-lpsp:</p><ul>
<li>shard-tglu:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/Patchwork_173589v1/shard-tglu-10/igt@kms_pm_rpm@dpms-non-lpsp=
.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/=
-/issues/15073">i915#15073</a>) +1 other test skip</li>
</ul></li>
<li>
<p>igt@kms_pm_rpm@fences:</p><ul>
<li>shard-dg1:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/Patchwork_173589v1/shard-dg1-16/igt@kms_pm_rpm@fences.html">S=
KIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues=
/4077">i915#4077</a>) +9 other tests skip</li>
</ul></li>
<li>
<p>igt@kms_pm_rpm@modeset-non-lpsp:</p><ul>
<li>shard-dg2:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_19102/shard-dg2-5/igt@kms_pm_rpm@modeset-non-lpsp.html">PASS</a> -&=
gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_173589v1/=
shard-dg2-4/igt@kms_pm_rpm@modeset-non-lpsp.html">SKIP</a> (<a href=3D"http=
s://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15073">i915#15073</a>)<=
/li>
</ul></li>
<li>
<p>igt@kms_pm_rpm@modeset-non-lpsp-stress:</p><ul>
<li>shard-dg1:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_19102/shard-dg1-12/igt@kms_pm_rpm@modeset-non-lpsp-stress.html">PAS=
S</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_1=
73589v1/shard-dg1-15/igt@kms_pm_rpm@modeset-non-lpsp-stress.html">SKIP</a> =
(<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15073">=
i915#15073</a>) +1 other test skip</li>
</ul></li>
<li>
<p>igt@kms_pm_rpm@modeset-non-lpsp-stress-no-wait:</p><ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_19102/shard-rkl-4/igt@kms_pm_rpm@modeset-non-lpsp-stress-no-wait.ht=
ml">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/Patc=
hwork_173589v1/shard-rkl-2/igt@kms_pm_rpm@modeset-non-lpsp-stress-no-wait.h=
tml">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/=
issues/15073">i915#15073</a>)</li>
</ul></li>
<li>
<p>igt@kms_psr2_sf@fbc-pr-cursor-plane-move-continuous-exceed-sf:</p><ul>
<li>shard-dg2:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/Patchwork_173589v1/shard-dg2-8/igt@kms_psr2_sf@fbc-pr-cursor-=
plane-move-continuous-exceed-sf.html">SKIP</a> (<a href=3D"https://gitlab.f=
reedesktop.org/drm/i915/kernel/-/issues/11520">i915#11520</a>) +1 other tes=
t skip</li>
</ul></li>
<li>
<p>igt@kms_psr2_sf@fbc-pr-cursor-plane-update-sf:</p><ul>
<li>shard-tglu:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/Patchwork_173589v1/shard-tglu-4/igt@kms_psr2_sf@fbc-pr-cursor=
-plane-update-sf.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/=
drm/i915/kernel/-/issues/11520">i915#11520</a>) +7 other tests skip</li>
</ul></li>
<li>
<p>igt@kms_psr2_sf@fbc-pr-primary-plane-update-sf-dmg-area:</p><ul>
<li>shard-rkl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/Patchwork_173589v1/shard-rkl-2/igt@kms_psr2_sf@fbc-pr-primary=
-plane-update-sf-dmg-area.html">SKIP</a> (<a href=3D"https://gitlab.freedes=
ktop.org/drm/i915/kernel/-/issues/11520">i915#11520</a>) +7 other tests ski=
p</li>
</ul></li>
<li>
<p>igt@kms_psr2_sf@fbc-psr2-cursor-plane-move-continuous-exceed-sf:</p><ul>
<li>shard-dg1:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/Patchwork_173589v1/shard-dg1-16/igt@kms_psr2_sf@fbc-psr2-curs=
or-plane-move-continuous-exceed-sf.html">SKIP</a> (<a href=3D"https://gitla=
b.freedesktop.org/drm/i915/kernel/-/issues/11520">i915#11520</a>) +4 other =
tests skip</li>
</ul></li>
<li>
<p>igt@kms_psr2_sf@fbc-psr2-cursor-plane-move-continuous-sf:</p><ul>
<li>shard-glk:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/Patchwork_173589v1/shard-glk4/igt@kms_psr2_sf@fbc-psr2-cursor=
-plane-move-continuous-sf.html">SKIP</a> (<a href=3D"https://gitlab.freedes=
ktop.org/drm/i915/kernel/-/issues/11520">i915#11520</a>) +4 other tests ski=
p</li>
</ul></li>
<li>
<p>igt@kms_psr2_sf@pr-overlay-plane-move-continuous-exceed-sf:</p><ul>
<li>shard-tglu-1:       NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/Patchwork_173589v1/shard-tglu-1/igt@kms_psr2_sf@pr-overlay-pl=
ane-move-continuous-exceed-sf.html">SKIP</a> (<a href=3D"https://gitlab.fre=
edesktop.org/drm/i915/kernel/-/issues/11520">i915#11520</a>) +3 other tests=
 skip</li>
<li>shard-glk10:        NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/Patchwork_173589v1/shard-glk10/igt@kms_psr2_sf@pr-overlay-pla=
ne-move-continuous-exceed-sf.html">SKIP</a> (<a href=3D"https://gitlab.free=
desktop.org/drm/i915/kernel/-/issues/11520">i915#11520</a>)</li>
</ul></li>
<li>
<p>igt@kms_psr2_sf@psr2-overlay-plane-move-continuous-exceed-fully-sf:</p><=
ul>
<li>shard-glk11:        NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/Patchwork_173589v1/shard-glk11/igt@kms_psr2_sf@psr2-overlay-p=
lane-move-continuous-exceed-fully-sf.html">SKIP</a> (<a href=3D"https://git=
lab.freedesktop.org/drm/i915/kernel/-/issues/11520">i915#11520</a>) +4 othe=
r tests skip</li>
</ul></li>
<li>
<p>igt@kms_psr2_su@page_flip-nv12:</p><ul>
<li>shard-tglu-1:       NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/Patchwork_173589v1/shard-tglu-1/igt@kms_psr2_su@page_flip-nv1=
2.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel=
/-/issues/9683">i915#9683</a>)</li>
</ul></li>
<li>
<p>igt@kms_psr2_su@page_flip-xrgb8888:</p><ul>
<li>shard-tglu:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/Patchwork_173589v1/shard-tglu-10/igt@kms_psr2_su@page_flip-xr=
gb8888.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/k=
ernel/-/issues/9683">i915#9683</a>)</li>
</ul></li>
<li>
<p>igt@kms_psr@pr-primary-blt:</p><ul>
<li>shard-dg2:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/Patchwork_173589v1/shard-dg2-8/igt@kms_psr@pr-primary-blt.htm=
l">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/is=
sues/1072">i915#1072</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i9=
15/kernel/-/issues/9732">i915#9732</a>) +5 other tests skip</li>
</ul></li>
<li>
<p>igt@kms_psr@psr2-cursor-mmap-gtt:</p><ul>
<li>shard-rkl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/Patchwork_173589v1/shard-rkl-7/igt@kms_psr@psr2-cursor-mmap-g=
tt.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kerne=
l/-/issues/1072">i915#1072</a> / <a href=3D"https://gitlab.freedesktop.org/=
drm/i915/kernel/-/issues/9732">i915#9732</a>) +20 other tests skip</li>
</ul></li>
<li>
<p>igt@kms_psr@psr2-cursor-plane-onoff:</p><ul>
<li>shard-tglu:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/Patchwork_173589v1/shard-tglu-3/igt@kms_psr@psr2-cursor-plane=
-onoff.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/k=
ernel/-/issues/9732">i915#9732</a>) +18 other tests skip</li>
</ul></li>
<li>
<p>igt@kms_psr@psr2-sprite-mmap-gtt:</p><ul>
<li>shard-tglu-1:       NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/Patchwork_173589v1/shard-tglu-1/igt@kms_psr@psr2-sprite-mmap-=
gtt.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kern=
el/-/issues/9732">i915#9732</a>) +9 other tests skip</li>
<li>shard-dg1:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/Patchwork_173589v1/shard-dg1-19/igt@kms_psr@psr2-sprite-mmap-=
gtt.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kern=
el/-/issues/1072">i915#1072</a> / <a href=3D"https://gitlab.freedesktop.org=
/drm/i915/kernel/-/issues/9732">i915#9732</a>) +10 other tests skip</li>
</ul></li>
<li>
<p>igt@kms_psr_stress_test@flip-primary-invalidate-overlay:</p><ul>
<li>shard-tglu-1:       NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/Patchwork_173589v1/shard-tglu-1/igt@kms_psr_stress_test@flip-=
primary-invalidate-overlay.html">SKIP</a> (<a href=3D"https://gitlab.freede=
sktop.org/drm/i915/kernel/-/issues/15949">i915#15949</a>)</li>
</ul></li>
<li>
<p>igt@kms_psr_stress_test@invalidate-primary-flip-overlay:</p><ul>
<li>shard-tglu:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/Patchwork_173589v1/shard-tglu-4/igt@kms_psr_stress_test@inval=
idate-primary-flip-overlay.html">SKIP</a> (<a href=3D"https://gitlab.freede=
sktop.org/drm/i915/kernel/-/issues/15949">i915#15949</a>)</li>
</ul></li>
<li>
<p>igt@kms_rotation_crc@primary-4-tiled-reflect-x-180:</p><ul>
<li>shard-tglu:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/Patchwork_173589v1/shard-tglu-10/igt@kms_rotation_crc@primary=
-4-tiled-reflect-x-180.html">SKIP</a> (<a href=3D"https://gitlab.freedeskto=
p.org/drm/i915/kernel/-/issues/5289">i915#5289</a>) +1 other test skip</li>
</ul></li>
<li>
<p>igt@kms_rotation_crc@primary-yf-tiled-reflect-x-0:</p><ul>
<li>shard-tglu-1:       NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/Patchwork_173589v1/shard-tglu-1/igt@kms_rotation_crc@primary-=
yf-tiled-reflect-x-0.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.=
org/drm/i915/kernel/-/issues/5289">i915#5289</a>)</li>
</ul></li>
<li>
<p>igt@kms_rotation_crc@primary-yf-tiled-reflect-x-270:</p><ul>
<li>shard-dg1:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/Patchwork_173589v1/shard-dg1-16/igt@kms_rotation_crc@primary-=
yf-tiled-reflect-x-270.html">SKIP</a> (<a href=3D"https://gitlab.freedeskto=
p.org/drm/i915/kernel/-/issues/5289">i915#5289</a>)</li>
</ul></li>
<li>
<p>igt@kms_scaling_modes@scaling-mode-none:</p><ul>
<li>shard-rkl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/Patchwork_173589v1/shard-rkl-2/igt@kms_scaling_modes@scaling-=
mode-none.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i91=
5/kernel/-/issues/3555">i915#3555</a>) +1 other test skip</li>
</ul></li>
<li>
<p>igt@kms_tiled_display@basic-test-pattern:</p><ul>
<li>shard-glk:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/Patchwork_173589v1/shard-glk4/igt@kms_tiled_display@basic-tes=
t-pattern.html">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i91=
5/kernel/-/issues/10959">i915#10959</a>)</li>
</ul></li>
<li>
<p>igt@kms_vblank@ts-continuation-dpms-suspend:</p><ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_19102/shard-rkl-2/igt@kms_vblank@ts-continuation-dpms-suspend.html"=
>PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/Patchwo=
rk_173589v1/shard-rkl-6/igt@kms_vblank@ts-continuation-dpms-suspend.html">I=
NCOMPLETE</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/=
issues/12276">i915#12276</a>)</li>
</ul></li>
<li>
<p>igt@kms_vblank@ts-continuation-dpms-suspend@pipe-a-hdmi-a-2:</p><ul>
<li>shard-rkl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/Patchwork_173589v1/shard-rkl-6/igt@kms_vblank@ts-continuation=
-dpms-suspend@pipe-a-hdmi-a-2.html">INCOMPLETE</a> (<a href=3D"https://gitl=
ab.freedesktop.org/drm/i915/kernel/-/issues/12276">i915#12276</a>)</li>
</ul></li>
<li>
<p>igt@kms_vblank@ts-continuation-suspend:</p><ul>
<li>shard-glk11:        NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/Patchwork_173589v1/shard-glk11/igt@kms_vblank@ts-continuation=
-suspend.html">INCOMPLETE</a> (<a href=3D"https://gitlab.freedesktop.org/dr=
m/i915/kernel/-/issues/12276">i915#12276</a>) +1 other test incomplete</li>
</ul></li>
<li>
<p>igt@kms_vrr@max-min:</p><ul>
<li>shard-dg2:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/Patchwork_173589v1/shard-dg2-8/igt@kms_vrr@max-min.html">SKIP=
</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/99=
06">i915#9906</a>)</li>
</ul></li>
<li>
<p>igt@kms_vrr@seamless-rr-switch-drrs:</p><ul>
<li>shard-tglu:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/Patchwork_173589v1/shard-tglu-10/igt@kms_vrr@seamless-rr-swit=
ch-drrs.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/=
kernel/-/issues/9906">i915#9906</a>)</li>
</ul></li>
<li>
<p>igt@kms_vrr@seamless-rr-switch-vrr:</p><ul>
<li>shard-rkl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/Patchwork_173589v1/shard-rkl-2/igt@kms_vrr@seamless-rr-switch=
-vrr.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/ker=
nel/-/issues/9906">i915#9906</a>)</li>
</ul></li>
<li>
<p>igt@perf@per-context-mode-unprivileged:</p><ul>
<li>shard-rkl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/Patchwork_173589v1/shard-rkl-2/igt@perf@per-context-mode-unpr=
ivileged.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915=
/kernel/-/issues/2435">i915#2435</a>)</li>
</ul></li>
<li>
<p>igt@perf_pmu@busy-double-start:</p><ul>
<li>shard-mtlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_19102/shard-mtlp-3/igt@perf_pmu@busy-double-start.html">PASS</a> -&=
gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_173589v1/=
shard-mtlp-8/igt@perf_pmu@busy-double-start.html">FAIL</a> (<a href=3D"http=
s://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4349">i915#4349</a>) +3=
 other tests fail</li>
</ul></li>
<li>
<p>igt@perf_pmu@module-unload:</p><ul>
<li>shard-tglu-1:       NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/Patchwork_173589v1/shard-tglu-1/igt@perf_pmu@module-unload.ht=
ml">ABORT</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/=
issues/13029">i915#13029</a> / <a href=3D"https://gitlab.freedesktop.org/dr=
m/i915/kernel/-/issues/15778">i915#15778</a>)</li>
<li>shard-dg1:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/Patchwork_173589v1/shard-dg1-19/igt@perf_pmu@module-unload.ht=
ml">ABORT</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/=
issues/13029">i915#13029</a> / <a href=3D"https://gitlab.freedesktop.org/dr=
m/i915/kernel/-/issues/15778">i915#15778</a>)</li>
</ul></li>
<li>
<p>igt@prime_udl@share-import:</p><ul>
<li>shard-tglu:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/Patchwork_173589v1/shard-tglu-3/igt@prime_udl@share-import.ht=
ml">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/i=
ssues/16420">i915#16420</a>) +1 other test skip</li>
</ul></li>
<li>
<p>igt@prime_vgem@basic-write:</p><ul>
<li>shard-rkl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/Patchwork_173589v1/shard-rkl-7/igt@prime_vgem@basic-write.htm=
l">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/is=
sues/3291">i915#3291</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i9=
15/kernel/-/issues/3708">i915#3708</a>)</li>
</ul></li>
<li>
<p>igt@tools_test@sysfs_l3_parity:</p><ul>
<li>shard-dg1:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/Patchwork_173589v1/shard-dg1-16/igt@tools_test@sysfs_l3_parit=
y.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel=
/-/issues/4818">i915#4818</a>)</li>
</ul></li>
</ul><h4>Possible fixes</h4><ul>
<li>
<p>igt@gem_eio@hibernate:</p><ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_19102/shard-rkl-1/igt@gem_eio@hibernate.html">ABORT</a> (<a href=3D=
"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/7975">i915#7975</a=
>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_1735=
89v1/shard-rkl-8/igt@gem_eio@hibernate.html">PASS</a></li>
</ul></li>
<li>
<p>igt@gem_eio@in-flight-suspend:</p><ul>
<li>shard-dg2:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_19102/shard-dg2-8/igt@gem_eio@in-flight-suspend.html">ABORT</a> (<a=
 href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16784">i91=
5#16784</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/Patc=
hwork_173589v1/shard-dg2-8/igt@gem_eio@in-flight-suspend.html">PASS</a></li=
>
</ul></li>
<li>
<p>igt@gem_workarounds@suspend-resume-fd:</p><ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_19102/shard-rkl-6/igt@gem_workarounds@suspend-resume-fd.html">INCOM=
PLETE</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issu=
es/13356">i915#13356</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree=
/drm-tip/Patchwork_173589v1/shard-rkl-4/igt@gem_workarounds@suspend-resume-=
fd.html">PASS</a></li>
</ul></li>
<li>
<p>igt@i915_suspend@fence-restore-untiled:</p><ul>
<li>shard-glk:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_19102/shard-glk8/igt@i915_suspend@fence-restore-untiled.html">INCOM=
PLETE</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issu=
es/16182">i915#16182</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i9=
15/kernel/-/issues/4817">i915#4817</a>) -&gt; <a href=3D"https://intel-gfx-=
ci.01.org/tree/drm-tip/Patchwork_173589v1/shard-glk9/igt@i915_suspend@fence=
-restore-untiled.html">PASS</a></li>
</ul></li>
<li>
<p>igt@i915_suspend@sysfs-reader:</p><ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_19102/shard-rkl-6/igt@i915_suspend@sysfs-reader.html">INCOMPLETE</a=
> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4817"=
>i915#4817</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/P=
atchwork_173589v1/shard-rkl-2/igt@i915_suspend@sysfs-reader.html">PASS</a><=
/li>
</ul></li>
<li>
<p>igt@kms_async_flips@alternate-sync-async-flip-atomic@pipe-b-hdmi-a-1:</p=
><ul>
<li>shard-glk:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_19102/shard-glk3/igt@kms_async_flips@alternate-sync-async-flip-atom=
ic@pipe-b-hdmi-a-1.html">FAIL</a> (<a href=3D"https://gitlab.freedesktop.or=
g/drm/i915/kernel/-/issues/14888">i915#14888</a>) -&gt; <a href=3D"https://=
intel-gfx-ci.01.org/tree/drm-tip/Patchwork_173589v1/shard-glk8/igt@kms_asyn=
c_flips@alternate-sync-async-flip-atomic@pipe-b-hdmi-a-1.html">PASS</a> +2 =
other tests pass</li>
</ul></li>
<li>
<p>igt@kms_cursor_crc@cursor-onscreen-64x21@pipe-a-hdmi-a-1:</p><ul>
<li>shard-tglu:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_19102/shard-tglu-5/igt@kms_cursor_crc@cursor-onscreen-64x21@pipe-a-=
hdmi-a-1.html">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915=
/kernel/-/issues/13566">i915#13566</a>) -&gt; <a href=3D"https://intel-gfx-=
ci.01.org/tree/drm-tip/Patchwork_173589v1/shard-tglu-4/igt@kms_cursor_crc@c=
ursor-onscreen-64x21@pipe-a-hdmi-a-1.html">PASS</a> +1 other test pass</li>
</ul></li>
<li>
<p>igt@kms_flip@dpms-vs-vblank-race-interruptible:</p><ul>
<li>shard-tglu:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_19102/shard-tglu-5/igt@kms_flip@dpms-vs-vblank-race-interruptible.h=
tml">ABORT</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-=
/issues/16876">i915#16876</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/Patchwork_173589v1/shard-tglu-4/igt@kms_flip@dpms-vs-vblank-r=
ace-interruptible.html">PASS</a></li>
</ul></li>
<li>
<p>igt@kms_flip@dpms-vs-vblank-race-interruptible@d-hdmi-a1:</p><ul>
<li>shard-tglu:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_19102/shard-tglu-5/igt@kms_flip@dpms-vs-vblank-race-interruptible@d=
-hdmi-a1.html">ABORT</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i91=
5/kernel/-/issues/16866">i915#16866</a> / <a href=3D"https://gitlab.freedes=
ktop.org/drm/i915/kernel/-/issues/16876">i915#16876</a>) -&gt; <a href=3D"h=
ttps://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_173589v1/shard-tglu-4/igt=
@kms_flip@dpms-vs-vblank-race-interruptible@d-hdmi-a1.html">PASS</a></li>
</ul></li>
<li>
<p>igt@kms_flip@flip-vs-blocking-wf-vblank@a-hdmi-a4:</p><ul>
<li>shard-dg1:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_19102/shard-dg1-19/igt@kms_flip@flip-vs-blocking-wf-vblank@a-hdmi-a=
4.html">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel=
/-/issues/14600">i915#14600</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.o=
rg/tree/drm-tip/Patchwork_173589v1/shard-dg1-17/igt@kms_flip@flip-vs-blocki=
ng-wf-vblank@a-hdmi-a4.html">PASS</a></li>
</ul></li>
<li>
<p>igt@kms_flip@flip-vs-expired-vblank:</p><ul>
<li>shard-glk:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_19102/shard-glk9/igt@kms_flip@flip-vs-expired-vblank.html">FAIL</a>=
 (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13027"=
>i915#13027</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/=
Patchwork_173589v1/shard-glk6/igt@kms_flip@flip-vs-expired-vblank.html">PAS=
S</a> +1 other test pass</li>
</ul></li>
<li>
<p>igt@kms_flip@flip-vs-expired-vblank-interruptible@b-hdmi-a1:</p><ul>
<li>shard-glk11:        <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_19102/shard-glk11/igt@kms_flip@flip-vs-expired-vblank-interruptible=
@b-hdmi-a1.html">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i9=
15/kernel/-/issues/13027">i915#13027</a>) -&gt; <a href=3D"https://intel-gf=
x-ci.01.org/tree/drm-tip/Patchwork_173589v1/shard-glk11/igt@kms_flip@flip-v=
s-expired-vblank-interruptible@b-hdmi-a1.html">PASS</a></li>
</ul></li>
<li>
<p>igt@kms_flip@flip-vs-suspend-interruptible:</p><ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_19102/shard-rkl-3/igt@kms_flip@flip-vs-suspend-interruptible.html">=
INCOMPLETE</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-=
/issues/16276">i915#16276</a> / <a href=3D"https://gitlab.freedesktop.org/d=
rm/i915/kernel/-/issues/6113">i915#6113</a>) -&gt; <a href=3D"https://intel=
-gfx-ci.01.org/tree/drm-tip/Patchwork_173589v1/shard-rkl-2/igt@kms_flip@fli=
p-vs-suspend-interruptible.html">PASS</a></li>
</ul></li>
<li>
<p>igt@kms_flip@wf_vblank-ts-check:</p><ul>
<li>shard-tglu:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_19102/shard-tglu-5/igt@kms_flip@wf_vblank-ts-check.html">FAIL</a> (=
<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14600">i=
915#14600</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/Pa=
tchwork_173589v1/shard-tglu-4/igt@kms_flip@wf_vblank-ts-check.html">PASS</a=
> +1 other test pass</li>
</ul></li>
<li>
<p>igt@kms_frontbuffer_tracking@fbchdr-1p-primscrn-cur-indfb-move:</p><ul>
<li>shard-glk:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_19102/shard-glk3/igt@kms_frontbuffer_tracking@fbchdr-1p-primscrn-cu=
r-indfb-move.html">SKIP</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tr=
ee/drm-tip/Patchwork_173589v1/shard-glk8/igt@kms_frontbuffer_tracking@fbchd=
r-1p-primscrn-cur-indfb-move.html">PASS</a> +15 other tests pass</li>
</ul></li>
<li>
<p>igt@kms_frontbuffer_tracking@fbchdr-1p-rte:</p><ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_19102/shard-rkl-2/igt@kms_frontbuffer_tracking@fbchdr-1p-rte.html">=
SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issue=
s/15989">i915#15989</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/=
drm-tip/Patchwork_173589v1/shard-rkl-6/igt@kms_frontbuffer_tracking@fbchdr-=
1p-rte.html">PASS</a> +8 other tests pass</li>
</ul></li>
<li>
<p>igt@kms_pipe_crc_basic@suspend-read-crc@pipe-a-hdmi-a-2:</p><ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_19102/shard-rkl-4/igt@kms_pipe_crc_basic@suspend-read-crc@pipe-a-hd=
mi-a-2.html">INCOMPLETE</a> (<a href=3D"https://gitlab.freedesktop.org/drm/=
i915/kernel/-/issues/13476">i915#13476</a>) -&gt; <a href=3D"https://intel-=
gfx-ci.01.org/tree/drm-tip/Patchwork_173589v1/shard-rkl-3/igt@kms_pipe_crc_=
basic@suspend-read-crc@pipe-a-hdmi-a-2.html">PASS</a></li>
</ul></li>
<li>
<p>igt@kms_plane_lowres@tiling-y:</p><ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_19102/shard-rkl-4/igt@kms_plane_lowres@tiling-y.html">ABORT</a> (<a=
 href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16866">i91=
5#16866</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/Patc=
hwork_173589v1/shard-rkl-2/igt@kms_plane_lowres@tiling-y.html">PASS</a></li=
>
</ul></li>
<li>
<p>igt@kms_pm_rpm@dpms-lpsp:</p><ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_19102/shard-rkl-7/igt@kms_pm_rpm@dpms-lpsp.html">SKIP</a> (<a href=
=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15073">i915#150=
73</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork=
_173589v1/shard-rkl-5/igt@kms_pm_rpm@dpms-lpsp.html">PASS</a> +1 other test=
 pass</li>
<li>shard-dg1:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_19102/shard-dg1-16/igt@kms_pm_rpm@dpms-lpsp.html">SKIP</a> (<a href=
=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15073">i915#150=
73</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork=
_173589v1/shard-dg1-15/igt@kms_pm_rpm@dpms-lpsp.html">PASS</a> +1 other tes=
t pass</li>
</ul></li>
<li>
<p>igt@kms_pm_rpm@modeset-non-lpsp-stress-no-wait:</p><ul>
<li>shard-dg2:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_19102/shard-dg2-4/igt@kms_pm_rpm@modeset-non-lpsp-stress-no-wait.ht=
ml">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/i=
ssues/15073">i915#15073</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/t=
ree/drm-tip/Patchwork_173589v1/shard-dg2-1/igt@kms_pm_rpm@modeset-non-lpsp-=
stress-no-wait.html">PASS</a></li>
</ul></li>
<li>
<p>igt@kms_pm_rpm@system-suspend-idle:</p><ul>
<li>shard-dg2:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_19102/shard-dg2-7/igt@kms_pm_rpm@system-suspend-idle.html">INCOMPLE=
TE</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/=
14419">i915#14419</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/dr=
m-tip/Patchwork_173589v1/shard-dg2-8/igt@kms_pm_rpm@system-suspend-idle.htm=
l">PASS</a></li>
</ul></li>
</ul><h4>Warnings</h4><ul>
<li>
<p>igt@device_reset@cold-reset-bound:</p><ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_19102/shard-rkl-2/igt@device_reset@cold-reset-bound.html">SKIP</a> =
(<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11078">=
i915#11078</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/P=
atchwork_173589v1/shard-rkl-6/igt@device_reset@cold-reset-bound.html">SKIP<=
/a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/110=
78">i915#11078</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i915/ker=
nel/-/issues/14544">i915#14544</a>)</li>
</ul></li>
<li>
<p>igt@gem_create@create-ext-cpu-access-sanity-check:</p><ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_19102/shard-rkl-2/igt@gem_create@create-ext-cpu-access-sanity-check=
.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/=
-/issues/6335">i915#6335</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/Patchwork_173589v1/shard-rkl-6/igt@gem_create@create-ext-cpu-a=
ccess-sanity-check.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.or=
g/drm/i915/kernel/-/issues/14544">i915#14544</a> / <a href=3D"https://gitla=
b.freedesktop.org/drm/i915/kernel/-/issues/6335">i915#6335</a>)</li>
</ul></li>
<li>
<p>igt@gem_eio@kms:</p><ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_19102/shard-rkl-3/igt@gem_eio@kms.html">ABORT</a> (<a href=3D"https=
://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16837">i915#16837</a>) -=
&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_173589v1=
/shard-rkl-2/igt@gem_eio@kms.html">ABORT</a> (<a href=3D"https://gitlab.fre=
edesktop.org/drm/i915/kernel/-/issues/16837">i915#16837</a> / <a href=3D"ht=
tps://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16931">i915#16931</a>=
)</li>
</ul></li>
<li>
<p>igt@gem_exec_capture@capture-recoverable:</p><ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_19102/shard-rkl-6/igt@gem_exec_capture@capture-recoverable.html">SK=
IP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/=
14544">i915#14544</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i915/=
kernel/-/issues/6344">i915#6344</a>) -&gt; <a href=3D"https://intel-gfx-ci.=
01.org/tree/drm-tip/Patchwork_173589v1/shard-rkl-4/igt@gem_exec_capture@cap=
ture-recoverable.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/=
drm/i915/kernel/-/issues/6344">i915#6344</a>)</li>
</ul></li>
<li>
<p>igt@gem_exec_reloc@basic-cpu-gtt-noreloc:</p><ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_19102/shard-rkl-2/igt@gem_exec_reloc@basic-cpu-gtt-noreloc.html">SK=
IP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/=
3281">i915#3281</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-=
tip/Patchwork_173589v1/shard-rkl-6/igt@gem_exec_reloc@basic-cpu-gtt-noreloc=
.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/=
-/issues/14544">i915#14544</a> / <a href=3D"https://gitlab.freedesktop.org/=
drm/i915/kernel/-/issues/3281">i915#3281</a>) +2 other tests skip</li>
</ul></li>
<li>
<p>igt@gem_exec_reloc@basic-write-read-active:</p><ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_19102/shard-rkl-6/igt@gem_exec_reloc@basic-write-read-active.html">=
SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issue=
s/14544">i915#14544</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i91=
5/kernel/-/issues/3281">i915#3281</a>) -&gt; <a href=3D"https://intel-gfx-c=
i.01.org/tree/drm-tip/Patchwork_173589v1/shard-rkl-4/igt@gem_exec_reloc@bas=
ic-write-read-active.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.=
org/drm/i915/kernel/-/issues/3281">i915#3281</a>)</li>
</ul></li>
<li>
<p>igt@gem_lmem_evict@dontneed-evict-race:</p><ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_19102/shard-rkl-2/igt@gem_lmem_evict@dontneed-evict-race.html">SKIP=
</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/46=
13">i915#4613</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i915/kern=
el/-/issues/7582">i915#7582</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.o=
rg/tree/drm-tip/Patchwork_173589v1/shard-rkl-6/igt@gem_lmem_evict@dontneed-=
evict-race.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i9=
15/kernel/-/issues/14544">i915#14544</a> / <a href=3D"https://gitlab.freede=
sktop.org/drm/i915/kernel/-/issues/4613">i915#4613</a> / <a href=3D"https:/=
/gitlab.freedesktop.org/drm/i915/kernel/-/issues/7582">i915#7582</a>)</li>
</ul></li>
<li>
<p>igt@gem_lmem_swapping@parallel-random-verify:</p><ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_19102/shard-rkl-6/igt@gem_lmem_swapping@parallel-random-verify.html=
">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/iss=
ues/14544">i915#14544</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i=
915/kernel/-/issues/4613">i915#4613</a>) -&gt; <a href=3D"https://intel-gfx=
-ci.01.org/tree/drm-tip/Patchwork_173589v1/shard-rkl-4/igt@gem_lmem_swappin=
g@parallel-random-verify.html">SKIP</a> (<a href=3D"https://gitlab.freedesk=
top.org/drm/i915/kernel/-/issues/4613">i915#4613</a>) +1 other test skip</l=
i>
</ul></li>
<li>
<p>igt@gem_lmem_swapping@verify-ccs:</p><ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_19102/shard-rkl-2/igt@gem_lmem_swapping@verify-ccs.html">SKIP</a> (=
<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4613">i9=
15#4613</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/Patc=
hwork_173589v1/shard-rkl-6/igt@gem_lmem_swapping@verify-ccs.html">SKIP</a> =
(<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">=
i915#14544</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/=
-/issues/4613">i915#4613</a>)</li>
</ul></li>
<li>
<p>igt@gem_tiled_pread_pwrite:</p><ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_19102/shard-rkl-2/igt@gem_tiled_pread_pwrite.html">SKIP</a> (<a hre=
f=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3282">i915#328=
2</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_=
173589v1/shard-rkl-6/igt@gem_tiled_pread_pwrite.html">SKIP</a> (<a href=3D"=
https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14544</=
a> / <a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/328=
2">i915#3282</a>)</li>
</ul></li>
<li>
<p>igt@gem_userptr_blits@invalid-mmap-offset-unsync:</p><ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_19102/shard-rkl-2/igt@gem_userptr_blits@invalid-mmap-offset-unsync.=
html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-=
/issues/3297">i915#3297</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/t=
ree/drm-tip/Patchwork_173589v1/shard-rkl-6/igt@gem_userptr_blits@invalid-mm=
ap-offset-unsync.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/=
drm/i915/kernel/-/issues/14544">i915#14544</a> / <a href=3D"https://gitlab.=
freedesktop.org/drm/i915/kernel/-/issues/3297">i915#3297</a>)</li>
</ul></li>
<li>
<p>igt@gen9_exec_parse@bb-start-param:</p><ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_19102/shard-rkl-2/igt@gen9_exec_parse@bb-start-param.html">SKIP</a>=
 (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2527">=
i915#2527</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/Pa=
tchwork_173589v1/shard-rkl-6/igt@gen9_exec_parse@bb-start-param.html">SKIP<=
/a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/145=
44">i915#14544</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i915/ker=
nel/-/issues/2527">i915#2527</a>) +1 other test skip</li>
</ul></li>
<li>
<p>igt@gen9_exec_parse@unaligned-jump:</p><ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_19102/shard-rkl-6/igt@gen9_exec_parse@unaligned-jump.html">SKIP</a>=
 (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544"=
>i915#14544</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel=
/-/issues/2527">i915#2527</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/Patchwork_173589v1/shard-rkl-4/igt@gen9_exec_parse@unaligned-=
jump.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/ker=
nel/-/issues/2527">i915#2527</a>) +1 other test skip</li>
</ul></li>
<li>
<p>igt@i915_module_load@fault-injection@__uc_init:</p><ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_19102/shard-rkl-2/igt@i915_module_load@fault-injection@__uc_init.ht=
ml">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/i=
ssues/15479">i915#15479</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/t=
ree/drm-tip/Patchwork_173589v1/shard-rkl-6/igt@i915_module_load@fault-injec=
tion@__uc_init.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/dr=
m/i915/kernel/-/issues/14544">i915#14544</a> / <a href=3D"https://gitlab.fr=
eedesktop.org/drm/i915/kernel/-/issues/15479">i915#15479</a>) +4 other test=
s skip</li>
</ul></li>
<li>
<p>igt@i915_pm_freq_api@freq-reset-multiple:</p><ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_19102/shard-rkl-2/igt@i915_pm_freq_api@freq-reset-multiple.html">SK=
IP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/=
8399">i915#8399</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-=
tip/Patchwork_173589v1/shard-rkl-6/igt@i915_pm_freq_api@freq-reset-multiple=
.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/=
-/issues/14544">i915#14544</a> / <a href=3D"https://gitlab.freedesktop.org/=
drm/i915/kernel/-/issues/8399">i915#8399</a>)</li>
</ul></li>
<li>
<p>igt@kms_big_fb@4-tiled-max-hw-stride-32bpp-rotate-0-async-flip:</p><ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_19102/shard-rkl-2/igt@kms_big_fb@4-tiled-max-hw-stride-32bpp-rotate=
-0-async-flip.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm=
/i915/kernel/-/issues/5286">i915#5286</a>) -&gt; <a href=3D"https://intel-g=
fx-ci.01.org/tree/drm-tip/Patchwork_173589v1/shard-rkl-6/igt@kms_big_fb@4-t=
iled-max-hw-stride-32bpp-rotate-0-async-flip.html">SKIP</a> (<a href=3D"htt=
ps://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a> =
/ <a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5286">=
i915#5286</a>)</li>
</ul></li>
<li>
<p>igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-180-hflip:</p><ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_19102/shard-rkl-6/igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate=
-180-hflip.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i9=
15/kernel/-/issues/14544">i915#14544</a> / <a href=3D"https://gitlab.freede=
sktop.org/drm/i915/kernel/-/issues/5286">i915#5286</a>) -&gt; <a href=3D"ht=
tps://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_173589v1/shard-rkl-4/igt@k=
ms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-180-hflip.html">SKIP</a> (<a h=
ref=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5286">i915#5=
286</a>) +1 other test skip</li>
</ul></li>
<li>
<p>igt@kms_big_fb@linear-8bpp-rotate-270:</p><ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_19102/shard-rkl-2/igt@kms_big_fb@linear-8bpp-rotate-270.html">SKIP<=
/a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/363=
8">i915#3638</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/Patchwork_173589v1/shard-rkl-6/igt@kms_big_fb@linear-8bpp-rotate-270.html"=
>SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issu=
es/14544">i915#14544</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i9=
15/kernel/-/issues/3638">i915#3638</a>) +1 other test skip</li>
</ul></li>
<li>
<p>igt@kms_big_fb@y-tiled-8bpp-rotate-90:</p><ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_19102/shard-rkl-6/igt@kms_big_fb@y-tiled-8bpp-rotate-90.html">SKIP<=
/a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/145=
44">i915#14544</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i915/ker=
nel/-/issues/3638">i915#3638</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.=
org/tree/drm-tip/Patchwork_173589v1/shard-rkl-4/igt@kms_big_fb@y-tiled-8bpp=
-rotate-90.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i9=
15/kernel/-/issues/3638">i915#3638</a>) +1 other test skip</li>
</ul></li>
<li>
<p>igt@kms_big_fb@yf-tiled-16bpp-rotate-270:</p><ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_19102/shard-rkl-6/igt@kms_big_fb@yf-tiled-16bpp-rotate-270.html">SK=
IP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/=
14544">i915#14544</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/dr=
m-tip/Patchwork_173589v1/shard-rkl-4/igt@kms_big_fb@yf-tiled-16bpp-rotate-2=
70.html">SKIP</a> +31 other tests skip</li>
</ul></li>
<li>
<p>igt@kms_ccs@bad-rotation-90-4-tiled-mtl-mc-ccs@pipe-b-hdmi-a-2:</p><ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_19102/shard-rkl-6/igt@kms_ccs@bad-rotation-90-4-tiled-mtl-mc-ccs@pi=
pe-b-hdmi-a-2.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm=
/i915/kernel/-/issues/14544">i915#14544</a> / <a href=3D"https://gitlab.fre=
edesktop.org/drm/i915/kernel/-/issues/6095">i915#6095</a>) -&gt; <a href=3D=
"https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_173589v1/shard-rkl-4/ig=
t@kms_ccs@bad-rotation-90-4-tiled-mtl-mc-ccs@pipe-b-hdmi-a-2.html">SKIP</a>=
 (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6095">=
i915#6095</a>) +6 other tests skip</li>
</ul></li>
<li>
<p>igt@kms_ccs@crc-primary-rotation-180-4-tiled-dg2-rc-ccs@pipe-c-hdmi-a-2:=
</p><ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_19102/shard-rkl-3/igt@kms_ccs@crc-primary-rotation-180-4-tiled-dg2-=
rc-ccs@pipe-c-hdmi-a-2.html">SKIP</a> (<a href=3D"https://gitlab.freedeskto=
p.org/drm/i915/kernel/-/issues/14098">i915#14098</a> / <a href=3D"https://g=
itlab.freedesktop.org/drm/i915/kernel/-/issues/6095">i915#6095</a>) -&gt; <=
a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_173589v1/shard=
-rkl-3/igt@kms_ccs@crc-primary-rotation-180-4-tiled-dg2-rc-ccs@pipe-c-hdmi-=
a-2.html">ABORT</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/ker=
nel/-/issues/16866">i915#16866</a>) +1 other test abort</li>
</ul></li>
<li>
<p>igt@kms_ccs@crc-primary-suspend-4-tiled-dg2-rc-ccs@pipe-c-hdmi-a-2:</p><=
ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_19102/shard-rkl-6/igt@kms_ccs@crc-primary-suspend-4-tiled-dg2-rc-cc=
s@pipe-c-hdmi-a-2.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org=
/drm/i915/kernel/-/issues/14098">i915#14098</a> / <a href=3D"https://gitlab=
.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a> / <a href=
=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6095">i915#6095=
</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_1=
73589v1/shard-rkl-4/igt@kms_ccs@crc-primary-suspend-4-tiled-dg2-rc-ccs@pipe=
-c-hdmi-a-2.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i=
915/kernel/-/issues/14098">i915#14098</a> / <a href=3D"https://gitlab.freed=
esktop.org/drm/i915/kernel/-/issues/6095">i915#6095</a>) +7 other tests ski=
p</li>
</ul></li>
<li>
<p>igt@kms_ccs@missing-ccs-buffer-4-tiled-mtl-mc-ccs:</p><ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_19102/shard-rkl-2/igt@kms_ccs@missing-ccs-buffer-4-tiled-mtl-mc-ccs=
.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/=
-/issues/14098">i915#14098</a> / <a href=3D"https://gitlab.freedesktop.org/=
drm/i915/kernel/-/issues/6095">i915#6095</a>) -&gt; <a href=3D"https://inte=
l-gfx-ci.01.org/tree/drm-tip/Patchwork_173589v1/shard-rkl-6/igt@kms_ccs@mis=
sing-ccs-buffer-4-tiled-mtl-mc-ccs.html">SKIP</a> (<a href=3D"https://gitla=
b.freedesktop.org/drm/i915/kernel/-/issues/14098">i915#14098</a> / <a href=
=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#145=
44</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues=
/6095">i915#6095</a>) +2 other tests skip</li>
</ul></li>
<li>
<p>igt@kms_chamelium_edid@hdmi-edid-stress-resolution-non-4k:</p><ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_19102/shard-rkl-6/igt@kms_chamelium_edid@hdmi-edid-stress-resolutio=
n-non-4k.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915=
/kernel/-/issues/11151">i915#11151</a> / <a href=3D"https://gitlab.freedesk=
top.org/drm/i915/kernel/-/issues/14544">i915#14544</a> / <a href=3D"https:/=
/gitlab.freedesktop.org/drm/i915/kernel/-/issues/7828">i915#7828</a>) -&gt;=
 <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_173589v1/sha=
rd-rkl-4/igt@kms_chamelium_edid@hdmi-edid-stress-resolution-non-4k.html">SK=
IP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/=
11151">i915#11151</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i915/=
kernel/-/issues/7828">i915#7828</a>) +2 other tests skip</li>
</ul></li>
<li>
<p>igt@kms_chamelium_frames@dp-crc-fast:</p><ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_19102/shard-rkl-2/igt@kms_chamelium_frames@dp-crc-fast.html">SKIP</=
a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/1115=
1">i915#11151</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i915/kern=
el/-/issues/7828">i915#7828</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.o=
rg/tree/drm-tip/Patchwork_173589v1/shard-rkl-6/igt@kms_chamelium_frames@dp-=
crc-fast.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915=
/kernel/-/issues/11151">i915#11151</a> / <a href=3D"https://gitlab.freedesk=
top.org/drm/i915/kernel/-/issues/14544">i915#14544</a> / <a href=3D"https:/=
/gitlab.freedesktop.org/drm/i915/kernel/-/issues/7828">i915#7828</a>) +5 ot=
her tests skip</li>
</ul></li>
<li>
<p>igt@kms_content_protection@atomic-hdcp14:</p><ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_19102/shard-rkl-2/igt@kms_content_protection@atomic-hdcp14.html">SK=
IP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/=
15865">i915#15865</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/dr=
m-tip/Patchwork_173589v1/shard-rkl-6/igt@kms_content_protection@atomic-hdcp=
14.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kerne=
l/-/issues/14544">i915#14544</a> / <a href=3D"https://gitlab.freedesktop.or=
g/drm/i915/kernel/-/issues/15865">i915#15865</a>)</li>
</ul></li>
<li>
<p>igt@kms_content_protection@mei-interface:</p><ul>
<li>shard-dg1:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_19102/shard-dg1-14/igt@kms_content_protection@mei-interface.html">S=
KIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues=
/15865">i915#15865</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/d=
rm-tip/Patchwork_173589v1/shard-dg1-12/igt@kms_content_protection@mei-inter=
face.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/ker=
nel/-/issues/9433">i915#9433</a>)</li>
</ul></li>
<li>
<p>igt@kms_cursor_crc@cursor-offscreen-512x170:</p><ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_19102/shard-rkl-6/igt@kms_cursor_crc@cursor-offscreen-512x170.html"=
>SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issu=
es/13049">i915#13049</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i9=
15/kernel/-/issues/14544">i915#14544</a>) -&gt; <a href=3D"https://intel-gf=
x-ci.01.org/tree/drm-tip/Patchwork_173589v1/shard-rkl-4/igt@kms_cursor_crc@=
cursor-offscreen-512x170.html">SKIP</a> (<a href=3D"https://gitlab.freedesk=
top.org/drm/i915/kernel/-/issues/13049">i915#13049</a>)</li>
</ul></li>
<li>
<p>igt@kms_cursor_crc@cursor-random-32x32:</p><ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_19102/shard-rkl-6/igt@kms_cursor_crc@cursor-random-32x32.html">SKIP=
</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14=
544">i915#14544</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i915/ke=
rnel/-/issues/3555">i915#3555</a>) -&gt; <a href=3D"https://intel-gfx-ci.01=
.org/tree/drm-tip/Patchwork_173589v1/shard-rkl-4/igt@kms_cursor_crc@cursor-=
random-32x32.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/=
i915/kernel/-/issues/3555">i915#3555</a>)</li>
</ul></li>
<li>
<p>igt@kms_dp_aux_dev@basic:</p><ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_19102/shard-rkl-2/igt@kms_dp_aux_dev@basic.html">SKIP</a> (<a href=
=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/1257">i915#1257=
</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_1=
73589v1/shard-rkl-6/igt@kms_dp_aux_dev@basic.html">SKIP</a> (<a href=3D"htt=
ps://gitlab.freedesktop.org/drm/i915/kernel/-/issues/1257">i915#1257</a> / =
<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i=
915#14544</a>)</li>
</ul></li>
<li>
<p>igt@kms_dsc@dsc-basic-ultrajoiner:</p><ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_19102/shard-rkl-2/igt@kms_dsc@dsc-basic-ultrajoiner.html">SKIP</a> =
(<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16361">=
i915#16361</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/P=
atchwork_173589v1/shard-rkl-6/igt@kms_dsc@dsc-basic-ultrajoiner.html">SKIP<=
/a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/145=
44">i915#14544</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i915/ker=
nel/-/issues/16361">i915#16361</a>)</li>
</ul></li>
<li>
<p>igt@kms_dsc@dsc-with-bpc:</p><ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_19102/shard-rkl-6/igt@kms_dsc@dsc-with-bpc.html">SKIP</a> (<a href=
=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#145=
44</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues=
/16361">i915#16361</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/d=
rm-tip/Patchwork_173589v1/shard-rkl-4/igt@kms_dsc@dsc-with-bpc.html">SKIP</=
a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/1636=
1">i915#16361</a>)</li>
</ul></li>
<li>
<p>igt@kms_feature_discovery@psr2:</p><ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_19102/shard-rkl-2/igt@kms_feature_discovery@psr2.html">SKIP</a> (<a=
 href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/658">i915#=
658</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/Patchwor=
k_173589v1/shard-rkl-6/igt@kms_feature_discovery@psr2.html">SKIP</a> (<a hr=
ef=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#1=
4544</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issu=
es/658">i915#658</a>)</li>
</ul></li>
<li>
<p>igt@kms_flip@2x-absolute-wf_vblank:</p><ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_19102/shard-rkl-2/igt@kms_flip@2x-absolute-wf_vblank.html">SKIP</a>=
 (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9934">=
i915#9934</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/Pa=
tchwork_173589v1/shard-rkl-6/igt@kms_flip@2x-absolute-wf_vblank.html">SKIP<=
/a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/145=
44">i915#14544</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i915/ker=
nel/-/issues/9934">i915#9934</a>) +1 other test skip</li>
</ul></li>
<li>
<p>igt@kms_flip@2x-flip-vs-fences-interruptible:</p><ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_19102/shard-rkl-6/igt@kms_flip@2x-flip-vs-fences-interruptible.html=
">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/iss=
ues/14544">i915#14544</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i=
915/kernel/-/issues/9934">i915#9934</a>) -&gt; <a href=3D"https://intel-gfx=
-ci.01.org/tree/drm-tip/Patchwork_173589v1/shard-rkl-4/igt@kms_flip@2x-flip=
-vs-fences-interruptible.html">SKIP</a> (<a href=3D"https://gitlab.freedesk=
top.org/drm/i915/kernel/-/issues/9934">i915#9934</a>)</li>
</ul></li>
<li>
<p>igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-16bpp-yftile-upscaling:</p>=
<ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_19102/shard-rkl-6/igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-16bp=
p-yftile-upscaling.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.or=
g/drm/i915/kernel/-/issues/14544">i915#14544</a> / <a href=3D"https://gitla=
b.freedesktop.org/drm/i915/kernel/-/issues/15643">i915#15643</a>) -&gt; <a =
href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_173589v1/shard-r=
kl-4/igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-16bpp-yftile-upscaling.ht=
ml">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/i=
ssues/15643">i915#15643</a>) +2 other tests skip</li>
</ul></li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-pri-shrfb-draw-mmap-gtt:</p=
><ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_19102/shard-rkl-2/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-pri-=
shrfb-draw-mmap-gtt.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.o=
rg/drm/i915/kernel/-/issues/1825">i915#1825</a>) -&gt; <a href=3D"https://i=
ntel-gfx-ci.01.org/tree/drm-tip/Patchwork_173589v1/shard-rkl-6/igt@kms_fron=
tbuffer_tracking@fbc-2p-scndscrn-pri-shrfb-draw-mmap-gtt.html">SKIP</a> (<a=
 href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i91=
5#14544</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/i=
ssues/1825">i915#1825</a>) +2 other tests skip</li>
</ul></li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-pri-indfb-draw-mmap-wc:<=
/p><ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_19102/shard-rkl-6/igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-p=
ri-indfb-draw-mmap-wc.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop=
.org/drm/i915/kernel/-/issues/14544">i915#14544</a> / <a href=3D"https://gi=
tlab.freedesktop.org/drm/i915/kernel/-/issues/1825">i915#1825</a>) -&gt; <a=
 href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_173589v1/shard-=
rkl-4/igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-pri-indfb-draw-mmap-w=
c.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel=
/-/issues/1825">i915#1825</a>) +2 other tests skip</li>
</ul></li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-cur-indfb-draw-mmap-wc:<=
/p><ul>
<li>shard-dg1:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_19102/shard-dg1-19/igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-=
cur-indfb-draw-mmap-wc.html">SKIP</a> (<a href=3D"https://gitlab.freedeskto=
p.org/drm/i915/kernel/-/issues/15990">i915#15990</a> / <a href=3D"https://g=
itlab.freedesktop.org/drm/i915/kernel/-/issues/4423">i915#4423</a> / <a hre=
f=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8708">i915#870=
8</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_=
173589v1/shard-dg1-14/igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-cur-i=
ndfb-draw-mmap-wc.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org=
/drm/i915/kernel/-/issues/15990">i915#15990</a> / <a href=3D"https://gitlab=
.freedesktop.org/drm/i915/kernel/-/issues/8708">i915#8708</a>)</li>
</ul></li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsrhdr-1p-primscrn-spr-indfb-draw-blt:</=
p><ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_19102/shard-rkl-6/igt@kms_frontbuffer_tracking@fbcpsrhdr-1p-primscr=
n-spr-indfb-draw-blt.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.=
org/drm/i915/kernel/-/issues/14544">i915#14544</a> / <a href=3D"https://git=
lab.freedesktop.org/drm/i915/kernel/-/issues/15102">i915#15102</a>) -&gt; <=
a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_173589v1/shard=
-rkl-4/igt@kms_frontbuffer_tracking@fbcpsrhdr-1p-primscrn-spr-indfb-draw-bl=
t.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel=
/-/issues/15102">i915#15102</a>) +13 other tests skip</li>
</ul></li>
<li>
<p>igt@kms_frontbuffer_tracking@hdr-2p-primscrn-pri-shrfb-draw-mmap-cpu:</p=
><ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_19102/shard-rkl-2/igt@kms_frontbuffer_tracking@hdr-2p-primscrn-pri-=
shrfb-draw-mmap-cpu.html">SKIP</a> -&gt; <a href=3D"https://intel-gfx-ci.01=
.org/tree/drm-tip/Patchwork_173589v1/shard-rkl-6/igt@kms_frontbuffer_tracki=
ng@hdr-2p-primscrn-pri-shrfb-draw-mmap-cpu.html">SKIP</a> (<a href=3D"https=
://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a>) +=
29 other tests skip</li>
</ul></li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-indfb-scaledprimary:</p><ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_19102/shard-rkl-2/igt@kms_frontbuffer_tracking@psr-indfb-scaledprim=
ary.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kern=
el/-/issues/15102">i915#15102</a>) -&gt; <a href=3D"https://intel-gfx-ci.01=
.org/tree/drm-tip/Patchwork_173589v1/shard-rkl-6/igt@kms_frontbuffer_tracki=
ng@psr-indfb-scaledprimary.html">SKIP</a> (<a href=3D"https://gitlab.freede=
sktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a> / <a href=3D"https=
://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15102">i915#15102</a>) +=
14 other tests skip</li>
</ul></li>
<li>
<p>igt@kms_joiner@basic-force-big-joiner:</p><ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_19102/shard-rkl-6/igt@kms_joiner@basic-force-big-joiner.html">SKIP<=
/a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/145=
44">i915#14544</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i915/ker=
nel/-/issues/15459">i915#15459</a>) -&gt; <a href=3D"https://intel-gfx-ci.0=
1.org/tree/drm-tip/Patchwork_173589v1/shard-rkl-4/igt@kms_joiner@basic-forc=
e-big-joiner.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/=
i915/kernel/-/issues/15459">i915#15459</a>)</li>
</ul></li>
<li>
<p>igt@kms_joiner@basic-force-ultra-joiner:</p><ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_19102/shard-rkl-2/igt@kms_joiner@basic-force-ultra-joiner.html">SKI=
P</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/1=
5458">i915#15458</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm=
-tip/Patchwork_173589v1/shard-rkl-6/igt@kms_joiner@basic-force-ultra-joiner=
.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/=
-/issues/14544">i915#14544</a> / <a href=3D"https://gitlab.freedesktop.org/=
drm/i915/kernel/-/issues/15458">i915#15458</a>)</li>
</ul></li>
<li>
<p>igt@kms_joiner@invalid-modeset-force-big-joiner:</p><ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_19102/shard-rkl-2/igt@kms_joiner@invalid-modeset-force-big-joiner.h=
tml">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/=
issues/15459">i915#15459</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/Patchwork_173589v1/shard-rkl-6/igt@kms_joiner@invalid-modeset-=
force-big-joiner.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/=
drm/i915/kernel/-/issues/14544">i915#14544</a> / <a href=3D"https://gitlab.=
freedesktop.org/drm/i915/kernel/-/issues/15459">i915#15459</a>)</li>
</ul></li>
<li>
<p>igt@kms_pipe_stress@stress-xrgb8888-yftiled:</p><ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_19102/shard-rkl-2/igt@kms_pipe_stress@stress-xrgb8888-yftiled.html"=
>SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issu=
es/14712">i915#14712</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree=
/drm-tip/Patchwork_173589v1/shard-rkl-6/igt@kms_pipe_stress@stress-xrgb8888=
-yftiled.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915=
/kernel/-/issues/14544">i915#14544</a> / <a href=3D"https://gitlab.freedesk=
top.org/drm/i915/kernel/-/issues/14712">i915#14712</a>)</li>
</ul></li>
<li>
<p>igt@kms_plane@pixel-format-4-tiled-lnl-ccs-modifier-source-clamping:</p>=
<ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_19102/shard-rkl-2/igt@kms_plane@pixel-format-4-tiled-lnl-ccs-modifi=
er-source-clamping.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.or=
g/drm/i915/kernel/-/issues/15709">i915#15709</a>) -&gt; <a href=3D"https://=
intel-gfx-ci.01.org/tree/drm-tip/Patchwork_173589v1/shard-rkl-6/igt@kms_pla=
ne@pixel-format-4-tiled-lnl-ccs-modifier-source-clamping.html">SKIP</a> (<a=
 href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i91=
5#14544</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/i=
ssues/15709">i915#15709</a>) +1 other test skip</li>
</ul></li>
<li>
<p>igt@kms_plane@pixel-format-y-tiled-ccs-modifier:</p><ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_19102/shard-rkl-6/igt@kms_plane@pixel-format-y-tiled-ccs-modifier.h=
tml">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/=
issues/14544">i915#14544</a> / <a href=3D"https://gitlab.freedesktop.org/dr=
m/i915/kernel/-/issues/15709">i915#15709</a>) -&gt; <a href=3D"https://inte=
l-gfx-ci.01.org/tree/drm-tip/Patchwork_173589v1/shard-rkl-4/igt@kms_plane@p=
ixel-format-y-tiled-ccs-modifier.html">SKIP</a> (<a href=3D"https://gitlab.=
freedesktop.org/drm/i915/kernel/-/issues/15709">i915#15709</a>) +1 other te=
st skip</li>
</ul></li>
<li>
<p>igt@kms_pm_dc@dc6-psr:</p><ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_19102/shard-rkl-6/igt@kms_pm_dc@dc6-psr.html">SKIP</a> (<a href=3D"=
https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14544</=
a> / <a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/159=
48">i915#15948</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-t=
ip/Patchwork_173589v1/shard-rkl-4/igt@kms_pm_dc@dc6-psr.html">SKIP</a> (<a =
href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15948">i915=
#15948</a>)</li>
</ul></li>
<li>
<p>igt@kms_pm_lpsp@kms-lpsp:</p><ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_19102/shard-rkl-1/igt@kms_pm_lpsp@kms-lpsp.html">SKIP</a> (<a href=
=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9340">i915#9340=
</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_1=
73589v1/shard-rkl-8/igt@kms_pm_lpsp@kms-lpsp.html">SKIP</a> (<a href=3D"htt=
ps://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3828">i915#3828</a>)</=
li>
</ul></li>
<li>
<p>igt@kms_psr2_sf@pr-primary-plane-update-sf-dmg-area-big-fb:</p><ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_19102/shard-rkl-2/igt@kms_psr2_sf@pr-primary-plane-update-sf-dmg-ar=
ea-big-fb.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i91=
5/kernel/-/issues/11520">i915#11520</a>) -&gt; <a href=3D"https://intel-gfx=
-ci.01.org/tree/drm-tip/Patchwork_173589v1/shard-rkl-6/igt@kms_psr2_sf@pr-p=
rimary-plane-update-sf-dmg-area-big-fb.html">SKIP</a> (<a href=3D"https://g=
itlab.freedesktop.org/drm/i915/kernel/-/issues/11520">i915#11520</a> / <a h=
ref=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#=
14544</a>) +3 other tests skip</li>
</ul></li>
<li>
<p>igt@kms_psr2_sf@psr2-overlay-plane-move-continuous-exceed-sf:</p><ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_19102/shard-rkl-6/igt@kms_psr2_sf@psr2-overlay-plane-move-continuou=
s-exceed-sf.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i=
915/kernel/-/issues/11520">i915#11520</a> / <a href=3D"https://gitlab.freed=
esktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a>) -&gt; <a href=3D=
"https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_173589v1/shard-rkl-4/ig=
t@kms_psr2_sf@psr2-overlay-plane-move-continuous-exceed-sf.html">SKIP</a> (=
<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11520">i=
915#11520</a>) +1 other test skip</li>
</ul></li>
<li>
<p>igt@kms_psr@fbc-psr2-no-drrs:</p><ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_19102/shard-rkl-2/igt@kms_psr@fbc-psr2-no-drrs.html">SKIP</a> (<a h=
ref=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/1072">i915#1=
072</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issue=
s/9732">i915#9732</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/dr=
m-tip/Patchwork_173589v1/shard-rkl-6/igt@kms_psr@fbc-psr2-no-drrs.html">SKI=
P</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/1=
072">i915#1072</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i915/ker=
nel/-/issues/14544">i915#14544</a> / <a href=3D"https://gitlab.freedesktop.=
org/drm/i915/kernel/-/issues/9732">i915#9732</a>) +4 other tests skip</li>
</ul></li>
<li>
<p>igt@kms_psr@pr-no-drrs:</p><ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_19102/shard-rkl-6/igt@kms_psr@pr-no-drrs.html">SKIP</a> (<a href=3D=
"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/1072">i915#1072</a=
> / <a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/1454=
4">i915#14544</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i915/kern=
el/-/issues/9732">i915#9732</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.o=
rg/tree/drm-tip/Patchwork_173589v1/shard-rkl-4/igt@kms_psr@pr-no-drrs.html"=
>SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issu=
es/1072">i915#1072</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i915=
/kernel/-/issues/9732">i915#9732</a>) +5 other tests skip</li>
</ul></li>
<li>
<p>igt@kms_psr_stress_test@invalidate-primary-flip-overlay:</p><ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_19102/shard-rkl-2/igt@kms_psr_stress_test@invalidate-primary-flip-o=
verlay.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/k=
ernel/-/issues/15949">i915#15949</a>) -&gt; <a href=3D"https://intel-gfx-ci=
.01.org/tree/drm-tip/Patchwork_173589v1/shard-rkl-6/igt@kms_psr_stress_test=
@invalidate-primary-flip-overlay.html">SKIP</a> (<a href=3D"https://gitlab.=
freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a> / <a href=3D=
"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15949">i915#15949<=
/a>)</li>
</ul></li>
<li>
<p>igt@kms_rotation_crc@primary-yf-tiled-reflect-x-180:</p><ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_19102/shard-rkl-2/igt@kms_rotation_crc@primary-yf-tiled-reflect-x-1=
80.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kerne=
l/-/issues/5289">i915#5289</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.or=
g/tree/drm-tip/Patchwork_173589v1/shard-rkl-6/igt@kms_rotation_crc@primary-=
yf-tiled-reflect-x-180.html">SKIP</a> (<a href=3D"https://gitlab.freedeskto=
p.org/drm/i915/kernel/-/issues/14544">i915#14544</a> / <a href=3D"https://g=
itlab.freedesktop.org/drm/i915/kernel/-/issues/5289">i915#5289</a>)</li>
</ul></li>
<li>
<p>igt@kms_rotation_crc@primary-yf-tiled-reflect-x-270:</p><ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_19102/shard-rkl-6/igt@kms_rotation_crc@primary-yf-tiled-reflect-x-2=
70.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kerne=
l/-/issues/14544">i915#14544</a> / <a href=3D"https://gitlab.freedesktop.or=
g/drm/i915/kernel/-/issues/5289">i915#5289</a>) -&gt; <a href=3D"https://in=
tel-gfx-ci.01.org/tree/drm-tip/Patchwork_173589v1/shard-rkl-4/igt@kms_rotat=
ion_crc@primary-yf-tiled-reflect-x-270.html">SKIP</a> (<a href=3D"https://g=
itlab.freedesktop.org/drm/i915/kernel/-/issues/5289">i915#5289</a>) +1 othe=
r test skip</li>
</ul></li>
<li>
<p>igt@kms_setmode@clone-exclusive-crtc:</p><ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_19102/shard-rkl-2/igt@kms_setmode@clone-exclusive-crtc.html">SKIP</=
a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3555=
">i915#3555</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/=
Patchwork_173589v1/shard-rkl-6/igt@kms_setmode@clone-exclusive-crtc.html">S=
KIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues=
/14544">i915#14544</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i915=
/kernel/-/issues/3555">i915#3555</a>)</li>
</ul></li>
<li>
<p>igt@kms_tiled_display@basic-test-pattern-with-chamelium:</p><ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_19102/shard-rkl-2/igt@kms_tiled_display@basic-test-pattern-with-cha=
melium.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/k=
ernel/-/issues/8623">i915#8623</a>) -&gt; <a href=3D"https://intel-gfx-ci.0=
1.org/tree/drm-tip/Patchwork_173589v1/shard-rkl-6/igt@kms_tiled_display@bas=
ic-test-pattern-with-chamelium.html">SKIP</a> (<a href=3D"https://gitlab.fr=
eedesktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a> / <a href=3D"h=
ttps://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8623">i915#8623</a>)=
</li>
</ul></li>
<li>
<p>igt@kms_vrr@flipline:</p><ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_19102/shard-rkl-2/igt@kms_vrr@flipline.html">SKIP</a> (<a href=3D"h=
ttps://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15243">i915#15243</a=
> / <a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3555=
">i915#3555</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/=
Patchwork_173589v1/shard-rkl-6/igt@kms_vrr@flipline.html">SKIP</a> (<a href=
=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#145=
44</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues=
/15243">i915#15243</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i915=
/kernel/-/issues/3555">i915#3555</a>)</li>
</ul></li>
<li>
<p>igt@prime_vgem@basic-read:</p><ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_19102/shard-rkl-2/igt@prime_vgem@basic-read.html">SKIP</a> (<a href=
=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3291">i915#3291=
</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3=
708">i915#3708</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-t=
ip/Patchwork_173589v1/shard-rkl-6/igt@prime_vgem@basic-read.html">SKIP</a> =
(<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">=
i915#14544</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/=
-/issues/3291">i915#3291</a> / <a href=3D"https://gitlab.freedesktop.org/dr=
m/i915/kernel/-/issues/3708">i915#3708</a>)</li>
</ul></li>
<li>
<p>igt@prime_vgem@fence-read-hang:</p><ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_19102/shard-rkl-2/igt@prime_vgem@fence-read-hang.html">SKIP</a> (<a=
 href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3708">i915=
#3708</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/Patchw=
ork_173589v1/shard-rkl-6/igt@prime_vgem@fence-read-hang.html">SKIP</a> (<a =
href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915=
#14544</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/is=
sues/3708">i915#3708</a>)</li>
</ul></li>
</ul><h3>Piglit changes</h3><p>{name}: This element is suppressed. This mea=
ns it is ignored when computing<br> the status of the difference (SUCCESS, =
WARNING, or FAILURE).</p><h2>Build changes</h2><ul>
<li>Linux: CI_DRM_19102 -&gt; Patchwork_173589v1</li>
</ul><p>CI-20190529: 20190529<br> CI_DRM_19102: 06602b51786b6c2a0f97e58f0e0=
f168be1ada27e @ git://anongit.freedesktop.org/gfx-ci/linux<br> IGT_9085: 90=
85<br> Patchwork_173589v1: 06602b51786b6c2a0f97e58f0e0f168be1ada27e @ git:/=
/anongit.freedesktop.org/gfx-ci/linux<br> piglit_4509: fdc5a4ca11124ab8413c=
7988896eec4c97336694 @ git://anongit.freedesktop.org/piglit</p></blockquote=
><div><br></div><div><span></span></div></body></html>

--=-UAfPUPpp5KjpsDBhkDAt--
