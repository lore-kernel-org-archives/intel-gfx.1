Return-Path: <intel-gfx-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 89E64C79FBF
	for <intel-gfx@archiver.kernel.org>; Thu, 10 Sep 2026 10:05:01 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0453B10F3E7;
	Thu, 10 Sep 2026 10:05:01 +0000 (UTC)
Received: from coelho.fi (coelho.fi [88.99.146.29])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 57AB410F3E7;
 Thu, 10 Sep 2026 10:04:59 +0000 (UTC)
Received: from 91-158-54-113.elisa-laajakaista.fi ([91.158.54.113]
 helo=[192.168.100.133])
 by coelho.fi with esmtpsa (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
 (Exim 4.98.2) (envelope-from <luca@coelho.fi>)
 id 1x4beK-00000003Pej-0g7s; Thu, 10 Sep 2026 13:04:57 +0300
Message-ID: <095832443160ee7d6069b29a971895deeeb9976f.camel@coelho.fi>
Subject: Re: =?UTF-8?Q?=E2=9C=97?= i915.CI.Full: failure for
 drm/i915/display: reduce clock_gating interface between core and display
 (rev4)
From: Luca Coelho <luca@coelho.fi>
To: I915-ci-infra@lists.freedesktop.org
Cc: intel-gfx@lists.freedesktop.org, Luca Coelho <luciano.coelho@intel.com>
Date: Thu, 10 Sep 2026 13:04:53 +0300
In-Reply-To: <178890035636.137999.12353983939602688707@61270ab9df2a>
References: <20260908090924.52117-1-luciano.coelho@intel.com>
 <178890035636.137999.12353983939602688707@61270ab9df2a>
Content-Type: multipart/alternative; boundary="=-S4r2Zhz32Rjo7XQ2uVGG"
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

--=-S4r2Zhz32Rjo7XQ2uVGG
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi,

These regressions are not related to my patchset.

igt@kms_cursor_edge_walk@128x128-top-edge@pipe-d-hdmi-a-1
shard-dg1-14: PASS -> DMESG-WARN

This is unrelated to my patchset. The PC8 restoration changes only
apply to HSW/BDW, and the relocated display reinitialization requires
gpu_reset_clobbers_display, which the DG1 boot logs report as "no".

igt@kms_flip@flip-vs-blocking-wf-vblank on shard-dg1-16:

This fails in calibrate_ts() at "3 * stddev / mean < 0.005", with 4.84%
variation against a 0.5% limit. The same assertion also failed on DG1
HDMI-A4 in the independent series 173589, using the same CI_DRM_19102
baseline:

https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_173589v1/shard-dg1-18/ig=
t@kms_flip@flip-vs-wf_vblank-interruptible@c-hdmi-a4.html

The baseline failure was associated with issue 14600, but used a
different assertion, so this signature may need a separate match.

Could you please associate these with the appropriate issues (or re-
file if preferred) so they stop showing up as false regressions on
unrelated series?

(analysis assisted by Copilot)

--
Cheers,
Luca.


On Tue, 2026-09-08 at 20:45 +0000, Patchwork wrote:
> Patch Details
>=20
> Series:drm/i915/display: reduce clock_gating interface between core
> and display (rev4)
>=20
> URL:https://patchwork.freedesktop.org/series/169493/
>=20
> State:failure
> Details:
> https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_169493v4/index.html
> CI Bug Log - changes from CI_DRM_19102_full -> Patchwork_169493v4_fullSum=
maryFAILURE
> Serious unknown changes coming with Patchwork_169493v4_full
> absolutely need to be
> verified manually.
> If you think the reported changes have nothing to do with the changes
> introduced in Patchwork_169493v4_full, please notify your bug team
> (I915-ci-infra@lists.freedesktop.org) to allow them
> to document this new failure mode, which will reduce false positives
> in CI.
> Participating hosts (10 -> 11)Additional (1): pig-kbl-iris=20
> Possible new issuesHere are the unknown changes that may have been introd=
uced in
> Patchwork_169493v4_full:
> IGT changesPossible regressions * igt@kms_cursor_edge_walk@128x128-top-ed=
ge@pipe-d-hdmi-a-1:shard-dg1:
>    PASS [645] -> DMESG-WARN [644]
> Warnings * igt@kms_flip@flip-vs-blocking-wf-vblank:shard-dg1:          FA=
IL [643](i915#1
>    4600 [198]) -> FAIL [642]
> New testsNew tests have been introduced between CI_DRM_19102_full and
> Patchwork_169493v4_full:
> New IGT tests (4) *=20
>    igt@kms_cursor_crc@cursor-onscreen-64x21@pipe-a-hdmi-a-4:Statuses :
>    1 pass(s)Exec time: [2.79] s
>  *=20
>    igt@kms_cursor_crc@cursor-onscreen-64x21@pipe-d-hdmi-a-4:Statuses :
>    1 pass(s)Exec time: [2.66] s
>  *=20
>    igt@kms_cursor_crc@cursor-sliding-256x85@pipe-a-hdmi-a-3:Statuses :
>    1 pass(s)Exec time: [4.39] s
>  *=20
>    igt@kms_cursor_crc@cursor-sliding-256x85@pipe-d-hdmi-a-3:Statuses :
>    1 pass(s)Exec time: [4.37] s
> Known issuesHere are the changes found in Patchwork_169493v4_full that co=
me from
> known issues:
> IGT changesIssues hit *=20
>    igt@api_intel_bb@crc32:shard-rkl: NOTRUN -> SKIP [641] (i915#6230
>    [640])
>  *=20
>    igt@api_intel_bb@object-reloc-keep-cache:shard-dg1: NOTRUN -> SKIP
>    [639] (i915#8411 [638])
>  *=20
>    igt@device_reset@cold-reset-bound:shard-dg1: NOTRUN -> SKIP [637]
>    (i915#11078 [635])
>  *=20
>    igt@device_reset@unbind-cold-reset-rebind:shard-tglu-1: NOTRUN ->
>    SKIP [636] (i915#11078 [635])
>  *=20
>    igt@gem_busy@semaphore:shard-dg2: NOTRUN -> SKIP [634] (i915#3936
>    [633])
>  *=20
>    igt@gem_ccs@ctrl-surf-copy:shard-rkl: NOTRUN -> SKIP [632]
>    (i915#3555 [1] / i915#9323 [164])
>  *=20
>    igt@gem_ccs@large-ctrl-surf-copy:shard-tglu-1: NOTRUN -> SKIP [631]
>    (i915#13008 [630])
>  *=20
>    igt@gem_ccs@suspend-resume@linear-compressed-compfmt0-lmem0-
>    lmem0:shard-dg2: PASS [629] -> INCOMPLETE [628] (i915#13356 [224] /
>    i915#16348 [627])
>  *=20
>    igt@gem_close_race@multigpu-basic-process:shard-tglu-1: NOTRUN ->
>    SKIP [626] (i915#7697 [624])
>  *=20
>    igt@gem_close_race@multigpu-basic-threads:shard-dg1: NOTRUN -> SKIP
>    [625] (i915#7697 [624])
>  *=20
>    igt@gem_create@create-ext-set-pat:shard-rkl: NOTRUN -> SKIP [623]
>    (i915#8562 [622])
>  *=20
>    igt@gem_ctx_persistence@hang:shard-dg1: NOTRUN -> SKIP [621]
>    (i915#8555 [619])
>  *=20
>    igt@gem_ctx_persistence@heartbeat-many:shard-dg2: NOTRUN -> SKIP
>    [620] (i915#8555 [619])
>  *=20
>    igt@gem_ctx_sseu@invalid-args:shard-rkl: NOTRUN -> SKIP [617]
>    (i915#280 [616]) +1 other test skipshard-tglu: NOTRUN -> SKIP [618]
>    (i915#280 [616])
>  *=20
>    igt@gem_exec_balancer@bonded-false-hang:shard-dg1: NOTRUN -> SKIP
>    [615] (i915#4812 [614]) +1 other test skip
>  *=20
>    igt@gem_exec_balancer@bonded-pair:shard-dg1: NOTRUN -> SKIP [613]
>    (i915#4771 [612])
>  *=20
>    igt@gem_exec_balancer@parallel-keep-submit-fence:shard-tglu-1:
>    NOTRUN -> SKIP [611] (i915#4525 [154])
>  *=20
>    igt@gem_exec_flush@basic-uc-ro-default:shard-dg1: NOTRUN -> SKIP
>    [610] (i915#3539 [609] / i915#4852 [608]) +1 other test skip
>  *=20
>    igt@gem_exec_reloc@basic-wc:shard-rkl: NOTRUN -> SKIP [607]
>    (i915#3281 [146]) +8 other tests skip
>  *=20
>    igt@gem_exec_reloc@basic-write-cpu-noreloc:shard-dg2: NOTRUN -> SKIP
>    [606] (i915#3281 [146]) +1 other test skip
>  *=20
>    igt@gem_exec_reloc@basic-write-read-active:shard-dg1: NOTRUN -> SKIP
>    [605] (i915#3281 [146]) +3 other tests skip
>  *=20
>    igt@gem_exec_suspend@basic-s0:shard-dg2: PASS [604] -> INCOMPLETE
>    [603] (i915#13356 [224]) +1 other test incomplete
>  *=20
>    igt@gem_huc_copy@huc-copy:shard-rkl: NOTRUN -> SKIP [602] (i915#2190
>    [601])
>  *=20
>    igt@gem_lmem_evict@dontneed-evict-race:shard-tglu: NOTRUN -> SKIP
>    [600] (i915#4613 [138] / i915#7582 [599])
>  *=20
>    igt@gem_lmem_swapping@heavy-random:shard-tglu-1: NOTRUN -> SKIP
>    [598] (i915#4613 [138])
>  *=20
>    igt@gem_lmem_swapping@massive:shard-rkl: NOTRUN -> SKIP [597]
>    (i915#4613 [138]) +1 other test skip
>  *=20
>    igt@gem_lmem_swapping@random:shard-glk: NOTRUN -> SKIP [596]
>    (i915#4613 [138]) +2 other tests skip
>  *=20
>    igt@gem_lmem_swapping@verify-ccs:shard-dg1: NOTRUN -> SKIP [594]
>    (i915#12193 [593])shard-tglu: NOTRUN -> SKIP [595] (i915#4613 [138])
>    +1 other test skip
>  *=20
>    igt@gem_lmem_swapping@verify-ccs@lmem0:shard-dg1: NOTRUN -> SKIP
>    [592] (i915#4565 [591])
>  *=20
>    igt@gem_mmap_gtt@cpuset-basic-small-copy-xy:shard-dg2: NOTRUN ->
>    SKIP [590] (i915#4077 [280]) +2 other tests skip
>  *=20
>    igt@gem_mmap_wc@write-prefaulted:shard-dg2: NOTRUN -> SKIP [589]
>    (i915#4083 [587]) +1 other test skip
>  *=20
>    igt@gem_mmap_wc@write-read:shard-dg1: NOTRUN -> SKIP [588]
>    (i915#4083 [587]) +2 other tests skip
>  *=20
>    igt@gem_partial_pwrite_pread@writes-after-reads-snoop:shard-dg2:
>    NOTRUN -> SKIP [586] (i915#3282 [135]) +2 other tests skip
>  *=20
>    igt@gem_pwrite_snooped:shard-dg1: NOTRUN -> SKIP [585] (i915#3282
>    [135])
>  *=20
>    igt@gem_pxp@dmabuf-shared-protected-dst-is-context-refcounted:shard-
>    dg1: NOTRUN -> SKIP [584] (i915#4270 [583])
>  *=20
>    igt@gem_pxp@verify-pxp-execution-after-suspend-resume:shard-rkl:
>    PASS [582] -> ABORT [581] (i915#15131 [580])
>  *=20
>    igt@gem_render_copy@y-tiled-ccs-to-y-tiled-ccs:shard-dg2: NOTRUN ->
>    SKIP [579] (i915#5190 [498] / i915#8428 [578]) +1 other test skip
>  *=20
>    igt@gem_render_copy@y-tiled-ccs-to-y-tiled-mc-ccs:shard-glk: NOTRUN
>    -> SKIP [577] +355 other tests skip
>  *=20
>    igt@gem_set_tiling_vs_pwrite:shard-rkl: NOTRUN -> SKIP [576]
>    (i915#3282 [135]) +5 other tests skip
>  *=20
>    igt@gem_softpin@evict-snoop-interruptible:shard-dg1: NOTRUN -> SKIP
>    [575] (i915#4885 [574])
>  *=20
>    igt@gem_tiled_pread_pwrite:shard-dg1: NOTRUN -> SKIP [573]
>    (i915#4079 [572]) +1 other test skip
>  *=20
>    igt@gem_userptr_blits@access-control:shard-dg2: NOTRUN -> SKIP [571]
>    (i915#3297 [564])
>  *=20
>    igt@gem_userptr_blits@coherency-unsync:shard-rkl: NOTRUN -> SKIP
>    [570] (i915#3297 [564]) +1 other test skip
>  *=20
>    igt@gem_userptr_blits@invalid-mmap-offset-unsync:shard-tglu: NOTRUN
>    -> SKIP [569] (i915#3297 [564])
>  *=20
>    igt@gem_userptr_blits@map-fixed-invalidate-busy:shard-dg2: NOTRUN ->
>    SKIP [568] (i915#3297 [564] / i915#4880 [567])
>  *=20
>    igt@gem_userptr_blits@readonly-pwrite-unsync:shard-dg1: NOTRUN ->
>    SKIP [566] (i915#3297 [564]) +1 other test skip
>  *=20
>    igt@gem_userptr_blits@readonly-unsync:shard-tglu-1: NOTRUN -> SKIP
>    [565] (i915#3297 [564])
>  *=20
>    igt@gen9_exec_parse@batch-without-end:shard-rkl: NOTRUN -> SKIP
>    [563] (i915#2527 [130]) +1 other test skip
>  *=20
>    igt@gen9_exec_parse@bb-chained:shard-tglu-1: NOTRUN -> SKIP [562]
>    (i915#2527 [130] / i915#2856 [560])
>  *=20
>    igt@gen9_exec_parse@bb-start-out:shard-dg1: NOTRUN -> SKIP [559]
>    (i915#2527 [130]) +2 other tests skipshard-tglu: NOTRUN -> SKIP
>    [561] (i915#2527 [130] / i915#2856 [560])
>  *=20
>    igt@i915_drm_fdinfo@all-busy-idle-check-all:shard-dg2: NOTRUN ->
>    SKIP [558] (i915#14123 [557])
>  *=20
>    igt@i915_drm_fdinfo@busy-check-all:shard-dg1: NOTRUN -> SKIP [556]
>    (i915#11527 [555]) +5 other tests skip
>  *=20
>    igt@i915_drm_fdinfo@virtual-busy-hang-all:shard-dg1: NOTRUN -> SKIP
>    [554] (i915#14118 [552])
>  *=20
>    igt@i915_drm_fdinfo@virtual-busy-idle:shard-dg2: NOTRUN -> SKIP
>    [553] (i915#14118 [552])
>  *=20
>    igt@i915_module_load@reload:shard-dg1: NOTRUN -> DMESG-WARN [551]
>    (i915#14545 [550])
>  *=20
>    igt@i915_pm_freq_api@freq-reset-multiple:shard-tglu: NOTRUN -> SKIP
>    [549] (i915#8399 [548])
>  *=20
>    igt@i915_pm_rc6_residency@media-rc6-accuracy:shard-dg2: NOTRUN ->
>    SKIP [547] (i915#16080 [546] / i915#16166 [545])
>  *=20
>    igt@i915_pm_rpm@system-suspend:shard-rkl: PASS [544] -> INCOMPLETE
>    [543] (i915#13356 [224])
>  *=20
>    igt@i915_pm_rpm@system-suspend-execbuf:shard-rkl: NOTRUN ->
>    INCOMPLETE [542] (i915#13356 [224])
>  *=20
>    igt@i915_pm_rps@min-max-config-idle:shard-dg1: NOTRUN -> SKIP [541]
>    (i915#11681 [538] / i915#6621 [540])
>  *=20
>    igt@i915_pm_rps@thresholds-park:shard-dg1: NOTRUN -> SKIP [539]
>    (i915#11681 [538])
>  *=20
>    igt@i915_power@sanity:shard-mtlp: PASS [537] -> SKIP [536]
>    (i915#7984 [535])
>  *=20
>    igt@i915_query@test-query-geometry-subslices:shard-rkl: NOTRUN ->
>    SKIP [534] (i915#5723 [533])
>  *=20
>    igt@i915_suspend@fence-restore-untiled:shard-rkl: PASS [532] ->
>    INCOMPLETE [531] (i915#4817 [218])
>  *=20
>    igt@intel_hwmon@hwmon-write:shard-rkl: NOTRUN -> SKIP [530]
>    (i915#7707 [121])
>  *=20
>    igt@kms_addfb_basic@clobberred-modifier:shard-dg1: NOTRUN -> SKIP
>    [529] (i915#4212 [528])
>  *=20
>    igt@kms_addfb_basic@invalid-smem-bo-on-discrete:shard-tglu-1: NOTRUN
>    -> SKIP [527] (i915#12454 [526] / i915#12712 [525])
>  *=20
>    igt@kms_async_flips@async-flip-suspend-resume:shard-rkl: PASS [524]
>    -> INCOMPLETE [523] (i915#12761 [521])
>  *=20
>    igt@kms_async_flips@async-flip-suspend-resume@pipe-b-hdmi-a-2:shard-
>    rkl: NOTRUN -> INCOMPLETE [522] (i915#12761 [521])
>  *=20
>    igt@kms_atomic@plane-primary-overlay-mutable-zpos:shard-rkl: NOTRUN
>    -> SKIP [520] (i915#9531 [519])
>  *=20
>    igt@kms_atomic_transition@plane-all-modeset-transition@pipe-b-hdmi-
>    a-1:shard-tglu: NOTRUN -> ABORT [518] (i915#16837 [158] / i915#16866
>    [161]) +1 other test abort
>  *=20
>    igt@kms_atomic_transition@plane-toggle-modeset-transition@pipe-a-
>    edp-1:shard-mtlp: PASS [517] -> FAIL [516] (i915#5956 [515]) +1
>    other test fail
>  *=20
>    igt@kms_big_fb@4-tiled-8bpp-rotate-180:shard-tglu-1: NOTRUN -> SKIP
>    [514] (i915#5286 [116]) +2 other tests skip
>  *=20
>    igt@kms_big_fb@4-tiled-max-hw-stride-32bpp-rotate-0-async-
>    flip:shard-tglu: NOTRUN -> SKIP [513] (i915#5286 [116]) +4 other
>    tests skip
>  *=20
>    igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-0-hflip:shard-rkl:
>    NOTRUN -> SKIP [511] (i915#5286 [116]) +4 other tests skipshard-dg1:
>    NOTRUN -> SKIP [512] (i915#4538 [499] / i915#5286 [116]) +3 other
>    tests skip
>  *=20
>    igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-180-hflip:shard-
>    mtlp: PASS [510] -> FAIL [509] (i915#15733 [508] / i915#5138 [507])
>  *=20
>    igt@kms_big_fb@linear-8bpp-rotate-270:shard-dg1: NOTRUN -> SKIP
>    [506] (i915#3638 [111]) +4 other tests skip
>  *=20
>    igt@kms_big_fb@linear-max-hw-stride-32bpp-rotate-0-hflip:shard-rkl:
>    NOTRUN -> SKIP [505] (i915#3828 [503])
>  *=20
>    igt@kms_big_fb@linear-max-hw-stride-64bpp-rotate-180-hflip:shard-
>    tglu-1: NOTRUN -> SKIP [504] (i915#3828 [503]) +1 other test skip
>  *=20
>    igt@kms_big_fb@y-tiled-64bpp-rotate-90:shard-rkl: NOTRUN -> SKIP
>    [502] (i915#3638 [111]) +1 other test skip
>  *=20
>    igt@kms_big_fb@yf-tiled-16bpp-rotate-270:shard-dg1: NOTRUN -> SKIP
>    [501] (i915#4538 [499]) +3 other tests skip
>  *=20
>    igt@kms_big_fb@yf-tiled-8bpp-rotate-0:shard-dg2: NOTRUN -> SKIP
>    [500] (i915#4538 [499] / i915#5190 [498]) +3 other tests skip
>  *=20
>    igt@kms_ccs@bad-aux-stride-y-tiled-gen12-rc-ccs@pipe-d-hdmi-a-
>    1:shard-dg2: NOTRUN -> SKIP [497] (i915#10307 [481] / i915#10434
>    [496] / i915#6095 [99]) +4 other tests skip
>  *=20
>    igt@kms_ccs@crc-primary-basic-4-tiled-dg2-rc-ccs-cc@pipe-a-hdmi-a-
>    1:shard-tglu-1: NOTRUN -> SKIP [495] (i915#6095 [99]) +24 other
>    tests skip
>  *=20
>    igt@kms_ccs@crc-primary-basic-4-tiled-lnl-ccs:shard-dg1: NOTRUN ->
>    SKIP [494] (i915#12313 [483])
>  *=20
>    igt@kms_ccs@crc-primary-rotation-180-4-tiled-bmg-ccs:shard-tglu-1:
>    NOTRUN -> SKIP [493] (i915#12313 [483]) +1 other test skip
>  *=20
>    igt@kms_ccs@crc-primary-rotation-180-y-tiled-ccs@pipe-a-hdmi-a-
>    3:shard-dg1: NOTRUN -> SKIP [492] (i915#6095 [99]) +132 other tests
>    skip
>  *=20
>    igt@kms_ccs@crc-primary-rotation-180-y-tiled-gen12-rc-ccs-cc:shard-
>    glk11: NOTRUN -> SKIP [491] +83 other tests skip
>  *=20
>    igt@kms_ccs@crc-primary-suspend-4-tiled-mtl-rc-ccs@pipe-a-hdmi-a-
>    3:shard-dg2: NOTRUN -> SKIP [490] (i915#6095 [99]) +12 other tests
>    skip
>  *=20
>    igt@kms_ccs@crc-primary-suspend-yf-tiled-ccs:shard-glk: NOTRUN ->
>    INCOMPLETE [489] (i915#14694 [488] / i915#15582 [487]) +1 other test
>    incomplete
>  *=20
>    igt@kms_ccs@crc-primary-suspend-yf-tiled-ccs@pipe-c-hdmi-a-2:shard-
>    rkl: NOTRUN -> SKIP [486] (i915#14098 [100] / i915#6095 [99]) +35
>    other tests skip
>  *=20
>    igt@kms_ccs@crc-sprite-planes-basic-4-tiled-bmg-ccs:shard-tglu:
>    NOTRUN -> SKIP [485] (i915#12313 [483]) +2 other tests skip
>  *=20
>    igt@kms_ccs@crc-sprite-planes-basic-4-tiled-lnl-ccs:shard-rkl:
>    NOTRUN -> SKIP [484] (i915#12313 [483]) +2 other tests skip
>  *=20
>    igt@kms_ccs@crc-sprite-planes-basic-4-tiled-mtl-mc-ccs@pipe-a-hdmi-
>    a-3:shard-dg2: NOTRUN -> SKIP [482] (i915#10307 [481] / i915#6095
>    [99]) +99 other tests skip
>  *=20
>    igt@kms_ccs@missing-ccs-buffer-4-tiled-mtl-mc-ccs@pipe-d-hdmi-a-
>    1:shard-tglu: NOTRUN -> SKIP [480] (i915#6095 [99]) +44 other tests
>    skip
>  *=20
>    igt@kms_ccs@random-ccs-data-4-tiled-mtl-rc-ccs@pipe-b-hdmi-a-
>    2:shard-rkl: NOTRUN -> SKIP [479] (i915#6095 [99]) +59 other tests
>    skip
>  *=20
>    igt@kms_cdclk@mode-transition:shard-rkl: NOTRUN -> SKIP [478]
>    (i915#3742 [96])
>  *=20
>    igt@kms_cdclk@mode-transition@pipe-d-hdmi-a-1:shard-dg2: NOTRUN ->
>    SKIP [477] (i915#13781 [476]) +3 other tests skip
>  *=20
>    igt@kms_chamelium_audio@dp-audio-edid:shard-dg2: NOTRUN -> SKIP
>    [475] (i915#11151 [89] / i915#7828 [88]) +1 other test skip
>  *=20
>    igt@kms_chamelium_color@ctm-green-to-red:shard-dg2: NOTRUN -> SKIP
>    [474] +2 other tests skip
>  *=20
>    igt@kms_chamelium_color_pipeline@plane-lut1d-ctm3x4-lut1d:shard-dg1:
>    NOTRUN -> SKIP [473] (i915#16471 [470])
>  *=20
>    igt@kms_chamelium_color_pipeline@plane-lut1d-pre-ctm3x4:shard-rkl:
>    NOTRUN -> SKIP [471] (i915#16471 [470]) +1 other test skipshard-
>    tglu: NOTRUN -> SKIP [472] (i915#16471 [470])
>  *=20
>    igt@kms_chamelium_hpd@vga-hpd-fast:shard-rkl: NOTRUN -> SKIP [467]
>    (i915#11151 [89] / i915#7828 [88]) +1 other test skipshard-dg1:
>    NOTRUN -> SKIP [468] (i915#11151 [89] / i915#7828 [88]) +8 other
>    tests skipshard-tglu: NOTRUN -> SKIP [469] (i915#11151 [89] /
>    i915#7828 [88]) +7 other tests skip
>  *=20
>    igt@kms_chamelium_hpd@vga-hpd-for-each-pipe:shard-tglu-1: NOTRUN ->
>    SKIP [466] (i915#11151 [89] / i915#7828 [88]) +6 other tests skip
>  *=20
>    igt@kms_color@deep-color:shard-dg2: NOTRUN -> SKIP [465] (i915#12655
>    [464] / i915#3555 [1])
>  *=20
>    igt@kms_content_protection@content-type-change:shard-tglu: NOTRUN ->
>    SKIP [463] (i915#15865 [82]) +2 other tests skip
>  *=20
>    igt@kms_content_protection@dp-mst-lic-type-0:shard-tglu-1: NOTRUN ->
>    SKIP [462] (i915#15330 [85] / i915#3116 [458] / i915#3299 [456])
>  *=20
>    igt@kms_content_protection@dp-mst-lic-type-1:shard-rkl: NOTRUN ->
>    SKIP [459] (i915#15330 [85] / i915#3116 [458])shard-dg1: NOTRUN ->
>    SKIP [460] (i915#15330 [85] / i915#3299 [456])shard-tglu: NOTRUN ->
>    SKIP [461] (i915#15330 [85] / i915#3116 [458] / i915#3299 [456])
>  *=20
>    igt@kms_content_protection@dp-mst-type-0:shard-dg2: NOTRUN -> SKIP
>    [457] (i915#15330 [85] / i915#3299 [456])
>  *=20
>    igt@kms_content_protection@dp-mst-type-1-suspend-resume:shard-dg2:
>    NOTRUN -> SKIP [455] (i915#15330 [85])
>  *=20
>    igt@kms_content_protection@legacy:shard-dg1: NOTRUN -> SKIP [454]
>    (i915#15865 [82])
>  *=20
>    igt@kms_content_protection@legacy-hdcp14:shard-tglu-1: NOTRUN ->
>    SKIP [453] (i915#15865 [82]) +1 other test skip
>  *=20
>    igt@kms_content_protection@srm:shard-rkl: NOTRUN -> SKIP [452]
>    (i915#15865 [82])
>  *=20
>    igt@kms_cursor_crc@cursor-offscreen-512x170:shard-dg1: NOTRUN ->
>    SKIP [451] (i915#13049 [79]) +1 other test skip
>  *=20
>    igt@kms_cursor_crc@cursor-offscreen-max-size:shard-tglu-1: NOTRUN ->
>    SKIP [450] (i915#3555 [1])
>  *=20
>    igt@kms_cursor_crc@cursor-onscreen-128x42:shard-rkl: PASS [449] ->
>    FAIL [448] (i915#13566 [439]) +3 other tests fail
>  *=20
>    igt@kms_cursor_crc@cursor-random-256x85@pipe-a-hdmi-a-1:shard-rkl:
>    NOTRUN -> FAIL [447] (i915#13566 [439]) +4 other tests fail
>  *=20
>    igt@kms_cursor_crc@cursor-random-64x21:shard-tglu-1: NOTRUN -> FAIL
>    [446] (i915#13566 [439]) +1 other test fail
>  *=20
>    igt@kms_cursor_crc@cursor-random-max-size:shard-rkl: NOTRUN -> SKIP
>    [445] (i915#3555 [1])
>  *=20
>    igt@kms_cursor_crc@cursor-rapid-movement-32x10:shard-tglu: NOTRUN ->
>    SKIP [444] (i915#3555 [1]) +2 other tests skip
>  *=20
>    igt@kms_cursor_crc@cursor-rapid-movement-512x170:shard-tglu-1:
>    NOTRUN -> SKIP [443] (i915#13049 [79])
>  *=20
>    igt@kms_cursor_crc@cursor-rapid-movement-512x512:shard-tglu: NOTRUN
>    -> SKIP [442] (i915#13049 [79])
>  *=20
>    igt@kms_cursor_crc@cursor-sliding-128x42@pipe-a-hdmi-a-1:shard-tglu:
>    PASS [441] -> FAIL [440] (i915#13566 [439]) +3 other tests fail
>  *=20
>    igt@kms_cursor_crc@cursor-sliding-512x170:shard-rkl: NOTRUN -> SKIP
>    [438] (i915#13049 [79])
>  *=20
>    igt@kms_cursor_crc@cursor-suspend:shard-glk: NOTRUN -> INCOMPLETE
>    [437] (i915#12358 [434] / i915#14152 [433] / i915#7882 [436])
>  *=20
>    igt@kms_cursor_crc@cursor-suspend@pipe-a-hdmi-a-1:shard-glk: NOTRUN
>    -> INCOMPLETE [435] (i915#12358 [434] / i915#14152 [433])
>  *=20
>    igt@kms_cursor_edge_walk@128x128-top-edge:shard-dg1: PASS [432] ->
>    DMESG-WARN [431] (i915#16685 [430])
>  *=20
>    igt@kms_cursor_edge_walk@256x256-top-edge:shard-dg1: PASS [429] ->
>    DMESG-WARN [428] (i915#4423 [42]) +1 other test dmesg-warn
>  *=20
>    igt@kms_cursor_legacy@short-busy-flip-before-cursor-atomic-
>    transitions-varying-size:shard-tglu-1: NOTRUN -> SKIP [427]
>    (i915#4103 [425])
>  *=20
>    igt@kms_cursor_legacy@short-busy-flip-before-cursor-toggle:shard-
>    dg1: NOTRUN -> SKIP [426] (i915#4103 [425])
>  *=20
>    igt@kms_dirtyfb@drrs-dirtyfb-ioctl:shard-tglu-1: NOTRUN -> SKIP
>    [424] (i915#9723 [423])
>  *=20
>    igt@kms_dither@fb-8bpc-vs-panel-8bpc:shard-dg1: NOTRUN -> SKIP [422]
>    (i915#3555 [1]) +3 other tests skip
>  *=20
>    igt@kms_dp_link_training@uhbr-sst:shard-dg1: NOTRUN -> SKIP [421]
>    (i915#13748 [420])
>  *=20
>    igt@kms_dp_linktrain_fallback@uhbr-to-hbr-fallback:shard-tglu-1:
>    NOTRUN -> SKIP [419] (i915#16870 [418])
>  *=20
>    igt@kms_draw_crc@draw-method-mmap-gtt:shard-dg2: NOTRUN -> SKIP
>    [417] (i915#8812 [416])
>  *=20
>    igt@kms_dsc@dsc-basic:shard-rkl: NOTRUN -> SKIP [415] (i915#16361
>    [72]) +2 other tests skip
>  *=20
>    igt@kms_dsc@dsc-basic-ultrajoiner:shard-tglu: NOTRUN -> SKIP [414]
>    (i915#16361 [72]) +1 other test skip
>  *=20
>    igt@kms_dsc@dsc-with-bpc-bigjoiner:shard-dg1: NOTRUN -> SKIP [413]
>    (i915#16361 [72]) +2 other tests skip
>  *=20
>    igt@kms_dsc@dsc-with-formats-bigjoiner:shard-tglu-1: NOTRUN -> SKIP
>    [412] (i915#16361 [72]) +2 other tests skip
>  *=20
>    igt@kms_dsc@dsc-with-formats-ultrajoiner:shard-dg2: NOTRUN -> SKIP
>    [411] (i915#16361 [72])
>  *=20
>    igt@kms_fbcon_fbt@psr:shard-rkl: NOTRUN -> SKIP [410] (i915#16680
>    [409])
>  *=20
>    igt@kms_feature_discovery@display-3x:shard-rkl: NOTRUN -> SKIP [407]
>    (i915#16081 [406])shard-tglu: NOTRUN -> SKIP [408] (i915#16081
>    [406])
>  *=20
>    igt@kms_feature_discovery@psr1:shard-dg2: NOTRUN -> SKIP [405]
>    (i915#658 [403])
>  *=20
>    igt@kms_feature_discovery@psr2:shard-dg1: NOTRUN -> SKIP [404]
>    (i915#658 [403])
>  *=20
>    igt@kms_fence_pin_leak:shard-dg2: NOTRUN -> SKIP [402] (i915#4881
>    [401])
>  *=20
>    igt@kms_flip@2x-absolute-wf_vblank:shard-dg1: NOTRUN -> SKIP [399]
>    (i915#9934 [67]) +3 other tests skipshard-tglu: NOTRUN -> SKIP [400]
>    (i915#3637 [396] / i915#9934 [67]) +4 other tests skip
>  *=20
>    igt@kms_flip@2x-absolute-wf_vblank-interruptible:shard-dg2: NOTRUN -
>    > SKIP [398] (i915#9934 [67]) +1 other test skip
>  *=20
>    igt@kms_flip@2x-blocking-wf_vblank:shard-tglu-1: NOTRUN -> SKIP
>    [397] (i915#3637 [396] / i915#9934 [67]) +4 other tests skip
>  *=20
>    igt@kms_flip@2x-flip-vs-dpms-on-nop-interruptible:shard-tglu-1:
>    NOTRUN -> SKIP [395] (i915#9934 [67])
>  *=20
>    igt@kms_flip@2x-flip-vs-fences-interruptible:shard-dg1: NOTRUN ->
>    SKIP [394] (i915#8381 [393]) +1 other test skip
>  *=20
>    igt@kms_flip@2x-single-buffer-flip-vs-dpms-off-vs-modeset-
>    interruptible:shard-rkl: NOTRUN -> SKIP [392] (i915#9934 [67]) +3
>    other tests skip
>  *=20
>    igt@kms_flip@flip-vs-blocking-wf-vblank@b-hdmi-a4:shard-dg1: PASS
>    [391] -> FAIL [390] (i915#10826 [213])
>  *=20
>    igt@kms_flip@flip-vs-expired-vblank-interruptible:shard-rkl: PASS
>    [389] -> FAIL [388] (i915#13027 [201])
>  *=20
>    igt@kms_flip@flip-vs-expired-vblank-interruptible@a-hdmi-a2:shard-
>    glk11: PASS [387] -> FAIL [386] (i915#13027 [201])
>  *=20
>    igt@kms_flip@flip-vs-expired-vblank-interruptible@b-hdmi-a2:shard-
>    rkl: NOTRUN -> FAIL [385] (i915#13027 [201])
>  *=20
>    igt@kms_flip@flip-vs-expired-vblank-interruptible@c-hdmi-a3:shard-
>    dg2: PASS [384] -> FAIL [383] (i915#13027 [201]) +1 other test fail
>  *=20
>    igt@kms_flip@flip-vs-suspend:shard-rkl: PASS [380] -> INCOMPLETE
>    [379] (i915#16276 [375] / i915#6113 [374])shard-glk: NOTRUN ->
>    INCOMPLETE [382] (i915#12745 [377] / i915#4839 [381])
>  *=20
>    igt@kms_flip@flip-vs-suspend@a-hdmi-a1:shard-glk: NOTRUN ->
>    INCOMPLETE [378] (i915#12745 [377])
>  *=20
>    igt@kms_flip@flip-vs-suspend@a-hdmi-a2:shard-rkl: NOTRUN ->
>    INCOMPLETE [376] (i915#16276 [375] / i915#6113 [374])
>  *=20
>    igt@kms_flip_scaled_crc@flip-32bpp-4tile-to-64bpp-4tile-
>    upscaling:shard-dg1: NOTRUN -> SKIP [373] (i915#15643 [62]) +4 other
>    tests skip
>  *=20
>    igt@kms_flip_scaled_crc@flip-32bpp-yftile-to-32bpp-yftileccs-
>    upscaling:shard-dg2: NOTRUN -> SKIP [372] (i915#15643 [62])
>  *=20
>    igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytileccs-
>    downscaling:shard-tglu-1: NOTRUN -> SKIP [371] (i915#15643 [62]) +3
>    other tests skip
>  *=20
>    igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-16bpp-4tile-
>    downscaling:shard-tglu: NOTRUN -> SKIP [370] (i915#15643 [62]) +2
>    other tests skip
>  *=20
>    igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-16bpp-4tile-
>    upscaling:shard-rkl: NOTRUN -> SKIP [369] (i915#15643 [62]) +2 other
>    tests skip
>  *=20
>    igt@kms_frontbuffer_tracking@fbc-1p-primscrn-spr-indfb-draw-mmap-
>    wc:shard-dg2: NOTRUN -> SKIP [368] (i915#15990 [43] / i915#8708
>    [54]) +3 other tests skip
>  *=20
>    igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-cur-indfb-draw-
>    render:shard-dg1: NOTRUN -> SKIP [367] +53 other tests skip
>  *=20
>    igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-pri-shrfb-draw-mmap-
>    gtt:shard-dg1: NOTRUN -> SKIP [366] (i915#15990 [43] / i915#8708
>    [54]) +11 other tests skip
>  *=20
>    igt@kms_frontbuffer_tracking@fbc-suspend:shard-glk10: NOTRUN ->
>    INCOMPLETE [365] (i915#10056 [364] / i915#16593 [363])
>  *=20
>    igt@kms_frontbuffer_tracking@fbchdr-1p-offscreen-pri-indfb-draw-
>    mmap-wc:shard-tglu: NOTRUN -> SKIP [362] (i915#15989 [195]) +16
>    other tests skip
>  *=20
>    igt@kms_frontbuffer_tracking@fbchdr-1p-primscrn-spr-indfb-draw-
>    render:shard-dg2: NOTRUN -> SKIP [361] (i915#15989 [195]) +6 other
>    tests skip
>  *=20
>    igt@kms_frontbuffer_tracking@fbchdr-1p-primscrn-spr-indfb-
>    onoff:shard-rkl: NOTRUN -> SKIP [360] (i915#15989 [195]) +14 other
>    tests skip
>  *=20
>    igt@kms_frontbuffer_tracking@fbchdr-2p-primscrn-spr-indfb-draw-mmap-
>    cpu:shard-glk: PASS [359] -> SKIP [358] +2 other tests skip
>  *=20
>    igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-pri-indfb-draw-
>    pwrite:shard-dg2: NOTRUN -> SKIP [357] (i915#15102 [49]) +13 other
>    tests skip
>  *=20
>    igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-pri-shrfb-draw-mmap-
>    wc:shard-tglu: NOTRUN -> SKIP [356] (i915#15102 [49]) +29 other
>    tests skip
>  *=20
>    igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-pri-indfb-draw-
>    blt:shard-glk10: NOTRUN -> SKIP [355] +136 other tests skip
>  *=20
>    igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-pri-shrfb-draw-mmap-
>    wc:shard-rkl: NOTRUN -> SKIP [354] (i915#1825 [57]) +3 other tests
>    skip
>  *=20
>    igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-spr-indfb-
>    fullscreen:shard-tglu: NOTRUN -> SKIP [353] +80 other tests skip
>  *=20
>    igt@kms_frontbuffer_tracking@fbcpsr-tiling-4:shard-rkl: NOTRUN ->
>    SKIP [352] (i915#5439 [351])
>  *=20
>    igt@kms_frontbuffer_tracking@fbcpsrhdr-1p-primscrn-pri-shrfb-draw-
>    mmap-cpu:shard-tglu-1: NOTRUN -> SKIP [350] (i915#15102 [49]) +24
>    other tests skip
>  *=20
>    igt@kms_frontbuffer_tracking@fbcpsrhdr-2p-primscrn-cur-indfb-draw-
>    mmap-gtt:shard-dg1: NOTRUN -> SKIP [349] (i915#15990 [43]) +16 other
>    tests skip
>  *=20
>    igt@kms_frontbuffer_tracking@fbcpsrhdr-2p-scndscrn-pri-indfb-draw-
>    mmap-wc:shard-dg2: NOTRUN -> SKIP [348] (i915#15990 [43]) +4 other
>    tests skip
>  *=20
>    igt@kms_frontbuffer_tracking@hdr-1p-offscreen-pri-indfb-draw-
>    pwrite:shard-rkl: PASS [347] -> SKIP [346] (i915#15989 [195]) +14
>    other tests skip
>  *=20
>    igt@kms_frontbuffer_tracking@hdr-2p-rte:shard-tglu-1: NOTRUN -> SKIP
>    [345] +57 other tests skip
>  *=20
>    igt@kms_frontbuffer_tracking@hdr-modesetfrombusy:shard-dg1: NOTRUN -
>    > SKIP [344] (i915#15989 [195]) +11 other tests skip
>  *=20
>    igt@kms_frontbuffer_tracking@hdr-rgb101010-draw-pwrite:shard-tglu-1:
>    NOTRUN -> SKIP [343] (i915#15989 [195]) +17 other tests skip
>  *=20
>    igt@kms_frontbuffer_tracking@psr-1p-offscreen-pri-shrfb-draw-mmap-
>    gtt:shard-dg1: NOTRUN -> SKIP [342] (i915#15104 [44] / i915#15990
>    [43]) +1 other test skip
>  *=20
>    igt@kms_frontbuffer_tracking@psr-2p-scndscrn-pri-shrfb-draw-
>    blt:shard-dg2: NOTRUN -> SKIP [341] (i915#15991 [337] / i915#5354
>    [27]) +3 other tests skip
>  *=20
>    igt@kms_frontbuffer_tracking@psrhdr-1p-primscrn-spr-indfb-
>    move:shard-rkl: NOTRUN -> SKIP [340] (i915#15102 [49]) +29 other
>    tests skip
>  *=20
>    igt@kms_frontbuffer_tracking@psrhdr-2p-scndscrn-cur-indfb-
>    move:shard-rkl: NOTRUN -> SKIP [339] +58 other tests skip
>  *=20
>    igt@kms_frontbuffer_tracking@psrhdr-2p-scndscrn-shrfb-plflip-
>    blt:shard-dg2: NOTRUN -> SKIP [338] (i915#15991 [337]) +4 other
>    tests skip
>  *=20
>    igt@kms_frontbuffer_tracking@psrhdr-rgb565-draw-render:shard-dg1:
>    NOTRUN -> SKIP [336] (i915#15102 [49]) +29 other tests skip
>  *=20
>    igt@kms_hdr@bpc-switch:shard-rkl: PASS [334] -> SKIP [333]
>    (i915#16644 [331] / i915#3555 [1] / i915#8228 [330])shard-tglu:
>    NOTRUN -> SKIP [335] (i915#3555 [1] / i915#8228 [330])
>  *=20
>    igt@kms_hdr@static-toggle:shard-rkl: NOTRUN -> SKIP [332]
>    (i915#16644 [331] / i915#3555 [1] / i915#8228 [330]) +1 other test
>    skip
>  *=20
>    igt@kms_joiner@basic-big-joiner:shard-rkl: NOTRUN -> SKIP [327]
>    (i915#15460 [326])shard-dg1: NOTRUN -> SKIP [328] (i915#15460
>    [326])shard-tglu: NOTRUN -> SKIP [329] (i915#15460 [326])
>  *=20
>    igt@kms_joiner@basic-force-big-joiner:shard-dg1: NOTRUN -> SKIP
>    [325] (i915#15459 [39])
>  *=20
>    igt@kms_joiner@basic-force-ultra-joiner:shard-dg1: NOTRUN -> SKIP
>    [324] (i915#15458 [36])
>  *=20
>    igt@kms_joiner@invalid-modeset-ultra-joiner:shard-dg2: NOTRUN ->
>    SKIP [323] (i915#15458 [36])
>  *=20
>    igt@kms_panel_fitting@legacy:shard-rkl: NOTRUN -> SKIP [322]
>    (i915#6301 [321])
>  *=20
>    igt@kms_pipe_crc_basic@suspend-read-crc:shard-tglu-1: NOTRUN ->
>    ABORT [320] (i915#16866 [161]) +1 other test abort
>  *=20
>    igt@kms_pipe_stress@stress-xrgb8888-4tiled:shard-tglu: NOTRUN ->
>    SKIP [319] (i915#14712 [317])
>  *=20
>    igt@kms_pipe_stress@stress-xrgb8888-yftiled:shard-dg1: NOTRUN ->
>    SKIP [318] (i915#14712 [317])
>  *=20
>    igt@kms_plane@pixel-format-4-tiled-mtl-mc-ccs-modifier-source-
>    clamping:shard-tglu-1: NOTRUN -> SKIP [316] (i915#15709 [31]) +1
>    other test skip
>  *=20
>    igt@kms_plane@pixel-format-y-tiled-ccs-modifier:shard-dg1: NOTRUN ->
>    SKIP [315] (i915#15709 [31]) +3 other tests skip
>  *=20
>    igt@kms_plane@pixel-format-y-tiled-modifier@pipe-b-plane-7:shard-
>    dg1: NOTRUN -> SKIP [314] (i915#16386 [313]) +1 other test skip
>  *=20
>    igt@kms_plane@pixel-format-yf-tiled-ccs-modifier-source-
>    clamping:shard-dg2: NOTRUN -> SKIP [312] (i915#15709 [31])
>  *=20
>    igt@kms_plane@pixel-format-yf-tiled-modifier:shard-rkl: NOTRUN ->
>    SKIP [310] (i915#15709 [31]) +3 other tests skipshard-tglu: NOTRUN -
>    > SKIP [311] (i915#15709 [31]) +1 other test skip
>  *=20
>    igt@kms_plane@planar-pixel-format-settings@nv12-tile4-src-y:shard-
>    dg1: NOTRUN -> SKIP [309] (i915#16112 [308])
>  *=20
>    igt@kms_plane@plane-panning-bottom-right-suspend@pipe-a:shard-rkl:
>    NOTRUN -> INCOMPLETE [307] (i915#14412 [306]) +1 other test
>    incomplete
>  *=20
>    igt@kms_plane_alpha_blend@alpha-basic:shard-glk: NOTRUN -> FAIL
>    [305] (i915#12178 [304])
>  *=20
>    igt@kms_plane_alpha_blend@alpha-basic@pipe-a-hdmi-a-1:shard-glk:
>    NOTRUN -> FAIL [303] (i915#7862 [302]) +1 other test fail
>  *=20
>    igt@kms_plane_multiple@2x-tiling-4:shard-rkl: NOTRUN -> SKIP [301]
>    (i915#13958 [299]) +1 other test skip
>  *=20
>    igt@kms_plane_multiple@2x-tiling-x:shard-dg2: NOTRUN -> SKIP [300]
>    (i915#13958 [299])
>  *=20
>    igt@kms_plane_multiple@tiling-yf:shard-tglu: NOTRUN -> SKIP [298]
>    (i915#14259 [297])
>  *=20
>    igt@kms_pm_backlight@brightness-with-dpms:shard-dg2: NOTRUN -> SKIP
>    [296] (i915#12343 [28])
>  *=20
>    igt@kms_pm_backlight@fade-with-dpms:shard-tglu: NOTRUN -> SKIP [295]
>    (i915#12343 [28] / i915#9812 [294]) +1 other test skip
>  *=20
>    igt@kms_pm_backlight@fade-with-suspend:shard-rkl: NOTRUN -> SKIP
>    [293] (i915#12343 [28] / i915#5354 [27]) +1 other test skip
>  *=20
>    igt@kms_pm_dc@dc5-pageflip-negative:shard-tglu-1: NOTRUN -> SKIP
>    [292] (i915#9685 [291])
>  *=20
>    igt@kms_pm_dc@dc6-dpms:shard-tglu-1: NOTRUN -> FAIL [290]
>    (i915#16479 [289])
>  *=20
>    igt@kms_pm_dc@dc6-psr:shard-dg1: NOTRUN -> SKIP [288] (i915#15948
>    [22])
>  *=20
>    igt@kms_pm_lpsp@kms-lpsp:shard-dg1: NOTRUN -> SKIP [287] (i915#9340
>    [286])
>  *=20
>    igt@kms_pm_rpm@dpms-mode-unset-lpsp:shard-rkl: PASS [284] -> SKIP
>    [283] (i915#15073 [174])shard-dg1: NOTRUN -> SKIP [285] (i915#15073
>    [174])
>  *=20
>    igt@kms_pm_rpm@dpms-non-lpsp:shard-tglu: NOTRUN -> SKIP [282]
>    (i915#15073 [174])
>  *=20
>    igt@kms_pm_rpm@fences:shard-dg1: NOTRUN -> SKIP [281] (i915#4077
>    [280]) +8 other tests skip
>  *=20
>    igt@kms_pm_rpm@modeset-lpsp:shard-rkl: NOTRUN -> SKIP [279]
>    (i915#15073 [174])
>  *=20
>    igt@kms_pm_rpm@modeset-non-lpsp-stress:shard-dg2: PASS [277] -> SKIP
>    [276] (i915#15073 [174])shard-tglu-1: NOTRUN -> SKIP [278]
>    (i915#15073 [174])
>  *=20
>    igt@kms_psr2_sf@fbc-pr-cursor-plane-move-continuous-exceed-fully-
>    sf:shard-tglu-1: NOTRUN -> SKIP [275] (i915#11520 [14]) +3 other
>    tests skip
>  *=20
>    igt@kms_psr2_sf@fbc-pr-cursor-plane-move-continuous-exceed-sf:shard-
>    dg2: NOTRUN -> SKIP [274] (i915#11520 [14]) +1 other test skip
>  *=20
>    igt@kms_psr2_sf@fbc-pr-cursor-plane-update-sf:shard-tglu: NOTRUN ->
>    SKIP [273] (i915#11520 [14]) +4 other tests skip
>  *=20
>    igt@kms_psr2_sf@fbc-pr-overlay-plane-move-continuous-exceed-
>    sf:shard-glk: NOTRUN -> SKIP [272] (i915#11520 [14]) +9 other tests
>    skip
>  *=20
>    igt@kms_psr2_sf@fbc-pr-primary-plane-update-sf-dmg-area:shard-rkl:
>    NOTRUN -> SKIP [271] (i915#11520 [14]) +4 other tests skip
>  *=20
>    igt@kms_psr2_sf@fbc-psr2-cursor-plane-move-continuous-exceed-
>    sf:shard-dg1: NOTRUN -> SKIP [270] (i915#11520 [14]) +7 other tests
>    skip
>  *=20
>    igt@kms_psr2_sf@pr-cursor-plane-move-continuous-exceed-sf:shard-
>    glk10: NOTRUN -> SKIP [269] (i915#11520 [14]) +2 other tests skip
>  *=20
>    igt@kms_psr2_sf@psr2-overlay-plane-move-continuous-exceed-sf:shard-
>    glk11: NOTRUN -> SKIP [268] (i915#11520 [14]) +1 other test skip
>  *=20
>    igt@kms_psr2_su@frontbuffer-xrgb8888:shard-tglu-1: NOTRUN -> SKIP
>    [267] (i915#9683 [265])
>  *=20
>    igt@kms_psr2_su@page_flip-xrgb8888:shard-tglu: NOTRUN -> SKIP [266]
>    (i915#9683 [265])
>  *=20
>    igt@kms_psr@fbc-pr-cursor-blt:shard-tglu: NOTRUN -> SKIP [264]
>    (i915#9732 [8]) +13 other tests skip
>  *=20
>    igt@kms_psr@fbc-pr-sprite-render:shard-tglu-1: NOTRUN -> SKIP [263]
>    (i915#9732 [8]) +10 other tests skip
>  *=20
>    igt@kms_psr@fbc-psr2-cursor-blt:shard-dg1: NOTRUN -> SKIP [262]
>    (i915#1072 [9] / i915#9732 [8]) +13 other tests skip
>  *=20
>    igt@kms_psr@pr-primary-blt:shard-dg2: NOTRUN -> SKIP [261]
>    (i915#1072 [9] / i915#9732 [8]) +5 other tests skip
>  *=20
>    igt@kms_psr@psr-sprite-plane-move:shard-rkl: NOTRUN -> SKIP [260]
>    (i915#1072 [9] / i915#9732 [8]) +16 other tests skip
>  *=20
>    igt@kms_psr_stress_test@invalidate-primary-flip-overlay:shard-dg1:
>    NOTRUN -> SKIP [258] (i915#15949 [257])shard-tglu: NOTRUN -> SKIP
>    [259] (i915#15949 [257])
>  *=20
>    igt@kms_rotation_crc@primary-4-tiled-reflect-x-0:shard-tglu: NOTRUN
>    -> SKIP [256] (i915#5289 [5])
>  *=20
>    igt@kms_rotation_crc@primary-yf-tiled-reflect-x-270:shard-dg1:
>    NOTRUN -> SKIP [255] (i915#5289 [5])
>  *=20
>    igt@kms_rotation_crc@primary-yf-tiled-reflect-x-90:shard-tglu-1:
>    NOTRUN -> SKIP [254] (i915#5289 [5])
>  *=20
>    igt@kms_tiled_display@basic-test-pattern:shard-glk: NOTRUN -> FAIL
>    [253] (i915#10959 [252])
>  *=20
>    igt@kms_vblank@ts-continuation-suspend:shard-glk: NOTRUN ->
>    INCOMPLETE [251] (i915#12276 [250]) +1 other test incomplete
>  *=20
>    igt@kms_vrr@max-min:shard-dg2: NOTRUN -> SKIP [249] (i915#9906
>    [247])
>  *=20
>    igt@kms_vrr@seamless-rr-switch-vrr:shard-rkl: NOTRUN -> SKIP [248]
>    (i915#9906 [247])
>  *=20
>    igt@perf@per-context-mode-unprivileged:shard-rkl: NOTRUN -> SKIP
>    [246] (i915#2435 [245])
>  *=20
>    igt@perf_pmu@busy-double-start:shard-mtlp: PASS [244] -> FAIL [243]
>    (i915#4349 [168]) +2 other tests fail
>  *=20
>    igt@perf_pmu@rc6@other-idle-gt0:shard-tglu-1: NOTRUN -> SKIP [242]
>    (i915#8516 [241])
>  *=20
>    igt@prime_udl@share-import:shard-tglu-1: NOTRUN -> SKIP [240]
>    (i915#16420 [238])
>  *=20
>    igt@prime_udl@share-import-addfb:shard-tglu: NOTRUN -> SKIP [239]
>    (i915#16420 [238])
>  *=20
>    igt@prime_vgem@basic-write:shard-rkl: NOTRUN -> SKIP [237]
>    (i915#3291 [236] / i915#3708 [234])
>  *=20
>    igt@prime_vgem@fence-read-hang:shard-dg1: NOTRUN -> SKIP [235]
>    (i915#3708 [234]) +1 other test skip
>  *=20
>    igt@tools_test@sysfs_l3_parity:shard-dg1: NOTRUN -> SKIP [233]
>    (i915#4818 [232])
> Possible fixes *=20
>    igt@gem_eio@hibernate:shard-rkl: ABORT [231] (i915#7975 [230]) ->
>    PASS [229]
>  *=20
>    igt@gem_eio@in-flight-suspend:shard-dg2: ABORT [228] (i915#16784
>    [227]) -> PASS [226]
>  *=20
>    igt@gem_workarounds@suspend-resume-fd:shard-rkl: INCOMPLETE [225]
>    (i915#13356 [224]) -> PASS [223]
>  *=20
>    igt@i915_suspend@fence-restore-untiled:shard-glk: INCOMPLETE [222]
>    (i915#16182 [221] / i915#4817 [218]) -> PASS [220]
>  *=20
>    igt@i915_suspend@sysfs-reader:shard-rkl: INCOMPLETE [219] (i915#4817
>    [218]) -> PASS [217]
>  *=20
>    igt@kms_flip@dpms-vs-vblank-race-interruptible@d-hdmi-a1:shard-tglu:
>    ABORT [216] (i915#16866 [161] / i915#16876 [208]) -> PASS [215]
>  *=20
>    igt@kms_flip@flip-vs-blocking-wf-vblank@a-hdmi-a3:shard-dg2: FAIL
>    [214] (i915#10826 [213]) -> PASS [212] +1 other test pass
>  *=20
>    igt@kms_flip@flip-vs-blocking-wf-vblank@a-hdmi-a4:shard-dg1: FAIL
>    [211] (i915#14600 [198]) -> PASS [210]
>  *=20
>    igt@kms_flip@flip-vs-dpms-off-vs-modeset-interruptible@d-hdmi-
>    a1:shard-tglu: ABORT [209] (i915#16876 [208]) -> PASS [207] +2 other
>    tests pass
>  *=20
>    igt@kms_flip@flip-vs-expired-vblank:shard-glk: FAIL [206]
>    (i915#13027 [201]) -> PASS [205] +1 other test pass
>  *=20
>    igt@kms_flip@flip-vs-expired-vblank-interruptible:shard-tglu: FAIL
>    [204] (i915#13027 [201]) -> PASS [203] +1 other test pass
>  *=20
>    igt@kms_flip@flip-vs-expired-vblank-interruptible@b-hdmi-a1:shard-
>    glk11: FAIL [202] (i915#13027 [201]) -> PASS [200]
>  *=20
>    igt@kms_flip@wf_vblank-ts-check:shard-tglu: FAIL [199] (i915#14600
>    [198]) -> PASS [197] +1 other test pass
>  *=20
>    igt@kms_frontbuffer_tracking@hdr-1p-primscrn-pri-shrfb-draw-mmap-
>    wc:shard-rkl: SKIP [196] (i915#15989 [195]) -> PASS [194] +4 other
>    tests pass
>  *=20
>    igt@kms_frontbuffer_tracking@hdr-2p-scndscrn-pri-indfb-draw-mmap-
>    cpu:shard-glk: SKIP [193] -> PASS [192] +2 other tests pass
>  *=20
>    igt@kms_pipe_crc_basic@suspend-read-crc:shard-rkl: INCOMPLETE [191]
>    (i915#12756 [190] / i915#13476 [187]) -> PASS [189]
>  *=20
>    igt@kms_pipe_crc_basic@suspend-read-crc@pipe-a-hdmi-a-2:shard-rkl:
>    INCOMPLETE [188] (i915#13476 [187]) -> PASS [186]
>  *=20
>    igt@kms_plane_cursor@viewport@pipe-a-hdmi-a-2-size-256:shard-rkl:
>    FAIL [185] (i915#15913 [184]) -> PASS [183] +1 other test pass
>  *=20
>    igt@kms_plane_cursor@viewport@pipe-a-hdmi-a-2-size-64:shard-rkl:
>    FAIL [182] (i915#15912 [181]) -> PASS [180] +1 other test pass
>  *=20
>    igt@kms_pm_rpm@dpms-lpsp:shard-rkl: SKIP [177] (i915#15073 [174]) ->
>    PASS [176] +1 other test passshard-dg1: SKIP [179] (i915#15073
>    [174]) -> PASS [178]
>  *=20
>    igt@kms_pm_rpm@modeset-non-lpsp-stress-no-wait:shard-dg2: SKIP [175]
>    (i915#15073 [174]) -> PASS [173] +2 other tests pass
>  *=20
>    igt@kms_pm_rpm@system-suspend-idle:shard-dg2: INCOMPLETE [172]
>    (i915#14419 [171]) -> PASS [170]
>  *=20
>    igt@perf_pmu@busy-double-start@vecs1:shard-dg2: FAIL [169]
>    (i915#4349 [168]) -> PASS [167] +4 other tests pass
> Warnings *=20
>    igt@gem_ccs@block-multicopy-inplace:shard-rkl: SKIP [166] (i915#3555
>    [1] / i915#9323 [164]) -> SKIP [165] (i915#14544 [2] / i915#3555 [1]
>    / i915#9323 [164])
>  *=20
>    igt@gem_eio@kms:shard-rkl: ABORT [160] (i915#16837 [158]) -> ABORT
>    [159] (i915#16837 [158] / i915#16931 [157])shard-tglu: ABORT [163]
>    (i915#16837 [158]) -> ABORT [162] (i915#16837 [158] / i915#16866
>    [161])
>  *=20
>    igt@gem_exec_balancer@parallel-bb-first:shard-rkl: SKIP [156]
>    (i915#4525 [154]) -> SKIP [155] (i915#14544 [2] / i915#4525 [154])
>    +1 other test skip
>  *=20
>    igt@gem_exec_capture@capture-recoverable:shard-rkl: SKIP [153]
>    (i915#14544 [2] / i915#6344 [151]) -> SKIP [152] (i915#6344 [151])
>  *=20
>    igt@gem_exec_reloc@basic-wc-gtt:shard-rkl: SKIP [150] (i915#3281
>    [146]) -> SKIP [149] (i915#14544 [2] / i915#3281 [146]) +2 other
>    tests skip
>  *=20
>    igt@gem_exec_reloc@basic-write-read-active:shard-rkl: SKIP [148]
>    (i915#14544 [2] / i915#3281 [146]) -> SKIP [147] (i915#3281 [146])
>  *=20
>    igt@gem_exec_schedule@semaphore-power:shard-rkl: SKIP [145]
>    (i915#7276 [143]) -> SKIP [144] (i915#14544 [2] / i915#7276 [143])
>  *=20
>    igt@gem_lmem_swapping@parallel-multi:shard-rkl: SKIP [142]
>    (i915#4613 [138]) -> SKIP [141] (i915#14544 [2] / i915#4613 [138])
>    +1 other test skip
>  *=20
>    igt@gem_lmem_swapping@parallel-random-verify:shard-rkl: SKIP [140]
>    (i915#14544 [2] / i915#4613 [138]) -> SKIP [139] (i915#4613 [138])
>    +1 other test skip
>  *=20
>    igt@gem_tiled_partial_pwrite_pread@reads:shard-rkl: SKIP [137]
>    (i915#3282 [135]) -> SKIP [136] (i915#14544 [2] / i915#3282 [135])
>    +3 other tests skip
>  *=20
>    igt@gen9_exec_parse@allowed-all:shard-rkl: SKIP [134] (i915#2527
>    [130]) -> SKIP [133] (i915#14544 [2] / i915#2527 [130])
>  *=20
>    igt@gen9_exec_parse@unaligned-jump:shard-rkl: SKIP [132] (i915#14544
>    [2] / i915#2527 [130]) -> SKIP [131] (i915#2527 [130]) +1 other test
>    skip
>  *=20
>    igt@i915_module_load@resize-bar:shard-rkl: SKIP [129] (i915#6412
>    [127]) -> SKIP [128] (i915#14544 [2] / i915#6412 [127])
>  *=20
>    igt@i915_pm_freq_mult@media-freq@gt0:shard-rkl: SKIP [126]
>    (i915#6590 [124]) -> SKIP [125] (i915#14544 [2] / i915#6590 [124])
>    +1 other test skip
>  *=20
>    igt@intel_hwmon@hwmon-read:shard-rkl: SKIP [123] (i915#7707 [121]) -
>    > SKIP [122] (i915#14544 [2] / i915#7707 [121])
>  *=20
>    igt@kms_big_fb@4-tiled-max-hw-stride-32bpp-rotate-0-hflip:shard-rkl:
>    SKIP [120] (i915#5286 [116]) -> SKIP [119] (i915#14544 [2] /
>    i915#5286 [116]) +1 other test skip
>  *=20
>    igt@kms_big_fb@4-tiled-max-hw-stride-32bpp-rotate-0-hflip-async-
>    flip:shard-rkl: SKIP [118] (i915#14544 [2] / i915#5286 [116]) ->
>    SKIP [117] (i915#5286 [116])
>  *=20
>    igt@kms_big_fb@x-tiled-32bpp-rotate-270:shard-rkl: SKIP [115]
>    (i915#3638 [111]) -> SKIP [114] (i915#14544 [2] / i915#3638 [111])
>    +1 other test skip
>  *=20
>    igt@kms_big_fb@y-tiled-8bpp-rotate-90:shard-rkl: SKIP [113]
>    (i915#14544 [2] / i915#3638 [111]) -> SKIP [112] (i915#3638 [111])
>    +1 other test skip
>  *=20
>    igt@kms_big_fb@yf-tiled-16bpp-rotate-270:shard-rkl: SKIP [110]
>    (i915#14544 [2]) -> SKIP [109] +28 other tests skip
>  *=20
>    igt@kms_ccs@bad-pixel-format-4-tiled-mtl-mc-ccs:shard-rkl: SKIP
>    [108] (i915#14098 [100] / i915#6095 [99]) -> SKIP [107] (i915#14098
>    [100] / i915#14544 [2] / i915#6095 [99]) +3 other tests skip
>  *=20
>    igt@kms_ccs@bad-pixel-format-4-tiled-mtl-mc-ccs@pipe-b-hdmi-a-
>    2:shard-rkl: SKIP [106] (i915#6095 [99]) -> SKIP [105] (i915#14544
>    [2] / i915#6095 [99]) +3 other tests skip
>  *=20
>    igt@kms_ccs@bad-rotation-90-4-tiled-mtl-mc-ccs@pipe-b-hdmi-a-
>    2:shard-rkl: SKIP [104] (i915#14544 [2] / i915#6095 [99]) -> SKIP
>    [103] (i915#6095 [99]) +6 other tests skip
>  *=20
>    igt@kms_ccs@crc-primary-suspend-4-tiled-dg2-rc-ccs@pipe-c-hdmi-a-
>    2:shard-rkl: SKIP [102] (i915#14098 [100] / i915#14544 [2] /
>    i915#6095 [99]) -> SKIP [101] (i915#14098 [100] / i915#6095 [99]) +7
>    other tests skip
>  *=20
>    igt@kms_cdclk@mode-transition-all-outputs:shard-rkl: SKIP [98]
>    (i915#3742 [96]) -> SKIP [97] (i915#14544 [2] / i915#3742 [96])
>  *=20
>    igt@kms_chamelium_color@ctm-green-to-red:shard-dg1: SKIP [95] ->
>    SKIP [94] (i915#4423 [42])
>  *=20
>    igt@kms_chamelium_edid@hdmi-edid-stress-resolution-non-4k:shard-rkl:
>    SKIP [93] (i915#11151 [89] / i915#14544 [2] / i915#7828 [88]) ->
>    SKIP [92] (i915#11151 [89] / i915#7828 [88]) +2 other tests skip
>  *=20
>    igt@kms_chamelium_frames@hdmi-crc-nonplanar-formats:shard-rkl: SKIP
>    [91] (i915#11151 [89] / i915#7828 [88]) -> SKIP [90] (i915#11151
>    [89] / i915#14544 [2] / i915#7828 [88])
>  *=20
>    igt@kms_content_protection@dp-mst-type-0-hdcp14:shard-rkl: SKIP [87]
>    (i915#15330 [85]) -> SKIP [86] (i915#14544 [2] / i915#15330 [85]) +1
>    other test skip
>  *=20
>    igt@kms_content_protection@mei-interface:shard-rkl: SKIP [84]
>    (i915#15865 [82]) -> SKIP [83] (i915#14544 [2] / i915#15865 [82]) +1
>    other test skip
>  *=20
>    igt@kms_cursor_crc@cursor-offscreen-512x170:shard-rkl: SKIP [81]
>    (i915#13049 [79] / i915#14544 [2]) -> SKIP [80] (i915#13049 [79])
>  *=20
>    igt@kms_cursor_crc@cursor-random-32x32:shard-rkl: SKIP [78]
>    (i915#14544 [2] / i915#3555 [1]) -> SKIP [77] (i915#3555 [1])
>  *=20
>    igt@kms_dsc@dsc-with-bpc:shard-rkl: SKIP [76] (i915#14544 [2] /
>    i915#16361 [72]) -> SKIP [75] (i915#16361 [72])
>  *=20
>    igt@kms_dsc@dsc-with-output-formats-with-bpc-bigjoiner:shard-rkl:
>    SKIP [74] (i915#16361 [72]) -> SKIP [73] (i915#14544 [2] /
>    i915#16361 [72]) +1 other test skip
>  *=20
>    igt@kms_flip@2x-flip-vs-fences-interruptible:shard-rkl: SKIP [71]
>    (i915#14544 [2] / i915#9934 [67]) -> SKIP [70] (i915#9934 [67])
>  *=20
>    igt@kms_flip@2x-nonexisting-fb-interruptible:shard-rkl: SKIP [69]
>    (i915#9934 [67]) -> SKIP [68] (i915#14544 [2] / i915#9934 [67])
>  *=20
>    igt@kms_flip_scaled_crc@flip-32bpp-4tile-to-64bpp-4tile-
>    downscaling:shard-rkl: SKIP [66] (i915#15643 [62]) -> SKIP [65]
>    (i915#14544 [2] / i915#15643 [62])
>  *=20
>    igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-16bpp-yftile-
>    upscaling:shard-rkl: SKIP [64] (i915#14544 [2] / i915#15643 [62]) ->
>    SKIP [63] (i915#15643 [62]) +2 other tests skip
>  *=20
>    igt@kms_frontbuffer_tracking@fbc-2p-primscrn-pri-shrfb-draw-mmap-
>    gtt:shard-rkl: SKIP [61] (i915#1825 [57]) -> SKIP [60] (i915#14544
>    [2] / i915#1825 [57])
>  *=20
>    igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-pri-indfb-draw-mmap-
>    wc:shard-rkl: SKIP [59] (i915#14544 [2] / i915#1825 [57]) -> SKIP
>    [58] (i915#1825 [57]) +2 other tests skip
>  *=20
>    igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-cur-indfb-draw-mmap-
>    wc:shard-dg1: SKIP [56] (i915#15990 [43] / i915#4423 [42] /
>    i915#8708 [54]) -> SKIP [55] (i915#15990 [43] / i915#8708 [54])
>  *=20
>    igt@kms_frontbuffer_tracking@fbcpsr-rgb101010-draw-mmap-wc:shard-
>    rkl: SKIP [53] (i915#15102 [49]) -> SKIP [52] (i915#14544 [2] /
>    i915#15102 [49]) +16 other tests skip
>  *=20
>    igt@kms_frontbuffer_tracking@fbcpsrhdr-1p-primscrn-spr-indfb-draw-
>    blt:shard-rkl: SKIP [51] (i915#14544 [2] / i915#15102 [49]) -> SKIP
>    [50] (i915#15102 [49]) +13 other tests skip
>  *=20
>    igt@kms_frontbuffer_tracking@fbcpsrhdr-2p-scndscrn-shrfb-plflip-
>    blt:shard-rkl: SKIP [48] -> SKIP [47] (i915#14544 [2]) +28 other
>    tests skip
>  *=20
>    igt@kms_frontbuffer_tracking@psr-1p-offscreen-pri-indfb-draw-mmap-
>    gtt:shard-dg1: SKIP [46] (i915#15104 [44] / i915#15990 [43]) -> SKIP
>    [45] (i915#15104 [44] / i915#15990 [43] / i915#4423 [42])
>  *=20
>    igt@kms_joiner@basic-force-big-joiner:shard-rkl: SKIP [41]
>    (i915#14544 [2] / i915#15459 [39]) -> SKIP [40] (i915#15459 [39])
>  *=20
>    igt@kms_joiner@basic-ultra-joiner:shard-rkl: SKIP [38] (i915#15458
>    [36]) -> SKIP [37] (i915#14544 [2] / i915#15458 [36])
>  *=20
>    igt@kms_plane@pixel-format-4-tiled-mtl-mc-ccs-modifier:shard-rkl:
>    SKIP [35] (i915#15709 [31]) -> SKIP [34] (i915#14544 [2] /
>    i915#15709 [31]) +1 other test skip
>  *=20
>    igt@kms_plane@pixel-format-y-tiled-ccs-modifier:shard-rkl: SKIP [33]
>    (i915#14544 [2] / i915#15709 [31]) -> SKIP [32] (i915#15709 [31]) +1
>    other test skip
>  *=20
>    igt@kms_pm_backlight@bad-brightness:shard-rkl: SKIP [30] (i915#12343
>    [28] / i915#5354 [27]) -> SKIP [29] (i915#12343 [28] / i915#14544
>    [2] / i915#5354 [27])
>  *=20
>    igt@kms_pm_dc@dc5-psr:shard-rkl: SKIP [26] (i915#15948 [22]) -> SKIP
>    [25] (i915#14544 [2] / i915#15948 [22])
>  *=20
>    igt@kms_pm_dc@dc6-psr:shard-rkl: SKIP [24] (i915#14544 [2] /
>    i915#15948 [22]) -> SKIP [23] (i915#15948 [22])
>  *=20
>    igt@kms_prime@d3hot:shard-rkl: SKIP [21] (i915#6524 [19]) -> SKIP
>    [20] (i915#14544 [2] / i915#6524 [19])
>  *=20
>    igt@kms_psr2_sf@psr2-cursor-plane-update-sf:shard-rkl: SKIP [18]
>    (i915#11520 [14]) -> SKIP [17] (i915#11520 [14] / i915#14544 [2]) +1
>    other test skip
>  *=20
>    igt@kms_psr2_sf@psr2-overlay-plane-move-continuous-exceed-sf:shard-
>    rkl: SKIP [16] (i915#11520 [14] / i915#14544 [2]) -> SKIP [15]
>    (i915#11520 [14]) +1 other test skip
>  *=20
>    igt@kms_psr@pr-no-drrs:shard-rkl: SKIP [13] (i915#1072 [9] /
>    i915#14544 [2] / i915#9732 [8]) -> SKIP [12] (i915#1072 [9] /
>    i915#9732 [8]) +5 other tests skip
>  *=20
>    igt@kms_psr@psr-suspend:shard-rkl: SKIP [11] (i915#1072 [9] /
>    i915#9732 [8]) -> SKIP [10] (i915#1072 [9] / i915#14544 [2] /
>    i915#9732 [8]) +4 other tests skip
>  *=20
>    igt@kms_rotation_crc@primary-yf-tiled-reflect-x-270:shard-rkl: SKIP
>    [7] (i915#14544 [2] / i915#5289 [5]) -> SKIP [6] (i915#5289 [5]) +1
>    other test skip
>  *=20
>    igt@kms_setmode@basic-clone-single-crtc:shard-rkl: SKIP [4]
>    (i915#3555 [1]) -> SKIP [3] (i915#14544 [2] / i915#3555 [1]) +1
>    other test skip
> Piglit changes{name}: This element is suppressed. This means it is ignore=
d when
> computing
> the status of the difference (SUCCESS, WARNING, or FAILURE).
> Build changes * Linux: CI_DRM_19102 -> Patchwork_169493v4
> CI-20190529: 20190529
> CI_DRM_19102: 06602b51786b6c2a0f97e58f0e0f168be1ada27e @
> git://anongit.freedesktop.org/gfx-ci/linux
> IGT_9085: 9085
> Patchwork_169493v4: 06602b51786b6c2a0f97e58f0e0f168be1ada27e @
> git://anongit.freedesktop.org/gfx-ci/linux
> piglit_4509: fdc5a4ca11124ab8413c7988896eec4c97336694 @
> git://anongit.freedesktop.org/piglit


[1] i915#3555
    https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3555
[2] i915#14544
    https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544
[3] SKIP
    https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_169493v4/shard-rkl-6=
/igt@kms_setmode@basic-clone-single-crtc.html
[4] SKIP
    https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19102/shard-rkl-4/igt@k=
ms_setmode@basic-clone-single-crtc.html
[5] i915#5289
    https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5289
[6] SKIP
    https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_169493v4/shard-rkl-4=
/igt@kms_rotation_crc@primary-yf-tiled-reflect-x-270.html
[7] SKIP
    https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19102/shard-rkl-6/igt@k=
ms_rotation_crc@primary-yf-tiled-reflect-x-270.html
[8] i915#9732
    https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9732
[9] i915#1072
    https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/1072
[10] SKIP
     https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_169493v4/shard-rkl-=
6/igt@kms_psr@psr-suspend.html
[11] SKIP
     https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19102/shard-rkl-4/igt@=
kms_psr@psr-suspend.html
[12] SKIP
     https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_169493v4/shard-rkl-=
4/igt@kms_psr@pr-no-drrs.html
[13] SKIP
     https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19102/shard-rkl-6/igt@=
kms_psr@pr-no-drrs.html
[14] i915#11520
     https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11520
[15] SKIP
     https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_169493v4/shard-rkl-=
4/igt@kms_psr2_sf@psr2-overlay-plane-move-continuous-exceed-sf.html
[16] SKIP
     https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19102/shard-rkl-6/igt@=
kms_psr2_sf@psr2-overlay-plane-move-continuous-exceed-sf.html
[17] SKIP
     https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_169493v4/shard-rkl-=
6/igt@kms_psr2_sf@psr2-cursor-plane-update-sf.html
[18] SKIP
     https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19102/shard-rkl-3/igt@=
kms_psr2_sf@psr2-cursor-plane-update-sf.html
[19] i915#6524
     https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6524
[20] SKIP
     https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_169493v4/shard-rkl-=
6/igt@kms_prime@d3hot.html
[21] SKIP
     https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19102/shard-rkl-4/igt@=
kms_prime@d3hot.html
[22] i915#15948
     https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15948
[23] SKIP
     https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_169493v4/shard-rkl-=
4/igt@kms_pm_dc@dc6-psr.html
[24] SKIP
     https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19102/shard-rkl-6/igt@=
kms_pm_dc@dc6-psr.html
[25] SKIP
     https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_169493v4/shard-rkl-=
6/igt@kms_pm_dc@dc5-psr.html
[26] SKIP
     https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19102/shard-rkl-3/igt@=
kms_pm_dc@dc5-psr.html
[27] i915#5354
     https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5354
[28] i915#12343
     https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12343
[29] SKIP
     https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_169493v4/shard-rkl-=
6/igt@kms_pm_backlight@bad-brightness.html
[30] SKIP
     https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19102/shard-rkl-4/igt@=
kms_pm_backlight@bad-brightness.html
[31] i915#15709
     https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15709
[32] SKIP
     https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_169493v4/shard-rkl-=
4/igt@kms_plane@pixel-format-y-tiled-ccs-modifier.html
[33] SKIP
     https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19102/shard-rkl-6/igt@=
kms_plane@pixel-format-y-tiled-ccs-modifier.html
[34] SKIP
     https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_169493v4/shard-rkl-=
6/igt@kms_plane@pixel-format-4-tiled-mtl-mc-ccs-modifier.html
[35] SKIP
     https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19102/shard-rkl-4/igt@=
kms_plane@pixel-format-4-tiled-mtl-mc-ccs-modifier.html
[36] i915#15458
     https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15458
[37] SKIP
     https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_169493v4/shard-rkl-=
6/igt@kms_joiner@basic-ultra-joiner.html
[38] SKIP
     https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19102/shard-rkl-3/igt@=
kms_joiner@basic-ultra-joiner.html
[39] i915#15459
     https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15459
[40] SKIP
     https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_169493v4/shard-rkl-=
4/igt@kms_joiner@basic-force-big-joiner.html
[41] SKIP
     https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19102/shard-rkl-6/igt@=
kms_joiner@basic-force-big-joiner.html
[42] i915#4423
     https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4423
[43] i915#15990
     https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15990
[44] i915#15104
     https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15104
[45] SKIP
     https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_169493v4/shard-dg1-=
17/igt@kms_frontbuffer_tracking@psr-1p-offscreen-pri-indfb-draw-mmap-gtt.ht=
ml
[46] SKIP
     https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19102/shard-dg1-14/igt=
@kms_frontbuffer_tracking@psr-1p-offscreen-pri-indfb-draw-mmap-gtt.html
[47] SKIP
     https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_169493v4/shard-rkl-=
6/igt@kms_frontbuffer_tracking@fbcpsrhdr-2p-scndscrn-shrfb-plflip-blt.html
[48] SKIP
     https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19102/shard-rkl-4/igt@=
kms_frontbuffer_tracking@fbcpsrhdr-2p-scndscrn-shrfb-plflip-blt.html
[49] i915#15102
     https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15102
[50] SKIP
     https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_169493v4/shard-rkl-=
3/igt@kms_frontbuffer_tracking@fbcpsrhdr-1p-primscrn-spr-indfb-draw-blt.htm=
l
[51] SKIP
     https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19102/shard-rkl-6/igt@=
kms_frontbuffer_tracking@fbcpsrhdr-1p-primscrn-spr-indfb-draw-blt.html
[52] SKIP
     https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_169493v4/shard-rkl-=
6/igt@kms_frontbuffer_tracking@fbcpsr-rgb101010-draw-mmap-wc.html
[53] SKIP
     https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19102/shard-rkl-3/igt@=
kms_frontbuffer_tracking@fbcpsr-rgb101010-draw-mmap-wc.html
[54] i915#8708
     https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8708
[55] SKIP
     https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_169493v4/shard-dg1-=
12/igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-cur-indfb-draw-mmap-wc.h=
tml
[56] SKIP
     https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19102/shard-dg1-19/igt=
@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-cur-indfb-draw-mmap-wc.html
[57] i915#1825
     https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/1825
[58] SKIP
     https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_169493v4/shard-rkl-=
4/igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-pri-indfb-draw-mmap-wc.ht=
ml
[59] SKIP
     https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19102/shard-rkl-6/igt@=
kms_frontbuffer_tracking@fbcpsr-2p-primscrn-pri-indfb-draw-mmap-wc.html
[60] SKIP
     https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_169493v4/shard-rkl-=
6/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-pri-shrfb-draw-mmap-gtt.html
[61] SKIP
     https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19102/shard-rkl-3/igt@=
kms_frontbuffer_tracking@fbc-2p-primscrn-pri-shrfb-draw-mmap-gtt.html
[62] i915#15643
     https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15643
[63] SKIP
     https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_169493v4/shard-rkl-=
4/igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-16bpp-yftile-upscaling.html
[64] SKIP
     https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19102/shard-rkl-6/igt@=
kms_flip_scaled_crc@flip-64bpp-yftile-to-16bpp-yftile-upscaling.html
[65] SKIP
     https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_169493v4/shard-rkl-=
6/igt@kms_flip_scaled_crc@flip-32bpp-4tile-to-64bpp-4tile-downscaling.html
[66] SKIP
     https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19102/shard-rkl-4/igt@=
kms_flip_scaled_crc@flip-32bpp-4tile-to-64bpp-4tile-downscaling.html
[67] i915#9934
     https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9934
[68] SKIP
     https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_169493v4/shard-rkl-=
6/igt@kms_flip@2x-nonexisting-fb-interruptible.html
[69] SKIP
     https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19102/shard-rkl-4/igt@=
kms_flip@2x-nonexisting-fb-interruptible.html
[70] SKIP
     https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_169493v4/shard-rkl-=
4/igt@kms_flip@2x-flip-vs-fences-interruptible.html
[71] SKIP
     https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19102/shard-rkl-6/igt@=
kms_flip@2x-flip-vs-fences-interruptible.html
[72] i915#16361
     https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16361
[73] SKIP
     https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_169493v4/shard-rkl-=
6/igt@kms_dsc@dsc-with-output-formats-with-bpc-bigjoiner.html
[74] SKIP
     https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19102/shard-rkl-4/igt@=
kms_dsc@dsc-with-output-formats-with-bpc-bigjoiner.html
[75] SKIP
     https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_169493v4/shard-rkl-=
4/igt@kms_dsc@dsc-with-bpc.html
[76] SKIP
     https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19102/shard-rkl-6/igt@=
kms_dsc@dsc-with-bpc.html
[77] SKIP
     https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_169493v4/shard-rkl-=
3/igt@kms_cursor_crc@cursor-random-32x32.html
[78] SKIP
     https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19102/shard-rkl-6/igt@=
kms_cursor_crc@cursor-random-32x32.html
[79] i915#13049
     https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13049
[80] SKIP
     https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_169493v4/shard-rkl-=
4/igt@kms_cursor_crc@cursor-offscreen-512x170.html
[81] SKIP
     https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19102/shard-rkl-6/igt@=
kms_cursor_crc@cursor-offscreen-512x170.html
[82] i915#15865
     https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15865
[83] SKIP
     https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_169493v4/shard-rkl-=
6/igt@kms_content_protection@mei-interface.html
[84] SKIP
     https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19102/shard-rkl-4/igt@=
kms_content_protection@mei-interface.html
[85] i915#15330
     https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15330
[86] SKIP
     https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_169493v4/shard-rkl-=
6/igt@kms_content_protection@dp-mst-type-0-hdcp14.html
[87] SKIP
     https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19102/shard-rkl-3/igt@=
kms_content_protection@dp-mst-type-0-hdcp14.html
[88] i915#7828
     https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/7828
[89] i915#11151
     https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11151
[90] SKIP
     https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_169493v4/shard-rkl-=
6/igt@kms_chamelium_frames@hdmi-crc-nonplanar-formats.html
[91] SKIP
     https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19102/shard-rkl-3/igt@=
kms_chamelium_frames@hdmi-crc-nonplanar-formats.html
[92] SKIP
     https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_169493v4/shard-rkl-=
4/igt@kms_chamelium_edid@hdmi-edid-stress-resolution-non-4k.html
[93] SKIP
     https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19102/shard-rkl-6/igt@=
kms_chamelium_edid@hdmi-edid-stress-resolution-non-4k.html
[94] SKIP
     https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_169493v4/shard-dg1-=
19/igt@kms_chamelium_color@ctm-green-to-red.html
[95] SKIP
     https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19102/shard-dg1-17/igt=
@kms_chamelium_color@ctm-green-to-red.html
[96] i915#3742
     https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3742
[97] SKIP
     https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_169493v4/shard-rkl-=
6/igt@kms_cdclk@mode-transition-all-outputs.html
[98] SKIP
     https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19102/shard-rkl-4/igt@=
kms_cdclk@mode-transition-all-outputs.html
[99] i915#6095
     https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6095
[100] i915#14098
      https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14098
[101] SKIP
      https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_169493v4/shard-rkl=
-3/igt@kms_ccs@crc-primary-suspend-4-tiled-dg2-rc-ccs@pipe-c-hdmi-a-2.html
[102] SKIP
      https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19102/shard-rkl-6/igt=
@kms_ccs@crc-primary-suspend-4-tiled-dg2-rc-ccs@pipe-c-hdmi-a-2.html
[103] SKIP
      https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_169493v4/shard-rkl=
-4/igt@kms_ccs@bad-rotation-90-4-tiled-mtl-mc-ccs@pipe-b-hdmi-a-2.html
[104] SKIP
      https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19102/shard-rkl-6/igt=
@kms_ccs@bad-rotation-90-4-tiled-mtl-mc-ccs@pipe-b-hdmi-a-2.html
[105] SKIP
      https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_169493v4/shard-rkl=
-6/igt@kms_ccs@bad-pixel-format-4-tiled-mtl-mc-ccs@pipe-b-hdmi-a-2.html
[106] SKIP
      https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19102/shard-rkl-3/igt=
@kms_ccs@bad-pixel-format-4-tiled-mtl-mc-ccs@pipe-b-hdmi-a-2.html
[107] SKIP
      https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_169493v4/shard-rkl=
-6/igt@kms_ccs@bad-pixel-format-4-tiled-mtl-mc-ccs.html
[108] SKIP
      https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19102/shard-rkl-3/igt=
@kms_ccs@bad-pixel-format-4-tiled-mtl-mc-ccs.html
[109] SKIP
      https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_169493v4/shard-rkl=
-4/igt@kms_big_fb@yf-tiled-16bpp-rotate-270.html
[110] SKIP
      https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19102/shard-rkl-6/igt=
@kms_big_fb@yf-tiled-16bpp-rotate-270.html
[111] i915#3638
      https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3638
[112] SKIP
      https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_169493v4/shard-rkl=
-4/igt@kms_big_fb@y-tiled-8bpp-rotate-90.html
[113] SKIP
      https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19102/shard-rkl-6/igt=
@kms_big_fb@y-tiled-8bpp-rotate-90.html
[114] SKIP
      https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_169493v4/shard-rkl=
-6/igt@kms_big_fb@x-tiled-32bpp-rotate-270.html
[115] SKIP
      https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19102/shard-rkl-4/igt=
@kms_big_fb@x-tiled-32bpp-rotate-270.html
[116] i915#5286
      https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5286
[117] SKIP
      https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_169493v4/shard-rkl=
-4/igt@kms_big_fb@4-tiled-max-hw-stride-32bpp-rotate-0-hflip-async-flip.htm=
l
[118] SKIP
      https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19102/shard-rkl-6/igt=
@kms_big_fb@4-tiled-max-hw-stride-32bpp-rotate-0-hflip-async-flip.html
[119] SKIP
      https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_169493v4/shard-rkl=
-6/igt@kms_big_fb@4-tiled-max-hw-stride-32bpp-rotate-0-hflip.html
[120] SKIP
      https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19102/shard-rkl-3/igt=
@kms_big_fb@4-tiled-max-hw-stride-32bpp-rotate-0-hflip.html
[121] i915#7707
      https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/7707
[122] SKIP
      https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_169493v4/shard-rkl=
-6/igt@intel_hwmon@hwmon-read.html
[123] SKIP
      https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19102/shard-rkl-4/igt=
@intel_hwmon@hwmon-read.html
[124] i915#6590
      https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6590
[125] SKIP
      https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_169493v4/shard-rkl=
-6/igt@i915_pm_freq_mult@media-freq@gt0.html
[126] SKIP
      https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19102/shard-rkl-3/igt=
@i915_pm_freq_mult@media-freq@gt0.html
[127] i915#6412
      https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6412
[128] SKIP
      https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_169493v4/shard-rkl=
-6/igt@i915_module_load@resize-bar.html
[129] SKIP
      https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19102/shard-rkl-3/igt=
@i915_module_load@resize-bar.html
[130] i915#2527
      https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2527
[131] SKIP
      https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_169493v4/shard-rkl=
-4/igt@gen9_exec_parse@unaligned-jump.html
[132] SKIP
      https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19102/shard-rkl-6/igt=
@gen9_exec_parse@unaligned-jump.html
[133] SKIP
      https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_169493v4/shard-rkl=
-6/igt@gen9_exec_parse@allowed-all.html
[134] SKIP
      https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19102/shard-rkl-4/igt=
@gen9_exec_parse@allowed-all.html
[135] i915#3282
      https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3282
[136] SKIP
      https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_169493v4/shard-rkl=
-6/igt@gem_tiled_partial_pwrite_pread@reads.html
[137] SKIP
      https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19102/shard-rkl-4/igt=
@gem_tiled_partial_pwrite_pread@reads.html
[138] i915#4613
      https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4613
[139] SKIP
      https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_169493v4/shard-rkl=
-4/igt@gem_lmem_swapping@parallel-random-verify.html
[140] SKIP
      https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19102/shard-rkl-6/igt=
@gem_lmem_swapping@parallel-random-verify.html
[141] SKIP
      https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_169493v4/shard-rkl=
-6/igt@gem_lmem_swapping@parallel-multi.html
[142] SKIP
      https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19102/shard-rkl-3/igt=
@gem_lmem_swapping@parallel-multi.html
[143] i915#7276
      https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/7276
[144] SKIP
      https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_169493v4/shard-rkl=
-6/igt@gem_exec_schedule@semaphore-power.html
[145] SKIP
      https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19102/shard-rkl-4/igt=
@gem_exec_schedule@semaphore-power.html
[146] i915#3281
      https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3281
[147] SKIP
      https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_169493v4/shard-rkl=
-4/igt@gem_exec_reloc@basic-write-read-active.html
[148] SKIP
      https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19102/shard-rkl-6/igt=
@gem_exec_reloc@basic-write-read-active.html
[149] SKIP
      https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_169493v4/shard-rkl=
-6/igt@gem_exec_reloc@basic-wc-gtt.html
[150] SKIP
      https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19102/shard-rkl-4/igt=
@gem_exec_reloc@basic-wc-gtt.html
[151] i915#6344
      https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6344
[152] SKIP
      https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_169493v4/shard-rkl=
-4/igt@gem_exec_capture@capture-recoverable.html
[153] SKIP
      https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19102/shard-rkl-6/igt=
@gem_exec_capture@capture-recoverable.html
[154] i915#4525
      https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4525
[155] SKIP
      https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_169493v4/shard-rkl=
-6/igt@gem_exec_balancer@parallel-bb-first.html
[156] SKIP
      https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19102/shard-rkl-3/igt=
@gem_exec_balancer@parallel-bb-first.html
[157] i915#16931
      https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16931
[158] i915#16837
      https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16837
[159] ABORT
      https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_169493v4/shard-rkl=
-4/igt@gem_eio@kms.html
[160] ABORT
      https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19102/shard-rkl-3/igt=
@gem_eio@kms.html
[161] i915#16866
      https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16866
[162] ABORT
      https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_169493v4/shard-tgl=
u-3/igt@gem_eio@kms.html
[163] ABORT
      https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19102/shard-tglu-10/i=
gt@gem_eio@kms.html
[164] i915#9323
      https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9323
[165] SKIP
      https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_169493v4/shard-rkl=
-6/igt@gem_ccs@block-multicopy-inplace.html
[166] SKIP
      https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19102/shard-rkl-3/igt=
@gem_ccs@block-multicopy-inplace.html
[167] PASS
      https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_169493v4/shard-dg2=
-6/igt@perf_pmu@busy-double-start@vecs1.html
[168] i915#4349
      https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4349
[169] FAIL
      https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19102/shard-dg2-3/igt=
@perf_pmu@busy-double-start@vecs1.html
[170] PASS
      https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_169493v4/shard-dg2=
-1/igt@kms_pm_rpm@system-suspend-idle.html
[171] i915#14419
      https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14419
[172] INCOMPLETE
      https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19102/shard-dg2-7/igt=
@kms_pm_rpm@system-suspend-idle.html
[173] PASS
      https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_169493v4/shard-dg2=
-5/igt@kms_pm_rpm@modeset-non-lpsp-stress-no-wait.html
[174] i915#15073
      https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15073
[175] SKIP
      https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19102/shard-dg2-4/igt=
@kms_pm_rpm@modeset-non-lpsp-stress-no-wait.html
[176] PASS
      https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_169493v4/shard-rkl=
-2/igt@kms_pm_rpm@dpms-lpsp.html
[177] SKIP
      https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19102/shard-rkl-7/igt=
@kms_pm_rpm@dpms-lpsp.html
[178] PASS
      https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_169493v4/shard-dg1=
-15/igt@kms_pm_rpm@dpms-lpsp.html
[179] SKIP
      https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19102/shard-dg1-16/ig=
t@kms_pm_rpm@dpms-lpsp.html
[180] PASS
      https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_169493v4/shard-rkl=
-6/igt@kms_plane_cursor@viewport@pipe-a-hdmi-a-2-size-64.html
[181] i915#15912
      https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15912
[182] FAIL
      https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19102/shard-rkl-3/igt=
@kms_plane_cursor@viewport@pipe-a-hdmi-a-2-size-64.html
[183] PASS
      https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_169493v4/shard-rkl=
-6/igt@kms_plane_cursor@viewport@pipe-a-hdmi-a-2-size-256.html
[184] i915#15913
      https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15913
[185] FAIL
      https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19102/shard-rkl-3/igt=
@kms_plane_cursor@viewport@pipe-a-hdmi-a-2-size-256.html
[186] PASS
      https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_169493v4/shard-rkl=
-7/igt@kms_pipe_crc_basic@suspend-read-crc@pipe-a-hdmi-a-2.html
[187] i915#13476
      https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13476
[188] INCOMPLETE
      https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19102/shard-rkl-4/igt=
@kms_pipe_crc_basic@suspend-read-crc@pipe-a-hdmi-a-2.html
[189] PASS
      https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_169493v4/shard-rkl=
-7/igt@kms_pipe_crc_basic@suspend-read-crc.html
[190] i915#12756
      https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12756
[191] INCOMPLETE
      https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19102/shard-rkl-4/igt=
@kms_pipe_crc_basic@suspend-read-crc.html
[192] PASS
      https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_169493v4/shard-glk=
8/igt@kms_frontbuffer_tracking@hdr-2p-scndscrn-pri-indfb-draw-mmap-cpu.html
[193] SKIP
      https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19102/shard-glk4/igt@=
kms_frontbuffer_tracking@hdr-2p-scndscrn-pri-indfb-draw-mmap-cpu.html
[194] PASS
      https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_169493v4/shard-rkl=
-6/igt@kms_frontbuffer_tracking@hdr-1p-primscrn-pri-shrfb-draw-mmap-wc.html
[195] i915#15989
      https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15989
[196] SKIP
      https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19102/shard-rkl-3/igt=
@kms_frontbuffer_tracking@hdr-1p-primscrn-pri-shrfb-draw-mmap-wc.html
[197] PASS
      https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_169493v4/shard-tgl=
u-4/igt@kms_flip@wf_vblank-ts-check.html
[198] i915#14600
      https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14600
[199] FAIL
      https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19102/shard-tglu-5/ig=
t@kms_flip@wf_vblank-ts-check.html
[200] PASS
      https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_169493v4/shard-glk=
11/igt@kms_flip@flip-vs-expired-vblank-interruptible@b-hdmi-a1.html
[201] i915#13027
      https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13027
[202] FAIL
      https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19102/shard-glk11/igt=
@kms_flip@flip-vs-expired-vblank-interruptible@b-hdmi-a1.html
[203] PASS
      https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_169493v4/shard-tgl=
u-5/igt@kms_flip@flip-vs-expired-vblank-interruptible.html
[204] FAIL
      https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19102/shard-tglu-3/ig=
t@kms_flip@flip-vs-expired-vblank-interruptible.html
[205] PASS
      https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_169493v4/shard-glk=
4/igt@kms_flip@flip-vs-expired-vblank.html
[206] FAIL
      https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19102/shard-glk9/igt@=
kms_flip@flip-vs-expired-vblank.html
[207] PASS
      https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_169493v4/shard-tgl=
u-2/igt@kms_flip@flip-vs-dpms-off-vs-modeset-interruptible@d-hdmi-a1.html
[208] i915#16876
      https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16876
[209] ABORT
      https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19102/shard-tglu-8/ig=
t@kms_flip@flip-vs-dpms-off-vs-modeset-interruptible@d-hdmi-a1.html
[210] PASS
      https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_169493v4/shard-dg1=
-16/igt@kms_flip@flip-vs-blocking-wf-vblank@a-hdmi-a4.html
[211] FAIL
      https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19102/shard-dg1-19/ig=
t@kms_flip@flip-vs-blocking-wf-vblank@a-hdmi-a4.html
[212] PASS
      https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_169493v4/shard-dg2=
-6/igt@kms_flip@flip-vs-blocking-wf-vblank@a-hdmi-a3.html
[213] i915#10826
      https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/10826
[214] FAIL
      https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19102/shard-dg2-1/igt=
@kms_flip@flip-vs-blocking-wf-vblank@a-hdmi-a3.html
[215] PASS
      https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_169493v4/shard-tgl=
u-4/igt@kms_flip@dpms-vs-vblank-race-interruptible@d-hdmi-a1.html
[216] ABORT
      https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19102/shard-tglu-5/ig=
t@kms_flip@dpms-vs-vblank-race-interruptible@d-hdmi-a1.html
[217] PASS
      https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_169493v4/shard-rkl=
-4/igt@i915_suspend@sysfs-reader.html
[218] i915#4817
      https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4817
[219] INCOMPLETE
      https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19102/shard-rkl-6/igt=
@i915_suspend@sysfs-reader.html
[220] PASS
      https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_169493v4/shard-glk=
4/igt@i915_suspend@fence-restore-untiled.html
[221] i915#16182
      https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16182
[222] INCOMPLETE
      https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19102/shard-glk8/igt@=
i915_suspend@fence-restore-untiled.html
[223] PASS
      https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_169493v4/shard-rkl=
-3/igt@gem_workarounds@suspend-resume-fd.html
[224] i915#13356
      https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13356
[225] INCOMPLETE
      https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19102/shard-rkl-6/igt=
@gem_workarounds@suspend-resume-fd.html
[226] PASS
      https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_169493v4/shard-dg2=
-8/igt@gem_eio@in-flight-suspend.html
[227] i915#16784
      https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16784
[228] ABORT
      https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19102/shard-dg2-8/igt=
@gem_eio@in-flight-suspend.html
[229] PASS
      https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_169493v4/shard-rkl=
-7/igt@gem_eio@hibernate.html
[230] i915#7975
      https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/7975
[231] ABORT
      https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19102/shard-rkl-1/igt=
@gem_eio@hibernate.html
[232] i915#4818
      https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4818
[233] SKIP
      https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_169493v4/shard-dg1=
-16/igt@tools_test@sysfs_l3_parity.html
[234] i915#3708
      https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3708
[235] SKIP
      https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_169493v4/shard-dg1=
-17/igt@prime_vgem@fence-read-hang.html
[236] i915#3291
      https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3291
[237] SKIP
      https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_169493v4/shard-rkl=
-7/igt@prime_vgem@basic-write.html
[238] i915#16420
      https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16420
[239] SKIP
      https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_169493v4/shard-tgl=
u-7/igt@prime_udl@share-import-addfb.html
[240] SKIP
      https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_169493v4/shard-tgl=
u-1/igt@prime_udl@share-import.html
[241] i915#8516
      https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8516
[242] SKIP
      https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_169493v4/shard-tgl=
u-1/igt@perf_pmu@rc6@other-idle-gt0.html
[243] FAIL
      https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_169493v4/shard-mtl=
p-2/igt@perf_pmu@busy-double-start.html
[244] PASS
      https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19102/shard-mtlp-3/ig=
t@perf_pmu@busy-double-start.html
[245] i915#2435
      https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2435
[246] SKIP
      https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_169493v4/shard-rkl=
-4/igt@perf@per-context-mode-unprivileged.html
[247] i915#9906
      https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9906
[248] SKIP
      https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_169493v4/shard-rkl=
-4/igt@kms_vrr@seamless-rr-switch-vrr.html
[249] SKIP
      https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_169493v4/shard-dg2=
-1/igt@kms_vrr@max-min.html
[250] i915#12276
      https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12276
[251] INCOMPLETE
      https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_169493v4/shard-glk=
1/igt@kms_vblank@ts-continuation-suspend.html
[252] i915#10959
      https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/10959
[253] FAIL
      https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_169493v4/shard-glk=
4/igt@kms_tiled_display@basic-test-pattern.html
[254] SKIP
      https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_169493v4/shard-tgl=
u-1/igt@kms_rotation_crc@primary-yf-tiled-reflect-x-90.html
[255] SKIP
      https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_169493v4/shard-dg1=
-16/igt@kms_rotation_crc@primary-yf-tiled-reflect-x-270.html
[256] SKIP
      https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_169493v4/shard-tgl=
u-7/igt@kms_rotation_crc@primary-4-tiled-reflect-x-0.html
[257] i915#15949
      https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15949
[258] SKIP
      https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_169493v4/shard-dg1=
-17/igt@kms_psr_stress_test@invalidate-primary-flip-overlay.html
[259] SKIP
      https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_169493v4/shard-tgl=
u-4/igt@kms_psr_stress_test@invalidate-primary-flip-overlay.html
[260] SKIP
      https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_169493v4/shard-rkl=
-4/igt@kms_psr@psr-sprite-plane-move.html
[261] SKIP
      https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_169493v4/shard-dg2=
-8/igt@kms_psr@pr-primary-blt.html
[262] SKIP
      https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_169493v4/shard-dg1=
-16/igt@kms_psr@fbc-psr2-cursor-blt.html
[263] SKIP
      https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_169493v4/shard-tgl=
u-1/igt@kms_psr@fbc-pr-sprite-render.html
[264] SKIP
      https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_169493v4/shard-tgl=
u-7/igt@kms_psr@fbc-pr-cursor-blt.html
[265] i915#9683
      https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9683
[266] SKIP
      https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_169493v4/shard-tgl=
u-7/igt@kms_psr2_su@page_flip-xrgb8888.html
[267] SKIP
      https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_169493v4/shard-tgl=
u-1/igt@kms_psr2_su@frontbuffer-xrgb8888.html
[268] SKIP
      https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_169493v4/shard-glk=
11/igt@kms_psr2_sf@psr2-overlay-plane-move-continuous-exceed-sf.html
[269] SKIP
      https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_169493v4/shard-glk=
10/igt@kms_psr2_sf@pr-cursor-plane-move-continuous-exceed-sf.html
[270] SKIP
      https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_169493v4/shard-dg1=
-16/igt@kms_psr2_sf@fbc-psr2-cursor-plane-move-continuous-exceed-sf.html
[271] SKIP
      https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_169493v4/shard-rkl=
-4/igt@kms_psr2_sf@fbc-pr-primary-plane-update-sf-dmg-area.html
[272] SKIP
      https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_169493v4/shard-glk=
1/igt@kms_psr2_sf@fbc-pr-overlay-plane-move-continuous-exceed-sf.html
[273] SKIP
      https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_169493v4/shard-tgl=
u-4/igt@kms_psr2_sf@fbc-pr-cursor-plane-update-sf.html
[274] SKIP
      https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_169493v4/shard-dg2=
-8/igt@kms_psr2_sf@fbc-pr-cursor-plane-move-continuous-exceed-sf.html
[275] SKIP
      https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_169493v4/shard-tgl=
u-1/igt@kms_psr2_sf@fbc-pr-cursor-plane-move-continuous-exceed-fully-sf.htm=
l
[276] SKIP
      https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_169493v4/shard-dg2=
-4/igt@kms_pm_rpm@modeset-non-lpsp-stress.html
[277] PASS
      https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19102/shard-dg2-6/igt=
@kms_pm_rpm@modeset-non-lpsp-stress.html
[278] SKIP
      https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_169493v4/shard-tgl=
u-1/igt@kms_pm_rpm@modeset-non-lpsp-stress.html
[279] SKIP
      https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_169493v4/shard-rkl=
-4/igt@kms_pm_rpm@modeset-lpsp.html
[280] i915#4077
      https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4077
[281] SKIP
      https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_169493v4/shard-dg1=
-16/igt@kms_pm_rpm@fences.html
[282] SKIP
      https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_169493v4/shard-tgl=
u-7/igt@kms_pm_rpm@dpms-non-lpsp.html
[283] SKIP
      https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_169493v4/shard-rkl=
-4/igt@kms_pm_rpm@dpms-mode-unset-lpsp.html
[284] PASS
      https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19102/shard-rkl-2/igt=
@kms_pm_rpm@dpms-mode-unset-lpsp.html
[285] SKIP
      https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_169493v4/shard-dg1=
-17/igt@kms_pm_rpm@dpms-mode-unset-lpsp.html
[286] i915#9340
      https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9340
[287] SKIP
      https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_169493v4/shard-dg1=
-16/igt@kms_pm_lpsp@kms-lpsp.html
[288] SKIP
      https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_169493v4/shard-dg1=
-16/igt@kms_pm_dc@dc6-psr.html
[289] i915#16479
      https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16479
[290] FAIL
      https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_169493v4/shard-tgl=
u-1/igt@kms_pm_dc@dc6-dpms.html
[291] i915#9685
      https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9685
[292] SKIP
      https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_169493v4/shard-tgl=
u-1/igt@kms_pm_dc@dc5-pageflip-negative.html
[293] SKIP
      https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_169493v4/shard-rkl=
-3/igt@kms_pm_backlight@fade-with-suspend.html
[294] i915#9812
      https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9812
[295] SKIP
      https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_169493v4/shard-tgl=
u-7/igt@kms_pm_backlight@fade-with-dpms.html
[296] SKIP
      https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_169493v4/shard-dg2=
-1/igt@kms_pm_backlight@brightness-with-dpms.html
[297] i915#14259
      https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14259
[298] SKIP
      https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_169493v4/shard-tgl=
u-7/igt@kms_plane_multiple@tiling-yf.html
[299] i915#13958
      https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13958
[300] SKIP
      https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_169493v4/shard-dg2=
-1/igt@kms_plane_multiple@2x-tiling-x.html
[301] SKIP
      https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_169493v4/shard-rkl=
-4/igt@kms_plane_multiple@2x-tiling-4.html
[302] i915#7862
      https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/7862
[303] FAIL
      https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_169493v4/shard-glk=
1/igt@kms_plane_alpha_blend@alpha-basic@pipe-a-hdmi-a-1.html
[304] i915#12178
      https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12178
[305] FAIL
      https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_169493v4/shard-glk=
1/igt@kms_plane_alpha_blend@alpha-basic.html
[306] i915#14412
      https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14412
[307] INCOMPLETE
      https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_169493v4/shard-rkl=
-3/igt@kms_plane@plane-panning-bottom-right-suspend@pipe-a.html
[308] i915#16112
      https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16112
[309] SKIP
      https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_169493v4/shard-dg1=
-16/igt@kms_plane@planar-pixel-format-settings@nv12-tile4-src-y.html
[310] SKIP
      https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_169493v4/shard-rkl=
-3/igt@kms_plane@pixel-format-yf-tiled-modifier.html
[311] SKIP
      https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_169493v4/shard-tgl=
u-7/igt@kms_plane@pixel-format-yf-tiled-modifier.html
[312] SKIP
      https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_169493v4/shard-dg2=
-1/igt@kms_plane@pixel-format-yf-tiled-ccs-modifier-source-clamping.html
[313] i915#16386
      https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16386
[314] SKIP
      https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_169493v4/shard-dg1=
-16/igt@kms_plane@pixel-format-y-tiled-modifier@pipe-b-plane-7.html
[315] SKIP
      https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_169493v4/shard-dg1=
-16/igt@kms_plane@pixel-format-y-tiled-ccs-modifier.html
[316] SKIP
      https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_169493v4/shard-tgl=
u-1/igt@kms_plane@pixel-format-4-tiled-mtl-mc-ccs-modifier-source-clamping.=
html
[317] i915#14712
      https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14712
[318] SKIP
      https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_169493v4/shard-dg1=
-17/igt@kms_pipe_stress@stress-xrgb8888-yftiled.html
[319] SKIP
      https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_169493v4/shard-tgl=
u-7/igt@kms_pipe_stress@stress-xrgb8888-4tiled.html
[320] ABORT
      https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_169493v4/shard-tgl=
u-1/igt@kms_pipe_crc_basic@suspend-read-crc.html
[321] i915#6301
      https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6301
[322] SKIP
      https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_169493v4/shard-rkl=
-4/igt@kms_panel_fitting@legacy.html
[323] SKIP
      https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_169493v4/shard-dg2=
-1/igt@kms_joiner@invalid-modeset-ultra-joiner.html
[324] SKIP
      https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_169493v4/shard-dg1=
-17/igt@kms_joiner@basic-force-ultra-joiner.html
[325] SKIP
      https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_169493v4/shard-dg1=
-16/igt@kms_joiner@basic-force-big-joiner.html
[326] i915#15460
      https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15460
[327] SKIP
      https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_169493v4/shard-rkl=
-7/igt@kms_joiner@basic-big-joiner.html
[328] SKIP
      https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_169493v4/shard-dg1=
-16/igt@kms_joiner@basic-big-joiner.html
[329] SKIP
      https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_169493v4/shard-tgl=
u-2/igt@kms_joiner@basic-big-joiner.html
[330] i915#8228
      https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8228
[331] i915#16644
      https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16644
[332] SKIP
      https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_169493v4/shard-rkl=
-4/igt@kms_hdr@static-toggle.html
[333] SKIP
      https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_169493v4/shard-rkl=
-3/igt@kms_hdr@bpc-switch.html
[334] PASS
      https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19102/shard-rkl-6/igt=
@kms_hdr@bpc-switch.html
[335] SKIP
      https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_169493v4/shard-tgl=
u-7/igt@kms_hdr@bpc-switch.html
[336] SKIP
      https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_169493v4/shard-dg1=
-16/igt@kms_frontbuffer_tracking@psrhdr-rgb565-draw-render.html
[337] i915#15991
      https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15991
[338] SKIP
      https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_169493v4/shard-dg2=
-1/igt@kms_frontbuffer_tracking@psrhdr-2p-scndscrn-shrfb-plflip-blt.html
[339] SKIP
      https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_169493v4/shard-rkl=
-7/igt@kms_frontbuffer_tracking@psrhdr-2p-scndscrn-cur-indfb-move.html
[340] SKIP
      https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_169493v4/shard-rkl=
-4/igt@kms_frontbuffer_tracking@psrhdr-1p-primscrn-spr-indfb-move.html
[341] SKIP
      https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_169493v4/shard-dg2=
-1/igt@kms_frontbuffer_tracking@psr-2p-scndscrn-pri-shrfb-draw-blt.html
[342] SKIP
      https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_169493v4/shard-dg1=
-16/igt@kms_frontbuffer_tracking@psr-1p-offscreen-pri-shrfb-draw-mmap-gtt.h=
tml
[343] SKIP
      https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_169493v4/shard-tgl=
u-1/igt@kms_frontbuffer_tracking@hdr-rgb101010-draw-pwrite.html
[344] SKIP
      https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_169493v4/shard-dg1=
-16/igt@kms_frontbuffer_tracking@hdr-modesetfrombusy.html
[345] SKIP
      https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_169493v4/shard-tgl=
u-1/igt@kms_frontbuffer_tracking@hdr-2p-rte.html
[346] SKIP
      https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_169493v4/shard-rkl=
-7/igt@kms_frontbuffer_tracking@hdr-1p-offscreen-pri-indfb-draw-pwrite.html
[347] PASS
      https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19102/shard-rkl-1/igt=
@kms_frontbuffer_tracking@hdr-1p-offscreen-pri-indfb-draw-pwrite.html
[348] SKIP
      https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_169493v4/shard-dg2=
-1/igt@kms_frontbuffer_tracking@fbcpsrhdr-2p-scndscrn-pri-indfb-draw-mmap-w=
c.html
[349] SKIP
      https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_169493v4/shard-dg1=
-16/igt@kms_frontbuffer_tracking@fbcpsrhdr-2p-primscrn-cur-indfb-draw-mmap-=
gtt.html
[350] SKIP
      https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_169493v4/shard-tgl=
u-1/igt@kms_frontbuffer_tracking@fbcpsrhdr-1p-primscrn-pri-shrfb-draw-mmap-=
cpu.html
[351] i915#5439
      https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5439
[352] SKIP
      https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_169493v4/shard-rkl=
-4/igt@kms_frontbuffer_tracking@fbcpsr-tiling-4.html
[353] SKIP
      https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_169493v4/shard-tgl=
u-7/igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-spr-indfb-fullscreen.ht=
ml
[354] SKIP
      https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_169493v4/shard-rkl=
-7/igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-pri-shrfb-draw-mmap-wc.h=
tml
[355] SKIP
      https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_169493v4/shard-glk=
10/igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-pri-indfb-draw-blt.html
[356] SKIP
      https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_169493v4/shard-tgl=
u-7/igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-pri-shrfb-draw-mmap-wc.=
html
[357] SKIP
      https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_169493v4/shard-dg2=
-1/igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-pri-indfb-draw-pwrite.ht=
ml
[358] SKIP
      https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_169493v4/shard-glk=
4/igt@kms_frontbuffer_tracking@fbchdr-2p-primscrn-spr-indfb-draw-mmap-cpu.h=
tml
[359] PASS
      https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19102/shard-glk8/igt@=
kms_frontbuffer_tracking@fbchdr-2p-primscrn-spr-indfb-draw-mmap-cpu.html
[360] SKIP
      https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_169493v4/shard-rkl=
-3/igt@kms_frontbuffer_tracking@fbchdr-1p-primscrn-spr-indfb-onoff.html
[361] SKIP
      https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_169493v4/shard-dg2=
-1/igt@kms_frontbuffer_tracking@fbchdr-1p-primscrn-spr-indfb-draw-render.ht=
ml
[362] SKIP
      https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_169493v4/shard-tgl=
u-4/igt@kms_frontbuffer_tracking@fbchdr-1p-offscreen-pri-indfb-draw-mmap-wc=
.html
[363] i915#16593
      https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16593
[364] i915#10056
      https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/10056
[365] INCOMPLETE
      https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_169493v4/shard-glk=
10/igt@kms_frontbuffer_tracking@fbc-suspend.html
[366] SKIP
      https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_169493v4/shard-dg1=
-17/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-pri-shrfb-draw-mmap-gtt.ht=
ml
[367] SKIP
      https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_169493v4/shard-dg1=
-17/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-cur-indfb-draw-render.html
[368] SKIP
      https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_169493v4/shard-dg2=
-1/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-spr-indfb-draw-mmap-wc.html
[369] SKIP
      https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_169493v4/shard-rkl=
-4/igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-16bpp-4tile-upscaling.html
[370] SKIP
      https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_169493v4/shard-tgl=
u-7/igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-16bpp-4tile-downscaling.htm=
l
[371] SKIP
      https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_169493v4/shard-tgl=
u-1/igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytileccs-downscaling.=
html
[372] SKIP
      https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_169493v4/shard-dg2=
-8/igt@kms_flip_scaled_crc@flip-32bpp-yftile-to-32bpp-yftileccs-upscaling.h=
tml
[373] SKIP
      https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_169493v4/shard-dg1=
-16/igt@kms_flip_scaled_crc@flip-32bpp-4tile-to-64bpp-4tile-upscaling.html
[374] i915#6113
      https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6113
[375] i915#16276
      https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16276
[376] INCOMPLETE
      https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_169493v4/shard-rkl=
-3/igt@kms_flip@flip-vs-suspend@a-hdmi-a2.html
[377] i915#12745
      https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12745
[378] INCOMPLETE
      https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_169493v4/shard-glk=
9/igt@kms_flip@flip-vs-suspend@a-hdmi-a1.html
[379] INCOMPLETE
      https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_169493v4/shard-rkl=
-3/igt@kms_flip@flip-vs-suspend.html
[380] PASS
      https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19102/shard-rkl-8/igt=
@kms_flip@flip-vs-suspend.html
[381] i915#4839
      https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4839
[382] INCOMPLETE
      https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_169493v4/shard-glk=
9/igt@kms_flip@flip-vs-suspend.html
[383] FAIL
      https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_169493v4/shard-dg2=
-3/igt@kms_flip@flip-vs-expired-vblank-interruptible@c-hdmi-a3.html
[384] PASS
      https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19102/shard-dg2-6/igt=
@kms_flip@flip-vs-expired-vblank-interruptible@c-hdmi-a3.html
[385] FAIL
      https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_169493v4/shard-rkl=
-3/igt@kms_flip@flip-vs-expired-vblank-interruptible@b-hdmi-a2.html
[386] FAIL
      https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_169493v4/shard-glk=
11/igt@kms_flip@flip-vs-expired-vblank-interruptible@a-hdmi-a2.html
[387] PASS
      https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19102/shard-glk11/igt=
@kms_flip@flip-vs-expired-vblank-interruptible@a-hdmi-a2.html
[388] FAIL
      https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_169493v4/shard-rkl=
-3/igt@kms_flip@flip-vs-expired-vblank-interruptible.html
[389] PASS
      https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19102/shard-rkl-5/igt=
@kms_flip@flip-vs-expired-vblank-interruptible.html
[390] FAIL
      https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_169493v4/shard-dg1=
-16/igt@kms_flip@flip-vs-blocking-wf-vblank@b-hdmi-a4.html
[391] PASS
      https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19102/shard-dg1-19/ig=
t@kms_flip@flip-vs-blocking-wf-vblank@b-hdmi-a4.html
[392] SKIP
      https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_169493v4/shard-rkl=
-3/igt@kms_flip@2x-single-buffer-flip-vs-dpms-off-vs-modeset-interruptible.=
html
[393] i915#8381
      https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8381
[394] SKIP
      https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_169493v4/shard-dg1=
-16/igt@kms_flip@2x-flip-vs-fences-interruptible.html
[395] SKIP
      https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_169493v4/shard-tgl=
u-1/igt@kms_flip@2x-flip-vs-dpms-on-nop-interruptible.html
[396] i915#3637
      https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3637
[397] SKIP
      https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_169493v4/shard-tgl=
u-1/igt@kms_flip@2x-blocking-wf_vblank.html
[398] SKIP
      https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_169493v4/shard-dg2=
-1/igt@kms_flip@2x-absolute-wf_vblank-interruptible.html
[399] SKIP
      https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_169493v4/shard-dg1=
-17/igt@kms_flip@2x-absolute-wf_vblank.html
[400] SKIP
      https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_169493v4/shard-tgl=
u-4/igt@kms_flip@2x-absolute-wf_vblank.html
[401] i915#4881
      https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4881
[402] SKIP
      https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_169493v4/shard-dg2=
-1/igt@kms_fence_pin_leak.html
[403] i915#658
      https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/658
[404] SKIP
      https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_169493v4/shard-dg1=
-17/igt@kms_feature_discovery@psr2.html
[405] SKIP
      https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_169493v4/shard-dg2=
-1/igt@kms_feature_discovery@psr1.html
[406] i915#16081
      https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16081
[407] SKIP
      https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_169493v4/shard-rkl=
-3/igt@kms_feature_discovery@display-3x.html
[408] SKIP
      https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_169493v4/shard-tgl=
u-7/igt@kms_feature_discovery@display-3x.html
[409] i915#16680
      https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16680
[410] SKIP
      https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_169493v4/shard-rkl=
-7/igt@kms_fbcon_fbt@psr.html
[411] SKIP
      https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_169493v4/shard-dg2=
-1/igt@kms_dsc@dsc-with-formats-ultrajoiner.html
[412] SKIP
      https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_169493v4/shard-tgl=
u-1/igt@kms_dsc@dsc-with-formats-bigjoiner.html
[413] SKIP
      https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_169493v4/shard-dg1=
-16/igt@kms_dsc@dsc-with-bpc-bigjoiner.html
[414] SKIP
      https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_169493v4/shard-tgl=
u-4/igt@kms_dsc@dsc-basic-ultrajoiner.html
[415] SKIP
      https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_169493v4/shard-rkl=
-4/igt@kms_dsc@dsc-basic.html
[416] i915#8812
      https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8812
[417] SKIP
      https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_169493v4/shard-dg2=
-1/igt@kms_draw_crc@draw-method-mmap-gtt.html
[418] i915#16870
      https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16870
[419] SKIP
      https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_169493v4/shard-tgl=
u-1/igt@kms_dp_linktrain_fallback@uhbr-to-hbr-fallback.html
[420] i915#13748
      https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13748
[421] SKIP
      https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_169493v4/shard-dg1=
-16/igt@kms_dp_link_training@uhbr-sst.html
[422] SKIP
      https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_169493v4/shard-dg1=
-16/igt@kms_dither@fb-8bpc-vs-panel-8bpc.html
[423] i915#9723
      https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9723
[424] SKIP
      https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_169493v4/shard-tgl=
u-1/igt@kms_dirtyfb@drrs-dirtyfb-ioctl.html
[425] i915#4103
      https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4103
[426] SKIP
      https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_169493v4/shard-dg1=
-16/igt@kms_cursor_legacy@short-busy-flip-before-cursor-toggle.html
[427] SKIP
      https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_169493v4/shard-tgl=
u-1/igt@kms_cursor_legacy@short-busy-flip-before-cursor-atomic-transitions-=
varying-size.html
[428] DMESG-WARN
      https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_169493v4/shard-dg1=
-19/igt@kms_cursor_edge_walk@256x256-top-edge.html
[429] PASS
      https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19102/shard-dg1-17/ig=
t@kms_cursor_edge_walk@256x256-top-edge.html
[430] i915#16685
      https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16685
[431] DMESG-WARN
      https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_169493v4/shard-dg1=
-14/igt@kms_cursor_edge_walk@128x128-top-edge.html
[432] PASS
      https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19102/shard-dg1-15/ig=
t@kms_cursor_edge_walk@128x128-top-edge.html
[433] i915#14152
      https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14152
[434] i915#12358
      https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12358
[435] INCOMPLETE
      https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_169493v4/shard-glk=
9/igt@kms_cursor_crc@cursor-suspend@pipe-a-hdmi-a-1.html
[436] i915#7882
      https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/7882
[437] INCOMPLETE
      https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_169493v4/shard-glk=
9/igt@kms_cursor_crc@cursor-suspend.html
[438] SKIP
      https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_169493v4/shard-rkl=
-7/igt@kms_cursor_crc@cursor-sliding-512x170.html
[439] i915#13566
      https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13566
[440] FAIL
      https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_169493v4/shard-tgl=
u-10/igt@kms_cursor_crc@cursor-sliding-128x42@pipe-a-hdmi-a-1.html
[441] PASS
      https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19102/shard-tglu-4/ig=
t@kms_cursor_crc@cursor-sliding-128x42@pipe-a-hdmi-a-1.html
[442] SKIP
      https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_169493v4/shard-tgl=
u-4/igt@kms_cursor_crc@cursor-rapid-movement-512x512.html
[443] SKIP
      https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_169493v4/shard-tgl=
u-1/igt@kms_cursor_crc@cursor-rapid-movement-512x170.html
[444] SKIP
      https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_169493v4/shard-tgl=
u-7/igt@kms_cursor_crc@cursor-rapid-movement-32x10.html
[445] SKIP
      https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_169493v4/shard-rkl=
-4/igt@kms_cursor_crc@cursor-random-max-size.html
[446] FAIL
      https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_169493v4/shard-tgl=
u-1/igt@kms_cursor_crc@cursor-random-64x21.html
[447] FAIL
      https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_169493v4/shard-rkl=
-8/igt@kms_cursor_crc@cursor-random-256x85@pipe-a-hdmi-a-1.html
[448] FAIL
      https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_169493v4/shard-rkl=
-5/igt@kms_cursor_crc@cursor-onscreen-128x42.html
[449] PASS
      https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19102/shard-rkl-8/igt=
@kms_cursor_crc@cursor-onscreen-128x42.html
[450] SKIP
      https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_169493v4/shard-tgl=
u-1/igt@kms_cursor_crc@cursor-offscreen-max-size.html
[451] SKIP
      https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_169493v4/shard-dg1=
-16/igt@kms_cursor_crc@cursor-offscreen-512x170.html
[452] SKIP
      https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_169493v4/shard-rkl=
-7/igt@kms_content_protection@srm.html
[453] SKIP
      https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_169493v4/shard-tgl=
u-1/igt@kms_content_protection@legacy-hdcp14.html
[454] SKIP
      https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_169493v4/shard-dg1=
-17/igt@kms_content_protection@legacy.html
[455] SKIP
      https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_169493v4/shard-dg2=
-1/igt@kms_content_protection@dp-mst-type-1-suspend-resume.html
[456] i915#3299
      https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3299
[457] SKIP
      https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_169493v4/shard-dg2=
-1/igt@kms_content_protection@dp-mst-type-0.html
[458] i915#3116
      https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3116
[459] SKIP
      https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_169493v4/shard-rkl=
-7/igt@kms_content_protection@dp-mst-lic-type-1.html
[460] SKIP
      https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_169493v4/shard-dg1=
-16/igt@kms_content_protection@dp-mst-lic-type-1.html
[461] SKIP
      https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_169493v4/shard-tgl=
u-2/igt@kms_content_protection@dp-mst-lic-type-1.html
[462] SKIP
      https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_169493v4/shard-tgl=
u-1/igt@kms_content_protection@dp-mst-lic-type-0.html
[463] SKIP
      https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_169493v4/shard-tgl=
u-7/igt@kms_content_protection@content-type-change.html
[464] i915#12655
      https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12655
[465] SKIP
      https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_169493v4/shard-dg2=
-1/igt@kms_color@deep-color.html
[466] SKIP
      https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_169493v4/shard-tgl=
u-1/igt@kms_chamelium_hpd@vga-hpd-for-each-pipe.html
[467] SKIP
      https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_169493v4/shard-rkl=
-7/igt@kms_chamelium_hpd@vga-hpd-fast.html
[468] SKIP
      https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_169493v4/shard-dg1=
-16/igt@kms_chamelium_hpd@vga-hpd-fast.html
[469] SKIP
      https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_169493v4/shard-tgl=
u-2/igt@kms_chamelium_hpd@vga-hpd-fast.html
[470] i915#16471
      https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16471
[471] SKIP
      https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_169493v4/shard-rkl=
-3/igt@kms_chamelium_color_pipeline@plane-lut1d-pre-ctm3x4.html
[472] SKIP
      https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_169493v4/shard-tgl=
u-7/igt@kms_chamelium_color_pipeline@plane-lut1d-pre-ctm3x4.html
[473] SKIP
      https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_169493v4/shard-dg1=
-16/igt@kms_chamelium_color_pipeline@plane-lut1d-ctm3x4-lut1d.html
[474] SKIP
      https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_169493v4/shard-dg2=
-1/igt@kms_chamelium_color@ctm-green-to-red.html
[475] SKIP
      https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_169493v4/shard-dg2=
-1/igt@kms_chamelium_audio@dp-audio-edid.html
[476] i915#13781
      https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13781
[477] SKIP
      https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_169493v4/shard-dg2=
-4/igt@kms_cdclk@mode-transition@pipe-d-hdmi-a-1.html
[478] SKIP
      https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_169493v4/shard-rkl=
-4/igt@kms_cdclk@mode-transition.html
[479] SKIP
      https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_169493v4/shard-rkl=
-7/igt@kms_ccs@random-ccs-data-4-tiled-mtl-rc-ccs@pipe-b-hdmi-a-2.html
[480] SKIP
      https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_169493v4/shard-tgl=
u-4/igt@kms_ccs@missing-ccs-buffer-4-tiled-mtl-mc-ccs@pipe-d-hdmi-a-1.html
[481] i915#10307
      https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/10307
[482] SKIP
      https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_169493v4/shard-dg2=
-5/igt@kms_ccs@crc-sprite-planes-basic-4-tiled-mtl-mc-ccs@pipe-a-hdmi-a-3.h=
tml
[483] i915#12313
      https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12313
[484] SKIP
      https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_169493v4/shard-rkl=
-3/igt@kms_ccs@crc-sprite-planes-basic-4-tiled-lnl-ccs.html
[485] SKIP
      https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_169493v4/shard-tgl=
u-7/igt@kms_ccs@crc-sprite-planes-basic-4-tiled-bmg-ccs.html
[486] SKIP
      https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_169493v4/shard-rkl=
-7/igt@kms_ccs@crc-primary-suspend-yf-tiled-ccs@pipe-c-hdmi-a-2.html
[487] i915#15582
      https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15582
[488] i915#14694
      https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14694
[489] INCOMPLETE
      https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_169493v4/shard-glk=
1/igt@kms_ccs@crc-primary-suspend-yf-tiled-ccs.html
[490] SKIP
      https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_169493v4/shard-dg2=
-1/igt@kms_ccs@crc-primary-suspend-4-tiled-mtl-rc-ccs@pipe-a-hdmi-a-3.html
[491] SKIP
      https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_169493v4/shard-glk=
11/igt@kms_ccs@crc-primary-rotation-180-y-tiled-gen12-rc-ccs-cc.html
[492] SKIP
      https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_169493v4/shard-dg1=
-12/igt@kms_ccs@crc-primary-rotation-180-y-tiled-ccs@pipe-a-hdmi-a-3.html
[493] SKIP
      https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_169493v4/shard-tgl=
u-1/igt@kms_ccs@crc-primary-rotation-180-4-tiled-bmg-ccs.html
[494] SKIP
      https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_169493v4/shard-dg1=
-16/igt@kms_ccs@crc-primary-basic-4-tiled-lnl-ccs.html
[495] SKIP
      https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_169493v4/shard-tgl=
u-1/igt@kms_ccs@crc-primary-basic-4-tiled-dg2-rc-ccs-cc@pipe-a-hdmi-a-1.htm=
l
[496] i915#10434
      https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/10434
[497] SKIP
      https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_169493v4/shard-dg2=
-4/igt@kms_ccs@bad-aux-stride-y-tiled-gen12-rc-ccs@pipe-d-hdmi-a-1.html
[498] i915#5190
      https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5190
[499] i915#4538
      https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4538
[500] SKIP
      https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_169493v4/shard-dg2=
-8/igt@kms_big_fb@yf-tiled-8bpp-rotate-0.html
[501] SKIP
      https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_169493v4/shard-dg1=
-16/igt@kms_big_fb@yf-tiled-16bpp-rotate-270.html
[502] SKIP
      https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_169493v4/shard-rkl=
-3/igt@kms_big_fb@y-tiled-64bpp-rotate-90.html
[503] i915#3828
      https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3828
[504] SKIP
      https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_169493v4/shard-tgl=
u-1/igt@kms_big_fb@linear-max-hw-stride-64bpp-rotate-180-hflip.html
[505] SKIP
      https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_169493v4/shard-rkl=
-7/igt@kms_big_fb@linear-max-hw-stride-32bpp-rotate-0-hflip.html
[506] SKIP
      https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_169493v4/shard-dg1=
-17/igt@kms_big_fb@linear-8bpp-rotate-270.html
[507] i915#5138
      https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5138
[508] i915#15733
      https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15733
[509] FAIL
      https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_169493v4/shard-mtl=
p-7/igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-180-hflip.html
[510] PASS
      https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19102/shard-mtlp-4/ig=
t@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-180-hflip.html
[511] SKIP
      https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_169493v4/shard-rkl=
-7/igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-0-hflip.html
[512] SKIP
      https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_169493v4/shard-dg1=
-16/igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-0-hflip.html
[513] SKIP
      https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_169493v4/shard-tgl=
u-4/igt@kms_big_fb@4-tiled-max-hw-stride-32bpp-rotate-0-async-flip.html
[514] SKIP
      https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_169493v4/shard-tgl=
u-1/igt@kms_big_fb@4-tiled-8bpp-rotate-180.html
[515] i915#5956
      https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5956
[516] FAIL
      https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_169493v4/shard-mtl=
p-8/igt@kms_atomic_transition@plane-toggle-modeset-transition@pipe-a-edp-1.=
html
[517] PASS
      https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19102/shard-mtlp-8/ig=
t@kms_atomic_transition@plane-toggle-modeset-transition@pipe-a-edp-1.html
[518] ABORT
      https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_169493v4/shard-tgl=
u-7/igt@kms_atomic_transition@plane-all-modeset-transition@pipe-b-hdmi-a-1.=
html
[519] i915#9531
      https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9531
[520] SKIP
      https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_169493v4/shard-rkl=
-7/igt@kms_atomic@plane-primary-overlay-mutable-zpos.html
[521] i915#12761
      https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12761
[522] INCOMPLETE
      https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_169493v4/shard-rkl=
-3/igt@kms_async_flips@async-flip-suspend-resume@pipe-b-hdmi-a-2.html
[523] INCOMPLETE
      https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_169493v4/shard-rkl=
-3/igt@kms_async_flips@async-flip-suspend-resume.html
[524] PASS
      https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19102/shard-rkl-2/igt=
@kms_async_flips@async-flip-suspend-resume.html
[525] i915#12712
      https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12712
[526] i915#12454
      https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12454
[527] SKIP
      https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_169493v4/shard-tgl=
u-1/igt@kms_addfb_basic@invalid-smem-bo-on-discrete.html
[528] i915#4212
      https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4212
[529] SKIP
      https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_169493v4/shard-dg1=
-16/igt@kms_addfb_basic@clobberred-modifier.html
[530] SKIP
      https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_169493v4/shard-rkl=
-7/igt@intel_hwmon@hwmon-write.html
[531] INCOMPLETE
      https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_169493v4/shard-rkl=
-6/igt@i915_suspend@fence-restore-untiled.html
[532] PASS
      https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19102/shard-rkl-4/igt=
@i915_suspend@fence-restore-untiled.html
[533] i915#5723
      https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5723
[534] SKIP
      https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_169493v4/shard-rkl=
-4/igt@i915_query@test-query-geometry-subslices.html
[535] i915#7984
      https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/7984
[536] SKIP
      https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_169493v4/shard-mtl=
p-8/igt@i915_power@sanity.html
[537] PASS
      https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19102/shard-mtlp-6/ig=
t@i915_power@sanity.html
[538] i915#11681
      https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11681
[539] SKIP
      https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_169493v4/shard-dg1=
-16/igt@i915_pm_rps@thresholds-park.html
[540] i915#6621
      https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6621
[541] SKIP
      https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_169493v4/shard-dg1=
-16/igt@i915_pm_rps@min-max-config-idle.html
[542] INCOMPLETE
      https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_169493v4/shard-rkl=
-7/igt@i915_pm_rpm@system-suspend-execbuf.html
[543] INCOMPLETE
      https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_169493v4/shard-rkl=
-6/igt@i915_pm_rpm@system-suspend.html
[544] PASS
      https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19102/shard-rkl-4/igt=
@i915_pm_rpm@system-suspend.html
[545] i915#16166
      https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16166
[546] i915#16080
      https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16080
[547] SKIP
      https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_169493v4/shard-dg2=
-1/igt@i915_pm_rc6_residency@media-rc6-accuracy.html
[548] i915#8399
      https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8399
[549] SKIP
      https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_169493v4/shard-tgl=
u-4/igt@i915_pm_freq_api@freq-reset-multiple.html
[550] i915#14545
      https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14545
[551] DMESG-WARN
      https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_169493v4/shard-dg1=
-16/igt@i915_module_load@reload.html
[552] i915#14118
      https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14118
[553] SKIP
      https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_169493v4/shard-dg2=
-1/igt@i915_drm_fdinfo@virtual-busy-idle.html
[554] SKIP
      https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_169493v4/shard-dg1=
-17/igt@i915_drm_fdinfo@virtual-busy-hang-all.html
[555] i915#11527
      https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11527
[556] SKIP
      https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_169493v4/shard-dg1=
-17/igt@i915_drm_fdinfo@busy-check-all.html
[557] i915#14123
      https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14123
[558] SKIP
      https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_169493v4/shard-dg2=
-1/igt@i915_drm_fdinfo@all-busy-idle-check-all.html
[559] SKIP
      https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_169493v4/shard-dg1=
-17/igt@gen9_exec_parse@bb-start-out.html
[560] i915#2856
      https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2856
[561] SKIP
      https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_169493v4/shard-tgl=
u-4/igt@gen9_exec_parse@bb-start-out.html
[562] SKIP
      https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_169493v4/shard-tgl=
u-1/igt@gen9_exec_parse@bb-chained.html
[563] SKIP
      https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_169493v4/shard-rkl=
-7/igt@gen9_exec_parse@batch-without-end.html
[564] i915#3297
      https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3297
[565] SKIP
      https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_169493v4/shard-tgl=
u-1/igt@gem_userptr_blits@readonly-unsync.html
[566] SKIP
      https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_169493v4/shard-dg1=
-16/igt@gem_userptr_blits@readonly-pwrite-unsync.html
[567] i915#4880
      https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4880
[568] SKIP
      https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_169493v4/shard-dg2=
-1/igt@gem_userptr_blits@map-fixed-invalidate-busy.html
[569] SKIP
      https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_169493v4/shard-tgl=
u-4/igt@gem_userptr_blits@invalid-mmap-offset-unsync.html
[570] SKIP
      https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_169493v4/shard-rkl=
-4/igt@gem_userptr_blits@coherency-unsync.html
[571] SKIP
      https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_169493v4/shard-dg2=
-1/igt@gem_userptr_blits@access-control.html
[572] i915#4079
      https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4079
[573] SKIP
      https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_169493v4/shard-dg1=
-17/igt@gem_tiled_pread_pwrite.html
[574] i915#4885
      https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4885
[575] SKIP
      https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_169493v4/shard-dg1=
-17/igt@gem_softpin@evict-snoop-interruptible.html
[576] SKIP
      https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_169493v4/shard-rkl=
-3/igt@gem_set_tiling_vs_pwrite.html
[577] SKIP
      https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_169493v4/shard-glk=
1/igt@gem_render_copy@y-tiled-ccs-to-y-tiled-mc-ccs.html
[578] i915#8428
      https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8428
[579] SKIP
      https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_169493v4/shard-dg2=
-1/igt@gem_render_copy@y-tiled-ccs-to-y-tiled-ccs.html
[580] i915#15131
      https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15131
[581] ABORT
      https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_169493v4/shard-rkl=
-1/igt@gem_pxp@verify-pxp-execution-after-suspend-resume.html
[582] PASS
      https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19102/shard-rkl-6/igt=
@gem_pxp@verify-pxp-execution-after-suspend-resume.html
[583] i915#4270
      https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4270
[584] SKIP
      https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_169493v4/shard-dg1=
-17/igt@gem_pxp@dmabuf-shared-protected-dst-is-context-refcounted.html
[585] SKIP
      https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_169493v4/shard-dg1=
-16/igt@gem_pwrite_snooped.html
[586] SKIP
      https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_169493v4/shard-dg2=
-1/igt@gem_partial_pwrite_pread@writes-after-reads-snoop.html
[587] i915#4083
      https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4083
[588] SKIP
      https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_169493v4/shard-dg1=
-17/igt@gem_mmap_wc@write-read.html
[589] SKIP
      https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_169493v4/shard-dg2=
-8/igt@gem_mmap_wc@write-prefaulted.html
[590] SKIP
      https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_169493v4/shard-dg2=
-1/igt@gem_mmap_gtt@cpuset-basic-small-copy-xy.html
[591] i915#4565
      https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4565
[592] SKIP
      https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_169493v4/shard-dg1=
-17/igt@gem_lmem_swapping@verify-ccs@lmem0.html
[593] i915#12193
      https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12193
[594] SKIP
      https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_169493v4/shard-dg1=
-17/igt@gem_lmem_swapping@verify-ccs.html
[595] SKIP
      https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_169493v4/shard-tgl=
u-4/igt@gem_lmem_swapping@verify-ccs.html
[596] SKIP
      https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_169493v4/shard-glk=
1/igt@gem_lmem_swapping@random.html
[597] SKIP
      https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_169493v4/shard-rkl=
-3/igt@gem_lmem_swapping@massive.html
[598] SKIP
      https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_169493v4/shard-tgl=
u-1/igt@gem_lmem_swapping@heavy-random.html
[599] i915#7582
      https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/7582
[600] SKIP
      https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_169493v4/shard-tgl=
u-4/igt@gem_lmem_evict@dontneed-evict-race.html
[601] i915#2190
      https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2190
[602] SKIP
      https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_169493v4/shard-rkl=
-4/igt@gem_huc_copy@huc-copy.html
[603] INCOMPLETE
      https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_169493v4/shard-dg2=
-5/igt@gem_exec_suspend@basic-s0.html
[604] PASS
      https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19102/shard-dg2-4/igt=
@gem_exec_suspend@basic-s0.html
[605] SKIP
      https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_169493v4/shard-dg1=
-16/igt@gem_exec_reloc@basic-write-read-active.html
[606] SKIP
      https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_169493v4/shard-dg2=
-1/igt@gem_exec_reloc@basic-write-cpu-noreloc.html
[607] SKIP
      https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_169493v4/shard-rkl=
-7/igt@gem_exec_reloc@basic-wc.html
[608] i915#4852
      https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4852
[609] i915#3539
      https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3539
[610] SKIP
      https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_169493v4/shard-dg1=
-16/igt@gem_exec_flush@basic-uc-ro-default.html
[611] SKIP
      https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_169493v4/shard-tgl=
u-1/igt@gem_exec_balancer@parallel-keep-submit-fence.html
[612] i915#4771
      https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4771
[613] SKIP
      https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_169493v4/shard-dg1=
-16/igt@gem_exec_balancer@bonded-pair.html
[614] i915#4812
      https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4812
[615] SKIP
      https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_169493v4/shard-dg1=
-17/igt@gem_exec_balancer@bonded-false-hang.html
[616] i915#280
      https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/280
[617] SKIP
      https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_169493v4/shard-rkl=
-3/igt@gem_ctx_sseu@invalid-args.html
[618] SKIP
      https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_169493v4/shard-tgl=
u-7/igt@gem_ctx_sseu@invalid-args.html
[619] i915#8555
      https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8555
[620] SKIP
      https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_169493v4/shard-dg2=
-1/igt@gem_ctx_persistence@heartbeat-many.html
[621] SKIP
      https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_169493v4/shard-dg1=
-17/igt@gem_ctx_persistence@hang.html
[622] i915#8562
      https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8562
[623] SKIP
      https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_169493v4/shard-rkl=
-7/igt@gem_create@create-ext-set-pat.html
[624] i915#7697
      https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/7697
[625] SKIP
      https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_169493v4/shard-dg1=
-16/igt@gem_close_race@multigpu-basic-threads.html
[626] SKIP
      https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_169493v4/shard-tgl=
u-1/igt@gem_close_race@multigpu-basic-process.html
[627] i915#16348
      https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16348
[628] INCOMPLETE
      https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_169493v4/shard-dg2=
-3/igt@gem_ccs@suspend-resume@linear-compressed-compfmt0-lmem0-lmem0.html
[629] PASS
      https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19102/shard-dg2-1/igt=
@gem_ccs@suspend-resume@linear-compressed-compfmt0-lmem0-lmem0.html
[630] i915#13008
      https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13008
[631] SKIP
      https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_169493v4/shard-tgl=
u-1/igt@gem_ccs@large-ctrl-surf-copy.html
[632] SKIP
      https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_169493v4/shard-rkl=
-7/igt@gem_ccs@ctrl-surf-copy.html
[633] i915#3936
      https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3936
[634] SKIP
      https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_169493v4/shard-dg2=
-1/igt@gem_busy@semaphore.html
[635] i915#11078
      https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11078
[636] SKIP
      https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_169493v4/shard-tgl=
u-1/igt@device_reset@unbind-cold-reset-rebind.html
[637] SKIP
      https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_169493v4/shard-dg1=
-17/igt@device_reset@cold-reset-bound.html
[638] i915#8411
      https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8411
[639] SKIP
      https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_169493v4/shard-dg1=
-16/igt@api_intel_bb@object-reloc-keep-cache.html
[640] i915#6230
      https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6230
[641] SKIP
      https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_169493v4/shard-rkl=
-4/igt@api_intel_bb@crc32.html
[642] FAIL
      https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_169493v4/shard-dg1=
-16/igt@kms_flip@flip-vs-blocking-wf-vblank.html
[643] FAIL
      https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19102/shard-dg1-19/ig=
t@kms_flip@flip-vs-blocking-wf-vblank.html
[644] DMESG-WARN
      https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_169493v4/shard-dg1=
-14/igt@kms_cursor_edge_walk@128x128-top-edge@pipe-d-hdmi-a-1.html
[645] PASS
      https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19102/shard-dg1-15/ig=
t@kms_cursor_edge_walk@128x128-top-edge@pipe-d-hdmi-a-1.html

--=-S4r2Zhz32Rjo7XQ2uVGG
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
o my patchset.</div><div><br></div><div><a href=3D"mailto:igt@kms">igt@kms<=
/a><a href=3D"mailto:_cursor_edge_walk@128x128-top-edge">_cursor_edge_walk@=
128x128-top-edge</a>@pipe-d-hdmi-a-1</div><div>shard-dg1-14: PASS -&gt; DME=
SG-WARN</div><div><br></div><div>This is unrelated to my patchset. The PC8 =
restoration changes only apply to HSW/BDW, and the relocated display reinit=
ialization requires gpu_reset_clobbers_display, which the DG1 boot logs rep=
ort as "no".</div><div><br></div><div><a href=3D"mailto:igt@kms">igt@kms</a=
><a href=3D"mailto:_flip@flip-vs-blocking-wf-vblank">_flip@flip-vs-blocking=
-wf-vblank</a> on shard-dg1-16:</div><div><br></div><div>This fails in cali=
brate_ts() at "3 * stddev / mean &lt; 0.005", with 4.84% variation against =
a 0.5% limit. The same assertion also failed on DG1 HDMI-A4 in the independ=
ent series 173589, using the same CI_DRM_19102 baseline:</div><div><br></di=
v><div><a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_173589=
v1/shard-dg1-18/igt@kms_flip@flip-vs-wf_vblank-interruptible@c-hdmi-a4.html=
">https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_173589v1/shard-dg1-18/=
igt@kms_flip@flip-vs-wf_vblank-interruptible@c-hdmi-a4.html</a></div><div><=
br></div><div>The baseline failure was associated with issue 14600, but use=
d a different assertion, so this signature may need a separate match.</div>=
<div><br></div><div>Could you please associate these with the appropriate i=
ssues (or re-file if preferred) so they stop showing up as false regression=
s on unrelated series?</div><div><br></div><div>(analysis assisted by Copil=
ot)</div><div><br></div><div>--</div><div>Cheers,</div><div>Luca.</div><div=
><br></div><div><br></div><div>On Tue, 2026-09-08 at 20:45 +0000, Patchwork=
 wrote:</div><blockquote type=3D"cite" style=3D"margin:0 0 0 .8ex; border-l=
eft:2px #729fcf solid;padding-left:1ex"><div><b>Patch Details</b></div>
<div><table>
<tbody><tr><td><b>Series:</b></td><td>drm/i915/display: reduce clock_gating=
 interface between core and display (rev4)</td></tr>
<tr><td><b>URL:</b></td><td><a href=3D"https://patchwork.freedesktop.org/se=
ries/169493/">https://patchwork.freedesktop.org/series/169493/</a></td></tr=
>
<tr><td><b>State:</b></td><td>failure</td></tr> <tr><td><b>Details:</b></td=
><td><a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_169493v4=
/index.html">https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_169493v4/in=
dex.html</a></td></tr></tbody></table> </div><h1>CI Bug Log - changes from =
CI_DRM_19102_full -&gt; Patchwork_169493v4_full</h1><h2>Summary</h2><p><str=
ong>FAILURE</strong></p><p>Serious unknown changes coming with Patchwork_16=
9493v4_full absolutely need to be<br> verified manually.</p><p>If you think=
 the reported changes have nothing to do with the changes<br> introduced in=
 Patchwork_169493v4_full, please notify your bug team (I915-ci-infra@lists.=
freedesktop.org) to allow them<br> to document this new failure mode, which=
 will reduce false positives in CI.</p><h2>Participating hosts (10 -&gt; 11=
)</h2><p>Additional (1): pig-kbl-iris </p><h2>Possible new issues</h2><p>He=
re are the unknown changes that may have been introduced in Patchwork_16949=
3v4_full:</p><h3>IGT changes</h3><h4>Possible regressions</h4><ul>
<li>igt@kms_cursor_edge_walk@128x128-top-edge@pipe-d-hdmi-a-1:<ul>
<li>shard-dg1:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_19102/shard-dg1-15/igt@kms_cursor_edge_walk@128x128-top-edge@pipe-d=
-hdmi-a-1.html">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/=
drm-tip/Patchwork_169493v4/shard-dg1-14/igt@kms_cursor_edge_walk@128x128-to=
p-edge@pipe-d-hdmi-a-1.html">DMESG-WARN</a></li>
</ul></li>
</ul><h4>Warnings</h4><ul>
<li>igt@kms_flip@flip-vs-blocking-wf-vblank:<ul>
<li>shard-dg1:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_19102/shard-dg1-19/igt@kms_flip@flip-vs-blocking-wf-vblank.html">FA=
IL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/=
14600">i915#14600</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/dr=
m-tip/Patchwork_169493v4/shard-dg1-16/igt@kms_flip@flip-vs-blocking-wf-vbla=
nk.html">FAIL</a></li>
</ul></li>
</ul><h2>New tests</h2><p>New tests have been introduced between CI_DRM_191=
02_full and Patchwork_169493v4_full:</p><h3>New IGT tests (4)</h3><ul>
<li>
<p>igt@kms_cursor_crc@cursor-onscreen-64x21@pipe-a-hdmi-a-4:</p><ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [2.79] s</li>
</ul></li>
<li>
<p>igt@kms_cursor_crc@cursor-onscreen-64x21@pipe-d-hdmi-a-4:</p><ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [2.66] s</li>
</ul></li>
<li>
<p>igt@kms_cursor_crc@cursor-sliding-256x85@pipe-a-hdmi-a-3:</p><ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [4.39] s</li>
</ul></li>
<li>
<p>igt@kms_cursor_crc@cursor-sliding-256x85@pipe-d-hdmi-a-3:</p><ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [4.37] s</li>
</ul></li>
</ul><h2>Known issues</h2><p>Here are the changes found in Patchwork_169493=
v4_full that come from known issues:</p><h3>IGT changes</h3><h4>Issues hit<=
/h4><ul>
<li>
<p>igt@api_intel_bb@crc32:</p><ul>
<li>shard-rkl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/Patchwork_169493v4/shard-rkl-4/igt@api_intel_bb@crc32.html">S=
KIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues=
/6230">i915#6230</a>)</li>
</ul></li>
<li>
<p>igt@api_intel_bb@object-reloc-keep-cache:</p><ul>
<li>shard-dg1:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/Patchwork_169493v4/shard-dg1-16/igt@api_intel_bb@object-reloc=
-keep-cache.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i=
915/kernel/-/issues/8411">i915#8411</a>)</li>
</ul></li>
<li>
<p>igt@device_reset@cold-reset-bound:</p><ul>
<li>shard-dg1:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/Patchwork_169493v4/shard-dg1-17/igt@device_reset@cold-reset-b=
ound.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/ker=
nel/-/issues/11078">i915#11078</a>)</li>
</ul></li>
<li>
<p>igt@device_reset@unbind-cold-reset-rebind:</p><ul>
<li>shard-tglu-1:       NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/Patchwork_169493v4/shard-tglu-1/igt@device_reset@unbind-cold-=
reset-rebind.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/=
i915/kernel/-/issues/11078">i915#11078</a>)</li>
</ul></li>
<li>
<p>igt@gem_busy@semaphore:</p><ul>
<li>shard-dg2:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/Patchwork_169493v4/shard-dg2-1/igt@gem_busy@semaphore.html">S=
KIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues=
/3936">i915#3936</a>)</li>
</ul></li>
<li>
<p>igt@gem_ccs@ctrl-surf-copy:</p><ul>
<li>shard-rkl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/Patchwork_169493v4/shard-rkl-7/igt@gem_ccs@ctrl-surf-copy.htm=
l">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/is=
sues/3555">i915#3555</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i9=
15/kernel/-/issues/9323">i915#9323</a>)</li>
</ul></li>
<li>
<p>igt@gem_ccs@large-ctrl-surf-copy:</p><ul>
<li>shard-tglu-1:       NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/Patchwork_169493v4/shard-tglu-1/igt@gem_ccs@large-ctrl-surf-c=
opy.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kern=
el/-/issues/13008">i915#13008</a>)</li>
</ul></li>
<li>
<p>igt@gem_ccs@suspend-resume@linear-compressed-compfmt0-lmem0-lmem0:</p><u=
l>
<li>shard-dg2:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_19102/shard-dg2-1/igt@gem_ccs@suspend-resume@linear-compressed-comp=
fmt0-lmem0-lmem0.html">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.or=
g/tree/drm-tip/Patchwork_169493v4/shard-dg2-3/igt@gem_ccs@suspend-resume@li=
near-compressed-compfmt0-lmem0-lmem0.html">INCOMPLETE</a> (<a href=3D"https=
://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13356">i915#13356</a> / =
<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16348">i=
915#16348</a>)</li>
</ul></li>
<li>
<p>igt@gem_close_race@multigpu-basic-process:</p><ul>
<li>shard-tglu-1:       NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/Patchwork_169493v4/shard-tglu-1/igt@gem_close_race@multigpu-b=
asic-process.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/=
i915/kernel/-/issues/7697">i915#7697</a>)</li>
</ul></li>
<li>
<p>igt@gem_close_race@multigpu-basic-threads:</p><ul>
<li>shard-dg1:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/Patchwork_169493v4/shard-dg1-16/igt@gem_close_race@multigpu-b=
asic-threads.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/=
i915/kernel/-/issues/7697">i915#7697</a>)</li>
</ul></li>
<li>
<p>igt@gem_create@create-ext-set-pat:</p><ul>
<li>shard-rkl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/Patchwork_169493v4/shard-rkl-7/igt@gem_create@create-ext-set-=
pat.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kern=
el/-/issues/8562">i915#8562</a>)</li>
</ul></li>
<li>
<p>igt@gem_ctx_persistence@hang:</p><ul>
<li>shard-dg1:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/Patchwork_169493v4/shard-dg1-17/igt@gem_ctx_persistence@hang.=
html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-=
/issues/8555">i915#8555</a>)</li>
</ul></li>
<li>
<p>igt@gem_ctx_persistence@heartbeat-many:</p><ul>
<li>shard-dg2:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/Patchwork_169493v4/shard-dg2-1/igt@gem_ctx_persistence@heartb=
eat-many.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915=
/kernel/-/issues/8555">i915#8555</a>)</li>
</ul></li>
<li>
<p>igt@gem_ctx_sseu@invalid-args:</p><ul>
<li>shard-rkl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/Patchwork_169493v4/shard-rkl-3/igt@gem_ctx_sseu@invalid-args.=
html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-=
/issues/280">i915#280</a>) +1 other test skip</li>
<li>shard-tglu:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/Patchwork_169493v4/shard-tglu-7/igt@gem_ctx_sseu@invalid-args=
.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/=
-/issues/280">i915#280</a>)</li>
</ul></li>
<li>
<p>igt@gem_exec_balancer@bonded-false-hang:</p><ul>
<li>shard-dg1:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/Patchwork_169493v4/shard-dg1-17/igt@gem_exec_balancer@bonded-=
false-hang.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i9=
15/kernel/-/issues/4812">i915#4812</a>) +1 other test skip</li>
</ul></li>
<li>
<p>igt@gem_exec_balancer@bonded-pair:</p><ul>
<li>shard-dg1:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/Patchwork_169493v4/shard-dg1-16/igt@gem_exec_balancer@bonded-=
pair.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/ker=
nel/-/issues/4771">i915#4771</a>)</li>
</ul></li>
<li>
<p>igt@gem_exec_balancer@parallel-keep-submit-fence:</p><ul>
<li>shard-tglu-1:       NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/Patchwork_169493v4/shard-tglu-1/igt@gem_exec_balancer@paralle=
l-keep-submit-fence.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.o=
rg/drm/i915/kernel/-/issues/4525">i915#4525</a>)</li>
</ul></li>
<li>
<p>igt@gem_exec_flush@basic-uc-ro-default:</p><ul>
<li>shard-dg1:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/Patchwork_169493v4/shard-dg1-16/igt@gem_exec_flush@basic-uc-r=
o-default.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i91=
5/kernel/-/issues/3539">i915#3539</a> / <a href=3D"https://gitlab.freedeskt=
op.org/drm/i915/kernel/-/issues/4852">i915#4852</a>) +1 other test skip</li=
>
</ul></li>
<li>
<p>igt@gem_exec_reloc@basic-wc:</p><ul>
<li>shard-rkl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/Patchwork_169493v4/shard-rkl-7/igt@gem_exec_reloc@basic-wc.ht=
ml">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/i=
ssues/3281">i915#3281</a>) +8 other tests skip</li>
</ul></li>
<li>
<p>igt@gem_exec_reloc@basic-write-cpu-noreloc:</p><ul>
<li>shard-dg2:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/Patchwork_169493v4/shard-dg2-1/igt@gem_exec_reloc@basic-write=
-cpu-noreloc.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/=
i915/kernel/-/issues/3281">i915#3281</a>) +1 other test skip</li>
</ul></li>
<li>
<p>igt@gem_exec_reloc@basic-write-read-active:</p><ul>
<li>shard-dg1:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/Patchwork_169493v4/shard-dg1-16/igt@gem_exec_reloc@basic-writ=
e-read-active.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm=
/i915/kernel/-/issues/3281">i915#3281</a>) +3 other tests skip</li>
</ul></li>
<li>
<p>igt@gem_exec_suspend@basic-s0:</p><ul>
<li>shard-dg2:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_19102/shard-dg2-4/igt@gem_exec_suspend@basic-s0.html">PASS</a> -&gt=
; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_169493v4/sh=
ard-dg2-5/igt@gem_exec_suspend@basic-s0.html">INCOMPLETE</a> (<a href=3D"ht=
tps://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13356">i915#13356</a>=
) +1 other test incomplete</li>
</ul></li>
<li>
<p>igt@gem_huc_copy@huc-copy:</p><ul>
<li>shard-rkl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/Patchwork_169493v4/shard-rkl-4/igt@gem_huc_copy@huc-copy.html=
">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/iss=
ues/2190">i915#2190</a>)</li>
</ul></li>
<li>
<p>igt@gem_lmem_evict@dontneed-evict-race:</p><ul>
<li>shard-tglu:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/Patchwork_169493v4/shard-tglu-4/igt@gem_lmem_evict@dontneed-e=
vict-race.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i91=
5/kernel/-/issues/4613">i915#4613</a> / <a href=3D"https://gitlab.freedeskt=
op.org/drm/i915/kernel/-/issues/7582">i915#7582</a>)</li>
</ul></li>
<li>
<p>igt@gem_lmem_swapping@heavy-random:</p><ul>
<li>shard-tglu-1:       NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/Patchwork_169493v4/shard-tglu-1/igt@gem_lmem_swapping@heavy-r=
andom.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/ke=
rnel/-/issues/4613">i915#4613</a>)</li>
</ul></li>
<li>
<p>igt@gem_lmem_swapping@massive:</p><ul>
<li>shard-rkl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/Patchwork_169493v4/shard-rkl-3/igt@gem_lmem_swapping@massive.=
html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-=
/issues/4613">i915#4613</a>) +1 other test skip</li>
</ul></li>
<li>
<p>igt@gem_lmem_swapping@random:</p><ul>
<li>shard-glk:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/Patchwork_169493v4/shard-glk1/igt@gem_lmem_swapping@random.ht=
ml">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/i=
ssues/4613">i915#4613</a>) +2 other tests skip</li>
</ul></li>
<li>
<p>igt@gem_lmem_swapping@verify-ccs:</p><ul>
<li>shard-dg1:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/Patchwork_169493v4/shard-dg1-17/igt@gem_lmem_swapping@verify-=
ccs.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kern=
el/-/issues/12193">i915#12193</a>)</li>
<li>shard-tglu:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/Patchwork_169493v4/shard-tglu-4/igt@gem_lmem_swapping@verify-=
ccs.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kern=
el/-/issues/4613">i915#4613</a>) +1 other test skip</li>
</ul></li>
<li>
<p>igt@gem_lmem_swapping@verify-ccs@lmem0:</p><ul>
<li>shard-dg1:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/Patchwork_169493v4/shard-dg1-17/igt@gem_lmem_swapping@verify-=
ccs@lmem0.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i91=
5/kernel/-/issues/4565">i915#4565</a>)</li>
</ul></li>
<li>
<p>igt@gem_mmap_gtt@cpuset-basic-small-copy-xy:</p><ul>
<li>shard-dg2:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/Patchwork_169493v4/shard-dg2-1/igt@gem_mmap_gtt@cpuset-basic-=
small-copy-xy.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm=
/i915/kernel/-/issues/4077">i915#4077</a>) +2 other tests skip</li>
</ul></li>
<li>
<p>igt@gem_mmap_wc@write-prefaulted:</p><ul>
<li>shard-dg2:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/Patchwork_169493v4/shard-dg2-8/igt@gem_mmap_wc@write-prefault=
ed.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kerne=
l/-/issues/4083">i915#4083</a>) +1 other test skip</li>
</ul></li>
<li>
<p>igt@gem_mmap_wc@write-read:</p><ul>
<li>shard-dg1:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/Patchwork_169493v4/shard-dg1-17/igt@gem_mmap_wc@write-read.ht=
ml">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/i=
ssues/4083">i915#4083</a>) +2 other tests skip</li>
</ul></li>
<li>
<p>igt@gem_partial_pwrite_pread@writes-after-reads-snoop:</p><ul>
<li>shard-dg2:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/Patchwork_169493v4/shard-dg2-1/igt@gem_partial_pwrite_pread@w=
rites-after-reads-snoop.html">SKIP</a> (<a href=3D"https://gitlab.freedeskt=
op.org/drm/i915/kernel/-/issues/3282">i915#3282</a>) +2 other tests skip</l=
i>
</ul></li>
<li>
<p>igt@gem_pwrite_snooped:</p><ul>
<li>shard-dg1:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/Patchwork_169493v4/shard-dg1-16/igt@gem_pwrite_snooped.html">=
SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issue=
s/3282">i915#3282</a>)</li>
</ul></li>
<li>
<p>igt@gem_pxp@dmabuf-shared-protected-dst-is-context-refcounted:</p><ul>
<li>shard-dg1:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/Patchwork_169493v4/shard-dg1-17/igt@gem_pxp@dmabuf-shared-pro=
tected-dst-is-context-refcounted.html">SKIP</a> (<a href=3D"https://gitlab.=
freedesktop.org/drm/i915/kernel/-/issues/4270">i915#4270</a>)</li>
</ul></li>
<li>
<p>igt@gem_pxp@verify-pxp-execution-after-suspend-resume:</p><ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_19102/shard-rkl-6/igt@gem_pxp@verify-pxp-execution-after-suspend-re=
sume.html">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-t=
ip/Patchwork_169493v4/shard-rkl-1/igt@gem_pxp@verify-pxp-execution-after-su=
spend-resume.html">ABORT</a> (<a href=3D"https://gitlab.freedesktop.org/drm=
/i915/kernel/-/issues/15131">i915#15131</a>)</li>
</ul></li>
<li>
<p>igt@gem_render_copy@y-tiled-ccs-to-y-tiled-ccs:</p><ul>
<li>shard-dg2:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/Patchwork_169493v4/shard-dg2-1/igt@gem_render_copy@y-tiled-cc=
s-to-y-tiled-ccs.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/=
drm/i915/kernel/-/issues/5190">i915#5190</a> / <a href=3D"https://gitlab.fr=
eedesktop.org/drm/i915/kernel/-/issues/8428">i915#8428</a>) +1 other test s=
kip</li>
</ul></li>
<li>
<p>igt@gem_render_copy@y-tiled-ccs-to-y-tiled-mc-ccs:</p><ul>
<li>shard-glk:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/Patchwork_169493v4/shard-glk1/igt@gem_render_copy@y-tiled-ccs=
-to-y-tiled-mc-ccs.html">SKIP</a> +355 other tests skip</li>
</ul></li>
<li>
<p>igt@gem_set_tiling_vs_pwrite:</p><ul>
<li>shard-rkl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/Patchwork_169493v4/shard-rkl-3/igt@gem_set_tiling_vs_pwrite.h=
tml">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/=
issues/3282">i915#3282</a>) +5 other tests skip</li>
</ul></li>
<li>
<p>igt@gem_softpin@evict-snoop-interruptible:</p><ul>
<li>shard-dg1:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/Patchwork_169493v4/shard-dg1-17/igt@gem_softpin@evict-snoop-i=
nterruptible.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/=
i915/kernel/-/issues/4885">i915#4885</a>)</li>
</ul></li>
<li>
<p>igt@gem_tiled_pread_pwrite:</p><ul>
<li>shard-dg1:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/Patchwork_169493v4/shard-dg1-17/igt@gem_tiled_pread_pwrite.ht=
ml">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/i=
ssues/4079">i915#4079</a>) +1 other test skip</li>
</ul></li>
<li>
<p>igt@gem_userptr_blits@access-control:</p><ul>
<li>shard-dg2:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/Patchwork_169493v4/shard-dg2-1/igt@gem_userptr_blits@access-c=
ontrol.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/k=
ernel/-/issues/3297">i915#3297</a>)</li>
</ul></li>
<li>
<p>igt@gem_userptr_blits@coherency-unsync:</p><ul>
<li>shard-rkl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/Patchwork_169493v4/shard-rkl-4/igt@gem_userptr_blits@coherenc=
y-unsync.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915=
/kernel/-/issues/3297">i915#3297</a>) +1 other test skip</li>
</ul></li>
<li>
<p>igt@gem_userptr_blits@invalid-mmap-offset-unsync:</p><ul>
<li>shard-tglu:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/Patchwork_169493v4/shard-tglu-4/igt@gem_userptr_blits@invalid=
-mmap-offset-unsync.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.o=
rg/drm/i915/kernel/-/issues/3297">i915#3297</a>)</li>
</ul></li>
<li>
<p>igt@gem_userptr_blits@map-fixed-invalidate-busy:</p><ul>
<li>shard-dg2:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/Patchwork_169493v4/shard-dg2-1/igt@gem_userptr_blits@map-fixe=
d-invalidate-busy.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org=
/drm/i915/kernel/-/issues/3297">i915#3297</a> / <a href=3D"https://gitlab.f=
reedesktop.org/drm/i915/kernel/-/issues/4880">i915#4880</a>)</li>
</ul></li>
<li>
<p>igt@gem_userptr_blits@readonly-pwrite-unsync:</p><ul>
<li>shard-dg1:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/Patchwork_169493v4/shard-dg1-16/igt@gem_userptr_blits@readonl=
y-pwrite-unsync.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/d=
rm/i915/kernel/-/issues/3297">i915#3297</a>) +1 other test skip</li>
</ul></li>
<li>
<p>igt@gem_userptr_blits@readonly-unsync:</p><ul>
<li>shard-tglu-1:       NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/Patchwork_169493v4/shard-tglu-1/igt@gem_userptr_blits@readonl=
y-unsync.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915=
/kernel/-/issues/3297">i915#3297</a>)</li>
</ul></li>
<li>
<p>igt@gen9_exec_parse@batch-without-end:</p><ul>
<li>shard-rkl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/Patchwork_169493v4/shard-rkl-7/igt@gen9_exec_parse@batch-with=
out-end.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/=
kernel/-/issues/2527">i915#2527</a>) +1 other test skip</li>
</ul></li>
<li>
<p>igt@gen9_exec_parse@bb-chained:</p><ul>
<li>shard-tglu-1:       NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/Patchwork_169493v4/shard-tglu-1/igt@gen9_exec_parse@bb-chaine=
d.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel=
/-/issues/2527">i915#2527</a> / <a href=3D"https://gitlab.freedesktop.org/d=
rm/i915/kernel/-/issues/2856">i915#2856</a>)</li>
</ul></li>
<li>
<p>igt@gen9_exec_parse@bb-start-out:</p><ul>
<li>shard-dg1:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/Patchwork_169493v4/shard-dg1-17/igt@gen9_exec_parse@bb-start-=
out.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kern=
el/-/issues/2527">i915#2527</a>) +2 other tests skip</li>
<li>shard-tglu:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/Patchwork_169493v4/shard-tglu-4/igt@gen9_exec_parse@bb-start-=
out.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kern=
el/-/issues/2527">i915#2527</a> / <a href=3D"https://gitlab.freedesktop.org=
/drm/i915/kernel/-/issues/2856">i915#2856</a>)</li>
</ul></li>
<li>
<p>igt@i915_drm_fdinfo@all-busy-idle-check-all:</p><ul>
<li>shard-dg2:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/Patchwork_169493v4/shard-dg2-1/igt@i915_drm_fdinfo@all-busy-i=
dle-check-all.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm=
/i915/kernel/-/issues/14123">i915#14123</a>)</li>
</ul></li>
<li>
<p>igt@i915_drm_fdinfo@busy-check-all:</p><ul>
<li>shard-dg1:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/Patchwork_169493v4/shard-dg1-17/igt@i915_drm_fdinfo@busy-chec=
k-all.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/ke=
rnel/-/issues/11527">i915#11527</a>) +5 other tests skip</li>
</ul></li>
<li>
<p>igt@i915_drm_fdinfo@virtual-busy-hang-all:</p><ul>
<li>shard-dg1:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/Patchwork_169493v4/shard-dg1-17/igt@i915_drm_fdinfo@virtual-b=
usy-hang-all.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/=
i915/kernel/-/issues/14118">i915#14118</a>)</li>
</ul></li>
<li>
<p>igt@i915_drm_fdinfo@virtual-busy-idle:</p><ul>
<li>shard-dg2:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/Patchwork_169493v4/shard-dg2-1/igt@i915_drm_fdinfo@virtual-bu=
sy-idle.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/=
kernel/-/issues/14118">i915#14118</a>)</li>
</ul></li>
<li>
<p>igt@i915_module_load@reload:</p><ul>
<li>shard-dg1:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/Patchwork_169493v4/shard-dg1-16/igt@i915_module_load@reload.h=
tml">DMESG-WARN</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/ker=
nel/-/issues/14545">i915#14545</a>)</li>
</ul></li>
<li>
<p>igt@i915_pm_freq_api@freq-reset-multiple:</p><ul>
<li>shard-tglu:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/Patchwork_169493v4/shard-tglu-4/igt@i915_pm_freq_api@freq-res=
et-multiple.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i=
915/kernel/-/issues/8399">i915#8399</a>)</li>
</ul></li>
<li>
<p>igt@i915_pm_rc6_residency@media-rc6-accuracy:</p><ul>
<li>shard-dg2:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/Patchwork_169493v4/shard-dg2-1/igt@i915_pm_rc6_residency@medi=
a-rc6-accuracy.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/dr=
m/i915/kernel/-/issues/16080">i915#16080</a> / <a href=3D"https://gitlab.fr=
eedesktop.org/drm/i915/kernel/-/issues/16166">i915#16166</a>)</li>
</ul></li>
<li>
<p>igt@i915_pm_rpm@system-suspend:</p><ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_19102/shard-rkl-4/igt@i915_pm_rpm@system-suspend.html">PASS</a> -&g=
t; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_169493v4/s=
hard-rkl-6/igt@i915_pm_rpm@system-suspend.html">INCOMPLETE</a> (<a href=3D"=
https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13356">i915#13356</=
a>)</li>
</ul></li>
<li>
<p>igt@i915_pm_rpm@system-suspend-execbuf:</p><ul>
<li>shard-rkl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/Patchwork_169493v4/shard-rkl-7/igt@i915_pm_rpm@system-suspend=
-execbuf.html">INCOMPLETE</a> (<a href=3D"https://gitlab.freedesktop.org/dr=
m/i915/kernel/-/issues/13356">i915#13356</a>)</li>
</ul></li>
<li>
<p>igt@i915_pm_rps@min-max-config-idle:</p><ul>
<li>shard-dg1:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/Patchwork_169493v4/shard-dg1-16/igt@i915_pm_rps@min-max-confi=
g-idle.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/k=
ernel/-/issues/11681">i915#11681</a> / <a href=3D"https://gitlab.freedeskto=
p.org/drm/i915/kernel/-/issues/6621">i915#6621</a>)</li>
</ul></li>
<li>
<p>igt@i915_pm_rps@thresholds-park:</p><ul>
<li>shard-dg1:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/Patchwork_169493v4/shard-dg1-16/igt@i915_pm_rps@thresholds-pa=
rk.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kerne=
l/-/issues/11681">i915#11681</a>)</li>
</ul></li>
<li>
<p>igt@i915_power@sanity:</p><ul>
<li>shard-mtlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_19102/shard-mtlp-6/igt@i915_power@sanity.html">PASS</a> -&gt; <a hr=
ef=3D"https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_169493v4/shard-mtl=
p-8/igt@i915_power@sanity.html">SKIP</a> (<a href=3D"https://gitlab.freedes=
ktop.org/drm/i915/kernel/-/issues/7984">i915#7984</a>)</li>
</ul></li>
<li>
<p>igt@i915_query@test-query-geometry-subslices:</p><ul>
<li>shard-rkl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/Patchwork_169493v4/shard-rkl-4/igt@i915_query@test-query-geom=
etry-subslices.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/dr=
m/i915/kernel/-/issues/5723">i915#5723</a>)</li>
</ul></li>
<li>
<p>igt@i915_suspend@fence-restore-untiled:</p><ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_19102/shard-rkl-4/igt@i915_suspend@fence-restore-untiled.html">PASS=
</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_16=
9493v4/shard-rkl-6/igt@i915_suspend@fence-restore-untiled.html">INCOMPLETE<=
/a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/481=
7">i915#4817</a>)</li>
</ul></li>
<li>
<p>igt@intel_hwmon@hwmon-write:</p><ul>
<li>shard-rkl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/Patchwork_169493v4/shard-rkl-7/igt@intel_hwmon@hwmon-write.ht=
ml">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/i=
ssues/7707">i915#7707</a>)</li>
</ul></li>
<li>
<p>igt@kms_addfb_basic@clobberred-modifier:</p><ul>
<li>shard-dg1:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/Patchwork_169493v4/shard-dg1-16/igt@kms_addfb_basic@clobberre=
d-modifier.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i9=
15/kernel/-/issues/4212">i915#4212</a>)</li>
</ul></li>
<li>
<p>igt@kms_addfb_basic@invalid-smem-bo-on-discrete:</p><ul>
<li>shard-tglu-1:       NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/Patchwork_169493v4/shard-tglu-1/igt@kms_addfb_basic@invalid-s=
mem-bo-on-discrete.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.or=
g/drm/i915/kernel/-/issues/12454">i915#12454</a> / <a href=3D"https://gitla=
b.freedesktop.org/drm/i915/kernel/-/issues/12712">i915#12712</a>)</li>
</ul></li>
<li>
<p>igt@kms_async_flips@async-flip-suspend-resume:</p><ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_19102/shard-rkl-2/igt@kms_async_flips@async-flip-suspend-resume.htm=
l">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/Patch=
work_169493v4/shard-rkl-3/igt@kms_async_flips@async-flip-suspend-resume.htm=
l">INCOMPLETE</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kerne=
l/-/issues/12761">i915#12761</a>)</li>
</ul></li>
<li>
<p>igt@kms_async_flips@async-flip-suspend-resume@pipe-b-hdmi-a-2:</p><ul>
<li>shard-rkl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/Patchwork_169493v4/shard-rkl-3/igt@kms_async_flips@async-flip=
-suspend-resume@pipe-b-hdmi-a-2.html">INCOMPLETE</a> (<a href=3D"https://gi=
tlab.freedesktop.org/drm/i915/kernel/-/issues/12761">i915#12761</a>)</li>
</ul></li>
<li>
<p>igt@kms_atomic@plane-primary-overlay-mutable-zpos:</p><ul>
<li>shard-rkl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/Patchwork_169493v4/shard-rkl-7/igt@kms_atomic@plane-primary-o=
verlay-mutable-zpos.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.o=
rg/drm/i915/kernel/-/issues/9531">i915#9531</a>)</li>
</ul></li>
<li>
<p>igt@kms_atomic_transition@plane-all-modeset-transition@pipe-b-hdmi-a-1:<=
/p><ul>
<li>shard-tglu:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/Patchwork_169493v4/shard-tglu-7/igt@kms_atomic_transition@pla=
ne-all-modeset-transition@pipe-b-hdmi-a-1.html">ABORT</a> (<a href=3D"https=
://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16837">i915#16837</a> / =
<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16866">i=
915#16866</a>) +1 other test abort</li>
</ul></li>
<li>
<p>igt@kms_atomic_transition@plane-toggle-modeset-transition@pipe-a-edp-1:<=
/p><ul>
<li>shard-mtlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_19102/shard-mtlp-8/igt@kms_atomic_transition@plane-toggle-modeset-t=
ransition@pipe-a-edp-1.html">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci=
.01.org/tree/drm-tip/Patchwork_169493v4/shard-mtlp-8/igt@kms_atomic_transit=
ion@plane-toggle-modeset-transition@pipe-a-edp-1.html">FAIL</a> (<a href=3D=
"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5956">i915#5956</a=
>) +1 other test fail</li>
</ul></li>
<li>
<p>igt@kms_big_fb@4-tiled-8bpp-rotate-180:</p><ul>
<li>shard-tglu-1:       NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/Patchwork_169493v4/shard-tglu-1/igt@kms_big_fb@4-tiled-8bpp-r=
otate-180.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i91=
5/kernel/-/issues/5286">i915#5286</a>) +2 other tests skip</li>
</ul></li>
<li>
<p>igt@kms_big_fb@4-tiled-max-hw-stride-32bpp-rotate-0-async-flip:</p><ul>
<li>shard-tglu:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/Patchwork_169493v4/shard-tglu-4/igt@kms_big_fb@4-tiled-max-hw=
-stride-32bpp-rotate-0-async-flip.html">SKIP</a> (<a href=3D"https://gitlab=
.freedesktop.org/drm/i915/kernel/-/issues/5286">i915#5286</a>) +4 other tes=
ts skip</li>
</ul></li>
<li>
<p>igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-0-hflip:</p><ul>
<li>shard-rkl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/Patchwork_169493v4/shard-rkl-7/igt@kms_big_fb@4-tiled-max-hw-=
stride-64bpp-rotate-0-hflip.html">SKIP</a> (<a href=3D"https://gitlab.freed=
esktop.org/drm/i915/kernel/-/issues/5286">i915#5286</a>) +4 other tests ski=
p</li>
<li>shard-dg1:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/Patchwork_169493v4/shard-dg1-16/igt@kms_big_fb@4-tiled-max-hw=
-stride-64bpp-rotate-0-hflip.html">SKIP</a> (<a href=3D"https://gitlab.free=
desktop.org/drm/i915/kernel/-/issues/4538">i915#4538</a> / <a href=3D"https=
://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5286">i915#5286</a>) +3 =
other tests skip</li>
</ul></li>
<li>
<p>igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-180-hflip:</p><ul>
<li>shard-mtlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_19102/shard-mtlp-4/igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotat=
e-180-hflip.html">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tre=
e/drm-tip/Patchwork_169493v4/shard-mtlp-7/igt@kms_big_fb@4-tiled-max-hw-str=
ide-64bpp-rotate-180-hflip.html">FAIL</a> (<a href=3D"https://gitlab.freede=
sktop.org/drm/i915/kernel/-/issues/15733">i915#15733</a> / <a href=3D"https=
://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5138">i915#5138</a>)</li=
>
</ul></li>
<li>
<p>igt@kms_big_fb@linear-8bpp-rotate-270:</p><ul>
<li>shard-dg1:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/Patchwork_169493v4/shard-dg1-17/igt@kms_big_fb@linear-8bpp-ro=
tate-270.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915=
/kernel/-/issues/3638">i915#3638</a>) +4 other tests skip</li>
</ul></li>
<li>
<p>igt@kms_big_fb@linear-max-hw-stride-32bpp-rotate-0-hflip:</p><ul>
<li>shard-rkl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/Patchwork_169493v4/shard-rkl-7/igt@kms_big_fb@linear-max-hw-s=
tride-32bpp-rotate-0-hflip.html">SKIP</a> (<a href=3D"https://gitlab.freede=
sktop.org/drm/i915/kernel/-/issues/3828">i915#3828</a>)</li>
</ul></li>
<li>
<p>igt@kms_big_fb@linear-max-hw-stride-64bpp-rotate-180-hflip:</p><ul>
<li>shard-tglu-1:       NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/Patchwork_169493v4/shard-tglu-1/igt@kms_big_fb@linear-max-hw-=
stride-64bpp-rotate-180-hflip.html">SKIP</a> (<a href=3D"https://gitlab.fre=
edesktop.org/drm/i915/kernel/-/issues/3828">i915#3828</a>) +1 other test sk=
ip</li>
</ul></li>
<li>
<p>igt@kms_big_fb@y-tiled-64bpp-rotate-90:</p><ul>
<li>shard-rkl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/Patchwork_169493v4/shard-rkl-3/igt@kms_big_fb@y-tiled-64bpp-r=
otate-90.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915=
/kernel/-/issues/3638">i915#3638</a>) +1 other test skip</li>
</ul></li>
<li>
<p>igt@kms_big_fb@yf-tiled-16bpp-rotate-270:</p><ul>
<li>shard-dg1:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/Patchwork_169493v4/shard-dg1-16/igt@kms_big_fb@yf-tiled-16bpp=
-rotate-270.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i=
915/kernel/-/issues/4538">i915#4538</a>) +3 other tests skip</li>
</ul></li>
<li>
<p>igt@kms_big_fb@yf-tiled-8bpp-rotate-0:</p><ul>
<li>shard-dg2:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/Patchwork_169493v4/shard-dg2-8/igt@kms_big_fb@yf-tiled-8bpp-r=
otate-0.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/=
kernel/-/issues/4538">i915#4538</a> / <a href=3D"https://gitlab.freedesktop=
.org/drm/i915/kernel/-/issues/5190">i915#5190</a>) +3 other tests skip</li>
</ul></li>
<li>
<p>igt@kms_ccs@bad-aux-stride-y-tiled-gen12-rc-ccs@pipe-d-hdmi-a-1:</p><ul>
<li>shard-dg2:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/Patchwork_169493v4/shard-dg2-4/igt@kms_ccs@bad-aux-stride-y-t=
iled-gen12-rc-ccs@pipe-d-hdmi-a-1.html">SKIP</a> (<a href=3D"https://gitlab=
.freedesktop.org/drm/i915/kernel/-/issues/10307">i915#10307</a> / <a href=
=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/10434">i915#104=
34</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues=
/6095">i915#6095</a>) +4 other tests skip</li>
</ul></li>
<li>
<p>igt@kms_ccs@crc-primary-basic-4-tiled-dg2-rc-ccs-cc@pipe-a-hdmi-a-1:</p>=
<ul>
<li>shard-tglu-1:       NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/Patchwork_169493v4/shard-tglu-1/igt@kms_ccs@crc-primary-basic=
-4-tiled-dg2-rc-ccs-cc@pipe-a-hdmi-a-1.html">SKIP</a> (<a href=3D"https://g=
itlab.freedesktop.org/drm/i915/kernel/-/issues/6095">i915#6095</a>) +24 oth=
er tests skip</li>
</ul></li>
<li>
<p>igt@kms_ccs@crc-primary-basic-4-tiled-lnl-ccs:</p><ul>
<li>shard-dg1:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/Patchwork_169493v4/shard-dg1-16/igt@kms_ccs@crc-primary-basic=
-4-tiled-lnl-ccs.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/=
drm/i915/kernel/-/issues/12313">i915#12313</a>)</li>
</ul></li>
<li>
<p>igt@kms_ccs@crc-primary-rotation-180-4-tiled-bmg-ccs:</p><ul>
<li>shard-tglu-1:       NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/Patchwork_169493v4/shard-tglu-1/igt@kms_ccs@crc-primary-rotat=
ion-180-4-tiled-bmg-ccs.html">SKIP</a> (<a href=3D"https://gitlab.freedeskt=
op.org/drm/i915/kernel/-/issues/12313">i915#12313</a>) +1 other test skip</=
li>
</ul></li>
<li>
<p>igt@kms_ccs@crc-primary-rotation-180-y-tiled-ccs@pipe-a-hdmi-a-3:</p><ul=
>
<li>shard-dg1:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/Patchwork_169493v4/shard-dg1-12/igt@kms_ccs@crc-primary-rotat=
ion-180-y-tiled-ccs@pipe-a-hdmi-a-3.html">SKIP</a> (<a href=3D"https://gitl=
ab.freedesktop.org/drm/i915/kernel/-/issues/6095">i915#6095</a>) +132 other=
 tests skip</li>
</ul></li>
<li>
<p>igt@kms_ccs@crc-primary-rotation-180-y-tiled-gen12-rc-ccs-cc:</p><ul>
<li>shard-glk11:        NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/Patchwork_169493v4/shard-glk11/igt@kms_ccs@crc-primary-rotati=
on-180-y-tiled-gen12-rc-ccs-cc.html">SKIP</a> +83 other tests skip</li>
</ul></li>
<li>
<p>igt@kms_ccs@crc-primary-suspend-4-tiled-mtl-rc-ccs@pipe-a-hdmi-a-3:</p><=
ul>
<li>shard-dg2:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/Patchwork_169493v4/shard-dg2-1/igt@kms_ccs@crc-primary-suspen=
d-4-tiled-mtl-rc-ccs@pipe-a-hdmi-a-3.html">SKIP</a> (<a href=3D"https://git=
lab.freedesktop.org/drm/i915/kernel/-/issues/6095">i915#6095</a>) +12 other=
 tests skip</li>
</ul></li>
<li>
<p>igt@kms_ccs@crc-primary-suspend-yf-tiled-ccs:</p><ul>
<li>shard-glk:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/Patchwork_169493v4/shard-glk1/igt@kms_ccs@crc-primary-suspend=
-yf-tiled-ccs.html">INCOMPLETE</a> (<a href=3D"https://gitlab.freedesktop.o=
rg/drm/i915/kernel/-/issues/14694">i915#14694</a> / <a href=3D"https://gitl=
ab.freedesktop.org/drm/i915/kernel/-/issues/15582">i915#15582</a>) +1 other=
 test incomplete</li>
</ul></li>
<li>
<p>igt@kms_ccs@crc-primary-suspend-yf-tiled-ccs@pipe-c-hdmi-a-2:</p><ul>
<li>shard-rkl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/Patchwork_169493v4/shard-rkl-7/igt@kms_ccs@crc-primary-suspen=
d-yf-tiled-ccs@pipe-c-hdmi-a-2.html">SKIP</a> (<a href=3D"https://gitlab.fr=
eedesktop.org/drm/i915/kernel/-/issues/14098">i915#14098</a> / <a href=3D"h=
ttps://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6095">i915#6095</a>)=
 +35 other tests skip</li>
</ul></li>
<li>
<p>igt@kms_ccs@crc-sprite-planes-basic-4-tiled-bmg-ccs:</p><ul>
<li>shard-tglu:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/Patchwork_169493v4/shard-tglu-7/igt@kms_ccs@crc-sprite-planes=
-basic-4-tiled-bmg-ccs.html">SKIP</a> (<a href=3D"https://gitlab.freedeskto=
p.org/drm/i915/kernel/-/issues/12313">i915#12313</a>) +2 other tests skip</=
li>
</ul></li>
<li>
<p>igt@kms_ccs@crc-sprite-planes-basic-4-tiled-lnl-ccs:</p><ul>
<li>shard-rkl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/Patchwork_169493v4/shard-rkl-3/igt@kms_ccs@crc-sprite-planes-=
basic-4-tiled-lnl-ccs.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop=
.org/drm/i915/kernel/-/issues/12313">i915#12313</a>) +2 other tests skip</l=
i>
</ul></li>
<li>
<p>igt@kms_ccs@crc-sprite-planes-basic-4-tiled-mtl-mc-ccs@pipe-a-hdmi-a-3:<=
/p><ul>
<li>shard-dg2:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/Patchwork_169493v4/shard-dg2-5/igt@kms_ccs@crc-sprite-planes-=
basic-4-tiled-mtl-mc-ccs@pipe-a-hdmi-a-3.html">SKIP</a> (<a href=3D"https:/=
/gitlab.freedesktop.org/drm/i915/kernel/-/issues/10307">i915#10307</a> / <a=
 href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6095">i915=
#6095</a>) +99 other tests skip</li>
</ul></li>
<li>
<p>igt@kms_ccs@missing-ccs-buffer-4-tiled-mtl-mc-ccs@pipe-d-hdmi-a-1:</p><u=
l>
<li>shard-tglu:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/Patchwork_169493v4/shard-tglu-4/igt@kms_ccs@missing-ccs-buffe=
r-4-tiled-mtl-mc-ccs@pipe-d-hdmi-a-1.html">SKIP</a> (<a href=3D"https://git=
lab.freedesktop.org/drm/i915/kernel/-/issues/6095">i915#6095</a>) +44 other=
 tests skip</li>
</ul></li>
<li>
<p>igt@kms_ccs@random-ccs-data-4-tiled-mtl-rc-ccs@pipe-b-hdmi-a-2:</p><ul>
<li>shard-rkl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/Patchwork_169493v4/shard-rkl-7/igt@kms_ccs@random-ccs-data-4-=
tiled-mtl-rc-ccs@pipe-b-hdmi-a-2.html">SKIP</a> (<a href=3D"https://gitlab.=
freedesktop.org/drm/i915/kernel/-/issues/6095">i915#6095</a>) +59 other tes=
ts skip</li>
</ul></li>
<li>
<p>igt@kms_cdclk@mode-transition:</p><ul>
<li>shard-rkl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/Patchwork_169493v4/shard-rkl-4/igt@kms_cdclk@mode-transition.=
html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-=
/issues/3742">i915#3742</a>)</li>
</ul></li>
<li>
<p>igt@kms_cdclk@mode-transition@pipe-d-hdmi-a-1:</p><ul>
<li>shard-dg2:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/Patchwork_169493v4/shard-dg2-4/igt@kms_cdclk@mode-transition@=
pipe-d-hdmi-a-1.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/d=
rm/i915/kernel/-/issues/13781">i915#13781</a>) +3 other tests skip</li>
</ul></li>
<li>
<p>igt@kms_chamelium_audio@dp-audio-edid:</p><ul>
<li>shard-dg2:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/Patchwork_169493v4/shard-dg2-1/igt@kms_chamelium_audio@dp-aud=
io-edid.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/=
kernel/-/issues/11151">i915#11151</a> / <a href=3D"https://gitlab.freedeskt=
op.org/drm/i915/kernel/-/issues/7828">i915#7828</a>) +1 other test skip</li=
>
</ul></li>
<li>
<p>igt@kms_chamelium_color@ctm-green-to-red:</p><ul>
<li>shard-dg2:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/Patchwork_169493v4/shard-dg2-1/igt@kms_chamelium_color@ctm-gr=
een-to-red.html">SKIP</a> +2 other tests skip</li>
</ul></li>
<li>
<p>igt@kms_chamelium_color_pipeline@plane-lut1d-ctm3x4-lut1d:</p><ul>
<li>shard-dg1:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/Patchwork_169493v4/shard-dg1-16/igt@kms_chamelium_color_pipel=
ine@plane-lut1d-ctm3x4-lut1d.html">SKIP</a> (<a href=3D"https://gitlab.free=
desktop.org/drm/i915/kernel/-/issues/16471">i915#16471</a>)</li>
</ul></li>
<li>
<p>igt@kms_chamelium_color_pipeline@plane-lut1d-pre-ctm3x4:</p><ul>
<li>shard-rkl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/Patchwork_169493v4/shard-rkl-3/igt@kms_chamelium_color_pipeli=
ne@plane-lut1d-pre-ctm3x4.html">SKIP</a> (<a href=3D"https://gitlab.freedes=
ktop.org/drm/i915/kernel/-/issues/16471">i915#16471</a>) +1 other test skip=
</li>
<li>shard-tglu:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/Patchwork_169493v4/shard-tglu-7/igt@kms_chamelium_color_pipel=
ine@plane-lut1d-pre-ctm3x4.html">SKIP</a> (<a href=3D"https://gitlab.freede=
sktop.org/drm/i915/kernel/-/issues/16471">i915#16471</a>)</li>
</ul></li>
<li>
<p>igt@kms_chamelium_hpd@vga-hpd-fast:</p><ul>
<li>shard-rkl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/Patchwork_169493v4/shard-rkl-7/igt@kms_chamelium_hpd@vga-hpd-=
fast.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/ker=
nel/-/issues/11151">i915#11151</a> / <a href=3D"https://gitlab.freedesktop.=
org/drm/i915/kernel/-/issues/7828">i915#7828</a>) +1 other test skip</li>
<li>shard-dg1:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/Patchwork_169493v4/shard-dg1-16/igt@kms_chamelium_hpd@vga-hpd=
-fast.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/ke=
rnel/-/issues/11151">i915#11151</a> / <a href=3D"https://gitlab.freedesktop=
.org/drm/i915/kernel/-/issues/7828">i915#7828</a>) +8 other tests skip</li>
<li>shard-tglu:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/Patchwork_169493v4/shard-tglu-2/igt@kms_chamelium_hpd@vga-hpd=
-fast.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/ke=
rnel/-/issues/11151">i915#11151</a> / <a href=3D"https://gitlab.freedesktop=
.org/drm/i915/kernel/-/issues/7828">i915#7828</a>) +7 other tests skip</li>
</ul></li>
<li>
<p>igt@kms_chamelium_hpd@vga-hpd-for-each-pipe:</p><ul>
<li>shard-tglu-1:       NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/Patchwork_169493v4/shard-tglu-1/igt@kms_chamelium_hpd@vga-hpd=
-for-each-pipe.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/dr=
m/i915/kernel/-/issues/11151">i915#11151</a> / <a href=3D"https://gitlab.fr=
eedesktop.org/drm/i915/kernel/-/issues/7828">i915#7828</a>) +6 other tests =
skip</li>
</ul></li>
<li>
<p>igt@kms_color@deep-color:</p><ul>
<li>shard-dg2:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/Patchwork_169493v4/shard-dg2-1/igt@kms_color@deep-color.html"=
>SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issu=
es/12655">i915#12655</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i9=
15/kernel/-/issues/3555">i915#3555</a>)</li>
</ul></li>
<li>
<p>igt@kms_content_protection@content-type-change:</p><ul>
<li>shard-tglu:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/Patchwork_169493v4/shard-tglu-7/igt@kms_content_protection@co=
ntent-type-change.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org=
/drm/i915/kernel/-/issues/15865">i915#15865</a>) +2 other tests skip</li>
</ul></li>
<li>
<p>igt@kms_content_protection@dp-mst-lic-type-0:</p><ul>
<li>shard-tglu-1:       NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/Patchwork_169493v4/shard-tglu-1/igt@kms_content_protection@dp=
-mst-lic-type-0.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/d=
rm/i915/kernel/-/issues/15330">i915#15330</a> / <a href=3D"https://gitlab.f=
reedesktop.org/drm/i915/kernel/-/issues/3116">i915#3116</a> / <a href=3D"ht=
tps://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3299">i915#3299</a>)<=
/li>
</ul></li>
<li>
<p>igt@kms_content_protection@dp-mst-lic-type-1:</p><ul>
<li>shard-rkl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/Patchwork_169493v4/shard-rkl-7/igt@kms_content_protection@dp-=
mst-lic-type-1.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/dr=
m/i915/kernel/-/issues/15330">i915#15330</a> / <a href=3D"https://gitlab.fr=
eedesktop.org/drm/i915/kernel/-/issues/3116">i915#3116</a>)</li>
<li>shard-dg1:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/Patchwork_169493v4/shard-dg1-16/igt@kms_content_protection@dp=
-mst-lic-type-1.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/d=
rm/i915/kernel/-/issues/15330">i915#15330</a> / <a href=3D"https://gitlab.f=
reedesktop.org/drm/i915/kernel/-/issues/3299">i915#3299</a>)</li>
<li>shard-tglu:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/Patchwork_169493v4/shard-tglu-2/igt@kms_content_protection@dp=
-mst-lic-type-1.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/d=
rm/i915/kernel/-/issues/15330">i915#15330</a> / <a href=3D"https://gitlab.f=
reedesktop.org/drm/i915/kernel/-/issues/3116">i915#3116</a> / <a href=3D"ht=
tps://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3299">i915#3299</a>)<=
/li>
</ul></li>
<li>
<p>igt@kms_content_protection@dp-mst-type-0:</p><ul>
<li>shard-dg2:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/Patchwork_169493v4/shard-dg2-1/igt@kms_content_protection@dp-=
mst-type-0.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i9=
15/kernel/-/issues/15330">i915#15330</a> / <a href=3D"https://gitlab.freede=
sktop.org/drm/i915/kernel/-/issues/3299">i915#3299</a>)</li>
</ul></li>
<li>
<p>igt@kms_content_protection@dp-mst-type-1-suspend-resume:</p><ul>
<li>shard-dg2:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/Patchwork_169493v4/shard-dg2-1/igt@kms_content_protection@dp-=
mst-type-1-suspend-resume.html">SKIP</a> (<a href=3D"https://gitlab.freedes=
ktop.org/drm/i915/kernel/-/issues/15330">i915#15330</a>)</li>
</ul></li>
<li>
<p>igt@kms_content_protection@legacy:</p><ul>
<li>shard-dg1:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/Patchwork_169493v4/shard-dg1-17/igt@kms_content_protection@le=
gacy.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/ker=
nel/-/issues/15865">i915#15865</a>)</li>
</ul></li>
<li>
<p>igt@kms_content_protection@legacy-hdcp14:</p><ul>
<li>shard-tglu-1:       NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/Patchwork_169493v4/shard-tglu-1/igt@kms_content_protection@le=
gacy-hdcp14.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i=
915/kernel/-/issues/15865">i915#15865</a>) +1 other test skip</li>
</ul></li>
<li>
<p>igt@kms_content_protection@srm:</p><ul>
<li>shard-rkl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/Patchwork_169493v4/shard-rkl-7/igt@kms_content_protection@srm=
.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/=
-/issues/15865">i915#15865</a>)</li>
</ul></li>
<li>
<p>igt@kms_cursor_crc@cursor-offscreen-512x170:</p><ul>
<li>shard-dg1:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/Patchwork_169493v4/shard-dg1-16/igt@kms_cursor_crc@cursor-off=
screen-512x170.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/dr=
m/i915/kernel/-/issues/13049">i915#13049</a>) +1 other test skip</li>
</ul></li>
<li>
<p>igt@kms_cursor_crc@cursor-offscreen-max-size:</p><ul>
<li>shard-tglu-1:       NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/Patchwork_169493v4/shard-tglu-1/igt@kms_cursor_crc@cursor-off=
screen-max-size.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/d=
rm/i915/kernel/-/issues/3555">i915#3555</a>)</li>
</ul></li>
<li>
<p>igt@kms_cursor_crc@cursor-onscreen-128x42:</p><ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_19102/shard-rkl-8/igt@kms_cursor_crc@cursor-onscreen-128x42.html">P=
ASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork=
_169493v4/shard-rkl-5/igt@kms_cursor_crc@cursor-onscreen-128x42.html">FAIL<=
/a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/135=
66">i915#13566</a>) +3 other tests fail</li>
</ul></li>
<li>
<p>igt@kms_cursor_crc@cursor-random-256x85@pipe-a-hdmi-a-1:</p><ul>
<li>shard-rkl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/Patchwork_169493v4/shard-rkl-8/igt@kms_cursor_crc@cursor-rand=
om-256x85@pipe-a-hdmi-a-1.html">FAIL</a> (<a href=3D"https://gitlab.freedes=
ktop.org/drm/i915/kernel/-/issues/13566">i915#13566</a>) +4 other tests fai=
l</li>
</ul></li>
<li>
<p>igt@kms_cursor_crc@cursor-random-64x21:</p><ul>
<li>shard-tglu-1:       NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/Patchwork_169493v4/shard-tglu-1/igt@kms_cursor_crc@cursor-ran=
dom-64x21.html">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i91=
5/kernel/-/issues/13566">i915#13566</a>) +1 other test fail</li>
</ul></li>
<li>
<p>igt@kms_cursor_crc@cursor-random-max-size:</p><ul>
<li>shard-rkl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/Patchwork_169493v4/shard-rkl-4/igt@kms_cursor_crc@cursor-rand=
om-max-size.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i=
915/kernel/-/issues/3555">i915#3555</a>)</li>
</ul></li>
<li>
<p>igt@kms_cursor_crc@cursor-rapid-movement-32x10:</p><ul>
<li>shard-tglu:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/Patchwork_169493v4/shard-tglu-7/igt@kms_cursor_crc@cursor-rap=
id-movement-32x10.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org=
/drm/i915/kernel/-/issues/3555">i915#3555</a>) +2 other tests skip</li>
</ul></li>
<li>
<p>igt@kms_cursor_crc@cursor-rapid-movement-512x170:</p><ul>
<li>shard-tglu-1:       NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/Patchwork_169493v4/shard-tglu-1/igt@kms_cursor_crc@cursor-rap=
id-movement-512x170.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.o=
rg/drm/i915/kernel/-/issues/13049">i915#13049</a>)</li>
</ul></li>
<li>
<p>igt@kms_cursor_crc@cursor-rapid-movement-512x512:</p><ul>
<li>shard-tglu:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/Patchwork_169493v4/shard-tglu-4/igt@kms_cursor_crc@cursor-rap=
id-movement-512x512.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.o=
rg/drm/i915/kernel/-/issues/13049">i915#13049</a>)</li>
</ul></li>
<li>
<p>igt@kms_cursor_crc@cursor-sliding-128x42@pipe-a-hdmi-a-1:</p><ul>
<li>shard-tglu:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_19102/shard-tglu-4/igt@kms_cursor_crc@cursor-sliding-128x42@pipe-a-=
hdmi-a-1.html">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/d=
rm-tip/Patchwork_169493v4/shard-tglu-10/igt@kms_cursor_crc@cursor-sliding-1=
28x42@pipe-a-hdmi-a-1.html">FAIL</a> (<a href=3D"https://gitlab.freedesktop=
.org/drm/i915/kernel/-/issues/13566">i915#13566</a>) +3 other tests fail</l=
i>
</ul></li>
<li>
<p>igt@kms_cursor_crc@cursor-sliding-512x170:</p><ul>
<li>shard-rkl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/Patchwork_169493v4/shard-rkl-7/igt@kms_cursor_crc@cursor-slid=
ing-512x170.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i=
915/kernel/-/issues/13049">i915#13049</a>)</li>
</ul></li>
<li>
<p>igt@kms_cursor_crc@cursor-suspend:</p><ul>
<li>shard-glk:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/Patchwork_169493v4/shard-glk9/igt@kms_cursor_crc@cursor-suspe=
nd.html">INCOMPLETE</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915=
/kernel/-/issues/12358">i915#12358</a> / <a href=3D"https://gitlab.freedesk=
top.org/drm/i915/kernel/-/issues/14152">i915#14152</a> / <a href=3D"https:/=
/gitlab.freedesktop.org/drm/i915/kernel/-/issues/7882">i915#7882</a>)</li>
</ul></li>
<li>
<p>igt@kms_cursor_crc@cursor-suspend@pipe-a-hdmi-a-1:</p><ul>
<li>shard-glk:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/Patchwork_169493v4/shard-glk9/igt@kms_cursor_crc@cursor-suspe=
nd@pipe-a-hdmi-a-1.html">INCOMPLETE</a> (<a href=3D"https://gitlab.freedesk=
top.org/drm/i915/kernel/-/issues/12358">i915#12358</a> / <a href=3D"https:/=
/gitlab.freedesktop.org/drm/i915/kernel/-/issues/14152">i915#14152</a>)</li=
>
</ul></li>
<li>
<p>igt@kms_cursor_edge_walk@128x128-top-edge:</p><ul>
<li>shard-dg1:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_19102/shard-dg1-15/igt@kms_cursor_edge_walk@128x128-top-edge.html">=
PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/Patchwor=
k_169493v4/shard-dg1-14/igt@kms_cursor_edge_walk@128x128-top-edge.html">DME=
SG-WARN</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/is=
sues/16685">i915#16685</a>)</li>
</ul></li>
<li>
<p>igt@kms_cursor_edge_walk@256x256-top-edge:</p><ul>
<li>shard-dg1:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_19102/shard-dg1-17/igt@kms_cursor_edge_walk@256x256-top-edge.html">=
PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/Patchwor=
k_169493v4/shard-dg1-19/igt@kms_cursor_edge_walk@256x256-top-edge.html">DME=
SG-WARN</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/is=
sues/4423">i915#4423</a>) +1 other test dmesg-warn</li>
</ul></li>
<li>
<p>igt@kms_cursor_legacy@short-busy-flip-before-cursor-atomic-transitions-v=
arying-size:</p><ul>
<li>shard-tglu-1:       NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/Patchwork_169493v4/shard-tglu-1/igt@kms_cursor_legacy@short-b=
usy-flip-before-cursor-atomic-transitions-varying-size.html">SKIP</a> (<a h=
ref=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4103">i915#4=
103</a>)</li>
</ul></li>
<li>
<p>igt@kms_cursor_legacy@short-busy-flip-before-cursor-toggle:</p><ul>
<li>shard-dg1:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/Patchwork_169493v4/shard-dg1-16/igt@kms_cursor_legacy@short-b=
usy-flip-before-cursor-toggle.html">SKIP</a> (<a href=3D"https://gitlab.fre=
edesktop.org/drm/i915/kernel/-/issues/4103">i915#4103</a>)</li>
</ul></li>
<li>
<p>igt@kms_dirtyfb@drrs-dirtyfb-ioctl:</p><ul>
<li>shard-tglu-1:       NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/Patchwork_169493v4/shard-tglu-1/igt@kms_dirtyfb@drrs-dirtyfb-=
ioctl.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/ke=
rnel/-/issues/9723">i915#9723</a>)</li>
</ul></li>
<li>
<p>igt@kms_dither@fb-8bpc-vs-panel-8bpc:</p><ul>
<li>shard-dg1:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/Patchwork_169493v4/shard-dg1-16/igt@kms_dither@fb-8bpc-vs-pan=
el-8bpc.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/=
kernel/-/issues/3555">i915#3555</a>) +3 other tests skip</li>
</ul></li>
<li>
<p>igt@kms_dp_link_training@uhbr-sst:</p><ul>
<li>shard-dg1:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/Patchwork_169493v4/shard-dg1-16/igt@kms_dp_link_training@uhbr=
-sst.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/ker=
nel/-/issues/13748">i915#13748</a>)</li>
</ul></li>
<li>
<p>igt@kms_dp_linktrain_fallback@uhbr-to-hbr-fallback:</p><ul>
<li>shard-tglu-1:       NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/Patchwork_169493v4/shard-tglu-1/igt@kms_dp_linktrain_fallback=
@uhbr-to-hbr-fallback.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop=
.org/drm/i915/kernel/-/issues/16870">i915#16870</a>)</li>
</ul></li>
<li>
<p>igt@kms_draw_crc@draw-method-mmap-gtt:</p><ul>
<li>shard-dg2:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/Patchwork_169493v4/shard-dg2-1/igt@kms_draw_crc@draw-method-m=
map-gtt.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/=
kernel/-/issues/8812">i915#8812</a>)</li>
</ul></li>
<li>
<p>igt@kms_dsc@dsc-basic:</p><ul>
<li>shard-rkl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/Patchwork_169493v4/shard-rkl-4/igt@kms_dsc@dsc-basic.html">SK=
IP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/=
16361">i915#16361</a>) +2 other tests skip</li>
</ul></li>
<li>
<p>igt@kms_dsc@dsc-basic-ultrajoiner:</p><ul>
<li>shard-tglu:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/Patchwork_169493v4/shard-tglu-4/igt@kms_dsc@dsc-basic-ultrajo=
iner.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/ker=
nel/-/issues/16361">i915#16361</a>) +1 other test skip</li>
</ul></li>
<li>
<p>igt@kms_dsc@dsc-with-bpc-bigjoiner:</p><ul>
<li>shard-dg1:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/Patchwork_169493v4/shard-dg1-16/igt@kms_dsc@dsc-with-bpc-bigj=
oiner.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/ke=
rnel/-/issues/16361">i915#16361</a>) +2 other tests skip</li>
</ul></li>
<li>
<p>igt@kms_dsc@dsc-with-formats-bigjoiner:</p><ul>
<li>shard-tglu-1:       NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/Patchwork_169493v4/shard-tglu-1/igt@kms_dsc@dsc-with-formats-=
bigjoiner.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i91=
5/kernel/-/issues/16361">i915#16361</a>) +2 other tests skip</li>
</ul></li>
<li>
<p>igt@kms_dsc@dsc-with-formats-ultrajoiner:</p><ul>
<li>shard-dg2:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/Patchwork_169493v4/shard-dg2-1/igt@kms_dsc@dsc-with-formats-u=
ltrajoiner.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i9=
15/kernel/-/issues/16361">i915#16361</a>)</li>
</ul></li>
<li>
<p>igt@kms_fbcon_fbt@psr:</p><ul>
<li>shard-rkl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/Patchwork_169493v4/shard-rkl-7/igt@kms_fbcon_fbt@psr.html">SK=
IP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/=
16680">i915#16680</a>)</li>
</ul></li>
<li>
<p>igt@kms_feature_discovery@display-3x:</p><ul>
<li>shard-rkl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/Patchwork_169493v4/shard-rkl-3/igt@kms_feature_discovery@disp=
lay-3x.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/k=
ernel/-/issues/16081">i915#16081</a>)</li>
<li>shard-tglu:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/Patchwork_169493v4/shard-tglu-7/igt@kms_feature_discovery@dis=
play-3x.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/=
kernel/-/issues/16081">i915#16081</a>)</li>
</ul></li>
<li>
<p>igt@kms_feature_discovery@psr1:</p><ul>
<li>shard-dg2:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/Patchwork_169493v4/shard-dg2-1/igt@kms_feature_discovery@psr1=
.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/=
-/issues/658">i915#658</a>)</li>
</ul></li>
<li>
<p>igt@kms_feature_discovery@psr2:</p><ul>
<li>shard-dg1:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/Patchwork_169493v4/shard-dg1-17/igt@kms_feature_discovery@psr=
2.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel=
/-/issues/658">i915#658</a>)</li>
</ul></li>
<li>
<p>igt@kms_fence_pin_leak:</p><ul>
<li>shard-dg2:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/Patchwork_169493v4/shard-dg2-1/igt@kms_fence_pin_leak.html">S=
KIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues=
/4881">i915#4881</a>)</li>
</ul></li>
<li>
<p>igt@kms_flip@2x-absolute-wf_vblank:</p><ul>
<li>shard-dg1:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/Patchwork_169493v4/shard-dg1-17/igt@kms_flip@2x-absolute-wf_v=
blank.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/ke=
rnel/-/issues/9934">i915#9934</a>) +3 other tests skip</li>
<li>shard-tglu:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/Patchwork_169493v4/shard-tglu-4/igt@kms_flip@2x-absolute-wf_v=
blank.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/ke=
rnel/-/issues/3637">i915#3637</a> / <a href=3D"https://gitlab.freedesktop.o=
rg/drm/i915/kernel/-/issues/9934">i915#9934</a>) +4 other tests skip</li>
</ul></li>
<li>
<p>igt@kms_flip@2x-absolute-wf_vblank-interruptible:</p><ul>
<li>shard-dg2:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/Patchwork_169493v4/shard-dg2-1/igt@kms_flip@2x-absolute-wf_vb=
lank-interruptible.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.or=
g/drm/i915/kernel/-/issues/9934">i915#9934</a>) +1 other test skip</li>
</ul></li>
<li>
<p>igt@kms_flip@2x-blocking-wf_vblank:</p><ul>
<li>shard-tglu-1:       NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/Patchwork_169493v4/shard-tglu-1/igt@kms_flip@2x-blocking-wf_v=
blank.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/ke=
rnel/-/issues/3637">i915#3637</a> / <a href=3D"https://gitlab.freedesktop.o=
rg/drm/i915/kernel/-/issues/9934">i915#9934</a>) +4 other tests skip</li>
</ul></li>
<li>
<p>igt@kms_flip@2x-flip-vs-dpms-on-nop-interruptible:</p><ul>
<li>shard-tglu-1:       NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/Patchwork_169493v4/shard-tglu-1/igt@kms_flip@2x-flip-vs-dpms-=
on-nop-interruptible.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.=
org/drm/i915/kernel/-/issues/9934">i915#9934</a>)</li>
</ul></li>
<li>
<p>igt@kms_flip@2x-flip-vs-fences-interruptible:</p><ul>
<li>shard-dg1:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/Patchwork_169493v4/shard-dg1-16/igt@kms_flip@2x-flip-vs-fence=
s-interruptible.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/d=
rm/i915/kernel/-/issues/8381">i915#8381</a>) +1 other test skip</li>
</ul></li>
<li>
<p>igt@kms_flip@2x-single-buffer-flip-vs-dpms-off-vs-modeset-interruptible:=
</p><ul>
<li>shard-rkl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/Patchwork_169493v4/shard-rkl-3/igt@kms_flip@2x-single-buffer-=
flip-vs-dpms-off-vs-modeset-interruptible.html">SKIP</a> (<a href=3D"https:=
//gitlab.freedesktop.org/drm/i915/kernel/-/issues/9934">i915#9934</a>) +3 o=
ther tests skip</li>
</ul></li>
<li>
<p>igt@kms_flip@flip-vs-blocking-wf-vblank@b-hdmi-a4:</p><ul>
<li>shard-dg1:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_19102/shard-dg1-19/igt@kms_flip@flip-vs-blocking-wf-vblank@b-hdmi-a=
4.html">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/=
Patchwork_169493v4/shard-dg1-16/igt@kms_flip@flip-vs-blocking-wf-vblank@b-h=
dmi-a4.html">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/k=
ernel/-/issues/10826">i915#10826</a>)</li>
</ul></li>
<li>
<p>igt@kms_flip@flip-vs-expired-vblank-interruptible:</p><ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_19102/shard-rkl-5/igt@kms_flip@flip-vs-expired-vblank-interruptible=
.html">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/P=
atchwork_169493v4/shard-rkl-3/igt@kms_flip@flip-vs-expired-vblank-interrupt=
ible.html">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/ker=
nel/-/issues/13027">i915#13027</a>)</li>
</ul></li>
<li>
<p>igt@kms_flip@flip-vs-expired-vblank-interruptible@a-hdmi-a2:</p><ul>
<li>shard-glk11:        <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_19102/shard-glk11/igt@kms_flip@flip-vs-expired-vblank-interruptible=
@a-hdmi-a2.html">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree=
/drm-tip/Patchwork_169493v4/shard-glk11/igt@kms_flip@flip-vs-expired-vblank=
-interruptible@a-hdmi-a2.html">FAIL</a> (<a href=3D"https://gitlab.freedesk=
top.org/drm/i915/kernel/-/issues/13027">i915#13027</a>)</li>
</ul></li>
<li>
<p>igt@kms_flip@flip-vs-expired-vblank-interruptible@b-hdmi-a2:</p><ul>
<li>shard-rkl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/Patchwork_169493v4/shard-rkl-3/igt@kms_flip@flip-vs-expired-v=
blank-interruptible@b-hdmi-a2.html">FAIL</a> (<a href=3D"https://gitlab.fre=
edesktop.org/drm/i915/kernel/-/issues/13027">i915#13027</a>)</li>
</ul></li>
<li>
<p>igt@kms_flip@flip-vs-expired-vblank-interruptible@c-hdmi-a3:</p><ul>
<li>shard-dg2:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_19102/shard-dg2-6/igt@kms_flip@flip-vs-expired-vblank-interruptible=
@c-hdmi-a3.html">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree=
/drm-tip/Patchwork_169493v4/shard-dg2-3/igt@kms_flip@flip-vs-expired-vblank=
-interruptible@c-hdmi-a3.html">FAIL</a> (<a href=3D"https://gitlab.freedesk=
top.org/drm/i915/kernel/-/issues/13027">i915#13027</a>) +1 other test fail<=
/li>
</ul></li>
<li>
<p>igt@kms_flip@flip-vs-suspend:</p><ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_19102/shard-rkl-8/igt@kms_flip@flip-vs-suspend.html">PASS</a> -&gt;=
 <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_169493v4/sha=
rd-rkl-3/igt@kms_flip@flip-vs-suspend.html">INCOMPLETE</a> (<a href=3D"http=
s://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16276">i915#16276</a> /=
 <a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6113">i=
915#6113</a>)</li>
<li>shard-glk:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/Patchwork_169493v4/shard-glk9/igt@kms_flip@flip-vs-suspend.ht=
ml">INCOMPLETE</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kern=
el/-/issues/12745">i915#12745</a> / <a href=3D"https://gitlab.freedesktop.o=
rg/drm/i915/kernel/-/issues/4839">i915#4839</a>)</li>
</ul></li>
<li>
<p>igt@kms_flip@flip-vs-suspend@a-hdmi-a1:</p><ul>
<li>shard-glk:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/Patchwork_169493v4/shard-glk9/igt@kms_flip@flip-vs-suspend@a-=
hdmi-a1.html">INCOMPLETE</a> (<a href=3D"https://gitlab.freedesktop.org/drm=
/i915/kernel/-/issues/12745">i915#12745</a>)</li>
</ul></li>
<li>
<p>igt@kms_flip@flip-vs-suspend@a-hdmi-a2:</p><ul>
<li>shard-rkl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/Patchwork_169493v4/shard-rkl-3/igt@kms_flip@flip-vs-suspend@a=
-hdmi-a2.html">INCOMPLETE</a> (<a href=3D"https://gitlab.freedesktop.org/dr=
m/i915/kernel/-/issues/16276">i915#16276</a> / <a href=3D"https://gitlab.fr=
eedesktop.org/drm/i915/kernel/-/issues/6113">i915#6113</a>)</li>
</ul></li>
<li>
<p>igt@kms_flip_scaled_crc@flip-32bpp-4tile-to-64bpp-4tile-upscaling:</p><u=
l>
<li>shard-dg1:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/Patchwork_169493v4/shard-dg1-16/igt@kms_flip_scaled_crc@flip-=
32bpp-4tile-to-64bpp-4tile-upscaling.html">SKIP</a> (<a href=3D"https://git=
lab.freedesktop.org/drm/i915/kernel/-/issues/15643">i915#15643</a>) +4 othe=
r tests skip</li>
</ul></li>
<li>
<p>igt@kms_flip_scaled_crc@flip-32bpp-yftile-to-32bpp-yftileccs-upscaling:<=
/p><ul>
<li>shard-dg2:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/Patchwork_169493v4/shard-dg2-8/igt@kms_flip_scaled_crc@flip-3=
2bpp-yftile-to-32bpp-yftileccs-upscaling.html">SKIP</a> (<a href=3D"https:/=
/gitlab.freedesktop.org/drm/i915/kernel/-/issues/15643">i915#15643</a>)</li=
>
</ul></li>
<li>
<p>igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytileccs-downscaling:<=
/p><ul>
<li>shard-tglu-1:       NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/Patchwork_169493v4/shard-tglu-1/igt@kms_flip_scaled_crc@flip-=
32bpp-ytile-to-32bpp-ytileccs-downscaling.html">SKIP</a> (<a href=3D"https:=
//gitlab.freedesktop.org/drm/i915/kernel/-/issues/15643">i915#15643</a>) +3=
 other tests skip</li>
</ul></li>
<li>
<p>igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-16bpp-4tile-downscaling:</p>=
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/Patchwork_169493v4/shard-tglu-7/igt@kms_flip_scaled_crc@flip-=
64bpp-4tile-to-16bpp-4tile-downscaling.html">SKIP</a> (<a href=3D"https://g=
itlab.freedesktop.org/drm/i915/kernel/-/issues/15643">i915#15643</a>) +2 ot=
her tests skip</li>
</ul></li>
<li>
<p>igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-16bpp-4tile-upscaling:</p><u=
l>
<li>shard-rkl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/Patchwork_169493v4/shard-rkl-4/igt@kms_flip_scaled_crc@flip-6=
4bpp-4tile-to-16bpp-4tile-upscaling.html">SKIP</a> (<a href=3D"https://gitl=
ab.freedesktop.org/drm/i915/kernel/-/issues/15643">i915#15643</a>) +2 other=
 tests skip</li>
</ul></li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-1p-primscrn-spr-indfb-draw-mmap-wc:</p>=
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/Patchwork_169493v4/shard-dg2-1/igt@kms_frontbuffer_tracking@f=
bc-1p-primscrn-spr-indfb-draw-mmap-wc.html">SKIP</a> (<a href=3D"https://gi=
tlab.freedesktop.org/drm/i915/kernel/-/issues/15990">i915#15990</a> / <a hr=
ef=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8708">i915#87=
08</a>) +3 other tests skip</li>
</ul></li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-cur-indfb-draw-render:</p><=
ul>
<li>shard-dg1:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/Patchwork_169493v4/shard-dg1-17/igt@kms_frontbuffer_tracking@=
fbc-2p-scndscrn-cur-indfb-draw-render.html">SKIP</a> +53 other tests skip</=
li>
</ul></li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-pri-shrfb-draw-mmap-gtt:</p=
><ul>
<li>shard-dg1:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/Patchwork_169493v4/shard-dg1-17/igt@kms_frontbuffer_tracking@=
fbc-2p-scndscrn-pri-shrfb-draw-mmap-gtt.html">SKIP</a> (<a href=3D"https://=
gitlab.freedesktop.org/drm/i915/kernel/-/issues/15990">i915#15990</a> / <a =
href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8708">i915#=
8708</a>) +11 other tests skip</li>
</ul></li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-suspend:</p><ul>
<li>shard-glk10:        NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/Patchwork_169493v4/shard-glk10/igt@kms_frontbuffer_tracking@f=
bc-suspend.html">INCOMPLETE</a> (<a href=3D"https://gitlab.freedesktop.org/=
drm/i915/kernel/-/issues/10056">i915#10056</a> / <a href=3D"https://gitlab.=
freedesktop.org/drm/i915/kernel/-/issues/16593">i915#16593</a>)</li>
</ul></li>
<li>
<p>igt@kms_frontbuffer_tracking@fbchdr-1p-offscreen-pri-indfb-draw-mmap-wc:=
</p><ul>
<li>shard-tglu:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/Patchwork_169493v4/shard-tglu-4/igt@kms_frontbuffer_tracking@=
fbchdr-1p-offscreen-pri-indfb-draw-mmap-wc.html">SKIP</a> (<a href=3D"https=
://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15989">i915#15989</a>) +=
16 other tests skip</li>
</ul></li>
<li>
<p>igt@kms_frontbuffer_tracking@fbchdr-1p-primscrn-spr-indfb-draw-render:</=
p><ul>
<li>shard-dg2:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/Patchwork_169493v4/shard-dg2-1/igt@kms_frontbuffer_tracking@f=
bchdr-1p-primscrn-spr-indfb-draw-render.html">SKIP</a> (<a href=3D"https://=
gitlab.freedesktop.org/drm/i915/kernel/-/issues/15989">i915#15989</a>) +6 o=
ther tests skip</li>
</ul></li>
<li>
<p>igt@kms_frontbuffer_tracking@fbchdr-1p-primscrn-spr-indfb-onoff:</p><ul>
<li>shard-rkl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/Patchwork_169493v4/shard-rkl-3/igt@kms_frontbuffer_tracking@f=
bchdr-1p-primscrn-spr-indfb-onoff.html">SKIP</a> (<a href=3D"https://gitlab=
.freedesktop.org/drm/i915/kernel/-/issues/15989">i915#15989</a>) +14 other =
tests skip</li>
</ul></li>
<li>
<p>igt@kms_frontbuffer_tracking@fbchdr-2p-primscrn-spr-indfb-draw-mmap-cpu:=
</p><ul>
<li>shard-glk:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_19102/shard-glk8/igt@kms_frontbuffer_tracking@fbchdr-2p-primscrn-sp=
r-indfb-draw-mmap-cpu.html">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.=
01.org/tree/drm-tip/Patchwork_169493v4/shard-glk4/igt@kms_frontbuffer_track=
ing@fbchdr-2p-primscrn-spr-indfb-draw-mmap-cpu.html">SKIP</a> +2 other test=
s skip</li>
</ul></li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-pri-indfb-draw-pwrite:</=
p><ul>
<li>shard-dg2:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/Patchwork_169493v4/shard-dg2-1/igt@kms_frontbuffer_tracking@f=
bcpsr-1p-primscrn-pri-indfb-draw-pwrite.html">SKIP</a> (<a href=3D"https://=
gitlab.freedesktop.org/drm/i915/kernel/-/issues/15102">i915#15102</a>) +13 =
other tests skip</li>
</ul></li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-pri-shrfb-draw-mmap-wc:<=
/p><ul>
<li>shard-tglu:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/Patchwork_169493v4/shard-tglu-7/igt@kms_frontbuffer_tracking@=
fbcpsr-1p-primscrn-pri-shrfb-draw-mmap-wc.html">SKIP</a> (<a href=3D"https:=
//gitlab.freedesktop.org/drm/i915/kernel/-/issues/15102">i915#15102</a>) +2=
9 other tests skip</li>
</ul></li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-pri-indfb-draw-blt:</p><=
ul>
<li>shard-glk10:        NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/Patchwork_169493v4/shard-glk10/igt@kms_frontbuffer_tracking@f=
bcpsr-2p-primscrn-pri-indfb-draw-blt.html">SKIP</a> +136 other tests skip</=
li>
</ul></li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-pri-shrfb-draw-mmap-wc:<=
/p><ul>
<li>shard-rkl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/Patchwork_169493v4/shard-rkl-7/igt@kms_frontbuffer_tracking@f=
bcpsr-2p-primscrn-pri-shrfb-draw-mmap-wc.html">SKIP</a> (<a href=3D"https:/=
/gitlab.freedesktop.org/drm/i915/kernel/-/issues/1825">i915#1825</a>) +3 ot=
her tests skip</li>
</ul></li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-spr-indfb-fullscreen:</p=
><ul>
<li>shard-tglu:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/Patchwork_169493v4/shard-tglu-7/igt@kms_frontbuffer_tracking@=
fbcpsr-2p-scndscrn-spr-indfb-fullscreen.html">SKIP</a> +80 other tests skip=
</li>
</ul></li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-tiling-4:</p><ul>
<li>shard-rkl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/Patchwork_169493v4/shard-rkl-4/igt@kms_frontbuffer_tracking@f=
bcpsr-tiling-4.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/dr=
m/i915/kernel/-/issues/5439">i915#5439</a>)</li>
</ul></li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsrhdr-1p-primscrn-pri-shrfb-draw-mmap-c=
pu:</p><ul>
<li>shard-tglu-1:       NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/Patchwork_169493v4/shard-tglu-1/igt@kms_frontbuffer_tracking@=
fbcpsrhdr-1p-primscrn-pri-shrfb-draw-mmap-cpu.html">SKIP</a> (<a href=3D"ht=
tps://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15102">i915#15102</a>=
) +24 other tests skip</li>
</ul></li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsrhdr-2p-primscrn-cur-indfb-draw-mmap-g=
tt:</p><ul>
<li>shard-dg1:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/Patchwork_169493v4/shard-dg1-16/igt@kms_frontbuffer_tracking@=
fbcpsrhdr-2p-primscrn-cur-indfb-draw-mmap-gtt.html">SKIP</a> (<a href=3D"ht=
tps://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15990">i915#15990</a>=
) +16 other tests skip</li>
</ul></li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsrhdr-2p-scndscrn-pri-indfb-draw-mmap-w=
c:</p><ul>
<li>shard-dg2:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/Patchwork_169493v4/shard-dg2-1/igt@kms_frontbuffer_tracking@f=
bcpsrhdr-2p-scndscrn-pri-indfb-draw-mmap-wc.html">SKIP</a> (<a href=3D"http=
s://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15990">i915#15990</a>) =
+4 other tests skip</li>
</ul></li>
<li>
<p>igt@kms_frontbuffer_tracking@hdr-1p-offscreen-pri-indfb-draw-pwrite:</p>=
<ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_19102/shard-rkl-1/igt@kms_frontbuffer_tracking@hdr-1p-offscreen-pri=
-indfb-draw-pwrite.html">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.=
org/tree/drm-tip/Patchwork_169493v4/shard-rkl-7/igt@kms_frontbuffer_trackin=
g@hdr-1p-offscreen-pri-indfb-draw-pwrite.html">SKIP</a> (<a href=3D"https:/=
/gitlab.freedesktop.org/drm/i915/kernel/-/issues/15989">i915#15989</a>) +14=
 other tests skip</li>
</ul></li>
<li>
<p>igt@kms_frontbuffer_tracking@hdr-2p-rte:</p><ul>
<li>shard-tglu-1:       NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/Patchwork_169493v4/shard-tglu-1/igt@kms_frontbuffer_tracking@=
hdr-2p-rte.html">SKIP</a> +57 other tests skip</li>
</ul></li>
<li>
<p>igt@kms_frontbuffer_tracking@hdr-modesetfrombusy:</p><ul>
<li>shard-dg1:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/Patchwork_169493v4/shard-dg1-16/igt@kms_frontbuffer_tracking@=
hdr-modesetfrombusy.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.o=
rg/drm/i915/kernel/-/issues/15989">i915#15989</a>) +11 other tests skip</li=
>
</ul></li>
<li>
<p>igt@kms_frontbuffer_tracking@hdr-rgb101010-draw-pwrite:</p><ul>
<li>shard-tglu-1:       NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/Patchwork_169493v4/shard-tglu-1/igt@kms_frontbuffer_tracking@=
hdr-rgb101010-draw-pwrite.html">SKIP</a> (<a href=3D"https://gitlab.freedes=
ktop.org/drm/i915/kernel/-/issues/15989">i915#15989</a>) +17 other tests sk=
ip</li>
</ul></li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-1p-offscreen-pri-shrfb-draw-mmap-gtt:</=
p><ul>
<li>shard-dg1:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/Patchwork_169493v4/shard-dg1-16/igt@kms_frontbuffer_tracking@=
psr-1p-offscreen-pri-shrfb-draw-mmap-gtt.html">SKIP</a> (<a href=3D"https:/=
/gitlab.freedesktop.org/drm/i915/kernel/-/issues/15104">i915#15104</a> / <a=
 href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15990">i91=
5#15990</a>) +1 other test skip</li>
</ul></li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-2p-scndscrn-pri-shrfb-draw-blt:</p><ul>
<li>shard-dg2:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/Patchwork_169493v4/shard-dg2-1/igt@kms_frontbuffer_tracking@p=
sr-2p-scndscrn-pri-shrfb-draw-blt.html">SKIP</a> (<a href=3D"https://gitlab=
.freedesktop.org/drm/i915/kernel/-/issues/15991">i915#15991</a> / <a href=
=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5354">i915#5354=
</a>) +3 other tests skip</li>
</ul></li>
<li>
<p>igt@kms_frontbuffer_tracking@psrhdr-1p-primscrn-spr-indfb-move:</p><ul>
<li>shard-rkl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/Patchwork_169493v4/shard-rkl-4/igt@kms_frontbuffer_tracking@p=
srhdr-1p-primscrn-spr-indfb-move.html">SKIP</a> (<a href=3D"https://gitlab.=
freedesktop.org/drm/i915/kernel/-/issues/15102">i915#15102</a>) +29 other t=
ests skip</li>
</ul></li>
<li>
<p>igt@kms_frontbuffer_tracking@psrhdr-2p-scndscrn-cur-indfb-move:</p><ul>
<li>shard-rkl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/Patchwork_169493v4/shard-rkl-7/igt@kms_frontbuffer_tracking@p=
srhdr-2p-scndscrn-cur-indfb-move.html">SKIP</a> +58 other tests skip</li>
</ul></li>
<li>
<p>igt@kms_frontbuffer_tracking@psrhdr-2p-scndscrn-shrfb-plflip-blt:</p><ul=
>
<li>shard-dg2:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/Patchwork_169493v4/shard-dg2-1/igt@kms_frontbuffer_tracking@p=
srhdr-2p-scndscrn-shrfb-plflip-blt.html">SKIP</a> (<a href=3D"https://gitla=
b.freedesktop.org/drm/i915/kernel/-/issues/15991">i915#15991</a>) +4 other =
tests skip</li>
</ul></li>
<li>
<p>igt@kms_frontbuffer_tracking@psrhdr-rgb565-draw-render:</p><ul>
<li>shard-dg1:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/Patchwork_169493v4/shard-dg1-16/igt@kms_frontbuffer_tracking@=
psrhdr-rgb565-draw-render.html">SKIP</a> (<a href=3D"https://gitlab.freedes=
ktop.org/drm/i915/kernel/-/issues/15102">i915#15102</a>) +29 other tests sk=
ip</li>
</ul></li>
<li>
<p>igt@kms_hdr@bpc-switch:</p><ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_19102/shard-rkl-6/igt@kms_hdr@bpc-switch.html">PASS</a> -&gt; <a hr=
ef=3D"https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_169493v4/shard-rkl=
-3/igt@kms_hdr@bpc-switch.html">SKIP</a> (<a href=3D"https://gitlab.freedes=
ktop.org/drm/i915/kernel/-/issues/16644">i915#16644</a> / <a href=3D"https:=
//gitlab.freedesktop.org/drm/i915/kernel/-/issues/3555">i915#3555</a> / <a =
href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8228">i915#=
8228</a>)</li>
<li>shard-tglu:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/Patchwork_169493v4/shard-tglu-7/igt@kms_hdr@bpc-switch.html">=
SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issue=
s/3555">i915#3555</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i915/=
kernel/-/issues/8228">i915#8228</a>)</li>
</ul></li>
<li>
<p>igt@kms_hdr@static-toggle:</p><ul>
<li>shard-rkl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/Patchwork_169493v4/shard-rkl-4/igt@kms_hdr@static-toggle.html=
">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/iss=
ues/16644">i915#16644</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i=
915/kernel/-/issues/3555">i915#3555</a> / <a href=3D"https://gitlab.freedes=
ktop.org/drm/i915/kernel/-/issues/8228">i915#8228</a>) +1 other test skip</=
li>
</ul></li>
<li>
<p>igt@kms_joiner@basic-big-joiner:</p><ul>
<li>shard-rkl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/Patchwork_169493v4/shard-rkl-7/igt@kms_joiner@basic-big-joine=
r.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel=
/-/issues/15460">i915#15460</a>)</li>
<li>shard-dg1:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/Patchwork_169493v4/shard-dg1-16/igt@kms_joiner@basic-big-join=
er.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kerne=
l/-/issues/15460">i915#15460</a>)</li>
<li>shard-tglu:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/Patchwork_169493v4/shard-tglu-2/igt@kms_joiner@basic-big-join=
er.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kerne=
l/-/issues/15460">i915#15460</a>)</li>
</ul></li>
<li>
<p>igt@kms_joiner@basic-force-big-joiner:</p><ul>
<li>shard-dg1:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/Patchwork_169493v4/shard-dg1-16/igt@kms_joiner@basic-force-bi=
g-joiner.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915=
/kernel/-/issues/15459">i915#15459</a>)</li>
</ul></li>
<li>
<p>igt@kms_joiner@basic-force-ultra-joiner:</p><ul>
<li>shard-dg1:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/Patchwork_169493v4/shard-dg1-17/igt@kms_joiner@basic-force-ul=
tra-joiner.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i9=
15/kernel/-/issues/15458">i915#15458</a>)</li>
</ul></li>
<li>
<p>igt@kms_joiner@invalid-modeset-ultra-joiner:</p><ul>
<li>shard-dg2:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/Patchwork_169493v4/shard-dg2-1/igt@kms_joiner@invalid-modeset=
-ultra-joiner.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm=
/i915/kernel/-/issues/15458">i915#15458</a>)</li>
</ul></li>
<li>
<p>igt@kms_panel_fitting@legacy:</p><ul>
<li>shard-rkl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/Patchwork_169493v4/shard-rkl-4/igt@kms_panel_fitting@legacy.h=
tml">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/=
issues/6301">i915#6301</a>)</li>
</ul></li>
<li>
<p>igt@kms_pipe_crc_basic@suspend-read-crc:</p><ul>
<li>shard-tglu-1:       NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/Patchwork_169493v4/shard-tglu-1/igt@kms_pipe_crc_basic@suspen=
d-read-crc.html">ABORT</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i=
915/kernel/-/issues/16866">i915#16866</a>) +1 other test abort</li>
</ul></li>
<li>
<p>igt@kms_pipe_stress@stress-xrgb8888-4tiled:</p><ul>
<li>shard-tglu:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/Patchwork_169493v4/shard-tglu-7/igt@kms_pipe_stress@stress-xr=
gb8888-4tiled.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm=
/i915/kernel/-/issues/14712">i915#14712</a>)</li>
</ul></li>
<li>
<p>igt@kms_pipe_stress@stress-xrgb8888-yftiled:</p><ul>
<li>shard-dg1:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/Patchwork_169493v4/shard-dg1-17/igt@kms_pipe_stress@stress-xr=
gb8888-yftiled.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/dr=
m/i915/kernel/-/issues/14712">i915#14712</a>)</li>
</ul></li>
<li>
<p>igt@kms_plane@pixel-format-4-tiled-mtl-mc-ccs-modifier-source-clamping:<=
/p><ul>
<li>shard-tglu-1:       NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/Patchwork_169493v4/shard-tglu-1/igt@kms_plane@pixel-format-4-=
tiled-mtl-mc-ccs-modifier-source-clamping.html">SKIP</a> (<a href=3D"https:=
//gitlab.freedesktop.org/drm/i915/kernel/-/issues/15709">i915#15709</a>) +1=
 other test skip</li>
</ul></li>
<li>
<p>igt@kms_plane@pixel-format-y-tiled-ccs-modifier:</p><ul>
<li>shard-dg1:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/Patchwork_169493v4/shard-dg1-16/igt@kms_plane@pixel-format-y-=
tiled-ccs-modifier.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.or=
g/drm/i915/kernel/-/issues/15709">i915#15709</a>) +3 other tests skip</li>
</ul></li>
<li>
<p>igt@kms_plane@pixel-format-y-tiled-modifier@pipe-b-plane-7:</p><ul>
<li>shard-dg1:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/Patchwork_169493v4/shard-dg1-16/igt@kms_plane@pixel-format-y-=
tiled-modifier@pipe-b-plane-7.html">SKIP</a> (<a href=3D"https://gitlab.fre=
edesktop.org/drm/i915/kernel/-/issues/16386">i915#16386</a>) +1 other test =
skip</li>
</ul></li>
<li>
<p>igt@kms_plane@pixel-format-yf-tiled-ccs-modifier-source-clamping:</p><ul=
>
<li>shard-dg2:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/Patchwork_169493v4/shard-dg2-1/igt@kms_plane@pixel-format-yf-=
tiled-ccs-modifier-source-clamping.html">SKIP</a> (<a href=3D"https://gitla=
b.freedesktop.org/drm/i915/kernel/-/issues/15709">i915#15709</a>)</li>
</ul></li>
<li>
<p>igt@kms_plane@pixel-format-yf-tiled-modifier:</p><ul>
<li>shard-rkl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/Patchwork_169493v4/shard-rkl-3/igt@kms_plane@pixel-format-yf-=
tiled-modifier.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/dr=
m/i915/kernel/-/issues/15709">i915#15709</a>) +3 other tests skip</li>
<li>shard-tglu:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/Patchwork_169493v4/shard-tglu-7/igt@kms_plane@pixel-format-yf=
-tiled-modifier.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/d=
rm/i915/kernel/-/issues/15709">i915#15709</a>) +1 other test skip</li>
</ul></li>
<li>
<p>igt@kms_plane@planar-pixel-format-settings@nv12-tile4-src-y:</p><ul>
<li>shard-dg1:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/Patchwork_169493v4/shard-dg1-16/igt@kms_plane@planar-pixel-fo=
rmat-settings@nv12-tile4-src-y.html">SKIP</a> (<a href=3D"https://gitlab.fr=
eedesktop.org/drm/i915/kernel/-/issues/16112">i915#16112</a>)</li>
</ul></li>
<li>
<p>igt@kms_plane@plane-panning-bottom-right-suspend@pipe-a:</p><ul>
<li>shard-rkl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/Patchwork_169493v4/shard-rkl-3/igt@kms_plane@plane-panning-bo=
ttom-right-suspend@pipe-a.html">INCOMPLETE</a> (<a href=3D"https://gitlab.f=
reedesktop.org/drm/i915/kernel/-/issues/14412">i915#14412</a>) +1 other tes=
t incomplete</li>
</ul></li>
<li>
<p>igt@kms_plane_alpha_blend@alpha-basic:</p><ul>
<li>shard-glk:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/Patchwork_169493v4/shard-glk1/igt@kms_plane_alpha_blend@alpha=
-basic.html">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/k=
ernel/-/issues/12178">i915#12178</a>)</li>
</ul></li>
<li>
<p>igt@kms_plane_alpha_blend@alpha-basic@pipe-a-hdmi-a-1:</p><ul>
<li>shard-glk:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/Patchwork_169493v4/shard-glk1/igt@kms_plane_alpha_blend@alpha=
-basic@pipe-a-hdmi-a-1.html">FAIL</a> (<a href=3D"https://gitlab.freedeskto=
p.org/drm/i915/kernel/-/issues/7862">i915#7862</a>) +1 other test fail</li>
</ul></li>
<li>
<p>igt@kms_plane_multiple@2x-tiling-4:</p><ul>
<li>shard-rkl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/Patchwork_169493v4/shard-rkl-4/igt@kms_plane_multiple@2x-tili=
ng-4.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/ker=
nel/-/issues/13958">i915#13958</a>) +1 other test skip</li>
</ul></li>
<li>
<p>igt@kms_plane_multiple@2x-tiling-x:</p><ul>
<li>shard-dg2:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/Patchwork_169493v4/shard-dg2-1/igt@kms_plane_multiple@2x-tili=
ng-x.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/ker=
nel/-/issues/13958">i915#13958</a>)</li>
</ul></li>
<li>
<p>igt@kms_plane_multiple@tiling-yf:</p><ul>
<li>shard-tglu:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/Patchwork_169493v4/shard-tglu-7/igt@kms_plane_multiple@tiling=
-yf.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kern=
el/-/issues/14259">i915#14259</a>)</li>
</ul></li>
<li>
<p>igt@kms_pm_backlight@brightness-with-dpms:</p><ul>
<li>shard-dg2:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/Patchwork_169493v4/shard-dg2-1/igt@kms_pm_backlight@brightnes=
s-with-dpms.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i=
915/kernel/-/issues/12343">i915#12343</a>)</li>
</ul></li>
<li>
<p>igt@kms_pm_backlight@fade-with-dpms:</p><ul>
<li>shard-tglu:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/Patchwork_169493v4/shard-tglu-7/igt@kms_pm_backlight@fade-wit=
h-dpms.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/k=
ernel/-/issues/12343">i915#12343</a> / <a href=3D"https://gitlab.freedeskto=
p.org/drm/i915/kernel/-/issues/9812">i915#9812</a>) +1 other test skip</li>
</ul></li>
<li>
<p>igt@kms_pm_backlight@fade-with-suspend:</p><ul>
<li>shard-rkl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/Patchwork_169493v4/shard-rkl-3/igt@kms_pm_backlight@fade-with=
-suspend.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915=
/kernel/-/issues/12343">i915#12343</a> / <a href=3D"https://gitlab.freedesk=
top.org/drm/i915/kernel/-/issues/5354">i915#5354</a>) +1 other test skip</l=
i>
</ul></li>
<li>
<p>igt@kms_pm_dc@dc5-pageflip-negative:</p><ul>
<li>shard-tglu-1:       NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/Patchwork_169493v4/shard-tglu-1/igt@kms_pm_dc@dc5-pageflip-ne=
gative.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/k=
ernel/-/issues/9685">i915#9685</a>)</li>
</ul></li>
<li>
<p>igt@kms_pm_dc@dc6-dpms:</p><ul>
<li>shard-tglu-1:       NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/Patchwork_169493v4/shard-tglu-1/igt@kms_pm_dc@dc6-dpms.html">=
FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issue=
s/16479">i915#16479</a>)</li>
</ul></li>
<li>
<p>igt@kms_pm_dc@dc6-psr:</p><ul>
<li>shard-dg1:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/Patchwork_169493v4/shard-dg1-16/igt@kms_pm_dc@dc6-psr.html">S=
KIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues=
/15948">i915#15948</a>)</li>
</ul></li>
<li>
<p>igt@kms_pm_lpsp@kms-lpsp:</p><ul>
<li>shard-dg1:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/Patchwork_169493v4/shard-dg1-16/igt@kms_pm_lpsp@kms-lpsp.html=
">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/iss=
ues/9340">i915#9340</a>)</li>
</ul></li>
<li>
<p>igt@kms_pm_rpm@dpms-mode-unset-lpsp:</p><ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_19102/shard-rkl-2/igt@kms_pm_rpm@dpms-mode-unset-lpsp.html">PASS</a=
> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_16949=
3v4/shard-rkl-4/igt@kms_pm_rpm@dpms-mode-unset-lpsp.html">SKIP</a> (<a href=
=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15073">i915#150=
73</a>)</li>
<li>shard-dg1:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/Patchwork_169493v4/shard-dg1-17/igt@kms_pm_rpm@dpms-mode-unse=
t-lpsp.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/k=
ernel/-/issues/15073">i915#15073</a>)</li>
</ul></li>
<li>
<p>igt@kms_pm_rpm@dpms-non-lpsp:</p><ul>
<li>shard-tglu:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/Patchwork_169493v4/shard-tglu-7/igt@kms_pm_rpm@dpms-non-lpsp.=
html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-=
/issues/15073">i915#15073</a>)</li>
</ul></li>
<li>
<p>igt@kms_pm_rpm@fences:</p><ul>
<li>shard-dg1:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/Patchwork_169493v4/shard-dg1-16/igt@kms_pm_rpm@fences.html">S=
KIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues=
/4077">i915#4077</a>) +8 other tests skip</li>
</ul></li>
<li>
<p>igt@kms_pm_rpm@modeset-lpsp:</p><ul>
<li>shard-rkl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/Patchwork_169493v4/shard-rkl-4/igt@kms_pm_rpm@modeset-lpsp.ht=
ml">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/i=
ssues/15073">i915#15073</a>)</li>
</ul></li>
<li>
<p>igt@kms_pm_rpm@modeset-non-lpsp-stress:</p><ul>
<li>shard-dg2:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_19102/shard-dg2-6/igt@kms_pm_rpm@modeset-non-lpsp-stress.html">PASS=
</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_16=
9493v4/shard-dg2-4/igt@kms_pm_rpm@modeset-non-lpsp-stress.html">SKIP</a> (<=
a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15073">i9=
15#15073</a>)</li>
<li>shard-tglu-1:       NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/Patchwork_169493v4/shard-tglu-1/igt@kms_pm_rpm@modeset-non-lp=
sp-stress.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i91=
5/kernel/-/issues/15073">i915#15073</a>)</li>
</ul></li>
<li>
<p>igt@kms_psr2_sf@fbc-pr-cursor-plane-move-continuous-exceed-fully-sf:</p>=
<ul>
<li>shard-tglu-1:       NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/Patchwork_169493v4/shard-tglu-1/igt@kms_psr2_sf@fbc-pr-cursor=
-plane-move-continuous-exceed-fully-sf.html">SKIP</a> (<a href=3D"https://g=
itlab.freedesktop.org/drm/i915/kernel/-/issues/11520">i915#11520</a>) +3 ot=
her tests skip</li>
</ul></li>
<li>
<p>igt@kms_psr2_sf@fbc-pr-cursor-plane-move-continuous-exceed-sf:</p><ul>
<li>shard-dg2:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/Patchwork_169493v4/shard-dg2-8/igt@kms_psr2_sf@fbc-pr-cursor-=
plane-move-continuous-exceed-sf.html">SKIP</a> (<a href=3D"https://gitlab.f=
reedesktop.org/drm/i915/kernel/-/issues/11520">i915#11520</a>) +1 other tes=
t skip</li>
</ul></li>
<li>
<p>igt@kms_psr2_sf@fbc-pr-cursor-plane-update-sf:</p><ul>
<li>shard-tglu:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/Patchwork_169493v4/shard-tglu-4/igt@kms_psr2_sf@fbc-pr-cursor=
-plane-update-sf.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/=
drm/i915/kernel/-/issues/11520">i915#11520</a>) +4 other tests skip</li>
</ul></li>
<li>
<p>igt@kms_psr2_sf@fbc-pr-overlay-plane-move-continuous-exceed-sf:</p><ul>
<li>shard-glk:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/Patchwork_169493v4/shard-glk1/igt@kms_psr2_sf@fbc-pr-overlay-=
plane-move-continuous-exceed-sf.html">SKIP</a> (<a href=3D"https://gitlab.f=
reedesktop.org/drm/i915/kernel/-/issues/11520">i915#11520</a>) +9 other tes=
ts skip</li>
</ul></li>
<li>
<p>igt@kms_psr2_sf@fbc-pr-primary-plane-update-sf-dmg-area:</p><ul>
<li>shard-rkl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/Patchwork_169493v4/shard-rkl-4/igt@kms_psr2_sf@fbc-pr-primary=
-plane-update-sf-dmg-area.html">SKIP</a> (<a href=3D"https://gitlab.freedes=
ktop.org/drm/i915/kernel/-/issues/11520">i915#11520</a>) +4 other tests ski=
p</li>
</ul></li>
<li>
<p>igt@kms_psr2_sf@fbc-psr2-cursor-plane-move-continuous-exceed-sf:</p><ul>
<li>shard-dg1:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/Patchwork_169493v4/shard-dg1-16/igt@kms_psr2_sf@fbc-psr2-curs=
or-plane-move-continuous-exceed-sf.html">SKIP</a> (<a href=3D"https://gitla=
b.freedesktop.org/drm/i915/kernel/-/issues/11520">i915#11520</a>) +7 other =
tests skip</li>
</ul></li>
<li>
<p>igt@kms_psr2_sf@pr-cursor-plane-move-continuous-exceed-sf:</p><ul>
<li>shard-glk10:        NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/Patchwork_169493v4/shard-glk10/igt@kms_psr2_sf@pr-cursor-plan=
e-move-continuous-exceed-sf.html">SKIP</a> (<a href=3D"https://gitlab.freed=
esktop.org/drm/i915/kernel/-/issues/11520">i915#11520</a>) +2 other tests s=
kip</li>
</ul></li>
<li>
<p>igt@kms_psr2_sf@psr2-overlay-plane-move-continuous-exceed-sf:</p><ul>
<li>shard-glk11:        NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/Patchwork_169493v4/shard-glk11/igt@kms_psr2_sf@psr2-overlay-p=
lane-move-continuous-exceed-sf.html">SKIP</a> (<a href=3D"https://gitlab.fr=
eedesktop.org/drm/i915/kernel/-/issues/11520">i915#11520</a>) +1 other test=
 skip</li>
</ul></li>
<li>
<p>igt@kms_psr2_su@frontbuffer-xrgb8888:</p><ul>
<li>shard-tglu-1:       NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/Patchwork_169493v4/shard-tglu-1/igt@kms_psr2_su@frontbuffer-x=
rgb8888.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/=
kernel/-/issues/9683">i915#9683</a>)</li>
</ul></li>
<li>
<p>igt@kms_psr2_su@page_flip-xrgb8888:</p><ul>
<li>shard-tglu:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/Patchwork_169493v4/shard-tglu-7/igt@kms_psr2_su@page_flip-xrg=
b8888.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/ke=
rnel/-/issues/9683">i915#9683</a>)</li>
</ul></li>
<li>
<p>igt@kms_psr@fbc-pr-cursor-blt:</p><ul>
<li>shard-tglu:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/Patchwork_169493v4/shard-tglu-7/igt@kms_psr@fbc-pr-cursor-blt=
.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/=
-/issues/9732">i915#9732</a>) +13 other tests skip</li>
</ul></li>
<li>
<p>igt@kms_psr@fbc-pr-sprite-render:</p><ul>
<li>shard-tglu-1:       NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/Patchwork_169493v4/shard-tglu-1/igt@kms_psr@fbc-pr-sprite-ren=
der.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kern=
el/-/issues/9732">i915#9732</a>) +10 other tests skip</li>
</ul></li>
<li>
<p>igt@kms_psr@fbc-psr2-cursor-blt:</p><ul>
<li>shard-dg1:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/Patchwork_169493v4/shard-dg1-16/igt@kms_psr@fbc-psr2-cursor-b=
lt.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kerne=
l/-/issues/1072">i915#1072</a> / <a href=3D"https://gitlab.freedesktop.org/=
drm/i915/kernel/-/issues/9732">i915#9732</a>) +13 other tests skip</li>
</ul></li>
<li>
<p>igt@kms_psr@pr-primary-blt:</p><ul>
<li>shard-dg2:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/Patchwork_169493v4/shard-dg2-8/igt@kms_psr@pr-primary-blt.htm=
l">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/is=
sues/1072">i915#1072</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i9=
15/kernel/-/issues/9732">i915#9732</a>) +5 other tests skip</li>
</ul></li>
<li>
<p>igt@kms_psr@psr-sprite-plane-move:</p><ul>
<li>shard-rkl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/Patchwork_169493v4/shard-rkl-4/igt@kms_psr@psr-sprite-plane-m=
ove.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kern=
el/-/issues/1072">i915#1072</a> / <a href=3D"https://gitlab.freedesktop.org=
/drm/i915/kernel/-/issues/9732">i915#9732</a>) +16 other tests skip</li>
</ul></li>
<li>
<p>igt@kms_psr_stress_test@invalidate-primary-flip-overlay:</p><ul>
<li>shard-dg1:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/Patchwork_169493v4/shard-dg1-17/igt@kms_psr_stress_test@inval=
idate-primary-flip-overlay.html">SKIP</a> (<a href=3D"https://gitlab.freede=
sktop.org/drm/i915/kernel/-/issues/15949">i915#15949</a>)</li>
<li>shard-tglu:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/Patchwork_169493v4/shard-tglu-4/igt@kms_psr_stress_test@inval=
idate-primary-flip-overlay.html">SKIP</a> (<a href=3D"https://gitlab.freede=
sktop.org/drm/i915/kernel/-/issues/15949">i915#15949</a>)</li>
</ul></li>
<li>
<p>igt@kms_rotation_crc@primary-4-tiled-reflect-x-0:</p><ul>
<li>shard-tglu:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/Patchwork_169493v4/shard-tglu-7/igt@kms_rotation_crc@primary-=
4-tiled-reflect-x-0.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.o=
rg/drm/i915/kernel/-/issues/5289">i915#5289</a>)</li>
</ul></li>
<li>
<p>igt@kms_rotation_crc@primary-yf-tiled-reflect-x-270:</p><ul>
<li>shard-dg1:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/Patchwork_169493v4/shard-dg1-16/igt@kms_rotation_crc@primary-=
yf-tiled-reflect-x-270.html">SKIP</a> (<a href=3D"https://gitlab.freedeskto=
p.org/drm/i915/kernel/-/issues/5289">i915#5289</a>)</li>
</ul></li>
<li>
<p>igt@kms_rotation_crc@primary-yf-tiled-reflect-x-90:</p><ul>
<li>shard-tglu-1:       NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/Patchwork_169493v4/shard-tglu-1/igt@kms_rotation_crc@primary-=
yf-tiled-reflect-x-90.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop=
.org/drm/i915/kernel/-/issues/5289">i915#5289</a>)</li>
</ul></li>
<li>
<p>igt@kms_tiled_display@basic-test-pattern:</p><ul>
<li>shard-glk:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/Patchwork_169493v4/shard-glk4/igt@kms_tiled_display@basic-tes=
t-pattern.html">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i91=
5/kernel/-/issues/10959">i915#10959</a>)</li>
</ul></li>
<li>
<p>igt@kms_vblank@ts-continuation-suspend:</p><ul>
<li>shard-glk:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/Patchwork_169493v4/shard-glk1/igt@kms_vblank@ts-continuation-=
suspend.html">INCOMPLETE</a> (<a href=3D"https://gitlab.freedesktop.org/drm=
/i915/kernel/-/issues/12276">i915#12276</a>) +1 other test incomplete</li>
</ul></li>
<li>
<p>igt@kms_vrr@max-min:</p><ul>
<li>shard-dg2:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/Patchwork_169493v4/shard-dg2-1/igt@kms_vrr@max-min.html">SKIP=
</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/99=
06">i915#9906</a>)</li>
</ul></li>
<li>
<p>igt@kms_vrr@seamless-rr-switch-vrr:</p><ul>
<li>shard-rkl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/Patchwork_169493v4/shard-rkl-4/igt@kms_vrr@seamless-rr-switch=
-vrr.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/ker=
nel/-/issues/9906">i915#9906</a>)</li>
</ul></li>
<li>
<p>igt@perf@per-context-mode-unprivileged:</p><ul>
<li>shard-rkl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/Patchwork_169493v4/shard-rkl-4/igt@perf@per-context-mode-unpr=
ivileged.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915=
/kernel/-/issues/2435">i915#2435</a>)</li>
</ul></li>
<li>
<p>igt@perf_pmu@busy-double-start:</p><ul>
<li>shard-mtlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_19102/shard-mtlp-3/igt@perf_pmu@busy-double-start.html">PASS</a> -&=
gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_169493v4/=
shard-mtlp-2/igt@perf_pmu@busy-double-start.html">FAIL</a> (<a href=3D"http=
s://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4349">i915#4349</a>) +2=
 other tests fail</li>
</ul></li>
<li>
<p>igt@perf_pmu@rc6@other-idle-gt0:</p><ul>
<li>shard-tglu-1:       NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/Patchwork_169493v4/shard-tglu-1/igt@perf_pmu@rc6@other-idle-g=
t0.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kerne=
l/-/issues/8516">i915#8516</a>)</li>
</ul></li>
<li>
<p>igt@prime_udl@share-import:</p><ul>
<li>shard-tglu-1:       NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/Patchwork_169493v4/shard-tglu-1/igt@prime_udl@share-import.ht=
ml">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/i=
ssues/16420">i915#16420</a>)</li>
</ul></li>
<li>
<p>igt@prime_udl@share-import-addfb:</p><ul>
<li>shard-tglu:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/Patchwork_169493v4/shard-tglu-7/igt@prime_udl@share-import-ad=
dfb.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kern=
el/-/issues/16420">i915#16420</a>)</li>
</ul></li>
<li>
<p>igt@prime_vgem@basic-write:</p><ul>
<li>shard-rkl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/Patchwork_169493v4/shard-rkl-7/igt@prime_vgem@basic-write.htm=
l">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/is=
sues/3291">i915#3291</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i9=
15/kernel/-/issues/3708">i915#3708</a>)</li>
</ul></li>
<li>
<p>igt@prime_vgem@fence-read-hang:</p><ul>
<li>shard-dg1:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/Patchwork_169493v4/shard-dg1-17/igt@prime_vgem@fence-read-han=
g.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel=
/-/issues/3708">i915#3708</a>) +1 other test skip</li>
</ul></li>
<li>
<p>igt@tools_test@sysfs_l3_parity:</p><ul>
<li>shard-dg1:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/Patchwork_169493v4/shard-dg1-16/igt@tools_test@sysfs_l3_parit=
y.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel=
/-/issues/4818">i915#4818</a>)</li>
</ul></li>
</ul><h4>Possible fixes</h4><ul>
<li>
<p>igt@gem_eio@hibernate:</p><ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_19102/shard-rkl-1/igt@gem_eio@hibernate.html">ABORT</a> (<a href=3D=
"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/7975">i915#7975</a=
>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_1694=
93v4/shard-rkl-7/igt@gem_eio@hibernate.html">PASS</a></li>
</ul></li>
<li>
<p>igt@gem_eio@in-flight-suspend:</p><ul>
<li>shard-dg2:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_19102/shard-dg2-8/igt@gem_eio@in-flight-suspend.html">ABORT</a> (<a=
 href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16784">i91=
5#16784</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/Patc=
hwork_169493v4/shard-dg2-8/igt@gem_eio@in-flight-suspend.html">PASS</a></li=
>
</ul></li>
<li>
<p>igt@gem_workarounds@suspend-resume-fd:</p><ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_19102/shard-rkl-6/igt@gem_workarounds@suspend-resume-fd.html">INCOM=
PLETE</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issu=
es/13356">i915#13356</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree=
/drm-tip/Patchwork_169493v4/shard-rkl-3/igt@gem_workarounds@suspend-resume-=
fd.html">PASS</a></li>
</ul></li>
<li>
<p>igt@i915_suspend@fence-restore-untiled:</p><ul>
<li>shard-glk:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_19102/shard-glk8/igt@i915_suspend@fence-restore-untiled.html">INCOM=
PLETE</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issu=
es/16182">i915#16182</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i9=
15/kernel/-/issues/4817">i915#4817</a>) -&gt; <a href=3D"https://intel-gfx-=
ci.01.org/tree/drm-tip/Patchwork_169493v4/shard-glk4/igt@i915_suspend@fence=
-restore-untiled.html">PASS</a></li>
</ul></li>
<li>
<p>igt@i915_suspend@sysfs-reader:</p><ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_19102/shard-rkl-6/igt@i915_suspend@sysfs-reader.html">INCOMPLETE</a=
> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4817"=
>i915#4817</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/P=
atchwork_169493v4/shard-rkl-4/igt@i915_suspend@sysfs-reader.html">PASS</a><=
/li>
</ul></li>
<li>
<p>igt@kms_flip@dpms-vs-vblank-race-interruptible@d-hdmi-a1:</p><ul>
<li>shard-tglu:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_19102/shard-tglu-5/igt@kms_flip@dpms-vs-vblank-race-interruptible@d=
-hdmi-a1.html">ABORT</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i91=
5/kernel/-/issues/16866">i915#16866</a> / <a href=3D"https://gitlab.freedes=
ktop.org/drm/i915/kernel/-/issues/16876">i915#16876</a>) -&gt; <a href=3D"h=
ttps://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_169493v4/shard-tglu-4/igt=
@kms_flip@dpms-vs-vblank-race-interruptible@d-hdmi-a1.html">PASS</a></li>
</ul></li>
<li>
<p>igt@kms_flip@flip-vs-blocking-wf-vblank@a-hdmi-a3:</p><ul>
<li>shard-dg2:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_19102/shard-dg2-1/igt@kms_flip@flip-vs-blocking-wf-vblank@a-hdmi-a3=
.html">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/=
-/issues/10826">i915#10826</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.or=
g/tree/drm-tip/Patchwork_169493v4/shard-dg2-6/igt@kms_flip@flip-vs-blocking=
-wf-vblank@a-hdmi-a3.html">PASS</a> +1 other test pass</li>
</ul></li>
<li>
<p>igt@kms_flip@flip-vs-blocking-wf-vblank@a-hdmi-a4:</p><ul>
<li>shard-dg1:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_19102/shard-dg1-19/igt@kms_flip@flip-vs-blocking-wf-vblank@a-hdmi-a=
4.html">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel=
/-/issues/14600">i915#14600</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.o=
rg/tree/drm-tip/Patchwork_169493v4/shard-dg1-16/igt@kms_flip@flip-vs-blocki=
ng-wf-vblank@a-hdmi-a4.html">PASS</a></li>
</ul></li>
<li>
<p>igt@kms_flip@flip-vs-dpms-off-vs-modeset-interruptible@d-hdmi-a1:</p><ul=
>
<li>shard-tglu:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_19102/shard-tglu-8/igt@kms_flip@flip-vs-dpms-off-vs-modeset-interru=
ptible@d-hdmi-a1.html">ABORT</a> (<a href=3D"https://gitlab.freedesktop.org=
/drm/i915/kernel/-/issues/16876">i915#16876</a>) -&gt; <a href=3D"https://i=
ntel-gfx-ci.01.org/tree/drm-tip/Patchwork_169493v4/shard-tglu-2/igt@kms_fli=
p@flip-vs-dpms-off-vs-modeset-interruptible@d-hdmi-a1.html">PASS</a> +2 oth=
er tests pass</li>
</ul></li>
<li>
<p>igt@kms_flip@flip-vs-expired-vblank:</p><ul>
<li>shard-glk:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_19102/shard-glk9/igt@kms_flip@flip-vs-expired-vblank.html">FAIL</a>=
 (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13027"=
>i915#13027</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/=
Patchwork_169493v4/shard-glk4/igt@kms_flip@flip-vs-expired-vblank.html">PAS=
S</a> +1 other test pass</li>
</ul></li>
<li>
<p>igt@kms_flip@flip-vs-expired-vblank-interruptible:</p><ul>
<li>shard-tglu:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_19102/shard-tglu-3/igt@kms_flip@flip-vs-expired-vblank-interruptibl=
e.html">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel=
/-/issues/13027">i915#13027</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.o=
rg/tree/drm-tip/Patchwork_169493v4/shard-tglu-5/igt@kms_flip@flip-vs-expire=
d-vblank-interruptible.html">PASS</a> +1 other test pass</li>
</ul></li>
<li>
<p>igt@kms_flip@flip-vs-expired-vblank-interruptible@b-hdmi-a1:</p><ul>
<li>shard-glk11:        <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_19102/shard-glk11/igt@kms_flip@flip-vs-expired-vblank-interruptible=
@b-hdmi-a1.html">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i9=
15/kernel/-/issues/13027">i915#13027</a>) -&gt; <a href=3D"https://intel-gf=
x-ci.01.org/tree/drm-tip/Patchwork_169493v4/shard-glk11/igt@kms_flip@flip-v=
s-expired-vblank-interruptible@b-hdmi-a1.html">PASS</a></li>
</ul></li>
<li>
<p>igt@kms_flip@wf_vblank-ts-check:</p><ul>
<li>shard-tglu:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_19102/shard-tglu-5/igt@kms_flip@wf_vblank-ts-check.html">FAIL</a> (=
<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14600">i=
915#14600</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/Pa=
tchwork_169493v4/shard-tglu-4/igt@kms_flip@wf_vblank-ts-check.html">PASS</a=
> +1 other test pass</li>
</ul></li>
<li>
<p>igt@kms_frontbuffer_tracking@hdr-1p-primscrn-pri-shrfb-draw-mmap-wc:</p>=
<ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_19102/shard-rkl-3/igt@kms_frontbuffer_tracking@hdr-1p-primscrn-pri-=
shrfb-draw-mmap-wc.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.or=
g/drm/i915/kernel/-/issues/15989">i915#15989</a>) -&gt; <a href=3D"https://=
intel-gfx-ci.01.org/tree/drm-tip/Patchwork_169493v4/shard-rkl-6/igt@kms_fro=
ntbuffer_tracking@hdr-1p-primscrn-pri-shrfb-draw-mmap-wc.html">PASS</a> +4 =
other tests pass</li>
</ul></li>
<li>
<p>igt@kms_frontbuffer_tracking@hdr-2p-scndscrn-pri-indfb-draw-mmap-cpu:</p=
><ul>
<li>shard-glk:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_19102/shard-glk4/igt@kms_frontbuffer_tracking@hdr-2p-scndscrn-pri-i=
ndfb-draw-mmap-cpu.html">SKIP</a> -&gt; <a href=3D"https://intel-gfx-ci.01.=
org/tree/drm-tip/Patchwork_169493v4/shard-glk8/igt@kms_frontbuffer_tracking=
@hdr-2p-scndscrn-pri-indfb-draw-mmap-cpu.html">PASS</a> +2 other tests pass=
</li>
</ul></li>
<li>
<p>igt@kms_pipe_crc_basic@suspend-read-crc:</p><ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_19102/shard-rkl-4/igt@kms_pipe_crc_basic@suspend-read-crc.html">INC=
OMPLETE</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/is=
sues/12756">i915#12756</a> / <a href=3D"https://gitlab.freedesktop.org/drm/=
i915/kernel/-/issues/13476">i915#13476</a>) -&gt; <a href=3D"https://intel-=
gfx-ci.01.org/tree/drm-tip/Patchwork_169493v4/shard-rkl-7/igt@kms_pipe_crc_=
basic@suspend-read-crc.html">PASS</a></li>
</ul></li>
<li>
<p>igt@kms_pipe_crc_basic@suspend-read-crc@pipe-a-hdmi-a-2:</p><ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_19102/shard-rkl-4/igt@kms_pipe_crc_basic@suspend-read-crc@pipe-a-hd=
mi-a-2.html">INCOMPLETE</a> (<a href=3D"https://gitlab.freedesktop.org/drm/=
i915/kernel/-/issues/13476">i915#13476</a>) -&gt; <a href=3D"https://intel-=
gfx-ci.01.org/tree/drm-tip/Patchwork_169493v4/shard-rkl-7/igt@kms_pipe_crc_=
basic@suspend-read-crc@pipe-a-hdmi-a-2.html">PASS</a></li>
</ul></li>
<li>
<p>igt@kms_plane_cursor@viewport@pipe-a-hdmi-a-2-size-256:</p><ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_19102/shard-rkl-3/igt@kms_plane_cursor@viewport@pipe-a-hdmi-a-2-siz=
e-256.html">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/ke=
rnel/-/issues/15913">i915#15913</a>) -&gt; <a href=3D"https://intel-gfx-ci.=
01.org/tree/drm-tip/Patchwork_169493v4/shard-rkl-6/igt@kms_plane_cursor@vie=
wport@pipe-a-hdmi-a-2-size-256.html">PASS</a> +1 other test pass</li>
</ul></li>
<li>
<p>igt@kms_plane_cursor@viewport@pipe-a-hdmi-a-2-size-64:</p><ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_19102/shard-rkl-3/igt@kms_plane_cursor@viewport@pipe-a-hdmi-a-2-siz=
e-64.html">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/ker=
nel/-/issues/15912">i915#15912</a>) -&gt; <a href=3D"https://intel-gfx-ci.0=
1.org/tree/drm-tip/Patchwork_169493v4/shard-rkl-6/igt@kms_plane_cursor@view=
port@pipe-a-hdmi-a-2-size-64.html">PASS</a> +1 other test pass</li>
</ul></li>
<li>
<p>igt@kms_pm_rpm@dpms-lpsp:</p><ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_19102/shard-rkl-7/igt@kms_pm_rpm@dpms-lpsp.html">SKIP</a> (<a href=
=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15073">i915#150=
73</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork=
_169493v4/shard-rkl-2/igt@kms_pm_rpm@dpms-lpsp.html">PASS</a> +1 other test=
 pass</li>
<li>shard-dg1:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_19102/shard-dg1-16/igt@kms_pm_rpm@dpms-lpsp.html">SKIP</a> (<a href=
=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15073">i915#150=
73</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork=
_169493v4/shard-dg1-15/igt@kms_pm_rpm@dpms-lpsp.html">PASS</a></li>
</ul></li>
<li>
<p>igt@kms_pm_rpm@modeset-non-lpsp-stress-no-wait:</p><ul>
<li>shard-dg2:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_19102/shard-dg2-4/igt@kms_pm_rpm@modeset-non-lpsp-stress-no-wait.ht=
ml">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/i=
ssues/15073">i915#15073</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/t=
ree/drm-tip/Patchwork_169493v4/shard-dg2-5/igt@kms_pm_rpm@modeset-non-lpsp-=
stress-no-wait.html">PASS</a> +2 other tests pass</li>
</ul></li>
<li>
<p>igt@kms_pm_rpm@system-suspend-idle:</p><ul>
<li>shard-dg2:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_19102/shard-dg2-7/igt@kms_pm_rpm@system-suspend-idle.html">INCOMPLE=
TE</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/=
14419">i915#14419</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/dr=
m-tip/Patchwork_169493v4/shard-dg2-1/igt@kms_pm_rpm@system-suspend-idle.htm=
l">PASS</a></li>
</ul></li>
<li>
<p>igt@perf_pmu@busy-double-start@vecs1:</p><ul>
<li>shard-dg2:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_19102/shard-dg2-3/igt@perf_pmu@busy-double-start@vecs1.html">FAIL</=
a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4349=
">i915#4349</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/=
Patchwork_169493v4/shard-dg2-6/igt@perf_pmu@busy-double-start@vecs1.html">P=
ASS</a> +4 other tests pass</li>
</ul></li>
</ul><h4>Warnings</h4><ul>
<li>
<p>igt@gem_ccs@block-multicopy-inplace:</p><ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_19102/shard-rkl-3/igt@gem_ccs@block-multicopy-inplace.html">SKIP</a=
> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3555"=
>i915#3555</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/=
-/issues/9323">i915#9323</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/Patchwork_169493v4/shard-rkl-6/igt@gem_ccs@block-multicopy-inp=
lace.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/ker=
nel/-/issues/14544">i915#14544</a> / <a href=3D"https://gitlab.freedesktop.=
org/drm/i915/kernel/-/issues/3555">i915#3555</a> / <a href=3D"https://gitla=
b.freedesktop.org/drm/i915/kernel/-/issues/9323">i915#9323</a>)</li>
</ul></li>
<li>
<p>igt@gem_eio@kms:</p><ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_19102/shard-rkl-3/igt@gem_eio@kms.html">ABORT</a> (<a href=3D"https=
://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16837">i915#16837</a>) -=
&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_169493v4=
/shard-rkl-4/igt@gem_eio@kms.html">ABORT</a> (<a href=3D"https://gitlab.fre=
edesktop.org/drm/i915/kernel/-/issues/16837">i915#16837</a> / <a href=3D"ht=
tps://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16931">i915#16931</a>=
)</li>
<li>shard-tglu:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_19102/shard-tglu-10/igt@gem_eio@kms.html">ABORT</a> (<a href=3D"htt=
ps://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16837">i915#16837</a>)=
 -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_169493=
v4/shard-tglu-3/igt@gem_eio@kms.html">ABORT</a> (<a href=3D"https://gitlab.=
freedesktop.org/drm/i915/kernel/-/issues/16837">i915#16837</a> / <a href=3D=
"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16866">i915#16866<=
/a>)</li>
</ul></li>
<li>
<p>igt@gem_exec_balancer@parallel-bb-first:</p><ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_19102/shard-rkl-3/igt@gem_exec_balancer@parallel-bb-first.html">SKI=
P</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4=
525">i915#4525</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-t=
ip/Patchwork_169493v4/shard-rkl-6/igt@gem_exec_balancer@parallel-bb-first.h=
tml">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/=
issues/14544">i915#14544</a> / <a href=3D"https://gitlab.freedesktop.org/dr=
m/i915/kernel/-/issues/4525">i915#4525</a>) +1 other test skip</li>
</ul></li>
<li>
<p>igt@gem_exec_capture@capture-recoverable:</p><ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_19102/shard-rkl-6/igt@gem_exec_capture@capture-recoverable.html">SK=
IP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/=
14544">i915#14544</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i915/=
kernel/-/issues/6344">i915#6344</a>) -&gt; <a href=3D"https://intel-gfx-ci.=
01.org/tree/drm-tip/Patchwork_169493v4/shard-rkl-4/igt@gem_exec_capture@cap=
ture-recoverable.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/=
drm/i915/kernel/-/issues/6344">i915#6344</a>)</li>
</ul></li>
<li>
<p>igt@gem_exec_reloc@basic-wc-gtt:</p><ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_19102/shard-rkl-4/igt@gem_exec_reloc@basic-wc-gtt.html">SKIP</a> (<=
a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3281">i91=
5#3281</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/Patch=
work_169493v4/shard-rkl-6/igt@gem_exec_reloc@basic-wc-gtt.html">SKIP</a> (<=
a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i9=
15#14544</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/=
issues/3281">i915#3281</a>) +2 other tests skip</li>
</ul></li>
<li>
<p>igt@gem_exec_reloc@basic-write-read-active:</p><ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_19102/shard-rkl-6/igt@gem_exec_reloc@basic-write-read-active.html">=
SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issue=
s/14544">i915#14544</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i91=
5/kernel/-/issues/3281">i915#3281</a>) -&gt; <a href=3D"https://intel-gfx-c=
i.01.org/tree/drm-tip/Patchwork_169493v4/shard-rkl-4/igt@gem_exec_reloc@bas=
ic-write-read-active.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.=
org/drm/i915/kernel/-/issues/3281">i915#3281</a>)</li>
</ul></li>
<li>
<p>igt@gem_exec_schedule@semaphore-power:</p><ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_19102/shard-rkl-4/igt@gem_exec_schedule@semaphore-power.html">SKIP<=
/a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/727=
6">i915#7276</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/Patchwork_169493v4/shard-rkl-6/igt@gem_exec_schedule@semaphore-power.html"=
>SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issu=
es/14544">i915#14544</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i9=
15/kernel/-/issues/7276">i915#7276</a>)</li>
</ul></li>
<li>
<p>igt@gem_lmem_swapping@parallel-multi:</p><ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_19102/shard-rkl-3/igt@gem_lmem_swapping@parallel-multi.html">SKIP</=
a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4613=
">i915#4613</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/=
Patchwork_169493v4/shard-rkl-6/igt@gem_lmem_swapping@parallel-multi.html">S=
KIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues=
/14544">i915#14544</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i915=
/kernel/-/issues/4613">i915#4613</a>) +1 other test skip</li>
</ul></li>
<li>
<p>igt@gem_lmem_swapping@parallel-random-verify:</p><ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_19102/shard-rkl-6/igt@gem_lmem_swapping@parallel-random-verify.html=
">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/iss=
ues/14544">i915#14544</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i=
915/kernel/-/issues/4613">i915#4613</a>) -&gt; <a href=3D"https://intel-gfx=
-ci.01.org/tree/drm-tip/Patchwork_169493v4/shard-rkl-4/igt@gem_lmem_swappin=
g@parallel-random-verify.html">SKIP</a> (<a href=3D"https://gitlab.freedesk=
top.org/drm/i915/kernel/-/issues/4613">i915#4613</a>) +1 other test skip</l=
i>
</ul></li>
<li>
<p>igt@gem_tiled_partial_pwrite_pread@reads:</p><ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_19102/shard-rkl-4/igt@gem_tiled_partial_pwrite_pread@reads.html">SK=
IP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/=
3282">i915#3282</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-=
tip/Patchwork_169493v4/shard-rkl-6/igt@gem_tiled_partial_pwrite_pread@reads=
.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/=
-/issues/14544">i915#14544</a> / <a href=3D"https://gitlab.freedesktop.org/=
drm/i915/kernel/-/issues/3282">i915#3282</a>) +3 other tests skip</li>
</ul></li>
<li>
<p>igt@gen9_exec_parse@allowed-all:</p><ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_19102/shard-rkl-4/igt@gen9_exec_parse@allowed-all.html">SKIP</a> (<=
a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2527">i91=
5#2527</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/Patch=
work_169493v4/shard-rkl-6/igt@gen9_exec_parse@allowed-all.html">SKIP</a> (<=
a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i9=
15#14544</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/=
issues/2527">i915#2527</a>)</li>
</ul></li>
<li>
<p>igt@gen9_exec_parse@unaligned-jump:</p><ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_19102/shard-rkl-6/igt@gen9_exec_parse@unaligned-jump.html">SKIP</a>=
 (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544"=
>i915#14544</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel=
/-/issues/2527">i915#2527</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/Patchwork_169493v4/shard-rkl-4/igt@gen9_exec_parse@unaligned-=
jump.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/ker=
nel/-/issues/2527">i915#2527</a>) +1 other test skip</li>
</ul></li>
<li>
<p>igt@i915_module_load@resize-bar:</p><ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_19102/shard-rkl-3/igt@i915_module_load@resize-bar.html">SKIP</a> (<=
a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6412">i91=
5#6412</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/Patch=
work_169493v4/shard-rkl-6/igt@i915_module_load@resize-bar.html">SKIP</a> (<=
a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i9=
15#14544</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/=
issues/6412">i915#6412</a>)</li>
</ul></li>
<li>
<p>igt@i915_pm_freq_mult@media-freq@gt0:</p><ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_19102/shard-rkl-3/igt@i915_pm_freq_mult@media-freq@gt0.html">SKIP</=
a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6590=
">i915#6590</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/=
Patchwork_169493v4/shard-rkl-6/igt@i915_pm_freq_mult@media-freq@gt0.html">S=
KIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues=
/14544">i915#14544</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i915=
/kernel/-/issues/6590">i915#6590</a>) +1 other test skip</li>
</ul></li>
<li>
<p>igt@intel_hwmon@hwmon-read:</p><ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_19102/shard-rkl-4/igt@intel_hwmon@hwmon-read.html">SKIP</a> (<a hre=
f=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/7707">i915#770=
7</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_=
169493v4/shard-rkl-6/igt@intel_hwmon@hwmon-read.html">SKIP</a> (<a href=3D"=
https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14544</=
a> / <a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/770=
7">i915#7707</a>)</li>
</ul></li>
<li>
<p>igt@kms_big_fb@4-tiled-max-hw-stride-32bpp-rotate-0-hflip:</p><ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_19102/shard-rkl-3/igt@kms_big_fb@4-tiled-max-hw-stride-32bpp-rotate=
-0-hflip.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915=
/kernel/-/issues/5286">i915#5286</a>) -&gt; <a href=3D"https://intel-gfx-ci=
.01.org/tree/drm-tip/Patchwork_169493v4/shard-rkl-6/igt@kms_big_fb@4-tiled-=
max-hw-stride-32bpp-rotate-0-hflip.html">SKIP</a> (<a href=3D"https://gitla=
b.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a> / <a href=
=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5286">i915#5286=
</a>) +1 other test skip</li>
</ul></li>
<li>
<p>igt@kms_big_fb@4-tiled-max-hw-stride-32bpp-rotate-0-hflip-async-flip:</p=
><ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_19102/shard-rkl-6/igt@kms_big_fb@4-tiled-max-hw-stride-32bpp-rotate=
-0-hflip-async-flip.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.o=
rg/drm/i915/kernel/-/issues/14544">i915#14544</a> / <a href=3D"https://gitl=
ab.freedesktop.org/drm/i915/kernel/-/issues/5286">i915#5286</a>) -&gt; <a h=
ref=3D"https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_169493v4/shard-rk=
l-4/igt@kms_big_fb@4-tiled-max-hw-stride-32bpp-rotate-0-hflip-async-flip.ht=
ml">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/i=
ssues/5286">i915#5286</a>)</li>
</ul></li>
<li>
<p>igt@kms_big_fb@x-tiled-32bpp-rotate-270:</p><ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_19102/shard-rkl-4/igt@kms_big_fb@x-tiled-32bpp-rotate-270.html">SKI=
P</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3=
638">i915#3638</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-t=
ip/Patchwork_169493v4/shard-rkl-6/igt@kms_big_fb@x-tiled-32bpp-rotate-270.h=
tml">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/=
issues/14544">i915#14544</a> / <a href=3D"https://gitlab.freedesktop.org/dr=
m/i915/kernel/-/issues/3638">i915#3638</a>) +1 other test skip</li>
</ul></li>
<li>
<p>igt@kms_big_fb@y-tiled-8bpp-rotate-90:</p><ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_19102/shard-rkl-6/igt@kms_big_fb@y-tiled-8bpp-rotate-90.html">SKIP<=
/a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/145=
44">i915#14544</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i915/ker=
nel/-/issues/3638">i915#3638</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.=
org/tree/drm-tip/Patchwork_169493v4/shard-rkl-4/igt@kms_big_fb@y-tiled-8bpp=
-rotate-90.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i9=
15/kernel/-/issues/3638">i915#3638</a>) +1 other test skip</li>
</ul></li>
<li>
<p>igt@kms_big_fb@yf-tiled-16bpp-rotate-270:</p><ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_19102/shard-rkl-6/igt@kms_big_fb@yf-tiled-16bpp-rotate-270.html">SK=
IP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/=
14544">i915#14544</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/dr=
m-tip/Patchwork_169493v4/shard-rkl-4/igt@kms_big_fb@yf-tiled-16bpp-rotate-2=
70.html">SKIP</a> +28 other tests skip</li>
</ul></li>
<li>
<p>igt@kms_ccs@bad-pixel-format-4-tiled-mtl-mc-ccs:</p><ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_19102/shard-rkl-3/igt@kms_ccs@bad-pixel-format-4-tiled-mtl-mc-ccs.h=
tml">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/=
issues/14098">i915#14098</a> / <a href=3D"https://gitlab.freedesktop.org/dr=
m/i915/kernel/-/issues/6095">i915#6095</a>) -&gt; <a href=3D"https://intel-=
gfx-ci.01.org/tree/drm-tip/Patchwork_169493v4/shard-rkl-6/igt@kms_ccs@bad-p=
ixel-format-4-tiled-mtl-mc-ccs.html">SKIP</a> (<a href=3D"https://gitlab.fr=
eedesktop.org/drm/i915/kernel/-/issues/14098">i915#14098</a> / <a href=3D"h=
ttps://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a=
> / <a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6095=
">i915#6095</a>) +3 other tests skip</li>
</ul></li>
<li>
<p>igt@kms_ccs@bad-pixel-format-4-tiled-mtl-mc-ccs@pipe-b-hdmi-a-2:</p><ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_19102/shard-rkl-3/igt@kms_ccs@bad-pixel-format-4-tiled-mtl-mc-ccs@p=
ipe-b-hdmi-a-2.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/dr=
m/i915/kernel/-/issues/6095">i915#6095</a>) -&gt; <a href=3D"https://intel-=
gfx-ci.01.org/tree/drm-tip/Patchwork_169493v4/shard-rkl-6/igt@kms_ccs@bad-p=
ixel-format-4-tiled-mtl-mc-ccs@pipe-b-hdmi-a-2.html">SKIP</a> (<a href=3D"h=
ttps://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a=
> / <a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6095=
">i915#6095</a>) +3 other tests skip</li>
</ul></li>
<li>
<p>igt@kms_ccs@bad-rotation-90-4-tiled-mtl-mc-ccs@pipe-b-hdmi-a-2:</p><ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_19102/shard-rkl-6/igt@kms_ccs@bad-rotation-90-4-tiled-mtl-mc-ccs@pi=
pe-b-hdmi-a-2.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm=
/i915/kernel/-/issues/14544">i915#14544</a> / <a href=3D"https://gitlab.fre=
edesktop.org/drm/i915/kernel/-/issues/6095">i915#6095</a>) -&gt; <a href=3D=
"https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_169493v4/shard-rkl-4/ig=
t@kms_ccs@bad-rotation-90-4-tiled-mtl-mc-ccs@pipe-b-hdmi-a-2.html">SKIP</a>=
 (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6095">=
i915#6095</a>) +6 other tests skip</li>
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
69493v4/shard-rkl-3/igt@kms_ccs@crc-primary-suspend-4-tiled-dg2-rc-ccs@pipe=
-c-hdmi-a-2.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i=
915/kernel/-/issues/14098">i915#14098</a> / <a href=3D"https://gitlab.freed=
esktop.org/drm/i915/kernel/-/issues/6095">i915#6095</a>) +7 other tests ski=
p</li>
</ul></li>
<li>
<p>igt@kms_cdclk@mode-transition-all-outputs:</p><ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_19102/shard-rkl-4/igt@kms_cdclk@mode-transition-all-outputs.html">S=
KIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues=
/3742">i915#3742</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm=
-tip/Patchwork_169493v4/shard-rkl-6/igt@kms_cdclk@mode-transition-all-outpu=
ts.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kerne=
l/-/issues/14544">i915#14544</a> / <a href=3D"https://gitlab.freedesktop.or=
g/drm/i915/kernel/-/issues/3742">i915#3742</a>)</li>
</ul></li>
<li>
<p>igt@kms_chamelium_color@ctm-green-to-red:</p><ul>
<li>shard-dg1:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_19102/shard-dg1-17/igt@kms_chamelium_color@ctm-green-to-red.html">S=
KIP</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork=
_169493v4/shard-dg1-19/igt@kms_chamelium_color@ctm-green-to-red.html">SKIP<=
/a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/442=
3">i915#4423</a>)</li>
</ul></li>
<li>
<p>igt@kms_chamelium_edid@hdmi-edid-stress-resolution-non-4k:</p><ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_19102/shard-rkl-6/igt@kms_chamelium_edid@hdmi-edid-stress-resolutio=
n-non-4k.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915=
/kernel/-/issues/11151">i915#11151</a> / <a href=3D"https://gitlab.freedesk=
top.org/drm/i915/kernel/-/issues/14544">i915#14544</a> / <a href=3D"https:/=
/gitlab.freedesktop.org/drm/i915/kernel/-/issues/7828">i915#7828</a>) -&gt;=
 <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_169493v4/sha=
rd-rkl-4/igt@kms_chamelium_edid@hdmi-edid-stress-resolution-non-4k.html">SK=
IP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/=
11151">i915#11151</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i915/=
kernel/-/issues/7828">i915#7828</a>) +2 other tests skip</li>
</ul></li>
<li>
<p>igt@kms_chamelium_frames@hdmi-crc-nonplanar-formats:</p><ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_19102/shard-rkl-3/igt@kms_chamelium_frames@hdmi-crc-nonplanar-forma=
ts.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kerne=
l/-/issues/11151">i915#11151</a> / <a href=3D"https://gitlab.freedesktop.or=
g/drm/i915/kernel/-/issues/7828">i915#7828</a>) -&gt; <a href=3D"https://in=
tel-gfx-ci.01.org/tree/drm-tip/Patchwork_169493v4/shard-rkl-6/igt@kms_chame=
lium_frames@hdmi-crc-nonplanar-formats.html">SKIP</a> (<a href=3D"https://g=
itlab.freedesktop.org/drm/i915/kernel/-/issues/11151">i915#11151</a> / <a h=
ref=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#=
14544</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/iss=
ues/7828">i915#7828</a>)</li>
</ul></li>
<li>
<p>igt@kms_content_protection@dp-mst-type-0-hdcp14:</p><ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_19102/shard-rkl-3/igt@kms_content_protection@dp-mst-type-0-hdcp14.h=
tml">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/=
issues/15330">i915#15330</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/Patchwork_169493v4/shard-rkl-6/igt@kms_content_protection@dp-m=
st-type-0-hdcp14.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/=
drm/i915/kernel/-/issues/14544">i915#14544</a> / <a href=3D"https://gitlab.=
freedesktop.org/drm/i915/kernel/-/issues/15330">i915#15330</a>) +1 other te=
st skip</li>
</ul></li>
<li>
<p>igt@kms_content_protection@mei-interface:</p><ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_19102/shard-rkl-4/igt@kms_content_protection@mei-interface.html">SK=
IP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/=
15865">i915#15865</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/dr=
m-tip/Patchwork_169493v4/shard-rkl-6/igt@kms_content_protection@mei-interfa=
ce.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kerne=
l/-/issues/14544">i915#14544</a> / <a href=3D"https://gitlab.freedesktop.or=
g/drm/i915/kernel/-/issues/15865">i915#15865</a>) +1 other test skip</li>
</ul></li>
<li>
<p>igt@kms_cursor_crc@cursor-offscreen-512x170:</p><ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_19102/shard-rkl-6/igt@kms_cursor_crc@cursor-offscreen-512x170.html"=
>SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issu=
es/13049">i915#13049</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i9=
15/kernel/-/issues/14544">i915#14544</a>) -&gt; <a href=3D"https://intel-gf=
x-ci.01.org/tree/drm-tip/Patchwork_169493v4/shard-rkl-4/igt@kms_cursor_crc@=
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
.org/tree/drm-tip/Patchwork_169493v4/shard-rkl-3/igt@kms_cursor_crc@cursor-=
random-32x32.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/=
i915/kernel/-/issues/3555">i915#3555</a>)</li>
</ul></li>
<li>
<p>igt@kms_dsc@dsc-with-bpc:</p><ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_19102/shard-rkl-6/igt@kms_dsc@dsc-with-bpc.html">SKIP</a> (<a href=
=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#145=
44</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues=
/16361">i915#16361</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/d=
rm-tip/Patchwork_169493v4/shard-rkl-4/igt@kms_dsc@dsc-with-bpc.html">SKIP</=
a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/1636=
1">i915#16361</a>)</li>
</ul></li>
<li>
<p>igt@kms_dsc@dsc-with-output-formats-with-bpc-bigjoiner:</p><ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_19102/shard-rkl-4/igt@kms_dsc@dsc-with-output-formats-with-bpc-bigj=
oiner.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/ke=
rnel/-/issues/16361">i915#16361</a>) -&gt; <a href=3D"https://intel-gfx-ci.=
01.org/tree/drm-tip/Patchwork_169493v4/shard-rkl-6/igt@kms_dsc@dsc-with-out=
put-formats-with-bpc-bigjoiner.html">SKIP</a> (<a href=3D"https://gitlab.fr=
eedesktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a> / <a href=3D"h=
ttps://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16361">i915#16361</a=
>) +1 other test skip</li>
</ul></li>
<li>
<p>igt@kms_flip@2x-flip-vs-fences-interruptible:</p><ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_19102/shard-rkl-6/igt@kms_flip@2x-flip-vs-fences-interruptible.html=
">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/iss=
ues/14544">i915#14544</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i=
915/kernel/-/issues/9934">i915#9934</a>) -&gt; <a href=3D"https://intel-gfx=
-ci.01.org/tree/drm-tip/Patchwork_169493v4/shard-rkl-4/igt@kms_flip@2x-flip=
-vs-fences-interruptible.html">SKIP</a> (<a href=3D"https://gitlab.freedesk=
top.org/drm/i915/kernel/-/issues/9934">i915#9934</a>)</li>
</ul></li>
<li>
<p>igt@kms_flip@2x-nonexisting-fb-interruptible:</p><ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_19102/shard-rkl-4/igt@kms_flip@2x-nonexisting-fb-interruptible.html=
">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/iss=
ues/9934">i915#9934</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/=
drm-tip/Patchwork_169493v4/shard-rkl-6/igt@kms_flip@2x-nonexisting-fb-inter=
ruptible.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915=
/kernel/-/issues/14544">i915#14544</a> / <a href=3D"https://gitlab.freedesk=
top.org/drm/i915/kernel/-/issues/9934">i915#9934</a>)</li>
</ul></li>
<li>
<p>igt@kms_flip_scaled_crc@flip-32bpp-4tile-to-64bpp-4tile-downscaling:</p>=
<ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_19102/shard-rkl-4/igt@kms_flip_scaled_crc@flip-32bpp-4tile-to-64bpp=
-4tile-downscaling.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.or=
g/drm/i915/kernel/-/issues/15643">i915#15643</a>) -&gt; <a href=3D"https://=
intel-gfx-ci.01.org/tree/drm-tip/Patchwork_169493v4/shard-rkl-6/igt@kms_fli=
p_scaled_crc@flip-32bpp-4tile-to-64bpp-4tile-downscaling.html">SKIP</a> (<a=
 href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i91=
5#14544</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/i=
ssues/15643">i915#15643</a>)</li>
</ul></li>
<li>
<p>igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-16bpp-yftile-upscaling:</p>=
<ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_19102/shard-rkl-6/igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-16bp=
p-yftile-upscaling.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.or=
g/drm/i915/kernel/-/issues/14544">i915#14544</a> / <a href=3D"https://gitla=
b.freedesktop.org/drm/i915/kernel/-/issues/15643">i915#15643</a>) -&gt; <a =
href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_169493v4/shard-r=
kl-4/igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-16bpp-yftile-upscaling.ht=
ml">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/i=
ssues/15643">i915#15643</a>) +2 other tests skip</li>
</ul></li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-2p-primscrn-pri-shrfb-draw-mmap-gtt:</p=
><ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_19102/shard-rkl-3/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-pri-=
shrfb-draw-mmap-gtt.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.o=
rg/drm/i915/kernel/-/issues/1825">i915#1825</a>) -&gt; <a href=3D"https://i=
ntel-gfx-ci.01.org/tree/drm-tip/Patchwork_169493v4/shard-rkl-6/igt@kms_fron=
tbuffer_tracking@fbc-2p-primscrn-pri-shrfb-draw-mmap-gtt.html">SKIP</a> (<a=
 href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i91=
5#14544</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/i=
ssues/1825">i915#1825</a>)</li>
</ul></li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-pri-indfb-draw-mmap-wc:<=
/p><ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_19102/shard-rkl-6/igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-p=
ri-indfb-draw-mmap-wc.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop=
.org/drm/i915/kernel/-/issues/14544">i915#14544</a> / <a href=3D"https://gi=
tlab.freedesktop.org/drm/i915/kernel/-/issues/1825">i915#1825</a>) -&gt; <a=
 href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_169493v4/shard-=
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
169493v4/shard-dg1-12/igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-cur-i=
ndfb-draw-mmap-wc.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org=
/drm/i915/kernel/-/issues/15990">i915#15990</a> / <a href=3D"https://gitlab=
.freedesktop.org/drm/i915/kernel/-/issues/8708">i915#8708</a>)</li>
</ul></li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-rgb101010-draw-mmap-wc:</p><ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_19102/shard-rkl-3/igt@kms_frontbuffer_tracking@fbcpsr-rgb101010-dra=
w-mmap-wc.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i91=
5/kernel/-/issues/15102">i915#15102</a>) -&gt; <a href=3D"https://intel-gfx=
-ci.01.org/tree/drm-tip/Patchwork_169493v4/shard-rkl-6/igt@kms_frontbuffer_=
tracking@fbcpsr-rgb101010-draw-mmap-wc.html">SKIP</a> (<a href=3D"https://g=
itlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a> / <a h=
ref=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15102">i915#=
15102</a>) +16 other tests skip</li>
</ul></li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsrhdr-1p-primscrn-spr-indfb-draw-blt:</=
p><ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_19102/shard-rkl-6/igt@kms_frontbuffer_tracking@fbcpsrhdr-1p-primscr=
n-spr-indfb-draw-blt.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.=
org/drm/i915/kernel/-/issues/14544">i915#14544</a> / <a href=3D"https://git=
lab.freedesktop.org/drm/i915/kernel/-/issues/15102">i915#15102</a>) -&gt; <=
a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_169493v4/shard=
-rkl-3/igt@kms_frontbuffer_tracking@fbcpsrhdr-1p-primscrn-spr-indfb-draw-bl=
t.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel=
/-/issues/15102">i915#15102</a>) +13 other tests skip</li>
</ul></li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsrhdr-2p-scndscrn-shrfb-plflip-blt:</p>=
<ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_19102/shard-rkl-4/igt@kms_frontbuffer_tracking@fbcpsrhdr-2p-scndscr=
n-shrfb-plflip-blt.html">SKIP</a> -&gt; <a href=3D"https://intel-gfx-ci.01.=
org/tree/drm-tip/Patchwork_169493v4/shard-rkl-6/igt@kms_frontbuffer_trackin=
g@fbcpsrhdr-2p-scndscrn-shrfb-plflip-blt.html">SKIP</a> (<a href=3D"https:/=
/gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a>) +28=
 other tests skip</li>
</ul></li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-1p-offscreen-pri-indfb-draw-mmap-gtt:</=
p><ul>
<li>shard-dg1:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_19102/shard-dg1-14/igt@kms_frontbuffer_tracking@psr-1p-offscreen-pr=
i-indfb-draw-mmap-gtt.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop=
.org/drm/i915/kernel/-/issues/15104">i915#15104</a> / <a href=3D"https://gi=
tlab.freedesktop.org/drm/i915/kernel/-/issues/15990">i915#15990</a>) -&gt; =
<a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_169493v4/shar=
d-dg1-17/igt@kms_frontbuffer_tracking@psr-1p-offscreen-pri-indfb-draw-mmap-=
gtt.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kern=
el/-/issues/15104">i915#15104</a> / <a href=3D"https://gitlab.freedesktop.o=
rg/drm/i915/kernel/-/issues/15990">i915#15990</a> / <a href=3D"https://gitl=
ab.freedesktop.org/drm/i915/kernel/-/issues/4423">i915#4423</a>)</li>
</ul></li>
<li>
<p>igt@kms_joiner@basic-force-big-joiner:</p><ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_19102/shard-rkl-6/igt@kms_joiner@basic-force-big-joiner.html">SKIP<=
/a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/145=
44">i915#14544</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i915/ker=
nel/-/issues/15459">i915#15459</a>) -&gt; <a href=3D"https://intel-gfx-ci.0=
1.org/tree/drm-tip/Patchwork_169493v4/shard-rkl-4/igt@kms_joiner@basic-forc=
e-big-joiner.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/=
i915/kernel/-/issues/15459">i915#15459</a>)</li>
</ul></li>
<li>
<p>igt@kms_joiner@basic-ultra-joiner:</p><ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_19102/shard-rkl-3/igt@kms_joiner@basic-ultra-joiner.html">SKIP</a> =
(<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15458">=
i915#15458</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/P=
atchwork_169493v4/shard-rkl-6/igt@kms_joiner@basic-ultra-joiner.html">SKIP<=
/a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/145=
44">i915#14544</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i915/ker=
nel/-/issues/15458">i915#15458</a>)</li>
</ul></li>
<li>
<p>igt@kms_plane@pixel-format-4-tiled-mtl-mc-ccs-modifier:</p><ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_19102/shard-rkl-4/igt@kms_plane@pixel-format-4-tiled-mtl-mc-ccs-mod=
ifier.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/ke=
rnel/-/issues/15709">i915#15709</a>) -&gt; <a href=3D"https://intel-gfx-ci.=
01.org/tree/drm-tip/Patchwork_169493v4/shard-rkl-6/igt@kms_plane@pixel-form=
at-4-tiled-mtl-mc-ccs-modifier.html">SKIP</a> (<a href=3D"https://gitlab.fr=
eedesktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a> / <a href=3D"h=
ttps://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15709">i915#15709</a=
>) +1 other test skip</li>
</ul></li>
<li>
<p>igt@kms_plane@pixel-format-y-tiled-ccs-modifier:</p><ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_19102/shard-rkl-6/igt@kms_plane@pixel-format-y-tiled-ccs-modifier.h=
tml">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/=
issues/14544">i915#14544</a> / <a href=3D"https://gitlab.freedesktop.org/dr=
m/i915/kernel/-/issues/15709">i915#15709</a>) -&gt; <a href=3D"https://inte=
l-gfx-ci.01.org/tree/drm-tip/Patchwork_169493v4/shard-rkl-4/igt@kms_plane@p=
ixel-format-y-tiled-ccs-modifier.html">SKIP</a> (<a href=3D"https://gitlab.=
freedesktop.org/drm/i915/kernel/-/issues/15709">i915#15709</a>) +1 other te=
st skip</li>
</ul></li>
<li>
<p>igt@kms_pm_backlight@bad-brightness:</p><ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_19102/shard-rkl-4/igt@kms_pm_backlight@bad-brightness.html">SKIP</a=
> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12343=
">i915#12343</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i915/kerne=
l/-/issues/5354">i915#5354</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.or=
g/tree/drm-tip/Patchwork_169493v4/shard-rkl-6/igt@kms_pm_backlight@bad-brig=
htness.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/k=
ernel/-/issues/12343">i915#12343</a> / <a href=3D"https://gitlab.freedeskto=
p.org/drm/i915/kernel/-/issues/14544">i915#14544</a> / <a href=3D"https://g=
itlab.freedesktop.org/drm/i915/kernel/-/issues/5354">i915#5354</a>)</li>
</ul></li>
<li>
<p>igt@kms_pm_dc@dc5-psr:</p><ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_19102/shard-rkl-3/igt@kms_pm_dc@dc5-psr.html">SKIP</a> (<a href=3D"=
https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15948">i915#15948</=
a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_169=
493v4/shard-rkl-6/igt@kms_pm_dc@dc5-psr.html">SKIP</a> (<a href=3D"https://=
gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a> / <a =
href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15948">i915=
#15948</a>)</li>
</ul></li>
<li>
<p>igt@kms_pm_dc@dc6-psr:</p><ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_19102/shard-rkl-6/igt@kms_pm_dc@dc6-psr.html">SKIP</a> (<a href=3D"=
https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14544</=
a> / <a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/159=
48">i915#15948</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-t=
ip/Patchwork_169493v4/shard-rkl-4/igt@kms_pm_dc@dc6-psr.html">SKIP</a> (<a =
href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15948">i915=
#15948</a>)</li>
</ul></li>
<li>
<p>igt@kms_prime@d3hot:</p><ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_19102/shard-rkl-4/igt@kms_prime@d3hot.html">SKIP</a> (<a href=3D"ht=
tps://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6524">i915#6524</a>) =
-&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_169493v=
4/shard-rkl-6/igt@kms_prime@d3hot.html">SKIP</a> (<a href=3D"https://gitlab=
.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a> / <a href=
=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6524">i915#6524=
</a>)</li>
</ul></li>
<li>
<p>igt@kms_psr2_sf@psr2-cursor-plane-update-sf:</p><ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_19102/shard-rkl-3/igt@kms_psr2_sf@psr2-cursor-plane-update-sf.html"=
>SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issu=
es/11520">i915#11520</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree=
/drm-tip/Patchwork_169493v4/shard-rkl-6/igt@kms_psr2_sf@psr2-cursor-plane-u=
pdate-sf.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915=
/kernel/-/issues/11520">i915#11520</a> / <a href=3D"https://gitlab.freedesk=
top.org/drm/i915/kernel/-/issues/14544">i915#14544</a>) +1 other test skip<=
/li>
</ul></li>
<li>
<p>igt@kms_psr2_sf@psr2-overlay-plane-move-continuous-exceed-sf:</p><ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_19102/shard-rkl-6/igt@kms_psr2_sf@psr2-overlay-plane-move-continuou=
s-exceed-sf.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i=
915/kernel/-/issues/11520">i915#11520</a> / <a href=3D"https://gitlab.freed=
esktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a>) -&gt; <a href=3D=
"https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_169493v4/shard-rkl-4/ig=
t@kms_psr2_sf@psr2-overlay-plane-move-continuous-exceed-sf.html">SKIP</a> (=
<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11520">i=
915#11520</a>) +1 other test skip</li>
</ul></li>
<li>
<p>igt@kms_psr@pr-no-drrs:</p><ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_19102/shard-rkl-6/igt@kms_psr@pr-no-drrs.html">SKIP</a> (<a href=3D=
"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/1072">i915#1072</a=
> / <a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/1454=
4">i915#14544</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i915/kern=
el/-/issues/9732">i915#9732</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.o=
rg/tree/drm-tip/Patchwork_169493v4/shard-rkl-4/igt@kms_psr@pr-no-drrs.html"=
>SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issu=
es/1072">i915#1072</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i915=
/kernel/-/issues/9732">i915#9732</a>) +5 other tests skip</li>
</ul></li>
<li>
<p>igt@kms_psr@psr-suspend:</p><ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_19102/shard-rkl-4/igt@kms_psr@psr-suspend.html">SKIP</a> (<a href=
=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/1072">i915#1072=
</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9=
732">i915#9732</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-t=
ip/Patchwork_169493v4/shard-rkl-6/igt@kms_psr@psr-suspend.html">SKIP</a> (<=
a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/1072">i91=
5#1072</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/is=
sues/14544">i915#14544</a> / <a href=3D"https://gitlab.freedesktop.org/drm/=
i915/kernel/-/issues/9732">i915#9732</a>) +4 other tests skip</li>
</ul></li>
<li>
<p>igt@kms_rotation_crc@primary-yf-tiled-reflect-x-270:</p><ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_19102/shard-rkl-6/igt@kms_rotation_crc@primary-yf-tiled-reflect-x-2=
70.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kerne=
l/-/issues/14544">i915#14544</a> / <a href=3D"https://gitlab.freedesktop.or=
g/drm/i915/kernel/-/issues/5289">i915#5289</a>) -&gt; <a href=3D"https://in=
tel-gfx-ci.01.org/tree/drm-tip/Patchwork_169493v4/shard-rkl-4/igt@kms_rotat=
ion_crc@primary-yf-tiled-reflect-x-270.html">SKIP</a> (<a href=3D"https://g=
itlab.freedesktop.org/drm/i915/kernel/-/issues/5289">i915#5289</a>) +1 othe=
r test skip</li>
</ul></li>
<li>
<p>igt@kms_setmode@basic-clone-single-crtc:</p><ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_19102/shard-rkl-4/igt@kms_setmode@basic-clone-single-crtc.html">SKI=
P</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3=
555">i915#3555</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-t=
ip/Patchwork_169493v4/shard-rkl-6/igt@kms_setmode@basic-clone-single-crtc.h=
tml">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/=
issues/14544">i915#14544</a> / <a href=3D"https://gitlab.freedesktop.org/dr=
m/i915/kernel/-/issues/3555">i915#3555</a>) +1 other test skip</li>
</ul></li>
</ul><h3>Piglit changes</h3><p>{name}: This element is suppressed. This mea=
ns it is ignored when computing<br> the status of the difference (SUCCESS, =
WARNING, or FAILURE).</p><h2>Build changes</h2><ul>
<li>Linux: CI_DRM_19102 -&gt; Patchwork_169493v4</li>
</ul><p>CI-20190529: 20190529<br> CI_DRM_19102: 06602b51786b6c2a0f97e58f0e0=
f168be1ada27e @ git://anongit.freedesktop.org/gfx-ci/linux<br> IGT_9085: 90=
85<br> Patchwork_169493v4: 06602b51786b6c2a0f97e58f0e0f168be1ada27e @ git:/=
/anongit.freedesktop.org/gfx-ci/linux<br> piglit_4509: fdc5a4ca11124ab8413c=
7988896eec4c97336694 @ git://anongit.freedesktop.org/piglit</p></blockquote=
><div><br></div><div><span></span></div></body></html>

--=-S4r2Zhz32Rjo7XQ2uVGG--
