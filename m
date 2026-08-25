Return-Path: <intel-gfx-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DFA30C5DF94
	for <intel-gfx@archiver.kernel.org>; Tue, 25 Aug 2026 09:18:01 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 45F4E10E16E;
	Tue, 25 Aug 2026 09:18:01 +0000 (UTC)
Received: from coelho.fi (coelho.fi [88.99.146.29])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0C8D210E16E
 for <intel-gfx@lists.freedesktop.org>; Tue, 25 Aug 2026 09:17:58 +0000 (UTC)
Received: from 37-33-54-222.bb.dnainternet.fi ([37.33.54.222]
 helo=[192.168.101.111])
 by coelho.fi with esmtpsa (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
 (Exim 4.98.2) (envelope-from <luca@coelho.fi>)
 id 1wynHy-00000002s7F-1ZJn; Tue, 25 Aug 2026 12:17:57 +0300
Message-ID: <5ff99be5f0a0e45428126ac15f805e7de21c9c5c.camel@coelho.fi>
From: Luca Coelho <luca@coelho.fi>
To: I915-ci-infra@lists.freedesktop.org
Cc: intel-gfx@lists.freedesktop.org
Date: Tue, 25 Aug 2026 12:17:49 +0300
In-Reply-To: <178702032643.60987.4728744555417512335@61270ab9df2a>
References: <20260817092911.342072-1-luciano.coelho@intel.com>
 <178702032643.60987.4728744555417512335@61270ab9df2a>
Content-Type: multipart/alternative; boundary="=-Utt+x+Li/7LJK5gyJsJE"
User-Agent: Evolution 3.56.2-10 
MIME-Version: 1.0
Subject: Re: =?UTF-8?Q?=E2=9C=97?= i915.CI.Full: failure for
 drm/i915/display: reduce clock_gating interface between core and display
 (rev3)
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

--=-Utt+x+Li/7LJK5gyJsJE
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi,

The CI.Full report for series 169493 (rev3, "drm/i915/display: reduce
clock_gating interface between core and display") flags a possible
regression:

igt@perf_pmu@render-node-busy-idle@rcs0 shard-glk9: NOTRUN -> FAIL (+9
other perf_pmu tests failing the same way)

https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_169493v3/shard-glk9/igt@=
perf_pmu@render-node-busy-idle@rcs0.html

This is unrelated to the patchset, which only touches
intel_display_clock_gating.c/.h, intel_display_reset.c/.h,
intel_reset.c and the xe Makefile =E2=80=94 none of which affect PMU busy/i=
dle
accounting.

This matches known issue
https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16492=C2=A0("igt@pe=
rf
_pmu@render-node-busy-idle* - fail - Test assertion failure ... val not
within tolerance"), tagged for platform: GLK / SNB and labeled
cannot_reproduce. That bug was auto-closed on 2026-08-19, one day after
this run (2026-08-18), so patchwork's known-issue matcher no longer
linked it and reported it as a new/unknown regression instead.

Could you please reopen/re-tag #16492 (or re-file if preferred) so this
stops showing up as a false regression on unrelated series?

(analysis and report assisted by Copilot/Claude Sonnet 5)

--
Cheers,
Luca


On Tue, 2026-08-18 at 02:32 +0000, Patchwork wrote:
> Patch Details
>=20
> Series:drm/i915/display: reduce clock_gating interface between core
> and display (rev3)
>=20
> URL:https://patchwork.freedesktop.org/series/169493/
>=20
> State:failure
> Details:
> https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_169493v3/index.html
> CI Bug Log - changes from CI_DRM_19006_full -> Patchwork_169493v3_fullSum=
maryFAILURE
> Serious unknown changes coming with Patchwork_169493v3_full
> absolutely need to be
> verified manually.
> If you think the reported changes have nothing to do with the changes
> introduced in Patchwork_169493v3_full, please notify your bug team
> (I915-ci-infra@lists.freedesktop.org) to allow them
> to document this new failure mode, which will reduce false positives
> in CI.
> Participating hosts (10 -> 10)No changes in participating hosts
> Possible new issuesHere are the unknown changes that may have been introd=
uced in
> Patchwork_169493v3_full:
> IGT changesPossible regressions * igt@perf_pmu@render-node-busy-idle@rcs0=
:shard-glk:          NOTRUN ->FAIL[544
>    ] +9 other tests fail
> New testsNew tests have been introduced between CI_DRM_19006_full and
> Patchwork_169493v3_full:
> New IGT tests (2) *=20
>    igt@gem_lmem_swapping@massive:Statuses : 2 pass(s) 5 skip(s)Exec
>    time: [0.0, 12.29] s
>  *=20
>    igt@gem_lmem_swapping@massive-random:Statuses : 1 pass(s) 3
>    skip(s)Exec time: [0.0, 5.66] s
> Known issuesHere are the changes found in Patchwork_169493v3_full that co=
me from
> known issues:
> IGT changesIssues hit *=20
>    igt@device_reset@cold-reset-bound:shard-tglu: NOTRUN -> SKIP [543]
>    (i915#11078 [206])
>  *=20
>    igt@gem_bad_reloc@negative-reloc-lut:shard-rkl: NOTRUN -> SKIP [542]
>    (i915#14544 [4] / i915#3281 [193]) +1 other test skip
>  *=20
>    igt@gem_basic@multigpu-create-close:shard-rkl: NOTRUN -> SKIP [540]
>    (i915#7697 [539])shard-tglu-1: NOTRUN -> SKIP [541] (i915#7697
>    [539])
>  *=20
>    igt@gem_ccs@block-copy-compressed:shard-tglu-1: NOTRUN -> SKIP [538]
>    (i915#3555 [2] / i915#9323 [536])
>  *=20
>    igt@gem_ccs@block-multicopy-inplace:shard-tglu: NOTRUN -> SKIP [537]
>    (i915#3555 [2] / i915#9323 [536])
>  *=20
>    igt@gem_ccs@suspend-resume@xmajor-compressed-compfmt0-smem-
>    lmem0:shard-dg2: PASS [535] -> INCOMPLETE [534] (i915#13356 [175] /
>    i915#16348 [533])
>  *=20
>    igt@gem_create@create-ext-cpu-access-sanity-check:shard-rkl: NOTRUN
>    -> SKIP [532] (i915#6335 [531])
>  *=20
>    igt@gem_create@create-ext-set-pat:shard-rkl: NOTRUN -> SKIP [530]
>    (i915#8562 [529])
>  *=20
>    igt@gem_ctx_sseu@invalid-args:shard-rkl: NOTRUN -> SKIP [528]
>    (i915#280 [527])
>  *=20
>    igt@gem_eio@in-flight-suspend:shard-glk: NOTRUN -> INCOMPLETE [526]
>    (i915#13390 [525])
>  *=20
>    igt@gem_exec_balancer@parallel-bb-first:shard-tglu-1: NOTRUN -> SKIP
>    [524] (i915#4525 [198])
>  *=20
>    igt@gem_exec_capture@capture-invisible@smem0:shard-tglu: NOTRUN ->
>    SKIP [523] (i915#6334 [522]) +1 other test skip
>  *=20
>    igt@gem_exec_capture@capture-recoverable:shard-rkl: NOTRUN -> SKIP
>    [521] (i915#14544 [4] / i915#6344 [520])
>  *=20
>    igt@gem_exec_reloc@basic-gtt-cpu:shard-rkl: NOTRUN -> SKIP [519]
>    (i915#3281 [193]) +5 other tests skip
>  *=20
>    igt@gem_huc_copy@huc-copy:shard-tglu: NOTRUN -> SKIP [518]
>    (i915#2190 [517])
>  *=20
>    igt@gem_lmem_evict@dontneed-evict-race:shard-tglu-1: NOTRUN -> SKIP
>    [516] (i915#4613 [188] / i915#7582 [515])
>  *=20
>    igt@gem_lmem_swapping@heavy-verify-multi-ccs:shard-tglu-1: NOTRUN ->
>    SKIP [514] (i915#4613 [188])
>  *=20
>    igt@gem_lmem_swapping@heavy-verify-random-ccs:shard-rkl: NOTRUN ->
>    SKIP [513] (i915#4613 [188]) +4 other tests skip
>  *=20
>    igt@gem_lmem_swapping@massive-random (NEW):shard-glk: NOTRUN -> SKIP
>    [512] (i915#4613 [188]) +1 other test skip
>  *=20
>    igt@gem_mmap_offset@clear-via-pagefault:shard-mtlp: PASS [511] ->
>    TIMEOUT [510] (i915#16021 [509] / i915#16168 [508] / i915#16349
>    [507]) +1 other test timeout
>  *=20
>    igt@gem_partial_pwrite_pread@writes-after-reads-uncached:shard-rkl:
>    NOTRUN -> SKIP [506] (i915#3282 [182]) +5 other tests skip
>  *=20
>    igt@gem_pxp@hw-rejects-pxp-context:shard-rkl: NOTRUN -> SKIP [503]
>    (i915#13717 [502])shard-tglu-1: NOTRUN -> SKIP [505] (i915#13398
>    [504])
>  *=20
>    igt@gem_userptr_blits@coherency-sync:shard-tglu: NOTRUN -> SKIP
>    [501] (i915#3297 [177]) +1 other test skip
>  *=20
>    igt@gem_userptr_blits@coherency-unsync:shard-rkl: NOTRUN -> SKIP
>    [499] (i915#3297 [177])shard-tglu-1: NOTRUN -> SKIP [500] (i915#3297
>    [177]) +1 other test skip
>  *=20
>    igt@gem_userptr_blits@forbidden-operations:shard-rkl: NOTRUN -> SKIP
>    [498] (i915#3282 [182] / i915#3297 [177])
>  *=20
>    igt@gem_userptr_blits@unsync-overlap:shard-rkl: NOTRUN -> SKIP [497]
>    (i915#14544 [4] / i915#3297 [177])
>  *=20
>    igt@gem_workarounds@suspend-resume-fd:shard-glk11: NOTRUN ->
>    INCOMPLETE [496] (i915#13356 [175] / i915#14586 [495])
>  *=20
>    igt@gen9_exec_parse@batch-without-end:shard-rkl: NOTRUN -> SKIP
>    [494] (i915#2527 [168]) +1 other test skip
>  *=20
>    igt@gen9_exec_parse@secure-batches:shard-tglu-1: NOTRUN -> SKIP
>    [493] (i915#2527 [168] / i915#2856 [491]) +1 other test skip
>  *=20
>    igt@gen9_exec_parse@unaligned-jump:shard-tglu: NOTRUN -> SKIP [492]
>    (i915#2527 [168] / i915#2856 [491]) +2 other tests skip
>  *=20
>    igt@gpu_buddy@gpu_buddy:shard-tglu-1: NOTRUN -> SKIP [490]
>    (i915#15678 [489])
>  *=20
>    igt@i915_pm_freq_api@freq-reset-multiple:shard-rkl: NOTRUN -> SKIP
>    [488] (i915#8399 [486])
>  *=20
>    igt@i915_pm_freq_api@freq-suspend:shard-rkl: NOTRUN -> SKIP [487]
>    (i915#14544 [4] / i915#8399 [486])
>  *=20
>    igt@i915_pm_rpm@system-suspend-execbuf:shard-glk: NOTRUN ->
>    INCOMPLETE [483] (i915#13356 [175] / i915#15172 [482])shard-rkl:
>    PASS [485] -> INCOMPLETE [484] (i915#13356 [175])
>  *=20
>    igt@i915_pm_sseu@full-enable:shard-rkl: NOTRUN -> SKIP [481]
>    (i915#14544 [4] / i915#4387 [480])
>  *=20
>    igt@i915_query@query-topology-unsupported:shard-rkl: NOTRUN -> SKIP
>    [479] (i915#16079 [478])
>  *=20
>    igt@intel_hwmon@hwmon-read:shard-rkl: NOTRUN -> SKIP [476]
>    (i915#7707 [475])shard-tglu-1: NOTRUN -> SKIP [477] (i915#7707
>    [475]) +1 other test skip
>  *=20
>    igt@kms_async_flips@alternate-sync-async-flip-atomic@pipe-a-hdmi-a-
>    1:shard-glk: PASS [474] -> FAIL [473] (i915#14888 [472]) +4 other
>    tests fail
>  *=20
>    igt@kms_atomic_transition@plane-all-modeset-transition-fencing-
>    internal-panels:shard-tglu-1: NOTRUN -> SKIP [471] (i915#1769 [470]
>    / i915#3555 [2])
>  *=20
>    igt@kms_big_fb@4-tiled-32bpp-rotate-0:shard-tglu-1: NOTRUN -> SKIP
>    [469] (i915#5286 [153]) +3 other tests skip
>  *=20
>    igt@kms_big_fb@4-tiled-8bpp-rotate-0:shard-tglu: NOTRUN -> SKIP
>    [468] (i915#5286 [153]) +1 other test skip
>  *=20
>    igt@kms_big_fb@4-tiled-addfb-size-offset-overflow:shard-rkl: NOTRUN
>    -> SKIP [467] (i915#14544 [4] / i915#5286 [153])
>  *=20
>    igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-180:shard-rkl:
>    NOTRUN -> SKIP [466] (i915#5286 [153]) +4 other tests skip
>  *=20
>    igt@kms_big_fb@linear-max-hw-stride-32bpp-rotate-180:shard-dg1: PASS
>    [465] -> FAIL [464] (i915#5138 [463])
>  *=20
>    igt@kms_big_fb@linear-max-hw-stride-64bpp-rotate-180-hflip:shard-
>    tglu-1: NOTRUN -> SKIP [462] (i915#3828 [23])
>  *=20
>    igt@kms_big_fb@y-tiled-8bpp-rotate-270:shard-rkl: NOTRUN -> SKIP
>    [461] (i915#3638 [150]) +1 other test skip
>  *=20
>    igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-180:shard-rkl:
>    NOTRUN -> SKIP [460] +79 other tests skip
>  *=20
>    igt@kms_ccs@bad-aux-stride-4-tiled-mtl-mc-ccs@pipe-a-hdmi-a-4:shard-
>    dg1: NOTRUN -> SKIP [459] (i915#6095 [140]) +207 other tests skip
>  *=20
>    igt@kms_ccs@ccs-on-another-bo-y-tiled-gen12-mc-ccs@pipe-b-hdmi-a-
>    1:shard-tglu: NOTRUN -> SKIP [458] (i915#6095 [140]) +24 other tests
>    skip
>  *=20
>    igt@kms_ccs@crc-primary-basic-4-tiled-bmg-ccs:shard-rkl: NOTRUN ->
>    SKIP [457] (i915#12313 [448])
>  *=20
>    igt@kms_ccs@crc-primary-basic-y-tiled-ccs:shard-tglu-1: NOTRUN ->
>    SKIP [456] (i915#6095 [140]) +59 other tests skip
>  *=20
>    igt@kms_ccs@crc-primary-basic-y-tiled-gen12-rc-ccs@pipe-d-hdmi-a-
>    1:shard-dg2: NOTRUN -> SKIP [455] (i915#10307 [445] / i915#10434
>    [454] / i915#6095 [140]) +1 other test skip
>  *=20
>    igt@kms_ccs@crc-primary-rotation-180-4-tiled-lnl-ccs:shard-tglu-1:
>    NOTRUN -> SKIP [453] (i915#12313 [448])
>  *=20
>    igt@kms_ccs@crc-primary-suspend-4-tiled-mtl-rc-ccs@pipe-c-hdmi-a-
>    1:shard-dg2: NOTRUN -> SKIP [452] (i915#6095 [140]) +15 other tests
>    skip
>  *=20
>    igt@kms_ccs@crc-primary-suspend-y-tiled-ccs:shard-glk10: NOTRUN ->
>    INCOMPLETE [451] (i915#15582 [247]) +1 other test incomplete
>  *=20
>    igt@kms_ccs@crc-sprite-planes-basic-4-tiled-dg2-rc-ccs@pipe-b-hdmi-
>    a-2:shard-rkl: NOTRUN -> SKIP [450] (i915#6095 [140]) +54 other
>    tests skip
>  *=20
>    igt@kms_ccs@crc-sprite-planes-basic-4-tiled-lnl-ccs:shard-tglu:
>    NOTRUN -> SKIP [449] (i915#12313 [448])
>  *=20
>    igt@kms_ccs@crc-sprite-planes-basic-y-tiled-ccs@pipe-c-hdmi-a-
>    1:shard-rkl: NOTRUN -> SKIP [447] (i915#14098 [141] / i915#6095
>    [140]) +36 other tests skip
>  *=20
>    igt@kms_ccs@missing-ccs-buffer-4-tiled-mtl-mc-ccs@pipe-b-hdmi-a-
>    1:shard-dg2: NOTRUN -> SKIP [446] (i915#10307 [445] / i915#6095
>    [140]) +73 other tests skip
>  *=20
>    igt@kms_ccs@random-ccs-data-4-tiled-dg2-mc-ccs@pipe-c-hdmi-a-
>    2:shard-rkl: NOTRUN -> SKIP [444] (i915#14098 [141] / i915#14544 [4]
>    / i915#6095 [140]) +9 other tests skip
>  *=20
>    igt@kms_ccs@random-ccs-data-4-tiled-mtl-rc-ccs@pipe-b-hdmi-a-
>    2:shard-rkl: NOTRUN -> SKIP [443] (i915#14544 [4] / i915#6095 [140])
>    +12 other tests skip
>  *=20
>    igt@kms_chamelium_audio@dp-audio-after-suspend:shard-tglu: NOTRUN ->
>    SKIP [442] (i915#11151 [132])
>  *=20
>    igt@kms_chamelium_audio@hdmi-audio-after-suspend:shard-rkl: NOTRUN -
>    > SKIP [440] (i915#11151 [132])shard-tglu-1: NOTRUN -> SKIP [441]
>    (i915#11151 [132])
>  *=20
>    igt@kms_chamelium_color_pipeline@plane-lut1d-pre-ctm3x4:shard-tglu:
>    NOTRUN -> SKIP [439] (i915#16471 [137])
>  *=20
>    igt@kms_chamelium_edid@hdmi-edid-read:shard-rkl: NOTRUN -> SKIP
>    [438] (i915#11151 [132] / i915#7828 [131]) +8 other tests skip
>  *=20
>    igt@kms_chamelium_edid@vga-edid-read:shard-tglu: NOTRUN -> SKIP
>    [437] (i915#11151 [132] / i915#7828 [131]) +2 other tests skip
>  *=20
>    igt@kms_chamelium_frames@dp-crc-single:shard-tglu-1: NOTRUN -> SKIP
>    [436] (i915#11151 [132] / i915#7828 [131]) +2 other tests skip
>  *=20
>    igt@kms_chamelium_frames@hdmi-cmp-planar-formats:shard-rkl: NOTRUN -
>    > SKIP [435] (i915#11151 [132] / i915#14544 [4] / i915#7828 [131])
>  *=20
>    igt@kms_content_protection@atomic:shard-rkl: NOTRUN -> SKIP [434]
>    (i915#15865 [124]) +1 other test skip
>  *=20
>    igt@kms_content_protection@atomic-dpms:shard-tglu-1: NOTRUN -> SKIP
>    [433] (i915#15865 [124]) +1 other test skip
>  *=20
>    igt@kms_content_protection@dp-mst-type-0-suspend-resume:shard-tglu:
>    NOTRUN -> SKIP [432] (i915#15330 [126])
>  *=20
>    igt@kms_content_protection@dp-mst-type-1:shard-rkl: NOTRUN -> SKIP
>    [429] (i915#15330 [126] / i915#3116 [428]) +1 other test skipshard-
>    tglu-1: NOTRUN -> SKIP [431] (i915#15330 [126] / i915#3116 [428] /
>    i915#3299 [430])
>  *=20
>    igt@kms_content_protection@srm:shard-tglu: NOTRUN -> SKIP [427]
>    (i915#15865 [124]) +1 other test skip
>  *=20
>    igt@kms_cursor_crc@cursor-random-32x10:shard-rkl: NOTRUN -> SKIP
>    [426] (i915#3555 [2]) +2 other tests skip
>  *=20
>    igt@kms_cursor_crc@cursor-random-512x512:shard-tglu: NOTRUN -> SKIP
>    [425] (i915#13049 [422])
>  *=20
>    igt@kms_cursor_crc@cursor-rapid-movement-512x170:shard-rkl: NOTRUN -
>    > SKIP [423] (i915#13049 [422]) +1 other test skipshard-tglu-1:
>    NOTRUN -> SKIP [424] (i915#13049 [422])
>  *=20
>    igt@kms_cursor_crc@cursor-sliding-32x10:shard-tglu-1: NOTRUN -> SKIP
>    [421] (i915#3555 [2]) +3 other tests skip
>  *=20
>    igt@kms_cursor_legacy@flip-vs-cursor-atomic-transitions:shard-glk:
>    NOTRUN -> FAIL [420] (i915#15804 [118])
>  *=20
>    igt@kms_cursor_legacy@modeset-atomic-cursor-hotspot:shard-tglu:
>    NOTRUN -> SKIP [419] (i915#9067 [418])
>  *=20
>    igt@kms_cursor_legacy@short-busy-flip-before-cursor-toggle:shard-
>    rkl: NOTRUN -> SKIP [417] (i915#14544 [4] / i915#4103 [113])
>  *=20
>    igt@kms_dp_link_training@non-uhbr-mst:shard-tglu: NOTRUN -> SKIP
>    [416] (i915#13749 [415])
>  *=20
>    igt@kms_dp_linktrain_fallback@dp-fallback:shard-tglu: NOTRUN -> SKIP
>    [414] (i915#13707 [413])
>  *=20
>    igt@kms_dsc@dsc-basic:shard-tglu-1: NOTRUN -> SKIP [412] (i915#16361
>    [105]) +2 other tests skip
>  *=20
>    igt@kms_dsc@dsc-basic-bigjoiner:shard-rkl: NOTRUN -> SKIP [411]
>    (i915#16361 [105]) +2 other tests skip
>  *=20
>    igt@kms_dsc@dsc-with-output-formats:shard-rkl: NOTRUN -> SKIP [410]
>    (i915#14544 [4] / i915#16361 [105])
>  *=20
>    igt@kms_fbcon_fbt@psr-suspend:shard-tglu: NOTRUN -> SKIP [409]
>    (i915#16680 [102])
>  *=20
>    igt@kms_feature_discovery@chamelium:shard-rkl: NOTRUN -> SKIP [408]
>    (i915#16084 [407])
>  *=20
>    igt@kms_feature_discovery@display-2x:shard-tglu: NOTRUN -> SKIP
>    [406] (i915#16081 [404])
>  *=20
>    igt@kms_feature_discovery@display-4x:shard-rkl: NOTRUN -> SKIP [405]
>    (i915#16081 [404])
>  *=20
>    igt@kms_feature_discovery@dsc:shard-rkl: NOTRUN -> SKIP [403]
>    (i915#16600 [401])
>  *=20
>    igt@kms_feature_discovery@hdr:shard-tglu-1: NOTRUN -> SKIP [402]
>    (i915#16600 [401])
>  *=20
>    igt@kms_flip@2x-flip-vs-modeset:shard-rkl: NOTRUN -> SKIP [400]
>    (i915#14544 [4] / i915#9934 [94]) +1 other test skip
>  *=20
>    igt@kms_flip@2x-flip-vs-panning-vs-hang:shard-tglu-1: NOTRUN -> SKIP
>    [399] (i915#3637 [396] / i915#9934 [94]) +4 other tests skip
>  *=20
>    igt@kms_flip@2x-flip-vs-suspend:shard-rkl: NOTRUN -> SKIP [398]
>    (i915#9934 [94])
>  *=20
>    igt@kms_flip@2x-nonexisting-fb:shard-tglu: NOTRUN -> SKIP [397]
>    (i915#3637 [396] / i915#9934 [94]) +2 other tests skip
>  *=20
>    igt@kms_flip@flip-vs-expired-vblank:shard-glk: PASS [395] -> FAIL
>    [394] (i915#13027 [393]) +1 other test fail
>  *=20
>    igt@kms_flip@flip-vs-suspend:shard-rkl: PASS [392] -> INCOMPLETE
>    [391] (i915#16276 [389] / i915#6113 [82])
>  *=20
>    igt@kms_flip@flip-vs-suspend@a-hdmi-a2:shard-rkl: NOTRUN ->
>    INCOMPLETE [390] (i915#16276 [389] / i915#6113 [82])
>  *=20
>    igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-32bpp-4tile-
>    upscaling:shard-tglu: NOTRUN -> SKIP [388] (i915#15643 [79]) +1
>    other test skip
>  *=20
>    igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-32bpp-yftile-
>    upscaling:shard-rkl: NOTRUN -> SKIP [386] (i915#15643 [79]) +3 other
>    tests skipshard-tglu-1: NOTRUN -> SKIP [387] (i915#15643 [79]) +2
>    other tests skip
>  *=20
>    igt@kms_frontbuffer_tracking@fbc-2p-primscrn-pri-shrfb-draw-mmap-
>    cpu:shard-tglu-1: NOTRUN -> SKIP [385] +76 other tests skip
>  *=20
>    igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-pri-shrfb-draw-mmap-
>    gtt:shard-rkl: NOTRUN -> SKIP [384] (i915#1825 [61]) +12 other tests
>    skip
>  *=20
>    igt@kms_frontbuffer_tracking@fbc-suspend:shard-glk: NOTRUN ->
>    INCOMPLETE [383] (i915#10056 [382] / i915#16593 [381])
>  *=20
>    igt@kms_frontbuffer_tracking@fbchdr-2p-primscrn-cur-indfb-draw-
>    pwrite:shard-rkl: NOTRUN -> SKIP [380] (i915#14544 [4]) +19 other
>    tests skip
>  *=20
>    igt@kms_frontbuffer_tracking@fbcpsr-rgb565-draw-mmap-wc:shard-tglu-
>    1: NOTRUN -> SKIP [379] (i915#15102 [55]) +26 other tests skip
>  *=20
>    igt@kms_frontbuffer_tracking@fbcpsrhdr-1p-primscrn-pri-indfb-draw-
>    render:shard-snb: NOTRUN -> SKIP [378] +10 other tests skip
>  *=20
>    igt@kms_frontbuffer_tracking@hdr-1p-offscreen-pri-indfb-draw-
>    blt:shard-tglu-1: NOTRUN -> SKIP [377] (i915#15989 [237]) +17 other
>    tests skip
>  *=20
>    igt@kms_frontbuffer_tracking@hdr-1p-offscreen-pri-indfb-draw-mmap-
>    gtt:shard-tglu: NOTRUN -> SKIP [376] (i915#15989 [237]) +7 other
>    tests skip
>  *=20
>    igt@kms_frontbuffer_tracking@hdr-1p-primscrn-cur-indfb-move:shard-
>    glk: PASS [375] -> SKIP [374] +12 other tests skip
>  *=20
>    igt@kms_frontbuffer_tracking@hdr-1p-primscrn-pri-shrfb-draw-mmap-
>    cpu:shard-rkl: NOTRUN -> SKIP [373] (i915#15989 [237]) +18 other
>    tests skip
>  *=20
>    igt@kms_frontbuffer_tracking@hdr-rgb101010-draw-pwrite:shard-rkl:
>    PASS [372] -> SKIP [371] (i915#15989 [237]) +7 other tests skip
>  *=20
>    igt@kms_frontbuffer_tracking@hdr-suspend:shard-rkl: NOTRUN ->
>    INCOMPLETE [370] (i915#16056 [369])
>  *=20
>    igt@kms_frontbuffer_tracking@psr-1p-offscreen-pri-shrfb-draw-
>    blt:shard-tglu: NOTRUN -> SKIP [368] (i915#15102 [55]) +21 other
>    tests skip
>  *=20
>    igt@kms_frontbuffer_tracking@psr-1p-primscrn-pri-shrfb-draw-mmap-
>    gtt:shard-rkl: NOTRUN -> SKIP [367] (i915#14544 [4] / i915#15102
>    [55]) +7 other tests skip
>  *=20
>    igt@kms_frontbuffer_tracking@psr-2p-scndscrn-pri-shrfb-draw-mmap-
>    wc:shard-tglu: NOTRUN -> SKIP [366] +51 other tests skip
>  *=20
>    igt@kms_frontbuffer_tracking@psrhdr-1p-primscrn-spr-indfb-
>    move:shard-rkl: NOTRUN -> SKIP [365] (i915#15102 [55]) +38 other
>    tests skip
>  *=20
>    igt@kms_frontbuffer_tracking@psrhdr-2p-scndscrn-pri-shrfb-draw-
>    pwrite:shard-glk10: NOTRUN -> SKIP [364] +170 other tests skip
>  *=20
>    igt@kms_hdr@bpc-switch-dpms:shard-rkl: PASS [363] -> SKIP [362]
>    (i915#16644 [53] / i915#3555 [2] / i915#8228 [52])
>  *=20
>    igt@kms_hdr@bpc-switch-suspend@pipe-a-hdmi-a-2-xrgb2101010:shard-
>    rkl: NOTRUN -> INCOMPLETE [361] (i915#15436 [50])
>  *=20
>    igt@kms_hdr@brightness-with-hdr:shard-tglu: NOTRUN -> SKIP [360]
>    (i915#12713 [359])
>  *=20
>    igt@kms_hdr@static-swap:shard-rkl: NOTRUN -> SKIP [357] (i915#16644
>    [53] / i915#3555 [2] / i915#8228 [52]) +1 other test skipshard-tglu-
>    1: NOTRUN -> SKIP [358] (i915#3555 [2] / i915#8228 [52])
>  *=20
>    igt@kms_hdr@static-toggle:shard-tglu: NOTRUN -> SKIP [356]
>    (i915#3555 [2] / i915#8228 [52]) +1 other test skip
>  *=20
>    igt@kms_joiner@basic-big-joiner:shard-rkl: NOTRUN -> SKIP [355]
>    (i915#15460 [352])
>  *=20
>    igt@kms_joiner@basic-force-ultra-joiner:shard-glk11: NOTRUN -> SKIP
>    [354] +106 other tests skip
>  *=20
>    igt@kms_joiner@invalid-modeset-big-joiner:shard-tglu-1: NOTRUN ->
>    SKIP [353] (i915#15460 [352])
>  *=20
>    igt@kms_multipipe_modeset@basic-max-pipe-crc-check:shard-tglu-1:
>    NOTRUN -> SKIP [351] (i915#15815 [350])
>  *=20
>    igt@kms_pipe_stress@stress-xrgb8888-untiled:shard-glk11: NOTRUN ->
>    DMESG-WARN [349] (i915#118 [228])
>  *=20
>    igt@kms_plane@pixel-format-4-tiled-dg2-mc-ccs-modifier:shard-tglu:
>    NOTRUN -> SKIP [348] (i915#15709 [40]) +2 other tests skip
>  *=20
>    igt@kms_plane@pixel-format-4-tiled-dg2-rc-ccs-cc-modifier-source-
>    clamping:shard-tglu-1: NOTRUN -> SKIP [347] (i915#15709 [40]) +3
>    other tests skip
>  *=20
>    igt@kms_plane@pixel-format-4-tiled-mtl-rc-ccs-cc-modifier:shard-glk:
>    NOTRUN -> SKIP [346] +180 other tests skip
>  *=20
>    igt@kms_plane@pixel-format-4-tiled-mtl-rc-ccs-cc-modifier-source-
>    clamping:shard-rkl: NOTRUN -> SKIP [345] (i915#15709 [40]) +2 other
>    tests skip
>  *=20
>    igt@kms_plane@pixel-format-4-tiled-mtl-rc-ccs-modifier:shard-rkl:
>    NOTRUN -> SKIP [344] (i915#14544 [4] / i915#15709 [40])
>  *=20
>    igt@kms_plane@planar-pixel-format-settings@nv12-tile4-src-y:shard-
>    tglu-1: NOTRUN -> SKIP [343] (i915#16112 [342])
>  *=20
>    igt@kms_plane@plane-panning-bottom-right-suspend:shard-glk11: NOTRUN
>    -> INCOMPLETE [341] (i915#13026 [340]) +1 other test incomplete
>  *=20
>    igt@kms_plane@plane-panning-bottom-right-suspend@pipe-b:shard-rkl:
>    PASS [339] -> INCOMPLETE [338] (i915#14412 [337]) +1 other test
>    incomplete
>  *=20
>    igt@kms_plane_alpha_blend@alpha-opaque-fb:shard-glk10: NOTRUN ->
>    FAIL [336] (i915#10647 [330] / i915#12169 [335])
>  *=20
>    igt@kms_plane_alpha_blend@alpha-opaque-fb@pipe-c-hdmi-a-1:shard-
>    glk10: NOTRUN -> FAIL [334] (i915#10647 [330]) +1 other test fail
>  *=20
>    igt@kms_plane_alpha_blend@alpha-transparent-fb:shard-glk11: NOTRUN -
>    > FAIL [333] (i915#10647 [330] / i915#12177 [332])
>  *=20
>    igt@kms_plane_alpha_blend@alpha-transparent-fb@pipe-a-hdmi-a-
>    1:shard-glk11: NOTRUN -> FAIL [331] (i915#10647 [330]) +1 other test
>    fail
>  *=20
>    igt@kms_plane_multiple@2x-tiling-4:shard-rkl: NOTRUN -> SKIP [329]
>    (i915#13958 [37])
>  *=20
>    igt@kms_plane_multiple@2x-tiling-yf:shard-rkl: NOTRUN -> SKIP [328]
>    (i915#13958 [37] / i915#14544 [4])
>  *=20
>    igt@kms_plane_scaling@plane-downscale-factor-0-75-with-
>    rotation@pipe-a:shard-rkl: NOTRUN -> SKIP [327] (i915#14544 [4] /
>    i915#15329 [324]) +6 other tests skip
>  *=20
>    igt@kms_plane_scaling@plane-scaler-with-clipping-clamping-
>    rotation:shard-rkl: NOTRUN -> SKIP [326] (i915#14544 [4] /
>    i915#15329 [324] / i915#3555 [2])
>  *=20
>    igt@kms_plane_scaling@plane-upscale-20x20-with-rotation@pipe-
>    a:shard-rkl: NOTRUN -> SKIP [325] (i915#15329 [324]) +3 other tests
>    skip
>  *=20
>    igt@kms_pm_backlight@basic-brightness:shard-tglu: NOTRUN -> SKIP
>    [323] (i915#12343 [322] / i915#9812 [321])
>  *=20
>    igt@kms_pm_dc@dc5-psr:shard-tglu: NOTRUN -> SKIP [320] (i915#15948
>    [317])
>  *=20
>    igt@kms_pm_dc@dc5-retention-flops:shard-rkl: NOTRUN -> SKIP [319]
>    (i915#3828 [23]) +1 other test skip
>  *=20
>    igt@kms_pm_dc@dc6-psr:shard-rkl: NOTRUN -> SKIP [318] (i915#15948
>    [317])
>  *=20
>    igt@kms_pm_lpsp@screens-disabled:shard-tglu-1: NOTRUN -> SKIP [316]
>    (i915#8430 [315])
>  *=20
>    igt@kms_pm_rpm@dpms-lpsp:shard-rkl: PASS [314] -> SKIP [313]
>    (i915#15073 [221]) +1 other test skip
>  *=20
>    igt@kms_pm_rpm@dpms-mode-unset-lpsp:shard-rkl: NOTRUN -> SKIP [312]
>    (i915#14544 [4] / i915#15073 [221])
>  *=20
>    igt@kms_pm_rpm@modeset-lpsp-stress-no-wait:shard-rkl: NOTRUN -> SKIP
>    [311] (i915#15073 [221])
>  *=20
>    igt@kms_pm_rpm@modeset-non-lpsp-stress:shard-dg2: PASS [308] -> SKIP
>    [307] (i915#15073 [221])shard-dg1: PASS [310] -> SKIP [309]
>    (i915#15073 [221])
>  *=20
>    igt@kms_prime@basic-crc-hybrid:shard-rkl: NOTRUN -> SKIP [305]
>    (i915#6524 [304])shard-tglu-1: NOTRUN -> SKIP [306] (i915#6524
>    [304]) +1 other test skip
>  *=20
>    igt@kms_psr2_sf@fbc-psr2-cursor-plane-move-continuous-exceed-
>    sf:shard-rkl: NOTRUN -> SKIP [303] (i915#11520 [15]) +6 other tests
>    skip
>  *=20
>    igt@kms_psr2_sf@fbc-psr2-overlay-plane-move-continuous-exceed-
>    sf:shard-tglu: NOTRUN -> SKIP [302] (i915#11520 [15]) +2 other tests
>    skip
>  *=20
>    igt@kms_psr2_sf@fbc-psr2-primary-plane-update-sf-dmg-area:shard-glk:
>    NOTRUN -> SKIP [301] (i915#11520 [15]) +2 other tests skip
>  *=20
>    igt@kms_psr2_sf@pr-cursor-plane-update-sf:shard-glk11: NOTRUN ->
>    SKIP [300] (i915#11520 [15]) +1 other test skip
>  *=20
>    igt@kms_psr2_sf@pr-plane-move-sf-dmg-area:shard-rkl: NOTRUN -> SKIP
>    [299] (i915#11520 [15] / i915#14544 [4])
>  *=20
>    igt@kms_psr2_sf@pr-primary-plane-update-sf-dmg-area-big-fb:shard-
>    glk10: NOTRUN -> SKIP [298] (i915#11520 [15]) +3 other tests skip
>  *=20
>    igt@kms_psr2_sf@psr2-overlay-primary-update-sf-dmg-area:shard-tglu-
>    1: NOTRUN -> SKIP [297] (i915#11520 [15]) +5 other tests skip
>  *=20
>    igt@kms_psr2_su@frontbuffer-xrgb8888:shard-tglu: NOTRUN -> SKIP
>    [296] (i915#9683 [294])
>  *=20
>    igt@kms_psr2_su@page_flip-xrgb8888:shard-rkl: NOTRUN -> SKIP [295]
>    (i915#14544 [4] / i915#9683 [294])
>  *=20
>    igt@kms_psr@fbc-psr2-cursor-plane-move:shard-tglu: NOTRUN -> SKIP
>    [293] (i915#9732 [9]) +10 other tests skip
>  *=20
>    igt@kms_psr@pr-cursor-mmap-cpu:shard-rkl: NOTRUN -> SKIP [292]
>    (i915#1072 [10] / i915#9732 [9]) +15 other tests skip
>  *=20
>    igt@kms_psr@psr-sprite-plane-move:shard-rkl: NOTRUN -> SKIP [291]
>    (i915#1072 [10] / i915#14544 [4] / i915#9732 [9]) +3 other tests
>    skip
>  *=20
>    igt@kms_psr@psr2-sprite-mmap-gtt:shard-tglu-1: NOTRUN -> SKIP [290]
>    (i915#9732 [9]) +14 other tests skip
>  *=20
>    igt@kms_rotation_crc@primary-yf-tiled-reflect-x-270:shard-rkl:
>    NOTRUN -> SKIP [289] (i915#5289 [6]) +1 other test skip
>  *=20
>    igt@kms_scaling_modes@scaling-mode-full-aspect:shard-rkl: NOTRUN ->
>    SKIP [288] (i915#14544 [4] / i915#3555 [2])
>  *=20
>    igt@kms_selftest@drm_framebuffer:shard-tglu-1: NOTRUN -> ABORT [287]
>    (i915#13179 [286]) +1 other test abort
>  *=20
>    igt@kms_vrr@flip-dpms:shard-rkl: NOTRUN -> SKIP [285] (i915#15243
>    [284] / i915#3555 [2])
>  *=20
>    igt@kms_vrr@flip-suspend:shard-tglu: NOTRUN -> SKIP [283] (i915#3555
>    [2]) +2 other tests skip
>  *=20
>    igt@kms_vrr@seamless-rr-switch-virtual:shard-tglu: NOTRUN -> SKIP
>    [282] (i915#9906 [1])
>  *=20
>    igt@kms_vrr@seamless-rr-switch-vrr:shard-rkl: NOTRUN -> SKIP [280]
>    (i915#9906 [1])shard-tglu-1: NOTRUN -> SKIP [281] (i915#9906 [1]) +1
>    other test skip
>  *=20
>    igt@perf@mi-rpc:shard-rkl: NOTRUN -> SKIP [279] (i915#2434 [278])
>  *=20
>    igt@perf@per-context-mode-unprivileged:shard-rkl: NOTRUN -> SKIP
>    [277] (i915#14544 [4] / i915#2435 [276])
>  *=20
>    igt@perf_pmu@module-unload:shard-glk10: NOTRUN -> ABORT [275]
>    (i915#15778 [274])
>  *=20
>    igt@perf_pmu@rc6@other-idle-gt0:shard-rkl: NOTRUN -> SKIP [273]
>    (i915#8516 [272])
>  *=20
>    igt@prime_udl@share-import:shard-rkl: NOTRUN -> SKIP [270]
>    (i915#16420 [269])shard-tglu-1: NOTRUN -> SKIP [271] (i915#16420
>    [269]) +1 other test skip
> Possible fixes *=20
>    igt@gem_exec_suspend@basic-s3-devices:shard-rkl: ABORT [268]
>    (i915#15131 [267] / i915#15542 [264]) -> PASS [266]
>  *=20
>    igt@gem_exec_suspend@basic-s3-devices@smem:shard-rkl: ABORT [265]
>    (i915#15542 [264]) -> PASS [263]
>  *=20
>    igt@gem_linear_blits@normal:shard-dg1: FAIL [262] (i915#15391 [261])
>    -> PASS [260]
>  *=20
>    igt@gem_workarounds@suspend-resume-fd:shard-rkl: INCOMPLETE [259]
>    (i915#13356 [175]) -> PASS [258] +2 other tests pass
>  *=20
>    igt@i915_pm_rps@reset:shard-snb: TIMEOUT [257] (i915#16162 [256]) ->
>    PASS [255]
>  *=20
>    igt@i915_power@sanity:shard-mtlp: SKIP [254] (i915#7984 [253]) ->
>    PASS [252]
>  *=20
>    igt@kms_atomic_transition@plane-all-modeset-transition@pipe-a-hdmi-
>    a-1:shard-tglu: FAIL [251] (i915#15662 [250]) -> PASS [249] +1 other
>    test pass
>  *=20
>    igt@kms_ccs@crc-primary-suspend-y-tiled-gen12-rc-ccs-cc:shard-rkl:
>    INCOMPLETE [248] (i915#15582 [247]) -> PASS [246]
>  *=20
>    igt@kms_cursor_crc@cursor-onscreen-64x21:shard-rkl: FAIL [245]
>    (i915#13566 [244]) -> PASS [243]
>  *=20
>    igt@kms_frontbuffer_tracking@fbc-1p-primscrn-spr-indfb-draw-
>    blt:shard-dg1: DMESG-WARN [242] (i915#4423 [57]) -> PASS [241] +1
>    other test pass
>  *=20
>    igt@kms_frontbuffer_tracking@hdr-1p-primscrn-spr-indfb-
>    fullscreen:shard-glk: SKIP [240] -> PASS [239] +9 other tests pass
>  *=20
>    igt@kms_frontbuffer_tracking@hdr-rgb565-draw-mmap-cpu:shard-rkl:
>    SKIP [238] (i915#15989 [237]) -> PASS [236] +3 other tests pass
>  *=20
>    igt@kms_pipe_crc_basic@suspend-read-crc:shard-rkl: INCOMPLETE [235]
>    (i915#12756 [234] / i915#13476 [231]) -> PASS [233]
>  *=20
>    igt@kms_pipe_crc_basic@suspend-read-crc@pipe-b-hdmi-a-2:shard-rkl:
>    INCOMPLETE [232] (i915#13476 [231]) -> PASS [230]
>  *=20
>    igt@kms_pipe_stress@stress-xrgb8888-ytiled:shard-glk: DMESG-WARN
>    [229] (i915#118 [228]) -> PASS [227]
>  *=20
>    igt@kms_pm_lpsp@kms-lpsp:shard-dg2: SKIP [226] (i915#9340 [25]) ->
>    PASS [225]
>  *=20
>    igt@kms_pm_rpm@dpms-lpsp:shard-dg2: SKIP [224] (i915#15073 [221]) ->
>    PASS [223] +2 other tests pass
>  *=20
>    igt@kms_pm_rpm@modeset-non-lpsp:shard-dg1: SKIP [222] (i915#15073
>    [221]) -> PASS [220] +1 other test pass
>  *=20
>    igt@kms_pm_rpm@system-suspend-modeset:shard-rkl: INCOMPLETE [219]
>    (i915#14419 [218]) -> PASS [217]
>  *=20
>    igt@perf_pmu@busy-double-start@vecs1:shard-dg2: FAIL [216]
>    (i915#4349 [215]) -> PASS [214] +2 other tests pass
> Warnings *=20
>    igt@api_intel_bb@blit-reloc-purge-cache:shard-rkl: SKIP [213]
>    (i915#8411 [185]) -> SKIP [212] (i915#14544 [4] / i915#8411 [185])
>  *=20
>    igt@api_intel_bb@crc32:shard-rkl: SKIP [211] (i915#14544 [4] /
>    i915#6230 [209]) -> SKIP [210] (i915#6230 [209])
>  *=20
>    igt@device_reset@unbind-cold-reset-rebind:shard-rkl: SKIP [208]
>    (i915#11078 [206]) -> SKIP [207] (i915#11078 [206] / i915#14544 [4])
>  *=20
>    igt@gem_ccs@large-ctrl-surf-copy:shard-rkl: SKIP [205] (i915#13008
>    [203] / i915#14544 [4]) -> SKIP [204] (i915#13008 [203])
>  *=20
>    igt@gem_exec_balancer@parallel:shard-rkl: SKIP [202] (i915#14544 [4]
>    / i915#4525 [198]) -> SKIP [201] (i915#4525 [198])
>  *=20
>    igt@gem_exec_balancer@parallel-out-fence:shard-rkl: SKIP [200]
>    (i915#4525 [198]) -> SKIP [199] (i915#14544 [4] / i915#4525 [198])
>  *=20
>    igt@gem_exec_reloc@basic-wc-cpu:shard-rkl: SKIP [197] (i915#14544
>    [4] / i915#3281 [193]) -> SKIP [196] (i915#3281 [193]) +5 other
>    tests skip
>  *=20
>    igt@gem_exec_reloc@basic-write-read:shard-rkl: SKIP [195] (i915#3281
>    [193]) -> SKIP [194] (i915#14544 [4] / i915#3281 [193]) +1 other
>    test skip
>  *=20
>    igt@gem_lmem_swapping@parallel-multi:shard-rkl: SKIP [192]
>    (i915#4613 [188]) -> SKIP [191] (i915#14544 [4] / i915#4613 [188])
>  *=20
>    igt@gem_lmem_swapping@random-engines:shard-rkl: SKIP [190]
>    (i915#14544 [4] / i915#4613 [188]) -> SKIP [189] (i915#4613 [188])
>    +1 other test skip
>  *=20
>    igt@gem_set_tiling_vs_blt@tiled-to-untiled:shard-rkl: SKIP [187]
>    (i915#14544 [4] / i915#8411 [185]) -> SKIP [186] (i915#8411 [185])
>    +1 other test skip
>  *=20
>    igt@gem_set_tiling_vs_pwrite:shard-rkl: SKIP [184] (i915#14544 [4] /
>    i915#3282 [182]) -> SKIP [183] (i915#3282 [182]) +2 other tests skip
>  *=20
>    igt@gem_userptr_blits@create-destroy-unsync:shard-rkl: SKIP [181]
>    (i915#3297 [177]) -> SKIP [180] (i915#14544 [4] / i915#3297 [177])
>  *=20
>    igt@gem_userptr_blits@readonly-unsync:shard-rkl: SKIP [179]
>    (i915#14544 [4] / i915#3297 [177]) -> SKIP [178] (i915#3297 [177])
>  *=20
>    igt@gem_workarounds@suspend-resume:shard-rkl: INCOMPLETE [176]
>    (i915#13356 [175]) -> ABORT [174] (i915#15152 [173])
>  *=20
>    igt@gen9_exec_parse@allowed-single:shard-rkl: SKIP [172] (i915#2527
>    [168]) -> SKIP [171] (i915#14544 [4] / i915#2527 [168])
>  *=20
>    igt@gen9_exec_parse@cmd-crossing-page:shard-rkl: SKIP [170]
>    (i915#14544 [4] / i915#2527 [168]) -> SKIP [169] (i915#2527 [168])
>  *=20
>    igt@i915_module_load@resize-bar:shard-rkl: SKIP [167] (i915#14544
>    [4] / i915#6412 [165]) -> SKIP [166] (i915#6412 [165])
>  *=20
>    igt@i915_pm_freq_mult@media-freq@gt0:shard-rkl: SKIP [164]
>    (i915#14544 [4] / i915#6590 [162]) -> SKIP [163] (i915#6590 [162])
>    +1 other test skip
>  *=20
>    igt@kms_addfb_basic@invalid-smem-bo-on-discrete:shard-rkl: SKIP
>    [161] (i915#12454 [159] / i915#12712 [158]) -> SKIP [160]
>    (i915#12454 [159] / i915#12712 [158] / i915#14544 [4])
>  *=20
>    igt@kms_big_fb@4-tiled-32bpp-rotate-180:shard-rkl: SKIP [157]
>    (i915#5286 [153]) -> SKIP [156] (i915#14544 [4] / i915#5286 [153])
>    +1 other test skip
>  *=20
>    igt@kms_big_fb@4-tiled-32bpp-rotate-270:shard-rkl: SKIP [155]
>    (i915#14544 [4] / i915#5286 [153]) -> SKIP [154] (i915#5286 [153])
>    +2 other tests skip
>  *=20
>    igt@kms_big_fb@x-tiled-16bpp-rotate-90:shard-rkl: SKIP [152]
>    (i915#14544 [4] / i915#3638 [150]) -> SKIP [151] (i915#3638 [150])
>  *=20
>    igt@kms_ccs@bad-aux-stride-4-tiled-mtl-rc-ccs-cc:shard-dg1: SKIP
>    [149] (i915#4423 [57] / i915#6095 [140]) -> SKIP [148] (i915#6095
>    [140]) +1 other test skip
>  *=20
>    igt@kms_ccs@crc-primary-suspend-4-tiled-dg2-rc-ccs-cc@pipe-a-hdmi-a-
>    2:shard-rkl: SKIP [147] (i915#14544 [4] / i915#6095 [140]) -> SKIP
>    [146] (i915#6095 [140]) +7 other tests skip
>  *=20
>    igt@kms_ccs@crc-primary-suspend-4-tiled-dg2-rc-ccs-cc@pipe-c-hdmi-a-
>    2:shard-rkl: SKIP [145] (i915#14098 [141] / i915#14544 [4] /
>    i915#6095 [140]) -> SKIP [144] (i915#14098 [141] / i915#6095 [140])
>    +11 other tests skip
>  *=20
>    igt@kms_ccs@random-ccs-data-4-tiled-mtl-rc-ccs:shard-rkl: SKIP [143]
>    (i915#14098 [141] / i915#6095 [140]) -> SKIP [142] (i915#14098 [141]
>    / i915#14544 [4] / i915#6095 [140]) +3 other tests skip
>  *=20
>    igt@kms_chamelium_color_pipeline@plane-ctm3x4:shard-rkl: SKIP [139]
>    (i915#16471 [137]) -> SKIP [138] (i915#14544 [4] / i915#16471 [137])
>  *=20
>    igt@kms_chamelium_edid@hdmi-edid-stress-resolution-non-4k:shard-rkl:
>    SKIP [136] (i915#11151 [132] / i915#14544 [4] / i915#7828 [131]) ->
>    SKIP [135] (i915#11151 [132] / i915#7828 [131]) +4 other tests skip
>  *=20
>    igt@kms_chamelium_frames@hdmi-crc-nonplanar-formats:shard-rkl: SKIP
>    [134] (i915#11151 [132] / i915#7828 [131]) -> SKIP [133] (i915#11151
>    [132] / i915#14544 [4] / i915#7828 [131]) +1 other test skip
>  *=20
>    igt@kms_content_protection@atomic-hdcp14:shard-rkl: SKIP [130]
>    (i915#15865 [124]) -> SKIP [129] (i915#14544 [4] / i915#15865 [124])
>  *=20
>    igt@kms_content_protection@dp-mst-type-1-suspend-resume:shard-rkl:
>    SKIP [128] (i915#14544 [4] / i915#15330 [126]) -> SKIP [127]
>    (i915#15330 [126])
>  *=20
>    igt@kms_content_protection@mei-interface:shard-dg1: SKIP [125]
>    (i915#15865 [124]) -> SKIP [123] (i915#9433 [122])
>  *=20
>    igt@kms_cursor_crc@cursor-onscreen-max-size:shard-rkl: SKIP [121]
>    (i915#14544 [4] / i915#3555 [2]) -> SKIP [120] (i915#3555 [2]) +1
>    other test skip
>  *=20
>    igt@kms_cursor_legacy@flip-vs-cursor-atomic-transitions-varying-
>    size:shard-glk: FAIL [119] (i915#15804 [118]) -> FAIL [117]
>    (i915#15768 [116])
>  *=20
>    igt@kms_cursor_legacy@short-busy-flip-before-cursor-atomic-
>    transitions-varying-size:shard-rkl: SKIP [115] (i915#14544 [4] /
>    i915#4103 [113]) -> SKIP [114] (i915#4103 [113])
>  *=20
>    igt@kms_dirtyfb@psr-dirtyfb-ioctl:shard-rkl: SKIP [112] (i915#14544
>    [4] / i915#9723 [110]) -> SKIP [111] (i915#9723 [110])
>  *=20
>    igt@kms_dsc@dsc-with-output-formats-ultrajoiner:shard-rkl: SKIP
>    [109] (i915#16361 [105]) -> SKIP [108] (i915#14544 [4] / i915#16361
>    [105])
>  *=20
>    igt@kms_dsc@dsc-with-output-formats-with-bpc-ultrajoiner:shard-rkl:
>    SKIP [107] (i915#14544 [4] / i915#16361 [105]) -> SKIP [106]
>    (i915#16361 [105])
>  *=20
>    igt@kms_fbcon_fbt@psr:shard-rkl: SKIP [104] (i915#14544 [4] /
>    i915#16680 [102]) -> SKIP [103] (i915#16680 [102])
>  *=20
>    igt@kms_feature_discovery@psr1:shard-rkl: SKIP [101] (i915#14544 [4]
>    / i915#658 [99]) -> SKIP [100] (i915#658 [99])
>  *=20
>    igt@kms_flip@2x-absolute-wf_vblank:shard-rkl: SKIP [98] (i915#14544
>    [4] / i915#9934 [94]) -> SKIP [97] (i915#9934 [94]) +6 other tests
>    skip
>  *=20
>    igt@kms_flip@2x-flip-vs-panning:shard-rkl: SKIP [96] (i915#9934
>    [94]) -> SKIP [95] (i915#14544 [4] / i915#9934 [94]) +2 other tests
>    skip
>  *=20
>    igt@kms_flip@flip-vs-suspend:shard-glk: INCOMPLETE [93] (i915#12314
>    [85] / i915#12745 [83] / i915#4839 [89]) -> INCOMPLETE [92]
>    (i915#12745 [83] / i915#4839 [89] / i915#6113 [82])
>  *=20
>    igt@kms_flip@flip-vs-suspend-interruptible:shard-glk: INCOMPLETE
>    [91] (i915#12745 [83] / i915#4839 [89]) -> INCOMPLETE [90]
>    (i915#12314 [85] / i915#12745 [83] / i915#4839 [89] / i915#6113
>    [82])
>  *=20
>    igt@kms_flip@flip-vs-suspend-interruptible@a-hdmi-a1:shard-glk:
>    INCOMPLETE [88] (i915#12745 [83]) -> INCOMPLETE [87] (i915#12314
>    [85] / i915#12745 [83])
>  *=20
>    igt@kms_flip@flip-vs-suspend@a-hdmi-a1:shard-glk: INCOMPLETE [86]
>    (i915#12314 [85] / i915#12745 [83]) -> INCOMPLETE [84] (i915#12745
>    [83] / i915#6113 [82])
>  *=20
>    igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-16bpp-yftile-
>    upscaling:shard-rkl: SKIP [81] (i915#14544 [4] / i915#15643 [79]) ->
>    SKIP [80] (i915#15643 [79])
>  *=20
>    igt@kms_frontbuffer_tracking@fbchdr-2p-primscrn-cur-indfb-draw-mmap-
>    cpu:shard-dg1: SKIP [78] (i915#4423 [57]) -> SKIP [77]
>  *=20
>    igt@kms_frontbuffer_tracking@fbchdr-tiling-4:shard-dg1: SKIP [76]
>    (i915#4423 [57] / i915#5439 [64]) -> SKIP [75] (i915#5439 [64])
>  *=20
>    igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-pri-shrfb-draw-mmap-
>    gtt:shard-rkl: SKIP [74] (i915#15102 [55]) -> SKIP [73] (i915#14544
>    [4] / i915#15102 [55]) +6 other tests skip
>  *=20
>    igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-pri-shrfb-draw-
>    blt:shard-rkl: SKIP [72] -> SKIP [71] (i915#14544 [4]) +18 other
>    tests skip
>  *=20
>    igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-spr-indfb-draw-mmap-
>    gtt:shard-rkl: SKIP [70] (i915#14544 [4] / i915#1825 [61]) -> SKIP
>    [69] (i915#1825 [61]) +2 other tests skip
>  *=20
>    igt@kms_frontbuffer_tracking@fbcpsr-rgb101010-draw-mmap-wc:shard-
>    rkl: SKIP [68] (i915#14544 [4] / i915#15102 [55]) -> SKIP [67]
>    (i915#15102 [55]) +24 other tests skip
>  *=20
>    igt@kms_frontbuffer_tracking@fbcpsrhdr-tiling-4:shard-rkl: SKIP [66]
>    (i915#14544 [4] / i915#5439 [64]) -> SKIP [65] (i915#5439 [64])
>  *=20
>    igt@kms_frontbuffer_tracking@psr-2p-primscrn-spr-indfb-draw-mmap-
>    wc:shard-rkl: SKIP [63] (i915#1825 [61]) -> SKIP [62] (i915#14544
>    [4] / i915#1825 [61]) +1 other test skip
>  *=20
>    igt@kms_frontbuffer_tracking@psrhdr-2p-scndscrn-cur-indfb-
>    move:shard-rkl: SKIP [60] (i915#14544 [4]) -> SKIP [59] +54 other
>    tests skip
>  *=20
>    igt@kms_frontbuffer_tracking@psrhdr-modesetfrombusy:shard-dg1: SKIP
>    [58] (i915#15102 [55] / i915#4423 [57]) -> SKIP [56] (i915#15102
>    [55])
>  *=20
>    igt@kms_hdr@bpc-switch-suspend:shard-rkl: SKIP [54] (i915#16644 [53]
>    / i915#3555 [2] / i915#8228 [52]) -> INCOMPLETE [51] (i915#15436
>    [50])
>  *=20
>    igt@kms_joiner@basic-force-ultra-joiner:shard-rkl: SKIP [49]
>    (i915#14544 [4] / i915#15458 [47]) -> SKIP [48] (i915#15458 [47])
>  *=20
>    igt@kms_joiner@switch-modeset-ultra-joiner-big-joiner:shard-rkl:
>    SKIP [46] (i915#14544 [4] / i915#15638 [44] / i915#15722 [43]) ->
>    SKIP [45] (i915#15638 [44] / i915#15722 [43])
>  *=20
>    igt@kms_plane@pixel-format-yf-tiled-modifier:shard-rkl: SKIP [42]
>    (i915#14544 [4] / i915#15709 [40]) -> SKIP [41] (i915#15709 [40]) +2
>    other tests skip
>  *=20
>    igt@kms_plane_multiple@2x-tiling-none:shard-rkl: SKIP [39]
>    (i915#13958 [37] / i915#14544 [4]) -> SKIP [38] (i915#13958 [37])
>  *=20
>    igt@kms_plane_multiple@tiling-yf:shard-rkl: SKIP [36] (i915#14259
>    [34] / i915#14544 [4]) -> SKIP [35] (i915#14259 [34])
>  *=20
>    igt@kms_pm_dc@dc6-dpms:shard-tglu: FAIL [33] (i915#16479 [32]) ->
>    SKIP [31] (i915#15128 [30])
>  *=20
>    igt@kms_pm_dc@dc9-dpms:shard-rkl: SKIP [29] (i915#14544 [4] /
>    i915#15739 [27]) -> SKIP [28] (i915#15739 [27])
>  *=20
>    igt@kms_pm_lpsp@kms-lpsp:shard-dg1: SKIP [26] (i915#9340 [25]) ->
>    SKIP [24] (i915#3828 [23])
>  *=20
>    igt@kms_pm_rpm@package-g7:shard-rkl: SKIP [22] (i915#14544 [4] /
>    i915#15403 [20]) -> SKIP [21] (i915#15403 [20])
>  *=20
>    igt@kms_psr2_sf@pr-cursor-plane-move-continuous-exceed-sf:shard-rkl:
>    SKIP [19] (i915#11520 [15]) -> SKIP [18] (i915#11520 [15] /
>    i915#14544 [4])
>  *=20
>    igt@kms_psr2_sf@psr2-overlay-plane-update-sf-dmg-area:shard-rkl:
>    SKIP [17] (i915#11520 [15] / i915#14544 [4]) -> SKIP [16]
>    (i915#11520 [15]) +2 other tests skip
>  *=20
>    igt@kms_psr@pr-basic:shard-rkl: SKIP [14] (i915#1072 [10] /
>    i915#9732 [9]) -> SKIP [13] (i915#1072 [10] / i915#14544 [4] /
>    i915#9732 [9]) +2 other tests skip
>  *=20
>    igt@kms_psr@psr2-sprite-mmap-cpu:shard-rkl: SKIP [12] (i915#1072
>    [10] / i915#14544 [4] / i915#9732 [9]) -> SKIP [11] (i915#1072 [10]
>    / i915#9732 [9]) +12 other tests skip
>  *=20
>    igt@kms_rotation_crc@primary-yf-tiled-reflect-x-180:shard-rkl: SKIP
>    [8] (i915#5289 [6]) -> SKIP [7] (i915#14544 [4] / i915#5289 [6])
>  *=20
>    igt@kms_vrr@negative-basic:shard-rkl: SKIP [5] (i915#14544 [4] /
>    i915#3555 [2] / i915#9906 [1]) -> SKIP [3] (i915#3555 [2] /
>    i915#9906 [1])
> Build changes * Linux: CI_DRM_19006 -> Patchwork_169493v3
> CI-20190529: 20190529
> CI_DRM_19006: b801f94c49ffdb0f65e37baf31d68570356d4983 @
> git://anongit.freedesktop.org/gfx-ci/linux
> IGT_9057: 8f7d5198bdb1c5af7c97b967a0bcbe77b653e8a0 @
> https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
> Patchwork_169493v3: b801f94c49ffdb0f65e37baf31d68570356d4983 @
> git://anongit.freedesktop.org/gfx-ci/linux
> piglit_4509: fdc5a4ca11124ab8413c7988896eec4c97336694 @
> git://anongit.freedesktop.org/piglit


[1] i915#9906
    https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9906
[2] i915#3555
    https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3555
[3] SKIP
    https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_169493v3/shard-rkl-8=
/igt@kms_vrr@negative-basic.html
[4] i915#14544
    https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544
[5] SKIP
    https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19006/shard-rkl-6/igt@k=
ms_vrr@negative-basic.html
[6] i915#5289
    https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5289
[7] SKIP
    https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_169493v3/shard-rkl-6=
/igt@kms_rotation_crc@primary-yf-tiled-reflect-x-180.html
[8] SKIP
    https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19006/shard-rkl-5/igt@k=
ms_rotation_crc@primary-yf-tiled-reflect-x-180.html
[9] i915#9732
    https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9732
[10] i915#1072
     https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/1072
[11] SKIP
     https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_169493v3/shard-rkl-=
1/igt@kms_psr@psr2-sprite-mmap-cpu.html
[12] SKIP
     https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19006/shard-rkl-6/igt@=
kms_psr@psr2-sprite-mmap-cpu.html
[13] SKIP
     https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_169493v3/shard-rkl-=
6/igt@kms_psr@pr-basic.html
[14] SKIP
     https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19006/shard-rkl-5/igt@=
kms_psr@pr-basic.html
[15] i915#11520
     https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11520
[16] SKIP
     https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_169493v3/shard-rkl-=
8/igt@kms_psr2_sf@psr2-overlay-plane-update-sf-dmg-area.html
[17] SKIP
     https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19006/shard-rkl-6/igt@=
kms_psr2_sf@psr2-overlay-plane-update-sf-dmg-area.html
[18] SKIP
     https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_169493v3/shard-rkl-=
6/igt@kms_psr2_sf@pr-cursor-plane-move-continuous-exceed-sf.html
[19] SKIP
     https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19006/shard-rkl-5/igt@=
kms_psr2_sf@pr-cursor-plane-move-continuous-exceed-sf.html
[20] i915#15403
     https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15403
[21] SKIP
     https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_169493v3/shard-rkl-=
1/igt@kms_pm_rpm@package-g7.html
[22] SKIP
     https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19006/shard-rkl-6/igt@=
kms_pm_rpm@package-g7.html
[23] i915#3828
     https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3828
[24] SKIP
     https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_169493v3/shard-dg1-=
15/igt@kms_pm_lpsp@kms-lpsp.html
[25] i915#9340
     https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9340
[26] SKIP
     https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19006/shard-dg1-18/igt=
@kms_pm_lpsp@kms-lpsp.html
[27] i915#15739
     https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15739
[28] SKIP
     https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_169493v3/shard-rkl-=
4/igt@kms_pm_dc@dc9-dpms.html
[29] SKIP
     https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19006/shard-rkl-6/igt@=
kms_pm_dc@dc9-dpms.html
[30] i915#15128
     https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15128
[31] SKIP
     https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_169493v3/shard-tglu=
-6/igt@kms_pm_dc@dc6-dpms.html
[32] i915#16479
     https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16479
[33] FAIL
     https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19006/shard-tglu-9/igt=
@kms_pm_dc@dc6-dpms.html
[34] i915#14259
     https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14259
[35] SKIP
     https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_169493v3/shard-rkl-=
1/igt@kms_plane_multiple@tiling-yf.html
[36] SKIP
     https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19006/shard-rkl-6/igt@=
kms_plane_multiple@tiling-yf.html
[37] i915#13958
     https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13958
[38] SKIP
     https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_169493v3/shard-rkl-=
4/igt@kms_plane_multiple@2x-tiling-none.html
[39] SKIP
     https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19006/shard-rkl-6/igt@=
kms_plane_multiple@2x-tiling-none.html
[40] i915#15709
     https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15709
[41] SKIP
     https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_169493v3/shard-rkl-=
8/igt@kms_plane@pixel-format-yf-tiled-modifier.html
[42] SKIP
     https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19006/shard-rkl-6/igt@=
kms_plane@pixel-format-yf-tiled-modifier.html
[43] i915#15722
     https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15722
[44] i915#15638
     https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15638
[45] SKIP
     https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_169493v3/shard-rkl-=
4/igt@kms_joiner@switch-modeset-ultra-joiner-big-joiner.html
[46] SKIP
     https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19006/shard-rkl-6/igt@=
kms_joiner@switch-modeset-ultra-joiner-big-joiner.html
[47] i915#15458
     https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15458
[48] SKIP
     https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_169493v3/shard-rkl-=
4/igt@kms_joiner@basic-force-ultra-joiner.html
[49] SKIP
     https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19006/shard-rkl-6/igt@=
kms_joiner@basic-force-ultra-joiner.html
[50] i915#15436
     https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15436
[51] INCOMPLETE
     https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_169493v3/shard-rkl-=
6/igt@kms_hdr@bpc-switch-suspend.html
[52] i915#8228
     https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8228
[53] i915#16644
     https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16644
[54] SKIP
     https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19006/shard-rkl-3/igt@=
kms_hdr@bpc-switch-suspend.html
[55] i915#15102
     https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15102
[56] SKIP
     https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_169493v3/shard-dg1-=
17/igt@kms_frontbuffer_tracking@psrhdr-modesetfrombusy.html
[57] i915#4423
     https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4423
[58] SKIP
     https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19006/shard-dg1-16/igt=
@kms_frontbuffer_tracking@psrhdr-modesetfrombusy.html
[59] SKIP
     https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_169493v3/shard-rkl-=
4/igt@kms_frontbuffer_tracking@psrhdr-2p-scndscrn-cur-indfb-move.html
[60] SKIP
     https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19006/shard-rkl-6/igt@=
kms_frontbuffer_tracking@psrhdr-2p-scndscrn-cur-indfb-move.html
[61] i915#1825
     https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/1825
[62] SKIP
     https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_169493v3/shard-rkl-=
6/igt@kms_frontbuffer_tracking@psr-2p-primscrn-spr-indfb-draw-mmap-wc.html
[63] SKIP
     https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19006/shard-rkl-5/igt@=
kms_frontbuffer_tracking@psr-2p-primscrn-spr-indfb-draw-mmap-wc.html
[64] i915#5439
     https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5439
[65] SKIP
     https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_169493v3/shard-rkl-=
4/igt@kms_frontbuffer_tracking@fbcpsrhdr-tiling-4.html
[66] SKIP
     https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19006/shard-rkl-6/igt@=
kms_frontbuffer_tracking@fbcpsrhdr-tiling-4.html
[67] SKIP
     https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_169493v3/shard-rkl-=
4/igt@kms_frontbuffer_tracking@fbcpsr-rgb101010-draw-mmap-wc.html
[68] SKIP
     https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19006/shard-rkl-6/igt@=
kms_frontbuffer_tracking@fbcpsr-rgb101010-draw-mmap-wc.html
[69] SKIP
     https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_169493v3/shard-rkl-=
4/igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-spr-indfb-draw-mmap-gtt.h=
tml
[70] SKIP
     https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19006/shard-rkl-6/igt@=
kms_frontbuffer_tracking@fbcpsr-2p-primscrn-spr-indfb-draw-mmap-gtt.html
[71] SKIP
     https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_169493v3/shard-rkl-=
6/igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-pri-shrfb-draw-blt.html
[72] SKIP
     https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19006/shard-rkl-5/igt@=
kms_frontbuffer_tracking@fbcpsr-2p-primscrn-pri-shrfb-draw-blt.html
[73] SKIP
     https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_169493v3/shard-rkl-=
6/igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-pri-shrfb-draw-mmap-gtt.h=
tml
[74] SKIP
     https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19006/shard-rkl-5/igt@=
kms_frontbuffer_tracking@fbcpsr-1p-primscrn-pri-shrfb-draw-mmap-gtt.html
[75] SKIP
     https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_169493v3/shard-dg1-=
17/igt@kms_frontbuffer_tracking@fbchdr-tiling-4.html
[76] SKIP
     https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19006/shard-dg1-16/igt=
@kms_frontbuffer_tracking@fbchdr-tiling-4.html
[77] SKIP
     https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_169493v3/shard-dg1-=
17/igt@kms_frontbuffer_tracking@fbchdr-2p-primscrn-cur-indfb-draw-mmap-cpu.=
html
[78] SKIP
     https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19006/shard-dg1-19/igt=
@kms_frontbuffer_tracking@fbchdr-2p-primscrn-cur-indfb-draw-mmap-cpu.html
[79] i915#15643
     https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15643
[80] SKIP
     https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_169493v3/shard-rkl-=
4/igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-16bpp-yftile-upscaling.html
[81] SKIP
     https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19006/shard-rkl-6/igt@=
kms_flip_scaled_crc@flip-64bpp-yftile-to-16bpp-yftile-upscaling.html
[82] i915#6113
     https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6113
[83] i915#12745
     https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12745
[84] INCOMPLETE
     https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_169493v3/shard-glk1=
/igt@kms_flip@flip-vs-suspend@a-hdmi-a1.html
[85] i915#12314
     https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12314
[86] INCOMPLETE
     https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19006/shard-glk8/igt@k=
ms_flip@flip-vs-suspend@a-hdmi-a1.html
[87] INCOMPLETE
     https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_169493v3/shard-glk5=
/igt@kms_flip@flip-vs-suspend-interruptible@a-hdmi-a1.html
[88] INCOMPLETE
     https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19006/shard-glk6/igt@k=
ms_flip@flip-vs-suspend-interruptible@a-hdmi-a1.html
[89] i915#4839
     https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4839
[90] INCOMPLETE
     https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_169493v3/shard-glk5=
/igt@kms_flip@flip-vs-suspend-interruptible.html
[91] INCOMPLETE
     https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19006/shard-glk6/igt@k=
ms_flip@flip-vs-suspend-interruptible.html
[92] INCOMPLETE
     https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_169493v3/shard-glk1=
/igt@kms_flip@flip-vs-suspend.html
[93] INCOMPLETE
     https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19006/shard-glk8/igt@k=
ms_flip@flip-vs-suspend.html
[94] i915#9934
     https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9934
[95] SKIP
     https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_169493v3/shard-rkl-=
6/igt@kms_flip@2x-flip-vs-panning.html
[96] SKIP
     https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19006/shard-rkl-5/igt@=
kms_flip@2x-flip-vs-panning.html
[97] SKIP
     https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_169493v3/shard-rkl-=
8/igt@kms_flip@2x-absolute-wf_vblank.html
[98] SKIP
     https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19006/shard-rkl-6/igt@=
kms_flip@2x-absolute-wf_vblank.html
[99] i915#658
     https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/658
[100] SKIP
      https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_169493v3/shard-rkl=
-8/igt@kms_feature_discovery@psr1.html
[101] SKIP
      https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19006/shard-rkl-6/igt=
@kms_feature_discovery@psr1.html
[102] i915#16680
      https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16680
[103] SKIP
      https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_169493v3/shard-rkl=
-8/igt@kms_fbcon_fbt@psr.html
[104] SKIP
      https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19006/shard-rkl-6/igt=
@kms_fbcon_fbt@psr.html
[105] i915#16361
      https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16361
[106] SKIP
      https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_169493v3/shard-rkl=
-1/igt@kms_dsc@dsc-with-output-formats-with-bpc-ultrajoiner.html
[107] SKIP
      https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19006/shard-rkl-6/igt=
@kms_dsc@dsc-with-output-formats-with-bpc-ultrajoiner.html
[108] SKIP
      https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_169493v3/shard-rkl=
-6/igt@kms_dsc@dsc-with-output-formats-ultrajoiner.html
[109] SKIP
      https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19006/shard-rkl-5/igt=
@kms_dsc@dsc-with-output-formats-ultrajoiner.html
[110] i915#9723
      https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9723
[111] SKIP
      https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_169493v3/shard-rkl=
-4/igt@kms_dirtyfb@psr-dirtyfb-ioctl.html
[112] SKIP
      https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19006/shard-rkl-6/igt=
@kms_dirtyfb@psr-dirtyfb-ioctl.html
[113] i915#4103
      https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4103
[114] SKIP
      https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_169493v3/shard-rkl=
-8/igt@kms_cursor_legacy@short-busy-flip-before-cursor-atomic-transitions-v=
arying-size.html
[115] SKIP
      https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19006/shard-rkl-6/igt=
@kms_cursor_legacy@short-busy-flip-before-cursor-atomic-transitions-varying=
-size.html
[116] i915#15768
      https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15768
[117] FAIL
      https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_169493v3/shard-glk=
3/igt@kms_cursor_legacy@flip-vs-cursor-atomic-transitions-varying-size.html
[118] i915#15804
      https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15804
[119] FAIL
      https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19006/shard-glk9/igt@=
kms_cursor_legacy@flip-vs-cursor-atomic-transitions-varying-size.html
[120] SKIP
      https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_169493v3/shard-rkl=
-5/igt@kms_cursor_crc@cursor-onscreen-max-size.html
[121] SKIP
      https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19006/shard-rkl-6/igt=
@kms_cursor_crc@cursor-onscreen-max-size.html
[122] i915#9433
      https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9433
[123] SKIP
      https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_169493v3/shard-dg1=
-12/igt@kms_content_protection@mei-interface.html
[124] i915#15865
      https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15865
[125] SKIP
      https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19006/shard-dg1-16/ig=
t@kms_content_protection@mei-interface.html
[126] i915#15330
      https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15330
[127] SKIP
      https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_169493v3/shard-rkl=
-1/igt@kms_content_protection@dp-mst-type-1-suspend-resume.html
[128] SKIP
      https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19006/shard-rkl-6/igt=
@kms_content_protection@dp-mst-type-1-suspend-resume.html
[129] SKIP
      https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_169493v3/shard-rkl=
-6/igt@kms_content_protection@atomic-hdcp14.html
[130] SKIP
      https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19006/shard-rkl-5/igt=
@kms_content_protection@atomic-hdcp14.html
[131] i915#7828
      https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/7828
[132] i915#11151
      https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11151
[133] SKIP
      https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_169493v3/shard-rkl=
-6/igt@kms_chamelium_frames@hdmi-crc-nonplanar-formats.html
[134] SKIP
      https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19006/shard-rkl-5/igt=
@kms_chamelium_frames@hdmi-crc-nonplanar-formats.html
[135] SKIP
      https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_169493v3/shard-rkl=
-1/igt@kms_chamelium_edid@hdmi-edid-stress-resolution-non-4k.html
[136] SKIP
      https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19006/shard-rkl-6/igt=
@kms_chamelium_edid@hdmi-edid-stress-resolution-non-4k.html
[137] i915#16471
      https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16471
[138] SKIP
      https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_169493v3/shard-rkl=
-6/igt@kms_chamelium_color_pipeline@plane-ctm3x4.html
[139] SKIP
      https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19006/shard-rkl-5/igt=
@kms_chamelium_color_pipeline@plane-ctm3x4.html
[140] i915#6095
      https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6095
[141] i915#14098
      https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14098
[142] SKIP
      https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_169493v3/shard-rkl=
-6/igt@kms_ccs@random-ccs-data-4-tiled-mtl-rc-ccs.html
[143] SKIP
      https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19006/shard-rkl-5/igt=
@kms_ccs@random-ccs-data-4-tiled-mtl-rc-ccs.html
[144] SKIP
      https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_169493v3/shard-rkl=
-4/igt@kms_ccs@crc-primary-suspend-4-tiled-dg2-rc-ccs-cc@pipe-c-hdmi-a-2.ht=
ml
[145] SKIP
      https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19006/shard-rkl-6/igt=
@kms_ccs@crc-primary-suspend-4-tiled-dg2-rc-ccs-cc@pipe-c-hdmi-a-2.html
[146] SKIP
      https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_169493v3/shard-rkl=
-4/igt@kms_ccs@crc-primary-suspend-4-tiled-dg2-rc-ccs-cc@pipe-a-hdmi-a-2.ht=
ml
[147] SKIP
      https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19006/shard-rkl-6/igt=
@kms_ccs@crc-primary-suspend-4-tiled-dg2-rc-ccs-cc@pipe-a-hdmi-a-2.html
[148] SKIP
      https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_169493v3/shard-dg1=
-17/igt@kms_ccs@bad-aux-stride-4-tiled-mtl-rc-ccs-cc.html
[149] SKIP
      https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19006/shard-dg1-16/ig=
t@kms_ccs@bad-aux-stride-4-tiled-mtl-rc-ccs-cc.html
[150] i915#3638
      https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3638
[151] SKIP
      https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_169493v3/shard-rkl=
-8/igt@kms_big_fb@x-tiled-16bpp-rotate-90.html
[152] SKIP
      https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19006/shard-rkl-6/igt=
@kms_big_fb@x-tiled-16bpp-rotate-90.html
[153] i915#5286
      https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5286
[154] SKIP
      https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_169493v3/shard-rkl=
-8/igt@kms_big_fb@4-tiled-32bpp-rotate-270.html
[155] SKIP
      https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19006/shard-rkl-6/igt=
@kms_big_fb@4-tiled-32bpp-rotate-270.html
[156] SKIP
      https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_169493v3/shard-rkl=
-6/igt@kms_big_fb@4-tiled-32bpp-rotate-180.html
[157] SKIP
      https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19006/shard-rkl-5/igt=
@kms_big_fb@4-tiled-32bpp-rotate-180.html
[158] i915#12712
      https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12712
[159] i915#12454
      https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12454
[160] SKIP
      https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_169493v3/shard-rkl=
-6/igt@kms_addfb_basic@invalid-smem-bo-on-discrete.html
[161] SKIP
      https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19006/shard-rkl-5/igt=
@kms_addfb_basic@invalid-smem-bo-on-discrete.html
[162] i915#6590
      https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6590
[163] SKIP
      https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_169493v3/shard-rkl=
-8/igt@i915_pm_freq_mult@media-freq@gt0.html
[164] SKIP
      https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19006/shard-rkl-6/igt=
@i915_pm_freq_mult@media-freq@gt0.html
[165] i915#6412
      https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6412
[166] SKIP
      https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_169493v3/shard-rkl=
-1/igt@i915_module_load@resize-bar.html
[167] SKIP
      https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19006/shard-rkl-6/igt=
@i915_module_load@resize-bar.html
[168] i915#2527
      https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2527
[169] SKIP
      https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_169493v3/shard-rkl=
-1/igt@gen9_exec_parse@cmd-crossing-page.html
[170] SKIP
      https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19006/shard-rkl-6/igt=
@gen9_exec_parse@cmd-crossing-page.html
[171] SKIP
      https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_169493v3/shard-rkl=
-6/igt@gen9_exec_parse@allowed-single.html
[172] SKIP
      https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19006/shard-rkl-5/igt=
@gen9_exec_parse@allowed-single.html
[173] i915#15152
      https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15152
[174] ABORT
      https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_169493v3/shard-rkl=
-1/igt@gem_workarounds@suspend-resume.html
[175] i915#13356
      https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13356
[176] INCOMPLETE
      https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19006/shard-rkl-6/igt=
@gem_workarounds@suspend-resume.html
[177] i915#3297
      https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3297
[178] SKIP
      https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_169493v3/shard-rkl=
-8/igt@gem_userptr_blits@readonly-unsync.html
[179] SKIP
      https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19006/shard-rkl-6/igt=
@gem_userptr_blits@readonly-unsync.html
[180] SKIP
      https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_169493v3/shard-rkl=
-6/igt@gem_userptr_blits@create-destroy-unsync.html
[181] SKIP
      https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19006/shard-rkl-5/igt=
@gem_userptr_blits@create-destroy-unsync.html
[182] i915#3282
      https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3282
[183] SKIP
      https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_169493v3/shard-rkl=
-8/igt@gem_set_tiling_vs_pwrite.html
[184] SKIP
      https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19006/shard-rkl-6/igt=
@gem_set_tiling_vs_pwrite.html
[185] i915#8411
      https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8411
[186] SKIP
      https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_169493v3/shard-rkl=
-1/igt@gem_set_tiling_vs_blt@tiled-to-untiled.html
[187] SKIP
      https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19006/shard-rkl-6/igt=
@gem_set_tiling_vs_blt@tiled-to-untiled.html
[188] i915#4613
      https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4613
[189] SKIP
      https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_169493v3/shard-rkl=
-4/igt@gem_lmem_swapping@random-engines.html
[190] SKIP
      https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19006/shard-rkl-6/igt=
@gem_lmem_swapping@random-engines.html
[191] SKIP
      https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_169493v3/shard-rkl=
-6/igt@gem_lmem_swapping@parallel-multi.html
[192] SKIP
      https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19006/shard-rkl-5/igt=
@gem_lmem_swapping@parallel-multi.html
[193] i915#3281
      https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3281
[194] SKIP
      https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_169493v3/shard-rkl=
-6/igt@gem_exec_reloc@basic-write-read.html
[195] SKIP
      https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19006/shard-rkl-5/igt=
@gem_exec_reloc@basic-write-read.html
[196] SKIP
      https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_169493v3/shard-rkl=
-8/igt@gem_exec_reloc@basic-wc-cpu.html
[197] SKIP
      https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19006/shard-rkl-6/igt=
@gem_exec_reloc@basic-wc-cpu.html
[198] i915#4525
      https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4525
[199] SKIP
      https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_169493v3/shard-rkl=
-6/igt@gem_exec_balancer@parallel-out-fence.html
[200] SKIP
      https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19006/shard-rkl-5/igt=
@gem_exec_balancer@parallel-out-fence.html
[201] SKIP
      https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_169493v3/shard-rkl=
-8/igt@gem_exec_balancer@parallel.html
[202] SKIP
      https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19006/shard-rkl-6/igt=
@gem_exec_balancer@parallel.html
[203] i915#13008
      https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13008
[204] SKIP
      https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_169493v3/shard-rkl=
-4/igt@gem_ccs@large-ctrl-surf-copy.html
[205] SKIP
      https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19006/shard-rkl-6/igt=
@gem_ccs@large-ctrl-surf-copy.html
[206] i915#11078
      https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11078
[207] SKIP
      https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_169493v3/shard-rkl=
-6/igt@device_reset@unbind-cold-reset-rebind.html
[208] SKIP
      https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19006/shard-rkl-5/igt=
@device_reset@unbind-cold-reset-rebind.html
[209] i915#6230
      https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6230
[210] SKIP
      https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_169493v3/shard-rkl=
-8/igt@api_intel_bb@crc32.html
[211] SKIP
      https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19006/shard-rkl-6/igt=
@api_intel_bb@crc32.html
[212] SKIP
      https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_169493v3/shard-rkl=
-6/igt@api_intel_bb@blit-reloc-purge-cache.html
[213] SKIP
      https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19006/shard-rkl-5/igt=
@api_intel_bb@blit-reloc-purge-cache.html
[214] PASS
      https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_169493v3/shard-dg2=
-6/igt@perf_pmu@busy-double-start@vecs1.html
[215] i915#4349
      https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4349
[216] FAIL
      https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19006/shard-dg2-3/igt=
@perf_pmu@busy-double-start@vecs1.html
[217] PASS
      https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_169493v3/shard-rkl=
-5/igt@kms_pm_rpm@system-suspend-modeset.html
[218] i915#14419
      https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14419
[219] INCOMPLETE
      https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19006/shard-rkl-4/igt=
@kms_pm_rpm@system-suspend-modeset.html
[220] PASS
      https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_169493v3/shard-dg1=
-19/igt@kms_pm_rpm@modeset-non-lpsp.html
[221] i915#15073
      https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15073
[222] SKIP
      https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19006/shard-dg1-15/ig=
t@kms_pm_rpm@modeset-non-lpsp.html
[223] PASS
      https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_169493v3/shard-dg2=
-4/igt@kms_pm_rpm@dpms-lpsp.html
[224] SKIP
      https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19006/shard-dg2-1/igt=
@kms_pm_rpm@dpms-lpsp.html
[225] PASS
      https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_169493v3/shard-dg2=
-4/igt@kms_pm_lpsp@kms-lpsp.html
[226] SKIP
      https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19006/shard-dg2-1/igt=
@kms_pm_lpsp@kms-lpsp.html
[227] PASS
      https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_169493v3/shard-glk=
9/igt@kms_pipe_stress@stress-xrgb8888-ytiled.html
[228] i915#118
      https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/118
[229] DMESG-WARN
      https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19006/shard-glk9/igt@=
kms_pipe_stress@stress-xrgb8888-ytiled.html
[230] PASS
      https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_169493v3/shard-rkl=
-7/igt@kms_pipe_crc_basic@suspend-read-crc@pipe-b-hdmi-a-2.html
[231] i915#13476
      https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13476
[232] INCOMPLETE
      https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19006/shard-rkl-3/igt=
@kms_pipe_crc_basic@suspend-read-crc@pipe-b-hdmi-a-2.html
[233] PASS
      https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_169493v3/shard-rkl=
-7/igt@kms_pipe_crc_basic@suspend-read-crc.html
[234] i915#12756
      https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12756
[235] INCOMPLETE
      https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19006/shard-rkl-3/igt=
@kms_pipe_crc_basic@suspend-read-crc.html
[236] PASS
      https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_169493v3/shard-rkl=
-6/igt@kms_frontbuffer_tracking@hdr-rgb565-draw-mmap-cpu.html
[237] i915#15989
      https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15989
[238] SKIP
      https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19006/shard-rkl-5/igt=
@kms_frontbuffer_tracking@hdr-rgb565-draw-mmap-cpu.html
[239] PASS
      https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_169493v3/shard-glk=
8/igt@kms_frontbuffer_tracking@hdr-1p-primscrn-spr-indfb-fullscreen.html
[240] SKIP
      https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19006/shard-glk5/igt@=
kms_frontbuffer_tracking@hdr-1p-primscrn-spr-indfb-fullscreen.html
[241] PASS
      https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_169493v3/shard-dg1=
-17/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-spr-indfb-draw-blt.html
[242] DMESG-WARN
      https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19006/shard-dg1-19/ig=
t@kms_frontbuffer_tracking@fbc-1p-primscrn-spr-indfb-draw-blt.html
[243] PASS
      https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_169493v3/shard-rkl=
-4/igt@kms_cursor_crc@cursor-onscreen-64x21.html
[244] i915#13566
      https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13566
[245] FAIL
      https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19006/shard-rkl-8/igt=
@kms_cursor_crc@cursor-onscreen-64x21.html
[246] PASS
      https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_169493v3/shard-rkl=
-8/igt@kms_ccs@crc-primary-suspend-y-tiled-gen12-rc-ccs-cc.html
[247] i915#15582
      https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15582
[248] INCOMPLETE
      https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19006/shard-rkl-6/igt=
@kms_ccs@crc-primary-suspend-y-tiled-gen12-rc-ccs-cc.html
[249] PASS
      https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_169493v3/shard-tgl=
u-5/igt@kms_atomic_transition@plane-all-modeset-transition@pipe-a-hdmi-a-1.=
html
[250] i915#15662
      https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15662
[251] FAIL
      https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19006/shard-tglu-8/ig=
t@kms_atomic_transition@plane-all-modeset-transition@pipe-a-hdmi-a-1.html
[252] PASS
      https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_169493v3/shard-mtl=
p-4/igt@i915_power@sanity.html
[253] i915#7984
      https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/7984
[254] SKIP
      https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19006/shard-mtlp-1/ig=
t@i915_power@sanity.html
[255] PASS
      https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_169493v3/shard-snb=
6/igt@i915_pm_rps@reset.html
[256] i915#16162
      https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16162
[257] TIMEOUT
      https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19006/shard-snb7/igt@=
i915_pm_rps@reset.html
[258] PASS
      https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_169493v3/shard-rkl=
-5/igt@gem_workarounds@suspend-resume-fd.html
[259] INCOMPLETE
      https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19006/shard-rkl-6/igt=
@gem_workarounds@suspend-resume-fd.html
[260] PASS
      https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_169493v3/shard-dg1=
-18/igt@gem_linear_blits@normal.html
[261] i915#15391
      https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15391
[262] FAIL
      https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19006/shard-dg1-14/ig=
t@gem_linear_blits@normal.html
[263] PASS
      https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_169493v3/shard-rkl=
-3/igt@gem_exec_suspend@basic-s3-devices@smem.html
[264] i915#15542
      https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15542
[265] ABORT
      https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19006/shard-rkl-1/igt=
@gem_exec_suspend@basic-s3-devices@smem.html
[266] PASS
      https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_169493v3/shard-rkl=
-3/igt@gem_exec_suspend@basic-s3-devices.html
[267] i915#15131
      https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15131
[268] ABORT
      https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19006/shard-rkl-1/igt=
@gem_exec_suspend@basic-s3-devices.html
[269] i915#16420
      https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16420
[270] SKIP
      https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_169493v3/shard-rkl=
-2/igt@prime_udl@share-import.html
[271] SKIP
      https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_169493v3/shard-tgl=
u-1/igt@prime_udl@share-import.html
[272] i915#8516
      https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8516
[273] SKIP
      https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_169493v3/shard-rkl=
-5/igt@perf_pmu@rc6@other-idle-gt0.html
[274] i915#15778
      https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15778
[275] ABORT
      https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_169493v3/shard-glk=
10/igt@perf_pmu@module-unload.html
[276] i915#2435
      https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2435
[277] SKIP
      https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_169493v3/shard-rkl=
-6/igt@perf@per-context-mode-unprivileged.html
[278] i915#2434
      https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2434
[279] SKIP
      https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_169493v3/shard-rkl=
-5/igt@perf@mi-rpc.html
[280] SKIP
      https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_169493v3/shard-rkl=
-2/igt@kms_vrr@seamless-rr-switch-vrr.html
[281] SKIP
      https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_169493v3/shard-tgl=
u-1/igt@kms_vrr@seamless-rr-switch-vrr.html
[282] SKIP
      https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_169493v3/shard-tgl=
u-9/igt@kms_vrr@seamless-rr-switch-virtual.html
[283] SKIP
      https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_169493v3/shard-tgl=
u-9/igt@kms_vrr@flip-suspend.html
[284] i915#15243
      https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15243
[285] SKIP
      https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_169493v3/shard-rkl=
-5/igt@kms_vrr@flip-dpms.html
[286] i915#13179
      https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13179
[287] ABORT
      https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_169493v3/shard-tgl=
u-1/igt@kms_selftest@drm_framebuffer.html
[288] SKIP
      https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_169493v3/shard-rkl=
-6/igt@kms_scaling_modes@scaling-mode-full-aspect.html
[289] SKIP
      https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_169493v3/shard-rkl=
-7/igt@kms_rotation_crc@primary-yf-tiled-reflect-x-270.html
[290] SKIP
      https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_169493v3/shard-tgl=
u-1/igt@kms_psr@psr2-sprite-mmap-gtt.html
[291] SKIP
      https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_169493v3/shard-rkl=
-6/igt@kms_psr@psr-sprite-plane-move.html
[292] SKIP
      https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_169493v3/shard-rkl=
-3/igt@kms_psr@pr-cursor-mmap-cpu.html
[293] SKIP
      https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_169493v3/shard-tgl=
u-9/igt@kms_psr@fbc-psr2-cursor-plane-move.html
[294] i915#9683
      https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9683
[295] SKIP
      https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_169493v3/shard-rkl=
-6/igt@kms_psr2_su@page_flip-xrgb8888.html
[296] SKIP
      https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_169493v3/shard-tgl=
u-9/igt@kms_psr2_su@frontbuffer-xrgb8888.html
[297] SKIP
      https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_169493v3/shard-tgl=
u-1/igt@kms_psr2_sf@psr2-overlay-primary-update-sf-dmg-area.html
[298] SKIP
      https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_169493v3/shard-glk=
10/igt@kms_psr2_sf@pr-primary-plane-update-sf-dmg-area-big-fb.html
[299] SKIP
      https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_169493v3/shard-rkl=
-6/igt@kms_psr2_sf@pr-plane-move-sf-dmg-area.html
[300] SKIP
      https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_169493v3/shard-glk=
11/igt@kms_psr2_sf@pr-cursor-plane-update-sf.html
[301] SKIP
      https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_169493v3/shard-glk=
2/igt@kms_psr2_sf@fbc-psr2-primary-plane-update-sf-dmg-area.html
[302] SKIP
      https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_169493v3/shard-tgl=
u-9/igt@kms_psr2_sf@fbc-psr2-overlay-plane-move-continuous-exceed-sf.html
[303] SKIP
      https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_169493v3/shard-rkl=
-8/igt@kms_psr2_sf@fbc-psr2-cursor-plane-move-continuous-exceed-sf.html
[304] i915#6524
      https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6524
[305] SKIP
      https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_169493v3/shard-rkl=
-2/igt@kms_prime@basic-crc-hybrid.html
[306] SKIP
      https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_169493v3/shard-tgl=
u-1/igt@kms_prime@basic-crc-hybrid.html
[307] SKIP
      https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_169493v3/shard-dg2=
-4/igt@kms_pm_rpm@modeset-non-lpsp-stress.html
[308] PASS
      https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19006/shard-dg2-1/igt=
@kms_pm_rpm@modeset-non-lpsp-stress.html
[309] SKIP
      https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_169493v3/shard-dg1=
-15/igt@kms_pm_rpm@modeset-non-lpsp-stress.html
[310] PASS
      https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19006/shard-dg1-18/ig=
t@kms_pm_rpm@modeset-non-lpsp-stress.html
[311] SKIP
      https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_169493v3/shard-rkl=
-7/igt@kms_pm_rpm@modeset-lpsp-stress-no-wait.html
[312] SKIP
      https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_169493v3/shard-rkl=
-6/igt@kms_pm_rpm@dpms-mode-unset-lpsp.html
[313] SKIP
      https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_169493v3/shard-rkl=
-3/igt@kms_pm_rpm@dpms-lpsp.html
[314] PASS
      https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19006/shard-rkl-5/igt=
@kms_pm_rpm@dpms-lpsp.html
[315] i915#8430
      https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8430
[316] SKIP
      https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_169493v3/shard-tgl=
u-1/igt@kms_pm_lpsp@screens-disabled.html
[317] i915#15948
      https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15948
[318] SKIP
      https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_169493v3/shard-rkl=
-5/igt@kms_pm_dc@dc6-psr.html
[319] SKIP
      https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_169493v3/shard-rkl=
-3/igt@kms_pm_dc@dc5-retention-flops.html
[320] SKIP
      https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_169493v3/shard-tgl=
u-9/igt@kms_pm_dc@dc5-psr.html
[321] i915#9812
      https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9812
[322] i915#12343
      https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12343
[323] SKIP
      https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_169493v3/shard-tgl=
u-9/igt@kms_pm_backlight@basic-brightness.html
[324] i915#15329
      https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15329
[325] SKIP
      https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_169493v3/shard-rkl=
-5/igt@kms_plane_scaling@plane-upscale-20x20-with-rotation@pipe-a.html
[326] SKIP
      https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_169493v3/shard-rkl=
-6/igt@kms_plane_scaling@plane-scaler-with-clipping-clamping-rotation.html
[327] SKIP
      https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_169493v3/shard-rkl=
-6/igt@kms_plane_scaling@plane-downscale-factor-0-75-with-rotation@pipe-a.h=
tml
[328] SKIP
      https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_169493v3/shard-rkl=
-6/igt@kms_plane_multiple@2x-tiling-yf.html
[329] SKIP
      https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_169493v3/shard-rkl=
-5/igt@kms_plane_multiple@2x-tiling-4.html
[330] i915#10647
      https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/10647
[331] FAIL
      https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_169493v3/shard-glk=
11/igt@kms_plane_alpha_blend@alpha-transparent-fb@pipe-a-hdmi-a-1.html
[332] i915#12177
      https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12177
[333] FAIL
      https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_169493v3/shard-glk=
11/igt@kms_plane_alpha_blend@alpha-transparent-fb.html
[334] FAIL
      https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_169493v3/shard-glk=
10/igt@kms_plane_alpha_blend@alpha-opaque-fb@pipe-c-hdmi-a-1.html
[335] i915#12169
      https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12169
[336] FAIL
      https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_169493v3/shard-glk=
10/igt@kms_plane_alpha_blend@alpha-opaque-fb.html
[337] i915#14412
      https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14412
[338] INCOMPLETE
      https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_169493v3/shard-rkl=
-3/igt@kms_plane@plane-panning-bottom-right-suspend@pipe-b.html
[339] PASS
      https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19006/shard-rkl-5/igt=
@kms_plane@plane-panning-bottom-right-suspend@pipe-b.html
[340] i915#13026
      https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13026
[341] INCOMPLETE
      https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_169493v3/shard-glk=
11/igt@kms_plane@plane-panning-bottom-right-suspend.html
[342] i915#16112
      https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16112
[343] SKIP
      https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_169493v3/shard-tgl=
u-1/igt@kms_plane@planar-pixel-format-settings@nv12-tile4-src-y.html
[344] SKIP
      https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_169493v3/shard-rkl=
-6/igt@kms_plane@pixel-format-4-tiled-mtl-rc-ccs-modifier.html
[345] SKIP
      https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_169493v3/shard-rkl=
-2/igt@kms_plane@pixel-format-4-tiled-mtl-rc-ccs-cc-modifier-source-clampin=
g.html
[346] SKIP
      https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_169493v3/shard-glk=
2/igt@kms_plane@pixel-format-4-tiled-mtl-rc-ccs-cc-modifier.html
[347] SKIP
      https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_169493v3/shard-tgl=
u-1/igt@kms_plane@pixel-format-4-tiled-dg2-rc-ccs-cc-modifier-source-clampi=
ng.html
[348] SKIP
      https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_169493v3/shard-tgl=
u-9/igt@kms_plane@pixel-format-4-tiled-dg2-mc-ccs-modifier.html
[349] DMESG-WARN
      https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_169493v3/shard-glk=
11/igt@kms_pipe_stress@stress-xrgb8888-untiled.html
[350] i915#15815
      https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15815
[351] SKIP
      https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_169493v3/shard-tgl=
u-1/igt@kms_multipipe_modeset@basic-max-pipe-crc-check.html
[352] i915#15460
      https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15460
[353] SKIP
      https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_169493v3/shard-tgl=
u-1/igt@kms_joiner@invalid-modeset-big-joiner.html
[354] SKIP
      https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_169493v3/shard-glk=
11/igt@kms_joiner@basic-force-ultra-joiner.html
[355] SKIP
      https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_169493v3/shard-rkl=
-7/igt@kms_joiner@basic-big-joiner.html
[356] SKIP
      https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_169493v3/shard-tgl=
u-9/igt@kms_hdr@static-toggle.html
[357] SKIP
      https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_169493v3/shard-rkl=
-2/igt@kms_hdr@static-swap.html
[358] SKIP
      https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_169493v3/shard-tgl=
u-1/igt@kms_hdr@static-swap.html
[359] i915#12713
      https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12713
[360] SKIP
      https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_169493v3/shard-tgl=
u-9/igt@kms_hdr@brightness-with-hdr.html
[361] INCOMPLETE
      https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_169493v3/shard-rkl=
-6/igt@kms_hdr@bpc-switch-suspend@pipe-a-hdmi-a-2-xrgb2101010.html
[362] SKIP
      https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_169493v3/shard-rkl=
-8/igt@kms_hdr@bpc-switch-dpms.html
[363] PASS
      https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19006/shard-rkl-6/igt=
@kms_hdr@bpc-switch-dpms.html
[364] SKIP
      https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_169493v3/shard-glk=
10/igt@kms_frontbuffer_tracking@psrhdr-2p-scndscrn-pri-shrfb-draw-pwrite.ht=
ml
[365] SKIP
      https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_169493v3/shard-rkl=
-3/igt@kms_frontbuffer_tracking@psrhdr-1p-primscrn-spr-indfb-move.html
[366] SKIP
      https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_169493v3/shard-tgl=
u-9/igt@kms_frontbuffer_tracking@psr-2p-scndscrn-pri-shrfb-draw-mmap-wc.htm=
l
[367] SKIP
      https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_169493v3/shard-rkl=
-6/igt@kms_frontbuffer_tracking@psr-1p-primscrn-pri-shrfb-draw-mmap-gtt.htm=
l
[368] SKIP
      https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_169493v3/shard-tgl=
u-9/igt@kms_frontbuffer_tracking@psr-1p-offscreen-pri-shrfb-draw-blt.html
[369] i915#16056
      https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16056
[370] INCOMPLETE
      https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_169493v3/shard-rkl=
-6/igt@kms_frontbuffer_tracking@hdr-suspend.html
[371] SKIP
      https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_169493v3/shard-rkl=
-4/igt@kms_frontbuffer_tracking@hdr-rgb101010-draw-pwrite.html
[372] PASS
      https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19006/shard-rkl-6/igt=
@kms_frontbuffer_tracking@hdr-rgb101010-draw-pwrite.html
[373] SKIP
      https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_169493v3/shard-rkl=
-2/igt@kms_frontbuffer_tracking@hdr-1p-primscrn-pri-shrfb-draw-mmap-cpu.htm=
l
[374] SKIP
      https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_169493v3/shard-glk=
6/igt@kms_frontbuffer_tracking@hdr-1p-primscrn-cur-indfb-move.html
[375] PASS
      https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19006/shard-glk8/igt@=
kms_frontbuffer_tracking@hdr-1p-primscrn-cur-indfb-move.html
[376] SKIP
      https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_169493v3/shard-tgl=
u-9/igt@kms_frontbuffer_tracking@hdr-1p-offscreen-pri-indfb-draw-mmap-gtt.h=
tml
[377] SKIP
      https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_169493v3/shard-tgl=
u-1/igt@kms_frontbuffer_tracking@hdr-1p-offscreen-pri-indfb-draw-blt.html
[378] SKIP
      https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_169493v3/shard-snb=
6/igt@kms_frontbuffer_tracking@fbcpsrhdr-1p-primscrn-pri-indfb-draw-render.=
html
[379] SKIP
      https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_169493v3/shard-tgl=
u-1/igt@kms_frontbuffer_tracking@fbcpsr-rgb565-draw-mmap-wc.html
[380] SKIP
      https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_169493v3/shard-rkl=
-6/igt@kms_frontbuffer_tracking@fbchdr-2p-primscrn-cur-indfb-draw-pwrite.ht=
ml
[381] i915#16593
      https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16593
[382] i915#10056
      https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/10056
[383] INCOMPLETE
      https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_169493v3/shard-glk=
4/igt@kms_frontbuffer_tracking@fbc-suspend.html
[384] SKIP
      https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_169493v3/shard-rkl=
-5/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-pri-shrfb-draw-mmap-gtt.htm=
l
[385] SKIP
      https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_169493v3/shard-tgl=
u-1/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-pri-shrfb-draw-mmap-cpu.ht=
ml
[386] SKIP
      https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_169493v3/shard-rkl=
-2/igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-32bpp-yftile-upscaling.html
[387] SKIP
      https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_169493v3/shard-tgl=
u-1/igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-32bpp-yftile-upscaling.htm=
l
[388] SKIP
      https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_169493v3/shard-tgl=
u-9/igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-32bpp-4tile-upscaling.html
[389] i915#16276
      https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16276
[390] INCOMPLETE
      https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_169493v3/shard-rkl=
-3/igt@kms_flip@flip-vs-suspend@a-hdmi-a2.html
[391] INCOMPLETE
      https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_169493v3/shard-rkl=
-3/igt@kms_flip@flip-vs-suspend.html
[392] PASS
      https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19006/shard-rkl-2/igt=
@kms_flip@flip-vs-suspend.html
[393] i915#13027
      https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13027
[394] FAIL
      https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_169493v3/shard-glk=
2/igt@kms_flip@flip-vs-expired-vblank.html
[395] PASS
      https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19006/shard-glk1/igt@=
kms_flip@flip-vs-expired-vblank.html
[396] i915#3637
      https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3637
[397] SKIP
      https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_169493v3/shard-tgl=
u-9/igt@kms_flip@2x-nonexisting-fb.html
[398] SKIP
      https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_169493v3/shard-rkl=
-5/igt@kms_flip@2x-flip-vs-suspend.html
[399] SKIP
      https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_169493v3/shard-tgl=
u-1/igt@kms_flip@2x-flip-vs-panning-vs-hang.html
[400] SKIP
      https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_169493v3/shard-rkl=
-6/igt@kms_flip@2x-flip-vs-modeset.html
[401] i915#16600
      https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16600
[402] SKIP
      https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_169493v3/shard-tgl=
u-1/igt@kms_feature_discovery@hdr.html
[403] SKIP
      https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_169493v3/shard-rkl=
-5/igt@kms_feature_discovery@dsc.html
[404] i915#16081
      https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16081
[405] SKIP
      https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_169493v3/shard-rkl=
-3/igt@kms_feature_discovery@display-4x.html
[406] SKIP
      https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_169493v3/shard-tgl=
u-9/igt@kms_feature_discovery@display-2x.html
[407] i915#16084
      https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16084
[408] SKIP
      https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_169493v3/shard-rkl=
-3/igt@kms_feature_discovery@chamelium.html
[409] SKIP
      https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_169493v3/shard-tgl=
u-9/igt@kms_fbcon_fbt@psr-suspend.html
[410] SKIP
      https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_169493v3/shard-rkl=
-6/igt@kms_dsc@dsc-with-output-formats.html
[411] SKIP
      https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_169493v3/shard-rkl=
-2/igt@kms_dsc@dsc-basic-bigjoiner.html
[412] SKIP
      https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_169493v3/shard-tgl=
u-1/igt@kms_dsc@dsc-basic.html
[413] i915#13707
      https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13707
[414] SKIP
      https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_169493v3/shard-tgl=
u-9/igt@kms_dp_linktrain_fallback@dp-fallback.html
[415] i915#13749
      https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13749
[416] SKIP
      https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_169493v3/shard-tgl=
u-9/igt@kms_dp_link_training@non-uhbr-mst.html
[417] SKIP
      https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_169493v3/shard-rkl=
-6/igt@kms_cursor_legacy@short-busy-flip-before-cursor-toggle.html
[418] i915#9067
      https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9067
[419] SKIP
      https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_169493v3/shard-tgl=
u-9/igt@kms_cursor_legacy@modeset-atomic-cursor-hotspot.html
[420] FAIL
      https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_169493v3/shard-glk=
2/igt@kms_cursor_legacy@flip-vs-cursor-atomic-transitions.html
[421] SKIP
      https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_169493v3/shard-tgl=
u-1/igt@kms_cursor_crc@cursor-sliding-32x10.html
[422] i915#13049
      https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13049
[423] SKIP
      https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_169493v3/shard-rkl=
-2/igt@kms_cursor_crc@cursor-rapid-movement-512x170.html
[424] SKIP
      https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_169493v3/shard-tgl=
u-1/igt@kms_cursor_crc@cursor-rapid-movement-512x170.html
[425] SKIP
      https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_169493v3/shard-tgl=
u-9/igt@kms_cursor_crc@cursor-random-512x512.html
[426] SKIP
      https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_169493v3/shard-rkl=
-8/igt@kms_cursor_crc@cursor-random-32x10.html
[427] SKIP
      https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_169493v3/shard-tgl=
u-9/igt@kms_content_protection@srm.html
[428] i915#3116
      https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3116
[429] SKIP
      https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_169493v3/shard-rkl=
-2/igt@kms_content_protection@dp-mst-type-1.html
[430] i915#3299
      https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3299
[431] SKIP
      https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_169493v3/shard-tgl=
u-1/igt@kms_content_protection@dp-mst-type-1.html
[432] SKIP
      https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_169493v3/shard-tgl=
u-9/igt@kms_content_protection@dp-mst-type-0-suspend-resume.html
[433] SKIP
      https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_169493v3/shard-tgl=
u-1/igt@kms_content_protection@atomic-dpms.html
[434] SKIP
      https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_169493v3/shard-rkl=
-3/igt@kms_content_protection@atomic.html
[435] SKIP
      https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_169493v3/shard-rkl=
-6/igt@kms_chamelium_frames@hdmi-cmp-planar-formats.html
[436] SKIP
      https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_169493v3/shard-tgl=
u-1/igt@kms_chamelium_frames@dp-crc-single.html
[437] SKIP
      https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_169493v3/shard-tgl=
u-9/igt@kms_chamelium_edid@vga-edid-read.html
[438] SKIP
      https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_169493v3/shard-rkl=
-8/igt@kms_chamelium_edid@hdmi-edid-read.html
[439] SKIP
      https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_169493v3/shard-tgl=
u-9/igt@kms_chamelium_color_pipeline@plane-lut1d-pre-ctm3x4.html
[440] SKIP
      https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_169493v3/shard-rkl=
-2/igt@kms_chamelium_audio@hdmi-audio-after-suspend.html
[441] SKIP
      https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_169493v3/shard-tgl=
u-1/igt@kms_chamelium_audio@hdmi-audio-after-suspend.html
[442] SKIP
      https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_169493v3/shard-tgl=
u-9/igt@kms_chamelium_audio@dp-audio-after-suspend.html
[443] SKIP
      https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_169493v3/shard-rkl=
-6/igt@kms_ccs@random-ccs-data-4-tiled-mtl-rc-ccs@pipe-b-hdmi-a-2.html
[444] SKIP
      https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_169493v3/shard-rkl=
-6/igt@kms_ccs@random-ccs-data-4-tiled-dg2-mc-ccs@pipe-c-hdmi-a-2.html
[445] i915#10307
      https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/10307
[446] SKIP
      https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_169493v3/shard-dg2=
-4/igt@kms_ccs@missing-ccs-buffer-4-tiled-mtl-mc-ccs@pipe-b-hdmi-a-1.html
[447] SKIP
      https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_169493v3/shard-rkl=
-2/igt@kms_ccs@crc-sprite-planes-basic-y-tiled-ccs@pipe-c-hdmi-a-1.html
[448] i915#12313
      https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12313
[449] SKIP
      https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_169493v3/shard-tgl=
u-9/igt@kms_ccs@crc-sprite-planes-basic-4-tiled-lnl-ccs.html
[450] SKIP
      https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_169493v3/shard-rkl=
-3/igt@kms_ccs@crc-sprite-planes-basic-4-tiled-dg2-rc-ccs@pipe-b-hdmi-a-2.h=
tml
[451] INCOMPLETE
      https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_169493v3/shard-glk=
10/igt@kms_ccs@crc-primary-suspend-y-tiled-ccs.html
[452] SKIP
      https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_169493v3/shard-dg2=
-4/igt@kms_ccs@crc-primary-suspend-4-tiled-mtl-rc-ccs@pipe-c-hdmi-a-1.html
[453] SKIP
      https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_169493v3/shard-tgl=
u-1/igt@kms_ccs@crc-primary-rotation-180-4-tiled-lnl-ccs.html
[454] i915#10434
      https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/10434
[455] SKIP
      https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_169493v3/shard-dg2=
-4/igt@kms_ccs@crc-primary-basic-y-tiled-gen12-rc-ccs@pipe-d-hdmi-a-1.html
[456] SKIP
      https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_169493v3/shard-tgl=
u-1/igt@kms_ccs@crc-primary-basic-y-tiled-ccs.html
[457] SKIP
      https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_169493v3/shard-rkl=
-3/igt@kms_ccs@crc-primary-basic-4-tiled-bmg-ccs.html
[458] SKIP
      https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_169493v3/shard-tgl=
u-9/igt@kms_ccs@ccs-on-another-bo-y-tiled-gen12-mc-ccs@pipe-b-hdmi-a-1.html
[459] SKIP
      https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_169493v3/shard-dg1=
-16/igt@kms_ccs@bad-aux-stride-4-tiled-mtl-mc-ccs@pipe-a-hdmi-a-4.html
[460] SKIP
      https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_169493v3/shard-rkl=
-7/igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-180.html
[461] SKIP
      https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_169493v3/shard-rkl=
-3/igt@kms_big_fb@y-tiled-8bpp-rotate-270.html
[462] SKIP
      https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_169493v3/shard-tgl=
u-1/igt@kms_big_fb@linear-max-hw-stride-64bpp-rotate-180-hflip.html
[463] i915#5138
      https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5138
[464] FAIL
      https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_169493v3/shard-dg1=
-12/igt@kms_big_fb@linear-max-hw-stride-32bpp-rotate-180.html
[465] PASS
      https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19006/shard-dg1-16/ig=
t@kms_big_fb@linear-max-hw-stride-32bpp-rotate-180.html
[466] SKIP
      https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_169493v3/shard-rkl=
-8/igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-180.html
[467] SKIP
      https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_169493v3/shard-rkl=
-6/igt@kms_big_fb@4-tiled-addfb-size-offset-overflow.html
[468] SKIP
      https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_169493v3/shard-tgl=
u-9/igt@kms_big_fb@4-tiled-8bpp-rotate-0.html
[469] SKIP
      https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_169493v3/shard-tgl=
u-1/igt@kms_big_fb@4-tiled-32bpp-rotate-0.html
[470] i915#1769
      https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/1769
[471] SKIP
      https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_169493v3/shard-tgl=
u-1/igt@kms_atomic_transition@plane-all-modeset-transition-fencing-internal=
-panels.html
[472] i915#14888
      https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14888
[473] FAIL
      https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_169493v3/shard-glk=
3/igt@kms_async_flips@alternate-sync-async-flip-atomic@pipe-a-hdmi-a-1.html
[474] PASS
      https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19006/shard-glk1/igt@=
kms_async_flips@alternate-sync-async-flip-atomic@pipe-a-hdmi-a-1.html
[475] i915#7707
      https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/7707
[476] SKIP
      https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_169493v3/shard-rkl=
-2/igt@intel_hwmon@hwmon-read.html
[477] SKIP
      https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_169493v3/shard-tgl=
u-1/igt@intel_hwmon@hwmon-read.html
[478] i915#16079
      https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16079
[479] SKIP
      https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_169493v3/shard-rkl=
-5/igt@i915_query@query-topology-unsupported.html
[480] i915#4387
      https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4387
[481] SKIP
      https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_169493v3/shard-rkl=
-6/igt@i915_pm_sseu@full-enable.html
[482] i915#15172
      https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15172
[483] INCOMPLETE
      https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_169493v3/shard-glk=
6/igt@i915_pm_rpm@system-suspend-execbuf.html
[484] INCOMPLETE
      https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_169493v3/shard-rkl=
-7/igt@i915_pm_rpm@system-suspend-execbuf.html
[485] PASS
      https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19006/shard-rkl-7/igt=
@i915_pm_rpm@system-suspend-execbuf.html
[486] i915#8399
      https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8399
[487] SKIP
      https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_169493v3/shard-rkl=
-6/igt@i915_pm_freq_api@freq-suspend.html
[488] SKIP
      https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_169493v3/shard-rkl=
-7/igt@i915_pm_freq_api@freq-reset-multiple.html
[489] i915#15678
      https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15678
[490] SKIP
      https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_169493v3/shard-tgl=
u-1/igt@gpu_buddy@gpu_buddy.html
[491] i915#2856
      https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2856
[492] SKIP
      https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_169493v3/shard-tgl=
u-9/igt@gen9_exec_parse@unaligned-jump.html
[493] SKIP
      https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_169493v3/shard-tgl=
u-1/igt@gen9_exec_parse@secure-batches.html
[494] SKIP
      https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_169493v3/shard-rkl=
-3/igt@gen9_exec_parse@batch-without-end.html
[495] i915#14586
      https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14586
[496] INCOMPLETE
      https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_169493v3/shard-glk=
11/igt@gem_workarounds@suspend-resume-fd.html
[497] SKIP
      https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_169493v3/shard-rkl=
-6/igt@gem_userptr_blits@unsync-overlap.html
[498] SKIP
      https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_169493v3/shard-rkl=
-3/igt@gem_userptr_blits@forbidden-operations.html
[499] SKIP
      https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_169493v3/shard-rkl=
-2/igt@gem_userptr_blits@coherency-unsync.html
[500] SKIP
      https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_169493v3/shard-tgl=
u-1/igt@gem_userptr_blits@coherency-unsync.html
[501] SKIP
      https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_169493v3/shard-tgl=
u-9/igt@gem_userptr_blits@coherency-sync.html
[502] i915#13717
      https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13717
[503] SKIP
      https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_169493v3/shard-rkl=
-2/igt@gem_pxp@hw-rejects-pxp-context.html
[504] i915#13398
      https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13398
[505] SKIP
      https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_169493v3/shard-tgl=
u-1/igt@gem_pxp@hw-rejects-pxp-context.html
[506] SKIP
      https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_169493v3/shard-rkl=
-3/igt@gem_partial_pwrite_pread@writes-after-reads-uncached.html
[507] i915#16349
      https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16349
[508] i915#16168
      https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16168
[509] i915#16021
      https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16021
[510] TIMEOUT
      https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_169493v3/shard-mtl=
p-2/igt@gem_mmap_offset@clear-via-pagefault.html
[511] PASS
      https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19006/shard-mtlp-3/ig=
t@gem_mmap_offset@clear-via-pagefault.html
[512] SKIP
      https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_169493v3/shard-glk=
9/igt@gem_lmem_swapping@massive-random.html
[513] SKIP
      https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_169493v3/shard-rkl=
-5/igt@gem_lmem_swapping@heavy-verify-random-ccs.html
[514] SKIP
      https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_169493v3/shard-tgl=
u-1/igt@gem_lmem_swapping@heavy-verify-multi-ccs.html
[515] i915#7582
      https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/7582
[516] SKIP
      https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_169493v3/shard-tgl=
u-1/igt@gem_lmem_evict@dontneed-evict-race.html
[517] i915#2190
      https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2190
[518] SKIP
      https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_169493v3/shard-tgl=
u-9/igt@gem_huc_copy@huc-copy.html
[519] SKIP
      https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_169493v3/shard-rkl=
-2/igt@gem_exec_reloc@basic-gtt-cpu.html
[520] i915#6344
      https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6344
[521] SKIP
      https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_169493v3/shard-rkl=
-6/igt@gem_exec_capture@capture-recoverable.html
[522] i915#6334
      https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6334
[523] SKIP
      https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_169493v3/shard-tgl=
u-9/igt@gem_exec_capture@capture-invisible@smem0.html
[524] SKIP
      https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_169493v3/shard-tgl=
u-1/igt@gem_exec_balancer@parallel-bb-first.html
[525] i915#13390
      https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13390
[526] INCOMPLETE
      https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_169493v3/shard-glk=
2/igt@gem_eio@in-flight-suspend.html
[527] i915#280
      https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/280
[528] SKIP
      https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_169493v3/shard-rkl=
-5/igt@gem_ctx_sseu@invalid-args.html
[529] i915#8562
      https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8562
[530] SKIP
      https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_169493v3/shard-rkl=
-5/igt@gem_create@create-ext-set-pat.html
[531] i915#6335
      https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6335
[532] SKIP
      https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_169493v3/shard-rkl=
-7/igt@gem_create@create-ext-cpu-access-sanity-check.html
[533] i915#16348
      https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16348
[534] INCOMPLETE
      https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_169493v3/shard-dg2=
-3/igt@gem_ccs@suspend-resume@xmajor-compressed-compfmt0-smem-lmem0.html
[535] PASS
      https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19006/shard-dg2-5/igt=
@gem_ccs@suspend-resume@xmajor-compressed-compfmt0-smem-lmem0.html
[536] i915#9323
      https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9323
[537] SKIP
      https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_169493v3/shard-tgl=
u-9/igt@gem_ccs@block-multicopy-inplace.html
[538] SKIP
      https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_169493v3/shard-tgl=
u-1/igt@gem_ccs@block-copy-compressed.html
[539] i915#7697
      https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/7697
[540] SKIP
      https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_169493v3/shard-rkl=
-2/igt@gem_basic@multigpu-create-close.html
[541] SKIP
      https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_169493v3/shard-tgl=
u-1/igt@gem_basic@multigpu-create-close.html
[542] SKIP
      https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_169493v3/shard-rkl=
-6/igt@gem_bad_reloc@negative-reloc-lut.html
[543] SKIP
      https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_169493v3/shard-tgl=
u-9/igt@device_reset@cold-reset-bound.html
[544] FAIL
      https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_169493v3/shard-glk=
9/igt@perf_pmu@render-node-busy-idle@rcs0.html

--=-Utt+x+Li/7LJK5gyJsJE
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
<body><div>Hi,</div><div><br></div><div>The CI.Full report for series 16949=
3 (rev3, "drm/i915/display: reduce clock_gating interface between core and =
display") flags a possible regression:</div><div><br></div><div>  <a href=
=3D"mailto:igt@perf">igt@perf</a><a href=3D"mailto:_pmu@render-node-busy-id=
le">_pmu@render-node-busy-idle</a>@rcs0 shard-glk9: NOTRUN -&gt; FAIL (+9 o=
ther perf_pmu tests failing the same way)</div><div><br></div><div>  <a hre=
f=3D"https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_169493v3/shard-glk9=
/igt@perf_pmu@render-node-busy-idle@rcs0.html">https://intel-gfx-ci.01.org/=
tree/drm-tip/Patchwork_169493v3/shard-glk9/igt@perf_pmu@render-node-busy-id=
le@rcs0.html</a></div><div><br></div><div>This is unrelated to the patchset=
, which only touches intel_display_clock_gating.c/.h, intel_display_reset.c=
/.h, intel_reset.c and the xe Makefile =E2=80=94 none of which affect PMU b=
usy/idle accounting.</div><div><br></div><div>This matches known issue <a h=
ref=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16492">https=
://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16492</a>&nbsp;("<a href=
=3D"mailto:igt@perf">igt@perf</a><a href=3D"mailto:_pmu@render-node-busy-id=
le">_pmu@render-node-busy-idle</a>* - fail - Test assertion failure ... val=
 not within tolerance"), tagged for platform: GLK / SNB and labeled cannot_=
reproduce. That bug was auto-closed on 2026-08-19, one day after this run (=
2026-08-18), so patchwork's known-issue matcher no longer linked it and rep=
orted it as a new/unknown regression instead.</div><div><br></div><div>Coul=
d you please reopen/re-tag #16492 (or re-file if preferred) so this stops s=
howing up as a false regression on unrelated series?</div><div><br></div><d=
iv>(analysis and report assisted by Copilot/Claude Sonnet 5)</div><div><br>=
</div><div>--</div><div>Cheers,</div><div>Luca</div><div><br></div><div><br=
></div><div>On Tue, 2026-08-18 at 02:32 +0000, Patchwork wrote:</div><block=
quote type=3D"cite" style=3D"margin:0 0 0 .8ex; border-left:2px #729fcf sol=
id;padding-left:1ex"><div><b>Patch Details</b></div>
<div><table>
<tbody><tr><td><b>Series:</b></td><td>drm/i915/display: reduce clock_gating=
 interface between core and display (rev3)</td></tr>
<tr><td><b>URL:</b></td><td><a href=3D"https://patchwork.freedesktop.org/se=
ries/169493/">https://patchwork.freedesktop.org/series/169493/</a></td></tr=
>
<tr><td><b>State:</b></td><td>failure</td></tr> <tr><td><b>Details:</b></td=
><td><a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_169493v3=
/index.html">https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_169493v3/in=
dex.html</a></td></tr></tbody></table> </div><h1>CI Bug Log - changes from =
CI_DRM_19006_full -&gt; Patchwork_169493v3_full</h1><h2>Summary</h2><p><str=
ong>FAILURE</strong></p><p>Serious unknown changes coming with Patchwork_16=
9493v3_full absolutely need to be<br> verified manually.</p><p>If you think=
 the reported changes have nothing to do with the changes<br> introduced in=
 Patchwork_169493v3_full, please notify your bug team (I915-ci-infra@lists.=
freedesktop.org) to allow them<br> to document this new failure mode, which=
 will reduce false positives in CI.</p><h2>Participating hosts (10 -&gt; 10=
)</h2><p>No changes in participating hosts</p><h2>Possible new issues</h2><=
p>Here are the unknown changes that may have been introduced in Patchwork_1=
69493v3_full:</p><h3>IGT changes</h3><h4>Possible regressions</h4><ul>
<li>igt@perf_pmu@render-node-busy-idle@rcs0:<ul>
<li>shard-glk:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/Patchwork_169493v3/shard-glk9/igt@perf_pmu@render-node-busy-i=
dle@rcs0.html">FAIL</a> +9 other tests fail</li>
</ul></li>
</ul><h2>New tests</h2><p>New tests have been introduced between CI_DRM_190=
06_full and Patchwork_169493v3_full:</p><h3>New IGT tests (2)</h3><ul>
<li>
<p>igt@gem_lmem_swapping@massive:</p><ul>
<li>Statuses : 2 pass(s) 5 skip(s)</li>
<li>Exec time: [0.0, 12.29] s</li>
</ul></li>
<li>
<p>igt@gem_lmem_swapping@massive-random:</p><ul>
<li>Statuses : 1 pass(s) 3 skip(s)</li>
<li>Exec time: [0.0, 5.66] s</li>
</ul></li>
</ul><h2>Known issues</h2><p>Here are the changes found in Patchwork_169493=
v3_full that come from known issues:</p><h3>IGT changes</h3><h4>Issues hit<=
/h4><ul>
<li>
<p>igt@device_reset@cold-reset-bound:</p><ul>
<li>shard-tglu:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/Patchwork_169493v3/shard-tglu-9/igt@device_reset@cold-reset-b=
ound.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/ker=
nel/-/issues/11078">i915#11078</a>)</li>
</ul></li>
<li>
<p>igt@gem_bad_reloc@negative-reloc-lut:</p><ul>
<li>shard-rkl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/Patchwork_169493v3/shard-rkl-6/igt@gem_bad_reloc@negative-rel=
oc-lut.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/k=
ernel/-/issues/14544">i915#14544</a> / <a href=3D"https://gitlab.freedeskto=
p.org/drm/i915/kernel/-/issues/3281">i915#3281</a>) +1 other test skip</li>
</ul></li>
<li>
<p>igt@gem_basic@multigpu-create-close:</p><ul>
<li>shard-rkl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/Patchwork_169493v3/shard-rkl-2/igt@gem_basic@multigpu-create-=
close.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/ke=
rnel/-/issues/7697">i915#7697</a>)</li>
<li>shard-tglu-1:       NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/Patchwork_169493v3/shard-tglu-1/igt@gem_basic@multigpu-create=
-close.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/k=
ernel/-/issues/7697">i915#7697</a>)</li>
</ul></li>
<li>
<p>igt@gem_ccs@block-copy-compressed:</p><ul>
<li>shard-tglu-1:       NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/Patchwork_169493v3/shard-tglu-1/igt@gem_ccs@block-copy-compre=
ssed.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/ker=
nel/-/issues/3555">i915#3555</a> / <a href=3D"https://gitlab.freedesktop.or=
g/drm/i915/kernel/-/issues/9323">i915#9323</a>)</li>
</ul></li>
<li>
<p>igt@gem_ccs@block-multicopy-inplace:</p><ul>
<li>shard-tglu:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/Patchwork_169493v3/shard-tglu-9/igt@gem_ccs@block-multicopy-i=
nplace.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/k=
ernel/-/issues/3555">i915#3555</a> / <a href=3D"https://gitlab.freedesktop.=
org/drm/i915/kernel/-/issues/9323">i915#9323</a>)</li>
</ul></li>
<li>
<p>igt@gem_ccs@suspend-resume@xmajor-compressed-compfmt0-smem-lmem0:</p><ul=
>
<li>shard-dg2:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_19006/shard-dg2-5/igt@gem_ccs@suspend-resume@xmajor-compressed-comp=
fmt0-smem-lmem0.html">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/Patchwork_169493v3/shard-dg2-3/igt@gem_ccs@suspend-resume@xma=
jor-compressed-compfmt0-smem-lmem0.html">INCOMPLETE</a> (<a href=3D"https:/=
/gitlab.freedesktop.org/drm/i915/kernel/-/issues/13356">i915#13356</a> / <a=
 href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16348">i91=
5#16348</a>)</li>
</ul></li>
<li>
<p>igt@gem_create@create-ext-cpu-access-sanity-check:</p><ul>
<li>shard-rkl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/Patchwork_169493v3/shard-rkl-7/igt@gem_create@create-ext-cpu-=
access-sanity-check.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.o=
rg/drm/i915/kernel/-/issues/6335">i915#6335</a>)</li>
</ul></li>
<li>
<p>igt@gem_create@create-ext-set-pat:</p><ul>
<li>shard-rkl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/Patchwork_169493v3/shard-rkl-5/igt@gem_create@create-ext-set-=
pat.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kern=
el/-/issues/8562">i915#8562</a>)</li>
</ul></li>
<li>
<p>igt@gem_ctx_sseu@invalid-args:</p><ul>
<li>shard-rkl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/Patchwork_169493v3/shard-rkl-5/igt@gem_ctx_sseu@invalid-args.=
html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-=
/issues/280">i915#280</a>)</li>
</ul></li>
<li>
<p>igt@gem_eio@in-flight-suspend:</p><ul>
<li>shard-glk:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/Patchwork_169493v3/shard-glk2/igt@gem_eio@in-flight-suspend.h=
tml">INCOMPLETE</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/ker=
nel/-/issues/13390">i915#13390</a>)</li>
</ul></li>
<li>
<p>igt@gem_exec_balancer@parallel-bb-first:</p><ul>
<li>shard-tglu-1:       NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/Patchwork_169493v3/shard-tglu-1/igt@gem_exec_balancer@paralle=
l-bb-first.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i9=
15/kernel/-/issues/4525">i915#4525</a>)</li>
</ul></li>
<li>
<p>igt@gem_exec_capture@capture-invisible@smem0:</p><ul>
<li>shard-tglu:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/Patchwork_169493v3/shard-tglu-9/igt@gem_exec_capture@capture-=
invisible@smem0.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/d=
rm/i915/kernel/-/issues/6334">i915#6334</a>) +1 other test skip</li>
</ul></li>
<li>
<p>igt@gem_exec_capture@capture-recoverable:</p><ul>
<li>shard-rkl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/Patchwork_169493v3/shard-rkl-6/igt@gem_exec_capture@capture-r=
ecoverable.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i9=
15/kernel/-/issues/14544">i915#14544</a> / <a href=3D"https://gitlab.freede=
sktop.org/drm/i915/kernel/-/issues/6344">i915#6344</a>)</li>
</ul></li>
<li>
<p>igt@gem_exec_reloc@basic-gtt-cpu:</p><ul>
<li>shard-rkl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/Patchwork_169493v3/shard-rkl-2/igt@gem_exec_reloc@basic-gtt-c=
pu.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kerne=
l/-/issues/3281">i915#3281</a>) +5 other tests skip</li>
</ul></li>
<li>
<p>igt@gem_huc_copy@huc-copy:</p><ul>
<li>shard-tglu:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/Patchwork_169493v3/shard-tglu-9/igt@gem_huc_copy@huc-copy.htm=
l">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/is=
sues/2190">i915#2190</a>)</li>
</ul></li>
<li>
<p>igt@gem_lmem_evict@dontneed-evict-race:</p><ul>
<li>shard-tglu-1:       NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/Patchwork_169493v3/shard-tglu-1/igt@gem_lmem_evict@dontneed-e=
vict-race.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i91=
5/kernel/-/issues/4613">i915#4613</a> / <a href=3D"https://gitlab.freedeskt=
op.org/drm/i915/kernel/-/issues/7582">i915#7582</a>)</li>
</ul></li>
<li>
<p>igt@gem_lmem_swapping@heavy-verify-multi-ccs:</p><ul>
<li>shard-tglu-1:       NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/Patchwork_169493v3/shard-tglu-1/igt@gem_lmem_swapping@heavy-v=
erify-multi-ccs.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/d=
rm/i915/kernel/-/issues/4613">i915#4613</a>)</li>
</ul></li>
<li>
<p>igt@gem_lmem_swapping@heavy-verify-random-ccs:</p><ul>
<li>shard-rkl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/Patchwork_169493v3/shard-rkl-5/igt@gem_lmem_swapping@heavy-ve=
rify-random-ccs.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/d=
rm/i915/kernel/-/issues/4613">i915#4613</a>) +4 other tests skip</li>
</ul></li>
<li>
<p>igt@gem_lmem_swapping@massive-random (NEW):</p><ul>
<li>shard-glk:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/Patchwork_169493v3/shard-glk9/igt@gem_lmem_swapping@massive-r=
andom.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/ke=
rnel/-/issues/4613">i915#4613</a>) +1 other test skip</li>
</ul></li>
<li>
<p>igt@gem_mmap_offset@clear-via-pagefault:</p><ul>
<li>shard-mtlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_19006/shard-mtlp-3/igt@gem_mmap_offset@clear-via-pagefault.html">PA=
SS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_=
169493v3/shard-mtlp-2/igt@gem_mmap_offset@clear-via-pagefault.html">TIMEOUT=
</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16=
021">i915#16021</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i915/ke=
rnel/-/issues/16168">i915#16168</a> / <a href=3D"https://gitlab.freedesktop=
.org/drm/i915/kernel/-/issues/16349">i915#16349</a>) +1 other test timeout<=
/li>
</ul></li>
<li>
<p>igt@gem_partial_pwrite_pread@writes-after-reads-uncached:</p><ul>
<li>shard-rkl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/Patchwork_169493v3/shard-rkl-3/igt@gem_partial_pwrite_pread@w=
rites-after-reads-uncached.html">SKIP</a> (<a href=3D"https://gitlab.freede=
sktop.org/drm/i915/kernel/-/issues/3282">i915#3282</a>) +5 other tests skip=
</li>
</ul></li>
<li>
<p>igt@gem_pxp@hw-rejects-pxp-context:</p><ul>
<li>shard-rkl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/Patchwork_169493v3/shard-rkl-2/igt@gem_pxp@hw-rejects-pxp-con=
text.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/ker=
nel/-/issues/13717">i915#13717</a>)</li>
<li>shard-tglu-1:       NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/Patchwork_169493v3/shard-tglu-1/igt@gem_pxp@hw-rejects-pxp-co=
ntext.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/ke=
rnel/-/issues/13398">i915#13398</a>)</li>
</ul></li>
<li>
<p>igt@gem_userptr_blits@coherency-sync:</p><ul>
<li>shard-tglu:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/Patchwork_169493v3/shard-tglu-9/igt@gem_userptr_blits@coheren=
cy-sync.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/=
kernel/-/issues/3297">i915#3297</a>) +1 other test skip</li>
</ul></li>
<li>
<p>igt@gem_userptr_blits@coherency-unsync:</p><ul>
<li>shard-rkl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/Patchwork_169493v3/shard-rkl-2/igt@gem_userptr_blits@coherenc=
y-unsync.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915=
/kernel/-/issues/3297">i915#3297</a>)</li>
<li>shard-tglu-1:       NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/Patchwork_169493v3/shard-tglu-1/igt@gem_userptr_blits@coheren=
cy-unsync.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i91=
5/kernel/-/issues/3297">i915#3297</a>) +1 other test skip</li>
</ul></li>
<li>
<p>igt@gem_userptr_blits@forbidden-operations:</p><ul>
<li>shard-rkl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/Patchwork_169493v3/shard-rkl-3/igt@gem_userptr_blits@forbidde=
n-operations.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/=
i915/kernel/-/issues/3282">i915#3282</a> / <a href=3D"https://gitlab.freede=
sktop.org/drm/i915/kernel/-/issues/3297">i915#3297</a>)</li>
</ul></li>
<li>
<p>igt@gem_userptr_blits@unsync-overlap:</p><ul>
<li>shard-rkl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/Patchwork_169493v3/shard-rkl-6/igt@gem_userptr_blits@unsync-o=
verlap.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/k=
ernel/-/issues/14544">i915#14544</a> / <a href=3D"https://gitlab.freedeskto=
p.org/drm/i915/kernel/-/issues/3297">i915#3297</a>)</li>
</ul></li>
<li>
<p>igt@gem_workarounds@suspend-resume-fd:</p><ul>
<li>shard-glk11:        NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/Patchwork_169493v3/shard-glk11/igt@gem_workarounds@suspend-re=
sume-fd.html">INCOMPLETE</a> (<a href=3D"https://gitlab.freedesktop.org/drm=
/i915/kernel/-/issues/13356">i915#13356</a> / <a href=3D"https://gitlab.fre=
edesktop.org/drm/i915/kernel/-/issues/14586">i915#14586</a>)</li>
</ul></li>
<li>
<p>igt@gen9_exec_parse@batch-without-end:</p><ul>
<li>shard-rkl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/Patchwork_169493v3/shard-rkl-3/igt@gen9_exec_parse@batch-with=
out-end.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/=
kernel/-/issues/2527">i915#2527</a>) +1 other test skip</li>
</ul></li>
<li>
<p>igt@gen9_exec_parse@secure-batches:</p><ul>
<li>shard-tglu-1:       NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/Patchwork_169493v3/shard-tglu-1/igt@gen9_exec_parse@secure-ba=
tches.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/ke=
rnel/-/issues/2527">i915#2527</a> / <a href=3D"https://gitlab.freedesktop.o=
rg/drm/i915/kernel/-/issues/2856">i915#2856</a>) +1 other test skip</li>
</ul></li>
<li>
<p>igt@gen9_exec_parse@unaligned-jump:</p><ul>
<li>shard-tglu:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/Patchwork_169493v3/shard-tglu-9/igt@gen9_exec_parse@unaligned=
-jump.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/ke=
rnel/-/issues/2527">i915#2527</a> / <a href=3D"https://gitlab.freedesktop.o=
rg/drm/i915/kernel/-/issues/2856">i915#2856</a>) +2 other tests skip</li>
</ul></li>
<li>
<p>igt@gpu_buddy@gpu_buddy:</p><ul>
<li>shard-tglu-1:       NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/Patchwork_169493v3/shard-tglu-1/igt@gpu_buddy@gpu_buddy.html"=
>SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issu=
es/15678">i915#15678</a>)</li>
</ul></li>
<li>
<p>igt@i915_pm_freq_api@freq-reset-multiple:</p><ul>
<li>shard-rkl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/Patchwork_169493v3/shard-rkl-7/igt@i915_pm_freq_api@freq-rese=
t-multiple.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i9=
15/kernel/-/issues/8399">i915#8399</a>)</li>
</ul></li>
<li>
<p>igt@i915_pm_freq_api@freq-suspend:</p><ul>
<li>shard-rkl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/Patchwork_169493v3/shard-rkl-6/igt@i915_pm_freq_api@freq-susp=
end.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kern=
el/-/issues/14544">i915#14544</a> / <a href=3D"https://gitlab.freedesktop.o=
rg/drm/i915/kernel/-/issues/8399">i915#8399</a>)</li>
</ul></li>
<li>
<p>igt@i915_pm_rpm@system-suspend-execbuf:</p><ul>
<li>shard-glk:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/Patchwork_169493v3/shard-glk6/igt@i915_pm_rpm@system-suspend-=
execbuf.html">INCOMPLETE</a> (<a href=3D"https://gitlab.freedesktop.org/drm=
/i915/kernel/-/issues/13356">i915#13356</a> / <a href=3D"https://gitlab.fre=
edesktop.org/drm/i915/kernel/-/issues/15172">i915#15172</a>)</li>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_19006/shard-rkl-7/igt@i915_pm_rpm@system-suspend-execbuf.html">PASS=
</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_16=
9493v3/shard-rkl-7/igt@i915_pm_rpm@system-suspend-execbuf.html">INCOMPLETE<=
/a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/133=
56">i915#13356</a>)</li>
</ul></li>
<li>
<p>igt@i915_pm_sseu@full-enable:</p><ul>
<li>shard-rkl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/Patchwork_169493v3/shard-rkl-6/igt@i915_pm_sseu@full-enable.h=
tml">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/=
issues/14544">i915#14544</a> / <a href=3D"https://gitlab.freedesktop.org/dr=
m/i915/kernel/-/issues/4387">i915#4387</a>)</li>
</ul></li>
<li>
<p>igt@i915_query@query-topology-unsupported:</p><ul>
<li>shard-rkl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/Patchwork_169493v3/shard-rkl-5/igt@i915_query@query-topology-=
unsupported.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i=
915/kernel/-/issues/16079">i915#16079</a>)</li>
</ul></li>
<li>
<p>igt@intel_hwmon@hwmon-read:</p><ul>
<li>shard-rkl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/Patchwork_169493v3/shard-rkl-2/igt@intel_hwmon@hwmon-read.htm=
l">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/is=
sues/7707">i915#7707</a>)</li>
<li>shard-tglu-1:       NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/Patchwork_169493v3/shard-tglu-1/igt@intel_hwmon@hwmon-read.ht=
ml">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/i=
ssues/7707">i915#7707</a>) +1 other test skip</li>
</ul></li>
<li>
<p>igt@kms_async_flips@alternate-sync-async-flip-atomic@pipe-a-hdmi-a-1:</p=
><ul>
<li>shard-glk:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_19006/shard-glk1/igt@kms_async_flips@alternate-sync-async-flip-atom=
ic@pipe-a-hdmi-a-1.html">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.=
org/tree/drm-tip/Patchwork_169493v3/shard-glk3/igt@kms_async_flips@alternat=
e-sync-async-flip-atomic@pipe-a-hdmi-a-1.html">FAIL</a> (<a href=3D"https:/=
/gitlab.freedesktop.org/drm/i915/kernel/-/issues/14888">i915#14888</a>) +4 =
other tests fail</li>
</ul></li>
<li>
<p>igt@kms_atomic_transition@plane-all-modeset-transition-fencing-internal-=
panels:</p><ul>
<li>shard-tglu-1:       NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/Patchwork_169493v3/shard-tglu-1/igt@kms_atomic_transition@pla=
ne-all-modeset-transition-fencing-internal-panels.html">SKIP</a> (<a href=
=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/1769">i915#1769=
</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3=
555">i915#3555</a>)</li>
</ul></li>
<li>
<p>igt@kms_big_fb@4-tiled-32bpp-rotate-0:</p><ul>
<li>shard-tglu-1:       NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/Patchwork_169493v3/shard-tglu-1/igt@kms_big_fb@4-tiled-32bpp-=
rotate-0.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915=
/kernel/-/issues/5286">i915#5286</a>) +3 other tests skip</li>
</ul></li>
<li>
<p>igt@kms_big_fb@4-tiled-8bpp-rotate-0:</p><ul>
<li>shard-tglu:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/Patchwork_169493v3/shard-tglu-9/igt@kms_big_fb@4-tiled-8bpp-r=
otate-0.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/=
kernel/-/issues/5286">i915#5286</a>) +1 other test skip</li>
</ul></li>
<li>
<p>igt@kms_big_fb@4-tiled-addfb-size-offset-overflow:</p><ul>
<li>shard-rkl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/Patchwork_169493v3/shard-rkl-6/igt@kms_big_fb@4-tiled-addfb-s=
ize-offset-overflow.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.o=
rg/drm/i915/kernel/-/issues/14544">i915#14544</a> / <a href=3D"https://gitl=
ab.freedesktop.org/drm/i915/kernel/-/issues/5286">i915#5286</a>)</li>
</ul></li>
<li>
<p>igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-180:</p><ul>
<li>shard-rkl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/Patchwork_169493v3/shard-rkl-8/igt@kms_big_fb@4-tiled-max-hw-=
stride-64bpp-rotate-180.html">SKIP</a> (<a href=3D"https://gitlab.freedeskt=
op.org/drm/i915/kernel/-/issues/5286">i915#5286</a>) +4 other tests skip</l=
i>
</ul></li>
<li>
<p>igt@kms_big_fb@linear-max-hw-stride-32bpp-rotate-180:</p><ul>
<li>shard-dg1:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_19006/shard-dg1-16/igt@kms_big_fb@linear-max-hw-stride-32bpp-rotate=
-180.html">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-t=
ip/Patchwork_169493v3/shard-dg1-12/igt@kms_big_fb@linear-max-hw-stride-32bp=
p-rotate-180.html">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/=
i915/kernel/-/issues/5138">i915#5138</a>)</li>
</ul></li>
<li>
<p>igt@kms_big_fb@linear-max-hw-stride-64bpp-rotate-180-hflip:</p><ul>
<li>shard-tglu-1:       NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/Patchwork_169493v3/shard-tglu-1/igt@kms_big_fb@linear-max-hw-=
stride-64bpp-rotate-180-hflip.html">SKIP</a> (<a href=3D"https://gitlab.fre=
edesktop.org/drm/i915/kernel/-/issues/3828">i915#3828</a>)</li>
</ul></li>
<li>
<p>igt@kms_big_fb@y-tiled-8bpp-rotate-270:</p><ul>
<li>shard-rkl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/Patchwork_169493v3/shard-rkl-3/igt@kms_big_fb@y-tiled-8bpp-ro=
tate-270.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915=
/kernel/-/issues/3638">i915#3638</a>) +1 other test skip</li>
</ul></li>
<li>
<p>igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-180:</p><ul>
<li>shard-rkl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/Patchwork_169493v3/shard-rkl-7/igt@kms_big_fb@yf-tiled-max-hw=
-stride-32bpp-rotate-180.html">SKIP</a> +79 other tests skip</li>
</ul></li>
<li>
<p>igt@kms_ccs@bad-aux-stride-4-tiled-mtl-mc-ccs@pipe-a-hdmi-a-4:</p><ul>
<li>shard-dg1:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/Patchwork_169493v3/shard-dg1-16/igt@kms_ccs@bad-aux-stride-4-=
tiled-mtl-mc-ccs@pipe-a-hdmi-a-4.html">SKIP</a> (<a href=3D"https://gitlab.=
freedesktop.org/drm/i915/kernel/-/issues/6095">i915#6095</a>) +207 other te=
sts skip</li>
</ul></li>
<li>
<p>igt@kms_ccs@ccs-on-another-bo-y-tiled-gen12-mc-ccs@pipe-b-hdmi-a-1:</p><=
ul>
<li>shard-tglu:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/Patchwork_169493v3/shard-tglu-9/igt@kms_ccs@ccs-on-another-bo=
-y-tiled-gen12-mc-ccs@pipe-b-hdmi-a-1.html">SKIP</a> (<a href=3D"https://gi=
tlab.freedesktop.org/drm/i915/kernel/-/issues/6095">i915#6095</a>) +24 othe=
r tests skip</li>
</ul></li>
<li>
<p>igt@kms_ccs@crc-primary-basic-4-tiled-bmg-ccs:</p><ul>
<li>shard-rkl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/Patchwork_169493v3/shard-rkl-3/igt@kms_ccs@crc-primary-basic-=
4-tiled-bmg-ccs.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/d=
rm/i915/kernel/-/issues/12313">i915#12313</a>)</li>
</ul></li>
<li>
<p>igt@kms_ccs@crc-primary-basic-y-tiled-ccs:</p><ul>
<li>shard-tglu-1:       NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/Patchwork_169493v3/shard-tglu-1/igt@kms_ccs@crc-primary-basic=
-y-tiled-ccs.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/=
i915/kernel/-/issues/6095">i915#6095</a>) +59 other tests skip</li>
</ul></li>
<li>
<p>igt@kms_ccs@crc-primary-basic-y-tiled-gen12-rc-ccs@pipe-d-hdmi-a-1:</p><=
ul>
<li>shard-dg2:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/Patchwork_169493v3/shard-dg2-4/igt@kms_ccs@crc-primary-basic-=
y-tiled-gen12-rc-ccs@pipe-d-hdmi-a-1.html">SKIP</a> (<a href=3D"https://git=
lab.freedesktop.org/drm/i915/kernel/-/issues/10307">i915#10307</a> / <a hre=
f=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/10434">i915#10=
434</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issue=
s/6095">i915#6095</a>) +1 other test skip</li>
</ul></li>
<li>
<p>igt@kms_ccs@crc-primary-rotation-180-4-tiled-lnl-ccs:</p><ul>
<li>shard-tglu-1:       NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/Patchwork_169493v3/shard-tglu-1/igt@kms_ccs@crc-primary-rotat=
ion-180-4-tiled-lnl-ccs.html">SKIP</a> (<a href=3D"https://gitlab.freedeskt=
op.org/drm/i915/kernel/-/issues/12313">i915#12313</a>)</li>
</ul></li>
<li>
<p>igt@kms_ccs@crc-primary-suspend-4-tiled-mtl-rc-ccs@pipe-c-hdmi-a-1:</p><=
ul>
<li>shard-dg2:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/Patchwork_169493v3/shard-dg2-4/igt@kms_ccs@crc-primary-suspen=
d-4-tiled-mtl-rc-ccs@pipe-c-hdmi-a-1.html">SKIP</a> (<a href=3D"https://git=
lab.freedesktop.org/drm/i915/kernel/-/issues/6095">i915#6095</a>) +15 other=
 tests skip</li>
</ul></li>
<li>
<p>igt@kms_ccs@crc-primary-suspend-y-tiled-ccs:</p><ul>
<li>shard-glk10:        NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/Patchwork_169493v3/shard-glk10/igt@kms_ccs@crc-primary-suspen=
d-y-tiled-ccs.html">INCOMPLETE</a> (<a href=3D"https://gitlab.freedesktop.o=
rg/drm/i915/kernel/-/issues/15582">i915#15582</a>) +1 other test incomplete=
</li>
</ul></li>
<li>
<p>igt@kms_ccs@crc-sprite-planes-basic-4-tiled-dg2-rc-ccs@pipe-b-hdmi-a-2:<=
/p><ul>
<li>shard-rkl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/Patchwork_169493v3/shard-rkl-3/igt@kms_ccs@crc-sprite-planes-=
basic-4-tiled-dg2-rc-ccs@pipe-b-hdmi-a-2.html">SKIP</a> (<a href=3D"https:/=
/gitlab.freedesktop.org/drm/i915/kernel/-/issues/6095">i915#6095</a>) +54 o=
ther tests skip</li>
</ul></li>
<li>
<p>igt@kms_ccs@crc-sprite-planes-basic-4-tiled-lnl-ccs:</p><ul>
<li>shard-tglu:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/Patchwork_169493v3/shard-tglu-9/igt@kms_ccs@crc-sprite-planes=
-basic-4-tiled-lnl-ccs.html">SKIP</a> (<a href=3D"https://gitlab.freedeskto=
p.org/drm/i915/kernel/-/issues/12313">i915#12313</a>)</li>
</ul></li>
<li>
<p>igt@kms_ccs@crc-sprite-planes-basic-y-tiled-ccs@pipe-c-hdmi-a-1:</p><ul>
<li>shard-rkl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/Patchwork_169493v3/shard-rkl-2/igt@kms_ccs@crc-sprite-planes-=
basic-y-tiled-ccs@pipe-c-hdmi-a-1.html">SKIP</a> (<a href=3D"https://gitlab=
.freedesktop.org/drm/i915/kernel/-/issues/14098">i915#14098</a> / <a href=
=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6095">i915#6095=
</a>) +36 other tests skip</li>
</ul></li>
<li>
<p>igt@kms_ccs@missing-ccs-buffer-4-tiled-mtl-mc-ccs@pipe-b-hdmi-a-1:</p><u=
l>
<li>shard-dg2:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/Patchwork_169493v3/shard-dg2-4/igt@kms_ccs@missing-ccs-buffer=
-4-tiled-mtl-mc-ccs@pipe-b-hdmi-a-1.html">SKIP</a> (<a href=3D"https://gitl=
ab.freedesktop.org/drm/i915/kernel/-/issues/10307">i915#10307</a> / <a href=
=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6095">i915#6095=
</a>) +73 other tests skip</li>
</ul></li>
<li>
<p>igt@kms_ccs@random-ccs-data-4-tiled-dg2-mc-ccs@pipe-c-hdmi-a-2:</p><ul>
<li>shard-rkl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/Patchwork_169493v3/shard-rkl-6/igt@kms_ccs@random-ccs-data-4-=
tiled-dg2-mc-ccs@pipe-c-hdmi-a-2.html">SKIP</a> (<a href=3D"https://gitlab.=
freedesktop.org/drm/i915/kernel/-/issues/14098">i915#14098</a> / <a href=3D=
"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14544<=
/a> / <a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/60=
95">i915#6095</a>) +9 other tests skip</li>
</ul></li>
<li>
<p>igt@kms_ccs@random-ccs-data-4-tiled-mtl-rc-ccs@pipe-b-hdmi-a-2:</p><ul>
<li>shard-rkl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/Patchwork_169493v3/shard-rkl-6/igt@kms_ccs@random-ccs-data-4-=
tiled-mtl-rc-ccs@pipe-b-hdmi-a-2.html">SKIP</a> (<a href=3D"https://gitlab.=
freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a> / <a href=3D=
"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6095">i915#6095</a=
>) +12 other tests skip</li>
</ul></li>
<li>
<p>igt@kms_chamelium_audio@dp-audio-after-suspend:</p><ul>
<li>shard-tglu:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/Patchwork_169493v3/shard-tglu-9/igt@kms_chamelium_audio@dp-au=
dio-after-suspend.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org=
/drm/i915/kernel/-/issues/11151">i915#11151</a>)</li>
</ul></li>
<li>
<p>igt@kms_chamelium_audio@hdmi-audio-after-suspend:</p><ul>
<li>shard-rkl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/Patchwork_169493v3/shard-rkl-2/igt@kms_chamelium_audio@hdmi-a=
udio-after-suspend.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.or=
g/drm/i915/kernel/-/issues/11151">i915#11151</a>)</li>
<li>shard-tglu-1:       NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/Patchwork_169493v3/shard-tglu-1/igt@kms_chamelium_audio@hdmi-=
audio-after-suspend.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.o=
rg/drm/i915/kernel/-/issues/11151">i915#11151</a>)</li>
</ul></li>
<li>
<p>igt@kms_chamelium_color_pipeline@plane-lut1d-pre-ctm3x4:</p><ul>
<li>shard-tglu:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/Patchwork_169493v3/shard-tglu-9/igt@kms_chamelium_color_pipel=
ine@plane-lut1d-pre-ctm3x4.html">SKIP</a> (<a href=3D"https://gitlab.freede=
sktop.org/drm/i915/kernel/-/issues/16471">i915#16471</a>)</li>
</ul></li>
<li>
<p>igt@kms_chamelium_edid@hdmi-edid-read:</p><ul>
<li>shard-rkl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/Patchwork_169493v3/shard-rkl-8/igt@kms_chamelium_edid@hdmi-ed=
id-read.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/=
kernel/-/issues/11151">i915#11151</a> / <a href=3D"https://gitlab.freedeskt=
op.org/drm/i915/kernel/-/issues/7828">i915#7828</a>) +8 other tests skip</l=
i>
</ul></li>
<li>
<p>igt@kms_chamelium_edid@vga-edid-read:</p><ul>
<li>shard-tglu:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/Patchwork_169493v3/shard-tglu-9/igt@kms_chamelium_edid@vga-ed=
id-read.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/=
kernel/-/issues/11151">i915#11151</a> / <a href=3D"https://gitlab.freedeskt=
op.org/drm/i915/kernel/-/issues/7828">i915#7828</a>) +2 other tests skip</l=
i>
</ul></li>
<li>
<p>igt@kms_chamelium_frames@dp-crc-single:</p><ul>
<li>shard-tglu-1:       NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/Patchwork_169493v3/shard-tglu-1/igt@kms_chamelium_frames@dp-c=
rc-single.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i91=
5/kernel/-/issues/11151">i915#11151</a> / <a href=3D"https://gitlab.freedes=
ktop.org/drm/i915/kernel/-/issues/7828">i915#7828</a>) +2 other tests skip<=
/li>
</ul></li>
<li>
<p>igt@kms_chamelium_frames@hdmi-cmp-planar-formats:</p><ul>
<li>shard-rkl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/Patchwork_169493v3/shard-rkl-6/igt@kms_chamelium_frames@hdmi-=
cmp-planar-formats.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.or=
g/drm/i915/kernel/-/issues/11151">i915#11151</a> / <a href=3D"https://gitla=
b.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a> / <a href=
=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/7828">i915#7828=
</a>)</li>
</ul></li>
<li>
<p>igt@kms_content_protection@atomic:</p><ul>
<li>shard-rkl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/Patchwork_169493v3/shard-rkl-3/igt@kms_content_protection@ato=
mic.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kern=
el/-/issues/15865">i915#15865</a>) +1 other test skip</li>
</ul></li>
<li>
<p>igt@kms_content_protection@atomic-dpms:</p><ul>
<li>shard-tglu-1:       NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/Patchwork_169493v3/shard-tglu-1/igt@kms_content_protection@at=
omic-dpms.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i91=
5/kernel/-/issues/15865">i915#15865</a>) +1 other test skip</li>
</ul></li>
<li>
<p>igt@kms_content_protection@dp-mst-type-0-suspend-resume:</p><ul>
<li>shard-tglu:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/Patchwork_169493v3/shard-tglu-9/igt@kms_content_protection@dp=
-mst-type-0-suspend-resume.html">SKIP</a> (<a href=3D"https://gitlab.freede=
sktop.org/drm/i915/kernel/-/issues/15330">i915#15330</a>)</li>
</ul></li>
<li>
<p>igt@kms_content_protection@dp-mst-type-1:</p><ul>
<li>shard-rkl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/Patchwork_169493v3/shard-rkl-2/igt@kms_content_protection@dp-=
mst-type-1.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i9=
15/kernel/-/issues/15330">i915#15330</a> / <a href=3D"https://gitlab.freede=
sktop.org/drm/i915/kernel/-/issues/3116">i915#3116</a>) +1 other test skip<=
/li>
<li>shard-tglu-1:       NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/Patchwork_169493v3/shard-tglu-1/igt@kms_content_protection@dp=
-mst-type-1.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i=
915/kernel/-/issues/15330">i915#15330</a> / <a href=3D"https://gitlab.freed=
esktop.org/drm/i915/kernel/-/issues/3116">i915#3116</a> / <a href=3D"https:=
//gitlab.freedesktop.org/drm/i915/kernel/-/issues/3299">i915#3299</a>)</li>
</ul></li>
<li>
<p>igt@kms_content_protection@srm:</p><ul>
<li>shard-tglu:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/Patchwork_169493v3/shard-tglu-9/igt@kms_content_protection@sr=
m.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel=
/-/issues/15865">i915#15865</a>) +1 other test skip</li>
</ul></li>
<li>
<p>igt@kms_cursor_crc@cursor-random-32x10:</p><ul>
<li>shard-rkl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/Patchwork_169493v3/shard-rkl-8/igt@kms_cursor_crc@cursor-rand=
om-32x10.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915=
/kernel/-/issues/3555">i915#3555</a>) +2 other tests skip</li>
</ul></li>
<li>
<p>igt@kms_cursor_crc@cursor-random-512x512:</p><ul>
<li>shard-tglu:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/Patchwork_169493v3/shard-tglu-9/igt@kms_cursor_crc@cursor-ran=
dom-512x512.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i=
915/kernel/-/issues/13049">i915#13049</a>)</li>
</ul></li>
<li>
<p>igt@kms_cursor_crc@cursor-rapid-movement-512x170:</p><ul>
<li>shard-rkl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/Patchwork_169493v3/shard-rkl-2/igt@kms_cursor_crc@cursor-rapi=
d-movement-512x170.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.or=
g/drm/i915/kernel/-/issues/13049">i915#13049</a>) +1 other test skip</li>
<li>shard-tglu-1:       NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/Patchwork_169493v3/shard-tglu-1/igt@kms_cursor_crc@cursor-rap=
id-movement-512x170.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.o=
rg/drm/i915/kernel/-/issues/13049">i915#13049</a>)</li>
</ul></li>
<li>
<p>igt@kms_cursor_crc@cursor-sliding-32x10:</p><ul>
<li>shard-tglu-1:       NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/Patchwork_169493v3/shard-tglu-1/igt@kms_cursor_crc@cursor-sli=
ding-32x10.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i9=
15/kernel/-/issues/3555">i915#3555</a>) +3 other tests skip</li>
</ul></li>
<li>
<p>igt@kms_cursor_legacy@flip-vs-cursor-atomic-transitions:</p><ul>
<li>shard-glk:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/Patchwork_169493v3/shard-glk2/igt@kms_cursor_legacy@flip-vs-c=
ursor-atomic-transitions.html">FAIL</a> (<a href=3D"https://gitlab.freedesk=
top.org/drm/i915/kernel/-/issues/15804">i915#15804</a>)</li>
</ul></li>
<li>
<p>igt@kms_cursor_legacy@modeset-atomic-cursor-hotspot:</p><ul>
<li>shard-tglu:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/Patchwork_169493v3/shard-tglu-9/igt@kms_cursor_legacy@modeset=
-atomic-cursor-hotspot.html">SKIP</a> (<a href=3D"https://gitlab.freedeskto=
p.org/drm/i915/kernel/-/issues/9067">i915#9067</a>)</li>
</ul></li>
<li>
<p>igt@kms_cursor_legacy@short-busy-flip-before-cursor-toggle:</p><ul>
<li>shard-rkl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/Patchwork_169493v3/shard-rkl-6/igt@kms_cursor_legacy@short-bu=
sy-flip-before-cursor-toggle.html">SKIP</a> (<a href=3D"https://gitlab.free=
desktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a> / <a href=3D"htt=
ps://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4103">i915#4103</a>)</=
li>
</ul></li>
<li>
<p>igt@kms_dp_link_training@non-uhbr-mst:</p><ul>
<li>shard-tglu:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/Patchwork_169493v3/shard-tglu-9/igt@kms_dp_link_training@non-=
uhbr-mst.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915=
/kernel/-/issues/13749">i915#13749</a>)</li>
</ul></li>
<li>
<p>igt@kms_dp_linktrain_fallback@dp-fallback:</p><ul>
<li>shard-tglu:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/Patchwork_169493v3/shard-tglu-9/igt@kms_dp_linktrain_fallback=
@dp-fallback.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/=
i915/kernel/-/issues/13707">i915#13707</a>)</li>
</ul></li>
<li>
<p>igt@kms_dsc@dsc-basic:</p><ul>
<li>shard-tglu-1:       NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/Patchwork_169493v3/shard-tglu-1/igt@kms_dsc@dsc-basic.html">S=
KIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues=
/16361">i915#16361</a>) +2 other tests skip</li>
</ul></li>
<li>
<p>igt@kms_dsc@dsc-basic-bigjoiner:</p><ul>
<li>shard-rkl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/Patchwork_169493v3/shard-rkl-2/igt@kms_dsc@dsc-basic-bigjoine=
r.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel=
/-/issues/16361">i915#16361</a>) +2 other tests skip</li>
</ul></li>
<li>
<p>igt@kms_dsc@dsc-with-output-formats:</p><ul>
<li>shard-rkl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/Patchwork_169493v3/shard-rkl-6/igt@kms_dsc@dsc-with-output-fo=
rmats.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/ke=
rnel/-/issues/14544">i915#14544</a> / <a href=3D"https://gitlab.freedesktop=
.org/drm/i915/kernel/-/issues/16361">i915#16361</a>)</li>
</ul></li>
<li>
<p>igt@kms_fbcon_fbt@psr-suspend:</p><ul>
<li>shard-tglu:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/Patchwork_169493v3/shard-tglu-9/igt@kms_fbcon_fbt@psr-suspend=
.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/=
-/issues/16680">i915#16680</a>)</li>
</ul></li>
<li>
<p>igt@kms_feature_discovery@chamelium:</p><ul>
<li>shard-rkl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/Patchwork_169493v3/shard-rkl-3/igt@kms_feature_discovery@cham=
elium.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/ke=
rnel/-/issues/16084">i915#16084</a>)</li>
</ul></li>
<li>
<p>igt@kms_feature_discovery@display-2x:</p><ul>
<li>shard-tglu:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/Patchwork_169493v3/shard-tglu-9/igt@kms_feature_discovery@dis=
play-2x.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/=
kernel/-/issues/16081">i915#16081</a>)</li>
</ul></li>
<li>
<p>igt@kms_feature_discovery@display-4x:</p><ul>
<li>shard-rkl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/Patchwork_169493v3/shard-rkl-3/igt@kms_feature_discovery@disp=
lay-4x.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/k=
ernel/-/issues/16081">i915#16081</a>)</li>
</ul></li>
<li>
<p>igt@kms_feature_discovery@dsc:</p><ul>
<li>shard-rkl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/Patchwork_169493v3/shard-rkl-5/igt@kms_feature_discovery@dsc.=
html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-=
/issues/16600">i915#16600</a>)</li>
</ul></li>
<li>
<p>igt@kms_feature_discovery@hdr:</p><ul>
<li>shard-tglu-1:       NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/Patchwork_169493v3/shard-tglu-1/igt@kms_feature_discovery@hdr=
.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/=
-/issues/16600">i915#16600</a>)</li>
</ul></li>
<li>
<p>igt@kms_flip@2x-flip-vs-modeset:</p><ul>
<li>shard-rkl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/Patchwork_169493v3/shard-rkl-6/igt@kms_flip@2x-flip-vs-modese=
t.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel=
/-/issues/14544">i915#14544</a> / <a href=3D"https://gitlab.freedesktop.org=
/drm/i915/kernel/-/issues/9934">i915#9934</a>) +1 other test skip</li>
</ul></li>
<li>
<p>igt@kms_flip@2x-flip-vs-panning-vs-hang:</p><ul>
<li>shard-tglu-1:       NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/Patchwork_169493v3/shard-tglu-1/igt@kms_flip@2x-flip-vs-panni=
ng-vs-hang.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i9=
15/kernel/-/issues/3637">i915#3637</a> / <a href=3D"https://gitlab.freedesk=
top.org/drm/i915/kernel/-/issues/9934">i915#9934</a>) +4 other tests skip</=
li>
</ul></li>
<li>
<p>igt@kms_flip@2x-flip-vs-suspend:</p><ul>
<li>shard-rkl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/Patchwork_169493v3/shard-rkl-5/igt@kms_flip@2x-flip-vs-suspen=
d.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel=
/-/issues/9934">i915#9934</a>)</li>
</ul></li>
<li>
<p>igt@kms_flip@2x-nonexisting-fb:</p><ul>
<li>shard-tglu:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/Patchwork_169493v3/shard-tglu-9/igt@kms_flip@2x-nonexisting-f=
b.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel=
/-/issues/3637">i915#3637</a> / <a href=3D"https://gitlab.freedesktop.org/d=
rm/i915/kernel/-/issues/9934">i915#9934</a>) +2 other tests skip</li>
</ul></li>
<li>
<p>igt@kms_flip@flip-vs-expired-vblank:</p><ul>
<li>shard-glk:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_19006/shard-glk1/igt@kms_flip@flip-vs-expired-vblank.html">PASS</a>=
 -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_169493=
v3/shard-glk2/igt@kms_flip@flip-vs-expired-vblank.html">FAIL</a> (<a href=
=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13027">i915#130=
27</a>) +1 other test fail</li>
</ul></li>
<li>
<p>igt@kms_flip@flip-vs-suspend:</p><ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_19006/shard-rkl-2/igt@kms_flip@flip-vs-suspend.html">PASS</a> -&gt;=
 <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_169493v3/sha=
rd-rkl-3/igt@kms_flip@flip-vs-suspend.html">INCOMPLETE</a> (<a href=3D"http=
s://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16276">i915#16276</a> /=
 <a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6113">i=
915#6113</a>)</li>
</ul></li>
<li>
<p>igt@kms_flip@flip-vs-suspend@a-hdmi-a2:</p><ul>
<li>shard-rkl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/Patchwork_169493v3/shard-rkl-3/igt@kms_flip@flip-vs-suspend@a=
-hdmi-a2.html">INCOMPLETE</a> (<a href=3D"https://gitlab.freedesktop.org/dr=
m/i915/kernel/-/issues/16276">i915#16276</a> / <a href=3D"https://gitlab.fr=
eedesktop.org/drm/i915/kernel/-/issues/6113">i915#6113</a>)</li>
</ul></li>
<li>
<p>igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-32bpp-4tile-upscaling:</p><u=
l>
<li>shard-tglu:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/Patchwork_169493v3/shard-tglu-9/igt@kms_flip_scaled_crc@flip-=
64bpp-4tile-to-32bpp-4tile-upscaling.html">SKIP</a> (<a href=3D"https://git=
lab.freedesktop.org/drm/i915/kernel/-/issues/15643">i915#15643</a>) +1 othe=
r test skip</li>
</ul></li>
<li>
<p>igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-32bpp-yftile-upscaling:</p>=
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/Patchwork_169493v3/shard-rkl-2/igt@kms_flip_scaled_crc@flip-6=
4bpp-yftile-to-32bpp-yftile-upscaling.html">SKIP</a> (<a href=3D"https://gi=
tlab.freedesktop.org/drm/i915/kernel/-/issues/15643">i915#15643</a>) +3 oth=
er tests skip</li>
<li>shard-tglu-1:       NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/Patchwork_169493v3/shard-tglu-1/igt@kms_flip_scaled_crc@flip-=
64bpp-yftile-to-32bpp-yftile-upscaling.html">SKIP</a> (<a href=3D"https://g=
itlab.freedesktop.org/drm/i915/kernel/-/issues/15643">i915#15643</a>) +2 ot=
her tests skip</li>
</ul></li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-2p-primscrn-pri-shrfb-draw-mmap-cpu:</p=
><ul>
<li>shard-tglu-1:       NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/Patchwork_169493v3/shard-tglu-1/igt@kms_frontbuffer_tracking@=
fbc-2p-primscrn-pri-shrfb-draw-mmap-cpu.html">SKIP</a> +76 other tests skip=
</li>
</ul></li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-pri-shrfb-draw-mmap-gtt:</p=
><ul>
<li>shard-rkl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/Patchwork_169493v3/shard-rkl-5/igt@kms_frontbuffer_tracking@f=
bc-2p-scndscrn-pri-shrfb-draw-mmap-gtt.html">SKIP</a> (<a href=3D"https://g=
itlab.freedesktop.org/drm/i915/kernel/-/issues/1825">i915#1825</a>) +12 oth=
er tests skip</li>
</ul></li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-suspend:</p><ul>
<li>shard-glk:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/Patchwork_169493v3/shard-glk4/igt@kms_frontbuffer_tracking@fb=
c-suspend.html">INCOMPLETE</a> (<a href=3D"https://gitlab.freedesktop.org/d=
rm/i915/kernel/-/issues/10056">i915#10056</a> / <a href=3D"https://gitlab.f=
reedesktop.org/drm/i915/kernel/-/issues/16593">i915#16593</a>)</li>
</ul></li>
<li>
<p>igt@kms_frontbuffer_tracking@fbchdr-2p-primscrn-cur-indfb-draw-pwrite:</=
p><ul>
<li>shard-rkl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/Patchwork_169493v3/shard-rkl-6/igt@kms_frontbuffer_tracking@f=
bchdr-2p-primscrn-cur-indfb-draw-pwrite.html">SKIP</a> (<a href=3D"https://=
gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a>) +19 =
other tests skip</li>
</ul></li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-rgb565-draw-mmap-wc:</p><ul>
<li>shard-tglu-1:       NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/Patchwork_169493v3/shard-tglu-1/igt@kms_frontbuffer_tracking@=
fbcpsr-rgb565-draw-mmap-wc.html">SKIP</a> (<a href=3D"https://gitlab.freede=
sktop.org/drm/i915/kernel/-/issues/15102">i915#15102</a>) +26 other tests s=
kip</li>
</ul></li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsrhdr-1p-primscrn-pri-indfb-draw-render=
:</p><ul>
<li>shard-snb:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/Patchwork_169493v3/shard-snb6/igt@kms_frontbuffer_tracking@fb=
cpsrhdr-1p-primscrn-pri-indfb-draw-render.html">SKIP</a> +10 other tests sk=
ip</li>
</ul></li>
<li>
<p>igt@kms_frontbuffer_tracking@hdr-1p-offscreen-pri-indfb-draw-blt:</p><ul=
>
<li>shard-tglu-1:       NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/Patchwork_169493v3/shard-tglu-1/igt@kms_frontbuffer_tracking@=
hdr-1p-offscreen-pri-indfb-draw-blt.html">SKIP</a> (<a href=3D"https://gitl=
ab.freedesktop.org/drm/i915/kernel/-/issues/15989">i915#15989</a>) +17 othe=
r tests skip</li>
</ul></li>
<li>
<p>igt@kms_frontbuffer_tracking@hdr-1p-offscreen-pri-indfb-draw-mmap-gtt:</=
p><ul>
<li>shard-tglu:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/Patchwork_169493v3/shard-tglu-9/igt@kms_frontbuffer_tracking@=
hdr-1p-offscreen-pri-indfb-draw-mmap-gtt.html">SKIP</a> (<a href=3D"https:/=
/gitlab.freedesktop.org/drm/i915/kernel/-/issues/15989">i915#15989</a>) +7 =
other tests skip</li>
</ul></li>
<li>
<p>igt@kms_frontbuffer_tracking@hdr-1p-primscrn-cur-indfb-move:</p><ul>
<li>shard-glk:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_19006/shard-glk8/igt@kms_frontbuffer_tracking@hdr-1p-primscrn-cur-i=
ndfb-move.html">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/=
drm-tip/Patchwork_169493v3/shard-glk6/igt@kms_frontbuffer_tracking@hdr-1p-p=
rimscrn-cur-indfb-move.html">SKIP</a> +12 other tests skip</li>
</ul></li>
<li>
<p>igt@kms_frontbuffer_tracking@hdr-1p-primscrn-pri-shrfb-draw-mmap-cpu:</p=
><ul>
<li>shard-rkl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/Patchwork_169493v3/shard-rkl-2/igt@kms_frontbuffer_tracking@h=
dr-1p-primscrn-pri-shrfb-draw-mmap-cpu.html">SKIP</a> (<a href=3D"https://g=
itlab.freedesktop.org/drm/i915/kernel/-/issues/15989">i915#15989</a>) +18 o=
ther tests skip</li>
</ul></li>
<li>
<p>igt@kms_frontbuffer_tracking@hdr-rgb101010-draw-pwrite:</p><ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_19006/shard-rkl-6/igt@kms_frontbuffer_tracking@hdr-rgb101010-draw-p=
write.html">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-=
tip/Patchwork_169493v3/shard-rkl-4/igt@kms_frontbuffer_tracking@hdr-rgb1010=
10-draw-pwrite.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/dr=
m/i915/kernel/-/issues/15989">i915#15989</a>) +7 other tests skip</li>
</ul></li>
<li>
<p>igt@kms_frontbuffer_tracking@hdr-suspend:</p><ul>
<li>shard-rkl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/Patchwork_169493v3/shard-rkl-6/igt@kms_frontbuffer_tracking@h=
dr-suspend.html">INCOMPLETE</a> (<a href=3D"https://gitlab.freedesktop.org/=
drm/i915/kernel/-/issues/16056">i915#16056</a>)</li>
</ul></li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-1p-offscreen-pri-shrfb-draw-blt:</p><ul=
>
<li>shard-tglu:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/Patchwork_169493v3/shard-tglu-9/igt@kms_frontbuffer_tracking@=
psr-1p-offscreen-pri-shrfb-draw-blt.html">SKIP</a> (<a href=3D"https://gitl=
ab.freedesktop.org/drm/i915/kernel/-/issues/15102">i915#15102</a>) +21 othe=
r tests skip</li>
</ul></li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-1p-primscrn-pri-shrfb-draw-mmap-gtt:</p=
><ul>
<li>shard-rkl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/Patchwork_169493v3/shard-rkl-6/igt@kms_frontbuffer_tracking@p=
sr-1p-primscrn-pri-shrfb-draw-mmap-gtt.html">SKIP</a> (<a href=3D"https://g=
itlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a> / <a h=
ref=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15102">i915#=
15102</a>) +7 other tests skip</li>
</ul></li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-2p-scndscrn-pri-shrfb-draw-mmap-wc:</p>=
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/Patchwork_169493v3/shard-tglu-9/igt@kms_frontbuffer_tracking@=
psr-2p-scndscrn-pri-shrfb-draw-mmap-wc.html">SKIP</a> +51 other tests skip<=
/li>
</ul></li>
<li>
<p>igt@kms_frontbuffer_tracking@psrhdr-1p-primscrn-spr-indfb-move:</p><ul>
<li>shard-rkl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/Patchwork_169493v3/shard-rkl-3/igt@kms_frontbuffer_tracking@p=
srhdr-1p-primscrn-spr-indfb-move.html">SKIP</a> (<a href=3D"https://gitlab.=
freedesktop.org/drm/i915/kernel/-/issues/15102">i915#15102</a>) +38 other t=
ests skip</li>
</ul></li>
<li>
<p>igt@kms_frontbuffer_tracking@psrhdr-2p-scndscrn-pri-shrfb-draw-pwrite:</=
p><ul>
<li>shard-glk10:        NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/Patchwork_169493v3/shard-glk10/igt@kms_frontbuffer_tracking@p=
srhdr-2p-scndscrn-pri-shrfb-draw-pwrite.html">SKIP</a> +170 other tests ski=
p</li>
</ul></li>
<li>
<p>igt@kms_hdr@bpc-switch-dpms:</p><ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_19006/shard-rkl-6/igt@kms_hdr@bpc-switch-dpms.html">PASS</a> -&gt; =
<a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_169493v3/shar=
d-rkl-8/igt@kms_hdr@bpc-switch-dpms.html">SKIP</a> (<a href=3D"https://gitl=
ab.freedesktop.org/drm/i915/kernel/-/issues/16644">i915#16644</a> / <a href=
=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3555">i915#3555=
</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8=
228">i915#8228</a>)</li>
</ul></li>
<li>
<p>igt@kms_hdr@bpc-switch-suspend@pipe-a-hdmi-a-2-xrgb2101010:</p><ul>
<li>shard-rkl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/Patchwork_169493v3/shard-rkl-6/igt@kms_hdr@bpc-switch-suspend=
@pipe-a-hdmi-a-2-xrgb2101010.html">INCOMPLETE</a> (<a href=3D"https://gitla=
b.freedesktop.org/drm/i915/kernel/-/issues/15436">i915#15436</a>)</li>
</ul></li>
<li>
<p>igt@kms_hdr@brightness-with-hdr:</p><ul>
<li>shard-tglu:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/Patchwork_169493v3/shard-tglu-9/igt@kms_hdr@brightness-with-h=
dr.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kerne=
l/-/issues/12713">i915#12713</a>)</li>
</ul></li>
<li>
<p>igt@kms_hdr@static-swap:</p><ul>
<li>shard-rkl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/Patchwork_169493v3/shard-rkl-2/igt@kms_hdr@static-swap.html">=
SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issue=
s/16644">i915#16644</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i91=
5/kernel/-/issues/3555">i915#3555</a> / <a href=3D"https://gitlab.freedeskt=
op.org/drm/i915/kernel/-/issues/8228">i915#8228</a>) +1 other test skip</li=
>
<li>shard-tglu-1:       NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/Patchwork_169493v3/shard-tglu-1/igt@kms_hdr@static-swap.html"=
>SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issu=
es/3555">i915#3555</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i915=
/kernel/-/issues/8228">i915#8228</a>)</li>
</ul></li>
<li>
<p>igt@kms_hdr@static-toggle:</p><ul>
<li>shard-tglu:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/Patchwork_169493v3/shard-tglu-9/igt@kms_hdr@static-toggle.htm=
l">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/is=
sues/3555">i915#3555</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i9=
15/kernel/-/issues/8228">i915#8228</a>) +1 other test skip</li>
</ul></li>
<li>
<p>igt@kms_joiner@basic-big-joiner:</p><ul>
<li>shard-rkl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/Patchwork_169493v3/shard-rkl-7/igt@kms_joiner@basic-big-joine=
r.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel=
/-/issues/15460">i915#15460</a>)</li>
</ul></li>
<li>
<p>igt@kms_joiner@basic-force-ultra-joiner:</p><ul>
<li>shard-glk11:        NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/Patchwork_169493v3/shard-glk11/igt@kms_joiner@basic-force-ult=
ra-joiner.html">SKIP</a> +106 other tests skip</li>
</ul></li>
<li>
<p>igt@kms_joiner@invalid-modeset-big-joiner:</p><ul>
<li>shard-tglu-1:       NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/Patchwork_169493v3/shard-tglu-1/igt@kms_joiner@invalid-modese=
t-big-joiner.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/=
i915/kernel/-/issues/15460">i915#15460</a>)</li>
</ul></li>
<li>
<p>igt@kms_multipipe_modeset@basic-max-pipe-crc-check:</p><ul>
<li>shard-tglu-1:       NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/Patchwork_169493v3/shard-tglu-1/igt@kms_multipipe_modeset@bas=
ic-max-pipe-crc-check.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop=
.org/drm/i915/kernel/-/issues/15815">i915#15815</a>)</li>
</ul></li>
<li>
<p>igt@kms_pipe_stress@stress-xrgb8888-untiled:</p><ul>
<li>shard-glk11:        NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/Patchwork_169493v3/shard-glk11/igt@kms_pipe_stress@stress-xrg=
b8888-untiled.html">DMESG-WARN</a> (<a href=3D"https://gitlab.freedesktop.o=
rg/drm/i915/kernel/-/issues/118">i915#118</a>)</li>
</ul></li>
<li>
<p>igt@kms_plane@pixel-format-4-tiled-dg2-mc-ccs-modifier:</p><ul>
<li>shard-tglu:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/Patchwork_169493v3/shard-tglu-9/igt@kms_plane@pixel-format-4-=
tiled-dg2-mc-ccs-modifier.html">SKIP</a> (<a href=3D"https://gitlab.freedes=
ktop.org/drm/i915/kernel/-/issues/15709">i915#15709</a>) +2 other tests ski=
p</li>
</ul></li>
<li>
<p>igt@kms_plane@pixel-format-4-tiled-dg2-rc-ccs-cc-modifier-source-clampin=
g:</p><ul>
<li>shard-tglu-1:       NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/Patchwork_169493v3/shard-tglu-1/igt@kms_plane@pixel-format-4-=
tiled-dg2-rc-ccs-cc-modifier-source-clamping.html">SKIP</a> (<a href=3D"htt=
ps://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15709">i915#15709</a>)=
 +3 other tests skip</li>
</ul></li>
<li>
<p>igt@kms_plane@pixel-format-4-tiled-mtl-rc-ccs-cc-modifier:</p><ul>
<li>shard-glk:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/Patchwork_169493v3/shard-glk2/igt@kms_plane@pixel-format-4-ti=
led-mtl-rc-ccs-cc-modifier.html">SKIP</a> +180 other tests skip</li>
</ul></li>
<li>
<p>igt@kms_plane@pixel-format-4-tiled-mtl-rc-ccs-cc-modifier-source-clampin=
g:</p><ul>
<li>shard-rkl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/Patchwork_169493v3/shard-rkl-2/igt@kms_plane@pixel-format-4-t=
iled-mtl-rc-ccs-cc-modifier-source-clamping.html">SKIP</a> (<a href=3D"http=
s://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15709">i915#15709</a>) =
+2 other tests skip</li>
</ul></li>
<li>
<p>igt@kms_plane@pixel-format-4-tiled-mtl-rc-ccs-modifier:</p><ul>
<li>shard-rkl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/Patchwork_169493v3/shard-rkl-6/igt@kms_plane@pixel-format-4-t=
iled-mtl-rc-ccs-modifier.html">SKIP</a> (<a href=3D"https://gitlab.freedesk=
top.org/drm/i915/kernel/-/issues/14544">i915#14544</a> / <a href=3D"https:/=
/gitlab.freedesktop.org/drm/i915/kernel/-/issues/15709">i915#15709</a>)</li=
>
</ul></li>
<li>
<p>igt@kms_plane@planar-pixel-format-settings@nv12-tile4-src-y:</p><ul>
<li>shard-tglu-1:       NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/Patchwork_169493v3/shard-tglu-1/igt@kms_plane@planar-pixel-fo=
rmat-settings@nv12-tile4-src-y.html">SKIP</a> (<a href=3D"https://gitlab.fr=
eedesktop.org/drm/i915/kernel/-/issues/16112">i915#16112</a>)</li>
</ul></li>
<li>
<p>igt@kms_plane@plane-panning-bottom-right-suspend:</p><ul>
<li>shard-glk11:        NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/Patchwork_169493v3/shard-glk11/igt@kms_plane@plane-panning-bo=
ttom-right-suspend.html">INCOMPLETE</a> (<a href=3D"https://gitlab.freedesk=
top.org/drm/i915/kernel/-/issues/13026">i915#13026</a>) +1 other test incom=
plete</li>
</ul></li>
<li>
<p>igt@kms_plane@plane-panning-bottom-right-suspend@pipe-b:</p><ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_19006/shard-rkl-5/igt@kms_plane@plane-panning-bottom-right-suspend@=
pipe-b.html">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm=
-tip/Patchwork_169493v3/shard-rkl-3/igt@kms_plane@plane-panning-bottom-righ=
t-suspend@pipe-b.html">INCOMPLETE</a> (<a href=3D"https://gitlab.freedeskto=
p.org/drm/i915/kernel/-/issues/14412">i915#14412</a>) +1 other test incompl=
ete</li>
</ul></li>
<li>
<p>igt@kms_plane_alpha_blend@alpha-opaque-fb:</p><ul>
<li>shard-glk10:        NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/Patchwork_169493v3/shard-glk10/igt@kms_plane_alpha_blend@alph=
a-opaque-fb.html">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i=
915/kernel/-/issues/10647">i915#10647</a> / <a href=3D"https://gitlab.freed=
esktop.org/drm/i915/kernel/-/issues/12169">i915#12169</a>)</li>
</ul></li>
<li>
<p>igt@kms_plane_alpha_blend@alpha-opaque-fb@pipe-c-hdmi-a-1:</p><ul>
<li>shard-glk10:        NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/Patchwork_169493v3/shard-glk10/igt@kms_plane_alpha_blend@alph=
a-opaque-fb@pipe-c-hdmi-a-1.html">FAIL</a> (<a href=3D"https://gitlab.freed=
esktop.org/drm/i915/kernel/-/issues/10647">i915#10647</a>) +1 other test fa=
il</li>
</ul></li>
<li>
<p>igt@kms_plane_alpha_blend@alpha-transparent-fb:</p><ul>
<li>shard-glk11:        NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/Patchwork_169493v3/shard-glk11/igt@kms_plane_alpha_blend@alph=
a-transparent-fb.html">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/=
drm/i915/kernel/-/issues/10647">i915#10647</a> / <a href=3D"https://gitlab.=
freedesktop.org/drm/i915/kernel/-/issues/12177">i915#12177</a>)</li>
</ul></li>
<li>
<p>igt@kms_plane_alpha_blend@alpha-transparent-fb@pipe-a-hdmi-a-1:</p><ul>
<li>shard-glk11:        NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/Patchwork_169493v3/shard-glk11/igt@kms_plane_alpha_blend@alph=
a-transparent-fb@pipe-a-hdmi-a-1.html">FAIL</a> (<a href=3D"https://gitlab.=
freedesktop.org/drm/i915/kernel/-/issues/10647">i915#10647</a>) +1 other te=
st fail</li>
</ul></li>
<li>
<p>igt@kms_plane_multiple@2x-tiling-4:</p><ul>
<li>shard-rkl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/Patchwork_169493v3/shard-rkl-5/igt@kms_plane_multiple@2x-tili=
ng-4.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/ker=
nel/-/issues/13958">i915#13958</a>)</li>
</ul></li>
<li>
<p>igt@kms_plane_multiple@2x-tiling-yf:</p><ul>
<li>shard-rkl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/Patchwork_169493v3/shard-rkl-6/igt@kms_plane_multiple@2x-tili=
ng-yf.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/ke=
rnel/-/issues/13958">i915#13958</a> / <a href=3D"https://gitlab.freedesktop=
.org/drm/i915/kernel/-/issues/14544">i915#14544</a>)</li>
</ul></li>
<li>
<p>igt@kms_plane_scaling@plane-downscale-factor-0-75-with-rotation@pipe-a:<=
/p><ul>
<li>shard-rkl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/Patchwork_169493v3/shard-rkl-6/igt@kms_plane_scaling@plane-do=
wnscale-factor-0-75-with-rotation@pipe-a.html">SKIP</a> (<a href=3D"https:/=
/gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a> / <a=
 href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15329">i91=
5#15329</a>) +6 other tests skip</li>
</ul></li>
<li>
<p>igt@kms_plane_scaling@plane-scaler-with-clipping-clamping-rotation:</p><=
ul>
<li>shard-rkl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/Patchwork_169493v3/shard-rkl-6/igt@kms_plane_scaling@plane-sc=
aler-with-clipping-clamping-rotation.html">SKIP</a> (<a href=3D"https://git=
lab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a> / <a hre=
f=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15329">i915#15=
329</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issue=
s/3555">i915#3555</a>)</li>
</ul></li>
<li>
<p>igt@kms_plane_scaling@plane-upscale-20x20-with-rotation@pipe-a:</p><ul>
<li>shard-rkl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/Patchwork_169493v3/shard-rkl-5/igt@kms_plane_scaling@plane-up=
scale-20x20-with-rotation@pipe-a.html">SKIP</a> (<a href=3D"https://gitlab.=
freedesktop.org/drm/i915/kernel/-/issues/15329">i915#15329</a>) +3 other te=
sts skip</li>
</ul></li>
<li>
<p>igt@kms_pm_backlight@basic-brightness:</p><ul>
<li>shard-tglu:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/Patchwork_169493v3/shard-tglu-9/igt@kms_pm_backlight@basic-br=
ightness.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915=
/kernel/-/issues/12343">i915#12343</a> / <a href=3D"https://gitlab.freedesk=
top.org/drm/i915/kernel/-/issues/9812">i915#9812</a>)</li>
</ul></li>
<li>
<p>igt@kms_pm_dc@dc5-psr:</p><ul>
<li>shard-tglu:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/Patchwork_169493v3/shard-tglu-9/igt@kms_pm_dc@dc5-psr.html">S=
KIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues=
/15948">i915#15948</a>)</li>
</ul></li>
<li>
<p>igt@kms_pm_dc@dc5-retention-flops:</p><ul>
<li>shard-rkl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/Patchwork_169493v3/shard-rkl-3/igt@kms_pm_dc@dc5-retention-fl=
ops.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kern=
el/-/issues/3828">i915#3828</a>) +1 other test skip</li>
</ul></li>
<li>
<p>igt@kms_pm_dc@dc6-psr:</p><ul>
<li>shard-rkl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/Patchwork_169493v3/shard-rkl-5/igt@kms_pm_dc@dc6-psr.html">SK=
IP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/=
15948">i915#15948</a>)</li>
</ul></li>
<li>
<p>igt@kms_pm_lpsp@screens-disabled:</p><ul>
<li>shard-tglu-1:       NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/Patchwork_169493v3/shard-tglu-1/igt@kms_pm_lpsp@screens-disab=
led.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kern=
el/-/issues/8430">i915#8430</a>)</li>
</ul></li>
<li>
<p>igt@kms_pm_rpm@dpms-lpsp:</p><ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_19006/shard-rkl-5/igt@kms_pm_rpm@dpms-lpsp.html">PASS</a> -&gt; <a =
href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_169493v3/shard-r=
kl-3/igt@kms_pm_rpm@dpms-lpsp.html">SKIP</a> (<a href=3D"https://gitlab.fre=
edesktop.org/drm/i915/kernel/-/issues/15073">i915#15073</a>) +1 other test =
skip</li>
</ul></li>
<li>
<p>igt@kms_pm_rpm@dpms-mode-unset-lpsp:</p><ul>
<li>shard-rkl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/Patchwork_169493v3/shard-rkl-6/igt@kms_pm_rpm@dpms-mode-unset=
-lpsp.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/ke=
rnel/-/issues/14544">i915#14544</a> / <a href=3D"https://gitlab.freedesktop=
.org/drm/i915/kernel/-/issues/15073">i915#15073</a>)</li>
</ul></li>
<li>
<p>igt@kms_pm_rpm@modeset-lpsp-stress-no-wait:</p><ul>
<li>shard-rkl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/Patchwork_169493v3/shard-rkl-7/igt@kms_pm_rpm@modeset-lpsp-st=
ress-no-wait.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/=
i915/kernel/-/issues/15073">i915#15073</a>)</li>
</ul></li>
<li>
<p>igt@kms_pm_rpm@modeset-non-lpsp-stress:</p><ul>
<li>shard-dg2:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_19006/shard-dg2-1/igt@kms_pm_rpm@modeset-non-lpsp-stress.html">PASS=
</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_16=
9493v3/shard-dg2-4/igt@kms_pm_rpm@modeset-non-lpsp-stress.html">SKIP</a> (<=
a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15073">i9=
15#15073</a>)</li>
<li>shard-dg1:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_19006/shard-dg1-18/igt@kms_pm_rpm@modeset-non-lpsp-stress.html">PAS=
S</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_1=
69493v3/shard-dg1-15/igt@kms_pm_rpm@modeset-non-lpsp-stress.html">SKIP</a> =
(<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15073">=
i915#15073</a>)</li>
</ul></li>
<li>
<p>igt@kms_prime@basic-crc-hybrid:</p><ul>
<li>shard-rkl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/Patchwork_169493v3/shard-rkl-2/igt@kms_prime@basic-crc-hybrid=
.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/=
-/issues/6524">i915#6524</a>)</li>
<li>shard-tglu-1:       NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/Patchwork_169493v3/shard-tglu-1/igt@kms_prime@basic-crc-hybri=
d.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel=
/-/issues/6524">i915#6524</a>) +1 other test skip</li>
</ul></li>
<li>
<p>igt@kms_psr2_sf@fbc-psr2-cursor-plane-move-continuous-exceed-sf:</p><ul>
<li>shard-rkl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/Patchwork_169493v3/shard-rkl-8/igt@kms_psr2_sf@fbc-psr2-curso=
r-plane-move-continuous-exceed-sf.html">SKIP</a> (<a href=3D"https://gitlab=
.freedesktop.org/drm/i915/kernel/-/issues/11520">i915#11520</a>) +6 other t=
ests skip</li>
</ul></li>
<li>
<p>igt@kms_psr2_sf@fbc-psr2-overlay-plane-move-continuous-exceed-sf:</p><ul=
>
<li>shard-tglu:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/Patchwork_169493v3/shard-tglu-9/igt@kms_psr2_sf@fbc-psr2-over=
lay-plane-move-continuous-exceed-sf.html">SKIP</a> (<a href=3D"https://gitl=
ab.freedesktop.org/drm/i915/kernel/-/issues/11520">i915#11520</a>) +2 other=
 tests skip</li>
</ul></li>
<li>
<p>igt@kms_psr2_sf@fbc-psr2-primary-plane-update-sf-dmg-area:</p><ul>
<li>shard-glk:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/Patchwork_169493v3/shard-glk2/igt@kms_psr2_sf@fbc-psr2-primar=
y-plane-update-sf-dmg-area.html">SKIP</a> (<a href=3D"https://gitlab.freede=
sktop.org/drm/i915/kernel/-/issues/11520">i915#11520</a>) +2 other tests sk=
ip</li>
</ul></li>
<li>
<p>igt@kms_psr2_sf@pr-cursor-plane-update-sf:</p><ul>
<li>shard-glk11:        NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/Patchwork_169493v3/shard-glk11/igt@kms_psr2_sf@pr-cursor-plan=
e-update-sf.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i=
915/kernel/-/issues/11520">i915#11520</a>) +1 other test skip</li>
</ul></li>
<li>
<p>igt@kms_psr2_sf@pr-plane-move-sf-dmg-area:</p><ul>
<li>shard-rkl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/Patchwork_169493v3/shard-rkl-6/igt@kms_psr2_sf@pr-plane-move-=
sf-dmg-area.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i=
915/kernel/-/issues/11520">i915#11520</a> / <a href=3D"https://gitlab.freed=
esktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a>)</li>
</ul></li>
<li>
<p>igt@kms_psr2_sf@pr-primary-plane-update-sf-dmg-area-big-fb:</p><ul>
<li>shard-glk10:        NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/Patchwork_169493v3/shard-glk10/igt@kms_psr2_sf@pr-primary-pla=
ne-update-sf-dmg-area-big-fb.html">SKIP</a> (<a href=3D"https://gitlab.free=
desktop.org/drm/i915/kernel/-/issues/11520">i915#11520</a>) +3 other tests =
skip</li>
</ul></li>
<li>
<p>igt@kms_psr2_sf@psr2-overlay-primary-update-sf-dmg-area:</p><ul>
<li>shard-tglu-1:       NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/Patchwork_169493v3/shard-tglu-1/igt@kms_psr2_sf@psr2-overlay-=
primary-update-sf-dmg-area.html">SKIP</a> (<a href=3D"https://gitlab.freede=
sktop.org/drm/i915/kernel/-/issues/11520">i915#11520</a>) +5 other tests sk=
ip</li>
</ul></li>
<li>
<p>igt@kms_psr2_su@frontbuffer-xrgb8888:</p><ul>
<li>shard-tglu:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/Patchwork_169493v3/shard-tglu-9/igt@kms_psr2_su@frontbuffer-x=
rgb8888.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/=
kernel/-/issues/9683">i915#9683</a>)</li>
</ul></li>
<li>
<p>igt@kms_psr2_su@page_flip-xrgb8888:</p><ul>
<li>shard-rkl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/Patchwork_169493v3/shard-rkl-6/igt@kms_psr2_su@page_flip-xrgb=
8888.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/ker=
nel/-/issues/14544">i915#14544</a> / <a href=3D"https://gitlab.freedesktop.=
org/drm/i915/kernel/-/issues/9683">i915#9683</a>)</li>
</ul></li>
<li>
<p>igt@kms_psr@fbc-psr2-cursor-plane-move:</p><ul>
<li>shard-tglu:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/Patchwork_169493v3/shard-tglu-9/igt@kms_psr@fbc-psr2-cursor-p=
lane-move.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i91=
5/kernel/-/issues/9732">i915#9732</a>) +10 other tests skip</li>
</ul></li>
<li>
<p>igt@kms_psr@pr-cursor-mmap-cpu:</p><ul>
<li>shard-rkl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/Patchwork_169493v3/shard-rkl-3/igt@kms_psr@pr-cursor-mmap-cpu=
.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/=
-/issues/1072">i915#1072</a> / <a href=3D"https://gitlab.freedesktop.org/dr=
m/i915/kernel/-/issues/9732">i915#9732</a>) +15 other tests skip</li>
</ul></li>
<li>
<p>igt@kms_psr@psr-sprite-plane-move:</p><ul>
<li>shard-rkl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/Patchwork_169493v3/shard-rkl-6/igt@kms_psr@psr-sprite-plane-m=
ove.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kern=
el/-/issues/1072">i915#1072</a> / <a href=3D"https://gitlab.freedesktop.org=
/drm/i915/kernel/-/issues/14544">i915#14544</a> / <a href=3D"https://gitlab=
.freedesktop.org/drm/i915/kernel/-/issues/9732">i915#9732</a>) +3 other tes=
ts skip</li>
</ul></li>
<li>
<p>igt@kms_psr@psr2-sprite-mmap-gtt:</p><ul>
<li>shard-tglu-1:       NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/Patchwork_169493v3/shard-tglu-1/igt@kms_psr@psr2-sprite-mmap-=
gtt.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kern=
el/-/issues/9732">i915#9732</a>) +14 other tests skip</li>
</ul></li>
<li>
<p>igt@kms_rotation_crc@primary-yf-tiled-reflect-x-270:</p><ul>
<li>shard-rkl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/Patchwork_169493v3/shard-rkl-7/igt@kms_rotation_crc@primary-y=
f-tiled-reflect-x-270.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop=
.org/drm/i915/kernel/-/issues/5289">i915#5289</a>) +1 other test skip</li>
</ul></li>
<li>
<p>igt@kms_scaling_modes@scaling-mode-full-aspect:</p><ul>
<li>shard-rkl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/Patchwork_169493v3/shard-rkl-6/igt@kms_scaling_modes@scaling-=
mode-full-aspect.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/=
drm/i915/kernel/-/issues/14544">i915#14544</a> / <a href=3D"https://gitlab.=
freedesktop.org/drm/i915/kernel/-/issues/3555">i915#3555</a>)</li>
</ul></li>
<li>
<p>igt@kms_selftest@drm_framebuffer:</p><ul>
<li>shard-tglu-1:       NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/Patchwork_169493v3/shard-tglu-1/igt@kms_selftest@drm_framebuf=
fer.html">ABORT</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/ker=
nel/-/issues/13179">i915#13179</a>) +1 other test abort</li>
</ul></li>
<li>
<p>igt@kms_vrr@flip-dpms:</p><ul>
<li>shard-rkl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/Patchwork_169493v3/shard-rkl-5/igt@kms_vrr@flip-dpms.html">SK=
IP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/=
15243">i915#15243</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i915/=
kernel/-/issues/3555">i915#3555</a>)</li>
</ul></li>
<li>
<p>igt@kms_vrr@flip-suspend:</p><ul>
<li>shard-tglu:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/Patchwork_169493v3/shard-tglu-9/igt@kms_vrr@flip-suspend.html=
">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/iss=
ues/3555">i915#3555</a>) +2 other tests skip</li>
</ul></li>
<li>
<p>igt@kms_vrr@seamless-rr-switch-virtual:</p><ul>
<li>shard-tglu:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/Patchwork_169493v3/shard-tglu-9/igt@kms_vrr@seamless-rr-switc=
h-virtual.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i91=
5/kernel/-/issues/9906">i915#9906</a>)</li>
</ul></li>
<li>
<p>igt@kms_vrr@seamless-rr-switch-vrr:</p><ul>
<li>shard-rkl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/Patchwork_169493v3/shard-rkl-2/igt@kms_vrr@seamless-rr-switch=
-vrr.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/ker=
nel/-/issues/9906">i915#9906</a>)</li>
<li>shard-tglu-1:       NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/Patchwork_169493v3/shard-tglu-1/igt@kms_vrr@seamless-rr-switc=
h-vrr.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/ke=
rnel/-/issues/9906">i915#9906</a>) +1 other test skip</li>
</ul></li>
<li>
<p>igt@perf@mi-rpc:</p><ul>
<li>shard-rkl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/Patchwork_169493v3/shard-rkl-5/igt@perf@mi-rpc.html">SKIP</a>=
 (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2434">=
i915#2434</a>)</li>
</ul></li>
<li>
<p>igt@perf@per-context-mode-unprivileged:</p><ul>
<li>shard-rkl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/Patchwork_169493v3/shard-rkl-6/igt@perf@per-context-mode-unpr=
ivileged.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915=
/kernel/-/issues/14544">i915#14544</a> / <a href=3D"https://gitlab.freedesk=
top.org/drm/i915/kernel/-/issues/2435">i915#2435</a>)</li>
</ul></li>
<li>
<p>igt@perf_pmu@module-unload:</p><ul>
<li>shard-glk10:        NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/Patchwork_169493v3/shard-glk10/igt@perf_pmu@module-unload.htm=
l">ABORT</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/i=
ssues/15778">i915#15778</a>)</li>
</ul></li>
<li>
<p>igt@perf_pmu@rc6@other-idle-gt0:</p><ul>
<li>shard-rkl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/Patchwork_169493v3/shard-rkl-5/igt@perf_pmu@rc6@other-idle-gt=
0.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel=
/-/issues/8516">i915#8516</a>)</li>
</ul></li>
<li>
<p>igt@prime_udl@share-import:</p><ul>
<li>shard-rkl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/Patchwork_169493v3/shard-rkl-2/igt@prime_udl@share-import.htm=
l">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/is=
sues/16420">i915#16420</a>)</li>
<li>shard-tglu-1:       NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/Patchwork_169493v3/shard-tglu-1/igt@prime_udl@share-import.ht=
ml">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/i=
ssues/16420">i915#16420</a>) +1 other test skip</li>
</ul></li>
</ul><h4>Possible fixes</h4><ul>
<li>
<p>igt@gem_exec_suspend@basic-s3-devices:</p><ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_19006/shard-rkl-1/igt@gem_exec_suspend@basic-s3-devices.html">ABORT=
</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15=
131">i915#15131</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i915/ke=
rnel/-/issues/15542">i915#15542</a>) -&gt; <a href=3D"https://intel-gfx-ci.=
01.org/tree/drm-tip/Patchwork_169493v3/shard-rkl-3/igt@gem_exec_suspend@bas=
ic-s3-devices.html">PASS</a></li>
</ul></li>
<li>
<p>igt@gem_exec_suspend@basic-s3-devices@smem:</p><ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_19006/shard-rkl-1/igt@gem_exec_suspend@basic-s3-devices@smem.html">=
ABORT</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issu=
es/15542">i915#15542</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree=
/drm-tip/Patchwork_169493v3/shard-rkl-3/igt@gem_exec_suspend@basic-s3-devic=
es@smem.html">PASS</a></li>
</ul></li>
<li>
<p>igt@gem_linear_blits@normal:</p><ul>
<li>shard-dg1:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_19006/shard-dg1-14/igt@gem_linear_blits@normal.html">FAIL</a> (<a h=
ref=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15391">i915#=
15391</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/Patchw=
ork_169493v3/shard-dg1-18/igt@gem_linear_blits@normal.html">PASS</a></li>
</ul></li>
<li>
<p>igt@gem_workarounds@suspend-resume-fd:</p><ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_19006/shard-rkl-6/igt@gem_workarounds@suspend-resume-fd.html">INCOM=
PLETE</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issu=
es/13356">i915#13356</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree=
/drm-tip/Patchwork_169493v3/shard-rkl-5/igt@gem_workarounds@suspend-resume-=
fd.html">PASS</a> +2 other tests pass</li>
</ul></li>
<li>
<p>igt@i915_pm_rps@reset:</p><ul>
<li>shard-snb:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_19006/shard-snb7/igt@i915_pm_rps@reset.html">TIMEOUT</a> (<a href=
=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16162">i915#161=
62</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork=
_169493v3/shard-snb6/igt@i915_pm_rps@reset.html">PASS</a></li>
</ul></li>
<li>
<p>igt@i915_power@sanity:</p><ul>
<li>shard-mtlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_19006/shard-mtlp-1/igt@i915_power@sanity.html">SKIP</a> (<a href=3D=
"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/7984">i915#7984</a=
>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_1694=
93v3/shard-mtlp-4/igt@i915_power@sanity.html">PASS</a></li>
</ul></li>
<li>
<p>igt@kms_atomic_transition@plane-all-modeset-transition@pipe-a-hdmi-a-1:<=
/p><ul>
<li>shard-tglu:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_19006/shard-tglu-8/igt@kms_atomic_transition@plane-all-modeset-tran=
sition@pipe-a-hdmi-a-1.html">FAIL</a> (<a href=3D"https://gitlab.freedeskto=
p.org/drm/i915/kernel/-/issues/15662">i915#15662</a>) -&gt; <a href=3D"http=
s://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_169493v3/shard-tglu-5/igt@km=
s_atomic_transition@plane-all-modeset-transition@pipe-a-hdmi-a-1.html">PASS=
</a> +1 other test pass</li>
</ul></li>
<li>
<p>igt@kms_ccs@crc-primary-suspend-y-tiled-gen12-rc-ccs-cc:</p><ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_19006/shard-rkl-6/igt@kms_ccs@crc-primary-suspend-y-tiled-gen12-rc-=
ccs-cc.html">INCOMPLETE</a> (<a href=3D"https://gitlab.freedesktop.org/drm/=
i915/kernel/-/issues/15582">i915#15582</a>) -&gt; <a href=3D"https://intel-=
gfx-ci.01.org/tree/drm-tip/Patchwork_169493v3/shard-rkl-8/igt@kms_ccs@crc-p=
rimary-suspend-y-tiled-gen12-rc-ccs-cc.html">PASS</a></li>
</ul></li>
<li>
<p>igt@kms_cursor_crc@cursor-onscreen-64x21:</p><ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_19006/shard-rkl-8/igt@kms_cursor_crc@cursor-onscreen-64x21.html">FA=
IL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/=
13566">i915#13566</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/dr=
m-tip/Patchwork_169493v3/shard-rkl-4/igt@kms_cursor_crc@cursor-onscreen-64x=
21.html">PASS</a></li>
</ul></li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-1p-primscrn-spr-indfb-draw-blt:</p><ul>
<li>shard-dg1:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_19006/shard-dg1-19/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-spr=
-indfb-draw-blt.html">DMESG-WARN</a> (<a href=3D"https://gitlab.freedesktop=
.org/drm/i915/kernel/-/issues/4423">i915#4423</a>) -&gt; <a href=3D"https:/=
/intel-gfx-ci.01.org/tree/drm-tip/Patchwork_169493v3/shard-dg1-17/igt@kms_f=
rontbuffer_tracking@fbc-1p-primscrn-spr-indfb-draw-blt.html">PASS</a> +1 ot=
her test pass</li>
</ul></li>
<li>
<p>igt@kms_frontbuffer_tracking@hdr-1p-primscrn-spr-indfb-fullscreen:</p><u=
l>
<li>shard-glk:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_19006/shard-glk5/igt@kms_frontbuffer_tracking@hdr-1p-primscrn-spr-i=
ndfb-fullscreen.html">SKIP</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/Patchwork_169493v3/shard-glk8/igt@kms_frontbuffer_tracking@hd=
r-1p-primscrn-spr-indfb-fullscreen.html">PASS</a> +9 other tests pass</li>
</ul></li>
<li>
<p>igt@kms_frontbuffer_tracking@hdr-rgb565-draw-mmap-cpu:</p><ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_19006/shard-rkl-5/igt@kms_frontbuffer_tracking@hdr-rgb565-draw-mmap=
-cpu.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/ker=
nel/-/issues/15989">i915#15989</a>) -&gt; <a href=3D"https://intel-gfx-ci.0=
1.org/tree/drm-tip/Patchwork_169493v3/shard-rkl-6/igt@kms_frontbuffer_track=
ing@hdr-rgb565-draw-mmap-cpu.html">PASS</a> +3 other tests pass</li>
</ul></li>
<li>
<p>igt@kms_pipe_crc_basic@suspend-read-crc:</p><ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_19006/shard-rkl-3/igt@kms_pipe_crc_basic@suspend-read-crc.html">INC=
OMPLETE</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/is=
sues/12756">i915#12756</a> / <a href=3D"https://gitlab.freedesktop.org/drm/=
i915/kernel/-/issues/13476">i915#13476</a>) -&gt; <a href=3D"https://intel-=
gfx-ci.01.org/tree/drm-tip/Patchwork_169493v3/shard-rkl-7/igt@kms_pipe_crc_=
basic@suspend-read-crc.html">PASS</a></li>
</ul></li>
<li>
<p>igt@kms_pipe_crc_basic@suspend-read-crc@pipe-b-hdmi-a-2:</p><ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_19006/shard-rkl-3/igt@kms_pipe_crc_basic@suspend-read-crc@pipe-b-hd=
mi-a-2.html">INCOMPLETE</a> (<a href=3D"https://gitlab.freedesktop.org/drm/=
i915/kernel/-/issues/13476">i915#13476</a>) -&gt; <a href=3D"https://intel-=
gfx-ci.01.org/tree/drm-tip/Patchwork_169493v3/shard-rkl-7/igt@kms_pipe_crc_=
basic@suspend-read-crc@pipe-b-hdmi-a-2.html">PASS</a></li>
</ul></li>
<li>
<p>igt@kms_pipe_stress@stress-xrgb8888-ytiled:</p><ul>
<li>shard-glk:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_19006/shard-glk9/igt@kms_pipe_stress@stress-xrgb8888-ytiled.html">D=
MESG-WARN</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/=
issues/118">i915#118</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree=
/drm-tip/Patchwork_169493v3/shard-glk9/igt@kms_pipe_stress@stress-xrgb8888-=
ytiled.html">PASS</a></li>
</ul></li>
<li>
<p>igt@kms_pm_lpsp@kms-lpsp:</p><ul>
<li>shard-dg2:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_19006/shard-dg2-1/igt@kms_pm_lpsp@kms-lpsp.html">SKIP</a> (<a href=
=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9340">i915#9340=
</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_1=
69493v3/shard-dg2-4/igt@kms_pm_lpsp@kms-lpsp.html">PASS</a></li>
</ul></li>
<li>
<p>igt@kms_pm_rpm@dpms-lpsp:</p><ul>
<li>shard-dg2:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_19006/shard-dg2-1/igt@kms_pm_rpm@dpms-lpsp.html">SKIP</a> (<a href=
=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15073">i915#150=
73</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork=
_169493v3/shard-dg2-4/igt@kms_pm_rpm@dpms-lpsp.html">PASS</a> +2 other test=
s pass</li>
</ul></li>
<li>
<p>igt@kms_pm_rpm@modeset-non-lpsp:</p><ul>
<li>shard-dg1:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_19006/shard-dg1-15/igt@kms_pm_rpm@modeset-non-lpsp.html">SKIP</a> (=
<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15073">i=
915#15073</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/Pa=
tchwork_169493v3/shard-dg1-19/igt@kms_pm_rpm@modeset-non-lpsp.html">PASS</a=
> +1 other test pass</li>
</ul></li>
<li>
<p>igt@kms_pm_rpm@system-suspend-modeset:</p><ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_19006/shard-rkl-4/igt@kms_pm_rpm@system-suspend-modeset.html">INCOM=
PLETE</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issu=
es/14419">i915#14419</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree=
/drm-tip/Patchwork_169493v3/shard-rkl-5/igt@kms_pm_rpm@system-suspend-modes=
et.html">PASS</a></li>
</ul></li>
<li>
<p>igt@perf_pmu@busy-double-start@vecs1:</p><ul>
<li>shard-dg2:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_19006/shard-dg2-3/igt@perf_pmu@busy-double-start@vecs1.html">FAIL</=
a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4349=
">i915#4349</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/=
Patchwork_169493v3/shard-dg2-6/igt@perf_pmu@busy-double-start@vecs1.html">P=
ASS</a> +2 other tests pass</li>
</ul></li>
</ul><h4>Warnings</h4><ul>
<li>
<p>igt@api_intel_bb@blit-reloc-purge-cache:</p><ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_19006/shard-rkl-5/igt@api_intel_bb@blit-reloc-purge-cache.html">SKI=
P</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8=
411">i915#8411</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-t=
ip/Patchwork_169493v3/shard-rkl-6/igt@api_intel_bb@blit-reloc-purge-cache.h=
tml">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/=
issues/14544">i915#14544</a> / <a href=3D"https://gitlab.freedesktop.org/dr=
m/i915/kernel/-/issues/8411">i915#8411</a>)</li>
</ul></li>
<li>
<p>igt@api_intel_bb@crc32:</p><ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_19006/shard-rkl-6/igt@api_intel_bb@crc32.html">SKIP</a> (<a href=3D=
"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14544<=
/a> / <a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/62=
30">i915#6230</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-ti=
p/Patchwork_169493v3/shard-rkl-8/igt@api_intel_bb@crc32.html">SKIP</a> (<a =
href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6230">i915#=
6230</a>)</li>
</ul></li>
<li>
<p>igt@device_reset@unbind-cold-reset-rebind:</p><ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_19006/shard-rkl-5/igt@device_reset@unbind-cold-reset-rebind.html">S=
KIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues=
/11078">i915#11078</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/d=
rm-tip/Patchwork_169493v3/shard-rkl-6/igt@device_reset@unbind-cold-reset-re=
bind.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/ker=
nel/-/issues/11078">i915#11078</a> / <a href=3D"https://gitlab.freedesktop.=
org/drm/i915/kernel/-/issues/14544">i915#14544</a>)</li>
</ul></li>
<li>
<p>igt@gem_ccs@large-ctrl-surf-copy:</p><ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_19006/shard-rkl-6/igt@gem_ccs@large-ctrl-surf-copy.html">SKIP</a> (=
<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13008">i=
915#13008</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-=
/issues/14544">i915#14544</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/Patchwork_169493v3/shard-rkl-4/igt@gem_ccs@large-ctrl-surf-co=
py.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kerne=
l/-/issues/13008">i915#13008</a>)</li>
</ul></li>
<li>
<p>igt@gem_exec_balancer@parallel:</p><ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_19006/shard-rkl-6/igt@gem_exec_balancer@parallel.html">SKIP</a> (<a=
 href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i91=
5#14544</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/i=
ssues/4525">i915#4525</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tre=
e/drm-tip/Patchwork_169493v3/shard-rkl-8/igt@gem_exec_balancer@parallel.htm=
l">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/is=
sues/4525">i915#4525</a>)</li>
</ul></li>
<li>
<p>igt@gem_exec_balancer@parallel-out-fence:</p><ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_19006/shard-rkl-5/igt@gem_exec_balancer@parallel-out-fence.html">SK=
IP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/=
4525">i915#4525</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-=
tip/Patchwork_169493v3/shard-rkl-6/igt@gem_exec_balancer@parallel-out-fence=
.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/=
-/issues/14544">i915#14544</a> / <a href=3D"https://gitlab.freedesktop.org/=
drm/i915/kernel/-/issues/4525">i915#4525</a>)</li>
</ul></li>
<li>
<p>igt@gem_exec_reloc@basic-wc-cpu:</p><ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_19006/shard-rkl-6/igt@gem_exec_reloc@basic-wc-cpu.html">SKIP</a> (<=
a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i9=
15#14544</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/=
issues/3281">i915#3281</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tr=
ee/drm-tip/Patchwork_169493v3/shard-rkl-8/igt@gem_exec_reloc@basic-wc-cpu.h=
tml">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/=
issues/3281">i915#3281</a>) +5 other tests skip</li>
</ul></li>
<li>
<p>igt@gem_exec_reloc@basic-write-read:</p><ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_19006/shard-rkl-5/igt@gem_exec_reloc@basic-write-read.html">SKIP</a=
> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3281"=
>i915#3281</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/P=
atchwork_169493v3/shard-rkl-6/igt@gem_exec_reloc@basic-write-read.html">SKI=
P</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/1=
4544">i915#14544</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i915/k=
ernel/-/issues/3281">i915#3281</a>) +1 other test skip</li>
</ul></li>
<li>
<p>igt@gem_lmem_swapping@parallel-multi:</p><ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_19006/shard-rkl-5/igt@gem_lmem_swapping@parallel-multi.html">SKIP</=
a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4613=
">i915#4613</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/=
Patchwork_169493v3/shard-rkl-6/igt@gem_lmem_swapping@parallel-multi.html">S=
KIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues=
/14544">i915#14544</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i915=
/kernel/-/issues/4613">i915#4613</a>)</li>
</ul></li>
<li>
<p>igt@gem_lmem_swapping@random-engines:</p><ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_19006/shard-rkl-6/igt@gem_lmem_swapping@random-engines.html">SKIP</=
a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/1454=
4">i915#14544</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i915/kern=
el/-/issues/4613">i915#4613</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.o=
rg/tree/drm-tip/Patchwork_169493v3/shard-rkl-4/igt@gem_lmem_swapping@random=
-engines.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915=
/kernel/-/issues/4613">i915#4613</a>) +1 other test skip</li>
</ul></li>
<li>
<p>igt@gem_set_tiling_vs_blt@tiled-to-untiled:</p><ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_19006/shard-rkl-6/igt@gem_set_tiling_vs_blt@tiled-to-untiled.html">=
SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issue=
s/14544">i915#14544</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i91=
5/kernel/-/issues/8411">i915#8411</a>) -&gt; <a href=3D"https://intel-gfx-c=
i.01.org/tree/drm-tip/Patchwork_169493v3/shard-rkl-1/igt@gem_set_tiling_vs_=
blt@tiled-to-untiled.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.=
org/drm/i915/kernel/-/issues/8411">i915#8411</a>) +1 other test skip</li>
</ul></li>
<li>
<p>igt@gem_set_tiling_vs_pwrite:</p><ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_19006/shard-rkl-6/igt@gem_set_tiling_vs_pwrite.html">SKIP</a> (<a h=
ref=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#=
14544</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/iss=
ues/3282">i915#3282</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/=
drm-tip/Patchwork_169493v3/shard-rkl-8/igt@gem_set_tiling_vs_pwrite.html">S=
KIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues=
/3282">i915#3282</a>) +2 other tests skip</li>
</ul></li>
<li>
<p>igt@gem_userptr_blits@create-destroy-unsync:</p><ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_19006/shard-rkl-5/igt@gem_userptr_blits@create-destroy-unsync.html"=
>SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issu=
es/3297">i915#3297</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/d=
rm-tip/Patchwork_169493v3/shard-rkl-6/igt@gem_userptr_blits@create-destroy-=
unsync.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/k=
ernel/-/issues/14544">i915#14544</a> / <a href=3D"https://gitlab.freedeskto=
p.org/drm/i915/kernel/-/issues/3297">i915#3297</a>)</li>
</ul></li>
<li>
<p>igt@gem_userptr_blits@readonly-unsync:</p><ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_19006/shard-rkl-6/igt@gem_userptr_blits@readonly-unsync.html">SKIP<=
/a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/145=
44">i915#14544</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i915/ker=
nel/-/issues/3297">i915#3297</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.=
org/tree/drm-tip/Patchwork_169493v3/shard-rkl-8/igt@gem_userptr_blits@reado=
nly-unsync.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i9=
15/kernel/-/issues/3297">i915#3297</a>)</li>
</ul></li>
<li>
<p>igt@gem_workarounds@suspend-resume:</p><ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_19006/shard-rkl-6/igt@gem_workarounds@suspend-resume.html">INCOMPLE=
TE</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/=
13356">i915#13356</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/dr=
m-tip/Patchwork_169493v3/shard-rkl-1/igt@gem_workarounds@suspend-resume.htm=
l">ABORT</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/i=
ssues/15152">i915#15152</a>)</li>
</ul></li>
<li>
<p>igt@gen9_exec_parse@allowed-single:</p><ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_19006/shard-rkl-5/igt@gen9_exec_parse@allowed-single.html">SKIP</a>=
 (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2527">=
i915#2527</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/Pa=
tchwork_169493v3/shard-rkl-6/igt@gen9_exec_parse@allowed-single.html">SKIP<=
/a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/145=
44">i915#14544</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i915/ker=
nel/-/issues/2527">i915#2527</a>)</li>
</ul></li>
<li>
<p>igt@gen9_exec_parse@cmd-crossing-page:</p><ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_19006/shard-rkl-6/igt@gen9_exec_parse@cmd-crossing-page.html">SKIP<=
/a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/145=
44">i915#14544</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i915/ker=
nel/-/issues/2527">i915#2527</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.=
org/tree/drm-tip/Patchwork_169493v3/shard-rkl-1/igt@gen9_exec_parse@cmd-cro=
ssing-page.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i9=
15/kernel/-/issues/2527">i915#2527</a>)</li>
</ul></li>
<li>
<p>igt@i915_module_load@resize-bar:</p><ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_19006/shard-rkl-6/igt@i915_module_load@resize-bar.html">SKIP</a> (<=
a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i9=
15#14544</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/=
issues/6412">i915#6412</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tr=
ee/drm-tip/Patchwork_169493v3/shard-rkl-1/igt@i915_module_load@resize-bar.h=
tml">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/=
issues/6412">i915#6412</a>)</li>
</ul></li>
<li>
<p>igt@i915_pm_freq_mult@media-freq@gt0:</p><ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_19006/shard-rkl-6/igt@i915_pm_freq_mult@media-freq@gt0.html">SKIP</=
a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/1454=
4">i915#14544</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i915/kern=
el/-/issues/6590">i915#6590</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.o=
rg/tree/drm-tip/Patchwork_169493v3/shard-rkl-8/igt@i915_pm_freq_mult@media-=
freq@gt0.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915=
/kernel/-/issues/6590">i915#6590</a>) +1 other test skip</li>
</ul></li>
<li>
<p>igt@kms_addfb_basic@invalid-smem-bo-on-discrete:</p><ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_19006/shard-rkl-5/igt@kms_addfb_basic@invalid-smem-bo-on-discrete.h=
tml">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/=
issues/12454">i915#12454</a> / <a href=3D"https://gitlab.freedesktop.org/dr=
m/i915/kernel/-/issues/12712">i915#12712</a>) -&gt; <a href=3D"https://inte=
l-gfx-ci.01.org/tree/drm-tip/Patchwork_169493v3/shard-rkl-6/igt@kms_addfb_b=
asic@invalid-smem-bo-on-discrete.html">SKIP</a> (<a href=3D"https://gitlab.=
freedesktop.org/drm/i915/kernel/-/issues/12454">i915#12454</a> / <a href=3D=
"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12712">i915#12712<=
/a> / <a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14=
544">i915#14544</a>)</li>
</ul></li>
<li>
<p>igt@kms_big_fb@4-tiled-32bpp-rotate-180:</p><ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_19006/shard-rkl-5/igt@kms_big_fb@4-tiled-32bpp-rotate-180.html">SKI=
P</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5=
286">i915#5286</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-t=
ip/Patchwork_169493v3/shard-rkl-6/igt@kms_big_fb@4-tiled-32bpp-rotate-180.h=
tml">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/=
issues/14544">i915#14544</a> / <a href=3D"https://gitlab.freedesktop.org/dr=
m/i915/kernel/-/issues/5286">i915#5286</a>) +1 other test skip</li>
</ul></li>
<li>
<p>igt@kms_big_fb@4-tiled-32bpp-rotate-270:</p><ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_19006/shard-rkl-6/igt@kms_big_fb@4-tiled-32bpp-rotate-270.html">SKI=
P</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/1=
4544">i915#14544</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i915/k=
ernel/-/issues/5286">i915#5286</a>) -&gt; <a href=3D"https://intel-gfx-ci.0=
1.org/tree/drm-tip/Patchwork_169493v3/shard-rkl-8/igt@kms_big_fb@4-tiled-32=
bpp-rotate-270.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/dr=
m/i915/kernel/-/issues/5286">i915#5286</a>) +2 other tests skip</li>
</ul></li>
<li>
<p>igt@kms_big_fb@x-tiled-16bpp-rotate-90:</p><ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_19006/shard-rkl-6/igt@kms_big_fb@x-tiled-16bpp-rotate-90.html">SKIP=
</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14=
544">i915#14544</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i915/ke=
rnel/-/issues/3638">i915#3638</a>) -&gt; <a href=3D"https://intel-gfx-ci.01=
.org/tree/drm-tip/Patchwork_169493v3/shard-rkl-8/igt@kms_big_fb@x-tiled-16b=
pp-rotate-90.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/=
i915/kernel/-/issues/3638">i915#3638</a>)</li>
</ul></li>
<li>
<p>igt@kms_ccs@bad-aux-stride-4-tiled-mtl-rc-ccs-cc:</p><ul>
<li>shard-dg1:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_19006/shard-dg1-16/igt@kms_ccs@bad-aux-stride-4-tiled-mtl-rc-ccs-cc=
.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/=
-/issues/4423">i915#4423</a> / <a href=3D"https://gitlab.freedesktop.org/dr=
m/i915/kernel/-/issues/6095">i915#6095</a>) -&gt; <a href=3D"https://intel-=
gfx-ci.01.org/tree/drm-tip/Patchwork_169493v3/shard-dg1-17/igt@kms_ccs@bad-=
aux-stride-4-tiled-mtl-rc-ccs-cc.html">SKIP</a> (<a href=3D"https://gitlab.=
freedesktop.org/drm/i915/kernel/-/issues/6095">i915#6095</a>) +1 other test=
 skip</li>
</ul></li>
<li>
<p>igt@kms_ccs@crc-primary-suspend-4-tiled-dg2-rc-ccs-cc@pipe-a-hdmi-a-2:</=
p><ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_19006/shard-rkl-6/igt@kms_ccs@crc-primary-suspend-4-tiled-dg2-rc-cc=
s-cc@pipe-a-hdmi-a-2.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.=
org/drm/i915/kernel/-/issues/14544">i915#14544</a> / <a href=3D"https://git=
lab.freedesktop.org/drm/i915/kernel/-/issues/6095">i915#6095</a>) -&gt; <a =
href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_169493v3/shard-r=
kl-4/igt@kms_ccs@crc-primary-suspend-4-tiled-dg2-rc-ccs-cc@pipe-a-hdmi-a-2.=
html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-=
/issues/6095">i915#6095</a>) +7 other tests skip</li>
</ul></li>
<li>
<p>igt@kms_ccs@crc-primary-suspend-4-tiled-dg2-rc-ccs-cc@pipe-c-hdmi-a-2:</=
p><ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_19006/shard-rkl-6/igt@kms_ccs@crc-primary-suspend-4-tiled-dg2-rc-cc=
s-cc@pipe-c-hdmi-a-2.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.=
org/drm/i915/kernel/-/issues/14098">i915#14098</a> / <a href=3D"https://git=
lab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a> / <a hre=
f=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6095">i915#609=
5</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_=
169493v3/shard-rkl-4/igt@kms_ccs@crc-primary-suspend-4-tiled-dg2-rc-ccs-cc@=
pipe-c-hdmi-a-2.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/d=
rm/i915/kernel/-/issues/14098">i915#14098</a> / <a href=3D"https://gitlab.f=
reedesktop.org/drm/i915/kernel/-/issues/6095">i915#6095</a>) +11 other test=
s skip</li>
</ul></li>
<li>
<p>igt@kms_ccs@random-ccs-data-4-tiled-mtl-rc-ccs:</p><ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_19006/shard-rkl-5/igt@kms_ccs@random-ccs-data-4-tiled-mtl-rc-ccs.ht=
ml">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/i=
ssues/14098">i915#14098</a> / <a href=3D"https://gitlab.freedesktop.org/drm=
/i915/kernel/-/issues/6095">i915#6095</a>) -&gt; <a href=3D"https://intel-g=
fx-ci.01.org/tree/drm-tip/Patchwork_169493v3/shard-rkl-6/igt@kms_ccs@random=
-ccs-data-4-tiled-mtl-rc-ccs.html">SKIP</a> (<a href=3D"https://gitlab.free=
desktop.org/drm/i915/kernel/-/issues/14098">i915#14098</a> / <a href=3D"htt=
ps://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a> =
/ <a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6095">=
i915#6095</a>) +3 other tests skip</li>
</ul></li>
<li>
<p>igt@kms_chamelium_color_pipeline@plane-ctm3x4:</p><ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_19006/shard-rkl-5/igt@kms_chamelium_color_pipeline@plane-ctm3x4.htm=
l">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/is=
sues/16471">i915#16471</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tr=
ee/drm-tip/Patchwork_169493v3/shard-rkl-6/igt@kms_chamelium_color_pipeline@=
plane-ctm3x4.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/=
i915/kernel/-/issues/14544">i915#14544</a> / <a href=3D"https://gitlab.free=
desktop.org/drm/i915/kernel/-/issues/16471">i915#16471</a>)</li>
</ul></li>
<li>
<p>igt@kms_chamelium_edid@hdmi-edid-stress-resolution-non-4k:</p><ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_19006/shard-rkl-6/igt@kms_chamelium_edid@hdmi-edid-stress-resolutio=
n-non-4k.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915=
/kernel/-/issues/11151">i915#11151</a> / <a href=3D"https://gitlab.freedesk=
top.org/drm/i915/kernel/-/issues/14544">i915#14544</a> / <a href=3D"https:/=
/gitlab.freedesktop.org/drm/i915/kernel/-/issues/7828">i915#7828</a>) -&gt;=
 <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_169493v3/sha=
rd-rkl-1/igt@kms_chamelium_edid@hdmi-edid-stress-resolution-non-4k.html">SK=
IP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/=
11151">i915#11151</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i915/=
kernel/-/issues/7828">i915#7828</a>) +4 other tests skip</li>
</ul></li>
<li>
<p>igt@kms_chamelium_frames@hdmi-crc-nonplanar-formats:</p><ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_19006/shard-rkl-5/igt@kms_chamelium_frames@hdmi-crc-nonplanar-forma=
ts.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kerne=
l/-/issues/11151">i915#11151</a> / <a href=3D"https://gitlab.freedesktop.or=
g/drm/i915/kernel/-/issues/7828">i915#7828</a>) -&gt; <a href=3D"https://in=
tel-gfx-ci.01.org/tree/drm-tip/Patchwork_169493v3/shard-rkl-6/igt@kms_chame=
lium_frames@hdmi-crc-nonplanar-formats.html">SKIP</a> (<a href=3D"https://g=
itlab.freedesktop.org/drm/i915/kernel/-/issues/11151">i915#11151</a> / <a h=
ref=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#=
14544</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/iss=
ues/7828">i915#7828</a>) +1 other test skip</li>
</ul></li>
<li>
<p>igt@kms_content_protection@atomic-hdcp14:</p><ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_19006/shard-rkl-5/igt@kms_content_protection@atomic-hdcp14.html">SK=
IP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/=
15865">i915#15865</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/dr=
m-tip/Patchwork_169493v3/shard-rkl-6/igt@kms_content_protection@atomic-hdcp=
14.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kerne=
l/-/issues/14544">i915#14544</a> / <a href=3D"https://gitlab.freedesktop.or=
g/drm/i915/kernel/-/issues/15865">i915#15865</a>)</li>
</ul></li>
<li>
<p>igt@kms_content_protection@dp-mst-type-1-suspend-resume:</p><ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_19006/shard-rkl-6/igt@kms_content_protection@dp-mst-type-1-suspend-=
resume.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/k=
ernel/-/issues/14544">i915#14544</a> / <a href=3D"https://gitlab.freedeskto=
p.org/drm/i915/kernel/-/issues/15330">i915#15330</a>) -&gt; <a href=3D"http=
s://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_169493v3/shard-rkl-1/igt@kms=
_content_protection@dp-mst-type-1-suspend-resume.html">SKIP</a> (<a href=3D=
"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15330">i915#15330<=
/a>)</li>
</ul></li>
<li>
<p>igt@kms_content_protection@mei-interface:</p><ul>
<li>shard-dg1:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_19006/shard-dg1-16/igt@kms_content_protection@mei-interface.html">S=
KIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues=
/15865">i915#15865</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/d=
rm-tip/Patchwork_169493v3/shard-dg1-12/igt@kms_content_protection@mei-inter=
face.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/ker=
nel/-/issues/9433">i915#9433</a>)</li>
</ul></li>
<li>
<p>igt@kms_cursor_crc@cursor-onscreen-max-size:</p><ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_19006/shard-rkl-6/igt@kms_cursor_crc@cursor-onscreen-max-size.html"=
>SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issu=
es/14544">i915#14544</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i9=
15/kernel/-/issues/3555">i915#3555</a>) -&gt; <a href=3D"https://intel-gfx-=
ci.01.org/tree/drm-tip/Patchwork_169493v3/shard-rkl-5/igt@kms_cursor_crc@cu=
rsor-onscreen-max-size.html">SKIP</a> (<a href=3D"https://gitlab.freedeskto=
p.org/drm/i915/kernel/-/issues/3555">i915#3555</a>) +1 other test skip</li>
</ul></li>
<li>
<p>igt@kms_cursor_legacy@flip-vs-cursor-atomic-transitions-varying-size:</p=
><ul>
<li>shard-glk:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_19006/shard-glk9/igt@kms_cursor_legacy@flip-vs-cursor-atomic-transi=
tions-varying-size.html">FAIL</a> (<a href=3D"https://gitlab.freedesktop.or=
g/drm/i915/kernel/-/issues/15804">i915#15804</a>) -&gt; <a href=3D"https://=
intel-gfx-ci.01.org/tree/drm-tip/Patchwork_169493v3/shard-glk3/igt@kms_curs=
or_legacy@flip-vs-cursor-atomic-transitions-varying-size.html">FAIL</a> (<a=
 href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15768">i91=
5#15768</a>)</li>
</ul></li>
<li>
<p>igt@kms_cursor_legacy@short-busy-flip-before-cursor-atomic-transitions-v=
arying-size:</p><ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_19006/shard-rkl-6/igt@kms_cursor_legacy@short-busy-flip-before-curs=
or-atomic-transitions-varying-size.html">SKIP</a> (<a href=3D"https://gitla=
b.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a> / <a href=
=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4103">i915#4103=
</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_1=
69493v3/shard-rkl-8/igt@kms_cursor_legacy@short-busy-flip-before-cursor-ato=
mic-transitions-varying-size.html">SKIP</a> (<a href=3D"https://gitlab.free=
desktop.org/drm/i915/kernel/-/issues/4103">i915#4103</a>)</li>
</ul></li>
<li>
<p>igt@kms_dirtyfb@psr-dirtyfb-ioctl:</p><ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_19006/shard-rkl-6/igt@kms_dirtyfb@psr-dirtyfb-ioctl.html">SKIP</a> =
(<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">=
i915#14544</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/=
-/issues/9723">i915#9723</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/Patchwork_169493v3/shard-rkl-4/igt@kms_dirtyfb@psr-dirtyfb-ioc=
tl.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kerne=
l/-/issues/9723">i915#9723</a>)</li>
</ul></li>
<li>
<p>igt@kms_dsc@dsc-with-output-formats-ultrajoiner:</p><ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_19006/shard-rkl-5/igt@kms_dsc@dsc-with-output-formats-ultrajoiner.h=
tml">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/=
issues/16361">i915#16361</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/Patchwork_169493v3/shard-rkl-6/igt@kms_dsc@dsc-with-output-for=
mats-ultrajoiner.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/=
drm/i915/kernel/-/issues/14544">i915#14544</a> / <a href=3D"https://gitlab.=
freedesktop.org/drm/i915/kernel/-/issues/16361">i915#16361</a>)</li>
</ul></li>
<li>
<p>igt@kms_dsc@dsc-with-output-formats-with-bpc-ultrajoiner:</p><ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_19006/shard-rkl-6/igt@kms_dsc@dsc-with-output-formats-with-bpc-ultr=
ajoiner.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/=
kernel/-/issues/14544">i915#14544</a> / <a href=3D"https://gitlab.freedeskt=
op.org/drm/i915/kernel/-/issues/16361">i915#16361</a>) -&gt; <a href=3D"htt=
ps://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_169493v3/shard-rkl-1/igt@km=
s_dsc@dsc-with-output-formats-with-bpc-ultrajoiner.html">SKIP</a> (<a href=
=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16361">i915#163=
61</a>)</li>
</ul></li>
<li>
<p>igt@kms_fbcon_fbt@psr:</p><ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_19006/shard-rkl-6/igt@kms_fbcon_fbt@psr.html">SKIP</a> (<a href=3D"=
https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14544</=
a> / <a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/166=
80">i915#16680</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-t=
ip/Patchwork_169493v3/shard-rkl-8/igt@kms_fbcon_fbt@psr.html">SKIP</a> (<a =
href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16680">i915=
#16680</a>)</li>
</ul></li>
<li>
<p>igt@kms_feature_discovery@psr1:</p><ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_19006/shard-rkl-6/igt@kms_feature_discovery@psr1.html">SKIP</a> (<a=
 href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i91=
5#14544</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/i=
ssues/658">i915#658</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/=
drm-tip/Patchwork_169493v3/shard-rkl-8/igt@kms_feature_discovery@psr1.html"=
>SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issu=
es/658">i915#658</a>)</li>
</ul></li>
<li>
<p>igt@kms_flip@2x-absolute-wf_vblank:</p><ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_19006/shard-rkl-6/igt@kms_flip@2x-absolute-wf_vblank.html">SKIP</a>=
 (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544"=
>i915#14544</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel=
/-/issues/9934">i915#9934</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/Patchwork_169493v3/shard-rkl-8/igt@kms_flip@2x-absolute-wf_vb=
lank.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/ker=
nel/-/issues/9934">i915#9934</a>) +6 other tests skip</li>
</ul></li>
<li>
<p>igt@kms_flip@2x-flip-vs-panning:</p><ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_19006/shard-rkl-5/igt@kms_flip@2x-flip-vs-panning.html">SKIP</a> (<=
a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9934">i91=
5#9934</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/Patch=
work_169493v3/shard-rkl-6/igt@kms_flip@2x-flip-vs-panning.html">SKIP</a> (<=
a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i9=
15#14544</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/=
issues/9934">i915#9934</a>) +2 other tests skip</li>
</ul></li>
<li>
<p>igt@kms_flip@flip-vs-suspend:</p><ul>
<li>shard-glk:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_19006/shard-glk8/igt@kms_flip@flip-vs-suspend.html">INCOMPLETE</a> =
(<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12314">=
i915#12314</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/=
-/issues/12745">i915#12745</a> / <a href=3D"https://gitlab.freedesktop.org/=
drm/i915/kernel/-/issues/4839">i915#4839</a>) -&gt; <a href=3D"https://inte=
l-gfx-ci.01.org/tree/drm-tip/Patchwork_169493v3/shard-glk1/igt@kms_flip@fli=
p-vs-suspend.html">INCOMPLETE</a> (<a href=3D"https://gitlab.freedesktop.or=
g/drm/i915/kernel/-/issues/12745">i915#12745</a> / <a href=3D"https://gitla=
b.freedesktop.org/drm/i915/kernel/-/issues/4839">i915#4839</a> / <a href=3D=
"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6113">i915#6113</a=
>)</li>
</ul></li>
<li>
<p>igt@kms_flip@flip-vs-suspend-interruptible:</p><ul>
<li>shard-glk:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_19006/shard-glk6/igt@kms_flip@flip-vs-suspend-interruptible.html">I=
NCOMPLETE</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/=
issues/12745">i915#12745</a> / <a href=3D"https://gitlab.freedesktop.org/dr=
m/i915/kernel/-/issues/4839">i915#4839</a>) -&gt; <a href=3D"https://intel-=
gfx-ci.01.org/tree/drm-tip/Patchwork_169493v3/shard-glk5/igt@kms_flip@flip-=
vs-suspend-interruptible.html">INCOMPLETE</a> (<a href=3D"https://gitlab.fr=
eedesktop.org/drm/i915/kernel/-/issues/12314">i915#12314</a> / <a href=3D"h=
ttps://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12745">i915#12745</a=
> / <a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4839=
">i915#4839</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel=
/-/issues/6113">i915#6113</a>)</li>
</ul></li>
<li>
<p>igt@kms_flip@flip-vs-suspend-interruptible@a-hdmi-a1:</p><ul>
<li>shard-glk:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_19006/shard-glk6/igt@kms_flip@flip-vs-suspend-interruptible@a-hdmi-=
a1.html">INCOMPLETE</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915=
/kernel/-/issues/12745">i915#12745</a>) -&gt; <a href=3D"https://intel-gfx-=
ci.01.org/tree/drm-tip/Patchwork_169493v3/shard-glk5/igt@kms_flip@flip-vs-s=
uspend-interruptible@a-hdmi-a1.html">INCOMPLETE</a> (<a href=3D"https://git=
lab.freedesktop.org/drm/i915/kernel/-/issues/12314">i915#12314</a> / <a hre=
f=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12745">i915#12=
745</a>)</li>
</ul></li>
<li>
<p>igt@kms_flip@flip-vs-suspend@a-hdmi-a1:</p><ul>
<li>shard-glk:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_19006/shard-glk8/igt@kms_flip@flip-vs-suspend@a-hdmi-a1.html">INCOM=
PLETE</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issu=
es/12314">i915#12314</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i9=
15/kernel/-/issues/12745">i915#12745</a>) -&gt; <a href=3D"https://intel-gf=
x-ci.01.org/tree/drm-tip/Patchwork_169493v3/shard-glk1/igt@kms_flip@flip-vs=
-suspend@a-hdmi-a1.html">INCOMPLETE</a> (<a href=3D"https://gitlab.freedesk=
top.org/drm/i915/kernel/-/issues/12745">i915#12745</a> / <a href=3D"https:/=
/gitlab.freedesktop.org/drm/i915/kernel/-/issues/6113">i915#6113</a>)</li>
</ul></li>
<li>
<p>igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-16bpp-yftile-upscaling:</p>=
<ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_19006/shard-rkl-6/igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-16bp=
p-yftile-upscaling.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.or=
g/drm/i915/kernel/-/issues/14544">i915#14544</a> / <a href=3D"https://gitla=
b.freedesktop.org/drm/i915/kernel/-/issues/15643">i915#15643</a>) -&gt; <a =
href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_169493v3/shard-r=
kl-4/igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-16bpp-yftile-upscaling.ht=
ml">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/i=
ssues/15643">i915#15643</a>)</li>
</ul></li>
<li>
<p>igt@kms_frontbuffer_tracking@fbchdr-2p-primscrn-cur-indfb-draw-mmap-cpu:=
</p><ul>
<li>shard-dg1:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_19006/shard-dg1-19/igt@kms_frontbuffer_tracking@fbchdr-2p-primscrn-=
cur-indfb-draw-mmap-cpu.html">SKIP</a> (<a href=3D"https://gitlab.freedeskt=
op.org/drm/i915/kernel/-/issues/4423">i915#4423</a>) -&gt; <a href=3D"https=
://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_169493v3/shard-dg1-17/igt@kms=
_frontbuffer_tracking@fbchdr-2p-primscrn-cur-indfb-draw-mmap-cpu.html">SKIP=
</a></li>
</ul></li>
<li>
<p>igt@kms_frontbuffer_tracking@fbchdr-tiling-4:</p><ul>
<li>shard-dg1:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_19006/shard-dg1-16/igt@kms_frontbuffer_tracking@fbchdr-tiling-4.htm=
l">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/is=
sues/4423">i915#4423</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i9=
15/kernel/-/issues/5439">i915#5439</a>) -&gt; <a href=3D"https://intel-gfx-=
ci.01.org/tree/drm-tip/Patchwork_169493v3/shard-dg1-17/igt@kms_frontbuffer_=
tracking@fbchdr-tiling-4.html">SKIP</a> (<a href=3D"https://gitlab.freedesk=
top.org/drm/i915/kernel/-/issues/5439">i915#5439</a>)</li>
</ul></li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-pri-shrfb-draw-mmap-gtt:=
</p><ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_19006/shard-rkl-5/igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-p=
ri-shrfb-draw-mmap-gtt.html">SKIP</a> (<a href=3D"https://gitlab.freedeskto=
p.org/drm/i915/kernel/-/issues/15102">i915#15102</a>) -&gt; <a href=3D"http=
s://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_169493v3/shard-rkl-6/igt@kms=
_frontbuffer_tracking@fbcpsr-1p-primscrn-pri-shrfb-draw-mmap-gtt.html">SKIP=
</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14=
544">i915#14544</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i915/ke=
rnel/-/issues/15102">i915#15102</a>) +6 other tests skip</li>
</ul></li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-pri-shrfb-draw-blt:</p><=
ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_19006/shard-rkl-5/igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-p=
ri-shrfb-draw-blt.html">SKIP</a> -&gt; <a href=3D"https://intel-gfx-ci.01.o=
rg/tree/drm-tip/Patchwork_169493v3/shard-rkl-6/igt@kms_frontbuffer_tracking=
@fbcpsr-2p-primscrn-pri-shrfb-draw-blt.html">SKIP</a> (<a href=3D"https://g=
itlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a>) +18 o=
ther tests skip</li>
</ul></li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-spr-indfb-draw-mmap-gtt:=
</p><ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_19006/shard-rkl-6/igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-s=
pr-indfb-draw-mmap-gtt.html">SKIP</a> (<a href=3D"https://gitlab.freedeskto=
p.org/drm/i915/kernel/-/issues/14544">i915#14544</a> / <a href=3D"https://g=
itlab.freedesktop.org/drm/i915/kernel/-/issues/1825">i915#1825</a>) -&gt; <=
a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_169493v3/shard=
-rkl-4/igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-spr-indfb-draw-mmap-=
gtt.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kern=
el/-/issues/1825">i915#1825</a>) +2 other tests skip</li>
</ul></li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-rgb101010-draw-mmap-wc:</p><ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_19006/shard-rkl-6/igt@kms_frontbuffer_tracking@fbcpsr-rgb101010-dra=
w-mmap-wc.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i91=
5/kernel/-/issues/14544">i915#14544</a> / <a href=3D"https://gitlab.freedes=
ktop.org/drm/i915/kernel/-/issues/15102">i915#15102</a>) -&gt; <a href=3D"h=
ttps://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_169493v3/shard-rkl-4/igt@=
kms_frontbuffer_tracking@fbcpsr-rgb101010-draw-mmap-wc.html">SKIP</a> (<a h=
ref=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15102">i915#=
15102</a>) +24 other tests skip</li>
</ul></li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsrhdr-tiling-4:</p><ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_19006/shard-rkl-6/igt@kms_frontbuffer_tracking@fbcpsrhdr-tiling-4.h=
tml">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/=
issues/14544">i915#14544</a> / <a href=3D"https://gitlab.freedesktop.org/dr=
m/i915/kernel/-/issues/5439">i915#5439</a>) -&gt; <a href=3D"https://intel-=
gfx-ci.01.org/tree/drm-tip/Patchwork_169493v3/shard-rkl-4/igt@kms_frontbuff=
er_tracking@fbcpsrhdr-tiling-4.html">SKIP</a> (<a href=3D"https://gitlab.fr=
eedesktop.org/drm/i915/kernel/-/issues/5439">i915#5439</a>)</li>
</ul></li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-2p-primscrn-spr-indfb-draw-mmap-wc:</p>=
<ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_19006/shard-rkl-5/igt@kms_frontbuffer_tracking@psr-2p-primscrn-spr-=
indfb-draw-mmap-wc.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.or=
g/drm/i915/kernel/-/issues/1825">i915#1825</a>) -&gt; <a href=3D"https://in=
tel-gfx-ci.01.org/tree/drm-tip/Patchwork_169493v3/shard-rkl-6/igt@kms_front=
buffer_tracking@psr-2p-primscrn-spr-indfb-draw-mmap-wc.html">SKIP</a> (<a h=
ref=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#=
14544</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/iss=
ues/1825">i915#1825</a>) +1 other test skip</li>
</ul></li>
<li>
<p>igt@kms_frontbuffer_tracking@psrhdr-2p-scndscrn-cur-indfb-move:</p><ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_19006/shard-rkl-6/igt@kms_frontbuffer_tracking@psrhdr-2p-scndscrn-c=
ur-indfb-move.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm=
/i915/kernel/-/issues/14544">i915#14544</a>) -&gt; <a href=3D"https://intel=
-gfx-ci.01.org/tree/drm-tip/Patchwork_169493v3/shard-rkl-4/igt@kms_frontbuf=
fer_tracking@psrhdr-2p-scndscrn-cur-indfb-move.html">SKIP</a> +54 other tes=
ts skip</li>
</ul></li>
<li>
<p>igt@kms_frontbuffer_tracking@psrhdr-modesetfrombusy:</p><ul>
<li>shard-dg1:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_19006/shard-dg1-16/igt@kms_frontbuffer_tracking@psrhdr-modesetfromb=
usy.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kern=
el/-/issues/15102">i915#15102</a> / <a href=3D"https://gitlab.freedesktop.o=
rg/drm/i915/kernel/-/issues/4423">i915#4423</a>) -&gt; <a href=3D"https://i=
ntel-gfx-ci.01.org/tree/drm-tip/Patchwork_169493v3/shard-dg1-17/igt@kms_fro=
ntbuffer_tracking@psrhdr-modesetfrombusy.html">SKIP</a> (<a href=3D"https:/=
/gitlab.freedesktop.org/drm/i915/kernel/-/issues/15102">i915#15102</a>)</li=
>
</ul></li>
<li>
<p>igt@kms_hdr@bpc-switch-suspend:</p><ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_19006/shard-rkl-3/igt@kms_hdr@bpc-switch-suspend.html">SKIP</a> (<a=
 href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16644">i91=
5#16644</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/i=
ssues/3555">i915#3555</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i=
915/kernel/-/issues/8228">i915#8228</a>) -&gt; <a href=3D"https://intel-gfx=
-ci.01.org/tree/drm-tip/Patchwork_169493v3/shard-rkl-6/igt@kms_hdr@bpc-swit=
ch-suspend.html">INCOMPLETE</a> (<a href=3D"https://gitlab.freedesktop.org/=
drm/i915/kernel/-/issues/15436">i915#15436</a>)</li>
</ul></li>
<li>
<p>igt@kms_joiner@basic-force-ultra-joiner:</p><ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_19006/shard-rkl-6/igt@kms_joiner@basic-force-ultra-joiner.html">SKI=
P</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/1=
4544">i915#14544</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i915/k=
ernel/-/issues/15458">i915#15458</a>) -&gt; <a href=3D"https://intel-gfx-ci=
.01.org/tree/drm-tip/Patchwork_169493v3/shard-rkl-4/igt@kms_joiner@basic-fo=
rce-ultra-joiner.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/=
drm/i915/kernel/-/issues/15458">i915#15458</a>)</li>
</ul></li>
<li>
<p>igt@kms_joiner@switch-modeset-ultra-joiner-big-joiner:</p><ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_19006/shard-rkl-6/igt@kms_joiner@switch-modeset-ultra-joiner-big-jo=
iner.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/ker=
nel/-/issues/14544">i915#14544</a> / <a href=3D"https://gitlab.freedesktop.=
org/drm/i915/kernel/-/issues/15638">i915#15638</a> / <a href=3D"https://git=
lab.freedesktop.org/drm/i915/kernel/-/issues/15722">i915#15722</a>) -&gt; <=
a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_169493v3/shard=
-rkl-4/igt@kms_joiner@switch-modeset-ultra-joiner-big-joiner.html">SKIP</a>=
 (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15638"=
>i915#15638</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel=
/-/issues/15722">i915#15722</a>)</li>
</ul></li>
<li>
<p>igt@kms_plane@pixel-format-yf-tiled-modifier:</p><ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_19006/shard-rkl-6/igt@kms_plane@pixel-format-yf-tiled-modifier.html=
">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/iss=
ues/14544">i915#14544</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i=
915/kernel/-/issues/15709">i915#15709</a>) -&gt; <a href=3D"https://intel-g=
fx-ci.01.org/tree/drm-tip/Patchwork_169493v3/shard-rkl-8/igt@kms_plane@pixe=
l-format-yf-tiled-modifier.html">SKIP</a> (<a href=3D"https://gitlab.freede=
sktop.org/drm/i915/kernel/-/issues/15709">i915#15709</a>) +2 other tests sk=
ip</li>
</ul></li>
<li>
<p>igt@kms_plane_multiple@2x-tiling-none:</p><ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_19006/shard-rkl-6/igt@kms_plane_multiple@2x-tiling-none.html">SKIP<=
/a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/139=
58">i915#13958</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i915/ker=
nel/-/issues/14544">i915#14544</a>) -&gt; <a href=3D"https://intel-gfx-ci.0=
1.org/tree/drm-tip/Patchwork_169493v3/shard-rkl-4/igt@kms_plane_multiple@2x=
-tiling-none.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/=
i915/kernel/-/issues/13958">i915#13958</a>)</li>
</ul></li>
<li>
<p>igt@kms_plane_multiple@tiling-yf:</p><ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_19006/shard-rkl-6/igt@kms_plane_multiple@tiling-yf.html">SKIP</a> (=
<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14259">i=
915#14259</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-=
/issues/14544">i915#14544</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/Patchwork_169493v3/shard-rkl-1/igt@kms_plane_multiple@tiling-=
yf.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kerne=
l/-/issues/14259">i915#14259</a>)</li>
</ul></li>
<li>
<p>igt@kms_pm_dc@dc6-dpms:</p><ul>
<li>shard-tglu:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_19006/shard-tglu-9/igt@kms_pm_dc@dc6-dpms.html">FAIL</a> (<a href=
=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16479">i915#164=
79</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork=
_169493v3/shard-tglu-6/igt@kms_pm_dc@dc6-dpms.html">SKIP</a> (<a href=3D"ht=
tps://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15128">i915#15128</a>=
)</li>
</ul></li>
<li>
<p>igt@kms_pm_dc@dc9-dpms:</p><ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_19006/shard-rkl-6/igt@kms_pm_dc@dc9-dpms.html">SKIP</a> (<a href=3D=
"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14544<=
/a> / <a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15=
739">i915#15739</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-=
tip/Patchwork_169493v3/shard-rkl-4/igt@kms_pm_dc@dc9-dpms.html">SKIP</a> (<=
a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15739">i9=
15#15739</a>)</li>
</ul></li>
<li>
<p>igt@kms_pm_lpsp@kms-lpsp:</p><ul>
<li>shard-dg1:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_19006/shard-dg1-18/igt@kms_pm_lpsp@kms-lpsp.html">SKIP</a> (<a href=
=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9340">i915#9340=
</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_1=
69493v3/shard-dg1-15/igt@kms_pm_lpsp@kms-lpsp.html">SKIP</a> (<a href=3D"ht=
tps://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3828">i915#3828</a>)<=
/li>
</ul></li>
<li>
<p>igt@kms_pm_rpm@package-g7:</p><ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_19006/shard-rkl-6/igt@kms_pm_rpm@package-g7.html">SKIP</a> (<a href=
=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#145=
44</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues=
/15403">i915#15403</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/d=
rm-tip/Patchwork_169493v3/shard-rkl-1/igt@kms_pm_rpm@package-g7.html">SKIP<=
/a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/154=
03">i915#15403</a>)</li>
</ul></li>
<li>
<p>igt@kms_psr2_sf@pr-cursor-plane-move-continuous-exceed-sf:</p><ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_19006/shard-rkl-5/igt@kms_psr2_sf@pr-cursor-plane-move-continuous-e=
xceed-sf.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915=
/kernel/-/issues/11520">i915#11520</a>) -&gt; <a href=3D"https://intel-gfx-=
ci.01.org/tree/drm-tip/Patchwork_169493v3/shard-rkl-6/igt@kms_psr2_sf@pr-cu=
rsor-plane-move-continuous-exceed-sf.html">SKIP</a> (<a href=3D"https://git=
lab.freedesktop.org/drm/i915/kernel/-/issues/11520">i915#11520</a> / <a hre=
f=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14=
544</a>)</li>
</ul></li>
<li>
<p>igt@kms_psr2_sf@psr2-overlay-plane-update-sf-dmg-area:</p><ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_19006/shard-rkl-6/igt@kms_psr2_sf@psr2-overlay-plane-update-sf-dmg-=
area.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/ker=
nel/-/issues/11520">i915#11520</a> / <a href=3D"https://gitlab.freedesktop.=
org/drm/i915/kernel/-/issues/14544">i915#14544</a>) -&gt; <a href=3D"https:=
//intel-gfx-ci.01.org/tree/drm-tip/Patchwork_169493v3/shard-rkl-8/igt@kms_p=
sr2_sf@psr2-overlay-plane-update-sf-dmg-area.html">SKIP</a> (<a href=3D"htt=
ps://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11520">i915#11520</a>)=
 +2 other tests skip</li>
</ul></li>
<li>
<p>igt@kms_psr@pr-basic:</p><ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_19006/shard-rkl-5/igt@kms_psr@pr-basic.html">SKIP</a> (<a href=3D"h=
ttps://gitlab.freedesktop.org/drm/i915/kernel/-/issues/1072">i915#1072</a> =
/ <a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9732">=
i915#9732</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/Pa=
tchwork_169493v3/shard-rkl-6/igt@kms_psr@pr-basic.html">SKIP</a> (<a href=
=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/1072">i915#1072=
</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/1=
4544">i915#14544</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i915/k=
ernel/-/issues/9732">i915#9732</a>) +2 other tests skip</li>
</ul></li>
<li>
<p>igt@kms_psr@psr2-sprite-mmap-cpu:</p><ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_19006/shard-rkl-6/igt@kms_psr@psr2-sprite-mmap-cpu.html">SKIP</a> (=
<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/1072">i9=
15#1072</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/i=
ssues/14544">i915#14544</a> / <a href=3D"https://gitlab.freedesktop.org/drm=
/i915/kernel/-/issues/9732">i915#9732</a>) -&gt; <a href=3D"https://intel-g=
fx-ci.01.org/tree/drm-tip/Patchwork_169493v3/shard-rkl-1/igt@kms_psr@psr2-s=
prite-mmap-cpu.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/dr=
m/i915/kernel/-/issues/1072">i915#1072</a> / <a href=3D"https://gitlab.free=
desktop.org/drm/i915/kernel/-/issues/9732">i915#9732</a>) +12 other tests s=
kip</li>
</ul></li>
<li>
<p>igt@kms_rotation_crc@primary-yf-tiled-reflect-x-180:</p><ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_19006/shard-rkl-5/igt@kms_rotation_crc@primary-yf-tiled-reflect-x-1=
80.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kerne=
l/-/issues/5289">i915#5289</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.or=
g/tree/drm-tip/Patchwork_169493v3/shard-rkl-6/igt@kms_rotation_crc@primary-=
yf-tiled-reflect-x-180.html">SKIP</a> (<a href=3D"https://gitlab.freedeskto=
p.org/drm/i915/kernel/-/issues/14544">i915#14544</a> / <a href=3D"https://g=
itlab.freedesktop.org/drm/i915/kernel/-/issues/5289">i915#5289</a>)</li>
</ul></li>
<li>
<p>igt@kms_vrr@negative-basic:</p><ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_19006/shard-rkl-6/igt@kms_vrr@negative-basic.html">SKIP</a> (<a hre=
f=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14=
544</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issue=
s/3555">i915#3555</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i915/=
kernel/-/issues/9906">i915#9906</a>) -&gt; <a href=3D"https://intel-gfx-ci.=
01.org/tree/drm-tip/Patchwork_169493v3/shard-rkl-8/igt@kms_vrr@negative-bas=
ic.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kerne=
l/-/issues/3555">i915#3555</a> / <a href=3D"https://gitlab.freedesktop.org/=
drm/i915/kernel/-/issues/9906">i915#9906</a>)</li>
</ul></li>
</ul><h2>Build changes</h2><ul>
<li>Linux: CI_DRM_19006 -&gt; Patchwork_169493v3</li>
</ul><p>CI-20190529: 20190529<br> CI_DRM_19006: b801f94c49ffdb0f65e37baf31d=
68570356d4983 @ git://anongit.freedesktop.org/gfx-ci/linux<br> IGT_9057: 8f=
7d5198bdb1c5af7c97b967a0bcbe77b653e8a0 @ https://gitlab.freedesktop.org/drm=
/igt-gpu-tools.git<br> Patchwork_169493v3: b801f94c49ffdb0f65e37baf31d68570=
356d4983 @ git://anongit.freedesktop.org/gfx-ci/linux<br> piglit_4509: fdc5=
a4ca11124ab8413c7988896eec4c97336694 @ git://anongit.freedesktop.org/piglit=
</p></blockquote><div><br></div><div><span></span></div></body></html>

--=-Utt+x+Li/7LJK5gyJsJE--
