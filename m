Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 40A35606A31D
	for <intel-gfx@archiver.kernel.org>; Mon, 26 Oct 2026 18:39:08 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B398110E394;
	Mon, 26 Oct 2026 18:39:07 +0000 (UTC)
Received: from coelho.fi (coelho.fi [88.99.146.29])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2503B10E381;
 Mon, 26 Oct 2026 18:39:05 +0000 (UTC)
Received: from 91-152-156-14.elisa-laajakaista.fi ([91.152.156.14]
 helo=[192.168.100.138])
 by coelho.fi with esmtpsa (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
 (Exim 4.98.2) (envelope-from <luca@coelho.fi>)
 id 1xLPb4-00000004jpb-3u0p; Mon, 26 Oct 2026 20:39:03 +0200
Message-ID: <ea876d2f40080a8c4c888e464053458fecc561b4.camel@coelho.fi>
Subject: Re: =?UTF-8?Q?=E2=9C=97?= i915.CI.Full: failure for
 drm/i915/display: reduce clock_gating interface between core and display
 (rev6)
From: Luca Coelho <luca@coelho.fi>
To: I915-ci-infra@lists.freedesktop.org
Cc: intel-gfx@lists.freedesktop.org
Date: Mon, 26 Oct 2026 20:39:15 +0200
In-Reply-To: <179303790044.72150.11452082515054294314@221881a7231d>
References: <20261026094724.53374-1-luciano.coelho@intel.com>
 <179303790044.72150.11452082515054294314@221881a7231d>
Content-Type: multipart/alternative; boundary="=-CIECiLhEH69+RfAN0zLG"
User-Agent: Evolution 3.56.2-10+b1 
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
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
Sender: "Intel-gfx" <intel-gfx-bounces@lists.freedesktop.org>

--=-CIECiLhEH69+RfAN0zLG
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi,

The i915.CI.Full run for my series "drm/i915/display: reduce
clock_gating interface between core and display" (rev6) reported some
possible regressions:

https://patchwork.freedesktop.org/series/169493/
https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_169493v6/index.html

I don't think they're related to my changes. Rev6 is only a rebase of
rev5, which passed i915.CI.Full:

https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_169493v5/index.html

1.
igt@kms_frontbuffer_tracking@fbchdr-2p-primscrn-pri-indfb-draw-mmap-gtt
=C2=A0(shard-glk, PASS -> SKIP, +2 other tests skip)

https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_169493v6/shard-glk1/igt@=
kms_frontbuffer_tracking@fbchdr-2p-primscrn-pri-indfb-draw-mmap-gtt.html

The test skips on "Test requirement: hdr.can_test", so no HDR-capable
output was found. The base run was on glk8 and this one on glk1. The
same report already files other fbchdr subtests with the same PASS ->
SKIP on GLK under i915#17517, e.g.:

https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_169493v6/shard-glk1/igt@=
kms_frontbuffer_tracking@fbchdr-1p-primscrn-spr-indfb-draw-blt.html

It also shows up on GLK for other series, for example:

https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_176740v1/shard-glk4/igt@=
kms_frontbuffer_tracking@fbchdr-2p-primscrn-shrfb-plflip-blt.html
https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_164957v9/shard-glk5/igt@=
kms_frontbuffer_tracking@fbchdr-2p-scndscrn-pri-indfb-draw-pwrite.html

It looks like the i915#17517 filter should also cover these subtests.

2. igt@perf_pmu@gt-awake (shard-mtlp, PASS -> FAIL)

https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_169493v6/shard-mtlp-5/ig=
t@perf_pmu@gt-awake.html

This is a timing assertion: "'val' !=3D 'slept' (500395461.000000 not
within +5.0%/-5.0% tolerance of 545836000.000000)", with no kernel
warnings. The series doesn't change anything for MTL: the display clock
gating code it moves only covers platforms up to GLK, and MTL's core
clock gating is unchanged. So this looks like a sporadic failure.

Could you please update the filters and re-report the results for the
series?

Analysis assisted by Claude Opus 5.5.

Thanks!

--
Cheers,
Luca.


On Mon, 2026-10-26 at 18:05 +0000, Patchwork wrote:
> Patch Details
>=20
> Series:drm/i915/display: reduce clock_gating interface between core
> and display (rev6)
>=20
> URL:https://patchwork.freedesktop.org/series/169493/
>=20
> State:failure
> Details:
> https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_169493v6/index.html
> CI Bug Log - changes from CI_DRM_19395_full -> Patchwork_169493v6_fullSum=
maryFAILURE
> Serious unknown changes coming with Patchwork_169493v6_full
> absolutely need to be
> verified manually.
> If you think the reported changes have nothing to do with the changes
> introduced in Patchwork_169493v6_full, please notify your bug team
> (I915-ci-infra@lists.freedesktop.org) to allow them
> to document this new failure mode, which will reduce false positives
> in CI.
> Participating hosts (10 -> 10)No changes in participating hosts
> Possible new issuesHere are the unknown changes that may have been introd=
uced in
> Patchwork_169493v6_full:
> IGT changesPossible regressions *=20
>    igt@kms_frontbuffer_tracking@fbchdr-2p-primscrn-pri-indfb-draw-mmap-
>    gtt:shard-glk: PASS [1237] -> SKIP [1236] +2 other tests skip
>  *=20
>    igt@perf_pmu@gt-awake:shard-mtlp: PASS [1235] -> FAIL [1234]
> New testsNew tests have been introduced between CI_DRM_19395_full and
> Patchwork_169493v6_full:
> New IGT tests (4) *=20
>    igt@kms_cursor_crc@cursor-offscreen-256x85@pipe-c-hdmi-a-2:Statuses
>    : 1 pass(s)Exec time: [2.63] s
>  *=20
>    igt@kms_cursor_crc@cursor-random-256x256@pipe-c-hdmi-a-2:Statuses :
>    1 pass(s)Exec time: [4.10] s
>  *=20
>    igt@kms_cursor_crc@cursor-random-256x85@pipe-c-hdmi-a-2:Statuses : 1
>    pass(s)Exec time: [4.10] s
>  *=20
>    igt@kms_cursor_crc@cursor-rapid-movement-256x256@pipe-c-hdmi-a-
>    2:Statuses : 1 pass(s)Exec time: [0.31] s
> Known issuesHere are the changes found in Patchwork_169493v6_full that co=
me from
> known issues:
> IGT changesIssues hit *=20
>    igt@api_intel_bb@blit-reloc-purge-cache:shard-rkl: NOTRUN -> SKIP
>    [1233] (i915#8411 [1231]) +2 other tests skip
>  *=20
>    igt@api_intel_bb@object-reloc-purge-cache:shard-dg1: NOTRUN -> SKIP
>    [1232] (i915#8411 [1231])
>  *=20
>    igt@device_reset@cold-reset-bound:shard-tglu: NOTRUN -> SKIP [1228]
>    (i915#11078 [1225])shard-glk11: NOTRUN -> SKIP [1230] (i915#17537
>    [1229])
>  *=20
>    igt@device_reset@unbind-cold-reset-rebind:shard-rkl: NOTRUN -> SKIP
>    [1226] (i915#11078 [1225])shard-tglu-1: NOTRUN -> SKIP [1227]
>    (i915#11078 [1225])
>  *=20
>    igt@drm_read@fault-buffer:shard-dg2: PASS [1224] -> SKIP [1223]
>    (i915#17359 [496])
>  *=20
>    igt@fbdev@eof:shard-dg2: NOTRUN -> SKIP [1222] (i915#2582 [1221])
>  *=20
>    igt@gem_caching@writes:shard-mtlp: NOTRUN -> SKIP [1220] (i915#4873
>    [1219])
>  *=20
>    igt@gem_ccs@block-copy-compressed:shard-rkl: NOTRUN -> SKIP [1218]
>    (i915#3555 [15] / i915#9323 [402])
>  *=20
>    igt@gem_ccs@block-multicopy-compressed:shard-rkl: NOTRUN -> SKIP
>    [1217] (i915#9323 [402])
>  *=20
>    igt@gem_ccs@block-multicopy-inplace:shard-glk11: NOTRUN -> SKIP
>    [1216] (i915#17499 [1215])
>  *=20
>    igt@gem_ccs@ctrl-surf-copy:shard-tglu: NOTRUN -> SKIP [1214]
>    (i915#3555 [15] / i915#9323 [402]) +1 other test skip
>  *=20
>    igt@gem_ccs@suspend-resume:shard-dg1: NOTRUN -> SKIP [1213]
>    (i915#9323 [402])
>  *=20
>    igt@gem_close_race@multigpu-basic-process:shard-tglu: NOTRUN -> SKIP
>    [1210] (i915#7697 [396]) +2 other tests skipshard-glk10: NOTRUN ->
>    SKIP [1212] (i915#17568 [1211])
>  *=20
>    igt@gem_compute@compute-square:shard-glk: NOTRUN -> SKIP [1209]
>    (i915#17552 [1208])
>  *=20
>    igt@gem_create@create-ext-cpu-access-sanity-check:shard-tglu: NOTRUN
>    -> SKIP [1207] (i915#6335 [393])
>  *=20
>    igt@gem_create@create-ext-set-pat:shard-glk: NOTRUN -> SKIP [1204]
>    (i915#17530 [1203])shard-tglu: NOTRUN -> SKIP [1206] (i915#8562
>    [1205])
>  *=20
>    igt@gem_ctx_param@set-priority-not-supported:shard-tglu: NOTRUN ->
>    SKIP [1200] (i915#17444 [1199])shard-glk11: NOTRUN -> SKIP [1202]
>    (i915#17535 [1201])
>  *=20
>    igt@gem_ctx_persistence@heartbeat-hang:shard-dg1: NOTRUN -> SKIP
>    [1198] (i915#8555 [1197])
>  *=20
>    igt@gem_ctx_persistence@legacy-engines-hang@blt:shard-glk: NOTRUN ->
>    SKIP [1196] (i915#17527 [1195]) +1 other test skip
>  *=20
>    igt@gem_ctx_sseu@invalid-args:shard-glk10: NOTRUN -> SKIP [1194]
>    (i915#17496 [1193])
>  *=20
>    igt@gem_ctx_sseu@invalid-sseu:shard-mtlp: NOTRUN -> SKIP [1192]
>    (i915#280 [390])
>  *=20
>    igt@gem_ctx_sseu@mmap-args:shard-rkl: NOTRUN -> SKIP [1191]
>    (i915#280 [390])
>  *=20
>    igt@gem_eio@hibernate:shard-rkl: PASS [1190] -> ABORT [1189]
>    (i915#7975 [1188])
>  *=20
>    igt@gem_exec_balancer@bonded-dual:shard-dg2: NOTRUN -> SKIP [1186]
>    (i915#4771 [1185])shard-dg1: NOTRUN -> SKIP [1187] (i915#4771
>    [1185]) +1 other test skip
>  *=20
>    igt@gem_exec_balancer@fairslice:shard-glk10: NOTRUN -> SKIP [1184]
>    (i915#17547 [1183]) +1 other test skip
>  *=20
>    igt@gem_exec_balancer@parallel:shard-rkl: NOTRUN -> SKIP [1182]
>    (i915#4525 [1179]) +2 other tests skip
>  *=20
>    igt@gem_exec_balancer@parallel-keep-submit-fence:shard-tglu-1:
>    NOTRUN -> SKIP [1181] (i915#4525 [1179])
>  *=20
>    igt@gem_exec_balancer@parallel-ordering:shard-tglu: NOTRUN -> SKIP
>    [1180] (i915#4525 [1179]) +1 other test skip
>  *=20
>    igt@gem_exec_capture@capture-invisible@smem0:shard-rkl: NOTRUN ->
>    SKIP [1178] (i915#6334 [1177]) +1 other test skip
>  *=20
>    igt@gem_exec_flush@basic-batch-kernel-default-cmd:shard-rkl: NOTRUN
>    -> SKIP [1176] (i915#3711 [1175])
>  *=20
>    igt@gem_exec_flush@basic-batch-kernel-default-wb:shard-dg1: NOTRUN -
>    > SKIP [1173] (i915#3539 [1172] / i915#4852 [1171]) +1 other test
>    skipshard-dg2: NOTRUN -> SKIP [1174] (i915#3539 [1172] / i915#4852
>    [1171])
>  *=20
>    igt@gem_exec_params@larger-than-life-batch:shard-glk: NOTRUN -> SKIP
>    [1170] (i915#16871 [1169])
>  *=20
>    igt@gem_exec_params@rsvd2-dirt:shard-glk10: NOTRUN -> SKIP [1167]
>    (i915#17565 [1166])shard-tglu: NOTRUN -> SKIP [1168] (i915#17453
>    [377])
>  *=20
>    igt@gem_exec_reloc@basic-cpu-wc:shard-dg2: NOTRUN -> SKIP [1165]
>    (i915#3281 [369])
>  *=20
>    igt@gem_exec_reloc@basic-gtt-wc-active:shard-rkl: NOTRUN -> SKIP
>    [1164] (i915#3281 [369]) +10 other tests skip
>  *=20
>    igt@gem_exec_reloc@basic-write-read:shard-dg1: NOTRUN -> SKIP [1163]
>    (i915#3281 [369]) +2 other tests skip
>  *=20
>    igt@gem_exec_schedule@preempt-queue-chain:shard-dg2: NOTRUN -> SKIP
>    [1162] (i915#4537 [1161] / i915#4812 [1160])
>  *=20
>    igt@gem_exec_suspend@basic-s0:shard-dg2: PASS [1159] -> INCOMPLETE
>    [1158] (i915#13356 [169]) +1 other test incomplete
>  *=20
>    igt@gem_fence_thrash@bo-write-verify-none:shard-dg1: NOTRUN -> SKIP
>    [1157] (i915#4860 [1156]) +2 other tests skip
>  *=20
>    igt@gem_lmem_swapping@basic:shard-glk11: NOTRUN -> SKIP [1155]
>    (i915#17503 [1149])
>  *=20
>    igt@gem_lmem_swapping@heavy-multi:shard-glk10: NOTRUN -> SKIP [1154]
>    (i915#17503 [1149]) +3 other tests skip
>  *=20
>    igt@gem_lmem_swapping@heavy-verify-random-ccs:shard-tglu-1: NOTRUN -
>    > SKIP [1153] (i915#4613 [361]) +3 other tests skip
>  *=20
>    igt@gem_lmem_swapping@heavy-verify-random-ccs@lmem0:shard-dg1:
>    NOTRUN -> SKIP [1152] (i915#4565 [1151]) +1 other test skip
>  *=20
>    igt@gem_lmem_swapping@massive-random:shard-glk: NOTRUN -> SKIP
>    [1150] (i915#17503 [1149] / i915#4613 [361]) +2 other tests skip
>  *=20
>    igt@gem_lmem_swapping@parallel-random:shard-mtlp: NOTRUN -> SKIP
>    [1148] (i915#4613 [361])
>  *=20
>    igt@gem_lmem_swapping@parallel-random-verify-ccs:shard-dg1: NOTRUN -
>    > SKIP [1147] (i915#12193 [1146]) +1 other test skip
>  *=20
>    igt@gem_lmem_swapping@random-engines:shard-rkl: NOTRUN -> SKIP
>    [1145] (i915#4613 [361]) +2 other tests skip
>  *=20
>    igt@gem_lmem_swapping@verify-random-ccs:shard-tglu: NOTRUN -> SKIP
>    [1144] (i915#4613 [361]) +2 other tests skip
>  *=20
>    igt@gem_media_vme:shard-glk11: NOTRUN -> SKIP [1143] (i915#17543
>    [1142])
>  *=20
>    igt@gem_mmap@bad-object:shard-mtlp: NOTRUN -> SKIP [1141] (i915#4083
>    [1134]) +1 other test skip
>  *=20
>    igt@gem_mmap_gtt@coherency:shard-rkl: NOTRUN -> SKIP [1139]
>    (i915#17429 [1138])shard-tglu-1: NOTRUN -> SKIP [1140] (i915#17429
>    [1138])
>  *=20
>    igt@gem_mmap_gtt@flink-race:shard-dg1: NOTRUN -> SKIP [1137]
>    (i915#4077 [1102]) +10 other tests skip
>  *=20
>    igt@gem_mmap_wc@bad-object:shard-dg1: NOTRUN -> SKIP [1136]
>    (i915#4083 [1134]) +1 other test skip
>  *=20
>    igt@gem_mmap_wc@coherency:shard-dg2: NOTRUN -> SKIP [1135]
>    (i915#4083 [1134])
>  *=20
>    igt@gem_partial_pwrite_pread@reads:shard-mtlp: NOTRUN -> SKIP [1133]
>    (i915#3282 [356])
>  *=20
>    igt@gem_partial_pwrite_pread@writes-after-reads-display:shard-dg1:
>    NOTRUN -> SKIP [1132] (i915#3282 [356]) +4 other tests skip
>  *=20
>    igt@gem_partial_pwrite_pread@writes-after-reads-snoop:shard-dg2:
>    NOTRUN -> SKIP [1131] (i915#3282 [356])
>  *=20
>    igt@gem_partial_pwrite_pread@writes-after-reads-uncached:shard-rkl:
>    NOTRUN -> SKIP [1130] (i915#3282 [356]) +9 other tests skip
>  *=20
>    igt@gem_pxp@protected-raw-src-copy-not-readible:shard-glk11: NOTRUN
>    -> SKIP [1129] (i915#17521 [1124])
>  *=20
>    igt@gem_pxp@reject-modify-context-protection-off-3:shard-glk: NOTRUN
>    -> SKIP [1126] (i915#17521 [1124]) +1 other test skipshard-dg1:
>    NOTRUN -> SKIP [1128] (i915#4270 [1127]) +1 other test skip
>  *=20
>    igt@gem_pxp@verify-pxp-stale-buf-execution:shard-glk10: NOTRUN ->
>    SKIP [1125] (i915#17521 [1124])
>  *=20
>    igt@gem_render_copy@linear-to-vebox-y-tiled:shard-dg2: NOTRUN ->
>    SKIP [1123] (i915#5190 [26] / i915#8428 [1122]) +1 other test skip
>  *=20
>    igt@gem_render_copy@linear-to-vebox-yf-tiled:shard-glk10: NOTRUN ->
>    SKIP [1121] (i915#17492 [1118]) +1 other test skip
>  *=20
>    igt@gem_render_copy@yf-tiled-to-vebox-linear:shard-glk: NOTRUN ->
>    SKIP [1120] (i915#17492 [1118])
>  *=20
>    igt@gem_render_copy@yf-tiled-to-vebox-y-tiled:shard-glk11: NOTRUN ->
>    SKIP [1119] (i915#17492 [1118])
>  *=20
>    igt@gem_set_tiling_vs_blt@untiled-to-tiled:shard-dg1: NOTRUN -> SKIP
>    [1117] (i915#4079 [1116])
>  *=20
>    igt@gem_softpin@evict-snoop:shard-rkl: NOTRUN -> SKIP [1115]
>    (i915#17430 [1114])
>  *=20
>    igt@gem_softpin@evict-snoop-interruptible:shard-glk: NOTRUN -> SKIP
>    [1113] (i915#17551 [1112])
>  *=20
>    igt@gem_softpin@noreloc-s3:shard-glk: PASS [1108] -> INCOMPLETE
>    [1107] (i915#13356 [169] / i915#13809 [1106] / i915#16193
>    [1105])shard-rkl: PASS [1111] -> INCOMPLETE [1110] (i915#13809
>    [1106] / i915#16226 [1109])
>  *=20
>    igt@gem_tiled_blits@basic:shard-dg2: NOTRUN -> SKIP [1104]
>    (i915#4077 [1102]) +2 other tests skip
>  *=20
>    igt@gem_tiled_partial_pwrite_pread@writes-after-reads:shard-mtlp:
>    NOTRUN -> SKIP [1103] (i915#4077 [1102])
>  *=20
>    igt@gem_tiled_pread_basic@basic:shard-rkl: NOTRUN -> SKIP [1101]
>    (i915#15656 [1100])
>  *=20
>    igt@gem_userptr_blits@dmabuf-sync:shard-rkl: NOTRUN -> SKIP [1098]
>    (i915#3297 [353] / i915#3323 [1097])shard-tglu-1: NOTRUN -> SKIP
>    [1099] (i915#3297 [353] / i915#3323 [1097])
>  *=20
>    igt@gem_userptr_blits@dmabuf-unsync:shard-tglu: NOTRUN -> SKIP
>    [1095] (i915#3297 [353]) +1 other test skipshard-glk: NOTRUN -> SKIP
>    [1096] (i915#17507 [1087]) +1 other test skip
>  *=20
>    igt@gem_userptr_blits@map-fixed-invalidate-busy:shard-dg2: NOTRUN ->
>    SKIP [1093] (i915#3297 [353] / i915#4880 [1092])shard-dg1: NOTRUN ->
>    SKIP [1094] (i915#3297 [353] / i915#4880 [1092]) +2 other tests skip
>  *=20
>    igt@gem_userptr_blits@readonly-pwrite-unsync:shard-tglu-1: NOTRUN ->
>    SKIP [1091] (i915#3297 [353]) +1 other test skip
>  *=20
>    igt@gem_userptr_blits@relocations:shard-rkl: NOTRUN -> SKIP [1090]
>    (i915#3281 [369] / i915#3297 [353])
>  *=20
>    igt@gem_userptr_blits@unsync-unmap-after-close:shard-mtlp: NOTRUN ->
>    SKIP [1089] (i915#3297 [353])
>  *=20
>    igt@gem_userptr_blits@unsync-unmap-cycles:shard-glk11: NOTRUN ->
>    SKIP [1088] (i915#17507 [1087]) +1 other test skip
>  *=20
>    igt@gem_workarounds@suspend-resume:shard-rkl: NOTRUN -> INCOMPLETE
>    [1086] (i915#13356 [169])
>  *=20
>    igt@gen3_render_linear_blits:shard-glk: NOTRUN -> SKIP [1085]
>    (i915#17555 [1084])
>  *=20
>    igt@gen3_render_mixed_blits:shard-glk: NOTRUN -> SKIP [1083]
>    (i915#17532 [1082])
>  *=20
>    igt@gen3_render_tiledy_blits:shard-glk10: NOTRUN -> SKIP [1081]
>    (i915#17578 [1080])
>  *=20
>    igt@gen7_exec_parse@basic-offset:shard-glk: NOTRUN -> SKIP [1079]
>    (i915#17505 [1073]) +1 other test skip
>  *=20
>    igt@gen7_exec_parse@basic-rejected:shard-rkl: NOTRUN -> SKIP [1077]
>    (i915#17455 [82]) +4 other tests skipshard-dg1: NOTRUN -> SKIP
>    [1078] (i915#17455 [82]) +4 other tests skip
>  *=20
>    igt@gen7_exec_parse@bitmasks:shard-dg2: NOTRUN -> SKIP [1076]
>    (i915#17455 [82])
>  *=20
>    igt@gen7_exec_parse@cmd-crossing-page:shard-mtlp: NOTRUN -> SKIP
>    [1075] (i915#17455 [82])
>  *=20
>    igt@gen7_exec_parse@load-register-reg:shard-glk11: NOTRUN -> SKIP
>    [1074] (i915#17505 [1073])
>  *=20
>    igt@gen9_exec_parse@basic-rejected:shard-tglu-1: NOTRUN -> SKIP
>    [1072] (i915#2527 [348] / i915#2856 [1069])
>  *=20
>    igt@gen9_exec_parse@basic-rejected-ctx-param:shard-tglu: NOTRUN ->
>    SKIP [1071] (i915#2527 [348] / i915#2856 [1069]) +5 other tests skip
>  *=20
>    igt@gen9_exec_parse@batch-zero-length:shard-mtlp: NOTRUN -> SKIP
>    [1070] (i915#2856 [1069])
>  *=20
>    igt@gen9_exec_parse@unaligned-jump:shard-rkl: NOTRUN -> SKIP [1068]
>    (i915#2527 [348]) +3 other tests skip
>  *=20
>    igt@i915_drm_fdinfo@all-busy-idle-check-all:shard-dg1: NOTRUN ->
>    SKIP [1067] (i915#14123 [1066])
>  *=20
>    igt@i915_drm_fdinfo@busy@rcs0:shard-dg1: NOTRUN -> SKIP [1065]
>    (i915#14073 [1064]) +5 other tests skip
>  *=20
>    igt@i915_drm_fdinfo@virtual-busy-hang-all:shard-dg1: NOTRUN -> SKIP
>    [1063] (i915#14118 [1062])
>  *=20
>    igt@i915_module_load@resize-bar:shard-tglu: NOTRUN -> SKIP [1059]
>    (i915#6412 [345])shard-glk10: NOTRUN -> SKIP [1061] (i915#17566
>    [1060])
>  *=20
>    igt@i915_pm_freq_api@freq-basic-api:shard-glk: NOTRUN -> SKIP [1056]
>    (i915#17526 [1055])shard-tglu-1: NOTRUN -> SKIP [1058] (i915#8399
>    [1057])
>  *=20
>    igt@i915_pm_freq_api@freq-suspend@gt0:shard-dg2: PASS [1054] ->
>    INCOMPLETE [1053] (i915#13356 [169] / i915#13820 [1052]) +1 other
>    test incomplete
>  *=20
>    igt@i915_pm_rc6_residency@media-rc6-accuracy:shard-tglu: NOTRUN ->
>    SKIP [1051] (i915#16080 [342] / i915#16166 [341])
>  *=20
>    igt@i915_pm_rc6_residency@rc6-fence:shard-tglu-1: NOTRUN -> WARN
>    [1050] (i915#13790 [1049] / i915#2681 [1048]) +1 other test warn
>  *=20
>    igt@i915_pm_rpm@system-suspend:shard-rkl: PASS [1047] -> INCOMPLETE
>    [1046] (i915#13356 [169])
>  *=20
>    igt@i915_pm_rpm@system-suspend-execbuf:shard-glk: NOTRUN ->
>    INCOMPLETE [1045] (i915#13356 [169] / i915#15172 [1044])
>  *=20
>    igt@i915_pm_rps@min-max-config-loaded:shard-dg1: NOTRUN -> SKIP
>    [1043] (i915#11681 [1042] / i915#6621 [1041])
>  *=20
>    igt@i915_pm_sseu@full-enable:shard-rkl: NOTRUN -> SKIP [1040]
>    (i915#4387 [1039])
>  *=20
>    igt@i915_power@sanity:shard-rkl: NOTRUN -> SKIP [1038] (i915#7984
>    [1037])
>  *=20
>    igt@i915_query@hwconfig_table:shard-glk10: NOTRUN -> SKIP [1036]
>    (i915#17584 [1035])
>  *=20
>    igt@i915_query@query-topology-unsupported:shard-dg1: NOTRUN -> SKIP
>    [1034] (i915#16079 [1033])
>  *=20
>    igt@i915_query@test-query-geometry-subslices:shard-rkl: NOTRUN ->
>    SKIP [1032] (i915#5723 [1031])
>  *=20
>    igt@i915_selftest@mock:shard-tglu: PASS [1030] -> ABORT [1029]
>    (i915#17076 [1028]) +1 other test abort
>  *=20
>    igt@i915_suspend@basic-s2idle-without-i915:shard-dg1: PASS [1027] ->
>    DMESG-WARN [1026] (i915#4391 [489] / i915#4423 [72])
>  *=20
>    igt@i915_suspend@basic-s3-without-i915:shard-tglu: NOTRUN ->
>    INCOMPLETE [1023] (i915#4817 [1022] / i915#7443 [1021])shard-glk11:
>    NOTRUN -> INCOMPLETE [1025] (i915#13356 [169] / i915#16182 [1024] /
>    i915#4817 [1022])
>  *=20
>    igt@intel_hwmon@hwmon-write:shard-glk: NOTRUN -> SKIP [1019]
>    (i915#11680 [1018])shard-tglu: NOTRUN -> SKIP [1020] (i915#7707
>    [338])
>  *=20
>    igt@kms_addfb_basic@basic-x-tiled-legacy:shard-dg1: NOTRUN -> SKIP
>    [1017] (i915#4212 [1016]) +1 other test skip
>  *=20
>    igt@kms_async_flips@async-flip-with-page-flip-events-linear-
>    atomic:shard-glk10: NOTRUN -> SKIP [1015] (i915#17562 [1014])
>  *=20
>    igt@kms_atomic_transition@plane-all-modeset-transition-internal-
>    panels:shard-dg1: NOTRUN -> SKIP [1013] (i915#1769 [1012] /
>    i915#3555 [15])
>  *=20
>    igt@kms_big_fb@4-tiled-16bpp-rotate-0:shard-rkl: NOTRUN -> SKIP
>    [1010] (i915#4538 [303] / i915#5286 [320]) +5 other tests skipshard-
>    dg1: NOTRUN -> SKIP [1011] (i915#4538 [303] / i915#5286 [320]) +2
>    other tests skip
>  *=20
>    igt@kms_big_fb@4-tiled-32bpp-rotate-0:shard-glk11: NOTRUN -> SKIP
>    [1009] (i915#17478 [999])
>  *=20
>    igt@kms_big_fb@4-tiled-32bpp-rotate-180:shard-tglu-1: NOTRUN -> SKIP
>    [1008] (i915#17432 [30] / i915#5286 [320]) +2 other tests skip
>  *=20
>    igt@kms_big_fb@4-tiled-8bpp-rotate-180:shard-glk10: NOTRUN -> SKIP
>    [1007] (i915#17478 [999]) +4 other tests skip
>  *=20
>    igt@kms_big_fb@4-tiled-addfb:shard-tglu-1: NOTRUN -> SKIP [1003]
>    (i915#5286 [320])shard-dg1: NOTRUN -> SKIP [1004] (i915#5286 [320])
>    +1 other test skipshard-glk: NOTRUN -> SKIP [1006] (i915#17556
>    [1005])
>  *=20
>    igt@kms_big_fb@4-tiled-addfb-size-overflow:shard-rkl: NOTRUN -> SKIP
>    [1002] (i915#5286 [320])
>  *=20
>    igt@kms_big_fb@4-tiled-max-hw-stride-32bpp-rotate-180-async-
>    flip:shard-tglu: NOTRUN -> SKIP [1001] (i915#17432 [30] / i915#5286
>    [320]) +4 other tests skip
>  *=20
>    igt@kms_big_fb@4-tiled-max-hw-stride-32bpp-rotate-180-hflip-async-
>    flip:shard-glk: NOTRUN -> SKIP [1000] (i915#17478 [999]) +2 other
>    tests skip
>  *=20
>    igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-0-hflip:shard-dg2:
>    PASS [998] -> SKIP [997] (i915#17356 [9]) +28 other tests skip
>  *=20
>    igt@kms_big_fb@linear-16bpp-rotate-90:shard-tglu: NOTRUN -> SKIP
>    [996] (i915#17431 [317]) +2 other tests skip
>  *=20
>    igt@kms_big_fb@linear-32bpp-rotate-90:shard-rkl: NOTRUN -> SKIP
>    [994] (i915#17431 [317] / i915#3638 [316]) +4 other tests skipshard-
>    tglu-1: NOTRUN -> SKIP [995] (i915#17431 [317]) +2 other tests skip
>  *=20
>    igt@kms_big_fb@linear-8bpp-rotate-270:shard-dg1: NOTRUN -> SKIP
>    [993] (i915#3638 [316]) +2 other tests skip
>  *=20
>    igt@kms_big_fb@x-tiled-max-hw-stride-32bpp-rotate-180-hflip-async-
>    flip:shard-glk10: NOTRUN -> SKIP [992] (i915#17500 [989]) +2 other
>    tests skip
>  *=20
>    igt@kms_big_fb@x-tiled-max-hw-stride-64bpp-rotate-180-hflip-async-
>    flip:shard-glk11: NOTRUN -> SKIP [991] (i915#17500 [989]) +3 other
>    tests skip
>  *=20
>    igt@kms_big_fb@y-tiled-16bpp-rotate-90:shard-glk: NOTRUN -> SKIP
>    [990] (i915#17500 [989]) +4 other tests skip
>  *=20
>    igt@kms_big_fb@yf-tiled-16bpp-rotate-180:shard-dg1: NOTRUN -> SKIP
>    [988] (i915#4538 [303]) +4 other tests skip
>  *=20
>    igt@kms_big_fb@yf-tiled-32bpp-rotate-270:shard-mtlp: NOTRUN -> SKIP
>    [987] (i915#17432 [30])
>  *=20
>    igt@kms_big_fb@yf-tiled-64bpp-rotate-0:shard-dg2: NOTRUN -> SKIP
>    [986] (i915#17356 [9] / i915#5190 [26])
>  *=20
>    igt@kms_big_fb@yf-tiled-addfb-size-offset-overflow:shard-tglu-1:
>    NOTRUN -> SKIP [985] (i915#17432 [30]) +4 other tests skip
>  *=20
>    igt@kms_big_fb@yf-tiled-addfb-size-overflow:shard-rkl: NOTRUN ->
>    SKIP [984] (i915#17432 [30])
>  *=20
>    igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-180-async-
>    flip:shard-rkl: NOTRUN -> SKIP [983] (i915#4538 [303]) +5 other
>    tests skip
>  *=20
>    igt@kms_big_fb@yf-tiled-max-hw-stride-64bpp-rotate-0-async-
>    flip:shard-dg2: NOTRUN -> SKIP [982] (i915#4538 [303] / i915#5190
>    [26])
>  *=20
>    igt@kms_big_fb@yf-tiled-max-hw-stride-64bpp-rotate-180:shard-tglu:
>    NOTRUN -> SKIP [981] (i915#17432 [30]) +6 other tests skip
>  *=20
>    igt@kms_ccs@bad-aux-stride-y-tiled-ccs@pipe-c-hdmi-a-1:shard-tglu:
>    NOTRUN -> SKIP [980] (i915#6095 [269]) +84 other tests skip
>  *=20
>    igt@kms_ccs@bad-pixel-format-4-tiled-mtl-rc-ccs-cc:shard-tglu-1:
>    NOTRUN -> SKIP [979] (i915#6095 [269]) +39 other tests skip
>  *=20
>    igt@kms_ccs@bad-pixel-format-y-tiled-gen12-mc-ccs:shard-dg2: NOTRUN
>    -> SKIP [978] (i915#17356 [9]) +17 other tests skip
>  *=20
>    igt@kms_ccs@bad-pixel-format-y-tiled-gen12-rc-ccs-cc@pipe-a-edp-
>    1:shard-mtlp: NOTRUN -> SKIP [977] (i915#6095 [269]) +4 other tests
>    skip
>  *=20
>    igt@kms_ccs@bad-rotation-90-4-tiled-bmg-ccs:shard-glk10: NOTRUN ->
>    SKIP [976] (i915#17525 [960]) +2 other tests skip
>  *=20
>    igt@kms_ccs@bad-rotation-90-4-tiled-dg2-mc-ccs@pipe-a-hdmi-a-
>    2:shard-rkl: NOTRUN -> SKIP [975] (i915#14544 [4] / i915#6095 [269])
>    +3 other tests skip
>  *=20
>    igt@kms_ccs@bad-rotation-90-4-tiled-dg2-mc-ccs@pipe-c-hdmi-a-
>    2:shard-rkl: NOTRUN -> SKIP [974] (i915#14098 [273] / i915#14544 [4]
>    / i915#6095 [269]) +1 other test skip
>  *=20
>    igt@kms_ccs@bad-rotation-90-4-tiled-mtl-mc-ccs:shard-glk11: NOTRUN -
>    > SKIP [973] (i915#17490 [967]) +7 other tests skip
>  *=20
>    igt@kms_ccs@bad-rotation-90-4-tiled-mtl-rc-ccs-cc@pipe-b-hdmi-a-
>    4:shard-dg1: NOTRUN -> SKIP [972] (i915#6095 [269]) +151 other tests
>    skip
>  *=20
>    igt@kms_ccs@crc-primary-rotation-180-4-tiled-dg2-mc-ccs@pipe-c-hdmi-
>    a-2:shard-glk10: NOTRUN -> SKIP [971] (i915#17490 [967]) +17 other
>    tests skip
>  *=20
>    igt@kms_ccs@crc-primary-rotation-180-4-tiled-mtl-mc-ccs@pipe-a-hdmi-
>    a-3:shard-dg2: NOTRUN -> SKIP [970] (i915#10307 [270] / i915#6095
>    [269]) +74 other tests skip
>  *=20
>    igt@kms_ccs@crc-primary-rotation-180-4-tiled-mtl-mc-ccs@pipe-a-hdmi-
>    a-4:shard-dg1: NOTRUN -> SKIP [969] (i915#4423 [72] / i915#6095
>    [269])
>  *=20
>    igt@kms_ccs@crc-primary-rotation-180-4-tiled-mtl-rc-ccs-cc:shard-
>    glk: NOTRUN -> SKIP [968] (i915#17490 [967]) +15 other tests skip
>  *=20
>    igt@kms_ccs@crc-primary-rotation-180-y-tiled-ccs@pipe-c-hdmi-a-
>    1:shard-glk11: NOTRUN -> SKIP [966] (i915#17491 [946]) +23 other
>    tests skip
>  *=20
>    igt@kms_ccs@crc-primary-suspend-4-tiled-bmg-ccs:shard-rkl: NOTRUN ->
>    SKIP [964] (i915#12805 [962])shard-tglu-1: NOTRUN -> SKIP [965]
>    (i915#12805 [962]) +1 other test skip
>  *=20
>    igt@kms_ccs@crc-primary-suspend-4-tiled-lnl-ccs:shard-glk: NOTRUN ->
>    SKIP [961] (i915#17525 [960])shard-dg1: NOTRUN -> SKIP [963]
>    (i915#12805 [962])
>  *=20
>    igt@kms_ccs@crc-primary-suspend-4-tiled-mtl-mc-ccs@pipe-d-edp-
>    1:shard-mtlp: NOTRUN -> INCOMPLETE [959] (i915#15582 [287])
>  *=20
>    igt@kms_ccs@crc-primary-suspend-4-tiled-mtl-rc-ccs@pipe-a-hdmi-a-
>    3:shard-dg2: NOTRUN -> SKIP [958] (i915#6095 [269]) +7 other tests
>    skip
>  *=20
>    igt@kms_ccs@crc-primary-suspend-y-tiled-gen12-rc-ccs:shard-rkl: PASS
>    [957] -> INCOMPLETE [956] (i915#15582 [287])
>  *=20
>    igt@kms_ccs@crc-primary-suspend-y-tiled-gen12-rc-ccs@pipe-a-hdmi-a-
>    2:shard-rkl: NOTRUN -> INCOMPLETE [955] (i915#15582 [287])
>  *=20
>    igt@kms_ccs@crc-primary-suspend-yf-tiled-ccs:shard-rkl: NOTRUN ->
>    SKIP [954] (i915#14098 [273] / i915#6095 [269]) +51 other tests skip
>  *=20
>    igt@kms_ccs@crc-sprite-planes-basic-4-tiled-bmg-ccs:shard-tglu-1:
>    NOTRUN -> SKIP [953] (i915#12313 [276])
>  *=20
>    igt@kms_ccs@crc-sprite-planes-basic-4-tiled-lnl-ccs:shard-tglu:
>    NOTRUN -> SKIP [952] (i915#12313 [276]) +1 other test skip
>  *=20
>    igt@kms_ccs@crc-sprite-planes-basic-y-tiled-gen12-rc-ccs@pipe-d-
>    hdmi-a-1:shard-dg2: NOTRUN -> SKIP [951] (i915#10307 [270] /
>    i915#10434 [290] / i915#6095 [269])
>  *=20
>    igt@kms_ccs@random-ccs-data-4-tiled-bmg-ccs:shard-rkl: NOTRUN ->
>    SKIP [950] (i915#12313 [276]) +1 other test skip
>  *=20
>    igt@kms_ccs@random-ccs-data-4-tiled-mtl-mc-ccs@pipe-c-hdmi-a-
>    1:shard-glk10: NOTRUN -> SKIP [949] (i915#17491 [946]) +46 other
>    tests skip
>  *=20
>    igt@kms_ccs@random-ccs-data-4-tiled-mtl-rc-ccs@pipe-b-hdmi-a-
>    2:shard-rkl: NOTRUN -> SKIP [948] (i915#6095 [269]) +71 other tests
>    skip
>  *=20
>    igt@kms_ccs@random-ccs-data-y-tiled-gen12-rc-ccs@pipe-a-hdmi-a-
>    1:shard-glk: NOTRUN -> SKIP [947] (i915#17491 [946]) +45 other tests
>    skip
>  *=20
>    igt@kms_cdclk@mode-transition-all-outputs:shard-rkl: NOTRUN -> SKIP
>    [944] (i915#3742 [943])shard-tglu-1: NOTRUN -> SKIP [945] (i915#3742
>    [943])
>  *=20
>    igt@kms_cdclk@plane-scaling@pipe-c-edp-1:shard-mtlp: NOTRUN -> SKIP
>    [942] (i915#13781 [940]) +4 other tests skip
>  *=20
>    igt@kms_cdclk@plane-scaling@pipe-c-hdmi-a-3:shard-dg2: NOTRUN ->
>    SKIP [941] (i915#13781 [940]) +3 other tests skip
>  *=20
>    igt@kms_chamelium_audio@dp-audio-after-suspend:shard-glk10: NOTRUN -
>    > SKIP [939] (i915#17483 [915]) +7 other tests skip
>  *=20
>    igt@kms_chamelium_audio@hdmi-audio-edid:shard-tglu: NOTRUN -> SKIP
>    [938] (i915#11151 [259] / i915#7828 [258]) +7 other tests skip
>  *=20
>    igt@kms_chamelium_color@ctm-0-50:shard-dg2: NOTRUN -> SKIP [937]
>    (i915#17427 [264])
>  *=20
>    igt@kms_chamelium_color@ctm-blue-to-red:shard-glk11: NOTRUN -> SKIP
>    [936] (i915#17489 [935]) +1 other test skip
>  *=20
>    igt@kms_chamelium_color@degamma:shard-rkl: NOTRUN -> SKIP [934]
>    (i915#17427 [264]) +3 other tests skip
>  *=20
>    igt@kms_chamelium_color_pipeline@plane-ctm3x4:shard-mtlp: NOTRUN ->
>    SKIP [933] (i915#16464 [932] / i915#16471 [924] / i915#17427 [264])
>  *=20
>    igt@kms_chamelium_color_pipeline@plane-fixed-matrix-yuv-rgb-bt2020-
>    lut1d:shard-glk10: NOTRUN -> SKIP [931] (i915#17497 [922]) +2 other
>    tests skip
>  *=20
>    igt@kms_chamelium_color_pipeline@plane-fixed-matrix-yuv-rgb-bt601-
>    lim:shard-dg1: NOTRUN -> SKIP [930] (i915#17427 [264]) +3 other
>    tests skip
>  *=20
>    igt@kms_chamelium_color_pipeline@plane-fixed-matrix-yuv-rgb-bt601-
>    lut1d:shard-tglu: NOTRUN -> SKIP [929] (i915#17427 [264]) +4 other
>    tests skip
>  *=20
>    igt@kms_chamelium_color_pipeline@plane-lut1d-ctm3x4-lut1d:shard-rkl:
>    NOTRUN -> SKIP [927] (i915#16471 [924] / i915#17427 [264]) +2 other
>    tests skipshard-tglu-1: NOTRUN -> SKIP [928] (i915#16471 [924] /
>    i915#17427 [264]) +3 other tests skip
>  *=20
>    igt@kms_chamelium_color_pipeline@plane-lut1d-post-ctm3x4:shard-dg1:
>    NOTRUN -> SKIP [926] (i915#16471 [924] / i915#17427 [264]) +1 other
>    test skip
>  *=20
>    igt@kms_chamelium_color_pipeline@plane-lut3d-green-only:shard-glk:
>    NOTRUN -> SKIP [923] (i915#17497 [922]) +3 other tests skipshard-
>    tglu: NOTRUN -> SKIP [925] (i915#16471 [924] / i915#17427 [264])
>  *=20
>    igt@kms_chamelium_edid@hdmi-edid-read:shard-rkl: NOTRUN -> SKIP
>    [920] (i915#11151 [259] / i915#7828 [258]) +11 other tests
>    skipshard-dg1: NOTRUN -> SKIP [921] (i915#11151 [259] / i915#7828
>    [258]) +4 other tests skip
>  *=20
>    igt@kms_chamelium_edid@hdmi-edid-stress-resolution-non-4k:shard-dg2:
>    NOTRUN -> SKIP [919] (i915#11151 [259] / i915#7828 [258])
>  *=20
>    igt@kms_chamelium_hpd@dp-hpd-after-runtime-suspend-d3hot:shard-
>    glk11: NOTRUN -> SKIP [918] (i915#17483 [915]) +3 other tests skip
>  *=20
>    igt@kms_chamelium_hpd@dp-hpd-storm-disable:shard-tglu-1: NOTRUN ->
>    SKIP [917] (i915#11151 [259] / i915#7828 [258]) +4 other tests skip
>  *=20
>    igt@kms_chamelium_hpd@dp-hpd-with-enabled-mode:shard-glk: NOTRUN ->
>    SKIP [916] (i915#17483 [915])
>  *=20
>    igt@kms_chamelium_hpd@hdmi-hpd-after-runtime-suspend-d3hot:shard-
>    tglu: NOTRUN -> SKIP [914] (i915#11151 [259])
>  *=20
>    igt@kms_color@legacy-gamma-reset:shard-dg2: PASS [913] -> SKIP [912]
>    (i915#12655 [468] / i915#17373 [467]) +2 other tests skip
>  *=20
>    igt@kms_color_pipeline@plane-fixed-matrix-yuv-rgb-bt601:shard-dg2:
>    PASS [911] -> SKIP [910] (i915#15529 [464])
>  *=20
>    igt@kms_color_pipeline@plane-fixed-matrix-yuv-rgb-bt709:shard-glk11:
>    NOTRUN -> SKIP [909] (i915#17510 [905])
>  *=20
>    igt@kms_color_pipeline@plane-fixed-matrix-yuv-rgb-bt709-lut1d:shard-
>    dg2: NOTRUN -> SKIP [908] (i915#15529 [464])
>  *=20
>    igt@kms_color_pipeline@plane-lut1d:shard-glk: NOTRUN -> SKIP [907]
>    (i915#17510 [905]) +1 other test skip
>  *=20
>    igt@kms_color_pipeline@plane-lut1d-ctm3x4:shard-glk10: NOTRUN ->
>    SKIP [906] (i915#17510 [905]) +1 other test skip
>  *=20
>    igt@kms_color_pipeline@plane-lut1d-ctm3x4-lut1d@pipe-d-plane-
>    3:shard-tglu: NOTRUN -> SKIP [904] (i915#16990 [901]) +47 other
>    tests skip
>  *=20
>    igt@kms_color_pipeline@plane-lut1d-lut1d@pipe-a-plane-3:shard-rkl:
>    NOTRUN -> SKIP [903] (i915#16990 [901]) +5 other tests skip
>  *=20
>    igt@kms_color_pipeline@plane-lut1d-lut1d@pipe-b-plane-4:shard-dg1:
>    NOTRUN -> SKIP [902] (i915#16990 [901]) +15 other tests skip
>  *=20
>    igt@kms_content_protection@content-type-change:shard-tglu: NOTRUN ->
>    SKIP [899] (i915#15865 [240]) +3 other tests skipshard-glk11: NOTRUN
>    -> SKIP [900] (i915#17508 [890]) +1 other test skip
>  *=20
>    igt@kms_content_protection@dp-mst-lic-type-1:shard-rkl: NOTRUN ->
>    SKIP [898] (i915#15330 [250] / i915#3116 [249])
>  *=20
>    igt@kms_content_protection@dp-mst-type-0:shard-glk: NOTRUN -> SKIP
>    [897] (i915#17502 [893])
>  *=20
>    igt@kms_content_protection@dp-mst-type-0-hdcp14:shard-rkl: NOTRUN ->
>    SKIP [896] (i915#15330 [250])
>  *=20
>    igt@kms_content_protection@dp-mst-type-1:shard-tglu: NOTRUN -> SKIP
>    [895] (i915#15330 [250] / i915#3116 [249] / i915#3299 [253]) +1
>    other test skip
>  *=20
>    igt@kms_content_protection@dp-mst-type-1-suspend-resume:shard-glk10:
>    NOTRUN -> SKIP [894] (i915#17502 [893]) +2 other tests skip
>  *=20
>    igt@kms_content_protection@lic-type-1:shard-glk: NOTRUN -> SKIP
>    [892] (i915#17508 [890])
>  *=20
>    igt@kms_content_protection@srm:shard-glk10: NOTRUN -> SKIP [891]
>    (i915#17508 [890])
>  *=20
>    igt@kms_content_protection@uevent:shard-rkl: NOTRUN -> SKIP [889]
>    (i915#15865 [240])
>  *=20
>    igt@kms_cursor_crc@cursor-offscreen-32x32:shard-tglu-1: NOTRUN ->
>    SKIP [888] (i915#3555 [15]) +1 other test skip
>  *=20
>    igt@kms_cursor_crc@cursor-offscreen-512x170:shard-glk10: NOTRUN ->
>    SKIP [887] (i915#17533 [867])
>  *=20
>    igt@kms_cursor_crc@cursor-onscreen-256x85:shard-tglu: NOTRUN -> FAIL
>    [886] (i915#13566 [461]) +3 other tests fail
>  *=20
>    igt@kms_cursor_crc@cursor-onscreen-32x10:shard-glk11: NOTRUN -> SKIP
>    [885] (i915#17504 [865])
>  *=20
>    igt@kms_cursor_crc@cursor-onscreen-32x32:shard-rkl: NOTRUN -> SKIP
>    [883] (i915#3555 [15]) +6 other tests skipshard-dg1: NOTRUN -> SKIP
>    [884] (i915#3555 [15]) +3 other tests skip
>  *=20
>    igt@kms_cursor_crc@cursor-onscreen-64x21@pipe-a-hdmi-a-1:shard-tglu:
>    PASS [882] -> FAIL [881] (i915#13566 [461]) +1 other test fail
>  *=20
>    igt@kms_cursor_crc@cursor-random-128x128:shard-dg1: PASS [880] ->
>    DMESG-WARN [879] (i915#4423 [72]) +1 other test dmesg-warn
>  *=20
>    igt@kms_cursor_crc@cursor-random-128x42:shard-rkl: PASS [878] ->
>    FAIL [877] (i915#13566 [461]) +3 other tests fail
>  *=20
>    igt@kms_cursor_crc@cursor-random-512x170:shard-tglu-1: NOTRUN ->
>    SKIP [874] (i915#13049 [229]) +2 other tests skipshard-dg1: NOTRUN -
>    > SKIP [875] (i915#13049 [229])shard-glk: NOTRUN -> SKIP [876]
>    (i915#17533 [867])
>  *=20
>    igt@kms_cursor_crc@cursor-random-512x512:shard-rkl: NOTRUN -> SKIP
>    [873] (i915#13049 [229]) +3 other tests skip
>  *=20
>    igt@kms_cursor_crc@cursor-rapid-movement-32x10:shard-tglu: NOTRUN ->
>    SKIP [871] (i915#3555 [15]) +3 other tests skipshard-glk: NOTRUN ->
>    SKIP [872] (i915#17504 [865])
>  *=20
>    igt@kms_cursor_crc@cursor-rapid-movement-512x512:shard-tglu: NOTRUN
>    -> SKIP [870] (i915#13049 [229]) +2 other tests skip
>  *=20
>    igt@kms_cursor_crc@cursor-sliding-128x42@pipe-a-hdmi-a-1:shard-rkl:
>    NOTRUN -> FAIL [869] (i915#13566 [461]) +2 other tests fail
>  *=20
>    igt@kms_cursor_crc@cursor-sliding-512x170:shard-glk11: NOTRUN ->
>    SKIP [868] (i915#17533 [867])
>  *=20
>    igt@kms_cursor_crc@cursor-sliding-max-size:shard-glk10: NOTRUN ->
>    SKIP [866] (i915#17504 [865]) +1 other test skip
>  *=20
>    igt@kms_cursor_crc@cursor-suspend:shard-glk10: NOTRUN -> INCOMPLETE
>    [862] (i915#12358 [858] / i915#13356 [169] / i915#14152 [857] /
>    i915#7882 [861])shard-rkl: PASS [864] -> INCOMPLETE [863]
>    (i915#12358 [858] / i915#14152 [857])
>  *=20
>    igt@kms_cursor_crc@cursor-suspend@pipe-a-hdmi-a-1:shard-glk10:
>    NOTRUN -> INCOMPLETE [860] (i915#12358 [858] / i915#13356 [169] /
>    i915#14152 [857])
>  *=20
>    igt@kms_cursor_crc@cursor-suspend@pipe-a-hdmi-a-2:shard-rkl: NOTRUN
>    -> INCOMPLETE [859] (i915#12358 [858] / i915#14152 [857])
>  *=20
>    igt@kms_cursor_legacy@2x-flip-vs-cursor-legacy:shard-tglu: NOTRUN ->
>    SKIP [856] (i915#17428 [109] / i915#17454 [224]) +8 other tests skip
>  *=20
>    igt@kms_cursor_legacy@basic-busy-flip-before-cursor-atomic:shard-
>    glk10: NOTRUN -> SKIP [855] (i915#17457 [846])
>  *=20
>    igt@kms_cursor_legacy@basic-busy-flip-before-cursor-legacy:shard-
>    rkl: NOTRUN -> SKIP [854] (i915#4103 [220])
>  *=20
>    igt@kms_cursor_legacy@cursorb-vs-flipa-varying-size:shard-tglu-1:
>    NOTRUN -> SKIP [853] (i915#17428 [109] / i915#17454 [224]) +1 other
>    test skip
>  *=20
>    igt@kms_cursor_legacy@flip-vs-cursor-atomic-transitions:shard-glk:
>    PASS [852] -> FAIL [851] (i915#15804 [850])
>  *=20
>    igt@kms_cursor_legacy@short-busy-flip-before-cursor-atomic-
>    transitions:shard-glk11: NOTRUN -> SKIP [849] (i915#17457 [846])
>  *=20
>    igt@kms_cursor_legacy@short-busy-flip-before-cursor-toggle:shard-
>    glk: NOTRUN -> SKIP [847] (i915#17457 [846])shard-tglu: NOTRUN ->
>    SKIP [848] (i915#4103 [220]) +1 other test skip
>  *=20
>    igt@kms_dirtyfb@psr-dirtyfb-ioctl:shard-glk10: NOTRUN -> SKIP [845]
>    (i915#17515 [844])
>  *=20
>    igt@kms_display_modes@extended-mode-basic:shard-rkl: NOTRUN -> SKIP
>    [842] (i915#13691 [841])shard-tglu-1: NOTRUN -> SKIP [843]
>    (i915#13691 [841])
>  *=20
>    igt@kms_dither@fb-8bpc-vs-panel-6bpc@pipe-a-hdmi-a-1:shard-rkl:
>    NOTRUN -> SKIP [840] (i915#3804 [217])
>  *=20
>    igt@kms_dp_aux_dev@basic:shard-tglu: NOTRUN -> SKIP [839] (i915#1257
>    [214])
>  *=20
>    igt@kms_dp_link_training@non-uhbr-mst:shard-dg1: NOTRUN -> SKIP
>    [838] (i915#17289 [837])
>  *=20
>    igt@kms_dp_link_training@non-uhbr-mst-tbtalt-train:shard-rkl: NOTRUN
>    -> SKIP [836] (i915#17291 [835])
>  *=20
>    igt@kms_dp_link_training@non-uhbr-sst-direct-train:shard-glk: NOTRUN
>    -> SKIP [833] (i915#17506 [832])shard-tglu: NOTRUN -> SKIP [834]
>    (i915#17286 [201])
>  *=20
>    igt@kms_dp_link_training@non-uhbr-sst-tbtalt-train:shard-tglu:
>    NOTRUN -> SKIP [829] (i915#17290 [828])shard-glk: NOTRUN -> SKIP
>    [831] (i915#17531 [830])
>  *=20
>    igt@kms_dp_link_training@uhbr-mst-tbtalt-train:shard-glk11: NOTRUN -
>    > SKIP [827] (i915#17477 [826])
>  *=20
>    igt@kms_dp_linktrain_fallback@dsc-fallback:shard-rkl: NOTRUN -> SKIP
>    [824] (i915#13707 [823])shard-tglu-1: NOTRUN -> SKIP [825]
>    (i915#13707 [823])
>  *=20
>    igt@kms_draw_crc@draw-method-mmap-gtt:shard-dg1: NOTRUN -> SKIP
>    [822] (i915#8812 [199]) +1 other test skip
>  *=20
>    igt@kms_dsc@dsc-fractional-bpp:shard-tglu: NOTRUN -> SKIP [821]
>    (i915#16361 [189]) +5 other tests skip
>  *=20
>    igt@kms_dsc@dsc-fractional-bpp-bigjoiner:shard-glk10: NOTRUN -> SKIP
>    [820] (i915#17458 [814]) +2 other tests skip
>  *=20
>    igt@kms_dsc@dsc-with-bpc-bigjoiner:shard-tglu-1: NOTRUN -> SKIP
>    [819] (i915#16361 [189]) +3 other tests skip
>  *=20
>    igt@kms_dsc@dsc-with-bpc-ultrajoiner:shard-glk11: NOTRUN -> SKIP
>    [818] (i915#17458 [814])
>  *=20
>    igt@kms_dsc@dsc-with-output-formats-bigjoiner:shard-rkl: NOTRUN ->
>    SKIP [816] (i915#16361 [189]) +3 other tests skipshard-dg1: NOTRUN -
>    > SKIP [817] (i915#16361 [189]) +2 other tests skip
>  *=20
>    igt@kms_dsc@dsc-with-output-formats-with-bpc:shard-glk: NOTRUN ->
>    SKIP [815] (i915#17458 [814]) +2 other tests skip
>  *=20
>    igt@kms_fbcon_fbt@psr:shard-glk10: NOTRUN -> SKIP [813] (i915#17516
>    [812])
>  *=20
>    igt@kms_feature_discovery@chamelium:shard-rkl: NOTRUN -> SKIP [809]
>    (i915#16084 [808])shard-tglu-1: NOTRUN -> SKIP [811] (i915#2065
>    [810])
>  *=20
>    igt@kms_feature_discovery@display-1x:shard-dg2: PASS [807] -> SKIP
>    [806] (i915#9738 [805])
>  *=20
>    igt@kms_feature_discovery@display-3x:shard-rkl: NOTRUN -> SKIP [803]
>    (i915#16081 [802])shard-tglu-1: NOTRUN -> SKIP [804] (i915#16081
>    [802])
>  *=20
>    igt@kms_feature_discovery@dsc:shard-dg2: NOTRUN -> SKIP [800]
>    (i915#16600 [183])shard-dg1: NOTRUN -> SKIP [801] (i915#16600 [183])
>  *=20
>    igt@kms_feature_discovery@hdr:shard-mtlp: NOTRUN -> SKIP [799]
>    (i915#16600 [183])
>  *=20
>    igt@kms_feature_discovery@psr2:shard-glk10: NOTRUN -> SKIP [798]
>    (i915#17585 [797])
>  *=20
>    igt@kms_feature_discovery@vrr:shard-tglu: NOTRUN -> SKIP [796]
>    (i915#16600 [183])
>  *=20
>    igt@kms_flip@2x-flip-vs-fences-interruptible:shard-dg1: NOTRUN ->
>    SKIP [795] (i915#8381 [794])
>  *=20
>    igt@kms_flip@2x-flip-vs-panning-vs-hang:shard-dg2: NOTRUN -> SKIP
>    [793] (i915#9934 [178]) +1 other test skip
>  *=20
>    igt@kms_flip@2x-flip-vs-suspend:shard-glk11: NOTRUN -> INCOMPLETE
>    [792] (i915#12745 [170] / i915#13356 [169] / i915#17183 [168] /
>    i915#4839 [175])
>  *=20
>    igt@kms_flip@2x-flip-vs-suspend@ac-hdmi-a1-hdmi-a2:shard-glk11:
>    NOTRUN -> INCOMPLETE [791] (i915#12745 [170] / i915#13356 [169] /
>    i915#17183 [168])
>  *=20
>    igt@kms_flip@2x-nonexisting-fb:shard-tglu: NOTRUN -> SKIP [790]
>    (i915#3637 [787] / i915#9934 [178]) +8 other tests skip
>  *=20
>    igt@kms_flip@2x-plain-flip:shard-tglu-1: NOTRUN -> SKIP [788]
>    (i915#3637 [787] / i915#9934 [178]) +2 other tests skipshard-dg1:
>    NOTRUN -> SKIP [789] (i915#9934 [178]) +4 other tests skip
>  *=20
>    igt@kms_flip@2x-plain-flip-interruptible:shard-rkl: NOTRUN -> SKIP
>    [786] (i915#9934 [178]) +8 other tests skip
>  *=20
>    igt@kms_flip@bo-too-big:shard-dg2: PASS [785] -> SKIP [784]
>    (i915#5354 [106]) +2 other tests skip
>  *=20
>    igt@kms_flip@flip-vs-wf_vblank-interruptible:shard-dg2: NOTRUN ->
>    SKIP [783] (i915#5354 [106]) +1 other test skip
>  *=20
>    igt@kms_flip_scaled_crc@flip-32bpp-4tile-to-32bpp-4tiledg2rcccs-
>    upscaling:shard-glk10: NOTRUN -> SKIP [782] (i915#17484 [770]) +3
>    other tests skip
>  *=20
>    igt@kms_flip_scaled_crc@flip-32bpp-ytileccs-to-64bpp-ytile-
>    downscaling:shard-rkl: NOTRUN -> SKIP [780] (i915#15643 [163]) +4
>    other tests skipshard-tglu-1: NOTRUN -> SKIP [781] (i915#15643
>    [163]) +1 other test skip
>  *=20
>    igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-16bpp-4tile-
>    upscaling:shard-tglu: NOTRUN -> SKIP [778] (i915#15643 [163]) +4
>    other tests skipshard-glk: NOTRUN -> SKIP [779] (i915#17484 [770])
>  *=20
>    igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-32bpp-4tiledg2rcccs-
>    upscaling:shard-dg2: NOTRUN -> SKIP [776] (i915#3555 [15] /
>    i915#8813 [448])shard-dg1: NOTRUN -> SKIP [777] (i915#15643 [163])
>  *=20
>    igt@kms_flip_scaled_crc@flip-64bpp-linear-to-32bpp-linear-
>    upscaling:shard-glk11: NOTRUN -> SKIP [775] (i915#17522 [774]) +1
>    other test skip
>  *=20
>    igt@kms_flip_scaled_crc@flip-64bpp-xtile-to-32bpp-xtile-
>    downscaling:shard-dg2: PASS [773] -> SKIP [772] (i915#3555 [15] /
>    i915#8813 [448]) +3 other tests skip
>  *=20
>    igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-32bpp-yftile-
>    upscaling:shard-glk11: NOTRUN -> SKIP [771] (i915#17484 [770])
>  *=20
>    igt@kms_flip_scaled_crc@flip-p010-4tile-to-p016-4tile:shard-dg2:
>    PASS [769] -> SKIP [768] (i915#8813 [448])
>  *=20
>    igt@kms_frontbuffer_tracking@fbc-2p-primscrn-cur-indfb-draw-
>    blt:shard-dg2: NOTRUN -> SKIP [767] (i915#16708 [102] / i915#5354
>    [106]) +9 other tests skip
>  *=20
>    igt@kms_frontbuffer_tracking@fbc-2p-primscrn-pri-indfb-draw-
>    render:shard-dg2: NOTRUN -> SKIP [766] (i915#15991 [100] / i915#5354
>    [106])
>  *=20
>    igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-pri-indfb-draw-
>    pwrite:shard-dg1: NOTRUN -> SKIP [765] (i915#17428 [109]) +45 other
>    tests skip
>  *=20
>    igt@kms_frontbuffer_tracking@fbc-rgb565-draw-blt:shard-dg2: PASS
>    [764] -> SKIP [763] (i915#16708 [102] / i915#5354 [106]) +1 other
>    test skip
>  *=20
>    igt@kms_frontbuffer_tracking@fbc-suspend:shard-rkl: PASS [762] ->
>    INCOMPLETE [761] (i915#10056 [760])
>  *=20
>    igt@kms_frontbuffer_tracking@fbc-tiling-4:shard-rkl: NOTRUN -> SKIP
>    [759] (i915#5439 [738]) +1 other test skip
>  *=20
>    igt@kms_frontbuffer_tracking@fbchdr-1p-offscreen-pri-shrfb-draw-
>    mmap-gtt:shard-mtlp: NOTRUN -> SKIP [758] (i915#15990 [115])
>  *=20
>    igt@kms_frontbuffer_tracking@fbchdr-1p-primscrn-shrfb-plflip-
>    blt:shard-dg1: NOTRUN -> SKIP [757] (i915#15989 [119]) +14 other
>    tests skip
>  *=20
>    igt@kms_frontbuffer_tracking@fbchdr-1p-primscrn-spr-indfb-draw-
>    blt:shard-glk: PASS [756] -> SKIP [755] (i915#17517 [437]) +11 other
>    tests skip
>  *=20
>    igt@kms_frontbuffer_tracking@fbchdr-suspend:shard-tglu: NOTRUN ->
>    SKIP [754] (i915#15989 [119]) +26 other tests skip
>  *=20
>    igt@kms_frontbuffer_tracking@fbchdr-tiling-linear:shard-rkl: NOTRUN
>    -> SKIP [753] (i915#15989 [119]) +30 other tests skip
>  *=20
>    igt@kms_frontbuffer_tracking@fbcpsr-1p-offscreen-pri-shrfb-draw-
>    mmap-wc:shard-dg1: NOTRUN -> SKIP [752] (i915#15104 [116] /
>    i915#15990 [115])
>  *=20
>    igt@kms_frontbuffer_tracking@fbcpsr-1p-pri-indfb-multidraw:shard-
>    rkl: NOTRUN -> SKIP [751] (i915#15102 [104]) +56 other tests skip
>  *=20
>    igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-cur-indfb-draw-mmap-
>    gtt:shard-rkl: NOTRUN -> SKIP [749] (i915#17428 [109] / i915#1825
>    [108]) +8 other tests skipshard-mtlp: NOTRUN -> SKIP [750]
>    (i915#15990 [115] / i915#8708 [158]) +1 other test skip
>  *=20
>    igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-pri-indfb-draw-
>    blt:shard-glk10: NOTRUN -> SKIP [748] (i915#17482 [742]) +66 other
>    tests skip
>  *=20
>    igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-pri-indfb-draw-
>    render:shard-mtlp: NOTRUN -> SKIP [747] (i915#15991 [100] /
>    i915#17428 [109] / i915#1825 [108]) +2 other tests skip
>  *=20
>    igt@kms_frontbuffer_tracking@fbcpsrhdr-1p-primscrn-cur-indfb-
>    move:shard-tglu-1: NOTRUN -> SKIP [746] (i915#15102 [104]) +34 other
>    tests skip
>  *=20
>    igt@kms_frontbuffer_tracking@fbcpsrhdr-1p-shrfb-fliptrack-mmap-
>    gtt:shard-glk11: NOTRUN -> SKIP [745] (i915#17482 [742]) +32 other
>    tests skip
>  *=20
>    igt@kms_frontbuffer_tracking@fbcpsrhdr-2p-primscrn-shrfb-plflip-
>    blt:shard-tglu-1: NOTRUN -> SKIP [744] (i915#17428 [109]) +54 other
>    tests skip
>  *=20
>    igt@kms_frontbuffer_tracking@fbcpsrhdr-2p-primscrn-spr-indfb-
>    move:shard-glk: NOTRUN -> SKIP [743] (i915#17482 [742]) +49 other
>    tests skip
>  *=20
>    igt@kms_frontbuffer_tracking@fbcpsrhdr-2p-scndscrn-indfb-plflip-
>    blt:shard-mtlp: NOTRUN -> SKIP [741] (i915#15991 [100] / i915#17428
>    [109]) +6 other tests skip
>  *=20
>    igt@kms_frontbuffer_tracking@fbcpsrhdr-rgb101010-draw-blt:shard-dg2:
>    NOTRUN -> SKIP [740] (i915#15102 [104])
>  *=20
>    igt@kms_frontbuffer_tracking@fbcpsrhdr-tiling-4:shard-dg1: NOTRUN ->
>    SKIP [739] (i915#5439 [738])
>  *=20
>    igt@kms_frontbuffer_tracking@hdr-1p-offscreen-pri-indfb-draw-mmap-
>    gtt:shard-tglu-1: NOTRUN -> SKIP [736] (i915#15989 [119]) +18 other
>    tests skipshard-dg1: NOTRUN -> SKIP [737] (i915#15990 [115]) +16
>    other tests skip
>  *=20
>    igt@kms_frontbuffer_tracking@hdr-1p-rte:shard-glk11: NOTRUN -> SKIP
>    [735] (i915#17517 [437]) +7 other tests skip
>  *=20
>    igt@kms_frontbuffer_tracking@hdr-rgb101010-draw-mmap-wc:shard-rkl:
>    PASS [734] -> SKIP [733] (i915#15989 [119]) +6 other tests skip
>  *=20
>    igt@kms_frontbuffer_tracking@hdr-rgb101010-draw-render:shard-glk:
>    NOTRUN -> SKIP [732] (i915#17517 [437]) +21 other tests skip
>  *=20
>    igt@kms_frontbuffer_tracking@pipe-fbc-rte:shard-tglu: NOTRUN -> SKIP
>    [729] (i915#9766 [728])shard-glk11: NOTRUN -> SKIP [731] (i915#17534
>    [730])
>  *=20
>    igt@kms_frontbuffer_tracking@psr-2p-scndscrn-indfb-msflip-blt:shard-
>    rkl: NOTRUN -> SKIP [727] (i915#17428 [109]) +75 other tests skip
>  *=20
>    igt@kms_frontbuffer_tracking@psr-2p-scndscrn-pri-shrfb-draw-mmap-
>    wc:shard-tglu: NOTRUN -> SKIP [726] (i915#17428 [109]) +91 other
>    tests skip
>  *=20
>    igt@kms_frontbuffer_tracking@psr-rgb565-draw-mmap-wc:shard-dg1:
>    NOTRUN -> SKIP [725] (i915#15990 [115] / i915#8708 [158]) +5 other
>    tests skip
>  *=20
>    igt@kms_frontbuffer_tracking@psrhdr-1p-primscrn-indfb-pgflip-
>    blt:shard-tglu: NOTRUN -> SKIP [724] (i915#15102 [104]) +51 other
>    tests skip
>  *=20
>    igt@kms_frontbuffer_tracking@psrhdr-1p-primscrn-spr-indfb-draw-mmap-
>    cpu:shard-mtlp: NOTRUN -> SKIP [723] (i915#15989 [119]) +4 other
>    tests skip
>  *=20
>    igt@kms_frontbuffer_tracking@psrhdr-1p-primscrn-spr-indfb-
>    move:shard-dg1: NOTRUN -> SKIP [722] (i915#15102 [104]) +27 other
>    tests skip
>  *=20
>    igt@kms_frontbuffer_tracking@psrhdr-2p-primscrn-spr-indfb-draw-
>    render:shard-dg2: NOTRUN -> SKIP [721] (i915#16708 [102]) +18 other
>    tests skip
>  *=20
>    igt@kms_getfb@getfb2-handle-not-fb:shard-dg1: NOTRUN -> DMESG-WARN
>    [720] (i915#4423 [72])
>  *=20
>    igt@kms_hdmi_audio_bw@audio-bw-hblank80:shard-dg2: PASS [719] ->
>    SKIP [718] (i915#17357 [98])
>  *=20
>    igt@kms_hdmi_audio_bw@suspend-disk-audio-recovery:shard-tglu: NOTRUN
>    -> FAIL [716] (i915#17101 [715] / i915#17108 [714] / i915#17188
>    [713])shard-glk11: NOTRUN -> FAIL [717] (i915#17101 [715] /
>    i915#17108 [714])
>  *=20
>    igt@kms_hdmi_audio_bw@suspend-mem-audio-recovery:shard-glk: NOTRUN -
>    > INCOMPLETE [712] (i915#13356 [169])
>  *=20
>    igt@kms_hdr@bpc-switch:shard-tglu-1: NOTRUN -> SKIP [711] (i915#3555
>    [15] / i915#8228 [88]) +2 other tests skip
>  *=20
>    igt@kms_hdr@invalid-hdr:shard-glk: NOTRUN -> SKIP [710] (i915#17498
>    [708])
>  *=20
>    igt@kms_hdr@invalid-metadata-sizes:shard-glk10: NOTRUN -> SKIP [709]
>    (i915#17498 [708])
>  *=20
>    igt@kms_hdr@static-swap:shard-dg1: NOTRUN -> SKIP [707] (i915#3555
>    [15] / i915#8228 [88]) +1 other test skip
>  *=20
>    igt@kms_hdr@static-toggle:shard-tglu: NOTRUN -> SKIP [706]
>    (i915#3555 [15] / i915#8228 [88])
>  *=20
>    igt@kms_hdr@static-toggle-suspend:shard-rkl: NOTRUN -> SKIP [705]
>    (i915#16644 [92] / i915#3555 [15] / i915#8228 [88]) +2 other tests
>    skip
>  *=20
>    igt@kms_invalid_mode@bad-hsync-start:shard-dg2: NOTRUN -> SKIP [704]
>    (i915#16746 [428] / i915#3555 [15])
>  *=20
>    igt@kms_invalid_mode@zero-vdisplay:shard-dg2: PASS [703] -> SKIP
>    [702] (i915#16746 [428] / i915#3555 [15]) +1 other test skip
>  *=20
>    igt@kms_joiner@basic-ultra-joiner:shard-tglu: NOTRUN -> SKIP [699]
>    (i915#15458 [85])shard-glk10: NOTRUN -> SKIP [701] (i915#17567
>    [700])
>  *=20
>    igt@kms_joiner@invalid-modeset-big-joiner:shard-glk10: NOTRUN ->
>    SKIP [698] (i915#17512 [697])
>  *=20
>    igt@kms_joiner@invalid-modeset-force-big-joiner:shard-rkl: NOTRUN ->
>    SKIP [695] (i915#15459 [694])shard-tglu-1: NOTRUN -> SKIP [696]
>    (i915#15459 [694])
>  *=20
>    igt@kms_joiner@invalid-modeset-force-ultra-joiner:shard-rkl: NOTRUN
>    -> SKIP [692] (i915#15458 [85]) +1 other test skipshard-tglu-1:
>    NOTRUN -> SKIP [693] (i915#15458 [85])
>  *=20
>    igt@kms_joiner@switch-modeset-ultra-joiner-big-joiner:shard-rkl:
>    NOTRUN -> SKIP [691] (i915#15638 [690] / i915#15722 [689])
>  *=20
>    igt@kms_mst@mst-suspend-read-crc:shard-glk10: NOTRUN -> SKIP [688]
>    (i915#17579 [687])
>  *=20
>    igt@kms_panel_fitting@atomic-fastset:shard-glk10: NOTRUN -> SKIP
>    [686] (i915#17577 [685])
>  *=20
>    igt@kms_panel_fitting@legacy:shard-rkl: NOTRUN -> SKIP [683]
>    (i915#6301 [682])shard-tglu-1: NOTRUN -> SKIP [684] (i915#6301
>    [682])
>  *=20
>    igt@kms_pipe_b_c_ivb@from-pipe-c-to-b-with-3-lanes:shard-tglu:
>    NOTRUN -> SKIP [681] (i915#17455 [82]) +4 other tests skip
>  *=20
>    igt@kms_pipe_b_c_ivb@pipe-b-dpms-off-modeset-pipe-c:shard-glk:
>    NOTRUN -> SKIP [680] (i915#17540 [679])
>  *=20
>    igt@kms_pipe_stress@stress-xrgb8888-4tiled:shard-rkl: NOTRUN -> SKIP
>    [678] (i915#14712 [78])
>  *=20
>    igt@kms_plane@pixel-format-4-tiled-bmg-ccs-modifier-source-
>    clamping:shard-tglu-1: NOTRUN -> SKIP [677] (i915#15709 [69]) +2
>    other tests skip
>  *=20
>    igt@kms_plane@pixel-format-4-tiled-dg2-rc-ccs-cc-modifier-source-
>    clamping:shard-rkl: NOTRUN -> SKIP [676] (i915#15709 [69]) +2 other
>    tests skip
>  *=20
>    igt@kms_plane@pixel-format-4-tiled-lnl-ccs-modifier:shard-dg2:
>    NOTRUN -> SKIP [675] (i915#15709 [69]) +1 other test skip
>  *=20
>    igt@kms_plane@pixel-format-4-tiled-mtl-rc-ccs-cc-modifier-source-
>    clamping:shard-glk10: NOTRUN -> SKIP [674] (i915#17479 [672]) +2
>    other tests skip
>  *=20
>    igt@kms_plane@pixel-format-4-tiled-mtl-rc-ccs-modifier:shard-glk:
>    NOTRUN -> SKIP [673] (i915#17479 [672]) +1 other test skip
>  *=20
>    igt@kms_plane@pixel-format-x-tiled-modifier@pipe-b-plane-5:shard-
>    rkl: NOTRUN -> SKIP [671] (i915#16386 [669]) +3 other tests skip
>  *=20
>    igt@kms_plane@pixel-format-x-tiled-modifier@pipe-b-plane-7:shard-
>    tglu-1: NOTRUN -> SKIP [670] (i915#16386 [669]) +1 other test skip
>  *=20
>    igt@kms_plane@pixel-format-y-tiled-gen12-mc-ccs-modifier-source-
>    clamping:shard-tglu: NOTRUN -> SKIP [668] (i915#15709 [69]) +3 other
>    tests skip
>  *=20
>    igt@kms_plane@pixel-format-yf-tiled-ccs-modifier-source-
>    clamping:shard-dg1: NOTRUN -> SKIP [667] (i915#15709 [69]) +3 other
>    tests skip
>  *=20
>    igt@kms_plane@plane-panning-bottom-right-suspend@pipe-b:shard-glk:
>    NOTRUN -> INCOMPLETE [666] (i915#13026 [421] / i915#13356 [169])
>  *=20
>    igt@kms_plane@plane-panning-top-left:shard-dg2: PASS [665] -> SKIP
>    [664] (i915#8825 [663]) +1 other test skip
>  *=20
>    igt@kms_plane_alpha_blend@alpha-basic:shard-glk: NOTRUN -> FAIL
>    [662] (i915#12178 [661])
>  *=20
>    igt@kms_plane_alpha_blend@alpha-basic@pipe-a-hdmi-a-1:shard-glk:
>    NOTRUN -> FAIL [660] (i915#7862 [659]) +1 other test fail
>  *=20
>    igt@kms_plane_alpha_blend@constant-alpha-max:shard-glk: NOTRUN ->
>    FAIL [658] (i915#10647 [655] / i915#12169 [657])
>  *=20
>    igt@kms_plane_alpha_blend@constant-alpha-max@pipe-c-hdmi-a-1:shard-
>    glk: NOTRUN -> FAIL [656] (i915#10647 [655]) +1 other test fail
>  *=20
>    igt@kms_plane_multiple@2x-tiling-4:shard-glk10: NOTRUN -> SKIP [654]
>    (i915#17586 [653])
>  *=20
>    igt@kms_plane_multiple@2x-tiling-none:shard-mtlp: NOTRUN -> SKIP
>    [652] (i915#13958 [63])
>  *=20
>    igt@kms_plane_multiple@2x-tiling-y:shard-tglu: NOTRUN -> SKIP [651]
>    (i915#13958 [63]) +1 other test skip
>  *=20
>    igt@kms_plane_multiple@tiling-4:shard-glk11: NOTRUN -> SKIP [650]
>    (i915#17542 [649])
>  *=20
>    igt@kms_plane_multiple@tiling-yf:shard-tglu-1: NOTRUN -> SKIP [647]
>    (i915#14259 [60])shard-dg1: NOTRUN -> SKIP [648] (i915#14259 [60])
>  *=20
>    igt@kms_plane_scaling@plane-downscale-factor-0-5-with-
>    modifiers:shard-dg2: NOTRUN -> SKIP [646] (i915#15329 [406] /
>    i915#17356 [9] / i915#9423 [409])
>  *=20
>    igt@kms_plane_scaling@plane-downscale-factor-0-5-with-
>    rotation:shard-glk: NOTRUN -> SKIP [645] (i915#17528 [644]) +3 other
>    tests skip
>  *=20
>    igt@kms_plane_scaling@plane-downscale-factor-0-5-with-rotation@pipe-
>    c:shard-tglu: NOTRUN -> SKIP [643] (i915#15329 [406]) +4 other tests
>    skip
>  *=20
>    igt@kms_plane_scaling@plane-downscale-factor-0-75-with-
>    rotation@pipe-b:shard-dg2: PASS [642] -> SKIP [641] (i915#15329
>    [406]) +8 other tests skip
>  *=20
>    igt@kms_plane_scaling@plane-scaler-with-clipping-clamping-
>    rotation:shard-tglu-1: NOTRUN -> SKIP [639] (i915#15329 [406] /
>    i915#3555 [15])shard-dg1: NOTRUN -> SKIP [640] (i915#15329 [406] /
>    i915#3555 [15])
>  *=20
>    igt@kms_plane_scaling@plane-scaler-with-clipping-clamping-
>    rotation@pipe-b:shard-glk: NOTRUN -> SKIP [636] (i915#17529 [635])
>    +3 other tests skipshard-tglu-1: NOTRUN -> SKIP [637] (i915#15329
>    [406]) +3 other tests skipshard-dg1: NOTRUN -> SKIP [638]
>    (i915#15329 [406]) +3 other tests skip
>  *=20
>    igt@kms_plane_scaling@plane-upscale-factor-0-25-with-rotation:shard-
>    dg2: PASS [634] -> SKIP [633] (i915#15329 [406] / i915#17356 [9] /
>    i915#9423 [409]) +1 other test skip
>  *=20
>    igt@kms_plane_scaling@planes-upscale-20x20-downscale-factor-0-
>    5:shard-dg2: PASS [632] -> SKIP [631] (i915#15329 [406] / i915#17356
>    [9] / i915#3555 [15] / i915#6953 [410] / i915#9423 [409])
>  *=20
>    igt@kms_plane_scaling@planes-upscale-20x20-downscale-factor-0-
>    5@pipe-d:shard-dg2: PASS [630] -> SKIP [629] (i915#15329 [406] /
>    i915#17356 [9]) +2 other tests skip
>  *=20
>    igt@kms_plane_scaling@planes-upscale-factor-0-25-downscale-factor-0-
>    75:shard-dg2: NOTRUN -> SKIP [628] (i915#15329 [406] / i915#17356
>    [9] / i915#3555 [15] / i915#6953 [410] / i915#9423 [409])
>  *=20
>    igt@kms_plane_scaling@planes-upscale-factor-0-25-downscale-factor-0-
>    75@pipe-c:shard-dg2: NOTRUN -> SKIP [627] (i915#15329 [406]) +5
>    other tests skip
>  *=20
>    igt@kms_plane_scaling@planes-upscale-factor-0-25-downscale-factor-0-
>    75@pipe-d:shard-dg2: NOTRUN -> SKIP [626] (i915#15329 [406] /
>    i915#17356 [9]) +1 other test skip
>  *=20
>    igt@kms_pm_backlight@brightness-with-dpms:shard-rkl: NOTRUN -> SKIP
>    [624] (i915#12343 [620])shard-tglu-1: NOTRUN -> SKIP [625]
>    (i915#12343 [620])
>  *=20
>    igt@kms_pm_backlight@fade:shard-rkl: NOTRUN -> SKIP [621]
>    (i915#12343 [620] / i915#5354 [106])shard-tglu-1: NOTRUN -> SKIP
>    [623] (i915#12343 [620] / i915#9812 [622])
>  *=20
>    igt@kms_pm_dc@dc5-dpms-negative:shard-dg2: PASS [619] -> SKIP [618]
>    (i915#13441 [617])
>  *=20
>    igt@kms_pm_dc@dc5-pageflip-negative:shard-glk11: NOTRUN -> SKIP
>    [616] (i915#17495 [615])
>  *=20
>    igt@kms_pm_dc@dc5-psr:shard-tglu: NOTRUN -> SKIP [612] (i915#15948
>    [57])shard-glk10: NOTRUN -> SKIP [614] (i915#17564 [613])
>  *=20
>    igt@kms_pm_dc@dc5-retention-flops:shard-tglu-1: NOTRUN -> SKIP [608]
>    (i915#3828 [607])shard-dg1: NOTRUN -> SKIP [609] (i915#3828 [607])
>    +1 other test skipshard-glk: NOTRUN -> SKIP [611] (i915#17553 [610])
>  *=20
>    igt@kms_pm_dc@dc6-dpms:shard-rkl: NOTRUN -> FAIL [606] (i915#16479
>    [605])
>  *=20
>    igt@kms_pm_dc@dc9-dpms:shard-rkl: NOTRUN -> SKIP [603] (i915#15739
>    [602])shard-tglu-1: NOTRUN -> SKIP [604] (i915#15739 [602])
>  *=20
>    igt@kms_pm_lpsp@kms-lpsp:shard-rkl: NOTRUN -> SKIP [601] (i915#9340
>    [600])
>  *=20
>    igt@kms_pm_rpm@dpms-lpsp:shard-dg1: PASS [599] -> SKIP [598]
>    (i915#15073 [591])
>  *=20
>    igt@kms_pm_rpm@dpms-non-lpsp:shard-rkl: PASS [597] -> SKIP [596]
>    (i915#15073 [591])
>  *=20
>    igt@kms_pm_rpm@modeset-lpsp:shard-glk10: NOTRUN -> SKIP [595]
>    (i915#15073 [591])
>  *=20
>    igt@kms_pm_rpm@modeset-lpsp-stress-no-wait:shard-rkl: NOTRUN -> SKIP
>    [594] (i915#15073 [591]) +1 other test skip
>  *=20
>    igt@kms_pm_rpm@modeset-non-lpsp:shard-tglu-1: NOTRUN -> SKIP [593]
>    (i915#15073 [591])
>  *=20
>    igt@kms_pm_rpm@modeset-non-lpsp-stress-no-wait:shard-tglu: NOTRUN ->
>    SKIP [592] (i915#15073 [591])
>  *=20
>    igt@kms_pm_rpm@pc8-residency:shard-rkl: NOTRUN -> SKIP [589]
>    (i915#17434 [588] / i915#17450 [587])shard-mtlp: NOTRUN -> SKIP
>    [590] (i915#17450 [587]) +1 other test skip
>  *=20
>    igt@kms_prime@basic-modeset-hybrid:shard-tglu: NOTRUN -> SKIP [584]
>    (i915#6524 [48])shard-glk10: NOTRUN -> SKIP [586] (i915#17569 [585])
>  *=20
>    igt@kms_psr2_sf@fbc-pr-cursor-plane-update-sf:shard-tglu: NOTRUN ->
>    SKIP [583] (i915#11520 [43]) +11 other tests skip
>  *=20
>    igt@kms_psr2_sf@fbc-psr2-overlay-plane-move-continuous-exceed-fully-
>    sf:shard-mtlp: NOTRUN -> SKIP [582] (i915#12316 [581]) +1 other test
>    skip
>  *=20
>    igt@kms_psr2_sf@fbc-psr2-overlay-plane-move-continuous-exceed-fully-
>    sf@pipe-a-edp-1:shard-mtlp: NOTRUN -> SKIP [580] (i915#9808 [579])
>  *=20
>    igt@kms_psr2_sf@fbc-psr2-overlay-plane-move-continuous-exceed-
>    sf:shard-dg2: NOTRUN -> SKIP [577] (i915#11520 [43])shard-dg1:
>    NOTRUN -> SKIP [578] (i915#11520 [43]) +4 other tests skip
>  *=20
>    igt@kms_psr2_sf@pr-primary-plane-update-sf-dmg-area-big-fb:shard-
>    glk10: NOTRUN -> SKIP [576] (i915#11520 [43]) +5 other tests skip
>  *=20
>    igt@kms_psr2_sf@psr2-cursor-plane-move-continuous-exceed-sf:shard-
>    glk11: NOTRUN -> SKIP [575] (i915#11520 [43]) +2 other tests skip
>  *=20
>    igt@kms_psr2_sf@psr2-cursor-plane-move-continuous-sf:shard-glk:
>    NOTRUN -> SKIP [574] (i915#11520 [43]) +4 other tests skip
>  *=20
>    igt@kms_psr2_sf@psr2-overlay-plane-update-sf-dmg-area:shard-rkl:
>    NOTRUN -> SKIP [572] (i915#11520 [43]) +11 other tests skipshard-
>    tglu-1: NOTRUN -> SKIP [573] (i915#11520 [43]) +5 other tests skip
>  *=20
>    igt@kms_psr2_su@frontbuffer-xrgb8888:shard-tglu-1: NOTRUN -> SKIP
>    [571] (i915#9683 [569])
>  *=20
>    igt@kms_psr2_su@page_flip-xrgb8888:shard-rkl: NOTRUN -> SKIP [570]
>    (i915#9683 [569]) +1 other test skip
>  *=20
>    igt@kms_psr@fbc-pr-primary-mmap-cpu:shard-glk: NOTRUN -> SKIP [568]
>    (i915#17480 [558]) +9 other tests skip
>  *=20
>    igt@kms_psr@fbc-pr-primary-render:shard-glk10: NOTRUN -> SKIP [567]
>    (i915#17480 [558]) +16 other tests skip
>  *=20
>    igt@kms_psr@fbc-pr-sprite-render:shard-tglu-1: NOTRUN -> SKIP [565]
>    (i915#9732 [37]) +13 other tests skipshard-dg1: NOTRUN -> SKIP [566]
>    (i915#1072 [38] / i915#9732 [37]) +15 other tests skip
>  *=20
>    igt@kms_psr@fbc-psr-cursor-plane-onoff:shard-tglu: NOTRUN -> SKIP
>    [564] (i915#9732 [37]) +21 other tests skip
>  *=20
>    igt@kms_psr@fbc-psr-primary-blt:shard-dg2: NOTRUN -> SKIP [563]
>    (i915#1072 [38] / i915#9732 [37]) +4 other tests skip
>  *=20
>    igt@kms_psr@fbc-psr2-sprite-mmap-cpu:shard-glk11: NOTRUN -> SKIP
>    [562] (i915#17480 [558]) +7 other tests skip
>  *=20
>    igt@kms_psr@pr-sprite-plane-onoff:shard-mtlp: NOTRUN -> SKIP [561]
>    (i915#9688 [560]) +1 other test skip
>  *=20
>    igt@kms_psr@psr-primary-page-flip:shard-glk10: NOTRUN -> SKIP [559]
>    (i915#17480 [558] / i915#9732 [37])
>  *=20
>    igt@kms_psr@psr-sprite-plane-move:shard-rkl: NOTRUN -> SKIP [557]
>    (i915#1072 [38] / i915#9732 [37]) +19 other tests skip
>  *=20
>    igt@kms_psr_stress_test@flip-primary-invalidate-overlay:shard-tglu-
>    1: NOTRUN -> SKIP [553] (i915#15949 [552])shard-dg1: NOTRUN -> SKIP
>    [554] (i915#15949 [552])shard-glk: NOTRUN -> SKIP [556] (i915#17554
>    [555])
>  *=20
>    igt@kms_rotation_crc@multiplane-rotation-cropping-bottom:shard-glk:
>    NOTRUN -> INCOMPLETE [551] (i915#15500 [550] / i915#16184 [549])
>  *=20
>    igt@kms_rotation_crc@primary-4-tiled-reflect-x-0:shard-tglu-1:
>    NOTRUN -> SKIP [548] (i915#5289 [29])
>  *=20
>    igt@kms_rotation_crc@primary-4-tiled-reflect-x-180:shard-rkl: NOTRUN
>    -> SKIP [547] (i915#5289 [29]) +1 other test skip
>  *=20
>    igt@kms_rotation_crc@primary-y-tiled-reflect-x-270:shard-glk10:
>    NOTRUN -> SKIP [546] (i915#17488 [545]) +1 other test skip
>  *=20
>    igt@kms_rotation_crc@primary-yf-tiled-reflect-x-270:shard-dg1:
>    NOTRUN -> SKIP [544] (i915#17432 [30] / i915#5289 [29])
>  *=20
>    igt@kms_rotation_crc@primary-yf-tiled-reflect-x-90:shard-dg2: NOTRUN
>    -> SKIP [543] (i915#12755 [35] / i915#15867 [34] / i915#5190 [26])
>  *=20
>    igt@kms_scaling_modes@scaling-mode-none:shard-mtlp: NOTRUN -> SKIP
>    [542] (i915#3555 [15] / i915#5030 [539] / i915#9041 [538])
>  *=20
>    igt@kms_scaling_modes@scaling-mode-none@pipe-a-edp-1:shard-mtlp:
>    NOTRUN -> SKIP [541] (i915#5030 [539]) +2 other tests skip
>  *=20
>    igt@kms_scaling_modes@scaling-mode-none@pipe-d-edp-1:shard-mtlp:
>    NOTRUN -> SKIP [540] (i915#5030 [539] / i915#9041 [538])
>  *=20
>    igt@kms_tiled_display@basic-test-pattern-with-chamelium:shard-tglu:
>    NOTRUN -> SKIP [537] (i915#8623 [23])
>  *=20
>    igt@kms_tv_load_detect@load-detect:shard-dg2: NOTRUN -> SKIP [535]
>    (i915#17445 [534])shard-dg1: NOTRUN -> SKIP [536] (i915#17445 [534])
>  *=20
>    igt@kms_vblank@ts-continuation-dpms-suspend:shard-snb: PASS [533] ->
>    INCOMPLETE [532] (i915#12276 [529] / i915#13356 [169]) +1 other test
>    incomplete
>  *=20
>    igt@kms_vblank@ts-continuation-dpms-suspend@pipe-c-hdmi-a-1:shard-
>    glk: NOTRUN -> INCOMPLETE [531] (i915#12276 [529] / i915#13356
>    [169]) +1 other test incomplete
>  *=20
>    igt@kms_vblank@ts-continuation-suspend:shard-mtlp: NOTRUN ->
>    INCOMPLETE [530] (i915#12276 [529]) +1 other test incomplete
>  *=20
>    igt@kms_vblank@ts-continuation-suspend@pipe-a-edp-1:shard-mtlp:
>    NOTRUN -> FAIL [528] (i915#17209 [527])
>  *=20
>    igt@kms_vrr@flip-basic-fastset:shard-rkl: NOTRUN -> SKIP [526]
>    (i915#9906 [11])
>  *=20
>    igt@kms_vrr@flip-dpms:shard-glk11: NOTRUN -> SKIP [525] (i915#17520
>    [522])
>  *=20
>    igt@kms_vrr@flip-suspend:shard-glk: NOTRUN -> SKIP [524] (i915#17520
>    [522])
>  *=20
>    igt@kms_vrr@flipline:shard-glk10: NOTRUN -> SKIP [523] (i915#17520
>    [522]) +1 other test skip
>  *=20
>    igt@kms_vrr@lobf:shard-dg1: NOTRUN -> SKIP [521] (i915#11920 [520])
>  *=20
>    igt@kms_vrr@negative-basic:shard-tglu: NOTRUN -> SKIP [519]
>    (i915#3555 [15] / i915#9906 [11])
>  *=20
>    igt@perf@gen12-unprivileged-single-ctx-counters:shard-glk11: NOTRUN
>    -> SKIP [518] (i915#17536 [517])
>  *=20
>    igt@perf@mi-rpc:shard-dg1: NOTRUN -> SKIP [516] (i915#2434 [515])
>  *=20
>    igt@perf@unprivileged-single-ctx-counters:shard-rkl: NOTRUN -> SKIP
>    [513] (i915#2433 [512])shard-tglu-1: NOTRUN -> SKIP [514]
>    (i915#17455 [82]) +5 other tests skip
>  *=20
>    igt@perf_pmu@module-unload:shard-rkl: NOTRUN -> FAIL [511]
>    (i915#17119 [510])
>  *=20
>    igt@perf_pmu@rc6-all-gts:shard-glk10: NOTRUN -> SKIP [509]
>    (i915#17583 [508])
>  *=20
>    igt@prime_udl@share-import:shard-rkl: NOTRUN -> SKIP [506]
>    (i915#16420 [505])shard-tglu-1: NOTRUN -> SKIP [507] (i915#16420
>    [505])
>  *=20
>    igt@prime_vgem@coherency-gtt:shard-glk10: NOTRUN -> SKIP [504]
>    (i915#17467 [503])
>  *=20
>    igt@prime_vgem@fence-flip-hang:shard-tglu-1: NOTRUN -> SKIP [502]
>    (i915#17448 [2])
>  *=20
>    igt@prime_vgem@fence-read-hang:shard-mtlp: NOTRUN -> SKIP [501]
>    (i915#3708 [1])
>  *=20
>    igt@prime_vgem@fence-write-hang:shard-rkl: NOTRUN -> SKIP [500]
>    (i915#17448 [2] / i915#3708 [1])
>  *=20
>    igt@tools_test@sysfs_l3_parity:shard-rkl: NOTRUN -> SKIP [499]
>    (i915#17447 [498])
> Possible fixes *=20
>    igt@drm_read@short-buffer-block:shard-dg2: SKIP [497] (i915#17359
>    [496]) -> PASS [495] +2 other tests pass
>  *=20
>    igt@gem_ccs@suspend-resume:shard-dg2: INCOMPLETE [494] (i915#13356
>    [169] / i915#16348 [493]) -> PASS [492] +1 other test pass
>  *=20
>    igt@gem_eio@in-flight-suspend:shard-dg1: DMESG-WARN [491]
>    (i915#13390 [490] / i915#4391 [489] / i915#4423 [72]) -> PASS [488]
>  *=20
>    igt@gem_linear_blits@normal:shard-dg1: FAIL [487] (i915#15391 [486])
>    -> PASS [485]
>  *=20
>    igt@gem_workarounds@suspend-resume-fd:shard-rkl: INCOMPLETE [484]
>    (i915#13356 [169]) -> PASS [483] +3 other tests pass
>  *=20
>    igt@i915_suspend@debugfs-reader:shard-mtlp: INCOMPLETE [482]
>    (i915#17182 [481]) -> PASS [480]
>  *=20
>    igt@kms_async_flips@alternate-sync-async-flip-atomic:shard-dg1: FAIL
>    [479] (i915#14888 [478]) -> PASS [477] +1 other test pass
>  *=20
>    igt@kms_async_flips@async-flip-suspend-resume@pipe-c-edp-1:shard-
>    mtlp: ABORT [476] (i915#17175 [336]) -> PASS [475]
>  *=20
>    igt@kms_big_fb@x-tiled-64bpp-rotate-180:shard-dg2: SKIP [474]
>    (i915#17356 [9]) -> PASS [473] +40 other tests pass
>  *=20
>    igt@kms_busy@basic:shard-dg2: SKIP [472] (i915#11190 [471] /
>    i915#17356 [9]) -> PASS [470] +2 other tests pass
>  *=20
>    igt@kms_color@ctm-0-25:shard-dg2: SKIP [469] (i915#12655 [468] /
>    i915#17373 [467]) -> PASS [466] +1 other test pass
>  *=20
>    igt@kms_color_pipeline@plane-fixed-matrix-yuv-rgb-bt601-lut1d:shard-
>    dg2: SKIP [465] (i915#15529 [464]) -> PASS [463]
>  *=20
>    igt@kms_cursor_crc@cursor-sliding-128x42@pipe-a-hdmi-a-1:shard-tglu:
>    FAIL [462] (i915#13566 [461]) -> PASS [460] +1 other test pass
>  *=20
>    igt@kms_fbcon_fbt@fbc-suspend:shard-rkl: INCOMPLETE [459] (i915#9878
>    [458]) -> PASS [457]
>  *=20
>    igt@kms_flip@basic-flip-vs-dpms:shard-dg2: SKIP [456] (i915#5354
>    [106]) -> PASS [455] +5 other tests pass
>  *=20
>    igt@kms_flip@flip-vs-suspend-interruptible:shard-rkl: INCOMPLETE
>    [454] (i915#16276 [453] / i915#6113 [174]) -> PASS [452]
>  *=20
>    igt@kms_flip@nonexisting-fb-interruptible:shard-dg1: DMESG-WARN
>    [451] (i915#4423 [72]) -> PASS [450]
>  *=20
>    igt@kms_flip_scaled_crc@flip-64bpp-linear-to-16bpp-linear-
>    downscaling:shard-dg2: SKIP [449] (i915#3555 [15] / i915#8813 [448])
>    -> PASS [447] +1 other test pass
>  *=20
>    igt@kms_frontbuffer_tracking@fbc-1p-offscreen-pri-indfb-draw-mmap-
>    cpu:shard-dg2: SKIP [446] (i915#16708 [102]) -> PASS [445] +1 other
>    test pass
>  *=20
>    igt@kms_frontbuffer_tracking@fbc-1p-primscrn-spr-indfb-draw-
>    render:shard-dg1: FAIL [444] -> PASS [443]
>  *=20
>    igt@kms_frontbuffer_tracking@fbc-indfb-scaledprimary:shard-dg2: SKIP
>    [442] (i915#16708 [102] / i915#5354 [106]) -> PASS [441] +7 other
>    tests pass
>  *=20
>    igt@kms_frontbuffer_tracking@fbchdr-1p-primscrn-cur-indfb-
>    onoff:shard-rkl: SKIP [440] (i915#15989 [119]) -> PASS [439] +20
>    other tests pass
>  *=20
>    igt@kms_frontbuffer_tracking@hdr-2p-primscrn-spr-indfb-draw-mmap-
>    cpu:shard-glk: SKIP [438] (i915#17517 [437]) -> PASS [436] +8 other
>    tests pass
>  *=20
>    igt@kms_hdmi_audio_bw@suspend-mem-audio-recovery:shard-dg2: SKIP
>    [435] (i915#17357 [98]) -> PASS [434]
>  *=20
>    igt@kms_hdr@static-toggle:shard-rkl: SKIP [433] (i915#16644 [92] /
>    i915#3555 [15] / i915#8228 [88]) -> PASS [432]
>  *=20
>    igt@kms_invalid_mode@overflow-vrefresh:shard-dg2: SKIP [431]
>    (i915#16746 [428]) -> PASS [430]
>  *=20
>    igt@kms_invalid_mode@uint-max-clock:shard-dg2: SKIP [429]
>    (i915#16746 [428] / i915#3555 [15]) -> PASS [427]
>  *=20
>    igt@kms_pipe_crc_basic@suspend-read-crc:shard-rkl: INCOMPLETE [426]
>    (i915#12756 [425] / i915#13476 [424]) -> PASS [423]
>  *=20
>    igt@kms_plane@plane-panning-bottom-right-suspend@pipe-a:shard-glk:
>    INCOMPLETE [422] (i915#13026 [421] / i915#13356 [169]) -> PASS [420]
>  *=20
>    igt@kms_plane@plane-panning-bottom-right-suspend@pipe-b:shard-rkl:
>    ABORT [419] (i915#15132 [96]) -> PASS [418] +1 other test pass
>  *=20
>    igt@kms_plane_scaling@invalid-num-scalers:shard-dg2: SKIP [417]
>    (i915#17356 [9] / i915#3555 [15] / i915#6953 [410] / i915#9423
>    [409]) -> PASS [416]
>  *=20
>    igt@kms_plane_scaling@plane-upscale-20x20-with-pixel-format@pipe-
>    c:shard-dg2: SKIP [415] (i915#15329 [406]) -> PASS [414] +11 other
>    tests pass
>  *=20
>    igt@kms_plane_scaling@planes-downscale-factor-0-5-upscale-
>    20x20:shard-dg2: SKIP [413] (i915#15329 [406] / i915#17356 [9] /
>    i915#9423 [409]) -> PASS [412] +2 other tests pass
>  *=20
>    igt@kms_plane_scaling@planes-downscale-factor-0-75-upscale-factor-0-
>    25:shard-dg2: SKIP [411] (i915#15329 [406] / i915#17356 [9] /
>    i915#6953 [410] / i915#9423 [409]) -> PASS [408]
>  *=20
>    igt@kms_plane_scaling@planes-downscale-factor-0-75-upscale-factor-0-
>    25@pipe-d:shard-dg2: SKIP [407] (i915#15329 [406] / i915#17356 [9])
>    -> PASS [405] +3 other tests pass
> Warnings *=20
>    igt@gem_ccs@ctrl-surf-copy:shard-rkl: SKIP [404] (i915#3555 [15] /
>    i915#9323 [402]) -> SKIP [403] (i915#14544 [4] / i915#3555 [15] /
>    i915#9323 [402])
>  *=20
>    igt@gem_ccs@large-ctrl-surf-copy:shard-rkl: SKIP [401] (i915#13008
>    [399]) -> SKIP [400] (i915#13008 [399] / i915#14544 [4])
>  *=20
>    igt@gem_close_race@multigpu-basic-process:shard-rkl: SKIP [398]
>    (i915#7697 [396]) -> SKIP [397] (i915#14544 [4] / i915#7697 [396])
>  *=20
>    igt@gem_create@create-ext-cpu-access-sanity-check:shard-rkl: SKIP
>    [395] (i915#6335 [393]) -> SKIP [394] (i915#14544 [4] / i915#6335
>    [393])
>  *=20
>    igt@gem_ctx_sseu@engines:shard-rkl: SKIP [392] (i915#14544 [4] /
>    i915#280 [390]) -> SKIP [391] (i915#280 [390])
>  *=20
>    igt@gem_eio@in-flight-suspend:shard-mtlp: ABORT [389] (i915#17165
>    [285]) -> FAIL [388] (i915#17268 [387])
>  *=20
>    igt@gem_eio@kms:shard-tglu: DMESG-WARN [386] (i915#13363 [384]) ->
>    ABORT [385] (i915#13363 [384])
>  *=20
>    igt@gem_exec_big@single:shard-tglu: FAIL [383] (i915#15944 [382]) ->
>    FAIL [381] (i915#15816 [380])
>  *=20
>    igt@gem_exec_params@rsvd2-dirt:shard-rkl: SKIP [379] (i915#17453
>    [377]) -> SKIP [378] (i915#14544 [4] / i915#17453 [377])
>  *=20
>    igt@gem_exec_params@secure-non-root:shard-rkl: SKIP [376]
>    (i915#17416 [374]) -> SKIP [375] (i915#14544 [4] / i915#17416 [374])
>  *=20
>    igt@gem_exec_reloc@basic-gtt-cpu-active:shard-rkl: SKIP [373]
>    (i915#3281 [369]) -> SKIP [372] (i915#14544 [4] / i915#3281 [369])
>    +6 other tests skip
>  *=20
>    igt@gem_exec_reloc@basic-softpin:shard-rkl: SKIP [371] (i915#14544
>    [4] / i915#3281 [369]) -> SKIP [370] (i915#3281 [369]) +1 other test
>    skip
>  *=20
>    igt@gem_lmem_evict@dontneed-evict-race:shard-rkl: SKIP [368]
>    (i915#4613 [361] / i915#7582 [366]) -> SKIP [367] (i915#14544 [4] /
>    i915#4613 [361] / i915#7582 [366])
>  *=20
>    igt@gem_lmem_swapping@massive-random:shard-rkl: SKIP [365]
>    (i915#14544 [4] / i915#4613 [361]) -> SKIP [364] (i915#4613 [361])
>    +1 other test skip
>  *=20
>    igt@gem_lmem_swapping@verify-random-ccs:shard-rkl: SKIP [363]
>    (i915#4613 [361]) -> SKIP [362] (i915#14544 [4] / i915#4613 [361])
>  *=20
>    igt@gem_pread@display:shard-rkl: SKIP [360] (i915#3282 [356]) ->
>    SKIP [359] (i915#14544 [4] / i915#3282 [356])
>  *=20
>    igt@gem_pread@self:shard-rkl: SKIP [358] (i915#14544 [4] / i915#3282
>    [356]) -> SKIP [357] (i915#3282 [356])
>  *=20
>    igt@gem_userptr_blits@dmabuf-unsync:shard-rkl: SKIP [355]
>    (i915#14544 [4] / i915#3297 [353]) -> SKIP [354] (i915#3297 [353])
>    +3 other tests skip
>  *=20
>    igt@gen9_exec_parse@shadow-peek:shard-rkl: SKIP [352] (i915#2527
>    [348]) -> SKIP [351] (i915#14544 [4] / i915#2527 [348]) +3 other
>    tests skip
>  *=20
>    igt@gen9_exec_parse@valid-registers:shard-rkl: SKIP [350]
>    (i915#14544 [4] / i915#2527 [348]) -> SKIP [349] (i915#2527 [348])
>  *=20
>    igt@i915_module_load@resize-bar:shard-rkl: SKIP [347] (i915#6412
>    [345]) -> SKIP [346] (i915#14544 [4] / i915#6412 [345])
>  *=20
>    igt@i915_pm_rc6_residency@media-rc6-accuracy:shard-rkl: SKIP [344]
>    (i915#16080 [342] / i915#16166 [341]) -> SKIP [343] (i915#14544 [4]
>    / i915#16080 [342] / i915#16166 [341])
>  *=20
>    igt@intel_hwmon@hwmon-write:shard-rkl: SKIP [340] (i915#14544 [4] /
>    i915#7707 [338]) -> SKIP [339] (i915#7707 [338])
>  *=20
>    igt@kms_async_flips@async-flip-suspend-resume:shard-mtlp: ABORT
>    [337] (i915#17175 [336]) -> FAIL [335] (i915#17150 [334])
>  *=20
>    igt@kms_atomic@plane-primary-overlay-mutable-zpos:shard-dg2: SKIP
>    [331] (i915#17356 [9]) -> SKIP [330] (i915#9531 [329])shard-rkl:
>    SKIP [333] (i915#14544 [4] / i915#9531 [329]) -> SKIP [332]
>    (i915#9531 [329])
>  *=20
>    igt@kms_big_fb@4-tiled-16bpp-rotate-180:shard-rkl: SKIP [328]
>    (i915#14544 [4] / i915#4538 [303] / i915#5286 [320]) -> SKIP [327]
>    (i915#4538 [303] / i915#5286 [320])
>  *=20
>    igt@kms_big_fb@4-tiled-16bpp-rotate-270:shard-dg2: SKIP [326]
>    (i915#17356 [9]) -> SKIP [325] (i915#17431 [317]) +1 other test skip
>  *=20
>    igt@kms_big_fb@4-tiled-32bpp-rotate-270:shard-dg2: SKIP [324]
>    (i915#17431 [317]) -> SKIP [323] (i915#17356 [9]) +3 other tests
>    skip
>  *=20
>    igt@kms_big_fb@4-tiled-max-hw-stride-32bpp-rotate-0-hflip:shard-rkl:
>    SKIP [322] (i915#4538 [303] / i915#5286 [320]) -> SKIP [321]
>    (i915#14544 [4] / i915#4538 [303] / i915#5286 [320]) +3 other tests
>    skip
>  *=20
>    igt@kms_big_fb@y-tiled-8bpp-rotate-90:shard-dg2: SKIP [315]
>    (i915#4538 [303] / i915#5190 [26]) -> SKIP [314] (i915#17356 [9] /
>    i915#5190 [26]) +7 other tests skipshard-rkl: SKIP [319] (i915#17431
>    [317] / i915#3638 [316]) -> SKIP [318] (i915#14544 [4] / i915#17431
>    [317] / i915#3638 [316]) +3 other tests skip
>  *=20
>    igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-180-hflip-async-
>    flip:shard-dg2: SKIP [313] (i915#17356 [9] / i915#5190 [26]) -> SKIP
>    [312] (i915#4538 [303] / i915#5190 [26]) +9 other tests skip
>  *=20
>    igt@kms_big_fb@yf-tiled-16bpp-rotate-270:shard-rkl: SKIP [311]
>    (i915#4538 [303]) -> SKIP [310] (i915#14544 [4] / i915#4538 [303])
>    +4 other tests skip
>  *=20
>    igt@kms_big_fb@yf-tiled-64bpp-rotate-180:shard-rkl: SKIP [309]
>    (i915#14544 [4] / i915#4538 [303]) -> SKIP [308] (i915#4538 [303])
>    +1 other test skip
>  *=20
>    igt@kms_big_fb@yf-tiled-addfb-size-offset-overflow:shard-rkl: SKIP
>    [307] (i915#14544 [4] / i915#17432 [30]) -> SKIP [306] (i915#17432
>    [30])
>  *=20
>    igt@kms_big_fb@yf-tiled-max-hw-stride-64bpp-rotate-0:shard-dg1: SKIP
>    [305] (i915#4423 [72] / i915#4538 [303]) -> SKIP [304] (i915#4538
>    [303])
>  *=20
>    igt@kms_ccs@bad-rotation-90-4-tiled-mtl-rc-ccs:shard-dg2: SKIP [302]
>    (i915#10307 [270] / i915#6095 [269]) -> SKIP [301] (i915#17356 [9])
>    +6 other tests skip
>  *=20
>    igt@kms_ccs@crc-primary-basic-4-tiled-mtl-mc-ccs@pipe-a-hdmi-a-
>    2:shard-rkl: SKIP [300] (i915#14544 [4] / i915#6095 [269]) -> SKIP
>    [299] (i915#6095 [269]) +1 other test skip
>  *=20
>    igt@kms_ccs@crc-primary-basic-4-tiled-mtl-mc-ccs@pipe-c-hdmi-a-
>    2:shard-rkl: SKIP [298] (i915#14098 [273] / i915#14544 [4] /
>    i915#6095 [269]) -> SKIP [297] (i915#14098 [273] / i915#6095 [269])
>    +2 other tests skip
>  *=20
>    igt@kms_ccs@crc-primary-rotation-180-4-tiled-dg2-rc-ccs@pipe-b-hdmi-
>    a-2:shard-rkl: SKIP [296] (i915#6095 [269]) -> SKIP [295]
>    (i915#14544 [4] / i915#6095 [269]) +13 other tests skip
>  *=20
>    igt@kms_ccs@crc-primary-rotation-180-4-tiled-mtl-mc-ccs:shard-dg2:
>    SKIP [292] (i915#17356 [9]) -> SKIP [291] (i915#10307 [270] /
>    i915#10434 [290] / i915#6095 [269])shard-dg1: SKIP [294] (i915#6095
>    [269]) -> SKIP [293] (i915#4423 [72] / i915#6095 [269])
>  *=20
>    igt@kms_ccs@crc-primary-suspend-4-tiled-mtl-mc-ccs:shard-mtlp: ABORT
>    [289] (i915#17165 [285]) -> INCOMPLETE [288] (i915#15582 [287])
>  *=20
>    igt@kms_ccs@crc-primary-suspend-4-tiled-mtl-mc-ccs@pipe-c-edp-
>    1:shard-mtlp: ABORT [286] (i915#17165 [285]) -> FAIL [284]
>    (i915#17158 [283])
>  *=20
>    igt@kms_ccs@crc-primary-suspend-4-tiled-mtl-rc-ccs-cc:shard-dg2:
>    SKIP [282] (i915#17356 [9]) -> SKIP [281] (i915#6095 [269]) +1 other
>    test skip
>  *=20
>    igt@kms_ccs@crc-primary-suspend-y-tiled-gen12-rc-ccs-cc:shard-dg2:
>    SKIP [280] (i915#6095 [269]) -> SKIP [279] (i915#17356 [9])
>  *=20
>    igt@kms_ccs@crc-sprite-planes-basic-4-tiled-lnl-ccs:shard-rkl: SKIP
>    [278] (i915#12313 [276]) -> SKIP [277] (i915#12313 [276] /
>    i915#14544 [4]) +1 other test skip
>  *=20
>    igt@kms_ccs@missing-ccs-buffer-4-tiled-mtl-mc-ccs:shard-rkl: SKIP
>    [275] (i915#14098 [273] / i915#6095 [269]) -> SKIP [274] (i915#14098
>    [273] / i915#14544 [4] / i915#6095 [269]) +15 other tests skip
>  *=20
>    igt@kms_ccs@random-ccs-data-y-tiled-gen12-rc-ccs-cc:shard-dg2: SKIP
>    [272] (i915#17356 [9]) -> SKIP [271] (i915#10307 [270] / i915#6095
>    [269]) +8 other tests skip
>  *=20
>    igt@kms_chamelium_color_pipeline@plane-fixed-matrix-yuv-rgb-bt601-
>    lim-lut1d:shard-rkl: SKIP [268] (i915#17427 [264]) -> SKIP [267]
>    (i915#14544 [4] / i915#17427 [264]) +2 other tests skip
>  *=20
>    igt@kms_chamelium_color_pipeline@plane-fixed-matrix-yuv-rgb-bt709-
>    lim-lut1d:shard-rkl: SKIP [266] (i915#14544 [4] / i915#17427 [264])
>    -> SKIP [265] (i915#17427 [264]) +1 other test skip
>  *=20
>    igt@kms_chamelium_edid@dp-edid-change-during-suspend:shard-rkl: SKIP
>    [263] (i915#11151 [259] / i915#7828 [258]) -> SKIP [262] (i915#11151
>    [259] / i915#14544 [4] / i915#7828 [258]) +7 other tests skip
>  *=20
>    igt@kms_chamelium_frames@hdmi-frame-dump:shard-rkl: SKIP [261]
>    (i915#11151 [259] / i915#14544 [4] / i915#7828 [258]) -> SKIP [260]
>    (i915#11151 [259] / i915#7828 [258]) +1 other test skip
>  *=20
>    igt@kms_content_protection@dp-mst-lic-type-0:shard-dg2: SKIP [257]
>    (i915#15330 [250] / i915#3299 [253]) -> SKIP [256] (i915#17356 [9])
>  *=20
>    igt@kms_content_protection@dp-mst-lic-type-1:shard-dg2: SKIP [255]
>    (i915#17356 [9]) -> SKIP [254] (i915#15330 [250] / i915#3299 [253])
>  *=20
>    igt@kms_content_protection@dp-mst-type-1:shard-rkl: SKIP [252]
>    (i915#15330 [250] / i915#3116 [249]) -> SKIP [251] (i915#14544 [4] /
>    i915#15330 [250] / i915#3116 [249]) +1 other test skip
>  *=20
>    igt@kms_content_protection@legacy:shard-rkl: SKIP [248] (i915#15865
>    [240]) -> SKIP [247] (i915#14544 [4] / i915#15865 [240])
>  *=20
>    igt@kms_content_protection@lic-type-0:shard-dg2: SKIP [246]
>    (i915#15865 [240]) -> SKIP [245] (i915#17356 [9])
>  *=20
>    igt@kms_content_protection@lic-type-1:shard-rkl: SKIP [244]
>    (i915#14544 [4] / i915#15865 [240]) -> SKIP [243] (i915#15865 [240])
>  *=20
>    igt@kms_content_protection@suspend-resume:shard-dg2: SKIP [242]
>    (i915#17356 [9]) -> SKIP [241] (i915#15865 [240]) +2 other tests
>    skip
>  *=20
>    igt@kms_cursor_crc@cursor-random-32x10:shard-dg2: SKIP [239]
>    (i915#17356 [9]) -> SKIP [238] (i915#3555 [15]) +4 other tests skip
>  *=20
>    igt@kms_cursor_crc@cursor-random-max-size:shard-rkl: SKIP [237]
>    (i915#3555 [15]) -> SKIP [236] (i915#14544 [4] / i915#3555 [15]) +1
>    other test skip
>  *=20
>    igt@kms_cursor_crc@cursor-rapid-movement-512x170:shard-rkl: SKIP
>    [235] (i915#13049 [229]) -> SKIP [234] (i915#13049 [229] /
>    i915#14544 [4])
>  *=20
>    igt@kms_cursor_crc@cursor-rapid-movement-max-size:shard-dg2: SKIP
>    [233] (i915#3555 [15]) -> SKIP [232] (i915#17356 [9])
>  *=20
>    igt@kms_cursor_crc@cursor-sliding-512x170:shard-dg2: SKIP [231]
>    (i915#17356 [9]) -> SKIP [230] (i915#13049 [229]) +1 other test skip
>  *=20
>    igt@kms_cursor_legacy@cursora-vs-flipb-toggle:shard-dg2: SKIP [228]
>    (i915#17356 [9]) -> SKIP [227] (i915#13046 [225] / i915#17454 [224]
>    / i915#5354 [106]) +3 other tests skip
>  *=20
>    igt@kms_cursor_legacy@cursorb-vs-flipa-atomic:shard-dg2: SKIP [226]
>    (i915#13046 [225] / i915#17454 [224] / i915#5354 [106]) -> SKIP
>    [223] (i915#17356 [9])
>  *=20
>    igt@kms_cursor_legacy@short-busy-flip-before-cursor-atomic-
>    transitions:shard-dg2: SKIP [222] (i915#17356 [9]) -> SKIP [221]
>    (i915#4103 [220])
>  *=20
>    igt@kms_dither@fb-8bpc-vs-panel-6bpc:shard-rkl: SKIP [219]
>    (i915#14544 [4] / i915#3555 [15] / i915#3804 [217]) -> SKIP [218]
>    (i915#3555 [15] / i915#3804 [217])
>  *=20
>    igt@kms_dp_aux_dev@basic:shard-rkl: SKIP [216] (i915#1257 [214]) ->
>    SKIP [215] (i915#1257 [214] / i915#14544 [4])
>  *=20
>    igt@kms_dp_link_training@non-uhbr-mst-direct-train:shard-dg2: SKIP
>    [211] (i915#17287 [210]) -> SKIP [209] (i915#17356 [9])shard-rkl:
>    SKIP [213] (i915#17287 [210]) -> SKIP [212] (i915#14544 [4] /
>    i915#17287 [210])
>  *=20
>    igt@kms_dp_link_training@non-uhbr-sst:shard-dg2: SKIP [208]
>    (i915#17356 [9]) -> SKIP [207] (i915#17288 [206])
>  *=20
>    igt@kms_dp_link_training@non-uhbr-sst-direct-train:shard-dg2: SKIP
>    [203] (i915#17356 [9]) -> SKIP [202] (i915#17286 [201])shard-rkl:
>    SKIP [205] (i915#14544 [4] / i915#17286 [201]) -> SKIP [204]
>    (i915#17286 [201])
>  *=20
>    igt@kms_draw_crc@draw-method-mmap-gtt:shard-dg2: SKIP [200]
>    (i915#8812 [199]) -> SKIP [198] (i915#17356 [9])
>  *=20
>    igt@kms_dsc@dsc-basic-ultrajoiner:shard-rkl: SKIP [197] (i915#16361
>    [189]) -> SKIP [196] (i915#14544 [4] / i915#16361 [189]) +2 other
>    tests skip
>  *=20
>    igt@kms_dsc@dsc-fractional-bpp-ultrajoiner:shard-dg2: SKIP [195]
>    (i915#16361 [189]) -> SKIP [194] (i915#17356 [9]) +1 other test skip
>  *=20
>    igt@kms_dsc@dsc-with-output-formats:shard-dg2: SKIP [191]
>    (i915#17356 [9]) -> SKIP [190] (i915#16361 [189]) +3 other tests
>    skipshard-rkl: SKIP [193] (i915#14544 [4] / i915#16361 [189]) ->
>    SKIP [192] (i915#16361 [189])
>  *=20
>    igt@kms_fbcon_fbt@psr-suspend:shard-rkl: SKIP [188] (i915#16680
>    [186]) -> SKIP [187] (i915#14544 [4] / i915#16680 [186])
>  *=20
>    igt@kms_feature_discovery@vrr:shard-rkl: SKIP [185] (i915#16600
>    [183]) -> SKIP [184] (i915#14544 [4] / i915#16600 [183])
>  *=20
>    igt@kms_flip@2x-flip-vs-modeset:shard-rkl: SKIP [182] (i915#9934
>    [178]) -> SKIP [181] (i915#14544 [4] / i915#9934 [178]) +2 other
>    tests skip
>  *=20
>    igt@kms_flip@2x-flip-vs-rmfb-interruptible:shard-rkl: SKIP [180]
>    (i915#14544 [4] / i915#9934 [178]) -> SKIP [179] (i915#9934 [178])
>  *=20
>    igt@kms_flip@flip-vs-suspend-interruptible:shard-glk: INCOMPLETE
>    [177] (i915#12314 [172] / i915#12745 [170] / i915#13356 [169] /
>    i915#17183 [168] / i915#4839 [175]) -> INCOMPLETE [176] (i915#12745
>    [170] / i915#13356 [169] / i915#17183 [168] / i915#4839 [175] /
>    i915#6113 [174])
>  *=20
>    igt@kms_flip@flip-vs-suspend-interruptible@a-hdmi-a1:shard-glk:
>    INCOMPLETE [173] (i915#12314 [172] / i915#12745 [170] / i915#13356
>    [169] / i915#17183 [168]) -> INCOMPLETE [171] (i915#12745 [170] /
>    i915#13356 [169] / i915#17183 [168])
>  *=20
>    igt@kms_flip_scaled_crc@flip-32bpp-4tile-to-32bpp-4tiledg2rcccs-
>    upscaling:shard-rkl: SKIP [167] (i915#15643 [163]) -> SKIP [166]
>    (i915#14544 [4] / i915#15643 [163]) +3 other tests skip
>  *=20
>    igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-16bpp-4tile-
>    upscaling:shard-rkl: SKIP [165] (i915#14544 [4] / i915#15643 [163])
>    -> SKIP [164] (i915#15643 [163]) +1 other test skip
>  *=20
>    igt@kms_frontbuffer_tracking@fbc-1p-shrfb-fliptrack-mmap-gtt:shard-
>    dg2: SKIP [162] (i915#15990 [115] / i915#8708 [158]) -> SKIP [161]
>    (i915#16708 [102] / i915#5354 [106]) +7 other tests skip
>  *=20
>    igt@kms_frontbuffer_tracking@fbc-2p-primscrn-pri-shrfb-draw-mmap-
>    gtt:shard-dg2: SKIP [160] (i915#16708 [102] / i915#5354 [106]) ->
>    SKIP [159] (i915#15990 [115] / i915#8708 [158]) +11 other tests skip
>  *=20
>    igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-indfb-plflip-blt:shard-
>    dg2: SKIP [157] (i915#16708 [102] / i915#5354 [106]) -> SKIP [156]
>    (i915#15991 [100] / i915#5354 [106]) +18 other tests skip
>  *=20
>    igt@kms_frontbuffer_tracking@fbc-tiling-y:shard-dg2: SKIP [155]
>    (i915#16708 [102] / i915#5354 [106]) -> SKIP [154] (i915#10055
>    [153])
>  *=20
>    igt@kms_frontbuffer_tracking@fbchdr-1p-primscrn-spr-indfb-draw-
>    render:shard-dg2: SKIP [152] (i915#15989 [119]) -> SKIP [151]
>    (i915#16708 [102]) +10 other tests skip
>  *=20
>    igt@kms_frontbuffer_tracking@fbchdr-2p-primscrn-pri-indfb-draw-
>    blt:shard-rkl: SKIP [150] (i915#14544 [4] / i915#17428 [109]) ->
>    SKIP [149] (i915#17428 [109]) +19 other tests skip
>  *=20
>    igt@kms_frontbuffer_tracking@fbchdr-2p-primscrn-shrfb-pgflip-
>    blt:shard-rkl: SKIP [148] (i915#17428 [109]) -> SKIP [147]
>    (i915#14544 [4] / i915#17428 [109]) +58 other tests skip
>  *=20
>    igt@kms_frontbuffer_tracking@fbcpsr-1p-offscreen-pri-shrfb-draw-
>    mmap-gtt:shard-dg2: SKIP [146] (i915#16708 [102]) -> SKIP [145]
>    (i915#15104 [116] / i915#15990 [115])
>  *=20
>    igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-spr-indfb-draw-mmap-
>    gtt:shard-rkl: SKIP [144] (i915#17428 [109] / i915#1825 [108]) ->
>    SKIP [143] (i915#14544 [4] / i915#17428 [109] / i915#1825 [108]) +3
>    other tests skip
>  *=20
>    igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-pri-shrfb-draw-
>    blt:shard-dg2: SKIP [142] (i915#15991 [100] / i915#5354 [106]) ->
>    SKIP [141] (i915#16708 [102] / i915#5354 [106]) +11 other tests skip
>  *=20
>    igt@kms_frontbuffer_tracking@fbcpsrhdr-1p-primscrn-cur-indfb-draw-
>    mmap-cpu:shard-dg2: SKIP [140] (i915#16708 [102]) -> SKIP [139]
>    (i915#15102 [104]) +17 other tests skip
>  *=20
>    igt@kms_frontbuffer_tracking@fbcpsrhdr-1p-primscrn-spr-indfb-draw-
>    mmap-gtt:shard-rkl: SKIP [138] (i915#15102 [104]) -> SKIP [137]
>    (i915#14544 [4] / i915#15102 [104]) +36 other tests skip
>  *=20
>    igt@kms_frontbuffer_tracking@fbcpsrhdr-1p-rte:shard-rkl: SKIP [136]
>    (i915#14544 [4] / i915#15102 [104]) -> SKIP [135] (i915#15102 [104])
>    +9 other tests skip
>  *=20
>    igt@kms_frontbuffer_tracking@fbcpsrhdr-rgb101010-draw-mmap-
>    cpu:shard-dg2: SKIP [134] (i915#15102 [104]) -> SKIP [133]
>    (i915#16708 [102]) +8 other tests skip
>  *=20
>    igt@kms_frontbuffer_tracking@hdr-1p-offscreen-pri-indfb-draw-
>    pwrite:shard-dg2: SKIP [130] (i915#16708 [102]) -> SKIP [129]
>    (i915#15989 [119]) +15 other tests skipshard-dg1: SKIP [132]
>    (i915#15989 [119]) -> SKIP [131] (i915#15989 [119] / i915#4423 [72])
>  *=20
>    igt@kms_frontbuffer_tracking@hdr-2p-primscrn-cur-indfb-draw-mmap-
>    wc:shard-dg2: SKIP [128] (i915#16708 [102]) -> SKIP [127]
>    (i915#15990 [115]) +11 other tests skip
>  *=20
>    igt@kms_frontbuffer_tracking@hdr-2p-primscrn-pri-indfb-draw-mmap-
>    gtt:shard-dg2: SKIP [126] (i915#15990 [115]) -> SKIP [125]
>    (i915#16708 [102]) +11 other tests skip
>  *=20
>    igt@kms_frontbuffer_tracking@hdr-2p-primscrn-pri-indfb-draw-
>    pwrite:shard-dg1: SKIP [124] (i915#17428 [109]) -> SKIP [123]
>    (i915#17428 [109] / i915#4423 [72])
>  *=20
>    igt@kms_frontbuffer_tracking@hdr-2p-primscrn-spr-indfb-
>    fullscreen:shard-dg2: SKIP [122] (i915#15991 [100]) -> SKIP [121]
>    (i915#16708 [102]) +20 other tests skip
>  *=20
>    igt@kms_frontbuffer_tracking@hdr-suspend:shard-rkl: SKIP [120]
>    (i915#15989 [119]) -> ABORT [118] (i915#15132 [96])
>  *=20
>    igt@kms_frontbuffer_tracking@psr-1p-offscreen-pri-indfb-draw-mmap-
>    gtt:shard-dg2: SKIP [117] (i915#15104 [116] / i915#15990 [115]) ->
>    SKIP [114] (i915#16708 [102])
>  *=20
>    igt@kms_frontbuffer_tracking@psr-1p-rte:shard-dg2: SKIP [113]
>    (i915#15102 [104]) -> SKIP [112] (i915#16708 [102] / i915#5354
>    [106]) +9 other tests skip
>  *=20
>    igt@kms_frontbuffer_tracking@psr-2p-primscrn-pri-indfb-draw-mmap-
>    wc:shard-rkl: SKIP [111] (i915#14544 [4] / i915#17428 [109] /
>    i915#1825 [108]) -> SKIP [110] (i915#17428 [109] / i915#1825 [108])
>  *=20
>    igt@kms_frontbuffer_tracking@psr-indfb-scaledprimary:shard-dg2: SKIP
>    [107] (i915#16708 [102] / i915#5354 [106]) -> SKIP [105] (i915#15102
>    [104]) +9 other tests skip
>  *=20
>    igt@kms_frontbuffer_tracking@psrhdr-2p-primscrn-indfb-msflip-
>    blt:shard-dg2: SKIP [103] (i915#16708 [102]) -> SKIP [101]
>    (i915#15991 [100]) +27 other tests skip
>  *=20
>    igt@kms_hdmi_audio_bw@suspend-disk-audio-recovery:shard-dg2: SKIP
>    [99] (i915#17357 [98]) -> ABORT [97] (i915#15132 [96])
>  *=20
>    igt@kms_hdr@bpc-switch-suspend:shard-dg2: SKIP [91] (i915#17356 [9])
>    -> SKIP [90] (i915#16518 [89] / i915#3555 [15] / i915#8228
>    [88])shard-rkl: INCOMPLETE [95] (i915#15436 [94]) -> SKIP [93]
>    (i915#16644 [92] / i915#3555 [15] / i915#8228 [88])
>  *=20
>    igt@kms_joiner@basic-ultra-joiner:shard-rkl: SKIP [87] (i915#15458
>    [85]) -> SKIP [86] (i915#14544 [4] / i915#15458 [85])
>  *=20
>    igt@kms_pipe_b_c_ivb@from-pipe-c-to-b-with-3-lanes:shard-rkl: SKIP
>    [84] (i915#17455 [82]) -> SKIP [83] (i915#14544 [4] / i915#17455
>    [82])
>  *=20
>    igt@kms_pipe_stress@stress-xrgb8888-yftiled:shard-dg2: SKIP [79]
>    (i915#14712 [78]) -> SKIP [77] (i915#17356 [9])shard-rkl: SKIP [81]
>    (i915#14712 [78]) -> SKIP [80] (i915#14544 [4] / i915#14712 [78])
>  *=20
>    igt@kms_plane@pixel-format-4-tiled-lnl-ccs-modifier-source-
>    clamping:shard-rkl: SKIP [76] (i915#14544 [4] / i915#15709 [69]) ->
>    SKIP [75] (i915#15709 [69]) +1 other test skip
>  *=20
>    igt@kms_plane@pixel-format-4-tiled-modifier:shard-dg1: SKIP [74]
>    (i915#15709 [69]) -> SKIP [73] (i915#15709 [69] / i915#4423 [72])
>  *=20
>    igt@kms_plane@pixel-format-yf-tiled-modifier:shard-rkl: SKIP [71]
>    (i915#15709 [69]) -> SKIP [70] (i915#14544 [4] / i915#15709 [69]) +2
>    other tests skip
>  *=20
>    igt@kms_plane_lowres@tiling-y:shard-dg2: SKIP [68] (i915#8821 [67])
>    -> SKIP [66] (i915#17356 [9])
>  *=20
>    igt@kms_plane_multiple@2x-tiling-y:shard-rkl: SKIP [65] (i915#13958
>    [63]) -> SKIP [64] (i915#13958 [63] / i915#14544 [4])
>  *=20
>    igt@kms_plane_multiple@tiling-y:shard-dg2: SKIP [62] (i915#17356
>    [9]) -> SKIP [61] (i915#14259 [60])
>  *=20
>    igt@kms_pm_dc@dc5-psr:shard-rkl: SKIP [59] (i915#15948 [57]) -> SKIP
>    [58] (i915#14544 [4] / i915#15948 [57])
>  *=20
>    igt@kms_pm_dc@dc5-psr-suspend-resume:shard-rkl: SKIP [56]
>    (i915#14544 [4] / i915#16914 [54]) -> SKIP [55] (i915#16914 [54])
>  *=20
>    igt@kms_pm_rpm@package-g7:shard-rkl: SKIP [53] (i915#15403 [51]) ->
>    SKIP [52] (i915#14544 [4] / i915#15403 [51])
>  *=20
>    igt@kms_prime@basic-modeset-hybrid:shard-rkl: SKIP [50] (i915#6524
>    [48]) -> SKIP [49] (i915#14544 [4] / i915#6524 [48])
>  *=20
>    igt@kms_psr2_sf@fbc-pr-overlay-plane-move-continuous-sf:shard-rkl:
>    SKIP [47] (i915#11520 [43]) -> SKIP [46] (i915#11520 [43] /
>    i915#14544 [4]) +5 other tests skip
>  *=20
>    igt@kms_psr2_sf@pr-overlay-plane-update-continuous-sf:shard-rkl:
>    SKIP [45] (i915#11520 [43] / i915#14544 [4]) -> SKIP [44]
>    (i915#11520 [43])
>  *=20
>    igt@kms_psr@fbc-pr-sprite-plane-onoff:shard-rkl: SKIP [42]
>    (i915#1072 [38] / i915#14544 [4] / i915#9732 [37]) -> SKIP [41]
>    (i915#1072 [38] / i915#9732 [37]) +3 other tests skip
>  *=20
>    igt@kms_psr@psr2-sprite-mmap-cpu:shard-rkl: SKIP [40] (i915#1072
>    [38] / i915#9732 [37]) -> SKIP [39] (i915#1072 [38] / i915#14544 [4]
>    / i915#9732 [37]) +14 other tests skip
>  *=20
>    igt@kms_rotation_crc@primary-rotation-90:shard-dg2: SKIP [36]
>    (i915#12755 [35] / i915#15867 [34]) -> SKIP [33] (i915#17356 [9])
>  *=20
>    igt@kms_rotation_crc@primary-yf-tiled-reflect-x-0:shard-dg2: SKIP
>    [28] (i915#17356 [9] / i915#5190 [26]) -> SKIP [27] (i915#5190 [26])
>    +1 other test skipshard-rkl: SKIP [32] (i915#14544 [4] / i915#17432
>    [30] / i915#5289 [29]) -> SKIP [31] (i915#17432 [30] / i915#5289
>    [29])
>  *=20
>    igt@kms_tiled_display@basic-test-pattern-with-chamelium:shard-dg2:
>    SKIP [25] (i915#17356 [9]) -> SKIP [24] (i915#8623 [23])
>  *=20
>    igt@kms_vrr@flip-basic:shard-dg2: SKIP [22] (i915#15243 [21] /
>    i915#3555 [15]) -> SKIP [20] (i915#17356 [9])
>  *=20
>    igt@kms_vrr@max-min:shard-dg2: SKIP [19] (i915#17356 [9]) -> SKIP
>    [18] (i915#9906 [11])
>  *=20
>    igt@kms_vrr@negative-basic:shard-rkl: SKIP [17] (i915#3555 [15] /
>    i915#9906 [11]) -> SKIP [16] (i915#14544 [4] / i915#3555 [15] /
>    i915#9906 [11])
>  *=20
>    igt@kms_vrr@seamless-rr-switch-vrr:shard-dg2: SKIP [12] (i915#9906
>    [11]) -> SKIP [10] (i915#17356 [9]) +1 other test skipshard-rkl:
>    SKIP [14] (i915#9906 [11]) -> SKIP [13] (i915#14544 [4] / i915#9906
>    [11])
>  *=20
>    igt@prime_vgem@basic-read:shard-rkl: SKIP [8] (i915#17448 [2] /
>    i915#3291 [6] / i915#3708 [1]) -> SKIP [7] (i915#14544 [4] /
>    i915#17448 [2] / i915#3291 [6] / i915#3708 [1])
>  *=20
>    igt@prime_vgem@fence-flip-hang:shard-rkl: SKIP [5] (i915#14544 [4] /
>    i915#17448 [2] / i915#3708 [1]) -> SKIP [3] (i915#17448 [2] /
>    i915#3708 [1])
> Build changes * Linux: CI_DRM_19395 -> Patchwork_169493v6
> CI-20190529: 20190529
> CI_DRM_19395: 8e30a30c4948a9b30b9af31ebfaaa951630ae8a3 @
> git://anongit.freedesktop.org/gfx-ci/linux
> IGT_9164: 9164
> Patchwork_169493v6: 8e30a30c4948a9b30b9af31ebfaaa951630ae8a3 @
> git://anongit.freedesktop.org/gfx-ci/linux
> piglit_4509: fdc5a4ca11124ab8413c7988896eec4c97336694 @
> git://anongit.freedesktop.org/piglit


[1] i915#3708
    https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3708
[2] i915#17448
    https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17448
[3] SKIP
    https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_169493v6/shard-rkl-7=
/igt@prime_vgem@fence-flip-hang.html
[4] i915#14544
    https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544
[5] SKIP
    https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19395/shard-rkl-6/igt@p=
rime_vgem@fence-flip-hang.html
[6] i915#3291
    https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3291
[7] SKIP
    https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_169493v6/shard-rkl-6=
/igt@prime_vgem@basic-read.html
[8] SKIP
    https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19395/shard-rkl-2/igt@p=
rime_vgem@basic-read.html
[9] i915#17356
    https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17356
[10] SKIP
     https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_169493v6/shard-dg2-=
7/igt@kms_vrr@seamless-rr-switch-vrr.html
[11] i915#9906
     https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9906
[12] SKIP
     https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19395/shard-dg2-6/igt@=
kms_vrr@seamless-rr-switch-vrr.html
[13] SKIP
     https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_169493v6/shard-rkl-=
6/igt@kms_vrr@seamless-rr-switch-vrr.html
[14] SKIP
     https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19395/shard-rkl-3/igt@=
kms_vrr@seamless-rr-switch-vrr.html
[15] i915#3555
     https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3555
[16] SKIP
     https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_169493v6/shard-rkl-=
6/igt@kms_vrr@negative-basic.html
[17] SKIP
     https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19395/shard-rkl-2/igt@=
kms_vrr@negative-basic.html
[18] SKIP
     https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_169493v6/shard-dg2-=
8/igt@kms_vrr@max-min.html
[19] SKIP
     https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19395/shard-dg2-7/igt@=
kms_vrr@max-min.html
[20] SKIP
     https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_169493v6/shard-dg2-=
7/igt@kms_vrr@flip-basic.html
[21] i915#15243
     https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15243
[22] SKIP
     https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19395/shard-dg2-1/igt@=
kms_vrr@flip-basic.html
[23] i915#8623
     https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8623
[24] SKIP
     https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_169493v6/shard-dg2-=
5/igt@kms_tiled_display@basic-test-pattern-with-chamelium.html
[25] SKIP
     https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19395/shard-dg2-7/igt@=
kms_tiled_display@basic-test-pattern-with-chamelium.html
[26] i915#5190
     https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5190
[27] SKIP
     https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_169493v6/shard-dg2-=
1/igt@kms_rotation_crc@primary-yf-tiled-reflect-x-0.html
[28] SKIP
     https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19395/shard-dg2-7/igt@=
kms_rotation_crc@primary-yf-tiled-reflect-x-0.html
[29] i915#5289
     https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5289
[30] i915#17432
     https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17432
[31] SKIP
     https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_169493v6/shard-rkl-=
5/igt@kms_rotation_crc@primary-yf-tiled-reflect-x-0.html
[32] SKIP
     https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19395/shard-rkl-6/igt@=
kms_rotation_crc@primary-yf-tiled-reflect-x-0.html
[33] SKIP
     https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_169493v6/shard-dg2-=
7/igt@kms_rotation_crc@primary-rotation-90.html
[34] i915#15867
     https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15867
[35] i915#12755
     https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12755
[36] SKIP
     https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19395/shard-dg2-5/igt@=
kms_rotation_crc@primary-rotation-90.html
[37] i915#9732
     https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9732
[38] i915#1072
     https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/1072
[39] SKIP
     https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_169493v6/shard-rkl-=
6/igt@kms_psr@psr2-sprite-mmap-cpu.html
[40] SKIP
     https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19395/shard-rkl-2/igt@=
kms_psr@psr2-sprite-mmap-cpu.html
[41] SKIP
     https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_169493v6/shard-rkl-=
5/igt@kms_psr@fbc-pr-sprite-plane-onoff.html
[42] SKIP
     https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19395/shard-rkl-6/igt@=
kms_psr@fbc-pr-sprite-plane-onoff.html
[43] i915#11520
     https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11520
[44] SKIP
     https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_169493v6/shard-rkl-=
5/igt@kms_psr2_sf@pr-overlay-plane-update-continuous-sf.html
[45] SKIP
     https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19395/shard-rkl-6/igt@=
kms_psr2_sf@pr-overlay-plane-update-continuous-sf.html
[46] SKIP
     https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_169493v6/shard-rkl-=
6/igt@kms_psr2_sf@fbc-pr-overlay-plane-move-continuous-sf.html
[47] SKIP
     https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19395/shard-rkl-2/igt@=
kms_psr2_sf@fbc-pr-overlay-plane-move-continuous-sf.html
[48] i915#6524
     https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6524
[49] SKIP
     https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_169493v6/shard-rkl-=
6/igt@kms_prime@basic-modeset-hybrid.html
[50] SKIP
     https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19395/shard-rkl-2/igt@=
kms_prime@basic-modeset-hybrid.html
[51] i915#15403
     https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15403
[52] SKIP
     https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_169493v6/shard-rkl-=
6/igt@kms_pm_rpm@package-g7.html
[53] SKIP
     https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19395/shard-rkl-3/igt@=
kms_pm_rpm@package-g7.html
[54] i915#16914
     https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16914
[55] SKIP
     https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_169493v6/shard-rkl-=
5/igt@kms_pm_dc@dc5-psr-suspend-resume.html
[56] SKIP
     https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19395/shard-rkl-6/igt@=
kms_pm_dc@dc5-psr-suspend-resume.html
[57] i915#15948
     https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15948
[58] SKIP
     https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_169493v6/shard-rkl-=
6/igt@kms_pm_dc@dc5-psr.html
[59] SKIP
     https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19395/shard-rkl-2/igt@=
kms_pm_dc@dc5-psr.html
[60] i915#14259
     https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14259
[61] SKIP
     https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_169493v6/shard-dg2-=
4/igt@kms_plane_multiple@tiling-y.html
[62] SKIP
     https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19395/shard-dg2-7/igt@=
kms_plane_multiple@tiling-y.html
[63] i915#13958
     https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13958
[64] SKIP
     https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_169493v6/shard-rkl-=
6/igt@kms_plane_multiple@2x-tiling-y.html
[65] SKIP
     https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19395/shard-rkl-2/igt@=
kms_plane_multiple@2x-tiling-y.html
[66] SKIP
     https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_169493v6/shard-dg2-=
7/igt@kms_plane_lowres@tiling-y.html
[67] i915#8821
     https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8821
[68] SKIP
     https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19395/shard-dg2-6/igt@=
kms_plane_lowres@tiling-y.html
[69] i915#15709
     https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15709
[70] SKIP
     https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_169493v6/shard-rkl-=
6/igt@kms_plane@pixel-format-yf-tiled-modifier.html
[71] SKIP
     https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19395/shard-rkl-3/igt@=
kms_plane@pixel-format-yf-tiled-modifier.html
[72] i915#4423
     https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4423
[73] SKIP
     https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_169493v6/shard-dg1-=
17/igt@kms_plane@pixel-format-4-tiled-modifier.html
[74] SKIP
     https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19395/shard-dg1-18/igt=
@kms_plane@pixel-format-4-tiled-modifier.html
[75] SKIP
     https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_169493v6/shard-rkl-=
4/igt@kms_plane@pixel-format-4-tiled-lnl-ccs-modifier-source-clamping.html
[76] SKIP
     https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19395/shard-rkl-6/igt@=
kms_plane@pixel-format-4-tiled-lnl-ccs-modifier-source-clamping.html
[77] SKIP
     https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_169493v6/shard-dg2-=
7/igt@kms_pipe_stress@stress-xrgb8888-yftiled.html
[78] i915#14712
     https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14712
[79] SKIP
     https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19395/shard-dg2-6/igt@=
kms_pipe_stress@stress-xrgb8888-yftiled.html
[80] SKIP
     https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_169493v6/shard-rkl-=
6/igt@kms_pipe_stress@stress-xrgb8888-yftiled.html
[81] SKIP
     https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19395/shard-rkl-3/igt@=
kms_pipe_stress@stress-xrgb8888-yftiled.html
[82] i915#17455
     https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17455
[83] SKIP
     https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_169493v6/shard-rkl-=
6/igt@kms_pipe_b_c_ivb@from-pipe-c-to-b-with-3-lanes.html
[84] SKIP
     https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19395/shard-rkl-3/igt@=
kms_pipe_b_c_ivb@from-pipe-c-to-b-with-3-lanes.html
[85] i915#15458
     https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15458
[86] SKIP
     https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_169493v6/shard-rkl-=
6/igt@kms_joiner@basic-ultra-joiner.html
[87] SKIP
     https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19395/shard-rkl-2/igt@=
kms_joiner@basic-ultra-joiner.html
[88] i915#8228
     https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8228
[89] i915#16518
     https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16518
[90] SKIP
     https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_169493v6/shard-dg2-=
1/igt@kms_hdr@bpc-switch-suspend.html
[91] SKIP
     https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19395/shard-dg2-7/igt@=
kms_hdr@bpc-switch-suspend.html
[92] i915#16644
     https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16644
[93] SKIP
     https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_169493v6/shard-rkl-=
5/igt@kms_hdr@bpc-switch-suspend.html
[94] i915#15436
     https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15436
[95] INCOMPLETE
     https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19395/shard-rkl-6/igt@=
kms_hdr@bpc-switch-suspend.html
[96] i915#15132
     https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15132
[97] ABORT
     https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_169493v6/shard-dg2-=
4/igt@kms_hdmi_audio_bw@suspend-disk-audio-recovery.html
[98] i915#17357
     https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17357
[99] SKIP
     https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19395/shard-dg2-7/igt@=
kms_hdmi_audio_bw@suspend-disk-audio-recovery.html
[100] i915#15991
      https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15991
[101] SKIP
      https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_169493v6/shard-dg2=
-8/igt@kms_frontbuffer_tracking@psrhdr-2p-primscrn-indfb-msflip-blt.html
[102] i915#16708
      https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16708
[103] SKIP
      https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19395/shard-dg2-7/igt=
@kms_frontbuffer_tracking@psrhdr-2p-primscrn-indfb-msflip-blt.html
[104] i915#15102
      https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15102
[105] SKIP
      https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_169493v6/shard-dg2=
-8/igt@kms_frontbuffer_tracking@psr-indfb-scaledprimary.html
[106] i915#5354
      https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5354
[107] SKIP
      https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19395/shard-dg2-7/igt=
@kms_frontbuffer_tracking@psr-indfb-scaledprimary.html
[108] i915#1825
      https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/1825
[109] i915#17428
      https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17428
[110] SKIP
      https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_169493v6/shard-rkl=
-3/igt@kms_frontbuffer_tracking@psr-2p-primscrn-pri-indfb-draw-mmap-wc.html
[111] SKIP
      https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19395/shard-rkl-6/igt=
@kms_frontbuffer_tracking@psr-2p-primscrn-pri-indfb-draw-mmap-wc.html
[112] SKIP
      https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_169493v6/shard-dg2=
-7/igt@kms_frontbuffer_tracking@psr-1p-rte.html
[113] SKIP
      https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19395/shard-dg2-6/igt=
@kms_frontbuffer_tracking@psr-1p-rte.html
[114] SKIP
      https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_169493v6/shard-dg2=
-7/igt@kms_frontbuffer_tracking@psr-1p-offscreen-pri-indfb-draw-mmap-gtt.ht=
ml
[115] i915#15990
      https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15990
[116] i915#15104
      https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15104
[117] SKIP
      https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19395/shard-dg2-1/igt=
@kms_frontbuffer_tracking@psr-1p-offscreen-pri-indfb-draw-mmap-gtt.html
[118] ABORT
      https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_169493v6/shard-rkl=
-1/igt@kms_frontbuffer_tracking@hdr-suspend.html
[119] i915#15989
      https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15989
[120] SKIP
      https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19395/shard-rkl-8/igt=
@kms_frontbuffer_tracking@hdr-suspend.html
[121] SKIP
      https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_169493v6/shard-dg2=
-7/igt@kms_frontbuffer_tracking@hdr-2p-primscrn-spr-indfb-fullscreen.html
[122] SKIP
      https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19395/shard-dg2-6/igt=
@kms_frontbuffer_tracking@hdr-2p-primscrn-spr-indfb-fullscreen.html
[123] SKIP
      https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_169493v6/shard-dg1=
-18/igt@kms_frontbuffer_tracking@hdr-2p-primscrn-pri-indfb-draw-pwrite.html
[124] SKIP
      https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19395/shard-dg1-14/ig=
t@kms_frontbuffer_tracking@hdr-2p-primscrn-pri-indfb-draw-pwrite.html
[125] SKIP
      https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_169493v6/shard-dg2=
-7/igt@kms_frontbuffer_tracking@hdr-2p-primscrn-pri-indfb-draw-mmap-gtt.htm=
l
[126] SKIP
      https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19395/shard-dg2-6/igt=
@kms_frontbuffer_tracking@hdr-2p-primscrn-pri-indfb-draw-mmap-gtt.html
[127] SKIP
      https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_169493v6/shard-dg2=
-1/igt@kms_frontbuffer_tracking@hdr-2p-primscrn-cur-indfb-draw-mmap-wc.html
[128] SKIP
      https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19395/shard-dg2-7/igt=
@kms_frontbuffer_tracking@hdr-2p-primscrn-cur-indfb-draw-mmap-wc.html
[129] SKIP
      https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_169493v6/shard-dg2=
-8/igt@kms_frontbuffer_tracking@hdr-1p-offscreen-pri-indfb-draw-pwrite.html
[130] SKIP
      https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19395/shard-dg2-7/igt=
@kms_frontbuffer_tracking@hdr-1p-offscreen-pri-indfb-draw-pwrite.html
[131] SKIP
      https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_169493v6/shard-dg1=
-18/igt@kms_frontbuffer_tracking@hdr-1p-offscreen-pri-indfb-draw-pwrite.htm=
l
[132] SKIP
      https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19395/shard-dg1-14/ig=
t@kms_frontbuffer_tracking@hdr-1p-offscreen-pri-indfb-draw-pwrite.html
[133] SKIP
      https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_169493v6/shard-dg2=
-7/igt@kms_frontbuffer_tracking@fbcpsrhdr-rgb101010-draw-mmap-cpu.html
[134] SKIP
      https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19395/shard-dg2-1/igt=
@kms_frontbuffer_tracking@fbcpsrhdr-rgb101010-draw-mmap-cpu.html
[135] SKIP
      https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_169493v6/shard-rkl=
-3/igt@kms_frontbuffer_tracking@fbcpsrhdr-1p-rte.html
[136] SKIP
      https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19395/shard-rkl-6/igt=
@kms_frontbuffer_tracking@fbcpsrhdr-1p-rte.html
[137] SKIP
      https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_169493v6/shard-rkl=
-6/igt@kms_frontbuffer_tracking@fbcpsrhdr-1p-primscrn-spr-indfb-draw-mmap-g=
tt.html
[138] SKIP
      https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19395/shard-rkl-3/igt=
@kms_frontbuffer_tracking@fbcpsrhdr-1p-primscrn-spr-indfb-draw-mmap-gtt.htm=
l
[139] SKIP
      https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_169493v6/shard-dg2=
-8/igt@kms_frontbuffer_tracking@fbcpsrhdr-1p-primscrn-cur-indfb-draw-mmap-c=
pu.html
[140] SKIP
      https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19395/shard-dg2-7/igt=
@kms_frontbuffer_tracking@fbcpsrhdr-1p-primscrn-cur-indfb-draw-mmap-cpu.htm=
l
[141] SKIP
      https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_169493v6/shard-dg2=
-7/igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-pri-shrfb-draw-blt.html
[142] SKIP
      https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19395/shard-dg2-5/igt=
@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-pri-shrfb-draw-blt.html
[143] SKIP
      https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_169493v6/shard-rkl=
-6/igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-spr-indfb-draw-mmap-gtt.=
html
[144] SKIP
      https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19395/shard-rkl-3/igt=
@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-spr-indfb-draw-mmap-gtt.html
[145] SKIP
      https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_169493v6/shard-dg2=
-8/igt@kms_frontbuffer_tracking@fbcpsr-1p-offscreen-pri-shrfb-draw-mmap-gtt=
.html
[146] SKIP
      https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19395/shard-dg2-7/igt=
@kms_frontbuffer_tracking@fbcpsr-1p-offscreen-pri-shrfb-draw-mmap-gtt.html
[147] SKIP
      https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_169493v6/shard-rkl=
-6/igt@kms_frontbuffer_tracking@fbchdr-2p-primscrn-shrfb-pgflip-blt.html
[148] SKIP
      https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19395/shard-rkl-3/igt=
@kms_frontbuffer_tracking@fbchdr-2p-primscrn-shrfb-pgflip-blt.html
[149] SKIP
      https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_169493v6/shard-rkl=
-5/igt@kms_frontbuffer_tracking@fbchdr-2p-primscrn-pri-indfb-draw-blt.html
[150] SKIP
      https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19395/shard-rkl-6/igt=
@kms_frontbuffer_tracking@fbchdr-2p-primscrn-pri-indfb-draw-blt.html
[151] SKIP
      https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_169493v6/shard-dg2=
-7/igt@kms_frontbuffer_tracking@fbchdr-1p-primscrn-spr-indfb-draw-render.ht=
ml
[152] SKIP
      https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19395/shard-dg2-6/igt=
@kms_frontbuffer_tracking@fbchdr-1p-primscrn-spr-indfb-draw-render.html
[153] i915#10055
      https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/10055
[154] SKIP
      https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_169493v6/shard-dg2=
-5/igt@kms_frontbuffer_tracking@fbc-tiling-y.html
[155] SKIP
      https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19395/shard-dg2-7/igt=
@kms_frontbuffer_tracking@fbc-tiling-y.html
[156] SKIP
      https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_169493v6/shard-dg2=
-8/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-indfb-plflip-blt.html
[157] SKIP
      https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19395/shard-dg2-7/igt=
@kms_frontbuffer_tracking@fbc-2p-scndscrn-indfb-plflip-blt.html
[158] i915#8708
      https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8708
[159] SKIP
      https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_169493v6/shard-dg2=
-1/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-pri-shrfb-draw-mmap-gtt.htm=
l
[160] SKIP
      https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19395/shard-dg2-7/igt=
@kms_frontbuffer_tracking@fbc-2p-primscrn-pri-shrfb-draw-mmap-gtt.html
[161] SKIP
      https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_169493v6/shard-dg2=
-7/igt@kms_frontbuffer_tracking@fbc-1p-shrfb-fliptrack-mmap-gtt.html
[162] SKIP
      https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19395/shard-dg2-6/igt=
@kms_frontbuffer_tracking@fbc-1p-shrfb-fliptrack-mmap-gtt.html
[163] i915#15643
      https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15643
[164] SKIP
      https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_169493v6/shard-rkl=
-3/igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-16bpp-4tile-upscaling.html
[165] SKIP
      https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19395/shard-rkl-6/igt=
@kms_flip_scaled_crc@flip-64bpp-4tile-to-16bpp-4tile-upscaling.html
[166] SKIP
      https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_169493v6/shard-rkl=
-6/igt@kms_flip_scaled_crc@flip-32bpp-4tile-to-32bpp-4tiledg2rcccs-upscalin=
g.html
[167] SKIP
      https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19395/shard-rkl-2/igt=
@kms_flip_scaled_crc@flip-32bpp-4tile-to-32bpp-4tiledg2rcccs-upscaling.html
[168] i915#17183
      https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17183
[169] i915#13356
      https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13356
[170] i915#12745
      https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12745
[171] INCOMPLETE
      https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_169493v6/shard-glk=
1/igt@kms_flip@flip-vs-suspend-interruptible@a-hdmi-a1.html
[172] i915#12314
      https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12314
[173] INCOMPLETE
      https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19395/shard-glk8/igt@=
kms_flip@flip-vs-suspend-interruptible@a-hdmi-a1.html
[174] i915#6113
      https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6113
[175] i915#4839
      https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4839
[176] INCOMPLETE
      https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_169493v6/shard-glk=
1/igt@kms_flip@flip-vs-suspend-interruptible.html
[177] INCOMPLETE
      https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19395/shard-glk8/igt@=
kms_flip@flip-vs-suspend-interruptible.html
[178] i915#9934
      https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9934
[179] SKIP
      https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_169493v6/shard-rkl=
-5/igt@kms_flip@2x-flip-vs-rmfb-interruptible.html
[180] SKIP
      https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19395/shard-rkl-6/igt=
@kms_flip@2x-flip-vs-rmfb-interruptible.html
[181] SKIP
      https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_169493v6/shard-rkl=
-6/igt@kms_flip@2x-flip-vs-modeset.html
[182] SKIP
      https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19395/shard-rkl-3/igt=
@kms_flip@2x-flip-vs-modeset.html
[183] i915#16600
      https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16600
[184] SKIP
      https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_169493v6/shard-rkl=
-6/igt@kms_feature_discovery@vrr.html
[185] SKIP
      https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19395/shard-rkl-3/igt=
@kms_feature_discovery@vrr.html
[186] i915#16680
      https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16680
[187] SKIP
      https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_169493v6/shard-rkl=
-6/igt@kms_fbcon_fbt@psr-suspend.html
[188] SKIP
      https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19395/shard-rkl-3/igt=
@kms_fbcon_fbt@psr-suspend.html
[189] i915#16361
      https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16361
[190] SKIP
      https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_169493v6/shard-dg2=
-1/igt@kms_dsc@dsc-with-output-formats.html
[191] SKIP
      https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19395/shard-dg2-7/igt=
@kms_dsc@dsc-with-output-formats.html
[192] SKIP
      https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_169493v6/shard-rkl=
-5/igt@kms_dsc@dsc-with-output-formats.html
[193] SKIP
      https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19395/shard-rkl-6/igt=
@kms_dsc@dsc-with-output-formats.html
[194] SKIP
      https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_169493v6/shard-dg2=
-7/igt@kms_dsc@dsc-fractional-bpp-ultrajoiner.html
[195] SKIP
      https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19395/shard-dg2-6/igt=
@kms_dsc@dsc-fractional-bpp-ultrajoiner.html
[196] SKIP
      https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_169493v6/shard-rkl=
-6/igt@kms_dsc@dsc-basic-ultrajoiner.html
[197] SKIP
      https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19395/shard-rkl-2/igt=
@kms_dsc@dsc-basic-ultrajoiner.html
[198] SKIP
      https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_169493v6/shard-dg2=
-7/igt@kms_draw_crc@draw-method-mmap-gtt.html
[199] i915#8812
      https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8812
[200] SKIP
      https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19395/shard-dg2-5/igt=
@kms_draw_crc@draw-method-mmap-gtt.html
[201] i915#17286
      https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17286
[202] SKIP
      https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_169493v6/shard-dg2=
-5/igt@kms_dp_link_training@non-uhbr-sst-direct-train.html
[203] SKIP
      https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19395/shard-dg2-7/igt=
@kms_dp_link_training@non-uhbr-sst-direct-train.html
[204] SKIP
      https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_169493v6/shard-rkl=
-3/igt@kms_dp_link_training@non-uhbr-sst-direct-train.html
[205] SKIP
      https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19395/shard-rkl-6/igt=
@kms_dp_link_training@non-uhbr-sst-direct-train.html
[206] i915#17288
      https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17288
[207] SKIP
      https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_169493v6/shard-dg2=
-8/igt@kms_dp_link_training@non-uhbr-sst.html
[208] SKIP
      https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19395/shard-dg2-7/igt=
@kms_dp_link_training@non-uhbr-sst.html
[209] SKIP
      https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_169493v6/shard-dg2=
-7/igt@kms_dp_link_training@non-uhbr-mst-direct-train.html
[210] i915#17287
      https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17287
[211] SKIP
      https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19395/shard-dg2-6/igt=
@kms_dp_link_training@non-uhbr-mst-direct-train.html
[212] SKIP
      https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_169493v6/shard-rkl=
-6/igt@kms_dp_link_training@non-uhbr-mst-direct-train.html
[213] SKIP
      https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19395/shard-rkl-3/igt=
@kms_dp_link_training@non-uhbr-mst-direct-train.html
[214] i915#1257
      https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/1257
[215] SKIP
      https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_169493v6/shard-rkl=
-6/igt@kms_dp_aux_dev@basic.html
[216] SKIP
      https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19395/shard-rkl-3/igt=
@kms_dp_aux_dev@basic.html
[217] i915#3804
      https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3804
[218] SKIP
      https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_169493v6/shard-rkl=
-5/igt@kms_dither@fb-8bpc-vs-panel-6bpc.html
[219] SKIP
      https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19395/shard-rkl-6/igt=
@kms_dither@fb-8bpc-vs-panel-6bpc.html
[220] i915#4103
      https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4103
[221] SKIP
      https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_169493v6/shard-dg2=
-4/igt@kms_cursor_legacy@short-busy-flip-before-cursor-atomic-transitions.h=
tml
[222] SKIP
      https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19395/shard-dg2-7/igt=
@kms_cursor_legacy@short-busy-flip-before-cursor-atomic-transitions.html
[223] SKIP
      https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_169493v6/shard-dg2=
-7/igt@kms_cursor_legacy@cursorb-vs-flipa-atomic.html
[224] i915#17454
      https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17454
[225] i915#13046
      https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13046
[226] SKIP
      https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19395/shard-dg2-6/igt=
@kms_cursor_legacy@cursorb-vs-flipa-atomic.html
[227] SKIP
      https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_169493v6/shard-dg2=
-5/igt@kms_cursor_legacy@cursora-vs-flipb-toggle.html
[228] SKIP
      https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19395/shard-dg2-7/igt=
@kms_cursor_legacy@cursora-vs-flipb-toggle.html
[229] i915#13049
      https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13049
[230] SKIP
      https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_169493v6/shard-dg2=
-4/igt@kms_cursor_crc@cursor-sliding-512x170.html
[231] SKIP
      https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19395/shard-dg2-7/igt=
@kms_cursor_crc@cursor-sliding-512x170.html
[232] SKIP
      https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_169493v6/shard-dg2=
-7/igt@kms_cursor_crc@cursor-rapid-movement-max-size.html
[233] SKIP
      https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19395/shard-dg2-1/igt=
@kms_cursor_crc@cursor-rapid-movement-max-size.html
[234] SKIP
      https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_169493v6/shard-rkl=
-6/igt@kms_cursor_crc@cursor-rapid-movement-512x170.html
[235] SKIP
      https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19395/shard-rkl-3/igt=
@kms_cursor_crc@cursor-rapid-movement-512x170.html
[236] SKIP
      https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_169493v6/shard-rkl=
-6/igt@kms_cursor_crc@cursor-random-max-size.html
[237] SKIP
      https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19395/shard-rkl-2/igt=
@kms_cursor_crc@cursor-random-max-size.html
[238] SKIP
      https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_169493v6/shard-dg2=
-8/igt@kms_cursor_crc@cursor-random-32x10.html
[239] SKIP
      https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19395/shard-dg2-7/igt=
@kms_cursor_crc@cursor-random-32x10.html
[240] i915#15865
      https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15865
[241] SKIP
      https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_169493v6/shard-dg2=
-8/igt@kms_content_protection@suspend-resume.html
[242] SKIP
      https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19395/shard-dg2-7/igt=
@kms_content_protection@suspend-resume.html
[243] SKIP
      https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_169493v6/shard-rkl=
-3/igt@kms_content_protection@lic-type-1.html
[244] SKIP
      https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19395/shard-rkl-6/igt=
@kms_content_protection@lic-type-1.html
[245] SKIP
      https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_169493v6/shard-dg2=
-7/igt@kms_content_protection@lic-type-0.html
[246] SKIP
      https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19395/shard-dg2-1/igt=
@kms_content_protection@lic-type-0.html
[247] SKIP
      https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_169493v6/shard-rkl=
-6/igt@kms_content_protection@legacy.html
[248] SKIP
      https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19395/shard-rkl-3/igt=
@kms_content_protection@legacy.html
[249] i915#3116
      https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3116
[250] i915#15330
      https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15330
[251] SKIP
      https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_169493v6/shard-rkl=
-6/igt@kms_content_protection@dp-mst-type-1.html
[252] SKIP
      https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19395/shard-rkl-2/igt=
@kms_content_protection@dp-mst-type-1.html
[253] i915#3299
      https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3299
[254] SKIP
      https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_169493v6/shard-dg2=
-1/igt@kms_content_protection@dp-mst-lic-type-1.html
[255] SKIP
      https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19395/shard-dg2-7/igt=
@kms_content_protection@dp-mst-lic-type-1.html
[256] SKIP
      https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_169493v6/shard-dg2=
-7/igt@kms_content_protection@dp-mst-lic-type-0.html
[257] SKIP
      https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19395/shard-dg2-6/igt=
@kms_content_protection@dp-mst-lic-type-0.html
[258] i915#7828
      https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/7828
[259] i915#11151
      https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11151
[260] SKIP
      https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_169493v6/shard-rkl=
-5/igt@kms_chamelium_frames@hdmi-frame-dump.html
[261] SKIP
      https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19395/shard-rkl-6/igt=
@kms_chamelium_frames@hdmi-frame-dump.html
[262] SKIP
      https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_169493v6/shard-rkl=
-6/igt@kms_chamelium_edid@dp-edid-change-during-suspend.html
[263] SKIP
      https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19395/shard-rkl-2/igt=
@kms_chamelium_edid@dp-edid-change-during-suspend.html
[264] i915#17427
      https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17427
[265] SKIP
      https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_169493v6/shard-rkl=
-5/igt@kms_chamelium_color_pipeline@plane-fixed-matrix-yuv-rgb-bt709-lim-lu=
t1d.html
[266] SKIP
      https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19395/shard-rkl-6/igt=
@kms_chamelium_color_pipeline@plane-fixed-matrix-yuv-rgb-bt709-lim-lut1d.ht=
ml
[267] SKIP
      https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_169493v6/shard-rkl=
-6/igt@kms_chamelium_color_pipeline@plane-fixed-matrix-yuv-rgb-bt601-lim-lu=
t1d.html
[268] SKIP
      https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19395/shard-rkl-2/igt=
@kms_chamelium_color_pipeline@plane-fixed-matrix-yuv-rgb-bt601-lim-lut1d.ht=
ml
[269] i915#6095
      https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6095
[270] i915#10307
      https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/10307
[271] SKIP
      https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_169493v6/shard-dg2=
-5/igt@kms_ccs@random-ccs-data-y-tiled-gen12-rc-ccs-cc.html
[272] SKIP
      https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19395/shard-dg2-7/igt=
@kms_ccs@random-ccs-data-y-tiled-gen12-rc-ccs-cc.html
[273] i915#14098
      https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14098
[274] SKIP
      https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_169493v6/shard-rkl=
-6/igt@kms_ccs@missing-ccs-buffer-4-tiled-mtl-mc-ccs.html
[275] SKIP
      https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19395/shard-rkl-3/igt=
@kms_ccs@missing-ccs-buffer-4-tiled-mtl-mc-ccs.html
[276] i915#12313
      https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12313
[277] SKIP
      https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_169493v6/shard-rkl=
-6/igt@kms_ccs@crc-sprite-planes-basic-4-tiled-lnl-ccs.html
[278] SKIP
      https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19395/shard-rkl-2/igt=
@kms_ccs@crc-sprite-planes-basic-4-tiled-lnl-ccs.html
[279] SKIP
      https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_169493v6/shard-dg2=
-7/igt@kms_ccs@crc-primary-suspend-y-tiled-gen12-rc-ccs-cc.html
[280] SKIP
      https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19395/shard-dg2-5/igt=
@kms_ccs@crc-primary-suspend-y-tiled-gen12-rc-ccs-cc.html
[281] SKIP
      https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_169493v6/shard-dg2=
-1/igt@kms_ccs@crc-primary-suspend-4-tiled-mtl-rc-ccs-cc.html
[282] SKIP
      https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19395/shard-dg2-7/igt=
@kms_ccs@crc-primary-suspend-4-tiled-mtl-rc-ccs-cc.html
[283] i915#17158
      https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17158
[284] FAIL
      https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_169493v6/shard-mtl=
p-6/igt@kms_ccs@crc-primary-suspend-4-tiled-mtl-mc-ccs@pipe-c-edp-1.html
[285] i915#17165
      https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17165
[286] ABORT
      https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19395/shard-mtlp-1/ig=
t@kms_ccs@crc-primary-suspend-4-tiled-mtl-mc-ccs@pipe-c-edp-1.html
[287] i915#15582
      https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15582
[288] INCOMPLETE
      https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_169493v6/shard-mtl=
p-6/igt@kms_ccs@crc-primary-suspend-4-tiled-mtl-mc-ccs.html
[289] ABORT
      https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19395/shard-mtlp-1/ig=
t@kms_ccs@crc-primary-suspend-4-tiled-mtl-mc-ccs.html
[290] i915#10434
      https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/10434
[291] SKIP
      https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_169493v6/shard-dg2=
-8/igt@kms_ccs@crc-primary-rotation-180-4-tiled-mtl-mc-ccs.html
[292] SKIP
      https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19395/shard-dg2-7/igt=
@kms_ccs@crc-primary-rotation-180-4-tiled-mtl-mc-ccs.html
[293] SKIP
      https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_169493v6/shard-dg1=
-18/igt@kms_ccs@crc-primary-rotation-180-4-tiled-mtl-mc-ccs.html
[294] SKIP
      https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19395/shard-dg1-14/ig=
t@kms_ccs@crc-primary-rotation-180-4-tiled-mtl-mc-ccs.html
[295] SKIP
      https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_169493v6/shard-rkl=
-6/igt@kms_ccs@crc-primary-rotation-180-4-tiled-dg2-rc-ccs@pipe-b-hdmi-a-2.=
html
[296] SKIP
      https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19395/shard-rkl-3/igt=
@kms_ccs@crc-primary-rotation-180-4-tiled-dg2-rc-ccs@pipe-b-hdmi-a-2.html
[297] SKIP
      https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_169493v6/shard-rkl=
-3/igt@kms_ccs@crc-primary-basic-4-tiled-mtl-mc-ccs@pipe-c-hdmi-a-2.html
[298] SKIP
      https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19395/shard-rkl-6/igt=
@kms_ccs@crc-primary-basic-4-tiled-mtl-mc-ccs@pipe-c-hdmi-a-2.html
[299] SKIP
      https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_169493v6/shard-rkl=
-3/igt@kms_ccs@crc-primary-basic-4-tiled-mtl-mc-ccs@pipe-a-hdmi-a-2.html
[300] SKIP
      https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19395/shard-rkl-6/igt=
@kms_ccs@crc-primary-basic-4-tiled-mtl-mc-ccs@pipe-a-hdmi-a-2.html
[301] SKIP
      https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_169493v6/shard-dg2=
-7/igt@kms_ccs@bad-rotation-90-4-tiled-mtl-rc-ccs.html
[302] SKIP
      https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19395/shard-dg2-1/igt=
@kms_ccs@bad-rotation-90-4-tiled-mtl-rc-ccs.html
[303] i915#4538
      https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4538
[304] SKIP
      https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_169493v6/shard-dg1=
-16/igt@kms_big_fb@yf-tiled-max-hw-stride-64bpp-rotate-0.html
[305] SKIP
      https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19395/shard-dg1-12/ig=
t@kms_big_fb@yf-tiled-max-hw-stride-64bpp-rotate-0.html
[306] SKIP
      https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_169493v6/shard-rkl=
-7/igt@kms_big_fb@yf-tiled-addfb-size-offset-overflow.html
[307] SKIP
      https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19395/shard-rkl-6/igt=
@kms_big_fb@yf-tiled-addfb-size-offset-overflow.html
[308] SKIP
      https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_169493v6/shard-rkl=
-5/igt@kms_big_fb@yf-tiled-64bpp-rotate-180.html
[309] SKIP
      https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19395/shard-rkl-6/igt=
@kms_big_fb@yf-tiled-64bpp-rotate-180.html
[310] SKIP
      https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_169493v6/shard-rkl=
-6/igt@kms_big_fb@yf-tiled-16bpp-rotate-270.html
[311] SKIP
      https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19395/shard-rkl-3/igt=
@kms_big_fb@yf-tiled-16bpp-rotate-270.html
[312] SKIP
      https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_169493v6/shard-dg2=
-8/igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-180-hflip-async-flip.h=
tml
[313] SKIP
      https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19395/shard-dg2-7/igt=
@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-180-hflip-async-flip.html
[314] SKIP
      https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_169493v6/shard-dg2=
-7/igt@kms_big_fb@y-tiled-8bpp-rotate-90.html
[315] SKIP
      https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19395/shard-dg2-6/igt=
@kms_big_fb@y-tiled-8bpp-rotate-90.html
[316] i915#3638
      https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3638
[317] i915#17431
      https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17431
[318] SKIP
      https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_169493v6/shard-rkl=
-6/igt@kms_big_fb@y-tiled-8bpp-rotate-90.html
[319] SKIP
      https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19395/shard-rkl-3/igt=
@kms_big_fb@y-tiled-8bpp-rotate-90.html
[320] i915#5286
      https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5286
[321] SKIP
      https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_169493v6/shard-rkl=
-6/igt@kms_big_fb@4-tiled-max-hw-stride-32bpp-rotate-0-hflip.html
[322] SKIP
      https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19395/shard-rkl-3/igt=
@kms_big_fb@4-tiled-max-hw-stride-32bpp-rotate-0-hflip.html
[323] SKIP
      https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_169493v6/shard-dg2=
-7/igt@kms_big_fb@4-tiled-32bpp-rotate-270.html
[324] SKIP
      https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19395/shard-dg2-1/igt=
@kms_big_fb@4-tiled-32bpp-rotate-270.html
[325] SKIP
      https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_169493v6/shard-dg2=
-5/igt@kms_big_fb@4-tiled-16bpp-rotate-270.html
[326] SKIP
      https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19395/shard-dg2-7/igt=
@kms_big_fb@4-tiled-16bpp-rotate-270.html
[327] SKIP
      https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_169493v6/shard-rkl=
-5/igt@kms_big_fb@4-tiled-16bpp-rotate-180.html
[328] SKIP
      https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19395/shard-rkl-6/igt=
@kms_big_fb@4-tiled-16bpp-rotate-180.html
[329] i915#9531
      https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9531
[330] SKIP
      https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_169493v6/shard-dg2=
-1/igt@kms_atomic@plane-primary-overlay-mutable-zpos.html
[331] SKIP
      https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19395/shard-dg2-7/igt=
@kms_atomic@plane-primary-overlay-mutable-zpos.html
[332] SKIP
      https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_169493v6/shard-rkl=
-5/igt@kms_atomic@plane-primary-overlay-mutable-zpos.html
[333] SKIP
      https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19395/shard-rkl-6/igt=
@kms_atomic@plane-primary-overlay-mutable-zpos.html
[334] i915#17150
      https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17150
[335] FAIL
      https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_169493v6/shard-mtl=
p-7/igt@kms_async_flips@async-flip-suspend-resume.html
[336] i915#17175
      https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17175
[337] ABORT
      https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19395/shard-mtlp-1/ig=
t@kms_async_flips@async-flip-suspend-resume.html
[338] i915#7707
      https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/7707
[339] SKIP
      https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_169493v6/shard-rkl=
-3/igt@intel_hwmon@hwmon-write.html
[340] SKIP
      https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19395/shard-rkl-6/igt=
@intel_hwmon@hwmon-write.html
[341] i915#16166
      https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16166
[342] i915#16080
      https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16080
[343] SKIP
      https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_169493v6/shard-rkl=
-6/igt@i915_pm_rc6_residency@media-rc6-accuracy.html
[344] SKIP
      https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19395/shard-rkl-3/igt=
@i915_pm_rc6_residency@media-rc6-accuracy.html
[345] i915#6412
      https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6412
[346] SKIP
      https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_169493v6/shard-rkl=
-6/igt@i915_module_load@resize-bar.html
[347] SKIP
      https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19395/shard-rkl-2/igt=
@i915_module_load@resize-bar.html
[348] i915#2527
      https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2527
[349] SKIP
      https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_169493v6/shard-rkl=
-3/igt@gen9_exec_parse@valid-registers.html
[350] SKIP
      https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19395/shard-rkl-6/igt=
@gen9_exec_parse@valid-registers.html
[351] SKIP
      https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_169493v6/shard-rkl=
-6/igt@gen9_exec_parse@shadow-peek.html
[352] SKIP
      https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19395/shard-rkl-3/igt=
@gen9_exec_parse@shadow-peek.html
[353] i915#3297
      https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3297
[354] SKIP
      https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_169493v6/shard-rkl=
-3/igt@gem_userptr_blits@dmabuf-unsync.html
[355] SKIP
      https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19395/shard-rkl-6/igt=
@gem_userptr_blits@dmabuf-unsync.html
[356] i915#3282
      https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3282
[357] SKIP
      https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_169493v6/shard-rkl=
-3/igt@gem_pread@self.html
[358] SKIP
      https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19395/shard-rkl-6/igt=
@gem_pread@self.html
[359] SKIP
      https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_169493v6/shard-rkl=
-6/igt@gem_pread@display.html
[360] SKIP
      https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19395/shard-rkl-3/igt=
@gem_pread@display.html
[361] i915#4613
      https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4613
[362] SKIP
      https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_169493v6/shard-rkl=
-6/igt@gem_lmem_swapping@verify-random-ccs.html
[363] SKIP
      https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19395/shard-rkl-2/igt=
@gem_lmem_swapping@verify-random-ccs.html
[364] SKIP
      https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_169493v6/shard-rkl=
-3/igt@gem_lmem_swapping@massive-random.html
[365] SKIP
      https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19395/shard-rkl-6/igt=
@gem_lmem_swapping@massive-random.html
[366] i915#7582
      https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/7582
[367] SKIP
      https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_169493v6/shard-rkl=
-6/igt@gem_lmem_evict@dontneed-evict-race.html
[368] SKIP
      https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19395/shard-rkl-3/igt=
@gem_lmem_evict@dontneed-evict-race.html
[369] i915#3281
      https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3281
[370] SKIP
      https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_169493v6/shard-rkl=
-5/igt@gem_exec_reloc@basic-softpin.html
[371] SKIP
      https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19395/shard-rkl-6/igt=
@gem_exec_reloc@basic-softpin.html
[372] SKIP
      https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_169493v6/shard-rkl=
-6/igt@gem_exec_reloc@basic-gtt-cpu-active.html
[373] SKIP
      https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19395/shard-rkl-3/igt=
@gem_exec_reloc@basic-gtt-cpu-active.html
[374] i915#17416
      https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17416
[375] SKIP
      https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_169493v6/shard-rkl=
-6/igt@gem_exec_params@secure-non-root.html
[376] SKIP
      https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19395/shard-rkl-3/igt=
@gem_exec_params@secure-non-root.html
[377] i915#17453
      https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17453
[378] SKIP
      https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_169493v6/shard-rkl=
-6/igt@gem_exec_params@rsvd2-dirt.html
[379] SKIP
      https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19395/shard-rkl-2/igt=
@gem_exec_params@rsvd2-dirt.html
[380] i915#15816
      https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15816
[381] FAIL
      https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_169493v6/shard-tgl=
u-2/igt@gem_exec_big@single.html
[382] i915#15944
      https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15944
[383] FAIL
      https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19395/shard-tglu-4/ig=
t@gem_exec_big@single.html
[384] i915#13363
      https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13363
[385] ABORT
      https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_169493v6/shard-tgl=
u-5/igt@gem_eio@kms.html
[386] DMESG-WARN
      https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19395/shard-tglu-7/ig=
t@gem_eio@kms.html
[387] i915#17268
      https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17268
[388] FAIL
      https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_169493v6/shard-mtl=
p-2/igt@gem_eio@in-flight-suspend.html
[389] ABORT
      https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19395/shard-mtlp-7/ig=
t@gem_eio@in-flight-suspend.html
[390] i915#280
      https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/280
[391] SKIP
      https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_169493v6/shard-rkl=
-5/igt@gem_ctx_sseu@engines.html
[392] SKIP
      https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19395/shard-rkl-6/igt=
@gem_ctx_sseu@engines.html
[393] i915#6335
      https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6335
[394] SKIP
      https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_169493v6/shard-rkl=
-6/igt@gem_create@create-ext-cpu-access-sanity-check.html
[395] SKIP
      https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19395/shard-rkl-3/igt=
@gem_create@create-ext-cpu-access-sanity-check.html
[396] i915#7697
      https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/7697
[397] SKIP
      https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_169493v6/shard-rkl=
-6/igt@gem_close_race@multigpu-basic-process.html
[398] SKIP
      https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19395/shard-rkl-2/igt=
@gem_close_race@multigpu-basic-process.html
[399] i915#13008
      https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13008
[400] SKIP
      https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_169493v6/shard-rkl=
-6/igt@gem_ccs@large-ctrl-surf-copy.html
[401] SKIP
      https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19395/shard-rkl-3/igt=
@gem_ccs@large-ctrl-surf-copy.html
[402] i915#9323
      https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9323
[403] SKIP
      https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_169493v6/shard-rkl=
-6/igt@gem_ccs@ctrl-surf-copy.html
[404] SKIP
      https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19395/shard-rkl-3/igt=
@gem_ccs@ctrl-surf-copy.html
[405] PASS
      https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_169493v6/shard-dg2=
-5/igt@kms_plane_scaling@planes-downscale-factor-0-75-upscale-factor-0-25@p=
ipe-d.html
[406] i915#15329
      https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15329
[407] SKIP
      https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19395/shard-dg2-7/igt=
@kms_plane_scaling@planes-downscale-factor-0-75-upscale-factor-0-25@pipe-d.=
html
[408] PASS
      https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_169493v6/shard-dg2=
-5/igt@kms_plane_scaling@planes-downscale-factor-0-75-upscale-factor-0-25.h=
tml
[409] i915#9423
      https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9423
[410] i915#6953
      https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6953
[411] SKIP
      https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19395/shard-dg2-7/igt=
@kms_plane_scaling@planes-downscale-factor-0-75-upscale-factor-0-25.html
[412] PASS
      https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_169493v6/shard-dg2=
-1/igt@kms_plane_scaling@planes-downscale-factor-0-5-upscale-20x20.html
[413] SKIP
      https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19395/shard-dg2-7/igt=
@kms_plane_scaling@planes-downscale-factor-0-5-upscale-20x20.html
[414] PASS
      https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_169493v6/shard-dg2=
-1/igt@kms_plane_scaling@plane-upscale-20x20-with-pixel-format@pipe-c.html
[415] SKIP
      https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19395/shard-dg2-7/igt=
@kms_plane_scaling@plane-upscale-20x20-with-pixel-format@pipe-c.html
[416] PASS
      https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_169493v6/shard-dg2=
-8/igt@kms_plane_scaling@invalid-num-scalers.html
[417] SKIP
      https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19395/shard-dg2-7/igt=
@kms_plane_scaling@invalid-num-scalers.html
[418] PASS
      https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_169493v6/shard-rkl=
-5/igt@kms_plane@plane-panning-bottom-right-suspend@pipe-b.html
[419] ABORT
      https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19395/shard-rkl-1/igt=
@kms_plane@plane-panning-bottom-right-suspend@pipe-b.html
[420] PASS
      https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_169493v6/shard-glk=
1/igt@kms_plane@plane-panning-bottom-right-suspend@pipe-a.html
[421] i915#13026
      https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13026
[422] INCOMPLETE
      https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19395/shard-glk8/igt@=
kms_plane@plane-panning-bottom-right-suspend@pipe-a.html
[423] PASS
      https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_169493v6/shard-rkl=
-2/igt@kms_pipe_crc_basic@suspend-read-crc.html
[424] i915#13476
      https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13476
[425] i915#12756
      https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12756
[426] INCOMPLETE
      https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19395/shard-rkl-3/igt=
@kms_pipe_crc_basic@suspend-read-crc.html
[427] PASS
      https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_169493v6/shard-dg2=
-5/igt@kms_invalid_mode@uint-max-clock.html
[428] i915#16746
      https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16746
[429] SKIP
      https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19395/shard-dg2-7/igt=
@kms_invalid_mode@uint-max-clock.html
[430] PASS
      https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_169493v6/shard-dg2=
-8/igt@kms_invalid_mode@overflow-vrefresh.html
[431] SKIP
      https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19395/shard-dg2-7/igt=
@kms_invalid_mode@overflow-vrefresh.html
[432] PASS
      https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_169493v6/shard-rkl=
-6/igt@kms_hdr@static-toggle.html
[433] SKIP
      https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19395/shard-rkl-3/igt=
@kms_hdr@static-toggle.html
[434] PASS
      https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_169493v6/shard-dg2=
-8/igt@kms_hdmi_audio_bw@suspend-mem-audio-recovery.html
[435] SKIP
      https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19395/shard-dg2-7/igt=
@kms_hdmi_audio_bw@suspend-mem-audio-recovery.html
[436] PASS
      https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_169493v6/shard-glk=
8/igt@kms_frontbuffer_tracking@hdr-2p-primscrn-spr-indfb-draw-mmap-cpu.html
[437] i915#17517
      https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17517
[438] SKIP
      https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19395/shard-glk1/igt@=
kms_frontbuffer_tracking@hdr-2p-primscrn-spr-indfb-draw-mmap-cpu.html
[439] PASS
      https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_169493v6/shard-rkl=
-6/igt@kms_frontbuffer_tracking@fbchdr-1p-primscrn-cur-indfb-onoff.html
[440] SKIP
      https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19395/shard-rkl-3/igt=
@kms_frontbuffer_tracking@fbchdr-1p-primscrn-cur-indfb-onoff.html
[441] PASS
      https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_169493v6/shard-dg2=
-1/igt@kms_frontbuffer_tracking@fbc-indfb-scaledprimary.html
[442] SKIP
      https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19395/shard-dg2-7/igt=
@kms_frontbuffer_tracking@fbc-indfb-scaledprimary.html
[443] PASS
      https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_169493v6/shard-dg1=
-15/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-spr-indfb-draw-render.html
[444] FAIL
      https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19395/shard-dg1-14/ig=
t@kms_frontbuffer_tracking@fbc-1p-primscrn-spr-indfb-draw-render.html
[445] PASS
      https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_169493v6/shard-dg2=
-1/igt@kms_frontbuffer_tracking@fbc-1p-offscreen-pri-indfb-draw-mmap-cpu.ht=
ml
[446] SKIP
      https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19395/shard-dg2-7/igt=
@kms_frontbuffer_tracking@fbc-1p-offscreen-pri-indfb-draw-mmap-cpu.html
[447] PASS
      https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_169493v6/shard-dg2=
-8/igt@kms_flip_scaled_crc@flip-64bpp-linear-to-16bpp-linear-downscaling.ht=
ml
[448] i915#8813
      https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8813
[449] SKIP
      https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19395/shard-dg2-7/igt=
@kms_flip_scaled_crc@flip-64bpp-linear-to-16bpp-linear-downscaling.html
[450] PASS
      https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_169493v6/shard-dg1=
-17/igt@kms_flip@nonexisting-fb-interruptible.html
[451] DMESG-WARN
      https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19395/shard-dg1-15/ig=
t@kms_flip@nonexisting-fb-interruptible.html
[452] PASS
      https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_169493v6/shard-rkl=
-8/igt@kms_flip@flip-vs-suspend-interruptible.html
[453] i915#16276
      https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16276
[454] INCOMPLETE
      https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19395/shard-rkl-7/igt=
@kms_flip@flip-vs-suspend-interruptible.html
[455] PASS
      https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_169493v6/shard-dg2=
-8/igt@kms_flip@basic-flip-vs-dpms.html
[456] SKIP
      https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19395/shard-dg2-7/igt=
@kms_flip@basic-flip-vs-dpms.html
[457] PASS
      https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_169493v6/shard-rkl=
-7/igt@kms_fbcon_fbt@fbc-suspend.html
[458] i915#9878
      https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9878
[459] INCOMPLETE
      https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19395/shard-rkl-6/igt=
@kms_fbcon_fbt@fbc-suspend.html
[460] PASS
      https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_169493v6/shard-tgl=
u-3/igt@kms_cursor_crc@cursor-sliding-128x42@pipe-a-hdmi-a-1.html
[461] i915#13566
      https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13566
[462] FAIL
      https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19395/shard-tglu-10/i=
gt@kms_cursor_crc@cursor-sliding-128x42@pipe-a-hdmi-a-1.html
[463] PASS
      https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_169493v6/shard-dg2=
-8/igt@kms_color_pipeline@plane-fixed-matrix-yuv-rgb-bt601-lut1d.html
[464] i915#15529
      https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15529
[465] SKIP
      https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19395/shard-dg2-7/igt=
@kms_color_pipeline@plane-fixed-matrix-yuv-rgb-bt601-lut1d.html
[466] PASS
      https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_169493v6/shard-dg2=
-4/igt@kms_color@ctm-0-25.html
[467] i915#17373
      https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17373
[468] i915#12655
      https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12655
[469] SKIP
      https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19395/shard-dg2-7/igt=
@kms_color@ctm-0-25.html
[470] PASS
      https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_169493v6/shard-dg2=
-1/igt@kms_busy@basic.html
[471] i915#11190
      https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11190
[472] SKIP
      https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19395/shard-dg2-7/igt=
@kms_busy@basic.html
[473] PASS
      https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_169493v6/shard-dg2=
-8/igt@kms_big_fb@x-tiled-64bpp-rotate-180.html
[474] SKIP
      https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19395/shard-dg2-7/igt=
@kms_big_fb@x-tiled-64bpp-rotate-180.html
[475] PASS
      https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_169493v6/shard-mtl=
p-7/igt@kms_async_flips@async-flip-suspend-resume@pipe-c-edp-1.html
[476] ABORT
      https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19395/shard-mtlp-1/ig=
t@kms_async_flips@async-flip-suspend-resume@pipe-c-edp-1.html
[477] PASS
      https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_169493v6/shard-dg1=
-14/igt@kms_async_flips@alternate-sync-async-flip-atomic.html
[478] i915#14888
      https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14888
[479] FAIL
      https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19395/shard-dg1-15/ig=
t@kms_async_flips@alternate-sync-async-flip-atomic.html
[480] PASS
      https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_169493v6/shard-mtl=
p-6/igt@i915_suspend@debugfs-reader.html
[481] i915#17182
      https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17182
[482] INCOMPLETE
      https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19395/shard-mtlp-8/ig=
t@i915_suspend@debugfs-reader.html
[483] PASS
      https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_169493v6/shard-rkl=
-4/igt@gem_workarounds@suspend-resume-fd.html
[484] INCOMPLETE
      https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19395/shard-rkl-4/igt=
@gem_workarounds@suspend-resume-fd.html
[485] PASS
      https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_169493v6/shard-dg1=
-18/igt@gem_linear_blits@normal.html
[486] i915#15391
      https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15391
[487] FAIL
      https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19395/shard-dg1-14/ig=
t@gem_linear_blits@normal.html
[488] PASS
      https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_169493v6/shard-dg1=
-16/igt@gem_eio@in-flight-suspend.html
[489] i915#4391
      https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4391
[490] i915#13390
      https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13390
[491] DMESG-WARN
      https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19395/shard-dg1-12/ig=
t@gem_eio@in-flight-suspend.html
[492] PASS
      https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_169493v6/shard-dg2=
-7/igt@gem_ccs@suspend-resume.html
[493] i915#16348
      https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16348
[494] INCOMPLETE
      https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19395/shard-dg2-5/igt=
@gem_ccs@suspend-resume.html
[495] PASS
      https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_169493v6/shard-dg2=
-1/igt@drm_read@short-buffer-block.html
[496] i915#17359
      https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17359
[497] SKIP
      https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19395/shard-dg2-7/igt=
@drm_read@short-buffer-block.html
[498] i915#17447
      https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17447
[499] SKIP
      https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_169493v6/shard-rkl=
-4/igt@tools_test@sysfs_l3_parity.html
[500] SKIP
      https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_169493v6/shard-rkl=
-4/igt@prime_vgem@fence-write-hang.html
[501] SKIP
      https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_169493v6/shard-mtl=
p-6/igt@prime_vgem@fence-read-hang.html
[502] SKIP
      https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_169493v6/shard-tgl=
u-1/igt@prime_vgem@fence-flip-hang.html
[503] i915#17467
      https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17467
[504] SKIP
      https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_169493v6/shard-glk=
10/igt@prime_vgem@coherency-gtt.html
[505] i915#16420
      https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16420
[506] SKIP
      https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_169493v6/shard-rkl=
-8/igt@prime_udl@share-import.html
[507] SKIP
      https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_169493v6/shard-tgl=
u-1/igt@prime_udl@share-import.html
[508] i915#17583
      https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17583
[509] SKIP
      https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_169493v6/shard-glk=
10/igt@perf_pmu@rc6-all-gts.html
[510] i915#17119
      https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17119
[511] FAIL
      https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_169493v6/shard-rkl=
-4/igt@perf_pmu@module-unload.html
[512] i915#2433
      https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2433
[513] SKIP
      https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_169493v6/shard-rkl=
-7/igt@perf@unprivileged-single-ctx-counters.html
[514] SKIP
      https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_169493v6/shard-tgl=
u-1/igt@perf@unprivileged-single-ctx-counters.html
[515] i915#2434
      https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2434
[516] SKIP
      https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_169493v6/shard-dg1=
-14/igt@perf@mi-rpc.html
[517] i915#17536
      https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17536
[518] SKIP
      https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_169493v6/shard-glk=
11/igt@perf@gen12-unprivileged-single-ctx-counters.html
[519] SKIP
      https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_169493v6/shard-tgl=
u-10/igt@kms_vrr@negative-basic.html
[520] i915#11920
      https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11920
[521] SKIP
      https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_169493v6/shard-dg1=
-18/igt@kms_vrr@lobf.html
[522] i915#17520
      https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17520
[523] SKIP
      https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_169493v6/shard-glk=
10/igt@kms_vrr@flipline.html
[524] SKIP
      https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_169493v6/shard-glk=
3/igt@kms_vrr@flip-suspend.html
[525] SKIP
      https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_169493v6/shard-glk=
11/igt@kms_vrr@flip-dpms.html
[526] SKIP
      https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_169493v6/shard-rkl=
-4/igt@kms_vrr@flip-basic-fastset.html
[527] i915#17209
      https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17209
[528] FAIL
      https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_169493v6/shard-mtl=
p-7/igt@kms_vblank@ts-continuation-suspend@pipe-a-edp-1.html
[529] i915#12276
      https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12276
[530] INCOMPLETE
      https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_169493v6/shard-mtl=
p-7/igt@kms_vblank@ts-continuation-suspend.html
[531] INCOMPLETE
      https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_169493v6/shard-glk=
3/igt@kms_vblank@ts-continuation-dpms-suspend@pipe-c-hdmi-a-1.html
[532] INCOMPLETE
      https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_169493v6/shard-snb=
4/igt@kms_vblank@ts-continuation-dpms-suspend.html
[533] PASS
      https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19395/shard-snb7/igt@=
kms_vblank@ts-continuation-dpms-suspend.html
[534] i915#17445
      https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17445
[535] SKIP
      https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_169493v6/shard-dg2=
-7/igt@kms_tv_load_detect@load-detect.html
[536] SKIP
      https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_169493v6/shard-dg1=
-18/igt@kms_tv_load_detect@load-detect.html
[537] SKIP
      https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_169493v6/shard-tgl=
u-2/igt@kms_tiled_display@basic-test-pattern-with-chamelium.html
[538] i915#9041
      https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9041
[539] i915#5030
      https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5030
[540] SKIP
      https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_169493v6/shard-mtl=
p-6/igt@kms_scaling_modes@scaling-mode-none@pipe-d-edp-1.html
[541] SKIP
      https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_169493v6/shard-mtl=
p-6/igt@kms_scaling_modes@scaling-mode-none@pipe-a-edp-1.html
[542] SKIP
      https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_169493v6/shard-mtl=
p-6/igt@kms_scaling_modes@scaling-mode-none.html
[543] SKIP
      https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_169493v6/shard-dg2=
-6/igt@kms_rotation_crc@primary-yf-tiled-reflect-x-90.html
[544] SKIP
      https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_169493v6/shard-dg1=
-15/igt@kms_rotation_crc@primary-yf-tiled-reflect-x-270.html
[545] i915#17488
      https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17488
[546] SKIP
      https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_169493v6/shard-glk=
10/igt@kms_rotation_crc@primary-y-tiled-reflect-x-270.html
[547] SKIP
      https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_169493v6/shard-rkl=
-5/igt@kms_rotation_crc@primary-4-tiled-reflect-x-180.html
[548] SKIP
      https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_169493v6/shard-tgl=
u-1/igt@kms_rotation_crc@primary-4-tiled-reflect-x-0.html
[549] i915#16184
      https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16184
[550] i915#15500
      https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15500
[551] INCOMPLETE
      https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_169493v6/shard-glk=
3/igt@kms_rotation_crc@multiplane-rotation-cropping-bottom.html
[552] i915#15949
      https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15949
[553] SKIP
      https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_169493v6/shard-tgl=
u-1/igt@kms_psr_stress_test@flip-primary-invalidate-overlay.html
[554] SKIP
      https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_169493v6/shard-dg1=
-14/igt@kms_psr_stress_test@flip-primary-invalidate-overlay.html
[555] i915#17554
      https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17554
[556] SKIP
      https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_169493v6/shard-glk=
3/igt@kms_psr_stress_test@flip-primary-invalidate-overlay.html
[557] SKIP
      https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_169493v6/shard-rkl=
-8/igt@kms_psr@psr-sprite-plane-move.html
[558] i915#17480
      https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17480
[559] SKIP
      https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_169493v6/shard-glk=
10/igt@kms_psr@psr-primary-page-flip.html
[560] i915#9688
      https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9688
[561] SKIP
      https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_169493v6/shard-mtl=
p-6/igt@kms_psr@pr-sprite-plane-onoff.html
[562] SKIP
      https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_169493v6/shard-glk=
11/igt@kms_psr@fbc-psr2-sprite-mmap-cpu.html
[563] SKIP
      https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_169493v6/shard-dg2=
-7/igt@kms_psr@fbc-psr-primary-blt.html
[564] SKIP
      https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_169493v6/shard-tgl=
u-10/igt@kms_psr@fbc-psr-cursor-plane-onoff.html
[565] SKIP
      https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_169493v6/shard-tgl=
u-1/igt@kms_psr@fbc-pr-sprite-render.html
[566] SKIP
      https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_169493v6/shard-dg1=
-14/igt@kms_psr@fbc-pr-sprite-render.html
[567] SKIP
      https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_169493v6/shard-glk=
10/igt@kms_psr@fbc-pr-primary-render.html
[568] SKIP
      https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_169493v6/shard-glk=
3/igt@kms_psr@fbc-pr-primary-mmap-cpu.html
[569] i915#9683
      https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9683
[570] SKIP
      https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_169493v6/shard-rkl=
-4/igt@kms_psr2_su@page_flip-xrgb8888.html
[571] SKIP
      https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_169493v6/shard-tgl=
u-1/igt@kms_psr2_su@frontbuffer-xrgb8888.html
[572] SKIP
      https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_169493v6/shard-rkl=
-7/igt@kms_psr2_sf@psr2-overlay-plane-update-sf-dmg-area.html
[573] SKIP
      https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_169493v6/shard-tgl=
u-1/igt@kms_psr2_sf@psr2-overlay-plane-update-sf-dmg-area.html
[574] SKIP
      https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_169493v6/shard-glk=
3/igt@kms_psr2_sf@psr2-cursor-plane-move-continuous-sf.html
[575] SKIP
      https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_169493v6/shard-glk=
11/igt@kms_psr2_sf@psr2-cursor-plane-move-continuous-exceed-sf.html
[576] SKIP
      https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_169493v6/shard-glk=
10/igt@kms_psr2_sf@pr-primary-plane-update-sf-dmg-area-big-fb.html
[577] SKIP
      https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_169493v6/shard-dg2=
-7/igt@kms_psr2_sf@fbc-psr2-overlay-plane-move-continuous-exceed-sf.html
[578] SKIP
      https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_169493v6/shard-dg1=
-18/igt@kms_psr2_sf@fbc-psr2-overlay-plane-move-continuous-exceed-sf.html
[579] i915#9808
      https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9808
[580] SKIP
      https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_169493v6/shard-mtl=
p-6/igt@kms_psr2_sf@fbc-psr2-overlay-plane-move-continuous-exceed-fully-sf@=
pipe-a-edp-1.html
[581] i915#12316
      https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12316
[582] SKIP
      https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_169493v6/shard-mtl=
p-6/igt@kms_psr2_sf@fbc-psr2-overlay-plane-move-continuous-exceed-fully-sf.=
html
[583] SKIP
      https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_169493v6/shard-tgl=
u-10/igt@kms_psr2_sf@fbc-pr-cursor-plane-update-sf.html
[584] SKIP
      https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_169493v6/shard-tgl=
u-10/igt@kms_prime@basic-modeset-hybrid.html
[585] i915#17569
      https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17569
[586] SKIP
      https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_169493v6/shard-glk=
10/igt@kms_prime@basic-modeset-hybrid.html
[587] i915#17450
      https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17450
[588] i915#17434
      https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17434
[589] SKIP
      https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_169493v6/shard-rkl=
-8/igt@kms_pm_rpm@pc8-residency.html
[590] SKIP
      https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_169493v6/shard-mtl=
p-7/igt@kms_pm_rpm@pc8-residency.html
[591] i915#15073
      https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15073
[592] SKIP
      https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_169493v6/shard-tgl=
u-10/igt@kms_pm_rpm@modeset-non-lpsp-stress-no-wait.html
[593] SKIP
      https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_169493v6/shard-tgl=
u-1/igt@kms_pm_rpm@modeset-non-lpsp.html
[594] SKIP
      https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_169493v6/shard-rkl=
-3/igt@kms_pm_rpm@modeset-lpsp-stress-no-wait.html
[595] SKIP
      https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_169493v6/shard-glk=
10/igt@kms_pm_rpm@modeset-lpsp.html
[596] SKIP
      https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_169493v6/shard-rkl=
-8/igt@kms_pm_rpm@dpms-non-lpsp.html
[597] PASS
      https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19395/shard-rkl-7/igt=
@kms_pm_rpm@dpms-non-lpsp.html
[598] SKIP
      https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_169493v6/shard-dg1=
-17/igt@kms_pm_rpm@dpms-lpsp.html
[599] PASS
      https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19395/shard-dg1-15/ig=
t@kms_pm_rpm@dpms-lpsp.html
[600] i915#9340
      https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9340
[601] SKIP
      https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_169493v6/shard-rkl=
-4/igt@kms_pm_lpsp@kms-lpsp.html
[602] i915#15739
      https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15739
[603] SKIP
      https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_169493v6/shard-rkl=
-7/igt@kms_pm_dc@dc9-dpms.html
[604] SKIP
      https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_169493v6/shard-tgl=
u-1/igt@kms_pm_dc@dc9-dpms.html
[605] i915#16479
      https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16479
[606] FAIL
      https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_169493v6/shard-rkl=
-5/igt@kms_pm_dc@dc6-dpms.html
[607] i915#3828
      https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3828
[608] SKIP
      https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_169493v6/shard-tgl=
u-1/igt@kms_pm_dc@dc5-retention-flops.html
[609] SKIP
      https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_169493v6/shard-dg1=
-14/igt@kms_pm_dc@dc5-retention-flops.html
[610] i915#17553
      https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17553
[611] SKIP
      https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_169493v6/shard-glk=
3/igt@kms_pm_dc@dc5-retention-flops.html
[612] SKIP
      https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_169493v6/shard-tgl=
u-10/igt@kms_pm_dc@dc5-psr.html
[613] i915#17564
      https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17564
[614] SKIP
      https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_169493v6/shard-glk=
10/igt@kms_pm_dc@dc5-psr.html
[615] i915#17495
      https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17495
[616] SKIP
      https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_169493v6/shard-glk=
11/igt@kms_pm_dc@dc5-pageflip-negative.html
[617] i915#13441
      https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13441
[618] SKIP
      https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_169493v6/shard-dg2=
-7/igt@kms_pm_dc@dc5-dpms-negative.html
[619] PASS
      https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19395/shard-dg2-6/igt=
@kms_pm_dc@dc5-dpms-negative.html
[620] i915#12343
      https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12343
[621] SKIP
      https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_169493v6/shard-rkl=
-7/igt@kms_pm_backlight@fade.html
[622] i915#9812
      https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9812
[623] SKIP
      https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_169493v6/shard-tgl=
u-1/igt@kms_pm_backlight@fade.html
[624] SKIP
      https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_169493v6/shard-rkl=
-8/igt@kms_pm_backlight@brightness-with-dpms.html
[625] SKIP
      https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_169493v6/shard-tgl=
u-1/igt@kms_pm_backlight@brightness-with-dpms.html
[626] SKIP
      https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_169493v6/shard-dg2=
-7/igt@kms_plane_scaling@planes-upscale-factor-0-25-downscale-factor-0-75@p=
ipe-d.html
[627] SKIP
      https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_169493v6/shard-dg2=
-7/igt@kms_plane_scaling@planes-upscale-factor-0-25-downscale-factor-0-75@p=
ipe-c.html
[628] SKIP
      https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_169493v6/shard-dg2=
-7/igt@kms_plane_scaling@planes-upscale-factor-0-25-downscale-factor-0-75.h=
tml
[629] SKIP
      https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_169493v6/shard-dg2=
-7/igt@kms_plane_scaling@planes-upscale-20x20-downscale-factor-0-5@pipe-d.h=
tml
[630] PASS
      https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19395/shard-dg2-6/igt=
@kms_plane_scaling@planes-upscale-20x20-downscale-factor-0-5@pipe-d.html
[631] SKIP
      https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_169493v6/shard-dg2=
-7/igt@kms_plane_scaling@planes-upscale-20x20-downscale-factor-0-5.html
[632] PASS
      https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19395/shard-dg2-6/igt=
@kms_plane_scaling@planes-upscale-20x20-downscale-factor-0-5.html
[633] SKIP
      https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_169493v6/shard-dg2=
-7/igt@kms_plane_scaling@plane-upscale-factor-0-25-with-rotation.html
[634] PASS
      https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19395/shard-dg2-1/igt=
@kms_plane_scaling@plane-upscale-factor-0-25-with-rotation.html
[635] i915#17529
      https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17529
[636] SKIP
      https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_169493v6/shard-glk=
3/igt@kms_plane_scaling@plane-scaler-with-clipping-clamping-rotation@pipe-b=
.html
[637] SKIP
      https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_169493v6/shard-tgl=
u-1/igt@kms_plane_scaling@plane-scaler-with-clipping-clamping-rotation@pipe=
-b.html
[638] SKIP
      https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_169493v6/shard-dg1=
-14/igt@kms_plane_scaling@plane-scaler-with-clipping-clamping-rotation@pipe=
-b.html
[639] SKIP
      https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_169493v6/shard-tgl=
u-1/igt@kms_plane_scaling@plane-scaler-with-clipping-clamping-rotation.html
[640] SKIP
      https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_169493v6/shard-dg1=
-14/igt@kms_plane_scaling@plane-scaler-with-clipping-clamping-rotation.html
[641] SKIP
      https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_169493v6/shard-dg2=
-7/igt@kms_plane_scaling@plane-downscale-factor-0-75-with-rotation@pipe-b.h=
tml
[642] PASS
      https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19395/shard-dg2-1/igt=
@kms_plane_scaling@plane-downscale-factor-0-75-with-rotation@pipe-b.html
[643] SKIP
      https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_169493v6/shard-tgl=
u-10/igt@kms_plane_scaling@plane-downscale-factor-0-5-with-rotation@pipe-c.=
html
[644] i915#17528
      https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17528
[645] SKIP
      https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_169493v6/shard-glk=
3/igt@kms_plane_scaling@plane-downscale-factor-0-5-with-rotation.html
[646] SKIP
      https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_169493v6/shard-dg2=
-7/igt@kms_plane_scaling@plane-downscale-factor-0-5-with-modifiers.html
[647] SKIP
      https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_169493v6/shard-tgl=
u-1/igt@kms_plane_multiple@tiling-yf.html
[648] SKIP
      https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_169493v6/shard-dg1=
-14/igt@kms_plane_multiple@tiling-yf.html
[649] i915#17542
      https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17542
[650] SKIP
      https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_169493v6/shard-glk=
11/igt@kms_plane_multiple@tiling-4.html
[651] SKIP
      https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_169493v6/shard-tgl=
u-10/igt@kms_plane_multiple@2x-tiling-y.html
[652] SKIP
      https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_169493v6/shard-mtl=
p-6/igt@kms_plane_multiple@2x-tiling-none.html
[653] i915#17586
      https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17586
[654] SKIP
      https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_169493v6/shard-glk=
10/igt@kms_plane_multiple@2x-tiling-4.html
[655] i915#10647
      https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/10647
[656] FAIL
      https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_169493v6/shard-glk=
3/igt@kms_plane_alpha_blend@constant-alpha-max@pipe-c-hdmi-a-1.html
[657] i915#12169
      https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12169
[658] FAIL
      https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_169493v6/shard-glk=
3/igt@kms_plane_alpha_blend@constant-alpha-max.html
[659] i915#7862
      https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/7862
[660] FAIL
      https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_169493v6/shard-glk=
3/igt@kms_plane_alpha_blend@alpha-basic@pipe-a-hdmi-a-1.html
[661] i915#12178
      https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12178
[662] FAIL
      https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_169493v6/shard-glk=
3/igt@kms_plane_alpha_blend@alpha-basic.html
[663] i915#8825
      https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8825
[664] SKIP
      https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_169493v6/shard-dg2=
-7/igt@kms_plane@plane-panning-top-left.html
[665] PASS
      https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19395/shard-dg2-6/igt=
@kms_plane@plane-panning-top-left.html
[666] INCOMPLETE
      https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_169493v6/shard-glk=
1/igt@kms_plane@plane-panning-bottom-right-suspend@pipe-b.html
[667] SKIP
      https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_169493v6/shard-dg1=
-18/igt@kms_plane@pixel-format-yf-tiled-ccs-modifier-source-clamping.html
[668] SKIP
      https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_169493v6/shard-tgl=
u-10/igt@kms_plane@pixel-format-y-tiled-gen12-mc-ccs-modifier-source-clampi=
ng.html
[669] i915#16386
      https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16386
[670] SKIP
      https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_169493v6/shard-tgl=
u-1/igt@kms_plane@pixel-format-x-tiled-modifier@pipe-b-plane-7.html
[671] SKIP
      https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_169493v6/shard-rkl=
-8/igt@kms_plane@pixel-format-x-tiled-modifier@pipe-b-plane-5.html
[672] i915#17479
      https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17479
[673] SKIP
      https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_169493v6/shard-glk=
3/igt@kms_plane@pixel-format-4-tiled-mtl-rc-ccs-modifier.html
[674] SKIP
      https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_169493v6/shard-glk=
10/igt@kms_plane@pixel-format-4-tiled-mtl-rc-ccs-cc-modifier-source-clampin=
g.html
[675] SKIP
      https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_169493v6/shard-dg2=
-7/igt@kms_plane@pixel-format-4-tiled-lnl-ccs-modifier.html
[676] SKIP
      https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_169493v6/shard-rkl=
-2/igt@kms_plane@pixel-format-4-tiled-dg2-rc-ccs-cc-modifier-source-clampin=
g.html
[677] SKIP
      https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_169493v6/shard-tgl=
u-1/igt@kms_plane@pixel-format-4-tiled-bmg-ccs-modifier-source-clamping.htm=
l
[678] SKIP
      https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_169493v6/shard-rkl=
-4/igt@kms_pipe_stress@stress-xrgb8888-4tiled.html
[679] i915#17540
      https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17540
[680] SKIP
      https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_169493v6/shard-glk=
3/igt@kms_pipe_b_c_ivb@pipe-b-dpms-off-modeset-pipe-c.html
[681] SKIP
      https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_169493v6/shard-tgl=
u-10/igt@kms_pipe_b_c_ivb@from-pipe-c-to-b-with-3-lanes.html
[682] i915#6301
      https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6301
[683] SKIP
      https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_169493v6/shard-rkl=
-8/igt@kms_panel_fitting@legacy.html
[684] SKIP
      https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_169493v6/shard-tgl=
u-1/igt@kms_panel_fitting@legacy.html
[685] i915#17577
      https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17577
[686] SKIP
      https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_169493v6/shard-glk=
10/igt@kms_panel_fitting@atomic-fastset.html
[687] i915#17579
      https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17579
[688] SKIP
      https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_169493v6/shard-glk=
10/igt@kms_mst@mst-suspend-read-crc.html
[689] i915#15722
      https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15722
[690] i915#15638
      https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15638
[691] SKIP
      https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_169493v6/shard-rkl=
-4/igt@kms_joiner@switch-modeset-ultra-joiner-big-joiner.html
[692] SKIP
      https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_169493v6/shard-rkl=
-8/igt@kms_joiner@invalid-modeset-force-ultra-joiner.html
[693] SKIP
      https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_169493v6/shard-tgl=
u-1/igt@kms_joiner@invalid-modeset-force-ultra-joiner.html
[694] i915#15459
      https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15459
[695] SKIP
      https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_169493v6/shard-rkl=
-7/igt@kms_joiner@invalid-modeset-force-big-joiner.html
[696] SKIP
      https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_169493v6/shard-tgl=
u-1/igt@kms_joiner@invalid-modeset-force-big-joiner.html
[697] i915#17512
      https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17512
[698] SKIP
      https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_169493v6/shard-glk=
10/igt@kms_joiner@invalid-modeset-big-joiner.html
[699] SKIP
      https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_169493v6/shard-tgl=
u-10/igt@kms_joiner@basic-ultra-joiner.html
[700] i915#17567
      https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17567
[701] SKIP
      https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_169493v6/shard-glk=
10/igt@kms_joiner@basic-ultra-joiner.html
[702] SKIP
      https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_169493v6/shard-dg2=
-7/igt@kms_invalid_mode@zero-vdisplay.html
[703] PASS
      https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19395/shard-dg2-1/igt=
@kms_invalid_mode@zero-vdisplay.html
[704] SKIP
      https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_169493v6/shard-dg2=
-7/igt@kms_invalid_mode@bad-hsync-start.html
[705] SKIP
      https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_169493v6/shard-rkl=
-4/igt@kms_hdr@static-toggle-suspend.html
[706] SKIP
      https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_169493v6/shard-tgl=
u-10/igt@kms_hdr@static-toggle.html
[707] SKIP
      https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_169493v6/shard-dg1=
-18/igt@kms_hdr@static-swap.html
[708] i915#17498
      https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17498
[709] SKIP
      https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_169493v6/shard-glk=
10/igt@kms_hdr@invalid-metadata-sizes.html
[710] SKIP
      https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_169493v6/shard-glk=
3/igt@kms_hdr@invalid-hdr.html
[711] SKIP
      https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_169493v6/shard-tgl=
u-1/igt@kms_hdr@bpc-switch.html
[712] INCOMPLETE
      https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_169493v6/shard-glk=
5/igt@kms_hdmi_audio_bw@suspend-mem-audio-recovery.html
[713] i915#17188
      https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17188
[714] i915#17108
      https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17108
[715] i915#17101
      https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17101
[716] FAIL
      https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_169493v6/shard-tgl=
u-8/igt@kms_hdmi_audio_bw@suspend-disk-audio-recovery.html
[717] FAIL
      https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_169493v6/shard-glk=
11/igt@kms_hdmi_audio_bw@suspend-disk-audio-recovery.html
[718] SKIP
      https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_169493v6/shard-dg2=
-7/igt@kms_hdmi_audio_bw@audio-bw-hblank80.html
[719] PASS
      https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19395/shard-dg2-6/igt=
@kms_hdmi_audio_bw@audio-bw-hblank80.html
[720] DMESG-WARN
      https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_169493v6/shard-dg1=
-15/igt@kms_getfb@getfb2-handle-not-fb.html
[721] SKIP
      https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_169493v6/shard-dg2=
-7/igt@kms_frontbuffer_tracking@psrhdr-2p-primscrn-spr-indfb-draw-render.ht=
ml
[722] SKIP
      https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_169493v6/shard-dg1=
-15/igt@kms_frontbuffer_tracking@psrhdr-1p-primscrn-spr-indfb-move.html
[723] SKIP
      https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_169493v6/shard-mtl=
p-2/igt@kms_frontbuffer_tracking@psrhdr-1p-primscrn-spr-indfb-draw-mmap-cpu=
.html
[724] SKIP
      https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_169493v6/shard-tgl=
u-10/igt@kms_frontbuffer_tracking@psrhdr-1p-primscrn-indfb-pgflip-blt.html
[725] SKIP
      https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_169493v6/shard-dg1=
-15/igt@kms_frontbuffer_tracking@psr-rgb565-draw-mmap-wc.html
[726] SKIP
      https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_169493v6/shard-tgl=
u-10/igt@kms_frontbuffer_tracking@psr-2p-scndscrn-pri-shrfb-draw-mmap-wc.ht=
ml
[727] SKIP
      https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_169493v6/shard-rkl=
-8/igt@kms_frontbuffer_tracking@psr-2p-scndscrn-indfb-msflip-blt.html
[728] i915#9766
      https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9766
[729] SKIP
      https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_169493v6/shard-tgl=
u-8/igt@kms_frontbuffer_tracking@pipe-fbc-rte.html
[730] i915#17534
      https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17534
[731] SKIP
      https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_169493v6/shard-glk=
11/igt@kms_frontbuffer_tracking@pipe-fbc-rte.html
[732] SKIP
      https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_169493v6/shard-glk=
3/igt@kms_frontbuffer_tracking@hdr-rgb101010-draw-render.html
[733] SKIP
      https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_169493v6/shard-rkl=
-5/igt@kms_frontbuffer_tracking@hdr-rgb101010-draw-mmap-wc.html
[734] PASS
      https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19395/shard-rkl-1/igt=
@kms_frontbuffer_tracking@hdr-rgb101010-draw-mmap-wc.html
[735] SKIP
      https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_169493v6/shard-glk=
11/igt@kms_frontbuffer_tracking@hdr-1p-rte.html
[736] SKIP
      https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_169493v6/shard-tgl=
u-1/igt@kms_frontbuffer_tracking@hdr-1p-offscreen-pri-indfb-draw-mmap-gtt.h=
tml
[737] SKIP
      https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_169493v6/shard-dg1=
-14/igt@kms_frontbuffer_tracking@hdr-1p-offscreen-pri-indfb-draw-mmap-gtt.h=
tml
[738] i915#5439
      https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5439
[739] SKIP
      https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_169493v6/shard-dg1=
-18/igt@kms_frontbuffer_tracking@fbcpsrhdr-tiling-4.html
[740] SKIP
      https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_169493v6/shard-dg2=
-6/igt@kms_frontbuffer_tracking@fbcpsrhdr-rgb101010-draw-blt.html
[741] SKIP
      https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_169493v6/shard-mtl=
p-6/igt@kms_frontbuffer_tracking@fbcpsrhdr-2p-scndscrn-indfb-plflip-blt.htm=
l
[742] i915#17482
      https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17482
[743] SKIP
      https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_169493v6/shard-glk=
3/igt@kms_frontbuffer_tracking@fbcpsrhdr-2p-primscrn-spr-indfb-move.html
[744] SKIP
      https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_169493v6/shard-tgl=
u-1/igt@kms_frontbuffer_tracking@fbcpsrhdr-2p-primscrn-shrfb-plflip-blt.htm=
l
[745] SKIP
      https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_169493v6/shard-glk=
11/igt@kms_frontbuffer_tracking@fbcpsrhdr-1p-shrfb-fliptrack-mmap-gtt.html
[746] SKIP
      https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_169493v6/shard-tgl=
u-1/igt@kms_frontbuffer_tracking@fbcpsrhdr-1p-primscrn-cur-indfb-move.html
[747] SKIP
      https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_169493v6/shard-mtl=
p-6/igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-pri-indfb-draw-render.h=
tml
[748] SKIP
      https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_169493v6/shard-glk=
10/igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-pri-indfb-draw-blt.html
[749] SKIP
      https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_169493v6/shard-rkl=
-8/igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-cur-indfb-draw-mmap-gtt.=
html
[750] SKIP
      https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_169493v6/shard-mtl=
p-7/igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-cur-indfb-draw-mmap-gtt=
.html
[751] SKIP
      https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_169493v6/shard-rkl=
-5/igt@kms_frontbuffer_tracking@fbcpsr-1p-pri-indfb-multidraw.html
[752] SKIP
      https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_169493v6/shard-dg1=
-15/igt@kms_frontbuffer_tracking@fbcpsr-1p-offscreen-pri-shrfb-draw-mmap-wc=
.html
[753] SKIP
      https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_169493v6/shard-rkl=
-4/igt@kms_frontbuffer_tracking@fbchdr-tiling-linear.html
[754] SKIP
      https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_169493v6/shard-tgl=
u-10/igt@kms_frontbuffer_tracking@fbchdr-suspend.html
[755] SKIP
      https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_169493v6/shard-glk=
1/igt@kms_frontbuffer_tracking@fbchdr-1p-primscrn-spr-indfb-draw-blt.html
[756] PASS
      https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19395/shard-glk8/igt@=
kms_frontbuffer_tracking@fbchdr-1p-primscrn-spr-indfb-draw-blt.html
[757] SKIP
      https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_169493v6/shard-dg1=
-18/igt@kms_frontbuffer_tracking@fbchdr-1p-primscrn-shrfb-plflip-blt.html
[758] SKIP
      https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_169493v6/shard-mtl=
p-6/igt@kms_frontbuffer_tracking@fbchdr-1p-offscreen-pri-shrfb-draw-mmap-gt=
t.html
[759] SKIP
      https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_169493v6/shard-rkl=
-8/igt@kms_frontbuffer_tracking@fbc-tiling-4.html
[760] i915#10056
      https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/10056
[761] INCOMPLETE
      https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_169493v6/shard-rkl=
-3/igt@kms_frontbuffer_tracking@fbc-suspend.html
[762] PASS
      https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19395/shard-rkl-4/igt=
@kms_frontbuffer_tracking@fbc-suspend.html
[763] SKIP
      https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_169493v6/shard-dg2=
-7/igt@kms_frontbuffer_tracking@fbc-rgb565-draw-blt.html
[764] PASS
      https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19395/shard-dg2-1/igt=
@kms_frontbuffer_tracking@fbc-rgb565-draw-blt.html
[765] SKIP
      https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_169493v6/shard-dg1=
-18/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-pri-indfb-draw-pwrite.html
[766] SKIP
      https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_169493v6/shard-dg2=
-6/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-pri-indfb-draw-render.html
[767] SKIP
      https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_169493v6/shard-dg2=
-7/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-cur-indfb-draw-blt.html
[768] SKIP
      https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_169493v6/shard-dg2=
-7/igt@kms_flip_scaled_crc@flip-p010-4tile-to-p016-4tile.html
[769] PASS
      https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19395/shard-dg2-1/igt=
@kms_flip_scaled_crc@flip-p010-4tile-to-p016-4tile.html
[770] i915#17484
      https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17484
[771] SKIP
      https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_169493v6/shard-glk=
11/igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-32bpp-yftile-upscaling.html
[772] SKIP
      https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_169493v6/shard-dg2=
-7/igt@kms_flip_scaled_crc@flip-64bpp-xtile-to-32bpp-xtile-downscaling.html
[773] PASS
      https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19395/shard-dg2-1/igt=
@kms_flip_scaled_crc@flip-64bpp-xtile-to-32bpp-xtile-downscaling.html
[774] i915#17522
      https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17522
[775] SKIP
      https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_169493v6/shard-glk=
11/igt@kms_flip_scaled_crc@flip-64bpp-linear-to-32bpp-linear-upscaling.html
[776] SKIP
      https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_169493v6/shard-dg2=
-7/igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-32bpp-4tiledg2rcccs-upscalin=
g.html
[777] SKIP
      https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_169493v6/shard-dg1=
-18/igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-32bpp-4tiledg2rcccs-upscali=
ng.html
[778] SKIP
      https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_169493v6/shard-tgl=
u-2/igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-16bpp-4tile-upscaling.html
[779] SKIP
      https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_169493v6/shard-glk=
6/igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-16bpp-4tile-upscaling.html
[780] SKIP
      https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_169493v6/shard-rkl=
-8/igt@kms_flip_scaled_crc@flip-32bpp-ytileccs-to-64bpp-ytile-downscaling.h=
tml
[781] SKIP
      https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_169493v6/shard-tgl=
u-1/igt@kms_flip_scaled_crc@flip-32bpp-ytileccs-to-64bpp-ytile-downscaling.=
html
[782] SKIP
      https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_169493v6/shard-glk=
10/igt@kms_flip_scaled_crc@flip-32bpp-4tile-to-32bpp-4tiledg2rcccs-upscalin=
g.html
[783] SKIP
      https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_169493v6/shard-dg2=
-7/igt@kms_flip@flip-vs-wf_vblank-interruptible.html
[784] SKIP
      https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_169493v6/shard-dg2=
-7/igt@kms_flip@bo-too-big.html
[785] PASS
      https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19395/shard-dg2-6/igt=
@kms_flip@bo-too-big.html
[786] SKIP
      https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_169493v6/shard-rkl=
-5/igt@kms_flip@2x-plain-flip-interruptible.html
[787] i915#3637
      https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3637
[788] SKIP
      https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_169493v6/shard-tgl=
u-1/igt@kms_flip@2x-plain-flip.html
[789] SKIP
      https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_169493v6/shard-dg1=
-14/igt@kms_flip@2x-plain-flip.html
[790] SKIP
      https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_169493v6/shard-tgl=
u-10/igt@kms_flip@2x-nonexisting-fb.html
[791] INCOMPLETE
      https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_169493v6/shard-glk=
11/igt@kms_flip@2x-flip-vs-suspend@ac-hdmi-a1-hdmi-a2.html
[792] INCOMPLETE
      https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_169493v6/shard-glk=
11/igt@kms_flip@2x-flip-vs-suspend.html
[793] SKIP
      https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_169493v6/shard-dg2=
-7/igt@kms_flip@2x-flip-vs-panning-vs-hang.html
[794] i915#8381
      https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8381
[795] SKIP
      https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_169493v6/shard-dg1=
-15/igt@kms_flip@2x-flip-vs-fences-interruptible.html
[796] SKIP
      https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_169493v6/shard-tgl=
u-10/igt@kms_feature_discovery@vrr.html
[797] i915#17585
      https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17585
[798] SKIP
      https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_169493v6/shard-glk=
10/igt@kms_feature_discovery@psr2.html
[799] SKIP
      https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_169493v6/shard-mtl=
p-6/igt@kms_feature_discovery@hdr.html
[800] SKIP
      https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_169493v6/shard-dg2=
-7/igt@kms_feature_discovery@dsc.html
[801] SKIP
      https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_169493v6/shard-dg1=
-18/igt@kms_feature_discovery@dsc.html
[802] i915#16081
      https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16081
[803] SKIP
      https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_169493v6/shard-rkl=
-7/igt@kms_feature_discovery@display-3x.html
[804] SKIP
      https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_169493v6/shard-tgl=
u-1/igt@kms_feature_discovery@display-3x.html
[805] i915#9738
      https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9738
[806] SKIP
      https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_169493v6/shard-dg2=
-7/igt@kms_feature_discovery@display-1x.html
[807] PASS
      https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19395/shard-dg2-6/igt=
@kms_feature_discovery@display-1x.html
[808] i915#16084
      https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16084
[809] SKIP
      https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_169493v6/shard-rkl=
-8/igt@kms_feature_discovery@chamelium.html
[810] i915#2065
      https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2065
[811] SKIP
      https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_169493v6/shard-tgl=
u-1/igt@kms_feature_discovery@chamelium.html
[812] i915#17516
      https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17516
[813] SKIP
      https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_169493v6/shard-glk=
10/igt@kms_fbcon_fbt@psr.html
[814] i915#17458
      https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17458
[815] SKIP
      https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_169493v6/shard-glk=
3/igt@kms_dsc@dsc-with-output-formats-with-bpc.html
[816] SKIP
      https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_169493v6/shard-rkl=
-2/igt@kms_dsc@dsc-with-output-formats-bigjoiner.html
[817] SKIP
      https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_169493v6/shard-dg1=
-15/igt@kms_dsc@dsc-with-output-formats-bigjoiner.html
[818] SKIP
      https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_169493v6/shard-glk=
11/igt@kms_dsc@dsc-with-bpc-ultrajoiner.html
[819] SKIP
      https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_169493v6/shard-tgl=
u-1/igt@kms_dsc@dsc-with-bpc-bigjoiner.html
[820] SKIP
      https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_169493v6/shard-glk=
10/igt@kms_dsc@dsc-fractional-bpp-bigjoiner.html
[821] SKIP
      https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_169493v6/shard-tgl=
u-10/igt@kms_dsc@dsc-fractional-bpp.html
[822] SKIP
      https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_169493v6/shard-dg1=
-18/igt@kms_draw_crc@draw-method-mmap-gtt.html
[823] i915#13707
      https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13707
[824] SKIP
      https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_169493v6/shard-rkl=
-7/igt@kms_dp_linktrain_fallback@dsc-fallback.html
[825] SKIP
      https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_169493v6/shard-tgl=
u-1/igt@kms_dp_linktrain_fallback@dsc-fallback.html
[826] i915#17477
      https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17477
[827] SKIP
      https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_169493v6/shard-glk=
11/igt@kms_dp_link_training@uhbr-mst-tbtalt-train.html
[828] i915#17290
      https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17290
[829] SKIP
      https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_169493v6/shard-tgl=
u-10/igt@kms_dp_link_training@non-uhbr-sst-tbtalt-train.html
[830] i915#17531
      https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17531
[831] SKIP
      https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_169493v6/shard-glk=
3/igt@kms_dp_link_training@non-uhbr-sst-tbtalt-train.html
[832] i915#17506
      https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17506
[833] SKIP
      https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_169493v6/shard-glk=
6/igt@kms_dp_link_training@non-uhbr-sst-direct-train.html
[834] SKIP
      https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_169493v6/shard-tgl=
u-2/igt@kms_dp_link_training@non-uhbr-sst-direct-train.html
[835] i915#17291
      https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17291
[836] SKIP
      https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_169493v6/shard-rkl=
-4/igt@kms_dp_link_training@non-uhbr-mst-tbtalt-train.html
[837] i915#17289
      https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17289
[838] SKIP
      https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_169493v6/shard-dg1=
-18/igt@kms_dp_link_training@non-uhbr-mst.html
[839] SKIP
      https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_169493v6/shard-tgl=
u-10/igt@kms_dp_aux_dev@basic.html
[840] SKIP
      https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_169493v6/shard-rkl=
-5/igt@kms_dither@fb-8bpc-vs-panel-6bpc@pipe-a-hdmi-a-1.html
[841] i915#13691
      https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13691
[842] SKIP
      https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_169493v6/shard-rkl=
-8/igt@kms_display_modes@extended-mode-basic.html
[843] SKIP
      https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_169493v6/shard-tgl=
u-1/igt@kms_display_modes@extended-mode-basic.html
[844] i915#17515
      https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17515
[845] SKIP
      https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_169493v6/shard-glk=
10/igt@kms_dirtyfb@psr-dirtyfb-ioctl.html
[846] i915#17457
      https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17457
[847] SKIP
      https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_169493v6/shard-glk=
3/igt@kms_cursor_legacy@short-busy-flip-before-cursor-toggle.html
[848] SKIP
      https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_169493v6/shard-tgl=
u-10/igt@kms_cursor_legacy@short-busy-flip-before-cursor-toggle.html
[849] SKIP
      https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_169493v6/shard-glk=
11/igt@kms_cursor_legacy@short-busy-flip-before-cursor-atomic-transitions.h=
tml
[850] i915#15804
      https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15804
[851] FAIL
      https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_169493v6/shard-glk=
3/igt@kms_cursor_legacy@flip-vs-cursor-atomic-transitions.html
[852] PASS
      https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19395/shard-glk9/igt@=
kms_cursor_legacy@flip-vs-cursor-atomic-transitions.html
[853] SKIP
      https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_169493v6/shard-tgl=
u-1/igt@kms_cursor_legacy@cursorb-vs-flipa-varying-size.html
[854] SKIP
      https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_169493v6/shard-rkl=
-4/igt@kms_cursor_legacy@basic-busy-flip-before-cursor-legacy.html
[855] SKIP
      https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_169493v6/shard-glk=
10/igt@kms_cursor_legacy@basic-busy-flip-before-cursor-atomic.html
[856] SKIP
      https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_169493v6/shard-tgl=
u-2/igt@kms_cursor_legacy@2x-flip-vs-cursor-legacy.html
[857] i915#14152
      https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14152
[858] i915#12358
      https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12358
[859] INCOMPLETE
      https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_169493v6/shard-rkl=
-3/igt@kms_cursor_crc@cursor-suspend@pipe-a-hdmi-a-2.html
[860] INCOMPLETE
      https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_169493v6/shard-glk=
10/igt@kms_cursor_crc@cursor-suspend@pipe-a-hdmi-a-1.html
[861] i915#7882
      https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/7882
[862] INCOMPLETE
      https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_169493v6/shard-glk=
10/igt@kms_cursor_crc@cursor-suspend.html
[863] INCOMPLETE
      https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_169493v6/shard-rkl=
-3/igt@kms_cursor_crc@cursor-suspend.html
[864] PASS
      https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19395/shard-rkl-5/igt=
@kms_cursor_crc@cursor-suspend.html
[865] i915#17504
      https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17504
[866] SKIP
      https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_169493v6/shard-glk=
10/igt@kms_cursor_crc@cursor-sliding-max-size.html
[867] i915#17533
      https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17533
[868] SKIP
      https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_169493v6/shard-glk=
11/igt@kms_cursor_crc@cursor-sliding-512x170.html
[869] FAIL
      https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_169493v6/shard-rkl=
-5/igt@kms_cursor_crc@cursor-sliding-128x42@pipe-a-hdmi-a-1.html
[870] SKIP
      https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_169493v6/shard-tgl=
u-2/igt@kms_cursor_crc@cursor-rapid-movement-512x512.html
[871] SKIP
      https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_169493v6/shard-tgl=
u-10/igt@kms_cursor_crc@cursor-rapid-movement-32x10.html
[872] SKIP
      https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_169493v6/shard-glk=
3/igt@kms_cursor_crc@cursor-rapid-movement-32x10.html
[873] SKIP
      https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_169493v6/shard-rkl=
-4/igt@kms_cursor_crc@cursor-random-512x512.html
[874] SKIP
      https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_169493v6/shard-tgl=
u-1/igt@kms_cursor_crc@cursor-random-512x170.html
[875] SKIP
      https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_169493v6/shard-dg1=
-14/igt@kms_cursor_crc@cursor-random-512x170.html
[876] SKIP
      https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_169493v6/shard-glk=
3/igt@kms_cursor_crc@cursor-random-512x170.html
[877] FAIL
      https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_169493v6/shard-rkl=
-1/igt@kms_cursor_crc@cursor-random-128x42.html
[878] PASS
      https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19395/shard-rkl-7/igt=
@kms_cursor_crc@cursor-random-128x42.html
[879] DMESG-WARN
      https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_169493v6/shard-dg1=
-19/igt@kms_cursor_crc@cursor-random-128x128.html
[880] PASS
      https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19395/shard-dg1-19/ig=
t@kms_cursor_crc@cursor-random-128x128.html
[881] FAIL
      https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_169493v6/shard-tgl=
u-4/igt@kms_cursor_crc@cursor-onscreen-64x21@pipe-a-hdmi-a-1.html
[882] PASS
      https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19395/shard-tglu-2/ig=
t@kms_cursor_crc@cursor-onscreen-64x21@pipe-a-hdmi-a-1.html
[883] SKIP
      https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_169493v6/shard-rkl=
-2/igt@kms_cursor_crc@cursor-onscreen-32x32.html
[884] SKIP
      https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_169493v6/shard-dg1=
-15/igt@kms_cursor_crc@cursor-onscreen-32x32.html
[885] SKIP
      https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_169493v6/shard-glk=
11/igt@kms_cursor_crc@cursor-onscreen-32x10.html
[886] FAIL
      https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_169493v6/shard-tgl=
u-2/igt@kms_cursor_crc@cursor-onscreen-256x85.html
[887] SKIP
      https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_169493v6/shard-glk=
10/igt@kms_cursor_crc@cursor-offscreen-512x170.html
[888] SKIP
      https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_169493v6/shard-tgl=
u-1/igt@kms_cursor_crc@cursor-offscreen-32x32.html
[889] SKIP
      https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_169493v6/shard-rkl=
-4/igt@kms_content_protection@uevent.html
[890] i915#17508
      https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17508
[891] SKIP
      https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_169493v6/shard-glk=
10/igt@kms_content_protection@srm.html
[892] SKIP
      https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_169493v6/shard-glk=
6/igt@kms_content_protection@lic-type-1.html
[893] i915#17502
      https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17502
[894] SKIP
      https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_169493v6/shard-glk=
10/igt@kms_content_protection@dp-mst-type-1-suspend-resume.html
[895] SKIP
      https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_169493v6/shard-tgl=
u-10/igt@kms_content_protection@dp-mst-type-1.html
[896] SKIP
      https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_169493v6/shard-rkl=
-4/igt@kms_content_protection@dp-mst-type-0-hdcp14.html
[897] SKIP
      https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_169493v6/shard-glk=
3/igt@kms_content_protection@dp-mst-type-0.html
[898] SKIP
      https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_169493v6/shard-rkl=
-5/igt@kms_content_protection@dp-mst-lic-type-1.html
[899] SKIP
      https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_169493v6/shard-tgl=
u-8/igt@kms_content_protection@content-type-change.html
[900] SKIP
      https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_169493v6/shard-glk=
11/igt@kms_content_protection@content-type-change.html
[901] i915#16990
      https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16990
[902] SKIP
      https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_169493v6/shard-dg1=
-15/igt@kms_color_pipeline@plane-lut1d-lut1d@pipe-b-plane-4.html
[903] SKIP
      https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_169493v6/shard-rkl=
-2/igt@kms_color_pipeline@plane-lut1d-lut1d@pipe-a-plane-3.html
[904] SKIP
      https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_169493v6/shard-tgl=
u-10/igt@kms_color_pipeline@plane-lut1d-ctm3x4-lut1d@pipe-d-plane-3.html
[905] i915#17510
      https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17510
[906] SKIP
      https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_169493v6/shard-glk=
10/igt@kms_color_pipeline@plane-lut1d-ctm3x4.html
[907] SKIP
      https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_169493v6/shard-glk=
3/igt@kms_color_pipeline@plane-lut1d.html
[908] SKIP
      https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_169493v6/shard-dg2=
-7/igt@kms_color_pipeline@plane-fixed-matrix-yuv-rgb-bt709-lut1d.html
[909] SKIP
      https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_169493v6/shard-glk=
11/igt@kms_color_pipeline@plane-fixed-matrix-yuv-rgb-bt709.html
[910] SKIP
      https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_169493v6/shard-dg2=
-7/igt@kms_color_pipeline@plane-fixed-matrix-yuv-rgb-bt601.html
[911] PASS
      https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19395/shard-dg2-1/igt=
@kms_color_pipeline@plane-fixed-matrix-yuv-rgb-bt601.html
[912] SKIP
      https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_169493v6/shard-dg2=
-7/igt@kms_color@legacy-gamma-reset.html
[913] PASS
      https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19395/shard-dg2-6/igt=
@kms_color@legacy-gamma-reset.html
[914] SKIP
      https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_169493v6/shard-tgl=
u-8/igt@kms_chamelium_hpd@hdmi-hpd-after-runtime-suspend-d3hot.html
[915] i915#17483
      https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17483
[916] SKIP
      https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_169493v6/shard-glk=
3/igt@kms_chamelium_hpd@dp-hpd-with-enabled-mode.html
[917] SKIP
      https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_169493v6/shard-tgl=
u-1/igt@kms_chamelium_hpd@dp-hpd-storm-disable.html
[918] SKIP
      https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_169493v6/shard-glk=
11/igt@kms_chamelium_hpd@dp-hpd-after-runtime-suspend-d3hot.html
[919] SKIP
      https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_169493v6/shard-dg2=
-7/igt@kms_chamelium_edid@hdmi-edid-stress-resolution-non-4k.html
[920] SKIP
      https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_169493v6/shard-rkl=
-2/igt@kms_chamelium_edid@hdmi-edid-read.html
[921] SKIP
      https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_169493v6/shard-dg1=
-15/igt@kms_chamelium_edid@hdmi-edid-read.html
[922] i915#17497
      https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17497
[923] SKIP
      https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_169493v6/shard-glk=
3/igt@kms_chamelium_color_pipeline@plane-lut3d-green-only.html
[924] i915#16471
      https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16471
[925] SKIP
      https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_169493v6/shard-tgl=
u-10/igt@kms_chamelium_color_pipeline@plane-lut3d-green-only.html
[926] SKIP
      https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_169493v6/shard-dg1=
-14/igt@kms_chamelium_color_pipeline@plane-lut1d-post-ctm3x4.html
[927] SKIP
      https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_169493v6/shard-rkl=
-7/igt@kms_chamelium_color_pipeline@plane-lut1d-ctm3x4-lut1d.html
[928] SKIP
      https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_169493v6/shard-tgl=
u-1/igt@kms_chamelium_color_pipeline@plane-lut1d-ctm3x4-lut1d.html
[929] SKIP
      https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_169493v6/shard-tgl=
u-10/igt@kms_chamelium_color_pipeline@plane-fixed-matrix-yuv-rgb-bt601-lut1=
d.html
[930] SKIP
      https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_169493v6/shard-dg1=
-15/igt@kms_chamelium_color_pipeline@plane-fixed-matrix-yuv-rgb-bt601-lim.h=
tml
[931] SKIP
      https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_169493v6/shard-glk=
10/igt@kms_chamelium_color_pipeline@plane-fixed-matrix-yuv-rgb-bt2020-lut1d=
.html
[932] i915#16464
      https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16464
[933] SKIP
      https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_169493v6/shard-mtl=
p-6/igt@kms_chamelium_color_pipeline@plane-ctm3x4.html
[934] SKIP
      https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_169493v6/shard-rkl=
-5/igt@kms_chamelium_color@degamma.html
[935] i915#17489
      https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17489
[936] SKIP
      https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_169493v6/shard-glk=
11/igt@kms_chamelium_color@ctm-blue-to-red.html
[937] SKIP
      https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_169493v6/shard-dg2=
-7/igt@kms_chamelium_color@ctm-0-50.html
[938] SKIP
      https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_169493v6/shard-tgl=
u-10/igt@kms_chamelium_audio@hdmi-audio-edid.html
[939] SKIP
      https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_169493v6/shard-glk=
10/igt@kms_chamelium_audio@dp-audio-after-suspend.html
[940] i915#13781
      https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13781
[941] SKIP
      https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_169493v6/shard-dg2=
-5/igt@kms_cdclk@plane-scaling@pipe-c-hdmi-a-3.html
[942] SKIP
      https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_169493v6/shard-mtl=
p-6/igt@kms_cdclk@plane-scaling@pipe-c-edp-1.html
[943] i915#3742
      https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3742
[944] SKIP
      https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_169493v6/shard-rkl=
-8/igt@kms_cdclk@mode-transition-all-outputs.html
[945] SKIP
      https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_169493v6/shard-tgl=
u-1/igt@kms_cdclk@mode-transition-all-outputs.html
[946] i915#17491
      https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17491
[947] SKIP
      https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_169493v6/shard-glk=
5/igt@kms_ccs@random-ccs-data-y-tiled-gen12-rc-ccs@pipe-a-hdmi-a-1.html
[948] SKIP
      https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_169493v6/shard-rkl=
-7/igt@kms_ccs@random-ccs-data-4-tiled-mtl-rc-ccs@pipe-b-hdmi-a-2.html
[949] SKIP
      https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_169493v6/shard-glk=
10/igt@kms_ccs@random-ccs-data-4-tiled-mtl-mc-ccs@pipe-c-hdmi-a-1.html
[950] SKIP
      https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_169493v6/shard-rkl=
-4/igt@kms_ccs@random-ccs-data-4-tiled-bmg-ccs.html
[951] SKIP
      https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_169493v6/shard-dg2=
-4/igt@kms_ccs@crc-sprite-planes-basic-y-tiled-gen12-rc-ccs@pipe-d-hdmi-a-1=
.html
[952] SKIP
      https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_169493v6/shard-tgl=
u-10/igt@kms_ccs@crc-sprite-planes-basic-4-tiled-lnl-ccs.html
[953] SKIP
      https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_169493v6/shard-tgl=
u-1/igt@kms_ccs@crc-sprite-planes-basic-4-tiled-bmg-ccs.html
[954] SKIP
      https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_169493v6/shard-rkl=
-4/igt@kms_ccs@crc-primary-suspend-yf-tiled-ccs.html
[955] INCOMPLETE
      https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_169493v6/shard-rkl=
-4/igt@kms_ccs@crc-primary-suspend-y-tiled-gen12-rc-ccs@pipe-a-hdmi-a-2.htm=
l
[956] INCOMPLETE
      https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_169493v6/shard-rkl=
-4/igt@kms_ccs@crc-primary-suspend-y-tiled-gen12-rc-ccs.html
[957] PASS
      https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19395/shard-rkl-2/igt=
@kms_ccs@crc-primary-suspend-y-tiled-gen12-rc-ccs.html
[958] SKIP
      https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_169493v6/shard-dg2=
-5/igt@kms_ccs@crc-primary-suspend-4-tiled-mtl-rc-ccs@pipe-a-hdmi-a-3.html
[959] INCOMPLETE
      https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_169493v6/shard-mtl=
p-6/igt@kms_ccs@crc-primary-suspend-4-tiled-mtl-mc-ccs@pipe-d-edp-1.html
[960] i915#17525
      https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17525
[961] SKIP
      https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_169493v6/shard-glk=
3/igt@kms_ccs@crc-primary-suspend-4-tiled-lnl-ccs.html
[962] i915#12805
      https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12805
[963] SKIP
      https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_169493v6/shard-dg1=
-14/igt@kms_ccs@crc-primary-suspend-4-tiled-lnl-ccs.html
[964] SKIP
      https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_169493v6/shard-rkl=
-7/igt@kms_ccs@crc-primary-suspend-4-tiled-bmg-ccs.html
[965] SKIP
      https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_169493v6/shard-tgl=
u-1/igt@kms_ccs@crc-primary-suspend-4-tiled-bmg-ccs.html
[966] SKIP
      https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_169493v6/shard-glk=
11/igt@kms_ccs@crc-primary-rotation-180-y-tiled-ccs@pipe-c-hdmi-a-1.html
[967] i915#17490
      https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17490
[968] SKIP
      https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_169493v6/shard-glk=
3/igt@kms_ccs@crc-primary-rotation-180-4-tiled-mtl-rc-ccs-cc.html
[969] SKIP
      https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_169493v6/shard-dg1=
-18/igt@kms_ccs@crc-primary-rotation-180-4-tiled-mtl-mc-ccs@pipe-a-hdmi-a-4=
.html
[970] SKIP
      https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_169493v6/shard-dg2=
-8/igt@kms_ccs@crc-primary-rotation-180-4-tiled-mtl-mc-ccs@pipe-a-hdmi-a-3.=
html
[971] SKIP
      https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_169493v6/shard-glk=
10/igt@kms_ccs@crc-primary-rotation-180-4-tiled-dg2-mc-ccs@pipe-c-hdmi-a-2.=
html
[972] SKIP
      https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_169493v6/shard-dg1=
-17/igt@kms_ccs@bad-rotation-90-4-tiled-mtl-rc-ccs-cc@pipe-b-hdmi-a-4.html
[973] SKIP
      https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_169493v6/shard-glk=
11/igt@kms_ccs@bad-rotation-90-4-tiled-mtl-mc-ccs.html
[974] SKIP
      https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_169493v6/shard-rkl=
-6/igt@kms_ccs@bad-rotation-90-4-tiled-dg2-mc-ccs@pipe-c-hdmi-a-2.html
[975] SKIP
      https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_169493v6/shard-rkl=
-6/igt@kms_ccs@bad-rotation-90-4-tiled-dg2-mc-ccs@pipe-a-hdmi-a-2.html
[976] SKIP
      https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_169493v6/shard-glk=
10/igt@kms_ccs@bad-rotation-90-4-tiled-bmg-ccs.html
[977] SKIP
      https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_169493v6/shard-mtl=
p-6/igt@kms_ccs@bad-pixel-format-y-tiled-gen12-rc-ccs-cc@pipe-a-edp-1.html
[978] SKIP
      https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_169493v6/shard-dg2=
-7/igt@kms_ccs@bad-pixel-format-y-tiled-gen12-mc-ccs.html
[979] SKIP
      https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_169493v6/shard-tgl=
u-1/igt@kms_ccs@bad-pixel-format-4-tiled-mtl-rc-ccs-cc.html
[980] SKIP
      https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_169493v6/shard-tgl=
u-10/igt@kms_ccs@bad-aux-stride-y-tiled-ccs@pipe-c-hdmi-a-1.html
[981] SKIP
      https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_169493v6/shard-tgl=
u-2/igt@kms_big_fb@yf-tiled-max-hw-stride-64bpp-rotate-180.html
[982] SKIP
      https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_169493v6/shard-dg2=
-6/igt@kms_big_fb@yf-tiled-max-hw-stride-64bpp-rotate-0-async-flip.html
[983] SKIP
      https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_169493v6/shard-rkl=
-4/igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-180-async-flip.html
[984] SKIP
      https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_169493v6/shard-rkl=
-5/igt@kms_big_fb@yf-tiled-addfb-size-overflow.html
[985] SKIP
      https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_169493v6/shard-tgl=
u-1/igt@kms_big_fb@yf-tiled-addfb-size-offset-overflow.html
[986] SKIP
      https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_169493v6/shard-dg2=
-7/igt@kms_big_fb@yf-tiled-64bpp-rotate-0.html
[987] SKIP
      https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_169493v6/shard-mtl=
p-6/igt@kms_big_fb@yf-tiled-32bpp-rotate-270.html
[988] SKIP
      https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_169493v6/shard-dg1=
-14/igt@kms_big_fb@yf-tiled-16bpp-rotate-180.html
[989] i915#17500
      https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17500
[990] SKIP
      https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_169493v6/shard-glk=
3/igt@kms_big_fb@y-tiled-16bpp-rotate-90.html
[991] SKIP
      https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_169493v6/shard-glk=
11/igt@kms_big_fb@x-tiled-max-hw-stride-64bpp-rotate-180-hflip-async-flip.h=
tml
[992] SKIP
      https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_169493v6/shard-glk=
10/igt@kms_big_fb@x-tiled-max-hw-stride-32bpp-rotate-180-hflip-async-flip.h=
tml
[993] SKIP
      https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_169493v6/shard-dg1=
-15/igt@kms_big_fb@linear-8bpp-rotate-270.html
[994] SKIP
      https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_169493v6/shard-rkl=
-8/igt@kms_big_fb@linear-32bpp-rotate-90.html
[995] SKIP
      https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_169493v6/shard-tgl=
u-1/igt@kms_big_fb@linear-32bpp-rotate-90.html
[996] SKIP
      https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_169493v6/shard-tgl=
u-8/igt@kms_big_fb@linear-16bpp-rotate-90.html
[997] SKIP
      https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_169493v6/shard-dg2=
-7/igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-0-hflip.html
[998] PASS
      https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19395/shard-dg2-5/igt=
@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-0-hflip.html
[999] i915#17478
      https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17478
[1000] SKIP
       https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_169493v6/shard-gl=
k3/igt@kms_big_fb@4-tiled-max-hw-stride-32bpp-rotate-180-hflip-async-flip.h=
tml
[1001] SKIP
       https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_169493v6/shard-tg=
lu-10/igt@kms_big_fb@4-tiled-max-hw-stride-32bpp-rotate-180-async-flip.html
[1002] SKIP
       https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_169493v6/shard-rk=
l-4/igt@kms_big_fb@4-tiled-addfb-size-overflow.html
[1003] SKIP
       https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_169493v6/shard-tg=
lu-1/igt@kms_big_fb@4-tiled-addfb.html
[1004] SKIP
       https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_169493v6/shard-dg=
1-14/igt@kms_big_fb@4-tiled-addfb.html
[1005] i915#17556
       https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17556
[1006] SKIP
       https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_169493v6/shard-gl=
k3/igt@kms_big_fb@4-tiled-addfb.html
[1007] SKIP
       https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_169493v6/shard-gl=
k10/igt@kms_big_fb@4-tiled-8bpp-rotate-180.html
[1008] SKIP
       https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_169493v6/shard-tg=
lu-1/igt@kms_big_fb@4-tiled-32bpp-rotate-180.html
[1009] SKIP
       https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_169493v6/shard-gl=
k11/igt@kms_big_fb@4-tiled-32bpp-rotate-0.html
[1010] SKIP
       https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_169493v6/shard-rk=
l-2/igt@kms_big_fb@4-tiled-16bpp-rotate-0.html
[1011] SKIP
       https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_169493v6/shard-dg=
1-15/igt@kms_big_fb@4-tiled-16bpp-rotate-0.html
[1012] i915#1769
       https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/1769
[1013] SKIP
       https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_169493v6/shard-dg=
1-18/igt@kms_atomic_transition@plane-all-modeset-transition-internal-panels=
.html
[1014] i915#17562
       https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17562
[1015] SKIP
       https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_169493v6/shard-gl=
k10/igt@kms_async_flips@async-flip-with-page-flip-events-linear-atomic.html
[1016] i915#4212
       https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4212
[1017] SKIP
       https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_169493v6/shard-dg=
1-14/igt@kms_addfb_basic@basic-x-tiled-legacy.html
[1018] i915#11680
       https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11680
[1019] SKIP
       https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_169493v6/shard-gl=
k6/igt@intel_hwmon@hwmon-write.html
[1020] SKIP
       https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_169493v6/shard-tg=
lu-2/igt@intel_hwmon@hwmon-write.html
[1021] i915#7443
       https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/7443
[1022] i915#4817
       https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4817
[1023] INCOMPLETE
       https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_169493v6/shard-tg=
lu-8/igt@i915_suspend@basic-s3-without-i915.html
[1024] i915#16182
       https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16182
[1025] INCOMPLETE
       https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_169493v6/shard-gl=
k11/igt@i915_suspend@basic-s3-without-i915.html
[1026] DMESG-WARN
       https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_169493v6/shard-dg=
1-19/igt@i915_suspend@basic-s2idle-without-i915.html
[1027] PASS
       https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19395/shard-dg1-19/i=
gt@i915_suspend@basic-s2idle-without-i915.html
[1028] i915#17076
       https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17076
[1029] ABORT
       https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_169493v6/shard-tg=
lu-3/igt@i915_selftest@mock.html
[1030] PASS
       https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19395/shard-tglu-8/i=
gt@i915_selftest@mock.html
[1031] i915#5723
       https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5723
[1032] SKIP
       https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_169493v6/shard-rk=
l-8/igt@i915_query@test-query-geometry-subslices.html
[1033] i915#16079
       https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16079
[1034] SKIP
       https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_169493v6/shard-dg=
1-15/igt@i915_query@query-topology-unsupported.html
[1035] i915#17584
       https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17584
[1036] SKIP
       https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_169493v6/shard-gl=
k10/igt@i915_query@hwconfig_table.html
[1037] i915#7984
       https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/7984
[1038] SKIP
       https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_169493v6/shard-rk=
l-8/igt@i915_power@sanity.html
[1039] i915#4387
       https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4387
[1040] SKIP
       https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_169493v6/shard-rk=
l-4/igt@i915_pm_sseu@full-enable.html
[1041] i915#6621
       https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6621
[1042] i915#11681
       https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11681
[1043] SKIP
       https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_169493v6/shard-dg=
1-14/igt@i915_pm_rps@min-max-config-loaded.html
[1044] i915#15172
       https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15172
[1045] INCOMPLETE
       https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_169493v6/shard-gl=
k6/igt@i915_pm_rpm@system-suspend-execbuf.html
[1046] INCOMPLETE
       https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_169493v6/shard-rk=
l-3/igt@i915_pm_rpm@system-suspend.html
[1047] PASS
       https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19395/shard-rkl-5/ig=
t@i915_pm_rpm@system-suspend.html
[1048] i915#2681
       https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2681
[1049] i915#13790
       https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13790
[1050] WARN
       https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_169493v6/shard-tg=
lu-1/igt@i915_pm_rc6_residency@rc6-fence.html
[1051] SKIP
       https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_169493v6/shard-tg=
lu-10/igt@i915_pm_rc6_residency@media-rc6-accuracy.html
[1052] i915#13820
       https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13820
[1053] INCOMPLETE
       https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_169493v6/shard-dg=
2-7/igt@i915_pm_freq_api@freq-suspend@gt0.html
[1054] PASS
       https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19395/shard-dg2-8/ig=
t@i915_pm_freq_api@freq-suspend@gt0.html
[1055] i915#17526
       https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17526
[1056] SKIP
       https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_169493v6/shard-gl=
k3/igt@i915_pm_freq_api@freq-basic-api.html
[1057] i915#8399
       https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8399
[1058] SKIP
       https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_169493v6/shard-tg=
lu-1/igt@i915_pm_freq_api@freq-basic-api.html
[1059] SKIP
       https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_169493v6/shard-tg=
lu-10/igt@i915_module_load@resize-bar.html
[1060] i915#17566
       https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17566
[1061] SKIP
       https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_169493v6/shard-gl=
k10/igt@i915_module_load@resize-bar.html
[1062] i915#14118
       https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14118
[1063] SKIP
       https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_169493v6/shard-dg=
1-15/igt@i915_drm_fdinfo@virtual-busy-hang-all.html
[1064] i915#14073
       https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14073
[1065] SKIP
       https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_169493v6/shard-dg=
1-15/igt@i915_drm_fdinfo@busy@rcs0.html
[1066] i915#14123
       https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14123
[1067] SKIP
       https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_169493v6/shard-dg=
1-18/igt@i915_drm_fdinfo@all-busy-idle-check-all.html
[1068] SKIP
       https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_169493v6/shard-rk=
l-4/igt@gen9_exec_parse@unaligned-jump.html
[1069] i915#2856
       https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2856
[1070] SKIP
       https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_169493v6/shard-mt=
lp-7/igt@gen9_exec_parse@batch-zero-length.html
[1071] SKIP
       https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_169493v6/shard-tg=
lu-10/igt@gen9_exec_parse@basic-rejected-ctx-param.html
[1072] SKIP
       https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_169493v6/shard-tg=
lu-1/igt@gen9_exec_parse@basic-rejected.html
[1073] i915#17505
       https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17505
[1074] SKIP
       https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_169493v6/shard-gl=
k11/igt@gen7_exec_parse@load-register-reg.html
[1075] SKIP
       https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_169493v6/shard-mt=
lp-6/igt@gen7_exec_parse@cmd-crossing-page.html
[1076] SKIP
       https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_169493v6/shard-dg=
2-7/igt@gen7_exec_parse@bitmasks.html
[1077] SKIP
       https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_169493v6/shard-rk=
l-2/igt@gen7_exec_parse@basic-rejected.html
[1078] SKIP
       https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_169493v6/shard-dg=
1-15/igt@gen7_exec_parse@basic-rejected.html
[1079] SKIP
       https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_169493v6/shard-gl=
k3/igt@gen7_exec_parse@basic-offset.html
[1080] i915#17578
       https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17578
[1081] SKIP
       https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_169493v6/shard-gl=
k10/igt@gen3_render_tiledy_blits.html
[1082] i915#17532
       https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17532
[1083] SKIP
       https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_169493v6/shard-gl=
k3/igt@gen3_render_mixed_blits.html
[1084] i915#17555
       https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17555
[1085] SKIP
       https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_169493v6/shard-gl=
k3/igt@gen3_render_linear_blits.html
[1086] INCOMPLETE
       https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_169493v6/shard-rk=
l-3/igt@gem_workarounds@suspend-resume.html
[1087] i915#17507
       https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17507
[1088] SKIP
       https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_169493v6/shard-gl=
k11/igt@gem_userptr_blits@unsync-unmap-cycles.html
[1089] SKIP
       https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_169493v6/shard-mt=
lp-6/igt@gem_userptr_blits@unsync-unmap-after-close.html
[1090] SKIP
       https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_169493v6/shard-rk=
l-8/igt@gem_userptr_blits@relocations.html
[1091] SKIP
       https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_169493v6/shard-tg=
lu-1/igt@gem_userptr_blits@readonly-pwrite-unsync.html
[1092] i915#4880
       https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4880
[1093] SKIP
       https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_169493v6/shard-dg=
2-7/igt@gem_userptr_blits@map-fixed-invalidate-busy.html
[1094] SKIP
       https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_169493v6/shard-dg=
1-18/igt@gem_userptr_blits@map-fixed-invalidate-busy.html
[1095] SKIP
       https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_169493v6/shard-tg=
lu-2/igt@gem_userptr_blits@dmabuf-unsync.html
[1096] SKIP
       https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_169493v6/shard-gl=
k6/igt@gem_userptr_blits@dmabuf-unsync.html
[1097] i915#3323
       https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3323
[1098] SKIP
       https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_169493v6/shard-rk=
l-8/igt@gem_userptr_blits@dmabuf-sync.html
[1099] SKIP
       https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_169493v6/shard-tg=
lu-1/igt@gem_userptr_blits@dmabuf-sync.html
[1100] i915#15656
       https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15656
[1101] SKIP
       https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_169493v6/shard-rk=
l-4/igt@gem_tiled_pread_basic@basic.html
[1102] i915#4077
       https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4077
[1103] SKIP
       https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_169493v6/shard-mt=
lp-2/igt@gem_tiled_partial_pwrite_pread@writes-after-reads.html
[1104] SKIP
       https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_169493v6/shard-dg=
2-7/igt@gem_tiled_blits@basic.html
[1105] i915#16193
       https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16193
[1106] i915#13809
       https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13809
[1107] INCOMPLETE
       https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_169493v6/shard-gl=
k8/igt@gem_softpin@noreloc-s3.html
[1108] PASS
       https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19395/shard-glk1/igt=
@gem_softpin@noreloc-s3.html
[1109] i915#16226
       https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16226
[1110] INCOMPLETE
       https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_169493v6/shard-rk=
l-6/igt@gem_softpin@noreloc-s3.html
[1111] PASS
       https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19395/shard-rkl-3/ig=
t@gem_softpin@noreloc-s3.html
[1112] i915#17551
       https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17551
[1113] SKIP
       https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_169493v6/shard-gl=
k5/igt@gem_softpin@evict-snoop-interruptible.html
[1114] i915#17430
       https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17430
[1115] SKIP
       https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_169493v6/shard-rk=
l-4/igt@gem_softpin@evict-snoop.html
[1116] i915#4079
       https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4079
[1117] SKIP
       https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_169493v6/shard-dg=
1-14/igt@gem_set_tiling_vs_blt@untiled-to-tiled.html
[1118] i915#17492
       https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17492
[1119] SKIP
       https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_169493v6/shard-gl=
k11/igt@gem_render_copy@yf-tiled-to-vebox-y-tiled.html
[1120] SKIP
       https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_169493v6/shard-gl=
k3/igt@gem_render_copy@yf-tiled-to-vebox-linear.html
[1121] SKIP
       https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_169493v6/shard-gl=
k10/igt@gem_render_copy@linear-to-vebox-yf-tiled.html
[1122] i915#8428
       https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8428
[1123] SKIP
       https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_169493v6/shard-dg=
2-7/igt@gem_render_copy@linear-to-vebox-y-tiled.html
[1124] i915#17521
       https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17521
[1125] SKIP
       https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_169493v6/shard-gl=
k10/igt@gem_pxp@verify-pxp-stale-buf-execution.html
[1126] SKIP
       https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_169493v6/shard-gl=
k3/igt@gem_pxp@reject-modify-context-protection-off-3.html
[1127] i915#4270
       https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4270
[1128] SKIP
       https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_169493v6/shard-dg=
1-14/igt@gem_pxp@reject-modify-context-protection-off-3.html
[1129] SKIP
       https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_169493v6/shard-gl=
k11/igt@gem_pxp@protected-raw-src-copy-not-readible.html
[1130] SKIP
       https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_169493v6/shard-rk=
l-8/igt@gem_partial_pwrite_pread@writes-after-reads-uncached.html
[1131] SKIP
       https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_169493v6/shard-dg=
2-7/igt@gem_partial_pwrite_pread@writes-after-reads-snoop.html
[1132] SKIP
       https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_169493v6/shard-dg=
1-14/igt@gem_partial_pwrite_pread@writes-after-reads-display.html
[1133] SKIP
       https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_169493v6/shard-mt=
lp-7/igt@gem_partial_pwrite_pread@reads.html
[1134] i915#4083
       https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4083
[1135] SKIP
       https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_169493v6/shard-dg=
2-7/igt@gem_mmap_wc@coherency.html
[1136] SKIP
       https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_169493v6/shard-dg=
1-14/igt@gem_mmap_wc@bad-object.html
[1137] SKIP
       https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_169493v6/shard-dg=
1-15/igt@gem_mmap_gtt@flink-race.html
[1138] i915#17429
       https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17429
[1139] SKIP
       https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_169493v6/shard-rk=
l-8/igt@gem_mmap_gtt@coherency.html
[1140] SKIP
       https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_169493v6/shard-tg=
lu-1/igt@gem_mmap_gtt@coherency.html
[1141] SKIP
       https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_169493v6/shard-mt=
lp-6/igt@gem_mmap@bad-object.html
[1142] i915#17543
       https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17543
[1143] SKIP
       https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_169493v6/shard-gl=
k11/igt@gem_media_vme.html
[1144] SKIP
       https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_169493v6/shard-tg=
lu-10/igt@gem_lmem_swapping@verify-random-ccs.html
[1145] SKIP
       https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_169493v6/shard-rk=
l-5/igt@gem_lmem_swapping@random-engines.html
[1146] i915#12193
       https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12193
[1147] SKIP
       https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_169493v6/shard-dg=
1-18/igt@gem_lmem_swapping@parallel-random-verify-ccs.html
[1148] SKIP
       https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_169493v6/shard-mt=
lp-6/igt@gem_lmem_swapping@parallel-random.html
[1149] i915#17503
       https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17503
[1150] SKIP
       https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_169493v6/shard-gl=
k6/igt@gem_lmem_swapping@massive-random.html
[1151] i915#4565
       https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4565
[1152] SKIP
       https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_169493v6/shard-dg=
1-14/igt@gem_lmem_swapping@heavy-verify-random-ccs@lmem0.html
[1153] SKIP
       https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_169493v6/shard-tg=
lu-1/igt@gem_lmem_swapping@heavy-verify-random-ccs.html
[1154] SKIP
       https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_169493v6/shard-gl=
k10/igt@gem_lmem_swapping@heavy-multi.html
[1155] SKIP
       https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_169493v6/shard-gl=
k11/igt@gem_lmem_swapping@basic.html
[1156] i915#4860
       https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4860
[1157] SKIP
       https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_169493v6/shard-dg=
1-15/igt@gem_fence_thrash@bo-write-verify-none.html
[1158] INCOMPLETE
       https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_169493v6/shard-dg=
2-3/igt@gem_exec_suspend@basic-s0.html
[1159] PASS
       https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19395/shard-dg2-4/ig=
t@gem_exec_suspend@basic-s0.html
[1160] i915#4812
       https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4812
[1161] i915#4537
       https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4537
[1162] SKIP
       https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_169493v6/shard-dg=
2-6/igt@gem_exec_schedule@preempt-queue-chain.html
[1163] SKIP
       https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_169493v6/shard-dg=
1-18/igt@gem_exec_reloc@basic-write-read.html
[1164] SKIP
       https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_169493v6/shard-rk=
l-8/igt@gem_exec_reloc@basic-gtt-wc-active.html
[1165] SKIP
       https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_169493v6/shard-dg=
2-6/igt@gem_exec_reloc@basic-cpu-wc.html
[1166] i915#17565
       https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17565
[1167] SKIP
       https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_169493v6/shard-gl=
k10/igt@gem_exec_params@rsvd2-dirt.html
[1168] SKIP
       https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_169493v6/shard-tg=
lu-10/igt@gem_exec_params@rsvd2-dirt.html
[1169] i915#16871
       https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16871
[1170] SKIP
       https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_169493v6/shard-gl=
k3/igt@gem_exec_params@larger-than-life-batch.html
[1171] i915#4852
       https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4852
[1172] i915#3539
       https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3539
[1173] SKIP
       https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_169493v6/shard-dg=
1-18/igt@gem_exec_flush@basic-batch-kernel-default-wb.html
[1174] SKIP
       https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_169493v6/shard-dg=
2-7/igt@gem_exec_flush@basic-batch-kernel-default-wb.html
[1175] i915#3711
       https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3711
[1176] SKIP
       https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_169493v6/shard-rk=
l-4/igt@gem_exec_flush@basic-batch-kernel-default-cmd.html
[1177] i915#6334
       https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6334
[1178] SKIP
       https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_169493v6/shard-rk=
l-5/igt@gem_exec_capture@capture-invisible@smem0.html
[1179] i915#4525
       https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4525
[1180] SKIP
       https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_169493v6/shard-tg=
lu-2/igt@gem_exec_balancer@parallel-ordering.html
[1181] SKIP
       https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_169493v6/shard-tg=
lu-1/igt@gem_exec_balancer@parallel-keep-submit-fence.html
[1182] SKIP
       https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_169493v6/shard-rk=
l-4/igt@gem_exec_balancer@parallel.html
[1183] i915#17547
       https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17547
[1184] SKIP
       https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_169493v6/shard-gl=
k10/igt@gem_exec_balancer@fairslice.html
[1185] i915#4771
       https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4771
[1186] SKIP
       https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_169493v6/shard-dg=
2-7/igt@gem_exec_balancer@bonded-dual.html
[1187] SKIP
       https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_169493v6/shard-dg=
1-18/igt@gem_exec_balancer@bonded-dual.html
[1188] i915#7975
       https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/7975
[1189] ABORT
       https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_169493v6/shard-rk=
l-1/igt@gem_eio@hibernate.html
[1190] PASS
       https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19395/shard-rkl-7/ig=
t@gem_eio@hibernate.html
[1191] SKIP
       https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_169493v6/shard-rk=
l-5/igt@gem_ctx_sseu@mmap-args.html
[1192] SKIP
       https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_169493v6/shard-mt=
lp-6/igt@gem_ctx_sseu@invalid-sseu.html
[1193] i915#17496
       https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17496
[1194] SKIP
       https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_169493v6/shard-gl=
k10/igt@gem_ctx_sseu@invalid-args.html
[1195] i915#17527
       https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17527
[1196] SKIP
       https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_169493v6/shard-gl=
k5/igt@gem_ctx_persistence@legacy-engines-hang@blt.html
[1197] i915#8555
       https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8555
[1198] SKIP
       https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_169493v6/shard-dg=
1-15/igt@gem_ctx_persistence@heartbeat-hang.html
[1199] i915#17444
       https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17444
[1200] SKIP
       https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_169493v6/shard-tg=
lu-8/igt@gem_ctx_param@set-priority-not-supported.html
[1201] i915#17535
       https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17535
[1202] SKIP
       https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_169493v6/shard-gl=
k11/igt@gem_ctx_param@set-priority-not-supported.html
[1203] i915#17530
       https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17530
[1204] SKIP
       https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_169493v6/shard-gl=
k3/igt@gem_create@create-ext-set-pat.html
[1205] i915#8562
       https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8562
[1206] SKIP
       https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_169493v6/shard-tg=
lu-10/igt@gem_create@create-ext-set-pat.html
[1207] SKIP
       https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_169493v6/shard-tg=
lu-10/igt@gem_create@create-ext-cpu-access-sanity-check.html
[1208] i915#17552
       https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17552
[1209] SKIP
       https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_169493v6/shard-gl=
k5/igt@gem_compute@compute-square.html
[1210] SKIP
       https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_169493v6/shard-tg=
lu-10/igt@gem_close_race@multigpu-basic-process.html
[1211] i915#17568
       https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17568
[1212] SKIP
       https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_169493v6/shard-gl=
k10/igt@gem_close_race@multigpu-basic-process.html
[1213] SKIP
       https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_169493v6/shard-dg=
1-18/igt@gem_ccs@suspend-resume.html
[1214] SKIP
       https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_169493v6/shard-tg=
lu-10/igt@gem_ccs@ctrl-surf-copy.html
[1215] i915#17499
       https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17499
[1216] SKIP
       https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_169493v6/shard-gl=
k11/igt@gem_ccs@block-multicopy-inplace.html
[1217] SKIP
       https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_169493v6/shard-rk=
l-4/igt@gem_ccs@block-multicopy-compressed.html
[1218] SKIP
       https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_169493v6/shard-rk=
l-5/igt@gem_ccs@block-copy-compressed.html
[1219] i915#4873
       https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4873
[1220] SKIP
       https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_169493v6/shard-mt=
lp-6/igt@gem_caching@writes.html
[1221] i915#2582
       https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2582
[1222] SKIP
       https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_169493v6/shard-dg=
2-7/igt@fbdev@eof.html
[1223] SKIP
       https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_169493v6/shard-dg=
2-7/igt@drm_read@fault-buffer.html
[1224] PASS
       https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19395/shard-dg2-1/ig=
t@drm_read@fault-buffer.html
[1225] i915#11078
       https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11078
[1226] SKIP
       https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_169493v6/shard-rk=
l-7/igt@device_reset@unbind-cold-reset-rebind.html
[1227] SKIP
       https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_169493v6/shard-tg=
lu-1/igt@device_reset@unbind-cold-reset-rebind.html
[1228] SKIP
       https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_169493v6/shard-tg=
lu-8/igt@device_reset@cold-reset-bound.html
[1229] i915#17537
       https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17537
[1230] SKIP
       https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_169493v6/shard-gl=
k11/igt@device_reset@cold-reset-bound.html
[1231] i915#8411
       https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8411
[1232] SKIP
       https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_169493v6/shard-dg=
1-14/igt@api_intel_bb@object-reloc-purge-cache.html
[1233] SKIP
       https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_169493v6/shard-rk=
l-4/igt@api_intel_bb@blit-reloc-purge-cache.html
[1234] FAIL
       https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_169493v6/shard-mt=
lp-5/igt@perf_pmu@gt-awake.html
[1235] PASS
       https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19395/shard-mtlp-5/i=
gt@perf_pmu@gt-awake.html
[1236] SKIP
       https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_169493v6/shard-gl=
k1/igt@kms_frontbuffer_tracking@fbchdr-2p-primscrn-pri-indfb-draw-mmap-gtt.=
html
[1237] PASS
       https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19395/shard-glk8/igt=
@kms_frontbuffer_tracking@fbchdr-2p-primscrn-pri-indfb-draw-mmap-gtt.html

--=-CIECiLhEH69+RfAN0zLG
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
<body><div>Hi,</div><div><br></div><div>The i915.CI.Full run for my series =
"drm/i915/display: reduce clock_gating interface between core and display" =
(rev6) reported some</div><div>possible regressions:</div><div><br></div><d=
iv>  <a href=3D"https://patchwork.freedesktop.org/series/169493/">https://p=
atchwork.freedesktop.org/series/169493/</a></div><div>  <a href=3D"https://=
intel-gfx-ci.01.org/tree/drm-tip/Patchwork_169493v6/index.html">https://int=
el-gfx-ci.01.org/tree/drm-tip/Patchwork_169493v6/index.html</a></div><div><=
br></div><div>I don't think they're related to my changes.  Rev6 is only a =
rebase of rev5, which passed i915.CI.Full:</div><div><br></div><div>  <a hr=
ef=3D"https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_169493v5/index.htm=
l">https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_169493v5/index.html</=
a></div><div><br></div><div>1. <a href=3D"mailto:igt@kms">igt@kms</a><a hre=
f=3D"mailto:_frontbuffer_tracking@fbchdr-2p-primscrn-pri-indfb-draw-mmap-gt=
t">_frontbuffer_tracking@fbchdr-2p-primscrn-pri-indfb-draw-mmap-gtt</a>&nbs=
p;(shard-glk, PASS -&gt; SKIP, +2 other tests skip)</div><div><br></div><di=
v>   <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_169493v6=
/shard-glk1/igt@kms_frontbuffer_tracking@fbchdr-2p-primscrn-pri-indfb-draw-=
mmap-gtt.html">https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_169493v6/=
shard-glk1/igt@kms_frontbuffer_tracking@fbchdr-2p-primscrn-pri-indfb-draw-m=
map-gtt.html</a></div><div><br></div><div>   The test skips on "Test requir=
ement: hdr.can_test", so no HDR-capable output was found.  The base run was=
 on glk8 and this one on glk1.  The same report already files other fbchdr =
subtests with the same PASS -&gt; SKIP on GLK under i915#17517, e.g.:</div>=
<div><br></div><div>   <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/=
Patchwork_169493v6/shard-glk1/igt@kms_frontbuffer_tracking@fbchdr-1p-primsc=
rn-spr-indfb-draw-blt.html">https://intel-gfx-ci.01.org/tree/drm-tip/Patchw=
ork_169493v6/shard-glk1/igt@kms_frontbuffer_tracking@fbchdr-1p-primscrn-spr=
-indfb-draw-blt.html</a></div><div><br></div><div>   It also shows up on GL=
K for other series, for example:</div><div><br></div><div>   <a href=3D"htt=
ps://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_176740v1/shard-glk4/igt@kms=
_frontbuffer_tracking@fbchdr-2p-primscrn-shrfb-plflip-blt.html">https://int=
el-gfx-ci.01.org/tree/drm-tip/Patchwork_176740v1/shard-glk4/igt@kms_frontbu=
ffer_tracking@fbchdr-2p-primscrn-shrfb-plflip-blt.html</a></div><div>   <a =
href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_164957v9/shard-g=
lk5/igt@kms_frontbuffer_tracking@fbchdr-2p-scndscrn-pri-indfb-draw-pwrite.h=
tml">https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_164957v9/shard-glk5=
/igt@kms_frontbuffer_tracking@fbchdr-2p-scndscrn-pri-indfb-draw-pwrite.html=
</a></div><div><br></div><div>   It looks like the i915#17517 filter should=
 also cover these subtests.</div><div><br></div><div>2. <a href=3D"mailto:i=
gt@perf">igt@perf</a><a href=3D"mailto:_pmu@gt-awake">_pmu@gt-awake</a> (sh=
ard-mtlp, PASS -&gt; FAIL)</div><div><br></div><div>   <a href=3D"https://i=
ntel-gfx-ci.01.org/tree/drm-tip/Patchwork_169493v6/shard-mtlp-5/igt@perf_pm=
u@gt-awake.html">https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_169493v=
6/shard-mtlp-5/igt@perf_pmu@gt-awake.html</a></div><div><br></div><div>   T=
his is a timing assertion: "'val' !=3D 'slept' (500395461.000000 not within=
 +5.0%/-5.0% tolerance of 545836000.000000)", with no kernel warnings.  The=
 series doesn't change anything for MTL: the display clock gating code it m=
oves only covers platforms up to GLK, and MTL's core clock gating is unchan=
ged.  So this looks like a sporadic failure.</div><div><br></div><div>Could=
 you please update the filters and re-report the results for the series?</d=
iv><div><br></div><div>Analysis assisted by Claude Opus 5.5.</div><div><br>=
</div><div>Thanks!</div><div><br></div><div>--</div><div>Cheers,</div><div>=
Luca.</div><div><br></div><div><br></div><div>On Mon, 2026-10-26 at 18:05 +=
0000, Patchwork wrote:</div><blockquote type=3D"cite" style=3D"margin:0 0 0=
 .8ex; border-left:2px #729fcf solid;padding-left:1ex"><div><b>Patch Detail=
s</b></div>
<div><table>
<tbody><tr><td><b>Series:</b></td><td>drm/i915/display: reduce clock_gating=
 interface between core and display (rev6)</td></tr>
<tr><td><b>URL:</b></td><td><a href=3D"https://patchwork.freedesktop.org/se=
ries/169493/">https://patchwork.freedesktop.org/series/169493/</a></td></tr=
>
<tr><td><b>State:</b></td><td>failure</td></tr> <tr><td><b>Details:</b></td=
><td><a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_169493v6=
/index.html">https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_169493v6/in=
dex.html</a></td></tr></tbody></table> </div><h1>CI Bug Log - changes from =
CI_DRM_19395_full -&gt; Patchwork_169493v6_full</h1><h2>Summary</h2><p><str=
ong>FAILURE</strong></p><p>Serious unknown changes coming with Patchwork_16=
9493v6_full absolutely need to be<br> verified manually.</p><p>If you think=
 the reported changes have nothing to do with the changes<br> introduced in=
 Patchwork_169493v6_full, please notify your bug team (I915-ci-infra@lists.=
freedesktop.org) to allow them<br> to document this new failure mode, which=
 will reduce false positives in CI.</p><h2>Participating hosts (10 -&gt; 10=
)</h2><p>No changes in participating hosts</p><h2>Possible new issues</h2><=
p>Here are the unknown changes that may have been introduced in Patchwork_1=
69493v6_full:</p><h3>IGT changes</h3><h4>Possible regressions</h4><ul>
<li>
<p>igt@kms_frontbuffer_tracking@fbchdr-2p-primscrn-pri-indfb-draw-mmap-gtt:=
</p><ul>
<li>shard-glk:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_19395/shard-glk8/igt@kms_frontbuffer_tracking@fbchdr-2p-primscrn-pr=
i-indfb-draw-mmap-gtt.html">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.=
01.org/tree/drm-tip/Patchwork_169493v6/shard-glk1/igt@kms_frontbuffer_track=
ing@fbchdr-2p-primscrn-pri-indfb-draw-mmap-gtt.html">SKIP</a> +2 other test=
s skip</li>
</ul></li>
<li>
<p>igt@perf_pmu@gt-awake:</p><ul>
<li>shard-mtlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_19395/shard-mtlp-5/igt@perf_pmu@gt-awake.html">PASS</a> -&gt; <a hr=
ef=3D"https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_169493v6/shard-mtl=
p-5/igt@perf_pmu@gt-awake.html">FAIL</a></li>
</ul></li>
</ul><h2>New tests</h2><p>New tests have been introduced between CI_DRM_193=
95_full and Patchwork_169493v6_full:</p><h3>New IGT tests (4)</h3><ul>
<li>
<p>igt@kms_cursor_crc@cursor-offscreen-256x85@pipe-c-hdmi-a-2:</p><ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [2.63] s</li>
</ul></li>
<li>
<p>igt@kms_cursor_crc@cursor-random-256x256@pipe-c-hdmi-a-2:</p><ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [4.10] s</li>
</ul></li>
<li>
<p>igt@kms_cursor_crc@cursor-random-256x85@pipe-c-hdmi-a-2:</p><ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [4.10] s</li>
</ul></li>
<li>
<p>igt@kms_cursor_crc@cursor-rapid-movement-256x256@pipe-c-hdmi-a-2:</p><ul=
>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.31] s</li>
</ul></li>
</ul><h2>Known issues</h2><p>Here are the changes found in Patchwork_169493=
v6_full that come from known issues:</p><h3>IGT changes</h3><h4>Issues hit<=
/h4><ul>
<li>
<p>igt@api_intel_bb@blit-reloc-purge-cache:</p><ul>
<li>shard-rkl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/Patchwork_169493v6/shard-rkl-4/igt@api_intel_bb@blit-reloc-pu=
rge-cache.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i91=
5/kernel/-/issues/8411">i915#8411</a>) +2 other tests skip</li>
</ul></li>
<li>
<p>igt@api_intel_bb@object-reloc-purge-cache:</p><ul>
<li>shard-dg1:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/Patchwork_169493v6/shard-dg1-14/igt@api_intel_bb@object-reloc=
-purge-cache.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/=
i915/kernel/-/issues/8411">i915#8411</a>)</li>
</ul></li>
<li>
<p>igt@device_reset@cold-reset-bound:</p><ul>
<li>shard-tglu:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/Patchwork_169493v6/shard-tglu-8/igt@device_reset@cold-reset-b=
ound.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/ker=
nel/-/issues/11078">i915#11078</a>)</li>
<li>shard-glk11:        NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/Patchwork_169493v6/shard-glk11/igt@device_reset@cold-reset-bo=
und.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kern=
el/-/issues/17537">i915#17537</a>)</li>
</ul></li>
<li>
<p>igt@device_reset@unbind-cold-reset-rebind:</p><ul>
<li>shard-rkl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/Patchwork_169493v6/shard-rkl-7/igt@device_reset@unbind-cold-r=
eset-rebind.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i=
915/kernel/-/issues/11078">i915#11078</a>)</li>
<li>shard-tglu-1:       NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/Patchwork_169493v6/shard-tglu-1/igt@device_reset@unbind-cold-=
reset-rebind.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/=
i915/kernel/-/issues/11078">i915#11078</a>)</li>
</ul></li>
<li>
<p>igt@drm_read@fault-buffer:</p><ul>
<li>shard-dg2:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_19395/shard-dg2-1/igt@drm_read@fault-buffer.html">PASS</a> -&gt; <a=
 href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_169493v6/shard-=
dg2-7/igt@drm_read@fault-buffer.html">SKIP</a> (<a href=3D"https://gitlab.f=
reedesktop.org/drm/i915/kernel/-/issues/17359">i915#17359</a>)</li>
</ul></li>
<li>
<p>igt@fbdev@eof:</p><ul>
<li>shard-dg2:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/Patchwork_169493v6/shard-dg2-7/igt@fbdev@eof.html">SKIP</a> (=
<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2582">i9=
15#2582</a>)</li>
</ul></li>
<li>
<p>igt@gem_caching@writes:</p><ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/Patchwork_169493v6/shard-mtlp-6/igt@gem_caching@writes.html">=
SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issue=
s/4873">i915#4873</a>)</li>
</ul></li>
<li>
<p>igt@gem_ccs@block-copy-compressed:</p><ul>
<li>shard-rkl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/Patchwork_169493v6/shard-rkl-5/igt@gem_ccs@block-copy-compres=
sed.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kern=
el/-/issues/3555">i915#3555</a> / <a href=3D"https://gitlab.freedesktop.org=
/drm/i915/kernel/-/issues/9323">i915#9323</a>)</li>
</ul></li>
<li>
<p>igt@gem_ccs@block-multicopy-compressed:</p><ul>
<li>shard-rkl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/Patchwork_169493v6/shard-rkl-4/igt@gem_ccs@block-multicopy-co=
mpressed.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915=
/kernel/-/issues/9323">i915#9323</a>)</li>
</ul></li>
<li>
<p>igt@gem_ccs@block-multicopy-inplace:</p><ul>
<li>shard-glk11:        NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/Patchwork_169493v6/shard-glk11/igt@gem_ccs@block-multicopy-in=
place.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/ke=
rnel/-/issues/17499">i915#17499</a>)</li>
</ul></li>
<li>
<p>igt@gem_ccs@ctrl-surf-copy:</p><ul>
<li>shard-tglu:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/Patchwork_169493v6/shard-tglu-10/igt@gem_ccs@ctrl-surf-copy.h=
tml">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/=
issues/3555">i915#3555</a> / <a href=3D"https://gitlab.freedesktop.org/drm/=
i915/kernel/-/issues/9323">i915#9323</a>) +1 other test skip</li>
</ul></li>
<li>
<p>igt@gem_ccs@suspend-resume:</p><ul>
<li>shard-dg1:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/Patchwork_169493v6/shard-dg1-18/igt@gem_ccs@suspend-resume.ht=
ml">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/i=
ssues/9323">i915#9323</a>)</li>
</ul></li>
<li>
<p>igt@gem_close_race@multigpu-basic-process:</p><ul>
<li>shard-tglu:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/Patchwork_169493v6/shard-tglu-10/igt@gem_close_race@multigpu-=
basic-process.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm=
/i915/kernel/-/issues/7697">i915#7697</a>) +2 other tests skip</li>
<li>shard-glk10:        NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/Patchwork_169493v6/shard-glk10/igt@gem_close_race@multigpu-ba=
sic-process.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i=
915/kernel/-/issues/17568">i915#17568</a>)</li>
</ul></li>
<li>
<p>igt@gem_compute@compute-square:</p><ul>
<li>shard-glk:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/Patchwork_169493v6/shard-glk5/igt@gem_compute@compute-square.=
html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-=
/issues/17552">i915#17552</a>)</li>
</ul></li>
<li>
<p>igt@gem_create@create-ext-cpu-access-sanity-check:</p><ul>
<li>shard-tglu:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/Patchwork_169493v6/shard-tglu-10/igt@gem_create@create-ext-cp=
u-access-sanity-check.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop=
.org/drm/i915/kernel/-/issues/6335">i915#6335</a>)</li>
</ul></li>
<li>
<p>igt@gem_create@create-ext-set-pat:</p><ul>
<li>shard-glk:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/Patchwork_169493v6/shard-glk3/igt@gem_create@create-ext-set-p=
at.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kerne=
l/-/issues/17530">i915#17530</a>)</li>
<li>shard-tglu:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/Patchwork_169493v6/shard-tglu-10/igt@gem_create@create-ext-se=
t-pat.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/ke=
rnel/-/issues/8562">i915#8562</a>)</li>
</ul></li>
<li>
<p>igt@gem_ctx_param@set-priority-not-supported:</p><ul>
<li>shard-tglu:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/Patchwork_169493v6/shard-tglu-8/igt@gem_ctx_param@set-priorit=
y-not-supported.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/d=
rm/i915/kernel/-/issues/17444">i915#17444</a>)</li>
<li>shard-glk11:        NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/Patchwork_169493v6/shard-glk11/igt@gem_ctx_param@set-priority=
-not-supported.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/dr=
m/i915/kernel/-/issues/17535">i915#17535</a>)</li>
</ul></li>
<li>
<p>igt@gem_ctx_persistence@heartbeat-hang:</p><ul>
<li>shard-dg1:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/Patchwork_169493v6/shard-dg1-15/igt@gem_ctx_persistence@heart=
beat-hang.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i91=
5/kernel/-/issues/8555">i915#8555</a>)</li>
</ul></li>
<li>
<p>igt@gem_ctx_persistence@legacy-engines-hang@blt:</p><ul>
<li>shard-glk:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/Patchwork_169493v6/shard-glk5/igt@gem_ctx_persistence@legacy-=
engines-hang@blt.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/=
drm/i915/kernel/-/issues/17527">i915#17527</a>) +1 other test skip</li>
</ul></li>
<li>
<p>igt@gem_ctx_sseu@invalid-args:</p><ul>
<li>shard-glk10:        NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/Patchwork_169493v6/shard-glk10/igt@gem_ctx_sseu@invalid-args.=
html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-=
/issues/17496">i915#17496</a>)</li>
</ul></li>
<li>
<p>igt@gem_ctx_sseu@invalid-sseu:</p><ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/Patchwork_169493v6/shard-mtlp-6/igt@gem_ctx_sseu@invalid-sseu=
.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/=
-/issues/280">i915#280</a>)</li>
</ul></li>
<li>
<p>igt@gem_ctx_sseu@mmap-args:</p><ul>
<li>shard-rkl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/Patchwork_169493v6/shard-rkl-5/igt@gem_ctx_sseu@mmap-args.htm=
l">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/is=
sues/280">i915#280</a>)</li>
</ul></li>
<li>
<p>igt@gem_eio@hibernate:</p><ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_19395/shard-rkl-7/igt@gem_eio@hibernate.html">PASS</a> -&gt; <a hre=
f=3D"https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_169493v6/shard-rkl-=
1/igt@gem_eio@hibernate.html">ABORT</a> (<a href=3D"https://gitlab.freedesk=
top.org/drm/i915/kernel/-/issues/7975">i915#7975</a>)</li>
</ul></li>
<li>
<p>igt@gem_exec_balancer@bonded-dual:</p><ul>
<li>shard-dg2:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/Patchwork_169493v6/shard-dg2-7/igt@gem_exec_balancer@bonded-d=
ual.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kern=
el/-/issues/4771">i915#4771</a>)</li>
<li>shard-dg1:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/Patchwork_169493v6/shard-dg1-18/igt@gem_exec_balancer@bonded-=
dual.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/ker=
nel/-/issues/4771">i915#4771</a>) +1 other test skip</li>
</ul></li>
<li>
<p>igt@gem_exec_balancer@fairslice:</p><ul>
<li>shard-glk10:        NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/Patchwork_169493v6/shard-glk10/igt@gem_exec_balancer@fairslic=
e.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel=
/-/issues/17547">i915#17547</a>) +1 other test skip</li>
</ul></li>
<li>
<p>igt@gem_exec_balancer@parallel:</p><ul>
<li>shard-rkl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/Patchwork_169493v6/shard-rkl-4/igt@gem_exec_balancer@parallel=
.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/=
-/issues/4525">i915#4525</a>) +2 other tests skip</li>
</ul></li>
<li>
<p>igt@gem_exec_balancer@parallel-keep-submit-fence:</p><ul>
<li>shard-tglu-1:       NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/Patchwork_169493v6/shard-tglu-1/igt@gem_exec_balancer@paralle=
l-keep-submit-fence.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.o=
rg/drm/i915/kernel/-/issues/4525">i915#4525</a>)</li>
</ul></li>
<li>
<p>igt@gem_exec_balancer@parallel-ordering:</p><ul>
<li>shard-tglu:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/Patchwork_169493v6/shard-tglu-2/igt@gem_exec_balancer@paralle=
l-ordering.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i9=
15/kernel/-/issues/4525">i915#4525</a>) +1 other test skip</li>
</ul></li>
<li>
<p>igt@gem_exec_capture@capture-invisible@smem0:</p><ul>
<li>shard-rkl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/Patchwork_169493v6/shard-rkl-5/igt@gem_exec_capture@capture-i=
nvisible@smem0.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/dr=
m/i915/kernel/-/issues/6334">i915#6334</a>) +1 other test skip</li>
</ul></li>
<li>
<p>igt@gem_exec_flush@basic-batch-kernel-default-cmd:</p><ul>
<li>shard-rkl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/Patchwork_169493v6/shard-rkl-4/igt@gem_exec_flush@basic-batch=
-kernel-default-cmd.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.o=
rg/drm/i915/kernel/-/issues/3711">i915#3711</a>)</li>
</ul></li>
<li>
<p>igt@gem_exec_flush@basic-batch-kernel-default-wb:</p><ul>
<li>shard-dg1:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/Patchwork_169493v6/shard-dg1-18/igt@gem_exec_flush@basic-batc=
h-kernel-default-wb.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.o=
rg/drm/i915/kernel/-/issues/3539">i915#3539</a> / <a href=3D"https://gitlab=
.freedesktop.org/drm/i915/kernel/-/issues/4852">i915#4852</a>) +1 other tes=
t skip</li>
<li>shard-dg2:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/Patchwork_169493v6/shard-dg2-7/igt@gem_exec_flush@basic-batch=
-kernel-default-wb.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.or=
g/drm/i915/kernel/-/issues/3539">i915#3539</a> / <a href=3D"https://gitlab.=
freedesktop.org/drm/i915/kernel/-/issues/4852">i915#4852</a>)</li>
</ul></li>
<li>
<p>igt@gem_exec_params@larger-than-life-batch:</p><ul>
<li>shard-glk:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/Patchwork_169493v6/shard-glk3/igt@gem_exec_params@larger-than=
-life-batch.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i=
915/kernel/-/issues/16871">i915#16871</a>)</li>
</ul></li>
<li>
<p>igt@gem_exec_params@rsvd2-dirt:</p><ul>
<li>shard-glk10:        NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/Patchwork_169493v6/shard-glk10/igt@gem_exec_params@rsvd2-dirt=
.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/=
-/issues/17565">i915#17565</a>)</li>
<li>shard-tglu:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/Patchwork_169493v6/shard-tglu-10/igt@gem_exec_params@rsvd2-di=
rt.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kerne=
l/-/issues/17453">i915#17453</a>)</li>
</ul></li>
<li>
<p>igt@gem_exec_reloc@basic-cpu-wc:</p><ul>
<li>shard-dg2:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/Patchwork_169493v6/shard-dg2-6/igt@gem_exec_reloc@basic-cpu-w=
c.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel=
/-/issues/3281">i915#3281</a>)</li>
</ul></li>
<li>
<p>igt@gem_exec_reloc@basic-gtt-wc-active:</p><ul>
<li>shard-rkl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/Patchwork_169493v6/shard-rkl-8/igt@gem_exec_reloc@basic-gtt-w=
c-active.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915=
/kernel/-/issues/3281">i915#3281</a>) +10 other tests skip</li>
</ul></li>
<li>
<p>igt@gem_exec_reloc@basic-write-read:</p><ul>
<li>shard-dg1:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/Patchwork_169493v6/shard-dg1-18/igt@gem_exec_reloc@basic-writ=
e-read.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/k=
ernel/-/issues/3281">i915#3281</a>) +2 other tests skip</li>
</ul></li>
<li>
<p>igt@gem_exec_schedule@preempt-queue-chain:</p><ul>
<li>shard-dg2:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/Patchwork_169493v6/shard-dg2-6/igt@gem_exec_schedule@preempt-=
queue-chain.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i=
915/kernel/-/issues/4537">i915#4537</a> / <a href=3D"https://gitlab.freedes=
ktop.org/drm/i915/kernel/-/issues/4812">i915#4812</a>)</li>
</ul></li>
<li>
<p>igt@gem_exec_suspend@basic-s0:</p><ul>
<li>shard-dg2:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_19395/shard-dg2-4/igt@gem_exec_suspend@basic-s0.html">PASS</a> -&gt=
; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_169493v6/sh=
ard-dg2-3/igt@gem_exec_suspend@basic-s0.html">INCOMPLETE</a> (<a href=3D"ht=
tps://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13356">i915#13356</a>=
) +1 other test incomplete</li>
</ul></li>
<li>
<p>igt@gem_fence_thrash@bo-write-verify-none:</p><ul>
<li>shard-dg1:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/Patchwork_169493v6/shard-dg1-15/igt@gem_fence_thrash@bo-write=
-verify-none.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/=
i915/kernel/-/issues/4860">i915#4860</a>) +2 other tests skip</li>
</ul></li>
<li>
<p>igt@gem_lmem_swapping@basic:</p><ul>
<li>shard-glk11:        NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/Patchwork_169493v6/shard-glk11/igt@gem_lmem_swapping@basic.ht=
ml">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/i=
ssues/17503">i915#17503</a>)</li>
</ul></li>
<li>
<p>igt@gem_lmem_swapping@heavy-multi:</p><ul>
<li>shard-glk10:        NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/Patchwork_169493v6/shard-glk10/igt@gem_lmem_swapping@heavy-mu=
lti.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kern=
el/-/issues/17503">i915#17503</a>) +3 other tests skip</li>
</ul></li>
<li>
<p>igt@gem_lmem_swapping@heavy-verify-random-ccs:</p><ul>
<li>shard-tglu-1:       NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/Patchwork_169493v6/shard-tglu-1/igt@gem_lmem_swapping@heavy-v=
erify-random-ccs.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/=
drm/i915/kernel/-/issues/4613">i915#4613</a>) +3 other tests skip</li>
</ul></li>
<li>
<p>igt@gem_lmem_swapping@heavy-verify-random-ccs@lmem0:</p><ul>
<li>shard-dg1:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/Patchwork_169493v6/shard-dg1-14/igt@gem_lmem_swapping@heavy-v=
erify-random-ccs@lmem0.html">SKIP</a> (<a href=3D"https://gitlab.freedeskto=
p.org/drm/i915/kernel/-/issues/4565">i915#4565</a>) +1 other test skip</li>
</ul></li>
<li>
<p>igt@gem_lmem_swapping@massive-random:</p><ul>
<li>shard-glk:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/Patchwork_169493v6/shard-glk6/igt@gem_lmem_swapping@massive-r=
andom.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/ke=
rnel/-/issues/17503">i915#17503</a> / <a href=3D"https://gitlab.freedesktop=
.org/drm/i915/kernel/-/issues/4613">i915#4613</a>) +2 other tests skip</li>
</ul></li>
<li>
<p>igt@gem_lmem_swapping@parallel-random:</p><ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/Patchwork_169493v6/shard-mtlp-6/igt@gem_lmem_swapping@paralle=
l-random.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915=
/kernel/-/issues/4613">i915#4613</a>)</li>
</ul></li>
<li>
<p>igt@gem_lmem_swapping@parallel-random-verify-ccs:</p><ul>
<li>shard-dg1:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/Patchwork_169493v6/shard-dg1-18/igt@gem_lmem_swapping@paralle=
l-random-verify-ccs.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.o=
rg/drm/i915/kernel/-/issues/12193">i915#12193</a>) +1 other test skip</li>
</ul></li>
<li>
<p>igt@gem_lmem_swapping@random-engines:</p><ul>
<li>shard-rkl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/Patchwork_169493v6/shard-rkl-5/igt@gem_lmem_swapping@random-e=
ngines.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/k=
ernel/-/issues/4613">i915#4613</a>) +2 other tests skip</li>
</ul></li>
<li>
<p>igt@gem_lmem_swapping@verify-random-ccs:</p><ul>
<li>shard-tglu:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/Patchwork_169493v6/shard-tglu-10/igt@gem_lmem_swapping@verify=
-random-ccs.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i=
915/kernel/-/issues/4613">i915#4613</a>) +2 other tests skip</li>
</ul></li>
<li>
<p>igt@gem_media_vme:</p><ul>
<li>shard-glk11:        NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/Patchwork_169493v6/shard-glk11/igt@gem_media_vme.html">SKIP</=
a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/1754=
3">i915#17543</a>)</li>
</ul></li>
<li>
<p>igt@gem_mmap@bad-object:</p><ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/Patchwork_169493v6/shard-mtlp-6/igt@gem_mmap@bad-object.html"=
>SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issu=
es/4083">i915#4083</a>) +1 other test skip</li>
</ul></li>
<li>
<p>igt@gem_mmap_gtt@coherency:</p><ul>
<li>shard-rkl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/Patchwork_169493v6/shard-rkl-8/igt@gem_mmap_gtt@coherency.htm=
l">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/is=
sues/17429">i915#17429</a>)</li>
<li>shard-tglu-1:       NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/Patchwork_169493v6/shard-tglu-1/igt@gem_mmap_gtt@coherency.ht=
ml">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/i=
ssues/17429">i915#17429</a>)</li>
</ul></li>
<li>
<p>igt@gem_mmap_gtt@flink-race:</p><ul>
<li>shard-dg1:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/Patchwork_169493v6/shard-dg1-15/igt@gem_mmap_gtt@flink-race.h=
tml">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/=
issues/4077">i915#4077</a>) +10 other tests skip</li>
</ul></li>
<li>
<p>igt@gem_mmap_wc@bad-object:</p><ul>
<li>shard-dg1:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/Patchwork_169493v6/shard-dg1-14/igt@gem_mmap_wc@bad-object.ht=
ml">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/i=
ssues/4083">i915#4083</a>) +1 other test skip</li>
</ul></li>
<li>
<p>igt@gem_mmap_wc@coherency:</p><ul>
<li>shard-dg2:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/Patchwork_169493v6/shard-dg2-7/igt@gem_mmap_wc@coherency.html=
">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/iss=
ues/4083">i915#4083</a>)</li>
</ul></li>
<li>
<p>igt@gem_partial_pwrite_pread@reads:</p><ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/Patchwork_169493v6/shard-mtlp-7/igt@gem_partial_pwrite_pread@=
reads.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/ke=
rnel/-/issues/3282">i915#3282</a>)</li>
</ul></li>
<li>
<p>igt@gem_partial_pwrite_pread@writes-after-reads-display:</p><ul>
<li>shard-dg1:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/Patchwork_169493v6/shard-dg1-14/igt@gem_partial_pwrite_pread@=
writes-after-reads-display.html">SKIP</a> (<a href=3D"https://gitlab.freede=
sktop.org/drm/i915/kernel/-/issues/3282">i915#3282</a>) +4 other tests skip=
</li>
</ul></li>
<li>
<p>igt@gem_partial_pwrite_pread@writes-after-reads-snoop:</p><ul>
<li>shard-dg2:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/Patchwork_169493v6/shard-dg2-7/igt@gem_partial_pwrite_pread@w=
rites-after-reads-snoop.html">SKIP</a> (<a href=3D"https://gitlab.freedeskt=
op.org/drm/i915/kernel/-/issues/3282">i915#3282</a>)</li>
</ul></li>
<li>
<p>igt@gem_partial_pwrite_pread@writes-after-reads-uncached:</p><ul>
<li>shard-rkl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/Patchwork_169493v6/shard-rkl-8/igt@gem_partial_pwrite_pread@w=
rites-after-reads-uncached.html">SKIP</a> (<a href=3D"https://gitlab.freede=
sktop.org/drm/i915/kernel/-/issues/3282">i915#3282</a>) +9 other tests skip=
</li>
</ul></li>
<li>
<p>igt@gem_pxp@protected-raw-src-copy-not-readible:</p><ul>
<li>shard-glk11:        NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/Patchwork_169493v6/shard-glk11/igt@gem_pxp@protected-raw-src-=
copy-not-readible.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org=
/drm/i915/kernel/-/issues/17521">i915#17521</a>)</li>
</ul></li>
<li>
<p>igt@gem_pxp@reject-modify-context-protection-off-3:</p><ul>
<li>shard-glk:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/Patchwork_169493v6/shard-glk3/igt@gem_pxp@reject-modify-conte=
xt-protection-off-3.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.o=
rg/drm/i915/kernel/-/issues/17521">i915#17521</a>) +1 other test skip</li>
<li>shard-dg1:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/Patchwork_169493v6/shard-dg1-14/igt@gem_pxp@reject-modify-con=
text-protection-off-3.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop=
.org/drm/i915/kernel/-/issues/4270">i915#4270</a>) +1 other test skip</li>
</ul></li>
<li>
<p>igt@gem_pxp@verify-pxp-stale-buf-execution:</p><ul>
<li>shard-glk10:        NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/Patchwork_169493v6/shard-glk10/igt@gem_pxp@verify-pxp-stale-b=
uf-execution.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/=
i915/kernel/-/issues/17521">i915#17521</a>)</li>
</ul></li>
<li>
<p>igt@gem_render_copy@linear-to-vebox-y-tiled:</p><ul>
<li>shard-dg2:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/Patchwork_169493v6/shard-dg2-7/igt@gem_render_copy@linear-to-=
vebox-y-tiled.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm=
/i915/kernel/-/issues/5190">i915#5190</a> / <a href=3D"https://gitlab.freed=
esktop.org/drm/i915/kernel/-/issues/8428">i915#8428</a>) +1 other test skip=
</li>
</ul></li>
<li>
<p>igt@gem_render_copy@linear-to-vebox-yf-tiled:</p><ul>
<li>shard-glk10:        NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/Patchwork_169493v6/shard-glk10/igt@gem_render_copy@linear-to-=
vebox-yf-tiled.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/dr=
m/i915/kernel/-/issues/17492">i915#17492</a>) +1 other test skip</li>
</ul></li>
<li>
<p>igt@gem_render_copy@yf-tiled-to-vebox-linear:</p><ul>
<li>shard-glk:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/Patchwork_169493v6/shard-glk3/igt@gem_render_copy@yf-tiled-to=
-vebox-linear.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm=
/i915/kernel/-/issues/17492">i915#17492</a>)</li>
</ul></li>
<li>
<p>igt@gem_render_copy@yf-tiled-to-vebox-y-tiled:</p><ul>
<li>shard-glk11:        NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/Patchwork_169493v6/shard-glk11/igt@gem_render_copy@yf-tiled-t=
o-vebox-y-tiled.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/d=
rm/i915/kernel/-/issues/17492">i915#17492</a>)</li>
</ul></li>
<li>
<p>igt@gem_set_tiling_vs_blt@untiled-to-tiled:</p><ul>
<li>shard-dg1:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/Patchwork_169493v6/shard-dg1-14/igt@gem_set_tiling_vs_blt@unt=
iled-to-tiled.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm=
/i915/kernel/-/issues/4079">i915#4079</a>)</li>
</ul></li>
<li>
<p>igt@gem_softpin@evict-snoop:</p><ul>
<li>shard-rkl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/Patchwork_169493v6/shard-rkl-4/igt@gem_softpin@evict-snoop.ht=
ml">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/i=
ssues/17430">i915#17430</a>)</li>
</ul></li>
<li>
<p>igt@gem_softpin@evict-snoop-interruptible:</p><ul>
<li>shard-glk:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/Patchwork_169493v6/shard-glk5/igt@gem_softpin@evict-snoop-int=
erruptible.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i9=
15/kernel/-/issues/17551">i915#17551</a>)</li>
</ul></li>
<li>
<p>igt@gem_softpin@noreloc-s3:</p><ul>
<li>shard-glk:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_19395/shard-glk1/igt@gem_softpin@noreloc-s3.html">PASS</a> -&gt; <a=
 href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_169493v6/shard-=
glk8/igt@gem_softpin@noreloc-s3.html">INCOMPLETE</a> (<a href=3D"https://gi=
tlab.freedesktop.org/drm/i915/kernel/-/issues/13356">i915#13356</a> / <a hr=
ef=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13809">i915#1=
3809</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issu=
es/16193">i915#16193</a>)</li>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_19395/shard-rkl-3/igt@gem_softpin@noreloc-s3.html">PASS</a> -&gt; <=
a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_169493v6/shard=
-rkl-6/igt@gem_softpin@noreloc-s3.html">INCOMPLETE</a> (<a href=3D"https://=
gitlab.freedesktop.org/drm/i915/kernel/-/issues/13809">i915#13809</a> / <a =
href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16226">i915=
#16226</a>)</li>
</ul></li>
<li>
<p>igt@gem_tiled_blits@basic:</p><ul>
<li>shard-dg2:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/Patchwork_169493v6/shard-dg2-7/igt@gem_tiled_blits@basic.html=
">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/iss=
ues/4077">i915#4077</a>) +2 other tests skip</li>
</ul></li>
<li>
<p>igt@gem_tiled_partial_pwrite_pread@writes-after-reads:</p><ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/Patchwork_169493v6/shard-mtlp-2/igt@gem_tiled_partial_pwrite_=
pread@writes-after-reads.html">SKIP</a> (<a href=3D"https://gitlab.freedesk=
top.org/drm/i915/kernel/-/issues/4077">i915#4077</a>)</li>
</ul></li>
<li>
<p>igt@gem_tiled_pread_basic@basic:</p><ul>
<li>shard-rkl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/Patchwork_169493v6/shard-rkl-4/igt@gem_tiled_pread_basic@basi=
c.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel=
/-/issues/15656">i915#15656</a>)</li>
</ul></li>
<li>
<p>igt@gem_userptr_blits@dmabuf-sync:</p><ul>
<li>shard-rkl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/Patchwork_169493v6/shard-rkl-8/igt@gem_userptr_blits@dmabuf-s=
ync.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kern=
el/-/issues/3297">i915#3297</a> / <a href=3D"https://gitlab.freedesktop.org=
/drm/i915/kernel/-/issues/3323">i915#3323</a>)</li>
<li>shard-tglu-1:       NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/Patchwork_169493v6/shard-tglu-1/igt@gem_userptr_blits@dmabuf-=
sync.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/ker=
nel/-/issues/3297">i915#3297</a> / <a href=3D"https://gitlab.freedesktop.or=
g/drm/i915/kernel/-/issues/3323">i915#3323</a>)</li>
</ul></li>
<li>
<p>igt@gem_userptr_blits@dmabuf-unsync:</p><ul>
<li>shard-tglu:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/Patchwork_169493v6/shard-tglu-2/igt@gem_userptr_blits@dmabuf-=
unsync.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/k=
ernel/-/issues/3297">i915#3297</a>) +1 other test skip</li>
<li>shard-glk:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/Patchwork_169493v6/shard-glk6/igt@gem_userptr_blits@dmabuf-un=
sync.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/ker=
nel/-/issues/17507">i915#17507</a>) +1 other test skip</li>
</ul></li>
<li>
<p>igt@gem_userptr_blits@map-fixed-invalidate-busy:</p><ul>
<li>shard-dg2:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/Patchwork_169493v6/shard-dg2-7/igt@gem_userptr_blits@map-fixe=
d-invalidate-busy.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org=
/drm/i915/kernel/-/issues/3297">i915#3297</a> / <a href=3D"https://gitlab.f=
reedesktop.org/drm/i915/kernel/-/issues/4880">i915#4880</a>)</li>
<li>shard-dg1:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/Patchwork_169493v6/shard-dg1-18/igt@gem_userptr_blits@map-fix=
ed-invalidate-busy.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.or=
g/drm/i915/kernel/-/issues/3297">i915#3297</a> / <a href=3D"https://gitlab.=
freedesktop.org/drm/i915/kernel/-/issues/4880">i915#4880</a>) +2 other test=
s skip</li>
</ul></li>
<li>
<p>igt@gem_userptr_blits@readonly-pwrite-unsync:</p><ul>
<li>shard-tglu-1:       NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/Patchwork_169493v6/shard-tglu-1/igt@gem_userptr_blits@readonl=
y-pwrite-unsync.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/d=
rm/i915/kernel/-/issues/3297">i915#3297</a>) +1 other test skip</li>
</ul></li>
<li>
<p>igt@gem_userptr_blits@relocations:</p><ul>
<li>shard-rkl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/Patchwork_169493v6/shard-rkl-8/igt@gem_userptr_blits@relocati=
ons.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kern=
el/-/issues/3281">i915#3281</a> / <a href=3D"https://gitlab.freedesktop.org=
/drm/i915/kernel/-/issues/3297">i915#3297</a>)</li>
</ul></li>
<li>
<p>igt@gem_userptr_blits@unsync-unmap-after-close:</p><ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/Patchwork_169493v6/shard-mtlp-6/igt@gem_userptr_blits@unsync-=
unmap-after-close.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org=
/drm/i915/kernel/-/issues/3297">i915#3297</a>)</li>
</ul></li>
<li>
<p>igt@gem_userptr_blits@unsync-unmap-cycles:</p><ul>
<li>shard-glk11:        NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/Patchwork_169493v6/shard-glk11/igt@gem_userptr_blits@unsync-u=
nmap-cycles.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i=
915/kernel/-/issues/17507">i915#17507</a>) +1 other test skip</li>
</ul></li>
<li>
<p>igt@gem_workarounds@suspend-resume:</p><ul>
<li>shard-rkl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/Patchwork_169493v6/shard-rkl-3/igt@gem_workarounds@suspend-re=
sume.html">INCOMPLETE</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i9=
15/kernel/-/issues/13356">i915#13356</a>)</li>
</ul></li>
<li>
<p>igt@gen3_render_linear_blits:</p><ul>
<li>shard-glk:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/Patchwork_169493v6/shard-glk3/igt@gen3_render_linear_blits.ht=
ml">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/i=
ssues/17555">i915#17555</a>)</li>
</ul></li>
<li>
<p>igt@gen3_render_mixed_blits:</p><ul>
<li>shard-glk:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/Patchwork_169493v6/shard-glk3/igt@gen3_render_mixed_blits.htm=
l">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/is=
sues/17532">i915#17532</a>)</li>
</ul></li>
<li>
<p>igt@gen3_render_tiledy_blits:</p><ul>
<li>shard-glk10:        NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/Patchwork_169493v6/shard-glk10/igt@gen3_render_tiledy_blits.h=
tml">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/=
issues/17578">i915#17578</a>)</li>
</ul></li>
<li>
<p>igt@gen7_exec_parse@basic-offset:</p><ul>
<li>shard-glk:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/Patchwork_169493v6/shard-glk3/igt@gen7_exec_parse@basic-offse=
t.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel=
/-/issues/17505">i915#17505</a>) +1 other test skip</li>
</ul></li>
<li>
<p>igt@gen7_exec_parse@basic-rejected:</p><ul>
<li>shard-rkl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/Patchwork_169493v6/shard-rkl-2/igt@gen7_exec_parse@basic-reje=
cted.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/ker=
nel/-/issues/17455">i915#17455</a>) +4 other tests skip</li>
<li>shard-dg1:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/Patchwork_169493v6/shard-dg1-15/igt@gen7_exec_parse@basic-rej=
ected.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/ke=
rnel/-/issues/17455">i915#17455</a>) +4 other tests skip</li>
</ul></li>
<li>
<p>igt@gen7_exec_parse@bitmasks:</p><ul>
<li>shard-dg2:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/Patchwork_169493v6/shard-dg2-7/igt@gen7_exec_parse@bitmasks.h=
tml">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/=
issues/17455">i915#17455</a>)</li>
</ul></li>
<li>
<p>igt@gen7_exec_parse@cmd-crossing-page:</p><ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/Patchwork_169493v6/shard-mtlp-6/igt@gen7_exec_parse@cmd-cross=
ing-page.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915=
/kernel/-/issues/17455">i915#17455</a>)</li>
</ul></li>
<li>
<p>igt@gen7_exec_parse@load-register-reg:</p><ul>
<li>shard-glk11:        NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/Patchwork_169493v6/shard-glk11/igt@gen7_exec_parse@load-regis=
ter-reg.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/=
kernel/-/issues/17505">i915#17505</a>)</li>
</ul></li>
<li>
<p>igt@gen9_exec_parse@basic-rejected:</p><ul>
<li>shard-tglu-1:       NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/Patchwork_169493v6/shard-tglu-1/igt@gen9_exec_parse@basic-rej=
ected.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/ke=
rnel/-/issues/2527">i915#2527</a> / <a href=3D"https://gitlab.freedesktop.o=
rg/drm/i915/kernel/-/issues/2856">i915#2856</a>)</li>
</ul></li>
<li>
<p>igt@gen9_exec_parse@basic-rejected-ctx-param:</p><ul>
<li>shard-tglu:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/Patchwork_169493v6/shard-tglu-10/igt@gen9_exec_parse@basic-re=
jected-ctx-param.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/=
drm/i915/kernel/-/issues/2527">i915#2527</a> / <a href=3D"https://gitlab.fr=
eedesktop.org/drm/i915/kernel/-/issues/2856">i915#2856</a>) +5 other tests =
skip</li>
</ul></li>
<li>
<p>igt@gen9_exec_parse@batch-zero-length:</p><ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/Patchwork_169493v6/shard-mtlp-7/igt@gen9_exec_parse@batch-zer=
o-length.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915=
/kernel/-/issues/2856">i915#2856</a>)</li>
</ul></li>
<li>
<p>igt@gen9_exec_parse@unaligned-jump:</p><ul>
<li>shard-rkl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/Patchwork_169493v6/shard-rkl-4/igt@gen9_exec_parse@unaligned-=
jump.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/ker=
nel/-/issues/2527">i915#2527</a>) +3 other tests skip</li>
</ul></li>
<li>
<p>igt@i915_drm_fdinfo@all-busy-idle-check-all:</p><ul>
<li>shard-dg1:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/Patchwork_169493v6/shard-dg1-18/igt@i915_drm_fdinfo@all-busy-=
idle-check-all.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/dr=
m/i915/kernel/-/issues/14123">i915#14123</a>)</li>
</ul></li>
<li>
<p>igt@i915_drm_fdinfo@busy@rcs0:</p><ul>
<li>shard-dg1:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/Patchwork_169493v6/shard-dg1-15/igt@i915_drm_fdinfo@busy@rcs0=
.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/=
-/issues/14073">i915#14073</a>) +5 other tests skip</li>
</ul></li>
<li>
<p>igt@i915_drm_fdinfo@virtual-busy-hang-all:</p><ul>
<li>shard-dg1:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/Patchwork_169493v6/shard-dg1-15/igt@i915_drm_fdinfo@virtual-b=
usy-hang-all.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/=
i915/kernel/-/issues/14118">i915#14118</a>)</li>
</ul></li>
<li>
<p>igt@i915_module_load@resize-bar:</p><ul>
<li>shard-tglu:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/Patchwork_169493v6/shard-tglu-10/igt@i915_module_load@resize-=
bar.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kern=
el/-/issues/6412">i915#6412</a>)</li>
<li>shard-glk10:        NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/Patchwork_169493v6/shard-glk10/igt@i915_module_load@resize-ba=
r.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel=
/-/issues/17566">i915#17566</a>)</li>
</ul></li>
<li>
<p>igt@i915_pm_freq_api@freq-basic-api:</p><ul>
<li>shard-glk:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/Patchwork_169493v6/shard-glk3/igt@i915_pm_freq_api@freq-basic=
-api.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/ker=
nel/-/issues/17526">i915#17526</a>)</li>
<li>shard-tglu-1:       NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/Patchwork_169493v6/shard-tglu-1/igt@i915_pm_freq_api@freq-bas=
ic-api.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/k=
ernel/-/issues/8399">i915#8399</a>)</li>
</ul></li>
<li>
<p>igt@i915_pm_freq_api@freq-suspend@gt0:</p><ul>
<li>shard-dg2:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_19395/shard-dg2-8/igt@i915_pm_freq_api@freq-suspend@gt0.html">PASS<=
/a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_169=
493v6/shard-dg2-7/igt@i915_pm_freq_api@freq-suspend@gt0.html">INCOMPLETE</a=
> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13356=
">i915#13356</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i915/kerne=
l/-/issues/13820">i915#13820</a>) +1 other test incomplete</li>
</ul></li>
<li>
<p>igt@i915_pm_rc6_residency@media-rc6-accuracy:</p><ul>
<li>shard-tglu:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/Patchwork_169493v6/shard-tglu-10/igt@i915_pm_rc6_residency@me=
dia-rc6-accuracy.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/=
drm/i915/kernel/-/issues/16080">i915#16080</a> / <a href=3D"https://gitlab.=
freedesktop.org/drm/i915/kernel/-/issues/16166">i915#16166</a>)</li>
</ul></li>
<li>
<p>igt@i915_pm_rc6_residency@rc6-fence:</p><ul>
<li>shard-tglu-1:       NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/Patchwork_169493v6/shard-tglu-1/igt@i915_pm_rc6_residency@rc6=
-fence.html">WARN</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/k=
ernel/-/issues/13790">i915#13790</a> / <a href=3D"https://gitlab.freedeskto=
p.org/drm/i915/kernel/-/issues/2681">i915#2681</a>) +1 other test warn</li>
</ul></li>
<li>
<p>igt@i915_pm_rpm@system-suspend:</p><ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_19395/shard-rkl-5/igt@i915_pm_rpm@system-suspend.html">PASS</a> -&g=
t; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_169493v6/s=
hard-rkl-3/igt@i915_pm_rpm@system-suspend.html">INCOMPLETE</a> (<a href=3D"=
https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13356">i915#13356</=
a>)</li>
</ul></li>
<li>
<p>igt@i915_pm_rpm@system-suspend-execbuf:</p><ul>
<li>shard-glk:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/Patchwork_169493v6/shard-glk6/igt@i915_pm_rpm@system-suspend-=
execbuf.html">INCOMPLETE</a> (<a href=3D"https://gitlab.freedesktop.org/drm=
/i915/kernel/-/issues/13356">i915#13356</a> / <a href=3D"https://gitlab.fre=
edesktop.org/drm/i915/kernel/-/issues/15172">i915#15172</a>)</li>
</ul></li>
<li>
<p>igt@i915_pm_rps@min-max-config-loaded:</p><ul>
<li>shard-dg1:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/Patchwork_169493v6/shard-dg1-14/igt@i915_pm_rps@min-max-confi=
g-loaded.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915=
/kernel/-/issues/11681">i915#11681</a> / <a href=3D"https://gitlab.freedesk=
top.org/drm/i915/kernel/-/issues/6621">i915#6621</a>)</li>
</ul></li>
<li>
<p>igt@i915_pm_sseu@full-enable:</p><ul>
<li>shard-rkl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/Patchwork_169493v6/shard-rkl-4/igt@i915_pm_sseu@full-enable.h=
tml">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/=
issues/4387">i915#4387</a>)</li>
</ul></li>
<li>
<p>igt@i915_power@sanity:</p><ul>
<li>shard-rkl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/Patchwork_169493v6/shard-rkl-8/igt@i915_power@sanity.html">SK=
IP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/=
7984">i915#7984</a>)</li>
</ul></li>
<li>
<p>igt@i915_query@hwconfig_table:</p><ul>
<li>shard-glk10:        NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/Patchwork_169493v6/shard-glk10/igt@i915_query@hwconfig_table.=
html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-=
/issues/17584">i915#17584</a>)</li>
</ul></li>
<li>
<p>igt@i915_query@query-topology-unsupported:</p><ul>
<li>shard-dg1:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/Patchwork_169493v6/shard-dg1-15/igt@i915_query@query-topology=
-unsupported.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/=
i915/kernel/-/issues/16079">i915#16079</a>)</li>
</ul></li>
<li>
<p>igt@i915_query@test-query-geometry-subslices:</p><ul>
<li>shard-rkl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/Patchwork_169493v6/shard-rkl-8/igt@i915_query@test-query-geom=
etry-subslices.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/dr=
m/i915/kernel/-/issues/5723">i915#5723</a>)</li>
</ul></li>
<li>
<p>igt@i915_selftest@mock:</p><ul>
<li>shard-tglu:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_19395/shard-tglu-8/igt@i915_selftest@mock.html">PASS</a> -&gt; <a h=
ref=3D"https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_169493v6/shard-tg=
lu-3/igt@i915_selftest@mock.html">ABORT</a> (<a href=3D"https://gitlab.free=
desktop.org/drm/i915/kernel/-/issues/17076">i915#17076</a>) +1 other test a=
bort</li>
</ul></li>
<li>
<p>igt@i915_suspend@basic-s2idle-without-i915:</p><ul>
<li>shard-dg1:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_19395/shard-dg1-19/igt@i915_suspend@basic-s2idle-without-i915.html"=
>PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/Patchwo=
rk_169493v6/shard-dg1-19/igt@i915_suspend@basic-s2idle-without-i915.html">D=
MESG-WARN</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/=
issues/4391">i915#4391</a> / <a href=3D"https://gitlab.freedesktop.org/drm/=
i915/kernel/-/issues/4423">i915#4423</a>)</li>
</ul></li>
<li>
<p>igt@i915_suspend@basic-s3-without-i915:</p><ul>
<li>shard-tglu:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/Patchwork_169493v6/shard-tglu-8/igt@i915_suspend@basic-s3-wit=
hout-i915.html">INCOMPLETE</a> (<a href=3D"https://gitlab.freedesktop.org/d=
rm/i915/kernel/-/issues/4817">i915#4817</a> / <a href=3D"https://gitlab.fre=
edesktop.org/drm/i915/kernel/-/issues/7443">i915#7443</a>)</li>
<li>shard-glk11:        NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/Patchwork_169493v6/shard-glk11/igt@i915_suspend@basic-s3-with=
out-i915.html">INCOMPLETE</a> (<a href=3D"https://gitlab.freedesktop.org/dr=
m/i915/kernel/-/issues/13356">i915#13356</a> / <a href=3D"https://gitlab.fr=
eedesktop.org/drm/i915/kernel/-/issues/16182">i915#16182</a> / <a href=3D"h=
ttps://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4817">i915#4817</a>)=
</li>
</ul></li>
<li>
<p>igt@intel_hwmon@hwmon-write:</p><ul>
<li>shard-glk:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/Patchwork_169493v6/shard-glk6/igt@intel_hwmon@hwmon-write.htm=
l">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/is=
sues/11680">i915#11680</a>)</li>
<li>shard-tglu:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/Patchwork_169493v6/shard-tglu-2/igt@intel_hwmon@hwmon-write.h=
tml">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/=
issues/7707">i915#7707</a>)</li>
</ul></li>
<li>
<p>igt@kms_addfb_basic@basic-x-tiled-legacy:</p><ul>
<li>shard-dg1:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/Patchwork_169493v6/shard-dg1-14/igt@kms_addfb_basic@basic-x-t=
iled-legacy.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i=
915/kernel/-/issues/4212">i915#4212</a>) +1 other test skip</li>
</ul></li>
<li>
<p>igt@kms_async_flips@async-flip-with-page-flip-events-linear-atomic:</p><=
ul>
<li>shard-glk10:        NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/Patchwork_169493v6/shard-glk10/igt@kms_async_flips@async-flip=
-with-page-flip-events-linear-atomic.html">SKIP</a> (<a href=3D"https://git=
lab.freedesktop.org/drm/i915/kernel/-/issues/17562">i915#17562</a>)</li>
</ul></li>
<li>
<p>igt@kms_atomic_transition@plane-all-modeset-transition-internal-panels:<=
/p><ul>
<li>shard-dg1:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/Patchwork_169493v6/shard-dg1-18/igt@kms_atomic_transition@pla=
ne-all-modeset-transition-internal-panels.html">SKIP</a> (<a href=3D"https:=
//gitlab.freedesktop.org/drm/i915/kernel/-/issues/1769">i915#1769</a> / <a =
href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3555">i915#=
3555</a>)</li>
</ul></li>
<li>
<p>igt@kms_big_fb@4-tiled-16bpp-rotate-0:</p><ul>
<li>shard-rkl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/Patchwork_169493v6/shard-rkl-2/igt@kms_big_fb@4-tiled-16bpp-r=
otate-0.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/=
kernel/-/issues/4538">i915#4538</a> / <a href=3D"https://gitlab.freedesktop=
.org/drm/i915/kernel/-/issues/5286">i915#5286</a>) +5 other tests skip</li>
<li>shard-dg1:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/Patchwork_169493v6/shard-dg1-15/igt@kms_big_fb@4-tiled-16bpp-=
rotate-0.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915=
/kernel/-/issues/4538">i915#4538</a> / <a href=3D"https://gitlab.freedeskto=
p.org/drm/i915/kernel/-/issues/5286">i915#5286</a>) +2 other tests skip</li=
>
</ul></li>
<li>
<p>igt@kms_big_fb@4-tiled-32bpp-rotate-0:</p><ul>
<li>shard-glk11:        NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/Patchwork_169493v6/shard-glk11/igt@kms_big_fb@4-tiled-32bpp-r=
otate-0.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/=
kernel/-/issues/17478">i915#17478</a>)</li>
</ul></li>
<li>
<p>igt@kms_big_fb@4-tiled-32bpp-rotate-180:</p><ul>
<li>shard-tglu-1:       NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/Patchwork_169493v6/shard-tglu-1/igt@kms_big_fb@4-tiled-32bpp-=
rotate-180.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i9=
15/kernel/-/issues/17432">i915#17432</a> / <a href=3D"https://gitlab.freede=
sktop.org/drm/i915/kernel/-/issues/5286">i915#5286</a>) +2 other tests skip=
</li>
</ul></li>
<li>
<p>igt@kms_big_fb@4-tiled-8bpp-rotate-180:</p><ul>
<li>shard-glk10:        NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/Patchwork_169493v6/shard-glk10/igt@kms_big_fb@4-tiled-8bpp-ro=
tate-180.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915=
/kernel/-/issues/17478">i915#17478</a>) +4 other tests skip</li>
</ul></li>
<li>
<p>igt@kms_big_fb@4-tiled-addfb:</p><ul>
<li>shard-tglu-1:       NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/Patchwork_169493v6/shard-tglu-1/igt@kms_big_fb@4-tiled-addfb.=
html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-=
/issues/5286">i915#5286</a>)</li>
<li>shard-dg1:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/Patchwork_169493v6/shard-dg1-14/igt@kms_big_fb@4-tiled-addfb.=
html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-=
/issues/5286">i915#5286</a>) +1 other test skip</li>
<li>shard-glk:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/Patchwork_169493v6/shard-glk3/igt@kms_big_fb@4-tiled-addfb.ht=
ml">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/i=
ssues/17556">i915#17556</a>)</li>
</ul></li>
<li>
<p>igt@kms_big_fb@4-tiled-addfb-size-overflow:</p><ul>
<li>shard-rkl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/Patchwork_169493v6/shard-rkl-4/igt@kms_big_fb@4-tiled-addfb-s=
ize-overflow.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/=
i915/kernel/-/issues/5286">i915#5286</a>)</li>
</ul></li>
<li>
<p>igt@kms_big_fb@4-tiled-max-hw-stride-32bpp-rotate-180-async-flip:</p><ul=
>
<li>shard-tglu:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/Patchwork_169493v6/shard-tglu-10/igt@kms_big_fb@4-tiled-max-h=
w-stride-32bpp-rotate-180-async-flip.html">SKIP</a> (<a href=3D"https://git=
lab.freedesktop.org/drm/i915/kernel/-/issues/17432">i915#17432</a> / <a hre=
f=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5286">i915#528=
6</a>) +4 other tests skip</li>
</ul></li>
<li>
<p>igt@kms_big_fb@4-tiled-max-hw-stride-32bpp-rotate-180-hflip-async-flip:<=
/p><ul>
<li>shard-glk:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/Patchwork_169493v6/shard-glk3/igt@kms_big_fb@4-tiled-max-hw-s=
tride-32bpp-rotate-180-hflip-async-flip.html">SKIP</a> (<a href=3D"https://=
gitlab.freedesktop.org/drm/i915/kernel/-/issues/17478">i915#17478</a>) +2 o=
ther tests skip</li>
</ul></li>
<li>
<p>igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-0-hflip:</p><ul>
<li>shard-dg2:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_19395/shard-dg2-5/igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate=
-0-hflip.html">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/d=
rm-tip/Patchwork_169493v6/shard-dg2-7/igt@kms_big_fb@4-tiled-max-hw-stride-=
64bpp-rotate-0-hflip.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.=
org/drm/i915/kernel/-/issues/17356">i915#17356</a>) +28 other tests skip</l=
i>
</ul></li>
<li>
<p>igt@kms_big_fb@linear-16bpp-rotate-90:</p><ul>
<li>shard-tglu:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/Patchwork_169493v6/shard-tglu-8/igt@kms_big_fb@linear-16bpp-r=
otate-90.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915=
/kernel/-/issues/17431">i915#17431</a>) +2 other tests skip</li>
</ul></li>
<li>
<p>igt@kms_big_fb@linear-32bpp-rotate-90:</p><ul>
<li>shard-rkl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/Patchwork_169493v6/shard-rkl-8/igt@kms_big_fb@linear-32bpp-ro=
tate-90.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/=
kernel/-/issues/17431">i915#17431</a> / <a href=3D"https://gitlab.freedeskt=
op.org/drm/i915/kernel/-/issues/3638">i915#3638</a>) +4 other tests skip</l=
i>
<li>shard-tglu-1:       NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/Patchwork_169493v6/shard-tglu-1/igt@kms_big_fb@linear-32bpp-r=
otate-90.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915=
/kernel/-/issues/17431">i915#17431</a>) +2 other tests skip</li>
</ul></li>
<li>
<p>igt@kms_big_fb@linear-8bpp-rotate-270:</p><ul>
<li>shard-dg1:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/Patchwork_169493v6/shard-dg1-15/igt@kms_big_fb@linear-8bpp-ro=
tate-270.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915=
/kernel/-/issues/3638">i915#3638</a>) +2 other tests skip</li>
</ul></li>
<li>
<p>igt@kms_big_fb@x-tiled-max-hw-stride-32bpp-rotate-180-hflip-async-flip:<=
/p><ul>
<li>shard-glk10:        NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/Patchwork_169493v6/shard-glk10/igt@kms_big_fb@x-tiled-max-hw-=
stride-32bpp-rotate-180-hflip-async-flip.html">SKIP</a> (<a href=3D"https:/=
/gitlab.freedesktop.org/drm/i915/kernel/-/issues/17500">i915#17500</a>) +2 =
other tests skip</li>
</ul></li>
<li>
<p>igt@kms_big_fb@x-tiled-max-hw-stride-64bpp-rotate-180-hflip-async-flip:<=
/p><ul>
<li>shard-glk11:        NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/Patchwork_169493v6/shard-glk11/igt@kms_big_fb@x-tiled-max-hw-=
stride-64bpp-rotate-180-hflip-async-flip.html">SKIP</a> (<a href=3D"https:/=
/gitlab.freedesktop.org/drm/i915/kernel/-/issues/17500">i915#17500</a>) +3 =
other tests skip</li>
</ul></li>
<li>
<p>igt@kms_big_fb@y-tiled-16bpp-rotate-90:</p><ul>
<li>shard-glk:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/Patchwork_169493v6/shard-glk3/igt@kms_big_fb@y-tiled-16bpp-ro=
tate-90.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/=
kernel/-/issues/17500">i915#17500</a>) +4 other tests skip</li>
</ul></li>
<li>
<p>igt@kms_big_fb@yf-tiled-16bpp-rotate-180:</p><ul>
<li>shard-dg1:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/Patchwork_169493v6/shard-dg1-14/igt@kms_big_fb@yf-tiled-16bpp=
-rotate-180.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i=
915/kernel/-/issues/4538">i915#4538</a>) +4 other tests skip</li>
</ul></li>
<li>
<p>igt@kms_big_fb@yf-tiled-32bpp-rotate-270:</p><ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/Patchwork_169493v6/shard-mtlp-6/igt@kms_big_fb@yf-tiled-32bpp=
-rotate-270.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i=
915/kernel/-/issues/17432">i915#17432</a>)</li>
</ul></li>
<li>
<p>igt@kms_big_fb@yf-tiled-64bpp-rotate-0:</p><ul>
<li>shard-dg2:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/Patchwork_169493v6/shard-dg2-7/igt@kms_big_fb@yf-tiled-64bpp-=
rotate-0.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915=
/kernel/-/issues/17356">i915#17356</a> / <a href=3D"https://gitlab.freedesk=
top.org/drm/i915/kernel/-/issues/5190">i915#5190</a>)</li>
</ul></li>
<li>
<p>igt@kms_big_fb@yf-tiled-addfb-size-offset-overflow:</p><ul>
<li>shard-tglu-1:       NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/Patchwork_169493v6/shard-tglu-1/igt@kms_big_fb@yf-tiled-addfb=
-size-offset-overflow.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop=
.org/drm/i915/kernel/-/issues/17432">i915#17432</a>) +4 other tests skip</l=
i>
</ul></li>
<li>
<p>igt@kms_big_fb@yf-tiled-addfb-size-overflow:</p><ul>
<li>shard-rkl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/Patchwork_169493v6/shard-rkl-5/igt@kms_big_fb@yf-tiled-addfb-=
size-overflow.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm=
/i915/kernel/-/issues/17432">i915#17432</a>)</li>
</ul></li>
<li>
<p>igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-180-async-flip:</p><u=
l>
<li>shard-rkl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/Patchwork_169493v6/shard-rkl-4/igt@kms_big_fb@yf-tiled-max-hw=
-stride-32bpp-rotate-180-async-flip.html">SKIP</a> (<a href=3D"https://gitl=
ab.freedesktop.org/drm/i915/kernel/-/issues/4538">i915#4538</a>) +5 other t=
ests skip</li>
</ul></li>
<li>
<p>igt@kms_big_fb@yf-tiled-max-hw-stride-64bpp-rotate-0-async-flip:</p><ul>
<li>shard-dg2:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/Patchwork_169493v6/shard-dg2-6/igt@kms_big_fb@yf-tiled-max-hw=
-stride-64bpp-rotate-0-async-flip.html">SKIP</a> (<a href=3D"https://gitlab=
.freedesktop.org/drm/i915/kernel/-/issues/4538">i915#4538</a> / <a href=3D"=
https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5190">i915#5190</a>=
)</li>
</ul></li>
<li>
<p>igt@kms_big_fb@yf-tiled-max-hw-stride-64bpp-rotate-180:</p><ul>
<li>shard-tglu:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/Patchwork_169493v6/shard-tglu-2/igt@kms_big_fb@yf-tiled-max-h=
w-stride-64bpp-rotate-180.html">SKIP</a> (<a href=3D"https://gitlab.freedes=
ktop.org/drm/i915/kernel/-/issues/17432">i915#17432</a>) +6 other tests ski=
p</li>
</ul></li>
<li>
<p>igt@kms_ccs@bad-aux-stride-y-tiled-ccs@pipe-c-hdmi-a-1:</p><ul>
<li>shard-tglu:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/Patchwork_169493v6/shard-tglu-10/igt@kms_ccs@bad-aux-stride-y=
-tiled-ccs@pipe-c-hdmi-a-1.html">SKIP</a> (<a href=3D"https://gitlab.freede=
sktop.org/drm/i915/kernel/-/issues/6095">i915#6095</a>) +84 other tests ski=
p</li>
</ul></li>
<li>
<p>igt@kms_ccs@bad-pixel-format-4-tiled-mtl-rc-ccs-cc:</p><ul>
<li>shard-tglu-1:       NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/Patchwork_169493v6/shard-tglu-1/igt@kms_ccs@bad-pixel-format-=
4-tiled-mtl-rc-ccs-cc.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop=
.org/drm/i915/kernel/-/issues/6095">i915#6095</a>) +39 other tests skip</li=
>
</ul></li>
<li>
<p>igt@kms_ccs@bad-pixel-format-y-tiled-gen12-mc-ccs:</p><ul>
<li>shard-dg2:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/Patchwork_169493v6/shard-dg2-7/igt@kms_ccs@bad-pixel-format-y=
-tiled-gen12-mc-ccs.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.o=
rg/drm/i915/kernel/-/issues/17356">i915#17356</a>) +17 other tests skip</li=
>
</ul></li>
<li>
<p>igt@kms_ccs@bad-pixel-format-y-tiled-gen12-rc-ccs-cc@pipe-a-edp-1:</p><u=
l>
<li>shard-mtlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/Patchwork_169493v6/shard-mtlp-6/igt@kms_ccs@bad-pixel-format-=
y-tiled-gen12-rc-ccs-cc@pipe-a-edp-1.html">SKIP</a> (<a href=3D"https://git=
lab.freedesktop.org/drm/i915/kernel/-/issues/6095">i915#6095</a>) +4 other =
tests skip</li>
</ul></li>
<li>
<p>igt@kms_ccs@bad-rotation-90-4-tiled-bmg-ccs:</p><ul>
<li>shard-glk10:        NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/Patchwork_169493v6/shard-glk10/igt@kms_ccs@bad-rotation-90-4-=
tiled-bmg-ccs.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm=
/i915/kernel/-/issues/17525">i915#17525</a>) +2 other tests skip</li>
</ul></li>
<li>
<p>igt@kms_ccs@bad-rotation-90-4-tiled-dg2-mc-ccs@pipe-a-hdmi-a-2:</p><ul>
<li>shard-rkl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/Patchwork_169493v6/shard-rkl-6/igt@kms_ccs@bad-rotation-90-4-=
tiled-dg2-mc-ccs@pipe-a-hdmi-a-2.html">SKIP</a> (<a href=3D"https://gitlab.=
freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a> / <a href=3D=
"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6095">i915#6095</a=
>) +3 other tests skip</li>
</ul></li>
<li>
<p>igt@kms_ccs@bad-rotation-90-4-tiled-dg2-mc-ccs@pipe-c-hdmi-a-2:</p><ul>
<li>shard-rkl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/Patchwork_169493v6/shard-rkl-6/igt@kms_ccs@bad-rotation-90-4-=
tiled-dg2-mc-ccs@pipe-c-hdmi-a-2.html">SKIP</a> (<a href=3D"https://gitlab.=
freedesktop.org/drm/i915/kernel/-/issues/14098">i915#14098</a> / <a href=3D=
"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14544<=
/a> / <a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/60=
95">i915#6095</a>) +1 other test skip</li>
</ul></li>
<li>
<p>igt@kms_ccs@bad-rotation-90-4-tiled-mtl-mc-ccs:</p><ul>
<li>shard-glk11:        NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/Patchwork_169493v6/shard-glk11/igt@kms_ccs@bad-rotation-90-4-=
tiled-mtl-mc-ccs.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/=
drm/i915/kernel/-/issues/17490">i915#17490</a>) +7 other tests skip</li>
</ul></li>
<li>
<p>igt@kms_ccs@bad-rotation-90-4-tiled-mtl-rc-ccs-cc@pipe-b-hdmi-a-4:</p><u=
l>
<li>shard-dg1:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/Patchwork_169493v6/shard-dg1-17/igt@kms_ccs@bad-rotation-90-4=
-tiled-mtl-rc-ccs-cc@pipe-b-hdmi-a-4.html">SKIP</a> (<a href=3D"https://git=
lab.freedesktop.org/drm/i915/kernel/-/issues/6095">i915#6095</a>) +151 othe=
r tests skip</li>
</ul></li>
<li>
<p>igt@kms_ccs@crc-primary-rotation-180-4-tiled-dg2-mc-ccs@pipe-c-hdmi-a-2:=
</p><ul>
<li>shard-glk10:        NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/Patchwork_169493v6/shard-glk10/igt@kms_ccs@crc-primary-rotati=
on-180-4-tiled-dg2-mc-ccs@pipe-c-hdmi-a-2.html">SKIP</a> (<a href=3D"https:=
//gitlab.freedesktop.org/drm/i915/kernel/-/issues/17490">i915#17490</a>) +1=
7 other tests skip</li>
</ul></li>
<li>
<p>igt@kms_ccs@crc-primary-rotation-180-4-tiled-mtl-mc-ccs@pipe-a-hdmi-a-3:=
</p><ul>
<li>shard-dg2:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/Patchwork_169493v6/shard-dg2-8/igt@kms_ccs@crc-primary-rotati=
on-180-4-tiled-mtl-mc-ccs@pipe-a-hdmi-a-3.html">SKIP</a> (<a href=3D"https:=
//gitlab.freedesktop.org/drm/i915/kernel/-/issues/10307">i915#10307</a> / <=
a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6095">i91=
5#6095</a>) +74 other tests skip</li>
</ul></li>
<li>
<p>igt@kms_ccs@crc-primary-rotation-180-4-tiled-mtl-mc-ccs@pipe-a-hdmi-a-4:=
</p><ul>
<li>shard-dg1:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/Patchwork_169493v6/shard-dg1-18/igt@kms_ccs@crc-primary-rotat=
ion-180-4-tiled-mtl-mc-ccs@pipe-a-hdmi-a-4.html">SKIP</a> (<a href=3D"https=
://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4423">i915#4423</a> / <a=
 href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6095">i915=
#6095</a>)</li>
</ul></li>
<li>
<p>igt@kms_ccs@crc-primary-rotation-180-4-tiled-mtl-rc-ccs-cc:</p><ul>
<li>shard-glk:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/Patchwork_169493v6/shard-glk3/igt@kms_ccs@crc-primary-rotatio=
n-180-4-tiled-mtl-rc-ccs-cc.html">SKIP</a> (<a href=3D"https://gitlab.freed=
esktop.org/drm/i915/kernel/-/issues/17490">i915#17490</a>) +15 other tests =
skip</li>
</ul></li>
<li>
<p>igt@kms_ccs@crc-primary-rotation-180-y-tiled-ccs@pipe-c-hdmi-a-1:</p><ul=
>
<li>shard-glk11:        NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/Patchwork_169493v6/shard-glk11/igt@kms_ccs@crc-primary-rotati=
on-180-y-tiled-ccs@pipe-c-hdmi-a-1.html">SKIP</a> (<a href=3D"https://gitla=
b.freedesktop.org/drm/i915/kernel/-/issues/17491">i915#17491</a>) +23 other=
 tests skip</li>
</ul></li>
<li>
<p>igt@kms_ccs@crc-primary-suspend-4-tiled-bmg-ccs:</p><ul>
<li>shard-rkl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/Patchwork_169493v6/shard-rkl-7/igt@kms_ccs@crc-primary-suspen=
d-4-tiled-bmg-ccs.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org=
/drm/i915/kernel/-/issues/12805">i915#12805</a>)</li>
<li>shard-tglu-1:       NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/Patchwork_169493v6/shard-tglu-1/igt@kms_ccs@crc-primary-suspe=
nd-4-tiled-bmg-ccs.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.or=
g/drm/i915/kernel/-/issues/12805">i915#12805</a>) +1 other test skip</li>
</ul></li>
<li>
<p>igt@kms_ccs@crc-primary-suspend-4-tiled-lnl-ccs:</p><ul>
<li>shard-glk:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/Patchwork_169493v6/shard-glk3/igt@kms_ccs@crc-primary-suspend=
-4-tiled-lnl-ccs.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/=
drm/i915/kernel/-/issues/17525">i915#17525</a>)</li>
<li>shard-dg1:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/Patchwork_169493v6/shard-dg1-14/igt@kms_ccs@crc-primary-suspe=
nd-4-tiled-lnl-ccs.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.or=
g/drm/i915/kernel/-/issues/12805">i915#12805</a>)</li>
</ul></li>
<li>
<p>igt@kms_ccs@crc-primary-suspend-4-tiled-mtl-mc-ccs@pipe-d-edp-1:</p><ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/Patchwork_169493v6/shard-mtlp-6/igt@kms_ccs@crc-primary-suspe=
nd-4-tiled-mtl-mc-ccs@pipe-d-edp-1.html">INCOMPLETE</a> (<a href=3D"https:/=
/gitlab.freedesktop.org/drm/i915/kernel/-/issues/15582">i915#15582</a>)</li=
>
</ul></li>
<li>
<p>igt@kms_ccs@crc-primary-suspend-4-tiled-mtl-rc-ccs@pipe-a-hdmi-a-3:</p><=
ul>
<li>shard-dg2:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/Patchwork_169493v6/shard-dg2-5/igt@kms_ccs@crc-primary-suspen=
d-4-tiled-mtl-rc-ccs@pipe-a-hdmi-a-3.html">SKIP</a> (<a href=3D"https://git=
lab.freedesktop.org/drm/i915/kernel/-/issues/6095">i915#6095</a>) +7 other =
tests skip</li>
</ul></li>
<li>
<p>igt@kms_ccs@crc-primary-suspend-y-tiled-gen12-rc-ccs:</p><ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_19395/shard-rkl-2/igt@kms_ccs@crc-primary-suspend-y-tiled-gen12-rc-=
ccs.html">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-ti=
p/Patchwork_169493v6/shard-rkl-4/igt@kms_ccs@crc-primary-suspend-y-tiled-ge=
n12-rc-ccs.html">INCOMPLETE</a> (<a href=3D"https://gitlab.freedesktop.org/=
drm/i915/kernel/-/issues/15582">i915#15582</a>)</li>
</ul></li>
<li>
<p>igt@kms_ccs@crc-primary-suspend-y-tiled-gen12-rc-ccs@pipe-a-hdmi-a-2:</p=
><ul>
<li>shard-rkl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/Patchwork_169493v6/shard-rkl-4/igt@kms_ccs@crc-primary-suspen=
d-y-tiled-gen12-rc-ccs@pipe-a-hdmi-a-2.html">INCOMPLETE</a> (<a href=3D"htt=
ps://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15582">i915#15582</a>)=
</li>
</ul></li>
<li>
<p>igt@kms_ccs@crc-primary-suspend-yf-tiled-ccs:</p><ul>
<li>shard-rkl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/Patchwork_169493v6/shard-rkl-4/igt@kms_ccs@crc-primary-suspen=
d-yf-tiled-ccs.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/dr=
m/i915/kernel/-/issues/14098">i915#14098</a> / <a href=3D"https://gitlab.fr=
eedesktop.org/drm/i915/kernel/-/issues/6095">i915#6095</a>) +51 other tests=
 skip</li>
</ul></li>
<li>
<p>igt@kms_ccs@crc-sprite-planes-basic-4-tiled-bmg-ccs:</p><ul>
<li>shard-tglu-1:       NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/Patchwork_169493v6/shard-tglu-1/igt@kms_ccs@crc-sprite-planes=
-basic-4-tiled-bmg-ccs.html">SKIP</a> (<a href=3D"https://gitlab.freedeskto=
p.org/drm/i915/kernel/-/issues/12313">i915#12313</a>)</li>
</ul></li>
<li>
<p>igt@kms_ccs@crc-sprite-planes-basic-4-tiled-lnl-ccs:</p><ul>
<li>shard-tglu:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/Patchwork_169493v6/shard-tglu-10/igt@kms_ccs@crc-sprite-plane=
s-basic-4-tiled-lnl-ccs.html">SKIP</a> (<a href=3D"https://gitlab.freedeskt=
op.org/drm/i915/kernel/-/issues/12313">i915#12313</a>) +1 other test skip</=
li>
</ul></li>
<li>
<p>igt@kms_ccs@crc-sprite-planes-basic-y-tiled-gen12-rc-ccs@pipe-d-hdmi-a-1=
:</p><ul>
<li>shard-dg2:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/Patchwork_169493v6/shard-dg2-4/igt@kms_ccs@crc-sprite-planes-=
basic-y-tiled-gen12-rc-ccs@pipe-d-hdmi-a-1.html">SKIP</a> (<a href=3D"https=
://gitlab.freedesktop.org/drm/i915/kernel/-/issues/10307">i915#10307</a> / =
<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/10434">i=
915#10434</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-=
/issues/6095">i915#6095</a>)</li>
</ul></li>
<li>
<p>igt@kms_ccs@random-ccs-data-4-tiled-bmg-ccs:</p><ul>
<li>shard-rkl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/Patchwork_169493v6/shard-rkl-4/igt@kms_ccs@random-ccs-data-4-=
tiled-bmg-ccs.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm=
/i915/kernel/-/issues/12313">i915#12313</a>) +1 other test skip</li>
</ul></li>
<li>
<p>igt@kms_ccs@random-ccs-data-4-tiled-mtl-mc-ccs@pipe-c-hdmi-a-1:</p><ul>
<li>shard-glk10:        NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/Patchwork_169493v6/shard-glk10/igt@kms_ccs@random-ccs-data-4-=
tiled-mtl-mc-ccs@pipe-c-hdmi-a-1.html">SKIP</a> (<a href=3D"https://gitlab.=
freedesktop.org/drm/i915/kernel/-/issues/17491">i915#17491</a>) +46 other t=
ests skip</li>
</ul></li>
<li>
<p>igt@kms_ccs@random-ccs-data-4-tiled-mtl-rc-ccs@pipe-b-hdmi-a-2:</p><ul>
<li>shard-rkl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/Patchwork_169493v6/shard-rkl-7/igt@kms_ccs@random-ccs-data-4-=
tiled-mtl-rc-ccs@pipe-b-hdmi-a-2.html">SKIP</a> (<a href=3D"https://gitlab.=
freedesktop.org/drm/i915/kernel/-/issues/6095">i915#6095</a>) +71 other tes=
ts skip</li>
</ul></li>
<li>
<p>igt@kms_ccs@random-ccs-data-y-tiled-gen12-rc-ccs@pipe-a-hdmi-a-1:</p><ul=
>
<li>shard-glk:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/Patchwork_169493v6/shard-glk5/igt@kms_ccs@random-ccs-data-y-t=
iled-gen12-rc-ccs@pipe-a-hdmi-a-1.html">SKIP</a> (<a href=3D"https://gitlab=
.freedesktop.org/drm/i915/kernel/-/issues/17491">i915#17491</a>) +45 other =
tests skip</li>
</ul></li>
<li>
<p>igt@kms_cdclk@mode-transition-all-outputs:</p><ul>
<li>shard-rkl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/Patchwork_169493v6/shard-rkl-8/igt@kms_cdclk@mode-transition-=
all-outputs.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i=
915/kernel/-/issues/3742">i915#3742</a>)</li>
<li>shard-tglu-1:       NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/Patchwork_169493v6/shard-tglu-1/igt@kms_cdclk@mode-transition=
-all-outputs.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/=
i915/kernel/-/issues/3742">i915#3742</a>)</li>
</ul></li>
<li>
<p>igt@kms_cdclk@plane-scaling@pipe-c-edp-1:</p><ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/Patchwork_169493v6/shard-mtlp-6/igt@kms_cdclk@plane-scaling@p=
ipe-c-edp-1.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i=
915/kernel/-/issues/13781">i915#13781</a>) +4 other tests skip</li>
</ul></li>
<li>
<p>igt@kms_cdclk@plane-scaling@pipe-c-hdmi-a-3:</p><ul>
<li>shard-dg2:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/Patchwork_169493v6/shard-dg2-5/igt@kms_cdclk@plane-scaling@pi=
pe-c-hdmi-a-3.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm=
/i915/kernel/-/issues/13781">i915#13781</a>) +3 other tests skip</li>
</ul></li>
<li>
<p>igt@kms_chamelium_audio@dp-audio-after-suspend:</p><ul>
<li>shard-glk10:        NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/Patchwork_169493v6/shard-glk10/igt@kms_chamelium_audio@dp-aud=
io-after-suspend.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/=
drm/i915/kernel/-/issues/17483">i915#17483</a>) +7 other tests skip</li>
</ul></li>
<li>
<p>igt@kms_chamelium_audio@hdmi-audio-edid:</p><ul>
<li>shard-tglu:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/Patchwork_169493v6/shard-tglu-10/igt@kms_chamelium_audio@hdmi=
-audio-edid.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i=
915/kernel/-/issues/11151">i915#11151</a> / <a href=3D"https://gitlab.freed=
esktop.org/drm/i915/kernel/-/issues/7828">i915#7828</a>) +7 other tests ski=
p</li>
</ul></li>
<li>
<p>igt@kms_chamelium_color@ctm-0-50:</p><ul>
<li>shard-dg2:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/Patchwork_169493v6/shard-dg2-7/igt@kms_chamelium_color@ctm-0-=
50.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kerne=
l/-/issues/17427">i915#17427</a>)</li>
</ul></li>
<li>
<p>igt@kms_chamelium_color@ctm-blue-to-red:</p><ul>
<li>shard-glk11:        NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/Patchwork_169493v6/shard-glk11/igt@kms_chamelium_color@ctm-bl=
ue-to-red.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i91=
5/kernel/-/issues/17489">i915#17489</a>) +1 other test skip</li>
</ul></li>
<li>
<p>igt@kms_chamelium_color@degamma:</p><ul>
<li>shard-rkl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/Patchwork_169493v6/shard-rkl-5/igt@kms_chamelium_color@degamm=
a.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel=
/-/issues/17427">i915#17427</a>) +3 other tests skip</li>
</ul></li>
<li>
<p>igt@kms_chamelium_color_pipeline@plane-ctm3x4:</p><ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/Patchwork_169493v6/shard-mtlp-6/igt@kms_chamelium_color_pipel=
ine@plane-ctm3x4.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/=
drm/i915/kernel/-/issues/16464">i915#16464</a> / <a href=3D"https://gitlab.=
freedesktop.org/drm/i915/kernel/-/issues/16471">i915#16471</a> / <a href=3D=
"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17427">i915#17427<=
/a>)</li>
</ul></li>
<li>
<p>igt@kms_chamelium_color_pipeline@plane-fixed-matrix-yuv-rgb-bt2020-lut1d=
:</p><ul>
<li>shard-glk10:        NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/Patchwork_169493v6/shard-glk10/igt@kms_chamelium_color_pipeli=
ne@plane-fixed-matrix-yuv-rgb-bt2020-lut1d.html">SKIP</a> (<a href=3D"https=
://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17497">i915#17497</a>) +=
2 other tests skip</li>
</ul></li>
<li>
<p>igt@kms_chamelium_color_pipeline@plane-fixed-matrix-yuv-rgb-bt601-lim:</=
p><ul>
<li>shard-dg1:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/Patchwork_169493v6/shard-dg1-15/igt@kms_chamelium_color_pipel=
ine@plane-fixed-matrix-yuv-rgb-bt601-lim.html">SKIP</a> (<a href=3D"https:/=
/gitlab.freedesktop.org/drm/i915/kernel/-/issues/17427">i915#17427</a>) +3 =
other tests skip</li>
</ul></li>
<li>
<p>igt@kms_chamelium_color_pipeline@plane-fixed-matrix-yuv-rgb-bt601-lut1d:=
</p><ul>
<li>shard-tglu:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/Patchwork_169493v6/shard-tglu-10/igt@kms_chamelium_color_pipe=
line@plane-fixed-matrix-yuv-rgb-bt601-lut1d.html">SKIP</a> (<a href=3D"http=
s://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17427">i915#17427</a>) =
+4 other tests skip</li>
</ul></li>
<li>
<p>igt@kms_chamelium_color_pipeline@plane-lut1d-ctm3x4-lut1d:</p><ul>
<li>shard-rkl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/Patchwork_169493v6/shard-rkl-7/igt@kms_chamelium_color_pipeli=
ne@plane-lut1d-ctm3x4-lut1d.html">SKIP</a> (<a href=3D"https://gitlab.freed=
esktop.org/drm/i915/kernel/-/issues/16471">i915#16471</a> / <a href=3D"http=
s://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17427">i915#17427</a>) =
+2 other tests skip</li>
<li>shard-tglu-1:       NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/Patchwork_169493v6/shard-tglu-1/igt@kms_chamelium_color_pipel=
ine@plane-lut1d-ctm3x4-lut1d.html">SKIP</a> (<a href=3D"https://gitlab.free=
desktop.org/drm/i915/kernel/-/issues/16471">i915#16471</a> / <a href=3D"htt=
ps://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17427">i915#17427</a>)=
 +3 other tests skip</li>
</ul></li>
<li>
<p>igt@kms_chamelium_color_pipeline@plane-lut1d-post-ctm3x4:</p><ul>
<li>shard-dg1:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/Patchwork_169493v6/shard-dg1-14/igt@kms_chamelium_color_pipel=
ine@plane-lut1d-post-ctm3x4.html">SKIP</a> (<a href=3D"https://gitlab.freed=
esktop.org/drm/i915/kernel/-/issues/16471">i915#16471</a> / <a href=3D"http=
s://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17427">i915#17427</a>) =
+1 other test skip</li>
</ul></li>
<li>
<p>igt@kms_chamelium_color_pipeline@plane-lut3d-green-only:</p><ul>
<li>shard-glk:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/Patchwork_169493v6/shard-glk3/igt@kms_chamelium_color_pipelin=
e@plane-lut3d-green-only.html">SKIP</a> (<a href=3D"https://gitlab.freedesk=
top.org/drm/i915/kernel/-/issues/17497">i915#17497</a>) +3 other tests skip=
</li>
<li>shard-tglu:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/Patchwork_169493v6/shard-tglu-10/igt@kms_chamelium_color_pipe=
line@plane-lut3d-green-only.html">SKIP</a> (<a href=3D"https://gitlab.freed=
esktop.org/drm/i915/kernel/-/issues/16471">i915#16471</a> / <a href=3D"http=
s://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17427">i915#17427</a>)<=
/li>
</ul></li>
<li>
<p>igt@kms_chamelium_edid@hdmi-edid-read:</p><ul>
<li>shard-rkl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/Patchwork_169493v6/shard-rkl-2/igt@kms_chamelium_edid@hdmi-ed=
id-read.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/=
kernel/-/issues/11151">i915#11151</a> / <a href=3D"https://gitlab.freedeskt=
op.org/drm/i915/kernel/-/issues/7828">i915#7828</a>) +11 other tests skip</=
li>
<li>shard-dg1:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/Patchwork_169493v6/shard-dg1-15/igt@kms_chamelium_edid@hdmi-e=
did-read.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915=
/kernel/-/issues/11151">i915#11151</a> / <a href=3D"https://gitlab.freedesk=
top.org/drm/i915/kernel/-/issues/7828">i915#7828</a>) +4 other tests skip</=
li>
</ul></li>
<li>
<p>igt@kms_chamelium_edid@hdmi-edid-stress-resolution-non-4k:</p><ul>
<li>shard-dg2:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/Patchwork_169493v6/shard-dg2-7/igt@kms_chamelium_edid@hdmi-ed=
id-stress-resolution-non-4k.html">SKIP</a> (<a href=3D"https://gitlab.freed=
esktop.org/drm/i915/kernel/-/issues/11151">i915#11151</a> / <a href=3D"http=
s://gitlab.freedesktop.org/drm/i915/kernel/-/issues/7828">i915#7828</a>)</l=
i>
</ul></li>
<li>
<p>igt@kms_chamelium_hpd@dp-hpd-after-runtime-suspend-d3hot:</p><ul>
<li>shard-glk11:        NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/Patchwork_169493v6/shard-glk11/igt@kms_chamelium_hpd@dp-hpd-a=
fter-runtime-suspend-d3hot.html">SKIP</a> (<a href=3D"https://gitlab.freede=
sktop.org/drm/i915/kernel/-/issues/17483">i915#17483</a>) +3 other tests sk=
ip</li>
</ul></li>
<li>
<p>igt@kms_chamelium_hpd@dp-hpd-storm-disable:</p><ul>
<li>shard-tglu-1:       NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/Patchwork_169493v6/shard-tglu-1/igt@kms_chamelium_hpd@dp-hpd-=
storm-disable.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm=
/i915/kernel/-/issues/11151">i915#11151</a> / <a href=3D"https://gitlab.fre=
edesktop.org/drm/i915/kernel/-/issues/7828">i915#7828</a>) +4 other tests s=
kip</li>
</ul></li>
<li>
<p>igt@kms_chamelium_hpd@dp-hpd-with-enabled-mode:</p><ul>
<li>shard-glk:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/Patchwork_169493v6/shard-glk3/igt@kms_chamelium_hpd@dp-hpd-wi=
th-enabled-mode.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/d=
rm/i915/kernel/-/issues/17483">i915#17483</a>)</li>
</ul></li>
<li>
<p>igt@kms_chamelium_hpd@hdmi-hpd-after-runtime-suspend-d3hot:</p><ul>
<li>shard-tglu:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/Patchwork_169493v6/shard-tglu-8/igt@kms_chamelium_hpd@hdmi-hp=
d-after-runtime-suspend-d3hot.html">SKIP</a> (<a href=3D"https://gitlab.fre=
edesktop.org/drm/i915/kernel/-/issues/11151">i915#11151</a>)</li>
</ul></li>
<li>
<p>igt@kms_color@legacy-gamma-reset:</p><ul>
<li>shard-dg2:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_19395/shard-dg2-6/igt@kms_color@legacy-gamma-reset.html">PASS</a> -=
&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_169493v6=
/shard-dg2-7/igt@kms_color@legacy-gamma-reset.html">SKIP</a> (<a href=3D"ht=
tps://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12655">i915#12655</a>=
 / <a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17373=
">i915#17373</a>) +2 other tests skip</li>
</ul></li>
<li>
<p>igt@kms_color_pipeline@plane-fixed-matrix-yuv-rgb-bt601:</p><ul>
<li>shard-dg2:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_19395/shard-dg2-1/igt@kms_color_pipeline@plane-fixed-matrix-yuv-rgb=
-bt601.html">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm=
-tip/Patchwork_169493v6/shard-dg2-7/igt@kms_color_pipeline@plane-fixed-matr=
ix-yuv-rgb-bt601.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/=
drm/i915/kernel/-/issues/15529">i915#15529</a>)</li>
</ul></li>
<li>
<p>igt@kms_color_pipeline@plane-fixed-matrix-yuv-rgb-bt709:</p><ul>
<li>shard-glk11:        NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/Patchwork_169493v6/shard-glk11/igt@kms_color_pipeline@plane-f=
ixed-matrix-yuv-rgb-bt709.html">SKIP</a> (<a href=3D"https://gitlab.freedes=
ktop.org/drm/i915/kernel/-/issues/17510">i915#17510</a>)</li>
</ul></li>
<li>
<p>igt@kms_color_pipeline@plane-fixed-matrix-yuv-rgb-bt709-lut1d:</p><ul>
<li>shard-dg2:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/Patchwork_169493v6/shard-dg2-7/igt@kms_color_pipeline@plane-f=
ixed-matrix-yuv-rgb-bt709-lut1d.html">SKIP</a> (<a href=3D"https://gitlab.f=
reedesktop.org/drm/i915/kernel/-/issues/15529">i915#15529</a>)</li>
</ul></li>
<li>
<p>igt@kms_color_pipeline@plane-lut1d:</p><ul>
<li>shard-glk:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/Patchwork_169493v6/shard-glk3/igt@kms_color_pipeline@plane-lu=
t1d.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kern=
el/-/issues/17510">i915#17510</a>) +1 other test skip</li>
</ul></li>
<li>
<p>igt@kms_color_pipeline@plane-lut1d-ctm3x4:</p><ul>
<li>shard-glk10:        NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/Patchwork_169493v6/shard-glk10/igt@kms_color_pipeline@plane-l=
ut1d-ctm3x4.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i=
915/kernel/-/issues/17510">i915#17510</a>) +1 other test skip</li>
</ul></li>
<li>
<p>igt@kms_color_pipeline@plane-lut1d-ctm3x4-lut1d@pipe-d-plane-3:</p><ul>
<li>shard-tglu:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/Patchwork_169493v6/shard-tglu-10/igt@kms_color_pipeline@plane=
-lut1d-ctm3x4-lut1d@pipe-d-plane-3.html">SKIP</a> (<a href=3D"https://gitla=
b.freedesktop.org/drm/i915/kernel/-/issues/16990">i915#16990</a>) +47 other=
 tests skip</li>
</ul></li>
<li>
<p>igt@kms_color_pipeline@plane-lut1d-lut1d@pipe-a-plane-3:</p><ul>
<li>shard-rkl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/Patchwork_169493v6/shard-rkl-2/igt@kms_color_pipeline@plane-l=
ut1d-lut1d@pipe-a-plane-3.html">SKIP</a> (<a href=3D"https://gitlab.freedes=
ktop.org/drm/i915/kernel/-/issues/16990">i915#16990</a>) +5 other tests ski=
p</li>
</ul></li>
<li>
<p>igt@kms_color_pipeline@plane-lut1d-lut1d@pipe-b-plane-4:</p><ul>
<li>shard-dg1:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/Patchwork_169493v6/shard-dg1-15/igt@kms_color_pipeline@plane-=
lut1d-lut1d@pipe-b-plane-4.html">SKIP</a> (<a href=3D"https://gitlab.freede=
sktop.org/drm/i915/kernel/-/issues/16990">i915#16990</a>) +15 other tests s=
kip</li>
</ul></li>
<li>
<p>igt@kms_content_protection@content-type-change:</p><ul>
<li>shard-tglu:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/Patchwork_169493v6/shard-tglu-8/igt@kms_content_protection@co=
ntent-type-change.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org=
/drm/i915/kernel/-/issues/15865">i915#15865</a>) +3 other tests skip</li>
<li>shard-glk11:        NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/Patchwork_169493v6/shard-glk11/igt@kms_content_protection@con=
tent-type-change.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/=
drm/i915/kernel/-/issues/17508">i915#17508</a>) +1 other test skip</li>
</ul></li>
<li>
<p>igt@kms_content_protection@dp-mst-lic-type-1:</p><ul>
<li>shard-rkl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/Patchwork_169493v6/shard-rkl-5/igt@kms_content_protection@dp-=
mst-lic-type-1.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/dr=
m/i915/kernel/-/issues/15330">i915#15330</a> / <a href=3D"https://gitlab.fr=
eedesktop.org/drm/i915/kernel/-/issues/3116">i915#3116</a>)</li>
</ul></li>
<li>
<p>igt@kms_content_protection@dp-mst-type-0:</p><ul>
<li>shard-glk:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/Patchwork_169493v6/shard-glk3/igt@kms_content_protection@dp-m=
st-type-0.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i91=
5/kernel/-/issues/17502">i915#17502</a>)</li>
</ul></li>
<li>
<p>igt@kms_content_protection@dp-mst-type-0-hdcp14:</p><ul>
<li>shard-rkl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/Patchwork_169493v6/shard-rkl-4/igt@kms_content_protection@dp-=
mst-type-0-hdcp14.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org=
/drm/i915/kernel/-/issues/15330">i915#15330</a>)</li>
</ul></li>
<li>
<p>igt@kms_content_protection@dp-mst-type-1:</p><ul>
<li>shard-tglu:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/Patchwork_169493v6/shard-tglu-10/igt@kms_content_protection@d=
p-mst-type-1.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/=
i915/kernel/-/issues/15330">i915#15330</a> / <a href=3D"https://gitlab.free=
desktop.org/drm/i915/kernel/-/issues/3116">i915#3116</a> / <a href=3D"https=
://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3299">i915#3299</a>) +1 =
other test skip</li>
</ul></li>
<li>
<p>igt@kms_content_protection@dp-mst-type-1-suspend-resume:</p><ul>
<li>shard-glk10:        NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/Patchwork_169493v6/shard-glk10/igt@kms_content_protection@dp-=
mst-type-1-suspend-resume.html">SKIP</a> (<a href=3D"https://gitlab.freedes=
ktop.org/drm/i915/kernel/-/issues/17502">i915#17502</a>) +2 other tests ski=
p</li>
</ul></li>
<li>
<p>igt@kms_content_protection@lic-type-1:</p><ul>
<li>shard-glk:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/Patchwork_169493v6/shard-glk6/igt@kms_content_protection@lic-=
type-1.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/k=
ernel/-/issues/17508">i915#17508</a>)</li>
</ul></li>
<li>
<p>igt@kms_content_protection@srm:</p><ul>
<li>shard-glk10:        NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/Patchwork_169493v6/shard-glk10/igt@kms_content_protection@srm=
.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/=
-/issues/17508">i915#17508</a>)</li>
</ul></li>
<li>
<p>igt@kms_content_protection@uevent:</p><ul>
<li>shard-rkl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/Patchwork_169493v6/shard-rkl-4/igt@kms_content_protection@uev=
ent.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kern=
el/-/issues/15865">i915#15865</a>)</li>
</ul></li>
<li>
<p>igt@kms_cursor_crc@cursor-offscreen-32x32:</p><ul>
<li>shard-tglu-1:       NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/Patchwork_169493v6/shard-tglu-1/igt@kms_cursor_crc@cursor-off=
screen-32x32.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/=
i915/kernel/-/issues/3555">i915#3555</a>) +1 other test skip</li>
</ul></li>
<li>
<p>igt@kms_cursor_crc@cursor-offscreen-512x170:</p><ul>
<li>shard-glk10:        NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/Patchwork_169493v6/shard-glk10/igt@kms_cursor_crc@cursor-offs=
creen-512x170.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm=
/i915/kernel/-/issues/17533">i915#17533</a>)</li>
</ul></li>
<li>
<p>igt@kms_cursor_crc@cursor-onscreen-256x85:</p><ul>
<li>shard-tglu:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/Patchwork_169493v6/shard-tglu-2/igt@kms_cursor_crc@cursor-ons=
creen-256x85.html">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/=
i915/kernel/-/issues/13566">i915#13566</a>) +3 other tests fail</li>
</ul></li>
<li>
<p>igt@kms_cursor_crc@cursor-onscreen-32x10:</p><ul>
<li>shard-glk11:        NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/Patchwork_169493v6/shard-glk11/igt@kms_cursor_crc@cursor-onsc=
reen-32x10.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i9=
15/kernel/-/issues/17504">i915#17504</a>)</li>
</ul></li>
<li>
<p>igt@kms_cursor_crc@cursor-onscreen-32x32:</p><ul>
<li>shard-rkl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/Patchwork_169493v6/shard-rkl-2/igt@kms_cursor_crc@cursor-onsc=
reen-32x32.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i9=
15/kernel/-/issues/3555">i915#3555</a>) +6 other tests skip</li>
<li>shard-dg1:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/Patchwork_169493v6/shard-dg1-15/igt@kms_cursor_crc@cursor-ons=
creen-32x32.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i=
915/kernel/-/issues/3555">i915#3555</a>) +3 other tests skip</li>
</ul></li>
<li>
<p>igt@kms_cursor_crc@cursor-onscreen-64x21@pipe-a-hdmi-a-1:</p><ul>
<li>shard-tglu:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_19395/shard-tglu-2/igt@kms_cursor_crc@cursor-onscreen-64x21@pipe-a-=
hdmi-a-1.html">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/d=
rm-tip/Patchwork_169493v6/shard-tglu-4/igt@kms_cursor_crc@cursor-onscreen-6=
4x21@pipe-a-hdmi-a-1.html">FAIL</a> (<a href=3D"https://gitlab.freedesktop.=
org/drm/i915/kernel/-/issues/13566">i915#13566</a>) +1 other test fail</li>
</ul></li>
<li>
<p>igt@kms_cursor_crc@cursor-random-128x128:</p><ul>
<li>shard-dg1:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_19395/shard-dg1-19/igt@kms_cursor_crc@cursor-random-128x128.html">P=
ASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork=
_169493v6/shard-dg1-19/igt@kms_cursor_crc@cursor-random-128x128.html">DMESG=
-WARN</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issu=
es/4423">i915#4423</a>) +1 other test dmesg-warn</li>
</ul></li>
<li>
<p>igt@kms_cursor_crc@cursor-random-128x42:</p><ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_19395/shard-rkl-7/igt@kms_cursor_crc@cursor-random-128x42.html">PAS=
S</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_1=
69493v6/shard-rkl-1/igt@kms_cursor_crc@cursor-random-128x42.html">FAIL</a> =
(<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13566">=
i915#13566</a>) +3 other tests fail</li>
</ul></li>
<li>
<p>igt@kms_cursor_crc@cursor-random-512x170:</p><ul>
<li>shard-tglu-1:       NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/Patchwork_169493v6/shard-tglu-1/igt@kms_cursor_crc@cursor-ran=
dom-512x170.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i=
915/kernel/-/issues/13049">i915#13049</a>) +2 other tests skip</li>
<li>shard-dg1:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/Patchwork_169493v6/shard-dg1-14/igt@kms_cursor_crc@cursor-ran=
dom-512x170.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i=
915/kernel/-/issues/13049">i915#13049</a>)</li>
<li>shard-glk:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/Patchwork_169493v6/shard-glk3/igt@kms_cursor_crc@cursor-rando=
m-512x170.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i91=
5/kernel/-/issues/17533">i915#17533</a>)</li>
</ul></li>
<li>
<p>igt@kms_cursor_crc@cursor-random-512x512:</p><ul>
<li>shard-rkl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/Patchwork_169493v6/shard-rkl-4/igt@kms_cursor_crc@cursor-rand=
om-512x512.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i9=
15/kernel/-/issues/13049">i915#13049</a>) +3 other tests skip</li>
</ul></li>
<li>
<p>igt@kms_cursor_crc@cursor-rapid-movement-32x10:</p><ul>
<li>shard-tglu:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/Patchwork_169493v6/shard-tglu-10/igt@kms_cursor_crc@cursor-ra=
pid-movement-32x10.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.or=
g/drm/i915/kernel/-/issues/3555">i915#3555</a>) +3 other tests skip</li>
<li>shard-glk:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/Patchwork_169493v6/shard-glk3/igt@kms_cursor_crc@cursor-rapid=
-movement-32x10.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/d=
rm/i915/kernel/-/issues/17504">i915#17504</a>)</li>
</ul></li>
<li>
<p>igt@kms_cursor_crc@cursor-rapid-movement-512x512:</p><ul>
<li>shard-tglu:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/Patchwork_169493v6/shard-tglu-2/igt@kms_cursor_crc@cursor-rap=
id-movement-512x512.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.o=
rg/drm/i915/kernel/-/issues/13049">i915#13049</a>) +2 other tests skip</li>
</ul></li>
<li>
<p>igt@kms_cursor_crc@cursor-sliding-128x42@pipe-a-hdmi-a-1:</p><ul>
<li>shard-rkl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/Patchwork_169493v6/shard-rkl-5/igt@kms_cursor_crc@cursor-slid=
ing-128x42@pipe-a-hdmi-a-1.html">FAIL</a> (<a href=3D"https://gitlab.freede=
sktop.org/drm/i915/kernel/-/issues/13566">i915#13566</a>) +2 other tests fa=
il</li>
</ul></li>
<li>
<p>igt@kms_cursor_crc@cursor-sliding-512x170:</p><ul>
<li>shard-glk11:        NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/Patchwork_169493v6/shard-glk11/igt@kms_cursor_crc@cursor-slid=
ing-512x170.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i=
915/kernel/-/issues/17533">i915#17533</a>)</li>
</ul></li>
<li>
<p>igt@kms_cursor_crc@cursor-sliding-max-size:</p><ul>
<li>shard-glk10:        NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/Patchwork_169493v6/shard-glk10/igt@kms_cursor_crc@cursor-slid=
ing-max-size.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/=
i915/kernel/-/issues/17504">i915#17504</a>) +1 other test skip</li>
</ul></li>
<li>
<p>igt@kms_cursor_crc@cursor-suspend:</p><ul>
<li>shard-glk10:        NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/Patchwork_169493v6/shard-glk10/igt@kms_cursor_crc@cursor-susp=
end.html">INCOMPLETE</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i91=
5/kernel/-/issues/12358">i915#12358</a> / <a href=3D"https://gitlab.freedes=
ktop.org/drm/i915/kernel/-/issues/13356">i915#13356</a> / <a href=3D"https:=
//gitlab.freedesktop.org/drm/i915/kernel/-/issues/14152">i915#14152</a> / <=
a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/7882">i91=
5#7882</a>)</li>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_19395/shard-rkl-5/igt@kms_cursor_crc@cursor-suspend.html">PASS</a> =
-&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_169493v=
6/shard-rkl-3/igt@kms_cursor_crc@cursor-suspend.html">INCOMPLETE</a> (<a hr=
ef=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12358">i915#1=
2358</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issu=
es/14152">i915#14152</a>)</li>
</ul></li>
<li>
<p>igt@kms_cursor_crc@cursor-suspend@pipe-a-hdmi-a-1:</p><ul>
<li>shard-glk10:        NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/Patchwork_169493v6/shard-glk10/igt@kms_cursor_crc@cursor-susp=
end@pipe-a-hdmi-a-1.html">INCOMPLETE</a> (<a href=3D"https://gitlab.freedes=
ktop.org/drm/i915/kernel/-/issues/12358">i915#12358</a> / <a href=3D"https:=
//gitlab.freedesktop.org/drm/i915/kernel/-/issues/13356">i915#13356</a> / <=
a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14152">i9=
15#14152</a>)</li>
</ul></li>
<li>
<p>igt@kms_cursor_crc@cursor-suspend@pipe-a-hdmi-a-2:</p><ul>
<li>shard-rkl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/Patchwork_169493v6/shard-rkl-3/igt@kms_cursor_crc@cursor-susp=
end@pipe-a-hdmi-a-2.html">INCOMPLETE</a> (<a href=3D"https://gitlab.freedes=
ktop.org/drm/i915/kernel/-/issues/12358">i915#12358</a> / <a href=3D"https:=
//gitlab.freedesktop.org/drm/i915/kernel/-/issues/14152">i915#14152</a>)</l=
i>
</ul></li>
<li>
<p>igt@kms_cursor_legacy@2x-flip-vs-cursor-legacy:</p><ul>
<li>shard-tglu:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/Patchwork_169493v6/shard-tglu-2/igt@kms_cursor_legacy@2x-flip=
-vs-cursor-legacy.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org=
/drm/i915/kernel/-/issues/17428">i915#17428</a> / <a href=3D"https://gitlab=
.freedesktop.org/drm/i915/kernel/-/issues/17454">i915#17454</a>) +8 other t=
ests skip</li>
</ul></li>
<li>
<p>igt@kms_cursor_legacy@basic-busy-flip-before-cursor-atomic:</p><ul>
<li>shard-glk10:        NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/Patchwork_169493v6/shard-glk10/igt@kms_cursor_legacy@basic-bu=
sy-flip-before-cursor-atomic.html">SKIP</a> (<a href=3D"https://gitlab.free=
desktop.org/drm/i915/kernel/-/issues/17457">i915#17457</a>)</li>
</ul></li>
<li>
<p>igt@kms_cursor_legacy@basic-busy-flip-before-cursor-legacy:</p><ul>
<li>shard-rkl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/Patchwork_169493v6/shard-rkl-4/igt@kms_cursor_legacy@basic-bu=
sy-flip-before-cursor-legacy.html">SKIP</a> (<a href=3D"https://gitlab.free=
desktop.org/drm/i915/kernel/-/issues/4103">i915#4103</a>)</li>
</ul></li>
<li>
<p>igt@kms_cursor_legacy@cursorb-vs-flipa-varying-size:</p><ul>
<li>shard-tglu-1:       NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/Patchwork_169493v6/shard-tglu-1/igt@kms_cursor_legacy@cursorb=
-vs-flipa-varying-size.html">SKIP</a> (<a href=3D"https://gitlab.freedeskto=
p.org/drm/i915/kernel/-/issues/17428">i915#17428</a> / <a href=3D"https://g=
itlab.freedesktop.org/drm/i915/kernel/-/issues/17454">i915#17454</a>) +1 ot=
her test skip</li>
</ul></li>
<li>
<p>igt@kms_cursor_legacy@flip-vs-cursor-atomic-transitions:</p><ul>
<li>shard-glk:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_19395/shard-glk9/igt@kms_cursor_legacy@flip-vs-cursor-atomic-transi=
tions.html">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-=
tip/Patchwork_169493v6/shard-glk3/igt@kms_cursor_legacy@flip-vs-cursor-atom=
ic-transitions.html">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/dr=
m/i915/kernel/-/issues/15804">i915#15804</a>)</li>
</ul></li>
<li>
<p>igt@kms_cursor_legacy@short-busy-flip-before-cursor-atomic-transitions:<=
/p><ul>
<li>shard-glk11:        NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/Patchwork_169493v6/shard-glk11/igt@kms_cursor_legacy@short-bu=
sy-flip-before-cursor-atomic-transitions.html">SKIP</a> (<a href=3D"https:/=
/gitlab.freedesktop.org/drm/i915/kernel/-/issues/17457">i915#17457</a>)</li=
>
</ul></li>
<li>
<p>igt@kms_cursor_legacy@short-busy-flip-before-cursor-toggle:</p><ul>
<li>shard-glk:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/Patchwork_169493v6/shard-glk3/igt@kms_cursor_legacy@short-bus=
y-flip-before-cursor-toggle.html">SKIP</a> (<a href=3D"https://gitlab.freed=
esktop.org/drm/i915/kernel/-/issues/17457">i915#17457</a>)</li>
<li>shard-tglu:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/Patchwork_169493v6/shard-tglu-10/igt@kms_cursor_legacy@short-=
busy-flip-before-cursor-toggle.html">SKIP</a> (<a href=3D"https://gitlab.fr=
eedesktop.org/drm/i915/kernel/-/issues/4103">i915#4103</a>) +1 other test s=
kip</li>
</ul></li>
<li>
<p>igt@kms_dirtyfb@psr-dirtyfb-ioctl:</p><ul>
<li>shard-glk10:        NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/Patchwork_169493v6/shard-glk10/igt@kms_dirtyfb@psr-dirtyfb-io=
ctl.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kern=
el/-/issues/17515">i915#17515</a>)</li>
</ul></li>
<li>
<p>igt@kms_display_modes@extended-mode-basic:</p><ul>
<li>shard-rkl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/Patchwork_169493v6/shard-rkl-8/igt@kms_display_modes@extended=
-mode-basic.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i=
915/kernel/-/issues/13691">i915#13691</a>)</li>
<li>shard-tglu-1:       NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/Patchwork_169493v6/shard-tglu-1/igt@kms_display_modes@extende=
d-mode-basic.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/=
i915/kernel/-/issues/13691">i915#13691</a>)</li>
</ul></li>
<li>
<p>igt@kms_dither@fb-8bpc-vs-panel-6bpc@pipe-a-hdmi-a-1:</p><ul>
<li>shard-rkl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/Patchwork_169493v6/shard-rkl-5/igt@kms_dither@fb-8bpc-vs-pane=
l-6bpc@pipe-a-hdmi-a-1.html">SKIP</a> (<a href=3D"https://gitlab.freedeskto=
p.org/drm/i915/kernel/-/issues/3804">i915#3804</a>)</li>
</ul></li>
<li>
<p>igt@kms_dp_aux_dev@basic:</p><ul>
<li>shard-tglu:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/Patchwork_169493v6/shard-tglu-10/igt@kms_dp_aux_dev@basic.htm=
l">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/is=
sues/1257">i915#1257</a>)</li>
</ul></li>
<li>
<p>igt@kms_dp_link_training@non-uhbr-mst:</p><ul>
<li>shard-dg1:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/Patchwork_169493v6/shard-dg1-18/igt@kms_dp_link_training@non-=
uhbr-mst.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915=
/kernel/-/issues/17289">i915#17289</a>)</li>
</ul></li>
<li>
<p>igt@kms_dp_link_training@non-uhbr-mst-tbtalt-train:</p><ul>
<li>shard-rkl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/Patchwork_169493v6/shard-rkl-4/igt@kms_dp_link_training@non-u=
hbr-mst-tbtalt-train.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.=
org/drm/i915/kernel/-/issues/17291">i915#17291</a>)</li>
</ul></li>
<li>
<p>igt@kms_dp_link_training@non-uhbr-sst-direct-train:</p><ul>
<li>shard-glk:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/Patchwork_169493v6/shard-glk6/igt@kms_dp_link_training@non-uh=
br-sst-direct-train.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.o=
rg/drm/i915/kernel/-/issues/17506">i915#17506</a>)</li>
<li>shard-tglu:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/Patchwork_169493v6/shard-tglu-2/igt@kms_dp_link_training@non-=
uhbr-sst-direct-train.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop=
.org/drm/i915/kernel/-/issues/17286">i915#17286</a>)</li>
</ul></li>
<li>
<p>igt@kms_dp_link_training@non-uhbr-sst-tbtalt-train:</p><ul>
<li>shard-tglu:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/Patchwork_169493v6/shard-tglu-10/igt@kms_dp_link_training@non=
-uhbr-sst-tbtalt-train.html">SKIP</a> (<a href=3D"https://gitlab.freedeskto=
p.org/drm/i915/kernel/-/issues/17290">i915#17290</a>)</li>
<li>shard-glk:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/Patchwork_169493v6/shard-glk3/igt@kms_dp_link_training@non-uh=
br-sst-tbtalt-train.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.o=
rg/drm/i915/kernel/-/issues/17531">i915#17531</a>)</li>
</ul></li>
<li>
<p>igt@kms_dp_link_training@uhbr-mst-tbtalt-train:</p><ul>
<li>shard-glk11:        NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/Patchwork_169493v6/shard-glk11/igt@kms_dp_link_training@uhbr-=
mst-tbtalt-train.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/=
drm/i915/kernel/-/issues/17477">i915#17477</a>)</li>
</ul></li>
<li>
<p>igt@kms_dp_linktrain_fallback@dsc-fallback:</p><ul>
<li>shard-rkl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/Patchwork_169493v6/shard-rkl-7/igt@kms_dp_linktrain_fallback@=
dsc-fallback.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/=
i915/kernel/-/issues/13707">i915#13707</a>)</li>
<li>shard-tglu-1:       NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/Patchwork_169493v6/shard-tglu-1/igt@kms_dp_linktrain_fallback=
@dsc-fallback.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm=
/i915/kernel/-/issues/13707">i915#13707</a>)</li>
</ul></li>
<li>
<p>igt@kms_draw_crc@draw-method-mmap-gtt:</p><ul>
<li>shard-dg1:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/Patchwork_169493v6/shard-dg1-18/igt@kms_draw_crc@draw-method-=
mmap-gtt.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915=
/kernel/-/issues/8812">i915#8812</a>) +1 other test skip</li>
</ul></li>
<li>
<p>igt@kms_dsc@dsc-fractional-bpp:</p><ul>
<li>shard-tglu:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/Patchwork_169493v6/shard-tglu-10/igt@kms_dsc@dsc-fractional-b=
pp.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kerne=
l/-/issues/16361">i915#16361</a>) +5 other tests skip</li>
</ul></li>
<li>
<p>igt@kms_dsc@dsc-fractional-bpp-bigjoiner:</p><ul>
<li>shard-glk10:        NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/Patchwork_169493v6/shard-glk10/igt@kms_dsc@dsc-fractional-bpp=
-bigjoiner.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i9=
15/kernel/-/issues/17458">i915#17458</a>) +2 other tests skip</li>
</ul></li>
<li>
<p>igt@kms_dsc@dsc-with-bpc-bigjoiner:</p><ul>
<li>shard-tglu-1:       NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/Patchwork_169493v6/shard-tglu-1/igt@kms_dsc@dsc-with-bpc-bigj=
oiner.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/ke=
rnel/-/issues/16361">i915#16361</a>) +3 other tests skip</li>
</ul></li>
<li>
<p>igt@kms_dsc@dsc-with-bpc-ultrajoiner:</p><ul>
<li>shard-glk11:        NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/Patchwork_169493v6/shard-glk11/igt@kms_dsc@dsc-with-bpc-ultra=
joiner.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/k=
ernel/-/issues/17458">i915#17458</a>)</li>
</ul></li>
<li>
<p>igt@kms_dsc@dsc-with-output-formats-bigjoiner:</p><ul>
<li>shard-rkl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/Patchwork_169493v6/shard-rkl-2/igt@kms_dsc@dsc-with-output-fo=
rmats-bigjoiner.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/d=
rm/i915/kernel/-/issues/16361">i915#16361</a>) +3 other tests skip</li>
<li>shard-dg1:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/Patchwork_169493v6/shard-dg1-15/igt@kms_dsc@dsc-with-output-f=
ormats-bigjoiner.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/=
drm/i915/kernel/-/issues/16361">i915#16361</a>) +2 other tests skip</li>
</ul></li>
<li>
<p>igt@kms_dsc@dsc-with-output-formats-with-bpc:</p><ul>
<li>shard-glk:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/Patchwork_169493v6/shard-glk3/igt@kms_dsc@dsc-with-output-for=
mats-with-bpc.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm=
/i915/kernel/-/issues/17458">i915#17458</a>) +2 other tests skip</li>
</ul></li>
<li>
<p>igt@kms_fbcon_fbt@psr:</p><ul>
<li>shard-glk10:        NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/Patchwork_169493v6/shard-glk10/igt@kms_fbcon_fbt@psr.html">SK=
IP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/=
17516">i915#17516</a>)</li>
</ul></li>
<li>
<p>igt@kms_feature_discovery@chamelium:</p><ul>
<li>shard-rkl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/Patchwork_169493v6/shard-rkl-8/igt@kms_feature_discovery@cham=
elium.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/ke=
rnel/-/issues/16084">i915#16084</a>)</li>
<li>shard-tglu-1:       NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/Patchwork_169493v6/shard-tglu-1/igt@kms_feature_discovery@cha=
melium.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/k=
ernel/-/issues/2065">i915#2065</a>)</li>
</ul></li>
<li>
<p>igt@kms_feature_discovery@display-1x:</p><ul>
<li>shard-dg2:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_19395/shard-dg2-6/igt@kms_feature_discovery@display-1x.html">PASS</=
a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_1694=
93v6/shard-dg2-7/igt@kms_feature_discovery@display-1x.html">SKIP</a> (<a hr=
ef=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9738">i915#97=
38</a>)</li>
</ul></li>
<li>
<p>igt@kms_feature_discovery@display-3x:</p><ul>
<li>shard-rkl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/Patchwork_169493v6/shard-rkl-7/igt@kms_feature_discovery@disp=
lay-3x.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/k=
ernel/-/issues/16081">i915#16081</a>)</li>
<li>shard-tglu-1:       NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/Patchwork_169493v6/shard-tglu-1/igt@kms_feature_discovery@dis=
play-3x.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/=
kernel/-/issues/16081">i915#16081</a>)</li>
</ul></li>
<li>
<p>igt@kms_feature_discovery@dsc:</p><ul>
<li>shard-dg2:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/Patchwork_169493v6/shard-dg2-7/igt@kms_feature_discovery@dsc.=
html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-=
/issues/16600">i915#16600</a>)</li>
<li>shard-dg1:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/Patchwork_169493v6/shard-dg1-18/igt@kms_feature_discovery@dsc=
.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/=
-/issues/16600">i915#16600</a>)</li>
</ul></li>
<li>
<p>igt@kms_feature_discovery@hdr:</p><ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/Patchwork_169493v6/shard-mtlp-6/igt@kms_feature_discovery@hdr=
.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/=
-/issues/16600">i915#16600</a>)</li>
</ul></li>
<li>
<p>igt@kms_feature_discovery@psr2:</p><ul>
<li>shard-glk10:        NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/Patchwork_169493v6/shard-glk10/igt@kms_feature_discovery@psr2=
.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/=
-/issues/17585">i915#17585</a>)</li>
</ul></li>
<li>
<p>igt@kms_feature_discovery@vrr:</p><ul>
<li>shard-tglu:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/Patchwork_169493v6/shard-tglu-10/igt@kms_feature_discovery@vr=
r.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel=
/-/issues/16600">i915#16600</a>)</li>
</ul></li>
<li>
<p>igt@kms_flip@2x-flip-vs-fences-interruptible:</p><ul>
<li>shard-dg1:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/Patchwork_169493v6/shard-dg1-15/igt@kms_flip@2x-flip-vs-fence=
s-interruptible.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/d=
rm/i915/kernel/-/issues/8381">i915#8381</a>)</li>
</ul></li>
<li>
<p>igt@kms_flip@2x-flip-vs-panning-vs-hang:</p><ul>
<li>shard-dg2:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/Patchwork_169493v6/shard-dg2-7/igt@kms_flip@2x-flip-vs-pannin=
g-vs-hang.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i91=
5/kernel/-/issues/9934">i915#9934</a>) +1 other test skip</li>
</ul></li>
<li>
<p>igt@kms_flip@2x-flip-vs-suspend:</p><ul>
<li>shard-glk11:        NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/Patchwork_169493v6/shard-glk11/igt@kms_flip@2x-flip-vs-suspen=
d.html">INCOMPLETE</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/=
kernel/-/issues/12745">i915#12745</a> / <a href=3D"https://gitlab.freedeskt=
op.org/drm/i915/kernel/-/issues/13356">i915#13356</a> / <a href=3D"https://=
gitlab.freedesktop.org/drm/i915/kernel/-/issues/17183">i915#17183</a> / <a =
href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4839">i915#=
4839</a>)</li>
</ul></li>
<li>
<p>igt@kms_flip@2x-flip-vs-suspend@ac-hdmi-a1-hdmi-a2:</p><ul>
<li>shard-glk11:        NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/Patchwork_169493v6/shard-glk11/igt@kms_flip@2x-flip-vs-suspen=
d@ac-hdmi-a1-hdmi-a2.html">INCOMPLETE</a> (<a href=3D"https://gitlab.freede=
sktop.org/drm/i915/kernel/-/issues/12745">i915#12745</a> / <a href=3D"https=
://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13356">i915#13356</a> / =
<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17183">i=
915#17183</a>)</li>
</ul></li>
<li>
<p>igt@kms_flip@2x-nonexisting-fb:</p><ul>
<li>shard-tglu:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/Patchwork_169493v6/shard-tglu-10/igt@kms_flip@2x-nonexisting-=
fb.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kerne=
l/-/issues/3637">i915#3637</a> / <a href=3D"https://gitlab.freedesktop.org/=
drm/i915/kernel/-/issues/9934">i915#9934</a>) +8 other tests skip</li>
</ul></li>
<li>
<p>igt@kms_flip@2x-plain-flip:</p><ul>
<li>shard-tglu-1:       NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/Patchwork_169493v6/shard-tglu-1/igt@kms_flip@2x-plain-flip.ht=
ml">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/i=
ssues/3637">i915#3637</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i=
915/kernel/-/issues/9934">i915#9934</a>) +2 other tests skip</li>
<li>shard-dg1:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/Patchwork_169493v6/shard-dg1-14/igt@kms_flip@2x-plain-flip.ht=
ml">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/i=
ssues/9934">i915#9934</a>) +4 other tests skip</li>
</ul></li>
<li>
<p>igt@kms_flip@2x-plain-flip-interruptible:</p><ul>
<li>shard-rkl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/Patchwork_169493v6/shard-rkl-5/igt@kms_flip@2x-plain-flip-int=
erruptible.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i9=
15/kernel/-/issues/9934">i915#9934</a>) +8 other tests skip</li>
</ul></li>
<li>
<p>igt@kms_flip@bo-too-big:</p><ul>
<li>shard-dg2:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_19395/shard-dg2-6/igt@kms_flip@bo-too-big.html">PASS</a> -&gt; <a h=
ref=3D"https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_169493v6/shard-dg=
2-7/igt@kms_flip@bo-too-big.html">SKIP</a> (<a href=3D"https://gitlab.freed=
esktop.org/drm/i915/kernel/-/issues/5354">i915#5354</a>) +2 other tests ski=
p</li>
</ul></li>
<li>
<p>igt@kms_flip@flip-vs-wf_vblank-interruptible:</p><ul>
<li>shard-dg2:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/Patchwork_169493v6/shard-dg2-7/igt@kms_flip@flip-vs-wf_vblank=
-interruptible.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/dr=
m/i915/kernel/-/issues/5354">i915#5354</a>) +1 other test skip</li>
</ul></li>
<li>
<p>igt@kms_flip_scaled_crc@flip-32bpp-4tile-to-32bpp-4tiledg2rcccs-upscalin=
g:</p><ul>
<li>shard-glk10:        NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/Patchwork_169493v6/shard-glk10/igt@kms_flip_scaled_crc@flip-3=
2bpp-4tile-to-32bpp-4tiledg2rcccs-upscaling.html">SKIP</a> (<a href=3D"http=
s://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17484">i915#17484</a>) =
+3 other tests skip</li>
</ul></li>
<li>
<p>igt@kms_flip_scaled_crc@flip-32bpp-ytileccs-to-64bpp-ytile-downscaling:<=
/p><ul>
<li>shard-rkl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/Patchwork_169493v6/shard-rkl-8/igt@kms_flip_scaled_crc@flip-3=
2bpp-ytileccs-to-64bpp-ytile-downscaling.html">SKIP</a> (<a href=3D"https:/=
/gitlab.freedesktop.org/drm/i915/kernel/-/issues/15643">i915#15643</a>) +4 =
other tests skip</li>
<li>shard-tglu-1:       NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/Patchwork_169493v6/shard-tglu-1/igt@kms_flip_scaled_crc@flip-=
32bpp-ytileccs-to-64bpp-ytile-downscaling.html">SKIP</a> (<a href=3D"https:=
//gitlab.freedesktop.org/drm/i915/kernel/-/issues/15643">i915#15643</a>) +1=
 other test skip</li>
</ul></li>
<li>
<p>igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-16bpp-4tile-upscaling:</p><u=
l>
<li>shard-tglu:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/Patchwork_169493v6/shard-tglu-2/igt@kms_flip_scaled_crc@flip-=
64bpp-4tile-to-16bpp-4tile-upscaling.html">SKIP</a> (<a href=3D"https://git=
lab.freedesktop.org/drm/i915/kernel/-/issues/15643">i915#15643</a>) +4 othe=
r tests skip</li>
<li>shard-glk:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/Patchwork_169493v6/shard-glk6/igt@kms_flip_scaled_crc@flip-64=
bpp-4tile-to-16bpp-4tile-upscaling.html">SKIP</a> (<a href=3D"https://gitla=
b.freedesktop.org/drm/i915/kernel/-/issues/17484">i915#17484</a>)</li>
</ul></li>
<li>
<p>igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-32bpp-4tiledg2rcccs-upscalin=
g:</p><ul>
<li>shard-dg2:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/Patchwork_169493v6/shard-dg2-7/igt@kms_flip_scaled_crc@flip-6=
4bpp-4tile-to-32bpp-4tiledg2rcccs-upscaling.html">SKIP</a> (<a href=3D"http=
s://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3555">i915#3555</a> / <=
a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8813">i91=
5#8813</a>)</li>
<li>shard-dg1:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/Patchwork_169493v6/shard-dg1-18/igt@kms_flip_scaled_crc@flip-=
64bpp-4tile-to-32bpp-4tiledg2rcccs-upscaling.html">SKIP</a> (<a href=3D"htt=
ps://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15643">i915#15643</a>)=
</li>
</ul></li>
<li>
<p>igt@kms_flip_scaled_crc@flip-64bpp-linear-to-32bpp-linear-upscaling:</p>=
<ul>
<li>shard-glk11:        NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/Patchwork_169493v6/shard-glk11/igt@kms_flip_scaled_crc@flip-6=
4bpp-linear-to-32bpp-linear-upscaling.html">SKIP</a> (<a href=3D"https://gi=
tlab.freedesktop.org/drm/i915/kernel/-/issues/17522">i915#17522</a>) +1 oth=
er test skip</li>
</ul></li>
<li>
<p>igt@kms_flip_scaled_crc@flip-64bpp-xtile-to-32bpp-xtile-downscaling:</p>=
<ul>
<li>shard-dg2:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_19395/shard-dg2-1/igt@kms_flip_scaled_crc@flip-64bpp-xtile-to-32bpp=
-xtile-downscaling.html">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.=
org/tree/drm-tip/Patchwork_169493v6/shard-dg2-7/igt@kms_flip_scaled_crc@fli=
p-64bpp-xtile-to-32bpp-xtile-downscaling.html">SKIP</a> (<a href=3D"https:/=
/gitlab.freedesktop.org/drm/i915/kernel/-/issues/3555">i915#3555</a> / <a h=
ref=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8813">i915#8=
813</a>) +3 other tests skip</li>
</ul></li>
<li>
<p>igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-32bpp-yftile-upscaling:</p>=
<ul>
<li>shard-glk11:        NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/Patchwork_169493v6/shard-glk11/igt@kms_flip_scaled_crc@flip-6=
4bpp-yftile-to-32bpp-yftile-upscaling.html">SKIP</a> (<a href=3D"https://gi=
tlab.freedesktop.org/drm/i915/kernel/-/issues/17484">i915#17484</a>)</li>
</ul></li>
<li>
<p>igt@kms_flip_scaled_crc@flip-p010-4tile-to-p016-4tile:</p><ul>
<li>shard-dg2:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_19395/shard-dg2-1/igt@kms_flip_scaled_crc@flip-p010-4tile-to-p016-4=
tile.html">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-t=
ip/Patchwork_169493v6/shard-dg2-7/igt@kms_flip_scaled_crc@flip-p010-4tile-t=
o-p016-4tile.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/=
i915/kernel/-/issues/8813">i915#8813</a>)</li>
</ul></li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-2p-primscrn-cur-indfb-draw-blt:</p><ul>
<li>shard-dg2:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/Patchwork_169493v6/shard-dg2-7/igt@kms_frontbuffer_tracking@f=
bc-2p-primscrn-cur-indfb-draw-blt.html">SKIP</a> (<a href=3D"https://gitlab=
.freedesktop.org/drm/i915/kernel/-/issues/16708">i915#16708</a> / <a href=
=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5354">i915#5354=
</a>) +9 other tests skip</li>
</ul></li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-2p-primscrn-pri-indfb-draw-render:</p><=
ul>
<li>shard-dg2:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/Patchwork_169493v6/shard-dg2-6/igt@kms_frontbuffer_tracking@f=
bc-2p-primscrn-pri-indfb-draw-render.html">SKIP</a> (<a href=3D"https://git=
lab.freedesktop.org/drm/i915/kernel/-/issues/15991">i915#15991</a> / <a hre=
f=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5354">i915#535=
4</a>)</li>
</ul></li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-pri-indfb-draw-pwrite:</p><=
ul>
<li>shard-dg1:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/Patchwork_169493v6/shard-dg1-18/igt@kms_frontbuffer_tracking@=
fbc-2p-scndscrn-pri-indfb-draw-pwrite.html">SKIP</a> (<a href=3D"https://gi=
tlab.freedesktop.org/drm/i915/kernel/-/issues/17428">i915#17428</a>) +45 ot=
her tests skip</li>
</ul></li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-rgb565-draw-blt:</p><ul>
<li>shard-dg2:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_19395/shard-dg2-1/igt@kms_frontbuffer_tracking@fbc-rgb565-draw-blt.=
html">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/Pa=
tchwork_169493v6/shard-dg2-7/igt@kms_frontbuffer_tracking@fbc-rgb565-draw-b=
lt.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kerne=
l/-/issues/16708">i915#16708</a> / <a href=3D"https://gitlab.freedesktop.or=
g/drm/i915/kernel/-/issues/5354">i915#5354</a>) +1 other test skip</li>
</ul></li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-suspend:</p><ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_19395/shard-rkl-4/igt@kms_frontbuffer_tracking@fbc-suspend.html">PA=
SS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_=
169493v6/shard-rkl-3/igt@kms_frontbuffer_tracking@fbc-suspend.html">INCOMPL=
ETE</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues=
/10056">i915#10056</a>)</li>
</ul></li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-tiling-4:</p><ul>
<li>shard-rkl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/Patchwork_169493v6/shard-rkl-8/igt@kms_frontbuffer_tracking@f=
bc-tiling-4.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i=
915/kernel/-/issues/5439">i915#5439</a>) +1 other test skip</li>
</ul></li>
<li>
<p>igt@kms_frontbuffer_tracking@fbchdr-1p-offscreen-pri-shrfb-draw-mmap-gtt=
:</p><ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/Patchwork_169493v6/shard-mtlp-6/igt@kms_frontbuffer_tracking@=
fbchdr-1p-offscreen-pri-shrfb-draw-mmap-gtt.html">SKIP</a> (<a href=3D"http=
s://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15990">i915#15990</a>)<=
/li>
</ul></li>
<li>
<p>igt@kms_frontbuffer_tracking@fbchdr-1p-primscrn-shrfb-plflip-blt:</p><ul=
>
<li>shard-dg1:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/Patchwork_169493v6/shard-dg1-18/igt@kms_frontbuffer_tracking@=
fbchdr-1p-primscrn-shrfb-plflip-blt.html">SKIP</a> (<a href=3D"https://gitl=
ab.freedesktop.org/drm/i915/kernel/-/issues/15989">i915#15989</a>) +14 othe=
r tests skip</li>
</ul></li>
<li>
<p>igt@kms_frontbuffer_tracking@fbchdr-1p-primscrn-spr-indfb-draw-blt:</p><=
ul>
<li>shard-glk:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_19395/shard-glk8/igt@kms_frontbuffer_tracking@fbchdr-1p-primscrn-sp=
r-indfb-draw-blt.html">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.or=
g/tree/drm-tip/Patchwork_169493v6/shard-glk1/igt@kms_frontbuffer_tracking@f=
bchdr-1p-primscrn-spr-indfb-draw-blt.html">SKIP</a> (<a href=3D"https://git=
lab.freedesktop.org/drm/i915/kernel/-/issues/17517">i915#17517</a>) +11 oth=
er tests skip</li>
</ul></li>
<li>
<p>igt@kms_frontbuffer_tracking@fbchdr-suspend:</p><ul>
<li>shard-tglu:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/Patchwork_169493v6/shard-tglu-10/igt@kms_frontbuffer_tracking=
@fbchdr-suspend.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/d=
rm/i915/kernel/-/issues/15989">i915#15989</a>) +26 other tests skip</li>
</ul></li>
<li>
<p>igt@kms_frontbuffer_tracking@fbchdr-tiling-linear:</p><ul>
<li>shard-rkl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/Patchwork_169493v6/shard-rkl-4/igt@kms_frontbuffer_tracking@f=
bchdr-tiling-linear.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.o=
rg/drm/i915/kernel/-/issues/15989">i915#15989</a>) +30 other tests skip</li=
>
</ul></li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-1p-offscreen-pri-shrfb-draw-mmap-wc:=
</p><ul>
<li>shard-dg1:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/Patchwork_169493v6/shard-dg1-15/igt@kms_frontbuffer_tracking@=
fbcpsr-1p-offscreen-pri-shrfb-draw-mmap-wc.html">SKIP</a> (<a href=3D"https=
://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15104">i915#15104</a> / =
<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15990">i=
915#15990</a>)</li>
</ul></li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-1p-pri-indfb-multidraw:</p><ul>
<li>shard-rkl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/Patchwork_169493v6/shard-rkl-5/igt@kms_frontbuffer_tracking@f=
bcpsr-1p-pri-indfb-multidraw.html">SKIP</a> (<a href=3D"https://gitlab.free=
desktop.org/drm/i915/kernel/-/issues/15102">i915#15102</a>) +56 other tests=
 skip</li>
</ul></li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-cur-indfb-draw-mmap-gtt:=
</p><ul>
<li>shard-rkl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/Patchwork_169493v6/shard-rkl-8/igt@kms_frontbuffer_tracking@f=
bcpsr-2p-primscrn-cur-indfb-draw-mmap-gtt.html">SKIP</a> (<a href=3D"https:=
//gitlab.freedesktop.org/drm/i915/kernel/-/issues/17428">i915#17428</a> / <=
a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/1825">i91=
5#1825</a>) +8 other tests skip</li>
<li>shard-mtlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/Patchwork_169493v6/shard-mtlp-7/igt@kms_frontbuffer_tracking@=
fbcpsr-2p-primscrn-cur-indfb-draw-mmap-gtt.html">SKIP</a> (<a href=3D"https=
://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15990">i915#15990</a> / =
<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8708">i9=
15#8708</a>) +1 other test skip</li>
</ul></li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-pri-indfb-draw-blt:</p><=
ul>
<li>shard-glk10:        NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/Patchwork_169493v6/shard-glk10/igt@kms_frontbuffer_tracking@f=
bcpsr-2p-primscrn-pri-indfb-draw-blt.html">SKIP</a> (<a href=3D"https://git=
lab.freedesktop.org/drm/i915/kernel/-/issues/17482">i915#17482</a>) +66 oth=
er tests skip</li>
</ul></li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-pri-indfb-draw-render:</=
p><ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/Patchwork_169493v6/shard-mtlp-6/igt@kms_frontbuffer_tracking@=
fbcpsr-2p-scndscrn-pri-indfb-draw-render.html">SKIP</a> (<a href=3D"https:/=
/gitlab.freedesktop.org/drm/i915/kernel/-/issues/15991">i915#15991</a> / <a=
 href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17428">i91=
5#17428</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/i=
ssues/1825">i915#1825</a>) +2 other tests skip</li>
</ul></li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsrhdr-1p-primscrn-cur-indfb-move:</p><u=
l>
<li>shard-tglu-1:       NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/Patchwork_169493v6/shard-tglu-1/igt@kms_frontbuffer_tracking@=
fbcpsrhdr-1p-primscrn-cur-indfb-move.html">SKIP</a> (<a href=3D"https://git=
lab.freedesktop.org/drm/i915/kernel/-/issues/15102">i915#15102</a>) +34 oth=
er tests skip</li>
</ul></li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsrhdr-1p-shrfb-fliptrack-mmap-gtt:</p><=
ul>
<li>shard-glk11:        NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/Patchwork_169493v6/shard-glk11/igt@kms_frontbuffer_tracking@f=
bcpsrhdr-1p-shrfb-fliptrack-mmap-gtt.html">SKIP</a> (<a href=3D"https://git=
lab.freedesktop.org/drm/i915/kernel/-/issues/17482">i915#17482</a>) +32 oth=
er tests skip</li>
</ul></li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsrhdr-2p-primscrn-shrfb-plflip-blt:</p>=
<ul>
<li>shard-tglu-1:       NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/Patchwork_169493v6/shard-tglu-1/igt@kms_frontbuffer_tracking@=
fbcpsrhdr-2p-primscrn-shrfb-plflip-blt.html">SKIP</a> (<a href=3D"https://g=
itlab.freedesktop.org/drm/i915/kernel/-/issues/17428">i915#17428</a>) +54 o=
ther tests skip</li>
</ul></li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsrhdr-2p-primscrn-spr-indfb-move:</p><u=
l>
<li>shard-glk:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/Patchwork_169493v6/shard-glk3/igt@kms_frontbuffer_tracking@fb=
cpsrhdr-2p-primscrn-spr-indfb-move.html">SKIP</a> (<a href=3D"https://gitla=
b.freedesktop.org/drm/i915/kernel/-/issues/17482">i915#17482</a>) +49 other=
 tests skip</li>
</ul></li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsrhdr-2p-scndscrn-indfb-plflip-blt:</p>=
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/Patchwork_169493v6/shard-mtlp-6/igt@kms_frontbuffer_tracking@=
fbcpsrhdr-2p-scndscrn-indfb-plflip-blt.html">SKIP</a> (<a href=3D"https://g=
itlab.freedesktop.org/drm/i915/kernel/-/issues/15991">i915#15991</a> / <a h=
ref=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17428">i915#=
17428</a>) +6 other tests skip</li>
</ul></li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsrhdr-rgb101010-draw-blt:</p><ul>
<li>shard-dg2:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/Patchwork_169493v6/shard-dg2-6/igt@kms_frontbuffer_tracking@f=
bcpsrhdr-rgb101010-draw-blt.html">SKIP</a> (<a href=3D"https://gitlab.freed=
esktop.org/drm/i915/kernel/-/issues/15102">i915#15102</a>)</li>
</ul></li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsrhdr-tiling-4:</p><ul>
<li>shard-dg1:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/Patchwork_169493v6/shard-dg1-18/igt@kms_frontbuffer_tracking@=
fbcpsrhdr-tiling-4.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.or=
g/drm/i915/kernel/-/issues/5439">i915#5439</a>)</li>
</ul></li>
<li>
<p>igt@kms_frontbuffer_tracking@hdr-1p-offscreen-pri-indfb-draw-mmap-gtt:</=
p><ul>
<li>shard-tglu-1:       NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/Patchwork_169493v6/shard-tglu-1/igt@kms_frontbuffer_tracking@=
hdr-1p-offscreen-pri-indfb-draw-mmap-gtt.html">SKIP</a> (<a href=3D"https:/=
/gitlab.freedesktop.org/drm/i915/kernel/-/issues/15989">i915#15989</a>) +18=
 other tests skip</li>
<li>shard-dg1:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/Patchwork_169493v6/shard-dg1-14/igt@kms_frontbuffer_tracking@=
hdr-1p-offscreen-pri-indfb-draw-mmap-gtt.html">SKIP</a> (<a href=3D"https:/=
/gitlab.freedesktop.org/drm/i915/kernel/-/issues/15990">i915#15990</a>) +16=
 other tests skip</li>
</ul></li>
<li>
<p>igt@kms_frontbuffer_tracking@hdr-1p-rte:</p><ul>
<li>shard-glk11:        NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/Patchwork_169493v6/shard-glk11/igt@kms_frontbuffer_tracking@h=
dr-1p-rte.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i91=
5/kernel/-/issues/17517">i915#17517</a>) +7 other tests skip</li>
</ul></li>
<li>
<p>igt@kms_frontbuffer_tracking@hdr-rgb101010-draw-mmap-wc:</p><ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_19395/shard-rkl-1/igt@kms_frontbuffer_tracking@hdr-rgb101010-draw-m=
map-wc.html">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm=
-tip/Patchwork_169493v6/shard-rkl-5/igt@kms_frontbuffer_tracking@hdr-rgb101=
010-draw-mmap-wc.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/=
drm/i915/kernel/-/issues/15989">i915#15989</a>) +6 other tests skip</li>
</ul></li>
<li>
<p>igt@kms_frontbuffer_tracking@hdr-rgb101010-draw-render:</p><ul>
<li>shard-glk:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/Patchwork_169493v6/shard-glk3/igt@kms_frontbuffer_tracking@hd=
r-rgb101010-draw-render.html">SKIP</a> (<a href=3D"https://gitlab.freedeskt=
op.org/drm/i915/kernel/-/issues/17517">i915#17517</a>) +21 other tests skip=
</li>
</ul></li>
<li>
<p>igt@kms_frontbuffer_tracking@pipe-fbc-rte:</p><ul>
<li>shard-tglu:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/Patchwork_169493v6/shard-tglu-8/igt@kms_frontbuffer_tracking@=
pipe-fbc-rte.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/=
i915/kernel/-/issues/9766">i915#9766</a>)</li>
<li>shard-glk11:        NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/Patchwork_169493v6/shard-glk11/igt@kms_frontbuffer_tracking@p=
ipe-fbc-rte.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i=
915/kernel/-/issues/17534">i915#17534</a>)</li>
</ul></li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-2p-scndscrn-indfb-msflip-blt:</p><ul>
<li>shard-rkl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/Patchwork_169493v6/shard-rkl-8/igt@kms_frontbuffer_tracking@p=
sr-2p-scndscrn-indfb-msflip-blt.html">SKIP</a> (<a href=3D"https://gitlab.f=
reedesktop.org/drm/i915/kernel/-/issues/17428">i915#17428</a>) +75 other te=
sts skip</li>
</ul></li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-2p-scndscrn-pri-shrfb-draw-mmap-wc:</p>=
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/Patchwork_169493v6/shard-tglu-10/igt@kms_frontbuffer_tracking=
@psr-2p-scndscrn-pri-shrfb-draw-mmap-wc.html">SKIP</a> (<a href=3D"https://=
gitlab.freedesktop.org/drm/i915/kernel/-/issues/17428">i915#17428</a>) +91 =
other tests skip</li>
</ul></li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-rgb565-draw-mmap-wc:</p><ul>
<li>shard-dg1:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/Patchwork_169493v6/shard-dg1-15/igt@kms_frontbuffer_tracking@=
psr-rgb565-draw-mmap-wc.html">SKIP</a> (<a href=3D"https://gitlab.freedeskt=
op.org/drm/i915/kernel/-/issues/15990">i915#15990</a> / <a href=3D"https://=
gitlab.freedesktop.org/drm/i915/kernel/-/issues/8708">i915#8708</a>) +5 oth=
er tests skip</li>
</ul></li>
<li>
<p>igt@kms_frontbuffer_tracking@psrhdr-1p-primscrn-indfb-pgflip-blt:</p><ul=
>
<li>shard-tglu:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/Patchwork_169493v6/shard-tglu-10/igt@kms_frontbuffer_tracking=
@psrhdr-1p-primscrn-indfb-pgflip-blt.html">SKIP</a> (<a href=3D"https://git=
lab.freedesktop.org/drm/i915/kernel/-/issues/15102">i915#15102</a>) +51 oth=
er tests skip</li>
</ul></li>
<li>
<p>igt@kms_frontbuffer_tracking@psrhdr-1p-primscrn-spr-indfb-draw-mmap-cpu:=
</p><ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/Patchwork_169493v6/shard-mtlp-2/igt@kms_frontbuffer_tracking@=
psrhdr-1p-primscrn-spr-indfb-draw-mmap-cpu.html">SKIP</a> (<a href=3D"https=
://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15989">i915#15989</a>) +=
4 other tests skip</li>
</ul></li>
<li>
<p>igt@kms_frontbuffer_tracking@psrhdr-1p-primscrn-spr-indfb-move:</p><ul>
<li>shard-dg1:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/Patchwork_169493v6/shard-dg1-15/igt@kms_frontbuffer_tracking@=
psrhdr-1p-primscrn-spr-indfb-move.html">SKIP</a> (<a href=3D"https://gitlab=
.freedesktop.org/drm/i915/kernel/-/issues/15102">i915#15102</a>) +27 other =
tests skip</li>
</ul></li>
<li>
<p>igt@kms_frontbuffer_tracking@psrhdr-2p-primscrn-spr-indfb-draw-render:</=
p><ul>
<li>shard-dg2:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/Patchwork_169493v6/shard-dg2-7/igt@kms_frontbuffer_tracking@p=
srhdr-2p-primscrn-spr-indfb-draw-render.html">SKIP</a> (<a href=3D"https://=
gitlab.freedesktop.org/drm/i915/kernel/-/issues/16708">i915#16708</a>) +18 =
other tests skip</li>
</ul></li>
<li>
<p>igt@kms_getfb@getfb2-handle-not-fb:</p><ul>
<li>shard-dg1:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/Patchwork_169493v6/shard-dg1-15/igt@kms_getfb@getfb2-handle-n=
ot-fb.html">DMESG-WARN</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i=
915/kernel/-/issues/4423">i915#4423</a>)</li>
</ul></li>
<li>
<p>igt@kms_hdmi_audio_bw@audio-bw-hblank80:</p><ul>
<li>shard-dg2:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_19395/shard-dg2-6/igt@kms_hdmi_audio_bw@audio-bw-hblank80.html">PAS=
S</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_1=
69493v6/shard-dg2-7/igt@kms_hdmi_audio_bw@audio-bw-hblank80.html">SKIP</a> =
(<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17357">=
i915#17357</a>)</li>
</ul></li>
<li>
<p>igt@kms_hdmi_audio_bw@suspend-disk-audio-recovery:</p><ul>
<li>shard-tglu:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/Patchwork_169493v6/shard-tglu-8/igt@kms_hdmi_audio_bw@suspend=
-disk-audio-recovery.html">FAIL</a> (<a href=3D"https://gitlab.freedesktop.=
org/drm/i915/kernel/-/issues/17101">i915#17101</a> / <a href=3D"https://git=
lab.freedesktop.org/drm/i915/kernel/-/issues/17108">i915#17108</a> / <a hre=
f=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17188">i915#17=
188</a>)</li>
<li>shard-glk11:        NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/Patchwork_169493v6/shard-glk11/igt@kms_hdmi_audio_bw@suspend-=
disk-audio-recovery.html">FAIL</a> (<a href=3D"https://gitlab.freedesktop.o=
rg/drm/i915/kernel/-/issues/17101">i915#17101</a> / <a href=3D"https://gitl=
ab.freedesktop.org/drm/i915/kernel/-/issues/17108">i915#17108</a>)</li>
</ul></li>
<li>
<p>igt@kms_hdmi_audio_bw@suspend-mem-audio-recovery:</p><ul>
<li>shard-glk:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/Patchwork_169493v6/shard-glk5/igt@kms_hdmi_audio_bw@suspend-m=
em-audio-recovery.html">INCOMPLETE</a> (<a href=3D"https://gitlab.freedeskt=
op.org/drm/i915/kernel/-/issues/13356">i915#13356</a>)</li>
</ul></li>
<li>
<p>igt@kms_hdr@bpc-switch:</p><ul>
<li>shard-tglu-1:       NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/Patchwork_169493v6/shard-tglu-1/igt@kms_hdr@bpc-switch.html">=
SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issue=
s/3555">i915#3555</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i915/=
kernel/-/issues/8228">i915#8228</a>) +2 other tests skip</li>
</ul></li>
<li>
<p>igt@kms_hdr@invalid-hdr:</p><ul>
<li>shard-glk:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/Patchwork_169493v6/shard-glk3/igt@kms_hdr@invalid-hdr.html">S=
KIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues=
/17498">i915#17498</a>)</li>
</ul></li>
<li>
<p>igt@kms_hdr@invalid-metadata-sizes:</p><ul>
<li>shard-glk10:        NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/Patchwork_169493v6/shard-glk10/igt@kms_hdr@invalid-metadata-s=
izes.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/ker=
nel/-/issues/17498">i915#17498</a>)</li>
</ul></li>
<li>
<p>igt@kms_hdr@static-swap:</p><ul>
<li>shard-dg1:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/Patchwork_169493v6/shard-dg1-18/igt@kms_hdr@static-swap.html"=
>SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issu=
es/3555">i915#3555</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i915=
/kernel/-/issues/8228">i915#8228</a>) +1 other test skip</li>
</ul></li>
<li>
<p>igt@kms_hdr@static-toggle:</p><ul>
<li>shard-tglu:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/Patchwork_169493v6/shard-tglu-10/igt@kms_hdr@static-toggle.ht=
ml">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/i=
ssues/3555">i915#3555</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i=
915/kernel/-/issues/8228">i915#8228</a>)</li>
</ul></li>
<li>
<p>igt@kms_hdr@static-toggle-suspend:</p><ul>
<li>shard-rkl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/Patchwork_169493v6/shard-rkl-4/igt@kms_hdr@static-toggle-susp=
end.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kern=
el/-/issues/16644">i915#16644</a> / <a href=3D"https://gitlab.freedesktop.o=
rg/drm/i915/kernel/-/issues/3555">i915#3555</a> / <a href=3D"https://gitlab=
.freedesktop.org/drm/i915/kernel/-/issues/8228">i915#8228</a>) +2 other tes=
ts skip</li>
</ul></li>
<li>
<p>igt@kms_invalid_mode@bad-hsync-start:</p><ul>
<li>shard-dg2:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/Patchwork_169493v6/shard-dg2-7/igt@kms_invalid_mode@bad-hsync=
-start.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/k=
ernel/-/issues/16746">i915#16746</a> / <a href=3D"https://gitlab.freedeskto=
p.org/drm/i915/kernel/-/issues/3555">i915#3555</a>)</li>
</ul></li>
<li>
<p>igt@kms_invalid_mode@zero-vdisplay:</p><ul>
<li>shard-dg2:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_19395/shard-dg2-1/igt@kms_invalid_mode@zero-vdisplay.html">PASS</a>=
 -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_169493=
v6/shard-dg2-7/igt@kms_invalid_mode@zero-vdisplay.html">SKIP</a> (<a href=
=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16746">i915#167=
46</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues=
/3555">i915#3555</a>) +1 other test skip</li>
</ul></li>
<li>
<p>igt@kms_joiner@basic-ultra-joiner:</p><ul>
<li>shard-tglu:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/Patchwork_169493v6/shard-tglu-10/igt@kms_joiner@basic-ultra-j=
oiner.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/ke=
rnel/-/issues/15458">i915#15458</a>)</li>
<li>shard-glk10:        NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/Patchwork_169493v6/shard-glk10/igt@kms_joiner@basic-ultra-joi=
ner.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kern=
el/-/issues/17567">i915#17567</a>)</li>
</ul></li>
<li>
<p>igt@kms_joiner@invalid-modeset-big-joiner:</p><ul>
<li>shard-glk10:        NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/Patchwork_169493v6/shard-glk10/igt@kms_joiner@invalid-modeset=
-big-joiner.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i=
915/kernel/-/issues/17512">i915#17512</a>)</li>
</ul></li>
<li>
<p>igt@kms_joiner@invalid-modeset-force-big-joiner:</p><ul>
<li>shard-rkl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/Patchwork_169493v6/shard-rkl-7/igt@kms_joiner@invalid-modeset=
-force-big-joiner.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org=
/drm/i915/kernel/-/issues/15459">i915#15459</a>)</li>
<li>shard-tglu-1:       NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/Patchwork_169493v6/shard-tglu-1/igt@kms_joiner@invalid-modese=
t-force-big-joiner.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.or=
g/drm/i915/kernel/-/issues/15459">i915#15459</a>)</li>
</ul></li>
<li>
<p>igt@kms_joiner@invalid-modeset-force-ultra-joiner:</p><ul>
<li>shard-rkl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/Patchwork_169493v6/shard-rkl-8/igt@kms_joiner@invalid-modeset=
-force-ultra-joiner.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.o=
rg/drm/i915/kernel/-/issues/15458">i915#15458</a>) +1 other test skip</li>
<li>shard-tglu-1:       NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/Patchwork_169493v6/shard-tglu-1/igt@kms_joiner@invalid-modese=
t-force-ultra-joiner.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.=
org/drm/i915/kernel/-/issues/15458">i915#15458</a>)</li>
</ul></li>
<li>
<p>igt@kms_joiner@switch-modeset-ultra-joiner-big-joiner:</p><ul>
<li>shard-rkl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/Patchwork_169493v6/shard-rkl-4/igt@kms_joiner@switch-modeset-=
ultra-joiner-big-joiner.html">SKIP</a> (<a href=3D"https://gitlab.freedeskt=
op.org/drm/i915/kernel/-/issues/15638">i915#15638</a> / <a href=3D"https://=
gitlab.freedesktop.org/drm/i915/kernel/-/issues/15722">i915#15722</a>)</li>
</ul></li>
<li>
<p>igt@kms_mst@mst-suspend-read-crc:</p><ul>
<li>shard-glk10:        NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/Patchwork_169493v6/shard-glk10/igt@kms_mst@mst-suspend-read-c=
rc.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kerne=
l/-/issues/17579">i915#17579</a>)</li>
</ul></li>
<li>
<p>igt@kms_panel_fitting@atomic-fastset:</p><ul>
<li>shard-glk10:        NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/Patchwork_169493v6/shard-glk10/igt@kms_panel_fitting@atomic-f=
astset.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/k=
ernel/-/issues/17577">i915#17577</a>)</li>
</ul></li>
<li>
<p>igt@kms_panel_fitting@legacy:</p><ul>
<li>shard-rkl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/Patchwork_169493v6/shard-rkl-8/igt@kms_panel_fitting@legacy.h=
tml">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/=
issues/6301">i915#6301</a>)</li>
<li>shard-tglu-1:       NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/Patchwork_169493v6/shard-tglu-1/igt@kms_panel_fitting@legacy.=
html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-=
/issues/6301">i915#6301</a>)</li>
</ul></li>
<li>
<p>igt@kms_pipe_b_c_ivb@from-pipe-c-to-b-with-3-lanes:</p><ul>
<li>shard-tglu:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/Patchwork_169493v6/shard-tglu-10/igt@kms_pipe_b_c_ivb@from-pi=
pe-c-to-b-with-3-lanes.html">SKIP</a> (<a href=3D"https://gitlab.freedeskto=
p.org/drm/i915/kernel/-/issues/17455">i915#17455</a>) +4 other tests skip</=
li>
</ul></li>
<li>
<p>igt@kms_pipe_b_c_ivb@pipe-b-dpms-off-modeset-pipe-c:</p><ul>
<li>shard-glk:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/Patchwork_169493v6/shard-glk3/igt@kms_pipe_b_c_ivb@pipe-b-dpm=
s-off-modeset-pipe-c.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.=
org/drm/i915/kernel/-/issues/17540">i915#17540</a>)</li>
</ul></li>
<li>
<p>igt@kms_pipe_stress@stress-xrgb8888-4tiled:</p><ul>
<li>shard-rkl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/Patchwork_169493v6/shard-rkl-4/igt@kms_pipe_stress@stress-xrg=
b8888-4tiled.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/=
i915/kernel/-/issues/14712">i915#14712</a>)</li>
</ul></li>
<li>
<p>igt@kms_plane@pixel-format-4-tiled-bmg-ccs-modifier-source-clamping:</p>=
<ul>
<li>shard-tglu-1:       NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/Patchwork_169493v6/shard-tglu-1/igt@kms_plane@pixel-format-4-=
tiled-bmg-ccs-modifier-source-clamping.html">SKIP</a> (<a href=3D"https://g=
itlab.freedesktop.org/drm/i915/kernel/-/issues/15709">i915#15709</a>) +2 ot=
her tests skip</li>
</ul></li>
<li>
<p>igt@kms_plane@pixel-format-4-tiled-dg2-rc-ccs-cc-modifier-source-clampin=
g:</p><ul>
<li>shard-rkl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/Patchwork_169493v6/shard-rkl-2/igt@kms_plane@pixel-format-4-t=
iled-dg2-rc-ccs-cc-modifier-source-clamping.html">SKIP</a> (<a href=3D"http=
s://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15709">i915#15709</a>) =
+2 other tests skip</li>
</ul></li>
<li>
<p>igt@kms_plane@pixel-format-4-tiled-lnl-ccs-modifier:</p><ul>
<li>shard-dg2:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/Patchwork_169493v6/shard-dg2-7/igt@kms_plane@pixel-format-4-t=
iled-lnl-ccs-modifier.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop=
.org/drm/i915/kernel/-/issues/15709">i915#15709</a>) +1 other test skip</li=
>
</ul></li>
<li>
<p>igt@kms_plane@pixel-format-4-tiled-mtl-rc-ccs-cc-modifier-source-clampin=
g:</p><ul>
<li>shard-glk10:        NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/Patchwork_169493v6/shard-glk10/igt@kms_plane@pixel-format-4-t=
iled-mtl-rc-ccs-cc-modifier-source-clamping.html">SKIP</a> (<a href=3D"http=
s://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17479">i915#17479</a>) =
+2 other tests skip</li>
</ul></li>
<li>
<p>igt@kms_plane@pixel-format-4-tiled-mtl-rc-ccs-modifier:</p><ul>
<li>shard-glk:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/Patchwork_169493v6/shard-glk3/igt@kms_plane@pixel-format-4-ti=
led-mtl-rc-ccs-modifier.html">SKIP</a> (<a href=3D"https://gitlab.freedeskt=
op.org/drm/i915/kernel/-/issues/17479">i915#17479</a>) +1 other test skip</=
li>
</ul></li>
<li>
<p>igt@kms_plane@pixel-format-x-tiled-modifier@pipe-b-plane-5:</p><ul>
<li>shard-rkl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/Patchwork_169493v6/shard-rkl-8/igt@kms_plane@pixel-format-x-t=
iled-modifier@pipe-b-plane-5.html">SKIP</a> (<a href=3D"https://gitlab.free=
desktop.org/drm/i915/kernel/-/issues/16386">i915#16386</a>) +3 other tests =
skip</li>
</ul></li>
<li>
<p>igt@kms_plane@pixel-format-x-tiled-modifier@pipe-b-plane-7:</p><ul>
<li>shard-tglu-1:       NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/Patchwork_169493v6/shard-tglu-1/igt@kms_plane@pixel-format-x-=
tiled-modifier@pipe-b-plane-7.html">SKIP</a> (<a href=3D"https://gitlab.fre=
edesktop.org/drm/i915/kernel/-/issues/16386">i915#16386</a>) +1 other test =
skip</li>
</ul></li>
<li>
<p>igt@kms_plane@pixel-format-y-tiled-gen12-mc-ccs-modifier-source-clamping=
:</p><ul>
<li>shard-tglu:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/Patchwork_169493v6/shard-tglu-10/igt@kms_plane@pixel-format-y=
-tiled-gen12-mc-ccs-modifier-source-clamping.html">SKIP</a> (<a href=3D"htt=
ps://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15709">i915#15709</a>)=
 +3 other tests skip</li>
</ul></li>
<li>
<p>igt@kms_plane@pixel-format-yf-tiled-ccs-modifier-source-clamping:</p><ul=
>
<li>shard-dg1:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/Patchwork_169493v6/shard-dg1-18/igt@kms_plane@pixel-format-yf=
-tiled-ccs-modifier-source-clamping.html">SKIP</a> (<a href=3D"https://gitl=
ab.freedesktop.org/drm/i915/kernel/-/issues/15709">i915#15709</a>) +3 other=
 tests skip</li>
</ul></li>
<li>
<p>igt@kms_plane@plane-panning-bottom-right-suspend@pipe-b:</p><ul>
<li>shard-glk:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/Patchwork_169493v6/shard-glk1/igt@kms_plane@plane-panning-bot=
tom-right-suspend@pipe-b.html">INCOMPLETE</a> (<a href=3D"https://gitlab.fr=
eedesktop.org/drm/i915/kernel/-/issues/13026">i915#13026</a> / <a href=3D"h=
ttps://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13356">i915#13356</a=
>)</li>
</ul></li>
<li>
<p>igt@kms_plane@plane-panning-top-left:</p><ul>
<li>shard-dg2:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_19395/shard-dg2-6/igt@kms_plane@plane-panning-top-left.html">PASS</=
a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_1694=
93v6/shard-dg2-7/igt@kms_plane@plane-panning-top-left.html">SKIP</a> (<a hr=
ef=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8825">i915#88=
25</a>) +1 other test skip</li>
</ul></li>
<li>
<p>igt@kms_plane_alpha_blend@alpha-basic:</p><ul>
<li>shard-glk:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/Patchwork_169493v6/shard-glk3/igt@kms_plane_alpha_blend@alpha=
-basic.html">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/k=
ernel/-/issues/12178">i915#12178</a>)</li>
</ul></li>
<li>
<p>igt@kms_plane_alpha_blend@alpha-basic@pipe-a-hdmi-a-1:</p><ul>
<li>shard-glk:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/Patchwork_169493v6/shard-glk3/igt@kms_plane_alpha_blend@alpha=
-basic@pipe-a-hdmi-a-1.html">FAIL</a> (<a href=3D"https://gitlab.freedeskto=
p.org/drm/i915/kernel/-/issues/7862">i915#7862</a>) +1 other test fail</li>
</ul></li>
<li>
<p>igt@kms_plane_alpha_blend@constant-alpha-max:</p><ul>
<li>shard-glk:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/Patchwork_169493v6/shard-glk3/igt@kms_plane_alpha_blend@const=
ant-alpha-max.html">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm=
/i915/kernel/-/issues/10647">i915#10647</a> / <a href=3D"https://gitlab.fre=
edesktop.org/drm/i915/kernel/-/issues/12169">i915#12169</a>)</li>
</ul></li>
<li>
<p>igt@kms_plane_alpha_blend@constant-alpha-max@pipe-c-hdmi-a-1:</p><ul>
<li>shard-glk:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/Patchwork_169493v6/shard-glk3/igt@kms_plane_alpha_blend@const=
ant-alpha-max@pipe-c-hdmi-a-1.html">FAIL</a> (<a href=3D"https://gitlab.fre=
edesktop.org/drm/i915/kernel/-/issues/10647">i915#10647</a>) +1 other test =
fail</li>
</ul></li>
<li>
<p>igt@kms_plane_multiple@2x-tiling-4:</p><ul>
<li>shard-glk10:        NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/Patchwork_169493v6/shard-glk10/igt@kms_plane_multiple@2x-tili=
ng-4.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/ker=
nel/-/issues/17586">i915#17586</a>)</li>
</ul></li>
<li>
<p>igt@kms_plane_multiple@2x-tiling-none:</p><ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/Patchwork_169493v6/shard-mtlp-6/igt@kms_plane_multiple@2x-til=
ing-none.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915=
/kernel/-/issues/13958">i915#13958</a>)</li>
</ul></li>
<li>
<p>igt@kms_plane_multiple@2x-tiling-y:</p><ul>
<li>shard-tglu:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/Patchwork_169493v6/shard-tglu-10/igt@kms_plane_multiple@2x-ti=
ling-y.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/k=
ernel/-/issues/13958">i915#13958</a>) +1 other test skip</li>
</ul></li>
<li>
<p>igt@kms_plane_multiple@tiling-4:</p><ul>
<li>shard-glk11:        NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/Patchwork_169493v6/shard-glk11/igt@kms_plane_multiple@tiling-=
4.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel=
/-/issues/17542">i915#17542</a>)</li>
</ul></li>
<li>
<p>igt@kms_plane_multiple@tiling-yf:</p><ul>
<li>shard-tglu-1:       NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/Patchwork_169493v6/shard-tglu-1/igt@kms_plane_multiple@tiling=
-yf.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kern=
el/-/issues/14259">i915#14259</a>)</li>
<li>shard-dg1:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/Patchwork_169493v6/shard-dg1-14/igt@kms_plane_multiple@tiling=
-yf.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kern=
el/-/issues/14259">i915#14259</a>)</li>
</ul></li>
<li>
<p>igt@kms_plane_scaling@plane-downscale-factor-0-5-with-modifiers:</p><ul>
<li>shard-dg2:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/Patchwork_169493v6/shard-dg2-7/igt@kms_plane_scaling@plane-do=
wnscale-factor-0-5-with-modifiers.html">SKIP</a> (<a href=3D"https://gitlab=
.freedesktop.org/drm/i915/kernel/-/issues/15329">i915#15329</a> / <a href=
=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17356">i915#173=
56</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues=
/9423">i915#9423</a>)</li>
</ul></li>
<li>
<p>igt@kms_plane_scaling@plane-downscale-factor-0-5-with-rotation:</p><ul>
<li>shard-glk:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/Patchwork_169493v6/shard-glk3/igt@kms_plane_scaling@plane-dow=
nscale-factor-0-5-with-rotation.html">SKIP</a> (<a href=3D"https://gitlab.f=
reedesktop.org/drm/i915/kernel/-/issues/17528">i915#17528</a>) +3 other tes=
ts skip</li>
</ul></li>
<li>
<p>igt@kms_plane_scaling@plane-downscale-factor-0-5-with-rotation@pipe-c:</=
p><ul>
<li>shard-tglu:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/Patchwork_169493v6/shard-tglu-10/igt@kms_plane_scaling@plane-=
downscale-factor-0-5-with-rotation@pipe-c.html">SKIP</a> (<a href=3D"https:=
//gitlab.freedesktop.org/drm/i915/kernel/-/issues/15329">i915#15329</a>) +4=
 other tests skip</li>
</ul></li>
<li>
<p>igt@kms_plane_scaling@plane-downscale-factor-0-75-with-rotation@pipe-b:<=
/p><ul>
<li>shard-dg2:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_19395/shard-dg2-1/igt@kms_plane_scaling@plane-downscale-factor-0-75=
-with-rotation@pipe-b.html">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.=
01.org/tree/drm-tip/Patchwork_169493v6/shard-dg2-7/igt@kms_plane_scaling@pl=
ane-downscale-factor-0-75-with-rotation@pipe-b.html">SKIP</a> (<a href=3D"h=
ttps://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15329">i915#15329</a=
>) +8 other tests skip</li>
</ul></li>
<li>
<p>igt@kms_plane_scaling@plane-scaler-with-clipping-clamping-rotation:</p><=
ul>
<li>shard-tglu-1:       NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/Patchwork_169493v6/shard-tglu-1/igt@kms_plane_scaling@plane-s=
caler-with-clipping-clamping-rotation.html">SKIP</a> (<a href=3D"https://gi=
tlab.freedesktop.org/drm/i915/kernel/-/issues/15329">i915#15329</a> / <a hr=
ef=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3555">i915#35=
55</a>)</li>
<li>shard-dg1:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/Patchwork_169493v6/shard-dg1-14/igt@kms_plane_scaling@plane-s=
caler-with-clipping-clamping-rotation.html">SKIP</a> (<a href=3D"https://gi=
tlab.freedesktop.org/drm/i915/kernel/-/issues/15329">i915#15329</a> / <a hr=
ef=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3555">i915#35=
55</a>)</li>
</ul></li>
<li>
<p>igt@kms_plane_scaling@plane-scaler-with-clipping-clamping-rotation@pipe-=
b:</p><ul>
<li>shard-glk:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/Patchwork_169493v6/shard-glk3/igt@kms_plane_scaling@plane-sca=
ler-with-clipping-clamping-rotation@pipe-b.html">SKIP</a> (<a href=3D"https=
://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17529">i915#17529</a>) +=
3 other tests skip</li>
<li>shard-tglu-1:       NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/Patchwork_169493v6/shard-tglu-1/igt@kms_plane_scaling@plane-s=
caler-with-clipping-clamping-rotation@pipe-b.html">SKIP</a> (<a href=3D"htt=
ps://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15329">i915#15329</a>)=
 +3 other tests skip</li>
<li>shard-dg1:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/Patchwork_169493v6/shard-dg1-14/igt@kms_plane_scaling@plane-s=
caler-with-clipping-clamping-rotation@pipe-b.html">SKIP</a> (<a href=3D"htt=
ps://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15329">i915#15329</a>)=
 +3 other tests skip</li>
</ul></li>
<li>
<p>igt@kms_plane_scaling@plane-upscale-factor-0-25-with-rotation:</p><ul>
<li>shard-dg2:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_19395/shard-dg2-1/igt@kms_plane_scaling@plane-upscale-factor-0-25-w=
ith-rotation.html">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tr=
ee/drm-tip/Patchwork_169493v6/shard-dg2-7/igt@kms_plane_scaling@plane-upsca=
le-factor-0-25-with-rotation.html">SKIP</a> (<a href=3D"https://gitlab.free=
desktop.org/drm/i915/kernel/-/issues/15329">i915#15329</a> / <a href=3D"htt=
ps://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17356">i915#17356</a> =
/ <a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9423">=
i915#9423</a>) +1 other test skip</li>
</ul></li>
<li>
<p>igt@kms_plane_scaling@planes-upscale-20x20-downscale-factor-0-5:</p><ul>
<li>shard-dg2:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_19395/shard-dg2-6/igt@kms_plane_scaling@planes-upscale-20x20-downsc=
ale-factor-0-5.html">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/Patchwork_169493v6/shard-dg2-7/igt@kms_plane_scaling@planes-up=
scale-20x20-downscale-factor-0-5.html">SKIP</a> (<a href=3D"https://gitlab.=
freedesktop.org/drm/i915/kernel/-/issues/15329">i915#15329</a> / <a href=3D=
"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17356">i915#17356<=
/a> / <a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/35=
55">i915#3555</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i915/kern=
el/-/issues/6953">i915#6953</a> / <a href=3D"https://gitlab.freedesktop.org=
/drm/i915/kernel/-/issues/9423">i915#9423</a>)</li>
</ul></li>
<li>
<p>igt@kms_plane_scaling@planes-upscale-20x20-downscale-factor-0-5@pipe-d:<=
/p><ul>
<li>shard-dg2:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_19395/shard-dg2-6/igt@kms_plane_scaling@planes-upscale-20x20-downsc=
ale-factor-0-5@pipe-d.html">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.=
01.org/tree/drm-tip/Patchwork_169493v6/shard-dg2-7/igt@kms_plane_scaling@pl=
anes-upscale-20x20-downscale-factor-0-5@pipe-d.html">SKIP</a> (<a href=3D"h=
ttps://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15329">i915#15329</a=
> / <a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/1735=
6">i915#17356</a>) +2 other tests skip</li>
</ul></li>
<li>
<p>igt@kms_plane_scaling@planes-upscale-factor-0-25-downscale-factor-0-75:<=
/p><ul>
<li>shard-dg2:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/Patchwork_169493v6/shard-dg2-7/igt@kms_plane_scaling@planes-u=
pscale-factor-0-25-downscale-factor-0-75.html">SKIP</a> (<a href=3D"https:/=
/gitlab.freedesktop.org/drm/i915/kernel/-/issues/15329">i915#15329</a> / <a=
 href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17356">i91=
5#17356</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/i=
ssues/3555">i915#3555</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i=
915/kernel/-/issues/6953">i915#6953</a> / <a href=3D"https://gitlab.freedes=
ktop.org/drm/i915/kernel/-/issues/9423">i915#9423</a>)</li>
</ul></li>
<li>
<p>igt@kms_plane_scaling@planes-upscale-factor-0-25-downscale-factor-0-75@p=
ipe-c:</p><ul>
<li>shard-dg2:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/Patchwork_169493v6/shard-dg2-7/igt@kms_plane_scaling@planes-u=
pscale-factor-0-25-downscale-factor-0-75@pipe-c.html">SKIP</a> (<a href=3D"=
https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15329">i915#15329</=
a>) +5 other tests skip</li>
</ul></li>
<li>
<p>igt@kms_plane_scaling@planes-upscale-factor-0-25-downscale-factor-0-75@p=
ipe-d:</p><ul>
<li>shard-dg2:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/Patchwork_169493v6/shard-dg2-7/igt@kms_plane_scaling@planes-u=
pscale-factor-0-25-downscale-factor-0-75@pipe-d.html">SKIP</a> (<a href=3D"=
https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15329">i915#15329</=
a> / <a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/173=
56">i915#17356</a>) +1 other test skip</li>
</ul></li>
<li>
<p>igt@kms_pm_backlight@brightness-with-dpms:</p><ul>
<li>shard-rkl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/Patchwork_169493v6/shard-rkl-8/igt@kms_pm_backlight@brightnes=
s-with-dpms.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i=
915/kernel/-/issues/12343">i915#12343</a>)</li>
<li>shard-tglu-1:       NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/Patchwork_169493v6/shard-tglu-1/igt@kms_pm_backlight@brightne=
ss-with-dpms.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/=
i915/kernel/-/issues/12343">i915#12343</a>)</li>
</ul></li>
<li>
<p>igt@kms_pm_backlight@fade:</p><ul>
<li>shard-rkl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/Patchwork_169493v6/shard-rkl-7/igt@kms_pm_backlight@fade.html=
">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/iss=
ues/12343">i915#12343</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i=
915/kernel/-/issues/5354">i915#5354</a>)</li>
<li>shard-tglu-1:       NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/Patchwork_169493v6/shard-tglu-1/igt@kms_pm_backlight@fade.htm=
l">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/is=
sues/12343">i915#12343</a> / <a href=3D"https://gitlab.freedesktop.org/drm/=
i915/kernel/-/issues/9812">i915#9812</a>)</li>
</ul></li>
<li>
<p>igt@kms_pm_dc@dc5-dpms-negative:</p><ul>
<li>shard-dg2:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_19395/shard-dg2-6/igt@kms_pm_dc@dc5-dpms-negative.html">PASS</a> -&=
gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_169493v6/=
shard-dg2-7/igt@kms_pm_dc@dc5-dpms-negative.html">SKIP</a> (<a href=3D"http=
s://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13441">i915#13441</a>)<=
/li>
</ul></li>
<li>
<p>igt@kms_pm_dc@dc5-pageflip-negative:</p><ul>
<li>shard-glk11:        NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/Patchwork_169493v6/shard-glk11/igt@kms_pm_dc@dc5-pageflip-neg=
ative.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/ke=
rnel/-/issues/17495">i915#17495</a>)</li>
</ul></li>
<li>
<p>igt@kms_pm_dc@dc5-psr:</p><ul>
<li>shard-tglu:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/Patchwork_169493v6/shard-tglu-10/igt@kms_pm_dc@dc5-psr.html">=
SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issue=
s/15948">i915#15948</a>)</li>
<li>shard-glk10:        NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/Patchwork_169493v6/shard-glk10/igt@kms_pm_dc@dc5-psr.html">SK=
IP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/=
17564">i915#17564</a>)</li>
</ul></li>
<li>
<p>igt@kms_pm_dc@dc5-retention-flops:</p><ul>
<li>shard-tglu-1:       NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/Patchwork_169493v6/shard-tglu-1/igt@kms_pm_dc@dc5-retention-f=
lops.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/ker=
nel/-/issues/3828">i915#3828</a>)</li>
<li>shard-dg1:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/Patchwork_169493v6/shard-dg1-14/igt@kms_pm_dc@dc5-retention-f=
lops.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/ker=
nel/-/issues/3828">i915#3828</a>) +1 other test skip</li>
<li>shard-glk:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/Patchwork_169493v6/shard-glk3/igt@kms_pm_dc@dc5-retention-flo=
ps.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kerne=
l/-/issues/17553">i915#17553</a>)</li>
</ul></li>
<li>
<p>igt@kms_pm_dc@dc6-dpms:</p><ul>
<li>shard-rkl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/Patchwork_169493v6/shard-rkl-5/igt@kms_pm_dc@dc6-dpms.html">F=
AIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues=
/16479">i915#16479</a>)</li>
</ul></li>
<li>
<p>igt@kms_pm_dc@dc9-dpms:</p><ul>
<li>shard-rkl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/Patchwork_169493v6/shard-rkl-7/igt@kms_pm_dc@dc9-dpms.html">S=
KIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues=
/15739">i915#15739</a>)</li>
<li>shard-tglu-1:       NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/Patchwork_169493v6/shard-tglu-1/igt@kms_pm_dc@dc9-dpms.html">=
SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issue=
s/15739">i915#15739</a>)</li>
</ul></li>
<li>
<p>igt@kms_pm_lpsp@kms-lpsp:</p><ul>
<li>shard-rkl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/Patchwork_169493v6/shard-rkl-4/igt@kms_pm_lpsp@kms-lpsp.html"=
>SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issu=
es/9340">i915#9340</a>)</li>
</ul></li>
<li>
<p>igt@kms_pm_rpm@dpms-lpsp:</p><ul>
<li>shard-dg1:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_19395/shard-dg1-15/igt@kms_pm_rpm@dpms-lpsp.html">PASS</a> -&gt; <a=
 href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_169493v6/shard-=
dg1-17/igt@kms_pm_rpm@dpms-lpsp.html">SKIP</a> (<a href=3D"https://gitlab.f=
reedesktop.org/drm/i915/kernel/-/issues/15073">i915#15073</a>)</li>
</ul></li>
<li>
<p>igt@kms_pm_rpm@dpms-non-lpsp:</p><ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_19395/shard-rkl-7/igt@kms_pm_rpm@dpms-non-lpsp.html">PASS</a> -&gt;=
 <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_169493v6/sha=
rd-rkl-8/igt@kms_pm_rpm@dpms-non-lpsp.html">SKIP</a> (<a href=3D"https://gi=
tlab.freedesktop.org/drm/i915/kernel/-/issues/15073">i915#15073</a>)</li>
</ul></li>
<li>
<p>igt@kms_pm_rpm@modeset-lpsp:</p><ul>
<li>shard-glk10:        NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/Patchwork_169493v6/shard-glk10/igt@kms_pm_rpm@modeset-lpsp.ht=
ml">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/i=
ssues/15073">i915#15073</a>)</li>
</ul></li>
<li>
<p>igt@kms_pm_rpm@modeset-lpsp-stress-no-wait:</p><ul>
<li>shard-rkl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/Patchwork_169493v6/shard-rkl-3/igt@kms_pm_rpm@modeset-lpsp-st=
ress-no-wait.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/=
i915/kernel/-/issues/15073">i915#15073</a>) +1 other test skip</li>
</ul></li>
<li>
<p>igt@kms_pm_rpm@modeset-non-lpsp:</p><ul>
<li>shard-tglu-1:       NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/Patchwork_169493v6/shard-tglu-1/igt@kms_pm_rpm@modeset-non-lp=
sp.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kerne=
l/-/issues/15073">i915#15073</a>)</li>
</ul></li>
<li>
<p>igt@kms_pm_rpm@modeset-non-lpsp-stress-no-wait:</p><ul>
<li>shard-tglu:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/Patchwork_169493v6/shard-tglu-10/igt@kms_pm_rpm@modeset-non-l=
psp-stress-no-wait.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.or=
g/drm/i915/kernel/-/issues/15073">i915#15073</a>)</li>
</ul></li>
<li>
<p>igt@kms_pm_rpm@pc8-residency:</p><ul>
<li>shard-rkl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/Patchwork_169493v6/shard-rkl-8/igt@kms_pm_rpm@pc8-residency.h=
tml">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/=
issues/17434">i915#17434</a> / <a href=3D"https://gitlab.freedesktop.org/dr=
m/i915/kernel/-/issues/17450">i915#17450</a>)</li>
<li>shard-mtlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/Patchwork_169493v6/shard-mtlp-7/igt@kms_pm_rpm@pc8-residency.=
html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-=
/issues/17450">i915#17450</a>) +1 other test skip</li>
</ul></li>
<li>
<p>igt@kms_prime@basic-modeset-hybrid:</p><ul>
<li>shard-tglu:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/Patchwork_169493v6/shard-tglu-10/igt@kms_prime@basic-modeset-=
hybrid.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/k=
ernel/-/issues/6524">i915#6524</a>)</li>
<li>shard-glk10:        NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/Patchwork_169493v6/shard-glk10/igt@kms_prime@basic-modeset-hy=
brid.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/ker=
nel/-/issues/17569">i915#17569</a>)</li>
</ul></li>
<li>
<p>igt@kms_psr2_sf@fbc-pr-cursor-plane-update-sf:</p><ul>
<li>shard-tglu:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/Patchwork_169493v6/shard-tglu-10/igt@kms_psr2_sf@fbc-pr-curso=
r-plane-update-sf.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org=
/drm/i915/kernel/-/issues/11520">i915#11520</a>) +11 other tests skip</li>
</ul></li>
<li>
<p>igt@kms_psr2_sf@fbc-psr2-overlay-plane-move-continuous-exceed-fully-sf:<=
/p><ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/Patchwork_169493v6/shard-mtlp-6/igt@kms_psr2_sf@fbc-psr2-over=
lay-plane-move-continuous-exceed-fully-sf.html">SKIP</a> (<a href=3D"https:=
//gitlab.freedesktop.org/drm/i915/kernel/-/issues/12316">i915#12316</a>) +1=
 other test skip</li>
</ul></li>
<li>
<p>igt@kms_psr2_sf@fbc-psr2-overlay-plane-move-continuous-exceed-fully-sf@p=
ipe-a-edp-1:</p><ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/Patchwork_169493v6/shard-mtlp-6/igt@kms_psr2_sf@fbc-psr2-over=
lay-plane-move-continuous-exceed-fully-sf@pipe-a-edp-1.html">SKIP</a> (<a h=
ref=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9808">i915#9=
808</a>)</li>
</ul></li>
<li>
<p>igt@kms_psr2_sf@fbc-psr2-overlay-plane-move-continuous-exceed-sf:</p><ul=
>
<li>shard-dg2:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/Patchwork_169493v6/shard-dg2-7/igt@kms_psr2_sf@fbc-psr2-overl=
ay-plane-move-continuous-exceed-sf.html">SKIP</a> (<a href=3D"https://gitla=
b.freedesktop.org/drm/i915/kernel/-/issues/11520">i915#11520</a>)</li>
<li>shard-dg1:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/Patchwork_169493v6/shard-dg1-18/igt@kms_psr2_sf@fbc-psr2-over=
lay-plane-move-continuous-exceed-sf.html">SKIP</a> (<a href=3D"https://gitl=
ab.freedesktop.org/drm/i915/kernel/-/issues/11520">i915#11520</a>) +4 other=
 tests skip</li>
</ul></li>
<li>
<p>igt@kms_psr2_sf@pr-primary-plane-update-sf-dmg-area-big-fb:</p><ul>
<li>shard-glk10:        NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/Patchwork_169493v6/shard-glk10/igt@kms_psr2_sf@pr-primary-pla=
ne-update-sf-dmg-area-big-fb.html">SKIP</a> (<a href=3D"https://gitlab.free=
desktop.org/drm/i915/kernel/-/issues/11520">i915#11520</a>) +5 other tests =
skip</li>
</ul></li>
<li>
<p>igt@kms_psr2_sf@psr2-cursor-plane-move-continuous-exceed-sf:</p><ul>
<li>shard-glk11:        NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/Patchwork_169493v6/shard-glk11/igt@kms_psr2_sf@psr2-cursor-pl=
ane-move-continuous-exceed-sf.html">SKIP</a> (<a href=3D"https://gitlab.fre=
edesktop.org/drm/i915/kernel/-/issues/11520">i915#11520</a>) +2 other tests=
 skip</li>
</ul></li>
<li>
<p>igt@kms_psr2_sf@psr2-cursor-plane-move-continuous-sf:</p><ul>
<li>shard-glk:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/Patchwork_169493v6/shard-glk3/igt@kms_psr2_sf@psr2-cursor-pla=
ne-move-continuous-sf.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop=
.org/drm/i915/kernel/-/issues/11520">i915#11520</a>) +4 other tests skip</l=
i>
</ul></li>
<li>
<p>igt@kms_psr2_sf@psr2-overlay-plane-update-sf-dmg-area:</p><ul>
<li>shard-rkl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/Patchwork_169493v6/shard-rkl-7/igt@kms_psr2_sf@psr2-overlay-p=
lane-update-sf-dmg-area.html">SKIP</a> (<a href=3D"https://gitlab.freedeskt=
op.org/drm/i915/kernel/-/issues/11520">i915#11520</a>) +11 other tests skip=
</li>
<li>shard-tglu-1:       NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/Patchwork_169493v6/shard-tglu-1/igt@kms_psr2_sf@psr2-overlay-=
plane-update-sf-dmg-area.html">SKIP</a> (<a href=3D"https://gitlab.freedesk=
top.org/drm/i915/kernel/-/issues/11520">i915#11520</a>) +5 other tests skip=
</li>
</ul></li>
<li>
<p>igt@kms_psr2_su@frontbuffer-xrgb8888:</p><ul>
<li>shard-tglu-1:       NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/Patchwork_169493v6/shard-tglu-1/igt@kms_psr2_su@frontbuffer-x=
rgb8888.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/=
kernel/-/issues/9683">i915#9683</a>)</li>
</ul></li>
<li>
<p>igt@kms_psr2_su@page_flip-xrgb8888:</p><ul>
<li>shard-rkl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/Patchwork_169493v6/shard-rkl-4/igt@kms_psr2_su@page_flip-xrgb=
8888.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/ker=
nel/-/issues/9683">i915#9683</a>) +1 other test skip</li>
</ul></li>
<li>
<p>igt@kms_psr@fbc-pr-primary-mmap-cpu:</p><ul>
<li>shard-glk:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/Patchwork_169493v6/shard-glk3/igt@kms_psr@fbc-pr-primary-mmap=
-cpu.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/ker=
nel/-/issues/17480">i915#17480</a>) +9 other tests skip</li>
</ul></li>
<li>
<p>igt@kms_psr@fbc-pr-primary-render:</p><ul>
<li>shard-glk10:        NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/Patchwork_169493v6/shard-glk10/igt@kms_psr@fbc-pr-primary-ren=
der.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kern=
el/-/issues/17480">i915#17480</a>) +16 other tests skip</li>
</ul></li>
<li>
<p>igt@kms_psr@fbc-pr-sprite-render:</p><ul>
<li>shard-tglu-1:       NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/Patchwork_169493v6/shard-tglu-1/igt@kms_psr@fbc-pr-sprite-ren=
der.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kern=
el/-/issues/9732">i915#9732</a>) +13 other tests skip</li>
<li>shard-dg1:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/Patchwork_169493v6/shard-dg1-14/igt@kms_psr@fbc-pr-sprite-ren=
der.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kern=
el/-/issues/1072">i915#1072</a> / <a href=3D"https://gitlab.freedesktop.org=
/drm/i915/kernel/-/issues/9732">i915#9732</a>) +15 other tests skip</li>
</ul></li>
<li>
<p>igt@kms_psr@fbc-psr-cursor-plane-onoff:</p><ul>
<li>shard-tglu:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/Patchwork_169493v6/shard-tglu-10/igt@kms_psr@fbc-psr-cursor-p=
lane-onoff.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i9=
15/kernel/-/issues/9732">i915#9732</a>) +21 other tests skip</li>
</ul></li>
<li>
<p>igt@kms_psr@fbc-psr-primary-blt:</p><ul>
<li>shard-dg2:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/Patchwork_169493v6/shard-dg2-7/igt@kms_psr@fbc-psr-primary-bl=
t.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel=
/-/issues/1072">i915#1072</a> / <a href=3D"https://gitlab.freedesktop.org/d=
rm/i915/kernel/-/issues/9732">i915#9732</a>) +4 other tests skip</li>
</ul></li>
<li>
<p>igt@kms_psr@fbc-psr2-sprite-mmap-cpu:</p><ul>
<li>shard-glk11:        NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/Patchwork_169493v6/shard-glk11/igt@kms_psr@fbc-psr2-sprite-mm=
ap-cpu.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/k=
ernel/-/issues/17480">i915#17480</a>) +7 other tests skip</li>
</ul></li>
<li>
<p>igt@kms_psr@pr-sprite-plane-onoff:</p><ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/Patchwork_169493v6/shard-mtlp-6/igt@kms_psr@pr-sprite-plane-o=
noff.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/ker=
nel/-/issues/9688">i915#9688</a>) +1 other test skip</li>
</ul></li>
<li>
<p>igt@kms_psr@psr-primary-page-flip:</p><ul>
<li>shard-glk10:        NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/Patchwork_169493v6/shard-glk10/igt@kms_psr@psr-primary-page-f=
lip.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kern=
el/-/issues/17480">i915#17480</a> / <a href=3D"https://gitlab.freedesktop.o=
rg/drm/i915/kernel/-/issues/9732">i915#9732</a>)</li>
</ul></li>
<li>
<p>igt@kms_psr@psr-sprite-plane-move:</p><ul>
<li>shard-rkl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/Patchwork_169493v6/shard-rkl-8/igt@kms_psr@psr-sprite-plane-m=
ove.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kern=
el/-/issues/1072">i915#1072</a> / <a href=3D"https://gitlab.freedesktop.org=
/drm/i915/kernel/-/issues/9732">i915#9732</a>) +19 other tests skip</li>
</ul></li>
<li>
<p>igt@kms_psr_stress_test@flip-primary-invalidate-overlay:</p><ul>
<li>shard-tglu-1:       NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/Patchwork_169493v6/shard-tglu-1/igt@kms_psr_stress_test@flip-=
primary-invalidate-overlay.html">SKIP</a> (<a href=3D"https://gitlab.freede=
sktop.org/drm/i915/kernel/-/issues/15949">i915#15949</a>)</li>
<li>shard-dg1:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/Patchwork_169493v6/shard-dg1-14/igt@kms_psr_stress_test@flip-=
primary-invalidate-overlay.html">SKIP</a> (<a href=3D"https://gitlab.freede=
sktop.org/drm/i915/kernel/-/issues/15949">i915#15949</a>)</li>
<li>shard-glk:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/Patchwork_169493v6/shard-glk3/igt@kms_psr_stress_test@flip-pr=
imary-invalidate-overlay.html">SKIP</a> (<a href=3D"https://gitlab.freedesk=
top.org/drm/i915/kernel/-/issues/17554">i915#17554</a>)</li>
</ul></li>
<li>
<p>igt@kms_rotation_crc@multiplane-rotation-cropping-bottom:</p><ul>
<li>shard-glk:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/Patchwork_169493v6/shard-glk3/igt@kms_rotation_crc@multiplane=
-rotation-cropping-bottom.html">INCOMPLETE</a> (<a href=3D"https://gitlab.f=
reedesktop.org/drm/i915/kernel/-/issues/15500">i915#15500</a> / <a href=3D"=
https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16184">i915#16184</=
a>)</li>
</ul></li>
<li>
<p>igt@kms_rotation_crc@primary-4-tiled-reflect-x-0:</p><ul>
<li>shard-tglu-1:       NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/Patchwork_169493v6/shard-tglu-1/igt@kms_rotation_crc@primary-=
4-tiled-reflect-x-0.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.o=
rg/drm/i915/kernel/-/issues/5289">i915#5289</a>)</li>
</ul></li>
<li>
<p>igt@kms_rotation_crc@primary-4-tiled-reflect-x-180:</p><ul>
<li>shard-rkl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/Patchwork_169493v6/shard-rkl-5/igt@kms_rotation_crc@primary-4=
-tiled-reflect-x-180.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.=
org/drm/i915/kernel/-/issues/5289">i915#5289</a>) +1 other test skip</li>
</ul></li>
<li>
<p>igt@kms_rotation_crc@primary-y-tiled-reflect-x-270:</p><ul>
<li>shard-glk10:        NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/Patchwork_169493v6/shard-glk10/igt@kms_rotation_crc@primary-y=
-tiled-reflect-x-270.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.=
org/drm/i915/kernel/-/issues/17488">i915#17488</a>) +1 other test skip</li>
</ul></li>
<li>
<p>igt@kms_rotation_crc@primary-yf-tiled-reflect-x-270:</p><ul>
<li>shard-dg1:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/Patchwork_169493v6/shard-dg1-15/igt@kms_rotation_crc@primary-=
yf-tiled-reflect-x-270.html">SKIP</a> (<a href=3D"https://gitlab.freedeskto=
p.org/drm/i915/kernel/-/issues/17432">i915#17432</a> / <a href=3D"https://g=
itlab.freedesktop.org/drm/i915/kernel/-/issues/5289">i915#5289</a>)</li>
</ul></li>
<li>
<p>igt@kms_rotation_crc@primary-yf-tiled-reflect-x-90:</p><ul>
<li>shard-dg2:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/Patchwork_169493v6/shard-dg2-6/igt@kms_rotation_crc@primary-y=
f-tiled-reflect-x-90.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.=
org/drm/i915/kernel/-/issues/12755">i915#12755</a> / <a href=3D"https://git=
lab.freedesktop.org/drm/i915/kernel/-/issues/15867">i915#15867</a> / <a hre=
f=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5190">i915#519=
0</a>)</li>
</ul></li>
<li>
<p>igt@kms_scaling_modes@scaling-mode-none:</p><ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/Patchwork_169493v6/shard-mtlp-6/igt@kms_scaling_modes@scaling=
-mode-none.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i9=
15/kernel/-/issues/3555">i915#3555</a> / <a href=3D"https://gitlab.freedesk=
top.org/drm/i915/kernel/-/issues/5030">i915#5030</a> / <a href=3D"https://g=
itlab.freedesktop.org/drm/i915/kernel/-/issues/9041">i915#9041</a>)</li>
</ul></li>
<li>
<p>igt@kms_scaling_modes@scaling-mode-none@pipe-a-edp-1:</p><ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/Patchwork_169493v6/shard-mtlp-6/igt@kms_scaling_modes@scaling=
-mode-none@pipe-a-edp-1.html">SKIP</a> (<a href=3D"https://gitlab.freedeskt=
op.org/drm/i915/kernel/-/issues/5030">i915#5030</a>) +2 other tests skip</l=
i>
</ul></li>
<li>
<p>igt@kms_scaling_modes@scaling-mode-none@pipe-d-edp-1:</p><ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/Patchwork_169493v6/shard-mtlp-6/igt@kms_scaling_modes@scaling=
-mode-none@pipe-d-edp-1.html">SKIP</a> (<a href=3D"https://gitlab.freedeskt=
op.org/drm/i915/kernel/-/issues/5030">i915#5030</a> / <a href=3D"https://gi=
tlab.freedesktop.org/drm/i915/kernel/-/issues/9041">i915#9041</a>)</li>
</ul></li>
<li>
<p>igt@kms_tiled_display@basic-test-pattern-with-chamelium:</p><ul>
<li>shard-tglu:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/Patchwork_169493v6/shard-tglu-2/igt@kms_tiled_display@basic-t=
est-pattern-with-chamelium.html">SKIP</a> (<a href=3D"https://gitlab.freede=
sktop.org/drm/i915/kernel/-/issues/8623">i915#8623</a>)</li>
</ul></li>
<li>
<p>igt@kms_tv_load_detect@load-detect:</p><ul>
<li>shard-dg2:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/Patchwork_169493v6/shard-dg2-7/igt@kms_tv_load_detect@load-de=
tect.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/ker=
nel/-/issues/17445">i915#17445</a>)</li>
<li>shard-dg1:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/Patchwork_169493v6/shard-dg1-18/igt@kms_tv_load_detect@load-d=
etect.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/ke=
rnel/-/issues/17445">i915#17445</a>)</li>
</ul></li>
<li>
<p>igt@kms_vblank@ts-continuation-dpms-suspend:</p><ul>
<li>shard-snb:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_19395/shard-snb7/igt@kms_vblank@ts-continuation-dpms-suspend.html">=
PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/Patchwor=
k_169493v6/shard-snb4/igt@kms_vblank@ts-continuation-dpms-suspend.html">INC=
OMPLETE</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/is=
sues/12276">i915#12276</a> / <a href=3D"https://gitlab.freedesktop.org/drm/=
i915/kernel/-/issues/13356">i915#13356</a>) +1 other test incomplete</li>
</ul></li>
<li>
<p>igt@kms_vblank@ts-continuation-dpms-suspend@pipe-c-hdmi-a-1:</p><ul>
<li>shard-glk:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/Patchwork_169493v6/shard-glk3/igt@kms_vblank@ts-continuation-=
dpms-suspend@pipe-c-hdmi-a-1.html">INCOMPLETE</a> (<a href=3D"https://gitla=
b.freedesktop.org/drm/i915/kernel/-/issues/12276">i915#12276</a> / <a href=
=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13356">i915#133=
56</a>) +1 other test incomplete</li>
</ul></li>
<li>
<p>igt@kms_vblank@ts-continuation-suspend:</p><ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/Patchwork_169493v6/shard-mtlp-7/igt@kms_vblank@ts-continuatio=
n-suspend.html">INCOMPLETE</a> (<a href=3D"https://gitlab.freedesktop.org/d=
rm/i915/kernel/-/issues/12276">i915#12276</a>) +1 other test incomplete</li=
>
</ul></li>
<li>
<p>igt@kms_vblank@ts-continuation-suspend@pipe-a-edp-1:</p><ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/Patchwork_169493v6/shard-mtlp-7/igt@kms_vblank@ts-continuatio=
n-suspend@pipe-a-edp-1.html">FAIL</a> (<a href=3D"https://gitlab.freedeskto=
p.org/drm/i915/kernel/-/issues/17209">i915#17209</a>)</li>
</ul></li>
<li>
<p>igt@kms_vrr@flip-basic-fastset:</p><ul>
<li>shard-rkl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/Patchwork_169493v6/shard-rkl-4/igt@kms_vrr@flip-basic-fastset=
.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/=
-/issues/9906">i915#9906</a>)</li>
</ul></li>
<li>
<p>igt@kms_vrr@flip-dpms:</p><ul>
<li>shard-glk11:        NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/Patchwork_169493v6/shard-glk11/igt@kms_vrr@flip-dpms.html">SK=
IP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/=
17520">i915#17520</a>)</li>
</ul></li>
<li>
<p>igt@kms_vrr@flip-suspend:</p><ul>
<li>shard-glk:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/Patchwork_169493v6/shard-glk3/igt@kms_vrr@flip-suspend.html">=
SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issue=
s/17520">i915#17520</a>)</li>
</ul></li>
<li>
<p>igt@kms_vrr@flipline:</p><ul>
<li>shard-glk10:        NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/Patchwork_169493v6/shard-glk10/igt@kms_vrr@flipline.html">SKI=
P</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/1=
7520">i915#17520</a>) +1 other test skip</li>
</ul></li>
<li>
<p>igt@kms_vrr@lobf:</p><ul>
<li>shard-dg1:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/Patchwork_169493v6/shard-dg1-18/igt@kms_vrr@lobf.html">SKIP</=
a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/1192=
0">i915#11920</a>)</li>
</ul></li>
<li>
<p>igt@kms_vrr@negative-basic:</p><ul>
<li>shard-tglu:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/Patchwork_169493v6/shard-tglu-10/igt@kms_vrr@negative-basic.h=
tml">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/=
issues/3555">i915#3555</a> / <a href=3D"https://gitlab.freedesktop.org/drm/=
i915/kernel/-/issues/9906">i915#9906</a>)</li>
</ul></li>
<li>
<p>igt@perf@gen12-unprivileged-single-ctx-counters:</p><ul>
<li>shard-glk11:        NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/Patchwork_169493v6/shard-glk11/igt@perf@gen12-unprivileged-si=
ngle-ctx-counters.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org=
/drm/i915/kernel/-/issues/17536">i915#17536</a>)</li>
</ul></li>
<li>
<p>igt@perf@mi-rpc:</p><ul>
<li>shard-dg1:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/Patchwork_169493v6/shard-dg1-14/igt@perf@mi-rpc.html">SKIP</a=
> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2434"=
>i915#2434</a>)</li>
</ul></li>
<li>
<p>igt@perf@unprivileged-single-ctx-counters:</p><ul>
<li>shard-rkl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/Patchwork_169493v6/shard-rkl-7/igt@perf@unprivileged-single-c=
tx-counters.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i=
915/kernel/-/issues/2433">i915#2433</a>)</li>
<li>shard-tglu-1:       NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/Patchwork_169493v6/shard-tglu-1/igt@perf@unprivileged-single-=
ctx-counters.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/=
i915/kernel/-/issues/17455">i915#17455</a>) +5 other tests skip</li>
</ul></li>
<li>
<p>igt@perf_pmu@module-unload:</p><ul>
<li>shard-rkl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/Patchwork_169493v6/shard-rkl-4/igt@perf_pmu@module-unload.htm=
l">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/is=
sues/17119">i915#17119</a>)</li>
</ul></li>
<li>
<p>igt@perf_pmu@rc6-all-gts:</p><ul>
<li>shard-glk10:        NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/Patchwork_169493v6/shard-glk10/igt@perf_pmu@rc6-all-gts.html"=
>SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issu=
es/17583">i915#17583</a>)</li>
</ul></li>
<li>
<p>igt@prime_udl@share-import:</p><ul>
<li>shard-rkl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/Patchwork_169493v6/shard-rkl-8/igt@prime_udl@share-import.htm=
l">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/is=
sues/16420">i915#16420</a>)</li>
<li>shard-tglu-1:       NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/Patchwork_169493v6/shard-tglu-1/igt@prime_udl@share-import.ht=
ml">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/i=
ssues/16420">i915#16420</a>)</li>
</ul></li>
<li>
<p>igt@prime_vgem@coherency-gtt:</p><ul>
<li>shard-glk10:        NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/Patchwork_169493v6/shard-glk10/igt@prime_vgem@coherency-gtt.h=
tml">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/=
issues/17467">i915#17467</a>)</li>
</ul></li>
<li>
<p>igt@prime_vgem@fence-flip-hang:</p><ul>
<li>shard-tglu-1:       NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/Patchwork_169493v6/shard-tglu-1/igt@prime_vgem@fence-flip-han=
g.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel=
/-/issues/17448">i915#17448</a>)</li>
</ul></li>
<li>
<p>igt@prime_vgem@fence-read-hang:</p><ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/Patchwork_169493v6/shard-mtlp-6/igt@prime_vgem@fence-read-han=
g.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel=
/-/issues/3708">i915#3708</a>)</li>
</ul></li>
<li>
<p>igt@prime_vgem@fence-write-hang:</p><ul>
<li>shard-rkl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/Patchwork_169493v6/shard-rkl-4/igt@prime_vgem@fence-write-han=
g.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel=
/-/issues/17448">i915#17448</a> / <a href=3D"https://gitlab.freedesktop.org=
/drm/i915/kernel/-/issues/3708">i915#3708</a>)</li>
</ul></li>
<li>
<p>igt@tools_test@sysfs_l3_parity:</p><ul>
<li>shard-rkl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/Patchwork_169493v6/shard-rkl-4/igt@tools_test@sysfs_l3_parity=
.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/=
-/issues/17447">i915#17447</a>)</li>
</ul></li>
</ul><h4>Possible fixes</h4><ul>
<li>
<p>igt@drm_read@short-buffer-block:</p><ul>
<li>shard-dg2:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_19395/shard-dg2-7/igt@drm_read@short-buffer-block.html">SKIP</a> (<=
a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17359">i9=
15#17359</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/Pat=
chwork_169493v6/shard-dg2-1/igt@drm_read@short-buffer-block.html">PASS</a> =
+2 other tests pass</li>
</ul></li>
<li>
<p>igt@gem_ccs@suspend-resume:</p><ul>
<li>shard-dg2:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_19395/shard-dg2-5/igt@gem_ccs@suspend-resume.html">INCOMPLETE</a> (=
<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13356">i=
915#13356</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-=
/issues/16348">i915#16348</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/Patchwork_169493v6/shard-dg2-7/igt@gem_ccs@suspend-resume.htm=
l">PASS</a> +1 other test pass</li>
</ul></li>
<li>
<p>igt@gem_eio@in-flight-suspend:</p><ul>
<li>shard-dg1:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_19395/shard-dg1-12/igt@gem_eio@in-flight-suspend.html">DMESG-WARN</=
a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/1339=
0">i915#13390</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i915/kern=
el/-/issues/4391">i915#4391</a> / <a href=3D"https://gitlab.freedesktop.org=
/drm/i915/kernel/-/issues/4423">i915#4423</a>) -&gt; <a href=3D"https://int=
el-gfx-ci.01.org/tree/drm-tip/Patchwork_169493v6/shard-dg1-16/igt@gem_eio@i=
n-flight-suspend.html">PASS</a></li>
</ul></li>
<li>
<p>igt@gem_linear_blits@normal:</p><ul>
<li>shard-dg1:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_19395/shard-dg1-14/igt@gem_linear_blits@normal.html">FAIL</a> (<a h=
ref=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15391">i915#=
15391</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/Patchw=
ork_169493v6/shard-dg1-18/igt@gem_linear_blits@normal.html">PASS</a></li>
</ul></li>
<li>
<p>igt@gem_workarounds@suspend-resume-fd:</p><ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_19395/shard-rkl-4/igt@gem_workarounds@suspend-resume-fd.html">INCOM=
PLETE</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issu=
es/13356">i915#13356</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree=
/drm-tip/Patchwork_169493v6/shard-rkl-4/igt@gem_workarounds@suspend-resume-=
fd.html">PASS</a> +3 other tests pass</li>
</ul></li>
<li>
<p>igt@i915_suspend@debugfs-reader:</p><ul>
<li>shard-mtlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_19395/shard-mtlp-8/igt@i915_suspend@debugfs-reader.html">INCOMPLETE=
</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17=
182">i915#17182</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-=
tip/Patchwork_169493v6/shard-mtlp-6/igt@i915_suspend@debugfs-reader.html">P=
ASS</a></li>
</ul></li>
<li>
<p>igt@kms_async_flips@alternate-sync-async-flip-atomic:</p><ul>
<li>shard-dg1:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_19395/shard-dg1-15/igt@kms_async_flips@alternate-sync-async-flip-at=
omic.html">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/ker=
nel/-/issues/14888">i915#14888</a>) -&gt; <a href=3D"https://intel-gfx-ci.0=
1.org/tree/drm-tip/Patchwork_169493v6/shard-dg1-14/igt@kms_async_flips@alte=
rnate-sync-async-flip-atomic.html">PASS</a> +1 other test pass</li>
</ul></li>
<li>
<p>igt@kms_async_flips@async-flip-suspend-resume@pipe-c-edp-1:</p><ul>
<li>shard-mtlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_19395/shard-mtlp-1/igt@kms_async_flips@async-flip-suspend-resume@pi=
pe-c-edp-1.html">ABORT</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i=
915/kernel/-/issues/17175">i915#17175</a>) -&gt; <a href=3D"https://intel-g=
fx-ci.01.org/tree/drm-tip/Patchwork_169493v6/shard-mtlp-7/igt@kms_async_fli=
ps@async-flip-suspend-resume@pipe-c-edp-1.html">PASS</a></li>
</ul></li>
<li>
<p>igt@kms_big_fb@x-tiled-64bpp-rotate-180:</p><ul>
<li>shard-dg2:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_19395/shard-dg2-7/igt@kms_big_fb@x-tiled-64bpp-rotate-180.html">SKI=
P</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/1=
7356">i915#17356</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm=
-tip/Patchwork_169493v6/shard-dg2-8/igt@kms_big_fb@x-tiled-64bpp-rotate-180=
.html">PASS</a> +40 other tests pass</li>
</ul></li>
<li>
<p>igt@kms_busy@basic:</p><ul>
<li>shard-dg2:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_19395/shard-dg2-7/igt@kms_busy@basic.html">SKIP</a> (<a href=3D"htt=
ps://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11190">i915#11190</a> =
/ <a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17356"=
>i915#17356</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/=
Patchwork_169493v6/shard-dg2-1/igt@kms_busy@basic.html">PASS</a> +2 other t=
ests pass</li>
</ul></li>
<li>
<p>igt@kms_color@ctm-0-25:</p><ul>
<li>shard-dg2:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_19395/shard-dg2-7/igt@kms_color@ctm-0-25.html">SKIP</a> (<a href=3D=
"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12655">i915#12655<=
/a> / <a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17=
373">i915#17373</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-=
tip/Patchwork_169493v6/shard-dg2-4/igt@kms_color@ctm-0-25.html">PASS</a> +1=
 other test pass</li>
</ul></li>
<li>
<p>igt@kms_color_pipeline@plane-fixed-matrix-yuv-rgb-bt601-lut1d:</p><ul>
<li>shard-dg2:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_19395/shard-dg2-7/igt@kms_color_pipeline@plane-fixed-matrix-yuv-rgb=
-bt601-lut1d.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/=
i915/kernel/-/issues/15529">i915#15529</a>) -&gt; <a href=3D"https://intel-=
gfx-ci.01.org/tree/drm-tip/Patchwork_169493v6/shard-dg2-8/igt@kms_color_pip=
eline@plane-fixed-matrix-yuv-rgb-bt601-lut1d.html">PASS</a></li>
</ul></li>
<li>
<p>igt@kms_cursor_crc@cursor-sliding-128x42@pipe-a-hdmi-a-1:</p><ul>
<li>shard-tglu:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_19395/shard-tglu-10/igt@kms_cursor_crc@cursor-sliding-128x42@pipe-a=
-hdmi-a-1.html">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i91=
5/kernel/-/issues/13566">i915#13566</a>) -&gt; <a href=3D"https://intel-gfx=
-ci.01.org/tree/drm-tip/Patchwork_169493v6/shard-tglu-3/igt@kms_cursor_crc@=
cursor-sliding-128x42@pipe-a-hdmi-a-1.html">PASS</a> +1 other test pass</li=
>
</ul></li>
<li>
<p>igt@kms_fbcon_fbt@fbc-suspend:</p><ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_19395/shard-rkl-6/igt@kms_fbcon_fbt@fbc-suspend.html">INCOMPLETE</a=
> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9878"=
>i915#9878</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/P=
atchwork_169493v6/shard-rkl-7/igt@kms_fbcon_fbt@fbc-suspend.html">PASS</a><=
/li>
</ul></li>
<li>
<p>igt@kms_flip@basic-flip-vs-dpms:</p><ul>
<li>shard-dg2:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_19395/shard-dg2-7/igt@kms_flip@basic-flip-vs-dpms.html">SKIP</a> (<=
a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5354">i91=
5#5354</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/Patch=
work_169493v6/shard-dg2-8/igt@kms_flip@basic-flip-vs-dpms.html">PASS</a> +5=
 other tests pass</li>
</ul></li>
<li>
<p>igt@kms_flip@flip-vs-suspend-interruptible:</p><ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_19395/shard-rkl-7/igt@kms_flip@flip-vs-suspend-interruptible.html">=
INCOMPLETE</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-=
/issues/16276">i915#16276</a> / <a href=3D"https://gitlab.freedesktop.org/d=
rm/i915/kernel/-/issues/6113">i915#6113</a>) -&gt; <a href=3D"https://intel=
-gfx-ci.01.org/tree/drm-tip/Patchwork_169493v6/shard-rkl-8/igt@kms_flip@fli=
p-vs-suspend-interruptible.html">PASS</a></li>
</ul></li>
<li>
<p>igt@kms_flip@nonexisting-fb-interruptible:</p><ul>
<li>shard-dg1:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_19395/shard-dg1-15/igt@kms_flip@nonexisting-fb-interruptible.html">=
DMESG-WARN</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-=
/issues/4423">i915#4423</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/t=
ree/drm-tip/Patchwork_169493v6/shard-dg1-17/igt@kms_flip@nonexisting-fb-int=
erruptible.html">PASS</a></li>
</ul></li>
<li>
<p>igt@kms_flip_scaled_crc@flip-64bpp-linear-to-16bpp-linear-downscaling:</=
p><ul>
<li>shard-dg2:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_19395/shard-dg2-7/igt@kms_flip_scaled_crc@flip-64bpp-linear-to-16bp=
p-linear-downscaling.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.=
org/drm/i915/kernel/-/issues/3555">i915#3555</a> / <a href=3D"https://gitla=
b.freedesktop.org/drm/i915/kernel/-/issues/8813">i915#8813</a>) -&gt; <a hr=
ef=3D"https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_169493v6/shard-dg2=
-8/igt@kms_flip_scaled_crc@flip-64bpp-linear-to-16bpp-linear-downscaling.ht=
ml">PASS</a> +1 other test pass</li>
</ul></li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-1p-offscreen-pri-indfb-draw-mmap-cpu:</=
p><ul>
<li>shard-dg2:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_19395/shard-dg2-7/igt@kms_frontbuffer_tracking@fbc-1p-offscreen-pri=
-indfb-draw-mmap-cpu.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.=
org/drm/i915/kernel/-/issues/16708">i915#16708</a>) -&gt; <a href=3D"https:=
//intel-gfx-ci.01.org/tree/drm-tip/Patchwork_169493v6/shard-dg2-1/igt@kms_f=
rontbuffer_tracking@fbc-1p-offscreen-pri-indfb-draw-mmap-cpu.html">PASS</a>=
 +1 other test pass</li>
</ul></li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-1p-primscrn-spr-indfb-draw-render:</p><=
ul>
<li>shard-dg1:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_19395/shard-dg1-14/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-spr=
-indfb-draw-render.html">FAIL</a> -&gt; <a href=3D"https://intel-gfx-ci.01.=
org/tree/drm-tip/Patchwork_169493v6/shard-dg1-15/igt@kms_frontbuffer_tracki=
ng@fbc-1p-primscrn-spr-indfb-draw-render.html">PASS</a></li>
</ul></li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-indfb-scaledprimary:</p><ul>
<li>shard-dg2:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_19395/shard-dg2-7/igt@kms_frontbuffer_tracking@fbc-indfb-scaledprim=
ary.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kern=
el/-/issues/16708">i915#16708</a> / <a href=3D"https://gitlab.freedesktop.o=
rg/drm/i915/kernel/-/issues/5354">i915#5354</a>) -&gt; <a href=3D"https://i=
ntel-gfx-ci.01.org/tree/drm-tip/Patchwork_169493v6/shard-dg2-1/igt@kms_fron=
tbuffer_tracking@fbc-indfb-scaledprimary.html">PASS</a> +7 other tests pass=
</li>
</ul></li>
<li>
<p>igt@kms_frontbuffer_tracking@fbchdr-1p-primscrn-cur-indfb-onoff:</p><ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_19395/shard-rkl-3/igt@kms_frontbuffer_tracking@fbchdr-1p-primscrn-c=
ur-indfb-onoff.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/dr=
m/i915/kernel/-/issues/15989">i915#15989</a>) -&gt; <a href=3D"https://inte=
l-gfx-ci.01.org/tree/drm-tip/Patchwork_169493v6/shard-rkl-6/igt@kms_frontbu=
ffer_tracking@fbchdr-1p-primscrn-cur-indfb-onoff.html">PASS</a> +20 other t=
ests pass</li>
</ul></li>
<li>
<p>igt@kms_frontbuffer_tracking@hdr-2p-primscrn-spr-indfb-draw-mmap-cpu:</p=
><ul>
<li>shard-glk:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_19395/shard-glk1/igt@kms_frontbuffer_tracking@hdr-2p-primscrn-spr-i=
ndfb-draw-mmap-cpu.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.or=
g/drm/i915/kernel/-/issues/17517">i915#17517</a>) -&gt; <a href=3D"https://=
intel-gfx-ci.01.org/tree/drm-tip/Patchwork_169493v6/shard-glk8/igt@kms_fron=
tbuffer_tracking@hdr-2p-primscrn-spr-indfb-draw-mmap-cpu.html">PASS</a> +8 =
other tests pass</li>
</ul></li>
<li>
<p>igt@kms_hdmi_audio_bw@suspend-mem-audio-recovery:</p><ul>
<li>shard-dg2:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_19395/shard-dg2-7/igt@kms_hdmi_audio_bw@suspend-mem-audio-recovery.=
html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-=
/issues/17357">i915#17357</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/Patchwork_169493v6/shard-dg2-8/igt@kms_hdmi_audio_bw@suspend-=
mem-audio-recovery.html">PASS</a></li>
</ul></li>
<li>
<p>igt@kms_hdr@static-toggle:</p><ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_19395/shard-rkl-3/igt@kms_hdr@static-toggle.html">SKIP</a> (<a href=
=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16644">i915#166=
44</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues=
/3555">i915#3555</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i915/k=
ernel/-/issues/8228">i915#8228</a>) -&gt; <a href=3D"https://intel-gfx-ci.0=
1.org/tree/drm-tip/Patchwork_169493v6/shard-rkl-6/igt@kms_hdr@static-toggle=
.html">PASS</a></li>
</ul></li>
<li>
<p>igt@kms_invalid_mode@overflow-vrefresh:</p><ul>
<li>shard-dg2:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_19395/shard-dg2-7/igt@kms_invalid_mode@overflow-vrefresh.html">SKIP=
</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16=
746">i915#16746</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-=
tip/Patchwork_169493v6/shard-dg2-8/igt@kms_invalid_mode@overflow-vrefresh.h=
tml">PASS</a></li>
</ul></li>
<li>
<p>igt@kms_invalid_mode@uint-max-clock:</p><ul>
<li>shard-dg2:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_19395/shard-dg2-7/igt@kms_invalid_mode@uint-max-clock.html">SKIP</a=
> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16746=
">i915#16746</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i915/kerne=
l/-/issues/3555">i915#3555</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.or=
g/tree/drm-tip/Patchwork_169493v6/shard-dg2-5/igt@kms_invalid_mode@uint-max=
-clock.html">PASS</a></li>
</ul></li>
<li>
<p>igt@kms_pipe_crc_basic@suspend-read-crc:</p><ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_19395/shard-rkl-3/igt@kms_pipe_crc_basic@suspend-read-crc.html">INC=
OMPLETE</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/is=
sues/12756">i915#12756</a> / <a href=3D"https://gitlab.freedesktop.org/drm/=
i915/kernel/-/issues/13476">i915#13476</a>) -&gt; <a href=3D"https://intel-=
gfx-ci.01.org/tree/drm-tip/Patchwork_169493v6/shard-rkl-2/igt@kms_pipe_crc_=
basic@suspend-read-crc.html">PASS</a></li>
</ul></li>
<li>
<p>igt@kms_plane@plane-panning-bottom-right-suspend@pipe-a:</p><ul>
<li>shard-glk:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_19395/shard-glk8/igt@kms_plane@plane-panning-bottom-right-suspend@p=
ipe-a.html">INCOMPLETE</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i=
915/kernel/-/issues/13026">i915#13026</a> / <a href=3D"https://gitlab.freed=
esktop.org/drm/i915/kernel/-/issues/13356">i915#13356</a>) -&gt; <a href=3D=
"https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_169493v6/shard-glk1/igt=
@kms_plane@plane-panning-bottom-right-suspend@pipe-a.html">PASS</a></li>
</ul></li>
<li>
<p>igt@kms_plane@plane-panning-bottom-right-suspend@pipe-b:</p><ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_19395/shard-rkl-1/igt@kms_plane@plane-panning-bottom-right-suspend@=
pipe-b.html">ABORT</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/=
kernel/-/issues/15132">i915#15132</a>) -&gt; <a href=3D"https://intel-gfx-c=
i.01.org/tree/drm-tip/Patchwork_169493v6/shard-rkl-5/igt@kms_plane@plane-pa=
nning-bottom-right-suspend@pipe-b.html">PASS</a> +1 other test pass</li>
</ul></li>
<li>
<p>igt@kms_plane_scaling@invalid-num-scalers:</p><ul>
<li>shard-dg2:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_19395/shard-dg2-7/igt@kms_plane_scaling@invalid-num-scalers.html">S=
KIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues=
/17356">i915#17356</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i915=
/kernel/-/issues/3555">i915#3555</a> / <a href=3D"https://gitlab.freedeskto=
p.org/drm/i915/kernel/-/issues/6953">i915#6953</a> / <a href=3D"https://git=
lab.freedesktop.org/drm/i915/kernel/-/issues/9423">i915#9423</a>) -&gt; <a =
href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_169493v6/shard-d=
g2-8/igt@kms_plane_scaling@invalid-num-scalers.html">PASS</a></li>
</ul></li>
<li>
<p>igt@kms_plane_scaling@plane-upscale-20x20-with-pixel-format@pipe-c:</p><=
ul>
<li>shard-dg2:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_19395/shard-dg2-7/igt@kms_plane_scaling@plane-upscale-20x20-with-pi=
xel-format@pipe-c.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org=
/drm/i915/kernel/-/issues/15329">i915#15329</a>) -&gt; <a href=3D"https://i=
ntel-gfx-ci.01.org/tree/drm-tip/Patchwork_169493v6/shard-dg2-1/igt@kms_plan=
e_scaling@plane-upscale-20x20-with-pixel-format@pipe-c.html">PASS</a> +11 o=
ther tests pass</li>
</ul></li>
<li>
<p>igt@kms_plane_scaling@planes-downscale-factor-0-5-upscale-20x20:</p><ul>
<li>shard-dg2:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_19395/shard-dg2-7/igt@kms_plane_scaling@planes-downscale-factor-0-5=
-upscale-20x20.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/dr=
m/i915/kernel/-/issues/15329">i915#15329</a> / <a href=3D"https://gitlab.fr=
eedesktop.org/drm/i915/kernel/-/issues/17356">i915#17356</a> / <a href=3D"h=
ttps://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9423">i915#9423</a>)=
 -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_169493=
v6/shard-dg2-1/igt@kms_plane_scaling@planes-downscale-factor-0-5-upscale-20=
x20.html">PASS</a> +2 other tests pass</li>
</ul></li>
<li>
<p>igt@kms_plane_scaling@planes-downscale-factor-0-75-upscale-factor-0-25:<=
/p><ul>
<li>shard-dg2:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_19395/shard-dg2-7/igt@kms_plane_scaling@planes-downscale-factor-0-7=
5-upscale-factor-0-25.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop=
.org/drm/i915/kernel/-/issues/15329">i915#15329</a> / <a href=3D"https://gi=
tlab.freedesktop.org/drm/i915/kernel/-/issues/17356">i915#17356</a> / <a hr=
ef=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6953">i915#69=
53</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues=
/9423">i915#9423</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm=
-tip/Patchwork_169493v6/shard-dg2-5/igt@kms_plane_scaling@planes-downscale-=
factor-0-75-upscale-factor-0-25.html">PASS</a></li>
</ul></li>
<li>
<p>igt@kms_plane_scaling@planes-downscale-factor-0-75-upscale-factor-0-25@p=
ipe-d:</p><ul>
<li>shard-dg2:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_19395/shard-dg2-7/igt@kms_plane_scaling@planes-downscale-factor-0-7=
5-upscale-factor-0-25@pipe-d.html">SKIP</a> (<a href=3D"https://gitlab.free=
desktop.org/drm/i915/kernel/-/issues/15329">i915#15329</a> / <a href=3D"htt=
ps://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17356">i915#17356</a>)=
 -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_169493=
v6/shard-dg2-5/igt@kms_plane_scaling@planes-downscale-factor-0-75-upscale-f=
actor-0-25@pipe-d.html">PASS</a> +3 other tests pass</li>
</ul></li>
</ul><h4>Warnings</h4><ul>
<li>
<p>igt@gem_ccs@ctrl-surf-copy:</p><ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_19395/shard-rkl-3/igt@gem_ccs@ctrl-surf-copy.html">SKIP</a> (<a hre=
f=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3555">i915#355=
5</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/=
9323">i915#9323</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-=
tip/Patchwork_169493v6/shard-rkl-6/igt@gem_ccs@ctrl-surf-copy.html">SKIP</a=
> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544=
">i915#14544</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i915/kerne=
l/-/issues/3555">i915#3555</a> / <a href=3D"https://gitlab.freedesktop.org/=
drm/i915/kernel/-/issues/9323">i915#9323</a>)</li>
</ul></li>
<li>
<p>igt@gem_ccs@large-ctrl-surf-copy:</p><ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_19395/shard-rkl-3/igt@gem_ccs@large-ctrl-surf-copy.html">SKIP</a> (=
<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13008">i=
915#13008</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/Pa=
tchwork_169493v6/shard-rkl-6/igt@gem_ccs@large-ctrl-surf-copy.html">SKIP</a=
> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13008=
">i915#13008</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i915/kerne=
l/-/issues/14544">i915#14544</a>)</li>
</ul></li>
<li>
<p>igt@gem_close_race@multigpu-basic-process:</p><ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_19395/shard-rkl-2/igt@gem_close_race@multigpu-basic-process.html">S=
KIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues=
/7697">i915#7697</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm=
-tip/Patchwork_169493v6/shard-rkl-6/igt@gem_close_race@multigpu-basic-proce=
ss.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kerne=
l/-/issues/14544">i915#14544</a> / <a href=3D"https://gitlab.freedesktop.or=
g/drm/i915/kernel/-/issues/7697">i915#7697</a>)</li>
</ul></li>
<li>
<p>igt@gem_create@create-ext-cpu-access-sanity-check:</p><ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_19395/shard-rkl-3/igt@gem_create@create-ext-cpu-access-sanity-check=
.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/=
-/issues/6335">i915#6335</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/Patchwork_169493v6/shard-rkl-6/igt@gem_create@create-ext-cpu-a=
ccess-sanity-check.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.or=
g/drm/i915/kernel/-/issues/14544">i915#14544</a> / <a href=3D"https://gitla=
b.freedesktop.org/drm/i915/kernel/-/issues/6335">i915#6335</a>)</li>
</ul></li>
<li>
<p>igt@gem_ctx_sseu@engines:</p><ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_19395/shard-rkl-6/igt@gem_ctx_sseu@engines.html">SKIP</a> (<a href=
=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#145=
44</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues=
/280">i915#280</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-t=
ip/Patchwork_169493v6/shard-rkl-5/igt@gem_ctx_sseu@engines.html">SKIP</a> (=
<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/280">i91=
5#280</a>)</li>
</ul></li>
<li>
<p>igt@gem_eio@in-flight-suspend:</p><ul>
<li>shard-mtlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_19395/shard-mtlp-7/igt@gem_eio@in-flight-suspend.html">ABORT</a> (<=
a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17165">i9=
15#17165</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/Pat=
chwork_169493v6/shard-mtlp-2/igt@gem_eio@in-flight-suspend.html">FAIL</a> (=
<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17268">i=
915#17268</a>)</li>
</ul></li>
<li>
<p>igt@gem_eio@kms:</p><ul>
<li>shard-tglu:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_19395/shard-tglu-7/igt@gem_eio@kms.html">DMESG-WARN</a> (<a href=3D=
"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13363">i915#13363<=
/a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_16=
9493v6/shard-tglu-5/igt@gem_eio@kms.html">ABORT</a> (<a href=3D"https://git=
lab.freedesktop.org/drm/i915/kernel/-/issues/13363">i915#13363</a>)</li>
</ul></li>
<li>
<p>igt@gem_exec_big@single:</p><ul>
<li>shard-tglu:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_19395/shard-tglu-4/igt@gem_exec_big@single.html">FAIL</a> (<a href=
=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15944">i915#159=
44</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork=
_169493v6/shard-tglu-2/igt@gem_exec_big@single.html">FAIL</a> (<a href=3D"h=
ttps://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15816">i915#15816</a=
>)</li>
</ul></li>
<li>
<p>igt@gem_exec_params@rsvd2-dirt:</p><ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_19395/shard-rkl-2/igt@gem_exec_params@rsvd2-dirt.html">SKIP</a> (<a=
 href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17453">i91=
5#17453</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/Patc=
hwork_169493v6/shard-rkl-6/igt@gem_exec_params@rsvd2-dirt.html">SKIP</a> (<=
a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i9=
15#14544</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/=
issues/17453">i915#17453</a>)</li>
</ul></li>
<li>
<p>igt@gem_exec_params@secure-non-root:</p><ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_19395/shard-rkl-3/igt@gem_exec_params@secure-non-root.html">SKIP</a=
> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17416=
">i915#17416</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/Patchwork_169493v6/shard-rkl-6/igt@gem_exec_params@secure-non-root.html">S=
KIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues=
/14544">i915#14544</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i915=
/kernel/-/issues/17416">i915#17416</a>)</li>
</ul></li>
<li>
<p>igt@gem_exec_reloc@basic-gtt-cpu-active:</p><ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_19395/shard-rkl-3/igt@gem_exec_reloc@basic-gtt-cpu-active.html">SKI=
P</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3=
281">i915#3281</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-t=
ip/Patchwork_169493v6/shard-rkl-6/igt@gem_exec_reloc@basic-gtt-cpu-active.h=
tml">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/=
issues/14544">i915#14544</a> / <a href=3D"https://gitlab.freedesktop.org/dr=
m/i915/kernel/-/issues/3281">i915#3281</a>) +6 other tests skip</li>
</ul></li>
<li>
<p>igt@gem_exec_reloc@basic-softpin:</p><ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_19395/shard-rkl-6/igt@gem_exec_reloc@basic-softpin.html">SKIP</a> (=
<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i=
915#14544</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-=
/issues/3281">i915#3281</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/t=
ree/drm-tip/Patchwork_169493v6/shard-rkl-5/igt@gem_exec_reloc@basic-softpin=
.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/=
-/issues/3281">i915#3281</a>) +1 other test skip</li>
</ul></li>
<li>
<p>igt@gem_lmem_evict@dontneed-evict-race:</p><ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_19395/shard-rkl-3/igt@gem_lmem_evict@dontneed-evict-race.html">SKIP=
</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/46=
13">i915#4613</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i915/kern=
el/-/issues/7582">i915#7582</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.o=
rg/tree/drm-tip/Patchwork_169493v6/shard-rkl-6/igt@gem_lmem_evict@dontneed-=
evict-race.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i9=
15/kernel/-/issues/14544">i915#14544</a> / <a href=3D"https://gitlab.freede=
sktop.org/drm/i915/kernel/-/issues/4613">i915#4613</a> / <a href=3D"https:/=
/gitlab.freedesktop.org/drm/i915/kernel/-/issues/7582">i915#7582</a>)</li>
</ul></li>
<li>
<p>igt@gem_lmem_swapping@massive-random:</p><ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_19395/shard-rkl-6/igt@gem_lmem_swapping@massive-random.html">SKIP</=
a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/1454=
4">i915#14544</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i915/kern=
el/-/issues/4613">i915#4613</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.o=
rg/tree/drm-tip/Patchwork_169493v6/shard-rkl-3/igt@gem_lmem_swapping@massiv=
e-random.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915=
/kernel/-/issues/4613">i915#4613</a>) +1 other test skip</li>
</ul></li>
<li>
<p>igt@gem_lmem_swapping@verify-random-ccs:</p><ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_19395/shard-rkl-2/igt@gem_lmem_swapping@verify-random-ccs.html">SKI=
P</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4=
613">i915#4613</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-t=
ip/Patchwork_169493v6/shard-rkl-6/igt@gem_lmem_swapping@verify-random-ccs.h=
tml">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/=
issues/14544">i915#14544</a> / <a href=3D"https://gitlab.freedesktop.org/dr=
m/i915/kernel/-/issues/4613">i915#4613</a>)</li>
</ul></li>
<li>
<p>igt@gem_pread@display:</p><ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_19395/shard-rkl-3/igt@gem_pread@display.html">SKIP</a> (<a href=3D"=
https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3282">i915#3282</a>=
) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_16949=
3v6/shard-rkl-6/igt@gem_pread@display.html">SKIP</a> (<a href=3D"https://gi=
tlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a> / <a hr=
ef=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3282">i915#32=
82</a>)</li>
</ul></li>
<li>
<p>igt@gem_pread@self:</p><ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_19395/shard-rkl-6/igt@gem_pread@self.html">SKIP</a> (<a href=3D"htt=
ps://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a> =
/ <a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3282">=
i915#3282</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/Pa=
tchwork_169493v6/shard-rkl-3/igt@gem_pread@self.html">SKIP</a> (<a href=3D"=
https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3282">i915#3282</a>=
)</li>
</ul></li>
<li>
<p>igt@gem_userptr_blits@dmabuf-unsync:</p><ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_19395/shard-rkl-6/igt@gem_userptr_blits@dmabuf-unsync.html">SKIP</a=
> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544=
">i915#14544</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i915/kerne=
l/-/issues/3297">i915#3297</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.or=
g/tree/drm-tip/Patchwork_169493v6/shard-rkl-3/igt@gem_userptr_blits@dmabuf-=
unsync.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/k=
ernel/-/issues/3297">i915#3297</a>) +3 other tests skip</li>
</ul></li>
<li>
<p>igt@gen9_exec_parse@shadow-peek:</p><ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_19395/shard-rkl-3/igt@gen9_exec_parse@shadow-peek.html">SKIP</a> (<=
a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2527">i91=
5#2527</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/Patch=
work_169493v6/shard-rkl-6/igt@gen9_exec_parse@shadow-peek.html">SKIP</a> (<=
a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i9=
15#14544</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/=
issues/2527">i915#2527</a>) +3 other tests skip</li>
</ul></li>
<li>
<p>igt@gen9_exec_parse@valid-registers:</p><ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_19395/shard-rkl-6/igt@gen9_exec_parse@valid-registers.html">SKIP</a=
> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544=
">i915#14544</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i915/kerne=
l/-/issues/2527">i915#2527</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.or=
g/tree/drm-tip/Patchwork_169493v6/shard-rkl-3/igt@gen9_exec_parse@valid-reg=
isters.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/k=
ernel/-/issues/2527">i915#2527</a>)</li>
</ul></li>
<li>
<p>igt@i915_module_load@resize-bar:</p><ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_19395/shard-rkl-2/igt@i915_module_load@resize-bar.html">SKIP</a> (<=
a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6412">i91=
5#6412</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/Patch=
work_169493v6/shard-rkl-6/igt@i915_module_load@resize-bar.html">SKIP</a> (<=
a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i9=
15#14544</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/=
issues/6412">i915#6412</a>)</li>
</ul></li>
<li>
<p>igt@i915_pm_rc6_residency@media-rc6-accuracy:</p><ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_19395/shard-rkl-3/igt@i915_pm_rc6_residency@media-rc6-accuracy.html=
">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/iss=
ues/16080">i915#16080</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i=
915/kernel/-/issues/16166">i915#16166</a>) -&gt; <a href=3D"https://intel-g=
fx-ci.01.org/tree/drm-tip/Patchwork_169493v6/shard-rkl-6/igt@i915_pm_rc6_re=
sidency@media-rc6-accuracy.html">SKIP</a> (<a href=3D"https://gitlab.freede=
sktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a> / <a href=3D"https=
://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16080">i915#16080</a> / =
<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16166">i=
915#16166</a>)</li>
</ul></li>
<li>
<p>igt@intel_hwmon@hwmon-write:</p><ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_19395/shard-rkl-6/igt@intel_hwmon@hwmon-write.html">SKIP</a> (<a hr=
ef=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#1=
4544</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issu=
es/7707">i915#7707</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/d=
rm-tip/Patchwork_169493v6/shard-rkl-3/igt@intel_hwmon@hwmon-write.html">SKI=
P</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/7=
707">i915#7707</a>)</li>
</ul></li>
<li>
<p>igt@kms_async_flips@async-flip-suspend-resume:</p><ul>
<li>shard-mtlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_19395/shard-mtlp-1/igt@kms_async_flips@async-flip-suspend-resume.ht=
ml">ABORT</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/=
issues/17175">i915#17175</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/Patchwork_169493v6/shard-mtlp-7/igt@kms_async_flips@async-flip=
-suspend-resume.html">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/d=
rm/i915/kernel/-/issues/17150">i915#17150</a>)</li>
</ul></li>
<li>
<p>igt@kms_atomic@plane-primary-overlay-mutable-zpos:</p><ul>
<li>shard-dg2:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_19395/shard-dg2-7/igt@kms_atomic@plane-primary-overlay-mutable-zpos=
.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/=
-/issues/17356">i915#17356</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.or=
g/tree/drm-tip/Patchwork_169493v6/shard-dg2-1/igt@kms_atomic@plane-primary-=
overlay-mutable-zpos.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.=
org/drm/i915/kernel/-/issues/9531">i915#9531</a>)</li>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_19395/shard-rkl-6/igt@kms_atomic@plane-primary-overlay-mutable-zpos=
.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/=
-/issues/14544">i915#14544</a> / <a href=3D"https://gitlab.freedesktop.org/=
drm/i915/kernel/-/issues/9531">i915#9531</a>) -&gt; <a href=3D"https://inte=
l-gfx-ci.01.org/tree/drm-tip/Patchwork_169493v6/shard-rkl-5/igt@kms_atomic@=
plane-primary-overlay-mutable-zpos.html">SKIP</a> (<a href=3D"https://gitla=
b.freedesktop.org/drm/i915/kernel/-/issues/9531">i915#9531</a>)</li>
</ul></li>
<li>
<p>igt@kms_big_fb@4-tiled-16bpp-rotate-180:</p><ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_19395/shard-rkl-6/igt@kms_big_fb@4-tiled-16bpp-rotate-180.html">SKI=
P</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/1=
4544">i915#14544</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i915/k=
ernel/-/issues/4538">i915#4538</a> / <a href=3D"https://gitlab.freedesktop.=
org/drm/i915/kernel/-/issues/5286">i915#5286</a>) -&gt; <a href=3D"https://=
intel-gfx-ci.01.org/tree/drm-tip/Patchwork_169493v6/shard-rkl-5/igt@kms_big=
_fb@4-tiled-16bpp-rotate-180.html">SKIP</a> (<a href=3D"https://gitlab.free=
desktop.org/drm/i915/kernel/-/issues/4538">i915#4538</a> / <a href=3D"https=
://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5286">i915#5286</a>)</li=
>
</ul></li>
<li>
<p>igt@kms_big_fb@4-tiled-16bpp-rotate-270:</p><ul>
<li>shard-dg2:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_19395/shard-dg2-7/igt@kms_big_fb@4-tiled-16bpp-rotate-270.html">SKI=
P</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/1=
7356">i915#17356</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm=
-tip/Patchwork_169493v6/shard-dg2-5/igt@kms_big_fb@4-tiled-16bpp-rotate-270=
.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/=
-/issues/17431">i915#17431</a>) +1 other test skip</li>
</ul></li>
<li>
<p>igt@kms_big_fb@4-tiled-32bpp-rotate-270:</p><ul>
<li>shard-dg2:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_19395/shard-dg2-1/igt@kms_big_fb@4-tiled-32bpp-rotate-270.html">SKI=
P</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/1=
7431">i915#17431</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm=
-tip/Patchwork_169493v6/shard-dg2-7/igt@kms_big_fb@4-tiled-32bpp-rotate-270=
.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/=
-/issues/17356">i915#17356</a>) +3 other tests skip</li>
</ul></li>
<li>
<p>igt@kms_big_fb@4-tiled-max-hw-stride-32bpp-rotate-0-hflip:</p><ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_19395/shard-rkl-3/igt@kms_big_fb@4-tiled-max-hw-stride-32bpp-rotate=
-0-hflip.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915=
/kernel/-/issues/4538">i915#4538</a> / <a href=3D"https://gitlab.freedeskto=
p.org/drm/i915/kernel/-/issues/5286">i915#5286</a>) -&gt; <a href=3D"https:=
//intel-gfx-ci.01.org/tree/drm-tip/Patchwork_169493v6/shard-rkl-6/igt@kms_b=
ig_fb@4-tiled-max-hw-stride-32bpp-rotate-0-hflip.html">SKIP</a> (<a href=3D=
"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14544<=
/a> / <a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/45=
38">i915#4538</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i915/kern=
el/-/issues/5286">i915#5286</a>) +3 other tests skip</li>
</ul></li>
<li>
<p>igt@kms_big_fb@y-tiled-8bpp-rotate-90:</p><ul>
<li>shard-dg2:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_19395/shard-dg2-6/igt@kms_big_fb@y-tiled-8bpp-rotate-90.html">SKIP<=
/a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/453=
8">i915#4538</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i915/kerne=
l/-/issues/5190">i915#5190</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.or=
g/tree/drm-tip/Patchwork_169493v6/shard-dg2-7/igt@kms_big_fb@y-tiled-8bpp-r=
otate-90.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915=
/kernel/-/issues/17356">i915#17356</a> / <a href=3D"https://gitlab.freedesk=
top.org/drm/i915/kernel/-/issues/5190">i915#5190</a>) +7 other tests skip</=
li>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_19395/shard-rkl-3/igt@kms_big_fb@y-tiled-8bpp-rotate-90.html">SKIP<=
/a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/174=
31">i915#17431</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i915/ker=
nel/-/issues/3638">i915#3638</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.=
org/tree/drm-tip/Patchwork_169493v6/shard-rkl-6/igt@kms_big_fb@y-tiled-8bpp=
-rotate-90.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i9=
15/kernel/-/issues/14544">i915#14544</a> / <a href=3D"https://gitlab.freede=
sktop.org/drm/i915/kernel/-/issues/17431">i915#17431</a> / <a href=3D"https=
://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3638">i915#3638</a>) +3 =
other tests skip</li>
</ul></li>
<li>
<p>igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-180-hflip-async-flip:<=
/p><ul>
<li>shard-dg2:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_19395/shard-dg2-7/igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate=
-180-hflip-async-flip.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop=
.org/drm/i915/kernel/-/issues/17356">i915#17356</a> / <a href=3D"https://gi=
tlab.freedesktop.org/drm/i915/kernel/-/issues/5190">i915#5190</a>) -&gt; <a=
 href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_169493v6/shard-=
dg2-8/igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-180-hflip-async-fli=
p.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel=
/-/issues/4538">i915#4538</a> / <a href=3D"https://gitlab.freedesktop.org/d=
rm/i915/kernel/-/issues/5190">i915#5190</a>) +9 other tests skip</li>
</ul></li>
<li>
<p>igt@kms_big_fb@yf-tiled-16bpp-rotate-270:</p><ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_19395/shard-rkl-3/igt@kms_big_fb@yf-tiled-16bpp-rotate-270.html">SK=
IP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/=
4538">i915#4538</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-=
tip/Patchwork_169493v6/shard-rkl-6/igt@kms_big_fb@yf-tiled-16bpp-rotate-270=
.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/=
-/issues/14544">i915#14544</a> / <a href=3D"https://gitlab.freedesktop.org/=
drm/i915/kernel/-/issues/4538">i915#4538</a>) +4 other tests skip</li>
</ul></li>
<li>
<p>igt@kms_big_fb@yf-tiled-64bpp-rotate-180:</p><ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_19395/shard-rkl-6/igt@kms_big_fb@yf-tiled-64bpp-rotate-180.html">SK=
IP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/=
14544">i915#14544</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i915/=
kernel/-/issues/4538">i915#4538</a>) -&gt; <a href=3D"https://intel-gfx-ci.=
01.org/tree/drm-tip/Patchwork_169493v6/shard-rkl-5/igt@kms_big_fb@yf-tiled-=
64bpp-rotate-180.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/=
drm/i915/kernel/-/issues/4538">i915#4538</a>) +1 other test skip</li>
</ul></li>
<li>
<p>igt@kms_big_fb@yf-tiled-addfb-size-offset-overflow:</p><ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_19395/shard-rkl-6/igt@kms_big_fb@yf-tiled-addfb-size-offset-overflo=
w.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel=
/-/issues/14544">i915#14544</a> / <a href=3D"https://gitlab.freedesktop.org=
/drm/i915/kernel/-/issues/17432">i915#17432</a>) -&gt; <a href=3D"https://i=
ntel-gfx-ci.01.org/tree/drm-tip/Patchwork_169493v6/shard-rkl-7/igt@kms_big_=
fb@yf-tiled-addfb-size-offset-overflow.html">SKIP</a> (<a href=3D"https://g=
itlab.freedesktop.org/drm/i915/kernel/-/issues/17432">i915#17432</a>)</li>
</ul></li>
<li>
<p>igt@kms_big_fb@yf-tiled-max-hw-stride-64bpp-rotate-0:</p><ul>
<li>shard-dg1:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_19395/shard-dg1-12/igt@kms_big_fb@yf-tiled-max-hw-stride-64bpp-rota=
te-0.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/ker=
nel/-/issues/4423">i915#4423</a> / <a href=3D"https://gitlab.freedesktop.or=
g/drm/i915/kernel/-/issues/4538">i915#4538</a>) -&gt; <a href=3D"https://in=
tel-gfx-ci.01.org/tree/drm-tip/Patchwork_169493v6/shard-dg1-16/igt@kms_big_=
fb@yf-tiled-max-hw-stride-64bpp-rotate-0.html">SKIP</a> (<a href=3D"https:/=
/gitlab.freedesktop.org/drm/i915/kernel/-/issues/4538">i915#4538</a>)</li>
</ul></li>
<li>
<p>igt@kms_ccs@bad-rotation-90-4-tiled-mtl-rc-ccs:</p><ul>
<li>shard-dg2:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_19395/shard-dg2-1/igt@kms_ccs@bad-rotation-90-4-tiled-mtl-rc-ccs.ht=
ml">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/i=
ssues/10307">i915#10307</a> / <a href=3D"https://gitlab.freedesktop.org/drm=
/i915/kernel/-/issues/6095">i915#6095</a>) -&gt; <a href=3D"https://intel-g=
fx-ci.01.org/tree/drm-tip/Patchwork_169493v6/shard-dg2-7/igt@kms_ccs@bad-ro=
tation-90-4-tiled-mtl-rc-ccs.html">SKIP</a> (<a href=3D"https://gitlab.free=
desktop.org/drm/i915/kernel/-/issues/17356">i915#17356</a>) +6 other tests =
skip</li>
</ul></li>
<li>
<p>igt@kms_ccs@crc-primary-basic-4-tiled-mtl-mc-ccs@pipe-a-hdmi-a-2:</p><ul=
>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_19395/shard-rkl-6/igt@kms_ccs@crc-primary-basic-4-tiled-mtl-mc-ccs@=
pipe-a-hdmi-a-2.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/d=
rm/i915/kernel/-/issues/14544">i915#14544</a> / <a href=3D"https://gitlab.f=
reedesktop.org/drm/i915/kernel/-/issues/6095">i915#6095</a>) -&gt; <a href=
=3D"https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_169493v6/shard-rkl-3=
/igt@kms_ccs@crc-primary-basic-4-tiled-mtl-mc-ccs@pipe-a-hdmi-a-2.html">SKI=
P</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6=
095">i915#6095</a>) +1 other test skip</li>
</ul></li>
<li>
<p>igt@kms_ccs@crc-primary-basic-4-tiled-mtl-mc-ccs@pipe-c-hdmi-a-2:</p><ul=
>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_19395/shard-rkl-6/igt@kms_ccs@crc-primary-basic-4-tiled-mtl-mc-ccs@=
pipe-c-hdmi-a-2.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/d=
rm/i915/kernel/-/issues/14098">i915#14098</a> / <a href=3D"https://gitlab.f=
reedesktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a> / <a href=3D"=
https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6095">i915#6095</a>=
) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_16949=
3v6/shard-rkl-3/igt@kms_ccs@crc-primary-basic-4-tiled-mtl-mc-ccs@pipe-c-hdm=
i-a-2.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/ke=
rnel/-/issues/14098">i915#14098</a> / <a href=3D"https://gitlab.freedesktop=
.org/drm/i915/kernel/-/issues/6095">i915#6095</a>) +2 other tests skip</li>
</ul></li>
<li>
<p>igt@kms_ccs@crc-primary-rotation-180-4-tiled-dg2-rc-ccs@pipe-b-hdmi-a-2:=
</p><ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_19395/shard-rkl-3/igt@kms_ccs@crc-primary-rotation-180-4-tiled-dg2-=
rc-ccs@pipe-b-hdmi-a-2.html">SKIP</a> (<a href=3D"https://gitlab.freedeskto=
p.org/drm/i915/kernel/-/issues/6095">i915#6095</a>) -&gt; <a href=3D"https:=
//intel-gfx-ci.01.org/tree/drm-tip/Patchwork_169493v6/shard-rkl-6/igt@kms_c=
cs@crc-primary-rotation-180-4-tiled-dg2-rc-ccs@pipe-b-hdmi-a-2.html">SKIP</=
a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/1454=
4">i915#14544</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i915/kern=
el/-/issues/6095">i915#6095</a>) +13 other tests skip</li>
</ul></li>
<li>
<p>igt@kms_ccs@crc-primary-rotation-180-4-tiled-mtl-mc-ccs:</p><ul>
<li>shard-dg2:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_19395/shard-dg2-7/igt@kms_ccs@crc-primary-rotation-180-4-tiled-mtl-=
mc-ccs.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/k=
ernel/-/issues/17356">i915#17356</a>) -&gt; <a href=3D"https://intel-gfx-ci=
.01.org/tree/drm-tip/Patchwork_169493v6/shard-dg2-8/igt@kms_ccs@crc-primary=
-rotation-180-4-tiled-mtl-mc-ccs.html">SKIP</a> (<a href=3D"https://gitlab.=
freedesktop.org/drm/i915/kernel/-/issues/10307">i915#10307</a> / <a href=3D=
"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/10434">i915#10434<=
/a> / <a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/60=
95">i915#6095</a>)</li>
<li>shard-dg1:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_19395/shard-dg1-14/igt@kms_ccs@crc-primary-rotation-180-4-tiled-mtl=
-mc-ccs.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/=
kernel/-/issues/6095">i915#6095</a>) -&gt; <a href=3D"https://intel-gfx-ci.=
01.org/tree/drm-tip/Patchwork_169493v6/shard-dg1-18/igt@kms_ccs@crc-primary=
-rotation-180-4-tiled-mtl-mc-ccs.html">SKIP</a> (<a href=3D"https://gitlab.=
freedesktop.org/drm/i915/kernel/-/issues/4423">i915#4423</a> / <a href=3D"h=
ttps://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6095">i915#6095</a>)=
</li>
</ul></li>
<li>
<p>igt@kms_ccs@crc-primary-suspend-4-tiled-mtl-mc-ccs:</p><ul>
<li>shard-mtlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_19395/shard-mtlp-1/igt@kms_ccs@crc-primary-suspend-4-tiled-mtl-mc-c=
cs.html">ABORT</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kern=
el/-/issues/17165">i915#17165</a>) -&gt; <a href=3D"https://intel-gfx-ci.01=
.org/tree/drm-tip/Patchwork_169493v6/shard-mtlp-6/igt@kms_ccs@crc-primary-s=
uspend-4-tiled-mtl-mc-ccs.html">INCOMPLETE</a> (<a href=3D"https://gitlab.f=
reedesktop.org/drm/i915/kernel/-/issues/15582">i915#15582</a>)</li>
</ul></li>
<li>
<p>igt@kms_ccs@crc-primary-suspend-4-tiled-mtl-mc-ccs@pipe-c-edp-1:</p><ul>
<li>shard-mtlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_19395/shard-mtlp-1/igt@kms_ccs@crc-primary-suspend-4-tiled-mtl-mc-c=
cs@pipe-c-edp-1.html">ABORT</a> (<a href=3D"https://gitlab.freedesktop.org/=
drm/i915/kernel/-/issues/17165">i915#17165</a>) -&gt; <a href=3D"https://in=
tel-gfx-ci.01.org/tree/drm-tip/Patchwork_169493v6/shard-mtlp-6/igt@kms_ccs@=
crc-primary-suspend-4-tiled-mtl-mc-ccs@pipe-c-edp-1.html">FAIL</a> (<a href=
=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17158">i915#171=
58</a>)</li>
</ul></li>
<li>
<p>igt@kms_ccs@crc-primary-suspend-4-tiled-mtl-rc-ccs-cc:</p><ul>
<li>shard-dg2:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_19395/shard-dg2-7/igt@kms_ccs@crc-primary-suspend-4-tiled-mtl-rc-cc=
s-cc.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/ker=
nel/-/issues/17356">i915#17356</a>) -&gt; <a href=3D"https://intel-gfx-ci.0=
1.org/tree/drm-tip/Patchwork_169493v6/shard-dg2-1/igt@kms_ccs@crc-primary-s=
uspend-4-tiled-mtl-rc-ccs-cc.html">SKIP</a> (<a href=3D"https://gitlab.free=
desktop.org/drm/i915/kernel/-/issues/6095">i915#6095</a>) +1 other test ski=
p</li>
</ul></li>
<li>
<p>igt@kms_ccs@crc-primary-suspend-y-tiled-gen12-rc-ccs-cc:</p><ul>
<li>shard-dg2:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_19395/shard-dg2-5/igt@kms_ccs@crc-primary-suspend-y-tiled-gen12-rc-=
ccs-cc.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/k=
ernel/-/issues/6095">i915#6095</a>) -&gt; <a href=3D"https://intel-gfx-ci.0=
1.org/tree/drm-tip/Patchwork_169493v6/shard-dg2-7/igt@kms_ccs@crc-primary-s=
uspend-y-tiled-gen12-rc-ccs-cc.html">SKIP</a> (<a href=3D"https://gitlab.fr=
eedesktop.org/drm/i915/kernel/-/issues/17356">i915#17356</a>)</li>
</ul></li>
<li>
<p>igt@kms_ccs@crc-sprite-planes-basic-4-tiled-lnl-ccs:</p><ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_19395/shard-rkl-2/igt@kms_ccs@crc-sprite-planes-basic-4-tiled-lnl-c=
cs.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kerne=
l/-/issues/12313">i915#12313</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.=
org/tree/drm-tip/Patchwork_169493v6/shard-rkl-6/igt@kms_ccs@crc-sprite-plan=
es-basic-4-tiled-lnl-ccs.html">SKIP</a> (<a href=3D"https://gitlab.freedesk=
top.org/drm/i915/kernel/-/issues/12313">i915#12313</a> / <a href=3D"https:/=
/gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a>) +1 =
other test skip</li>
</ul></li>
<li>
<p>igt@kms_ccs@missing-ccs-buffer-4-tiled-mtl-mc-ccs:</p><ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_19395/shard-rkl-3/igt@kms_ccs@missing-ccs-buffer-4-tiled-mtl-mc-ccs=
.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/=
-/issues/14098">i915#14098</a> / <a href=3D"https://gitlab.freedesktop.org/=
drm/i915/kernel/-/issues/6095">i915#6095</a>) -&gt; <a href=3D"https://inte=
l-gfx-ci.01.org/tree/drm-tip/Patchwork_169493v6/shard-rkl-6/igt@kms_ccs@mis=
sing-ccs-buffer-4-tiled-mtl-mc-ccs.html">SKIP</a> (<a href=3D"https://gitla=
b.freedesktop.org/drm/i915/kernel/-/issues/14098">i915#14098</a> / <a href=
=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#145=
44</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues=
/6095">i915#6095</a>) +15 other tests skip</li>
</ul></li>
<li>
<p>igt@kms_ccs@random-ccs-data-y-tiled-gen12-rc-ccs-cc:</p><ul>
<li>shard-dg2:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_19395/shard-dg2-7/igt@kms_ccs@random-ccs-data-y-tiled-gen12-rc-ccs-=
cc.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kerne=
l/-/issues/17356">i915#17356</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.=
org/tree/drm-tip/Patchwork_169493v6/shard-dg2-5/igt@kms_ccs@random-ccs-data=
-y-tiled-gen12-rc-ccs-cc.html">SKIP</a> (<a href=3D"https://gitlab.freedesk=
top.org/drm/i915/kernel/-/issues/10307">i915#10307</a> / <a href=3D"https:/=
/gitlab.freedesktop.org/drm/i915/kernel/-/issues/6095">i915#6095</a>) +8 ot=
her tests skip</li>
</ul></li>
<li>
<p>igt@kms_chamelium_color_pipeline@plane-fixed-matrix-yuv-rgb-bt601-lim-lu=
t1d:</p><ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_19395/shard-rkl-2/igt@kms_chamelium_color_pipeline@plane-fixed-matr=
ix-yuv-rgb-bt601-lim-lut1d.html">SKIP</a> (<a href=3D"https://gitlab.freede=
sktop.org/drm/i915/kernel/-/issues/17427">i915#17427</a>) -&gt; <a href=3D"=
https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_169493v6/shard-rkl-6/igt=
@kms_chamelium_color_pipeline@plane-fixed-matrix-yuv-rgb-bt601-lim-lut1d.ht=
ml">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/i=
ssues/14544">i915#14544</a> / <a href=3D"https://gitlab.freedesktop.org/drm=
/i915/kernel/-/issues/17427">i915#17427</a>) +2 other tests skip</li>
</ul></li>
<li>
<p>igt@kms_chamelium_color_pipeline@plane-fixed-matrix-yuv-rgb-bt709-lim-lu=
t1d:</p><ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_19395/shard-rkl-6/igt@kms_chamelium_color_pipeline@plane-fixed-matr=
ix-yuv-rgb-bt709-lim-lut1d.html">SKIP</a> (<a href=3D"https://gitlab.freede=
sktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a> / <a href=3D"https=
://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17427">i915#17427</a>) -=
&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_169493v6=
/shard-rkl-5/igt@kms_chamelium_color_pipeline@plane-fixed-matrix-yuv-rgb-bt=
709-lim-lut1d.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm=
/i915/kernel/-/issues/17427">i915#17427</a>) +1 other test skip</li>
</ul></li>
<li>
<p>igt@kms_chamelium_edid@dp-edid-change-during-suspend:</p><ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_19395/shard-rkl-2/igt@kms_chamelium_edid@dp-edid-change-during-susp=
end.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kern=
el/-/issues/11151">i915#11151</a> / <a href=3D"https://gitlab.freedesktop.o=
rg/drm/i915/kernel/-/issues/7828">i915#7828</a>) -&gt; <a href=3D"https://i=
ntel-gfx-ci.01.org/tree/drm-tip/Patchwork_169493v6/shard-rkl-6/igt@kms_cham=
elium_edid@dp-edid-change-during-suspend.html">SKIP</a> (<a href=3D"https:/=
/gitlab.freedesktop.org/drm/i915/kernel/-/issues/11151">i915#11151</a> / <a=
 href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i91=
5#14544</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/i=
ssues/7828">i915#7828</a>) +7 other tests skip</li>
</ul></li>
<li>
<p>igt@kms_chamelium_frames@hdmi-frame-dump:</p><ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_19395/shard-rkl-6/igt@kms_chamelium_frames@hdmi-frame-dump.html">SK=
IP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/=
11151">i915#11151</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i915/=
kernel/-/issues/14544">i915#14544</a> / <a href=3D"https://gitlab.freedeskt=
op.org/drm/i915/kernel/-/issues/7828">i915#7828</a>) -&gt; <a href=3D"https=
://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_169493v6/shard-rkl-5/igt@kms_=
chamelium_frames@hdmi-frame-dump.html">SKIP</a> (<a href=3D"https://gitlab.=
freedesktop.org/drm/i915/kernel/-/issues/11151">i915#11151</a> / <a href=3D=
"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/7828">i915#7828</a=
>) +1 other test skip</li>
</ul></li>
<li>
<p>igt@kms_content_protection@dp-mst-lic-type-0:</p><ul>
<li>shard-dg2:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_19395/shard-dg2-6/igt@kms_content_protection@dp-mst-lic-type-0.html=
">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/iss=
ues/15330">i915#15330</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i=
915/kernel/-/issues/3299">i915#3299</a>) -&gt; <a href=3D"https://intel-gfx=
-ci.01.org/tree/drm-tip/Patchwork_169493v6/shard-dg2-7/igt@kms_content_prot=
ection@dp-mst-lic-type-0.html">SKIP</a> (<a href=3D"https://gitlab.freedesk=
top.org/drm/i915/kernel/-/issues/17356">i915#17356</a>)</li>
</ul></li>
<li>
<p>igt@kms_content_protection@dp-mst-lic-type-1:</p><ul>
<li>shard-dg2:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_19395/shard-dg2-7/igt@kms_content_protection@dp-mst-lic-type-1.html=
">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/iss=
ues/17356">i915#17356</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tre=
e/drm-tip/Patchwork_169493v6/shard-dg2-1/igt@kms_content_protection@dp-mst-=
lic-type-1.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i9=
15/kernel/-/issues/15330">i915#15330</a> / <a href=3D"https://gitlab.freede=
sktop.org/drm/i915/kernel/-/issues/3299">i915#3299</a>)</li>
</ul></li>
<li>
<p>igt@kms_content_protection@dp-mst-type-1:</p><ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_19395/shard-rkl-2/igt@kms_content_protection@dp-mst-type-1.html">SK=
IP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/=
15330">i915#15330</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i915/=
kernel/-/issues/3116">i915#3116</a>) -&gt; <a href=3D"https://intel-gfx-ci.=
01.org/tree/drm-tip/Patchwork_169493v6/shard-rkl-6/igt@kms_content_protecti=
on@dp-mst-type-1.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/=
drm/i915/kernel/-/issues/14544">i915#14544</a> / <a href=3D"https://gitlab.=
freedesktop.org/drm/i915/kernel/-/issues/15330">i915#15330</a> / <a href=3D=
"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3116">i915#3116</a=
>) +1 other test skip</li>
</ul></li>
<li>
<p>igt@kms_content_protection@legacy:</p><ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_19395/shard-rkl-3/igt@kms_content_protection@legacy.html">SKIP</a> =
(<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15865">=
i915#15865</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/P=
atchwork_169493v6/shard-rkl-6/igt@kms_content_protection@legacy.html">SKIP<=
/a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/145=
44">i915#14544</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i915/ker=
nel/-/issues/15865">i915#15865</a>)</li>
</ul></li>
<li>
<p>igt@kms_content_protection@lic-type-0:</p><ul>
<li>shard-dg2:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_19395/shard-dg2-1/igt@kms_content_protection@lic-type-0.html">SKIP<=
/a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/158=
65">i915#15865</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-t=
ip/Patchwork_169493v6/shard-dg2-7/igt@kms_content_protection@lic-type-0.htm=
l">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/is=
sues/17356">i915#17356</a>)</li>
</ul></li>
<li>
<p>igt@kms_content_protection@lic-type-1:</p><ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_19395/shard-rkl-6/igt@kms_content_protection@lic-type-1.html">SKIP<=
/a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/145=
44">i915#14544</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i915/ker=
nel/-/issues/15865">i915#15865</a>) -&gt; <a href=3D"https://intel-gfx-ci.0=
1.org/tree/drm-tip/Patchwork_169493v6/shard-rkl-3/igt@kms_content_protectio=
n@lic-type-1.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/=
i915/kernel/-/issues/15865">i915#15865</a>)</li>
</ul></li>
<li>
<p>igt@kms_content_protection@suspend-resume:</p><ul>
<li>shard-dg2:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_19395/shard-dg2-7/igt@kms_content_protection@suspend-resume.html">S=
KIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues=
/17356">i915#17356</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/d=
rm-tip/Patchwork_169493v6/shard-dg2-8/igt@kms_content_protection@suspend-re=
sume.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/ker=
nel/-/issues/15865">i915#15865</a>) +2 other tests skip</li>
</ul></li>
<li>
<p>igt@kms_cursor_crc@cursor-random-32x10:</p><ul>
<li>shard-dg2:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_19395/shard-dg2-7/igt@kms_cursor_crc@cursor-random-32x10.html">SKIP=
</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17=
356">i915#17356</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-=
tip/Patchwork_169493v6/shard-dg2-8/igt@kms_cursor_crc@cursor-random-32x10.h=
tml">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/=
issues/3555">i915#3555</a>) +4 other tests skip</li>
</ul></li>
<li>
<p>igt@kms_cursor_crc@cursor-random-max-size:</p><ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_19395/shard-rkl-2/igt@kms_cursor_crc@cursor-random-max-size.html">S=
KIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues=
/3555">i915#3555</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm=
-tip/Patchwork_169493v6/shard-rkl-6/igt@kms_cursor_crc@cursor-random-max-si=
ze.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kerne=
l/-/issues/14544">i915#14544</a> / <a href=3D"https://gitlab.freedesktop.or=
g/drm/i915/kernel/-/issues/3555">i915#3555</a>) +1 other test skip</li>
</ul></li>
<li>
<p>igt@kms_cursor_crc@cursor-rapid-movement-512x170:</p><ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_19395/shard-rkl-3/igt@kms_cursor_crc@cursor-rapid-movement-512x170.=
html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-=
/issues/13049">i915#13049</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/Patchwork_169493v6/shard-rkl-6/igt@kms_cursor_crc@cursor-rapi=
d-movement-512x170.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.or=
g/drm/i915/kernel/-/issues/13049">i915#13049</a> / <a href=3D"https://gitla=
b.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a>)</li>
</ul></li>
<li>
<p>igt@kms_cursor_crc@cursor-rapid-movement-max-size:</p><ul>
<li>shard-dg2:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_19395/shard-dg2-1/igt@kms_cursor_crc@cursor-rapid-movement-max-size=
.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/=
-/issues/3555">i915#3555</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/Patchwork_169493v6/shard-dg2-7/igt@kms_cursor_crc@cursor-rapid=
-movement-max-size.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.or=
g/drm/i915/kernel/-/issues/17356">i915#17356</a>)</li>
</ul></li>
<li>
<p>igt@kms_cursor_crc@cursor-sliding-512x170:</p><ul>
<li>shard-dg2:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_19395/shard-dg2-7/igt@kms_cursor_crc@cursor-sliding-512x170.html">S=
KIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues=
/17356">i915#17356</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/d=
rm-tip/Patchwork_169493v6/shard-dg2-4/igt@kms_cursor_crc@cursor-sliding-512=
x170.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/ker=
nel/-/issues/13049">i915#13049</a>) +1 other test skip</li>
</ul></li>
<li>
<p>igt@kms_cursor_legacy@cursora-vs-flipb-toggle:</p><ul>
<li>shard-dg2:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_19395/shard-dg2-7/igt@kms_cursor_legacy@cursora-vs-flipb-toggle.htm=
l">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/is=
sues/17356">i915#17356</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tr=
ee/drm-tip/Patchwork_169493v6/shard-dg2-5/igt@kms_cursor_legacy@cursora-vs-=
flipb-toggle.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/=
i915/kernel/-/issues/13046">i915#13046</a> / <a href=3D"https://gitlab.free=
desktop.org/drm/i915/kernel/-/issues/17454">i915#17454</a> / <a href=3D"htt=
ps://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5354">i915#5354</a>) +=
3 other tests skip</li>
</ul></li>
<li>
<p>igt@kms_cursor_legacy@cursorb-vs-flipa-atomic:</p><ul>
<li>shard-dg2:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_19395/shard-dg2-6/igt@kms_cursor_legacy@cursorb-vs-flipa-atomic.htm=
l">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/is=
sues/13046">i915#13046</a> / <a href=3D"https://gitlab.freedesktop.org/drm/=
i915/kernel/-/issues/17454">i915#17454</a> / <a href=3D"https://gitlab.free=
desktop.org/drm/i915/kernel/-/issues/5354">i915#5354</a>) -&gt; <a href=3D"=
https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_169493v6/shard-dg2-7/igt=
@kms_cursor_legacy@cursorb-vs-flipa-atomic.html">SKIP</a> (<a href=3D"https=
://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17356">i915#17356</a>)</=
li>
</ul></li>
<li>
<p>igt@kms_cursor_legacy@short-busy-flip-before-cursor-atomic-transitions:<=
/p><ul>
<li>shard-dg2:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_19395/shard-dg2-7/igt@kms_cursor_legacy@short-busy-flip-before-curs=
or-atomic-transitions.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop=
.org/drm/i915/kernel/-/issues/17356">i915#17356</a>) -&gt; <a href=3D"https=
://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_169493v6/shard-dg2-4/igt@kms_=
cursor_legacy@short-busy-flip-before-cursor-atomic-transitions.html">SKIP</=
a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4103=
">i915#4103</a>)</li>
</ul></li>
<li>
<p>igt@kms_dither@fb-8bpc-vs-panel-6bpc:</p><ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_19395/shard-rkl-6/igt@kms_dither@fb-8bpc-vs-panel-6bpc.html">SKIP</=
a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/1454=
4">i915#14544</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i915/kern=
el/-/issues/3555">i915#3555</a> / <a href=3D"https://gitlab.freedesktop.org=
/drm/i915/kernel/-/issues/3804">i915#3804</a>) -&gt; <a href=3D"https://int=
el-gfx-ci.01.org/tree/drm-tip/Patchwork_169493v6/shard-rkl-5/igt@kms_dither=
@fb-8bpc-vs-panel-6bpc.html">SKIP</a> (<a href=3D"https://gitlab.freedeskto=
p.org/drm/i915/kernel/-/issues/3555">i915#3555</a> / <a href=3D"https://git=
lab.freedesktop.org/drm/i915/kernel/-/issues/3804">i915#3804</a>)</li>
</ul></li>
<li>
<p>igt@kms_dp_aux_dev@basic:</p><ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_19395/shard-rkl-3/igt@kms_dp_aux_dev@basic.html">SKIP</a> (<a href=
=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/1257">i915#1257=
</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_1=
69493v6/shard-rkl-6/igt@kms_dp_aux_dev@basic.html">SKIP</a> (<a href=3D"htt=
ps://gitlab.freedesktop.org/drm/i915/kernel/-/issues/1257">i915#1257</a> / =
<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i=
915#14544</a>)</li>
</ul></li>
<li>
<p>igt@kms_dp_link_training@non-uhbr-mst-direct-train:</p><ul>
<li>shard-dg2:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_19395/shard-dg2-6/igt@kms_dp_link_training@non-uhbr-mst-direct-trai=
n.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel=
/-/issues/17287">i915#17287</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.o=
rg/tree/drm-tip/Patchwork_169493v6/shard-dg2-7/igt@kms_dp_link_training@non=
-uhbr-mst-direct-train.html">SKIP</a> (<a href=3D"https://gitlab.freedeskto=
p.org/drm/i915/kernel/-/issues/17356">i915#17356</a>)</li>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_19395/shard-rkl-3/igt@kms_dp_link_training@non-uhbr-mst-direct-trai=
n.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel=
/-/issues/17287">i915#17287</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.o=
rg/tree/drm-tip/Patchwork_169493v6/shard-rkl-6/igt@kms_dp_link_training@non=
-uhbr-mst-direct-train.html">SKIP</a> (<a href=3D"https://gitlab.freedeskto=
p.org/drm/i915/kernel/-/issues/14544">i915#14544</a> / <a href=3D"https://g=
itlab.freedesktop.org/drm/i915/kernel/-/issues/17287">i915#17287</a>)</li>
</ul></li>
<li>
<p>igt@kms_dp_link_training@non-uhbr-sst:</p><ul>
<li>shard-dg2:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_19395/shard-dg2-7/igt@kms_dp_link_training@non-uhbr-sst.html">SKIP<=
/a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/173=
56">i915#17356</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-t=
ip/Patchwork_169493v6/shard-dg2-8/igt@kms_dp_link_training@non-uhbr-sst.htm=
l">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/is=
sues/17288">i915#17288</a>)</li>
</ul></li>
<li>
<p>igt@kms_dp_link_training@non-uhbr-sst-direct-train:</p><ul>
<li>shard-dg2:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_19395/shard-dg2-7/igt@kms_dp_link_training@non-uhbr-sst-direct-trai=
n.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel=
/-/issues/17356">i915#17356</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.o=
rg/tree/drm-tip/Patchwork_169493v6/shard-dg2-5/igt@kms_dp_link_training@non=
-uhbr-sst-direct-train.html">SKIP</a> (<a href=3D"https://gitlab.freedeskto=
p.org/drm/i915/kernel/-/issues/17286">i915#17286</a>)</li>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_19395/shard-rkl-6/igt@kms_dp_link_training@non-uhbr-sst-direct-trai=
n.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel=
/-/issues/14544">i915#14544</a> / <a href=3D"https://gitlab.freedesktop.org=
/drm/i915/kernel/-/issues/17286">i915#17286</a>) -&gt; <a href=3D"https://i=
ntel-gfx-ci.01.org/tree/drm-tip/Patchwork_169493v6/shard-rkl-3/igt@kms_dp_l=
ink_training@non-uhbr-sst-direct-train.html">SKIP</a> (<a href=3D"https://g=
itlab.freedesktop.org/drm/i915/kernel/-/issues/17286">i915#17286</a>)</li>
</ul></li>
<li>
<p>igt@kms_draw_crc@draw-method-mmap-gtt:</p><ul>
<li>shard-dg2:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_19395/shard-dg2-5/igt@kms_draw_crc@draw-method-mmap-gtt.html">SKIP<=
/a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/881=
2">i915#8812</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/Patchwork_169493v6/shard-dg2-7/igt@kms_draw_crc@draw-method-mmap-gtt.html"=
>SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issu=
es/17356">i915#17356</a>)</li>
</ul></li>
<li>
<p>igt@kms_dsc@dsc-basic-ultrajoiner:</p><ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_19395/shard-rkl-2/igt@kms_dsc@dsc-basic-ultrajoiner.html">SKIP</a> =
(<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16361">=
i915#16361</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/P=
atchwork_169493v6/shard-rkl-6/igt@kms_dsc@dsc-basic-ultrajoiner.html">SKIP<=
/a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/145=
44">i915#14544</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i915/ker=
nel/-/issues/16361">i915#16361</a>) +2 other tests skip</li>
</ul></li>
<li>
<p>igt@kms_dsc@dsc-fractional-bpp-ultrajoiner:</p><ul>
<li>shard-dg2:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_19395/shard-dg2-6/igt@kms_dsc@dsc-fractional-bpp-ultrajoiner.html">=
SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issue=
s/16361">i915#16361</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/=
drm-tip/Patchwork_169493v6/shard-dg2-7/igt@kms_dsc@dsc-fractional-bpp-ultra=
joiner.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/k=
ernel/-/issues/17356">i915#17356</a>) +1 other test skip</li>
</ul></li>
<li>
<p>igt@kms_dsc@dsc-with-output-formats:</p><ul>
<li>shard-dg2:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_19395/shard-dg2-7/igt@kms_dsc@dsc-with-output-formats.html">SKIP</a=
> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17356=
">i915#17356</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/Patchwork_169493v6/shard-dg2-1/igt@kms_dsc@dsc-with-output-formats.html">S=
KIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues=
/16361">i915#16361</a>) +3 other tests skip</li>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_19395/shard-rkl-6/igt@kms_dsc@dsc-with-output-formats.html">SKIP</a=
> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544=
">i915#14544</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i915/kerne=
l/-/issues/16361">i915#16361</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.=
org/tree/drm-tip/Patchwork_169493v6/shard-rkl-5/igt@kms_dsc@dsc-with-output=
-formats.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915=
/kernel/-/issues/16361">i915#16361</a>)</li>
</ul></li>
<li>
<p>igt@kms_fbcon_fbt@psr-suspend:</p><ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_19395/shard-rkl-3/igt@kms_fbcon_fbt@psr-suspend.html">SKIP</a> (<a =
href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16680">i915=
#16680</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/Patch=
work_169493v6/shard-rkl-6/igt@kms_fbcon_fbt@psr-suspend.html">SKIP</a> (<a =
href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915=
#14544</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/is=
sues/16680">i915#16680</a>)</li>
</ul></li>
<li>
<p>igt@kms_feature_discovery@vrr:</p><ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_19395/shard-rkl-3/igt@kms_feature_discovery@vrr.html">SKIP</a> (<a =
href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16600">i915=
#16600</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/Patch=
work_169493v6/shard-rkl-6/igt@kms_feature_discovery@vrr.html">SKIP</a> (<a =
href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915=
#14544</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/is=
sues/16600">i915#16600</a>)</li>
</ul></li>
<li>
<p>igt@kms_flip@2x-flip-vs-modeset:</p><ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_19395/shard-rkl-3/igt@kms_flip@2x-flip-vs-modeset.html">SKIP</a> (<=
a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9934">i91=
5#9934</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/Patch=
work_169493v6/shard-rkl-6/igt@kms_flip@2x-flip-vs-modeset.html">SKIP</a> (<=
a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i9=
15#14544</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/=
issues/9934">i915#9934</a>) +2 other tests skip</li>
</ul></li>
<li>
<p>igt@kms_flip@2x-flip-vs-rmfb-interruptible:</p><ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_19395/shard-rkl-6/igt@kms_flip@2x-flip-vs-rmfb-interruptible.html">=
SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issue=
s/14544">i915#14544</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i91=
5/kernel/-/issues/9934">i915#9934</a>) -&gt; <a href=3D"https://intel-gfx-c=
i.01.org/tree/drm-tip/Patchwork_169493v6/shard-rkl-5/igt@kms_flip@2x-flip-v=
s-rmfb-interruptible.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.=
org/drm/i915/kernel/-/issues/9934">i915#9934</a>)</li>
</ul></li>
<li>
<p>igt@kms_flip@flip-vs-suspend-interruptible:</p><ul>
<li>shard-glk:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_19395/shard-glk8/igt@kms_flip@flip-vs-suspend-interruptible.html">I=
NCOMPLETE</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/=
issues/12314">i915#12314</a> / <a href=3D"https://gitlab.freedesktop.org/dr=
m/i915/kernel/-/issues/12745">i915#12745</a> / <a href=3D"https://gitlab.fr=
eedesktop.org/drm/i915/kernel/-/issues/13356">i915#13356</a> / <a href=3D"h=
ttps://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17183">i915#17183</a=
> / <a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4839=
">i915#4839</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/=
Patchwork_169493v6/shard-glk1/igt@kms_flip@flip-vs-suspend-interruptible.ht=
ml">INCOMPLETE</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kern=
el/-/issues/12745">i915#12745</a> / <a href=3D"https://gitlab.freedesktop.o=
rg/drm/i915/kernel/-/issues/13356">i915#13356</a> / <a href=3D"https://gitl=
ab.freedesktop.org/drm/i915/kernel/-/issues/17183">i915#17183</a> / <a href=
=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4839">i915#4839=
</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6=
113">i915#6113</a>)</li>
</ul></li>
<li>
<p>igt@kms_flip@flip-vs-suspend-interruptible@a-hdmi-a1:</p><ul>
<li>shard-glk:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_19395/shard-glk8/igt@kms_flip@flip-vs-suspend-interruptible@a-hdmi-=
a1.html">INCOMPLETE</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915=
/kernel/-/issues/12314">i915#12314</a> / <a href=3D"https://gitlab.freedesk=
top.org/drm/i915/kernel/-/issues/12745">i915#12745</a> / <a href=3D"https:/=
/gitlab.freedesktop.org/drm/i915/kernel/-/issues/13356">i915#13356</a> / <a=
 href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17183">i91=
5#17183</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/Patc=
hwork_169493v6/shard-glk1/igt@kms_flip@flip-vs-suspend-interruptible@a-hdmi=
-a1.html">INCOMPLETE</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i91=
5/kernel/-/issues/12745">i915#12745</a> / <a href=3D"https://gitlab.freedes=
ktop.org/drm/i915/kernel/-/issues/13356">i915#13356</a> / <a href=3D"https:=
//gitlab.freedesktop.org/drm/i915/kernel/-/issues/17183">i915#17183</a>)</l=
i>
</ul></li>
<li>
<p>igt@kms_flip_scaled_crc@flip-32bpp-4tile-to-32bpp-4tiledg2rcccs-upscalin=
g:</p><ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_19395/shard-rkl-2/igt@kms_flip_scaled_crc@flip-32bpp-4tile-to-32bpp=
-4tiledg2rcccs-upscaling.html">SKIP</a> (<a href=3D"https://gitlab.freedesk=
top.org/drm/i915/kernel/-/issues/15643">i915#15643</a>) -&gt; <a href=3D"ht=
tps://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_169493v6/shard-rkl-6/igt@k=
ms_flip_scaled_crc@flip-32bpp-4tile-to-32bpp-4tiledg2rcccs-upscaling.html">=
SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issue=
s/14544">i915#14544</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i91=
5/kernel/-/issues/15643">i915#15643</a>) +3 other tests skip</li>
</ul></li>
<li>
<p>igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-16bpp-4tile-upscaling:</p><u=
l>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_19395/shard-rkl-6/igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-16bpp=
-4tile-upscaling.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/=
drm/i915/kernel/-/issues/14544">i915#14544</a> / <a href=3D"https://gitlab.=
freedesktop.org/drm/i915/kernel/-/issues/15643">i915#15643</a>) -&gt; <a hr=
ef=3D"https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_169493v6/shard-rkl=
-3/igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-16bpp-4tile-upscaling.html">=
SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issue=
s/15643">i915#15643</a>) +1 other test skip</li>
</ul></li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-1p-shrfb-fliptrack-mmap-gtt:</p><ul>
<li>shard-dg2:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_19395/shard-dg2-6/igt@kms_frontbuffer_tracking@fbc-1p-shrfb-fliptra=
ck-mmap-gtt.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i=
915/kernel/-/issues/15990">i915#15990</a> / <a href=3D"https://gitlab.freed=
esktop.org/drm/i915/kernel/-/issues/8708">i915#8708</a>) -&gt; <a href=3D"h=
ttps://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_169493v6/shard-dg2-7/igt@=
kms_frontbuffer_tracking@fbc-1p-shrfb-fliptrack-mmap-gtt.html">SKIP</a> (<a=
 href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16708">i91=
5#16708</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/i=
ssues/5354">i915#5354</a>) +7 other tests skip</li>
</ul></li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-2p-primscrn-pri-shrfb-draw-mmap-gtt:</p=
><ul>
<li>shard-dg2:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_19395/shard-dg2-7/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-pri-=
shrfb-draw-mmap-gtt.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.o=
rg/drm/i915/kernel/-/issues/16708">i915#16708</a> / <a href=3D"https://gitl=
ab.freedesktop.org/drm/i915/kernel/-/issues/5354">i915#5354</a>) -&gt; <a h=
ref=3D"https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_169493v6/shard-dg=
2-1/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-pri-shrfb-draw-mmap-gtt.ht=
ml">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/i=
ssues/15990">i915#15990</a> / <a href=3D"https://gitlab.freedesktop.org/drm=
/i915/kernel/-/issues/8708">i915#8708</a>) +11 other tests skip</li>
</ul></li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-indfb-plflip-blt:</p><ul>
<li>shard-dg2:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_19395/shard-dg2-7/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-indf=
b-plflip-blt.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/=
i915/kernel/-/issues/16708">i915#16708</a> / <a href=3D"https://gitlab.free=
desktop.org/drm/i915/kernel/-/issues/5354">i915#5354</a>) -&gt; <a href=3D"=
https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_169493v6/shard-dg2-8/igt=
@kms_frontbuffer_tracking@fbc-2p-scndscrn-indfb-plflip-blt.html">SKIP</a> (=
<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15991">i=
915#15991</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-=
/issues/5354">i915#5354</a>) +18 other tests skip</li>
</ul></li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-tiling-y:</p><ul>
<li>shard-dg2:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_19395/shard-dg2-7/igt@kms_frontbuffer_tracking@fbc-tiling-y.html">S=
KIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues=
/16708">i915#16708</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i915=
/kernel/-/issues/5354">i915#5354</a>) -&gt; <a href=3D"https://intel-gfx-ci=
.01.org/tree/drm-tip/Patchwork_169493v6/shard-dg2-5/igt@kms_frontbuffer_tra=
cking@fbc-tiling-y.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.or=
g/drm/i915/kernel/-/issues/10055">i915#10055</a>)</li>
</ul></li>
<li>
<p>igt@kms_frontbuffer_tracking@fbchdr-1p-primscrn-spr-indfb-draw-render:</=
p><ul>
<li>shard-dg2:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_19395/shard-dg2-6/igt@kms_frontbuffer_tracking@fbchdr-1p-primscrn-s=
pr-indfb-draw-render.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.=
org/drm/i915/kernel/-/issues/15989">i915#15989</a>) -&gt; <a href=3D"https:=
//intel-gfx-ci.01.org/tree/drm-tip/Patchwork_169493v6/shard-dg2-7/igt@kms_f=
rontbuffer_tracking@fbchdr-1p-primscrn-spr-indfb-draw-render.html">SKIP</a>=
 (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16708"=
>i915#16708</a>) +10 other tests skip</li>
</ul></li>
<li>
<p>igt@kms_frontbuffer_tracking@fbchdr-2p-primscrn-pri-indfb-draw-blt:</p><=
ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_19395/shard-rkl-6/igt@kms_frontbuffer_tracking@fbchdr-2p-primscrn-p=
ri-indfb-draw-blt.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org=
/drm/i915/kernel/-/issues/14544">i915#14544</a> / <a href=3D"https://gitlab=
.freedesktop.org/drm/i915/kernel/-/issues/17428">i915#17428</a>) -&gt; <a h=
ref=3D"https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_169493v6/shard-rk=
l-5/igt@kms_frontbuffer_tracking@fbchdr-2p-primscrn-pri-indfb-draw-blt.html=
">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/iss=
ues/17428">i915#17428</a>) +19 other tests skip</li>
</ul></li>
<li>
<p>igt@kms_frontbuffer_tracking@fbchdr-2p-primscrn-shrfb-pgflip-blt:</p><ul=
>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_19395/shard-rkl-3/igt@kms_frontbuffer_tracking@fbchdr-2p-primscrn-s=
hrfb-pgflip-blt.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/d=
rm/i915/kernel/-/issues/17428">i915#17428</a>) -&gt; <a href=3D"https://int=
el-gfx-ci.01.org/tree/drm-tip/Patchwork_169493v6/shard-rkl-6/igt@kms_frontb=
uffer_tracking@fbchdr-2p-primscrn-shrfb-pgflip-blt.html">SKIP</a> (<a href=
=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#145=
44</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues=
/17428">i915#17428</a>) +58 other tests skip</li>
</ul></li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-1p-offscreen-pri-shrfb-draw-mmap-gtt=
:</p><ul>
<li>shard-dg2:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_19395/shard-dg2-7/igt@kms_frontbuffer_tracking@fbcpsr-1p-offscreen-=
pri-shrfb-draw-mmap-gtt.html">SKIP</a> (<a href=3D"https://gitlab.freedeskt=
op.org/drm/i915/kernel/-/issues/16708">i915#16708</a>) -&gt; <a href=3D"htt=
ps://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_169493v6/shard-dg2-8/igt@km=
s_frontbuffer_tracking@fbcpsr-1p-offscreen-pri-shrfb-draw-mmap-gtt.html">SK=
IP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/=
15104">i915#15104</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i915/=
kernel/-/issues/15990">i915#15990</a>)</li>
</ul></li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-spr-indfb-draw-mmap-gtt:=
</p><ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_19395/shard-rkl-3/igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-s=
pr-indfb-draw-mmap-gtt.html">SKIP</a> (<a href=3D"https://gitlab.freedeskto=
p.org/drm/i915/kernel/-/issues/17428">i915#17428</a> / <a href=3D"https://g=
itlab.freedesktop.org/drm/i915/kernel/-/issues/1825">i915#1825</a>) -&gt; <=
a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_169493v6/shard=
-rkl-6/igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-spr-indfb-draw-mmap-=
gtt.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kern=
el/-/issues/14544">i915#14544</a> / <a href=3D"https://gitlab.freedesktop.o=
rg/drm/i915/kernel/-/issues/17428">i915#17428</a> / <a href=3D"https://gitl=
ab.freedesktop.org/drm/i915/kernel/-/issues/1825">i915#1825</a>) +3 other t=
ests skip</li>
</ul></li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-pri-shrfb-draw-blt:</p><=
ul>
<li>shard-dg2:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_19395/shard-dg2-5/igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-p=
ri-shrfb-draw-blt.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org=
/drm/i915/kernel/-/issues/15991">i915#15991</a> / <a href=3D"https://gitlab=
.freedesktop.org/drm/i915/kernel/-/issues/5354">i915#5354</a>) -&gt; <a hre=
f=3D"https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_169493v6/shard-dg2-=
7/igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-pri-shrfb-draw-blt.html">=
SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issue=
s/16708">i915#16708</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i91=
5/kernel/-/issues/5354">i915#5354</a>) +11 other tests skip</li>
</ul></li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsrhdr-1p-primscrn-cur-indfb-draw-mmap-c=
pu:</p><ul>
<li>shard-dg2:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_19395/shard-dg2-7/igt@kms_frontbuffer_tracking@fbcpsrhdr-1p-primscr=
n-cur-indfb-draw-mmap-cpu.html">SKIP</a> (<a href=3D"https://gitlab.freedes=
ktop.org/drm/i915/kernel/-/issues/16708">i915#16708</a>) -&gt; <a href=3D"h=
ttps://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_169493v6/shard-dg2-8/igt@=
kms_frontbuffer_tracking@fbcpsrhdr-1p-primscrn-cur-indfb-draw-mmap-cpu.html=
">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/iss=
ues/15102">i915#15102</a>) +17 other tests skip</li>
</ul></li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsrhdr-1p-primscrn-spr-indfb-draw-mmap-g=
tt:</p><ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_19395/shard-rkl-3/igt@kms_frontbuffer_tracking@fbcpsrhdr-1p-primscr=
n-spr-indfb-draw-mmap-gtt.html">SKIP</a> (<a href=3D"https://gitlab.freedes=
ktop.org/drm/i915/kernel/-/issues/15102">i915#15102</a>) -&gt; <a href=3D"h=
ttps://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_169493v6/shard-rkl-6/igt@=
kms_frontbuffer_tracking@fbcpsrhdr-1p-primscrn-spr-indfb-draw-mmap-gtt.html=
">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/iss=
ues/14544">i915#14544</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i=
915/kernel/-/issues/15102">i915#15102</a>) +36 other tests skip</li>
</ul></li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsrhdr-1p-rte:</p><ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_19395/shard-rkl-6/igt@kms_frontbuffer_tracking@fbcpsrhdr-1p-rte.htm=
l">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/is=
sues/14544">i915#14544</a> / <a href=3D"https://gitlab.freedesktop.org/drm/=
i915/kernel/-/issues/15102">i915#15102</a>) -&gt; <a href=3D"https://intel-=
gfx-ci.01.org/tree/drm-tip/Patchwork_169493v6/shard-rkl-3/igt@kms_frontbuff=
er_tracking@fbcpsrhdr-1p-rte.html">SKIP</a> (<a href=3D"https://gitlab.free=
desktop.org/drm/i915/kernel/-/issues/15102">i915#15102</a>) +9 other tests =
skip</li>
</ul></li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsrhdr-rgb101010-draw-mmap-cpu:</p><ul>
<li>shard-dg2:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_19395/shard-dg2-1/igt@kms_frontbuffer_tracking@fbcpsrhdr-rgb101010-=
draw-mmap-cpu.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm=
/i915/kernel/-/issues/15102">i915#15102</a>) -&gt; <a href=3D"https://intel=
-gfx-ci.01.org/tree/drm-tip/Patchwork_169493v6/shard-dg2-7/igt@kms_frontbuf=
fer_tracking@fbcpsrhdr-rgb101010-draw-mmap-cpu.html">SKIP</a> (<a href=3D"h=
ttps://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16708">i915#16708</a=
>) +8 other tests skip</li>
</ul></li>
<li>
<p>igt@kms_frontbuffer_tracking@hdr-1p-offscreen-pri-indfb-draw-pwrite:</p>=
<ul>
<li>shard-dg2:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_19395/shard-dg2-7/igt@kms_frontbuffer_tracking@hdr-1p-offscreen-pri=
-indfb-draw-pwrite.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.or=
g/drm/i915/kernel/-/issues/16708">i915#16708</a>) -&gt; <a href=3D"https://=
intel-gfx-ci.01.org/tree/drm-tip/Patchwork_169493v6/shard-dg2-8/igt@kms_fro=
ntbuffer_tracking@hdr-1p-offscreen-pri-indfb-draw-pwrite.html">SKIP</a> (<a=
 href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15989">i91=
5#15989</a>) +15 other tests skip</li>
<li>shard-dg1:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_19395/shard-dg1-14/igt@kms_frontbuffer_tracking@hdr-1p-offscreen-pr=
i-indfb-draw-pwrite.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.o=
rg/drm/i915/kernel/-/issues/15989">i915#15989</a>) -&gt; <a href=3D"https:/=
/intel-gfx-ci.01.org/tree/drm-tip/Patchwork_169493v6/shard-dg1-18/igt@kms_f=
rontbuffer_tracking@hdr-1p-offscreen-pri-indfb-draw-pwrite.html">SKIP</a> (=
<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15989">i=
915#15989</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-=
/issues/4423">i915#4423</a>)</li>
</ul></li>
<li>
<p>igt@kms_frontbuffer_tracking@hdr-2p-primscrn-cur-indfb-draw-mmap-wc:</p>=
<ul>
<li>shard-dg2:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_19395/shard-dg2-7/igt@kms_frontbuffer_tracking@hdr-2p-primscrn-cur-=
indfb-draw-mmap-wc.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.or=
g/drm/i915/kernel/-/issues/16708">i915#16708</a>) -&gt; <a href=3D"https://=
intel-gfx-ci.01.org/tree/drm-tip/Patchwork_169493v6/shard-dg2-1/igt@kms_fro=
ntbuffer_tracking@hdr-2p-primscrn-cur-indfb-draw-mmap-wc.html">SKIP</a> (<a=
 href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15990">i91=
5#15990</a>) +11 other tests skip</li>
</ul></li>
<li>
<p>igt@kms_frontbuffer_tracking@hdr-2p-primscrn-pri-indfb-draw-mmap-gtt:</p=
><ul>
<li>shard-dg2:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_19395/shard-dg2-6/igt@kms_frontbuffer_tracking@hdr-2p-primscrn-pri-=
indfb-draw-mmap-gtt.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.o=
rg/drm/i915/kernel/-/issues/15990">i915#15990</a>) -&gt; <a href=3D"https:/=
/intel-gfx-ci.01.org/tree/drm-tip/Patchwork_169493v6/shard-dg2-7/igt@kms_fr=
ontbuffer_tracking@hdr-2p-primscrn-pri-indfb-draw-mmap-gtt.html">SKIP</a> (=
<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16708">i=
915#16708</a>) +11 other tests skip</li>
</ul></li>
<li>
<p>igt@kms_frontbuffer_tracking@hdr-2p-primscrn-pri-indfb-draw-pwrite:</p><=
ul>
<li>shard-dg1:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_19395/shard-dg1-14/igt@kms_frontbuffer_tracking@hdr-2p-primscrn-pri=
-indfb-draw-pwrite.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.or=
g/drm/i915/kernel/-/issues/17428">i915#17428</a>) -&gt; <a href=3D"https://=
intel-gfx-ci.01.org/tree/drm-tip/Patchwork_169493v6/shard-dg1-18/igt@kms_fr=
ontbuffer_tracking@hdr-2p-primscrn-pri-indfb-draw-pwrite.html">SKIP</a> (<a=
 href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17428">i91=
5#17428</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/i=
ssues/4423">i915#4423</a>)</li>
</ul></li>
<li>
<p>igt@kms_frontbuffer_tracking@hdr-2p-primscrn-spr-indfb-fullscreen:</p><u=
l>
<li>shard-dg2:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_19395/shard-dg2-6/igt@kms_frontbuffer_tracking@hdr-2p-primscrn-spr-=
indfb-fullscreen.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/=
drm/i915/kernel/-/issues/15991">i915#15991</a>) -&gt; <a href=3D"https://in=
tel-gfx-ci.01.org/tree/drm-tip/Patchwork_169493v6/shard-dg2-7/igt@kms_front=
buffer_tracking@hdr-2p-primscrn-spr-indfb-fullscreen.html">SKIP</a> (<a hre=
f=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16708">i915#16=
708</a>) +20 other tests skip</li>
</ul></li>
<li>
<p>igt@kms_frontbuffer_tracking@hdr-suspend:</p><ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_19395/shard-rkl-8/igt@kms_frontbuffer_tracking@hdr-suspend.html">SK=
IP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/=
15989">i915#15989</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/dr=
m-tip/Patchwork_169493v6/shard-rkl-1/igt@kms_frontbuffer_tracking@hdr-suspe=
nd.html">ABORT</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kern=
el/-/issues/15132">i915#15132</a>)</li>
</ul></li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-1p-offscreen-pri-indfb-draw-mmap-gtt:</=
p><ul>
<li>shard-dg2:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_19395/shard-dg2-1/igt@kms_frontbuffer_tracking@psr-1p-offscreen-pri=
-indfb-draw-mmap-gtt.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.=
org/drm/i915/kernel/-/issues/15104">i915#15104</a> / <a href=3D"https://git=
lab.freedesktop.org/drm/i915/kernel/-/issues/15990">i915#15990</a>) -&gt; <=
a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_169493v6/shard=
-dg2-7/igt@kms_frontbuffer_tracking@psr-1p-offscreen-pri-indfb-draw-mmap-gt=
t.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel=
/-/issues/16708">i915#16708</a>)</li>
</ul></li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-1p-rte:</p><ul>
<li>shard-dg2:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_19395/shard-dg2-6/igt@kms_frontbuffer_tracking@psr-1p-rte.html">SKI=
P</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/1=
5102">i915#15102</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm=
-tip/Patchwork_169493v6/shard-dg2-7/igt@kms_frontbuffer_tracking@psr-1p-rte=
.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/=
-/issues/16708">i915#16708</a> / <a href=3D"https://gitlab.freedesktop.org/=
drm/i915/kernel/-/issues/5354">i915#5354</a>) +9 other tests skip</li>
</ul></li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-2p-primscrn-pri-indfb-draw-mmap-wc:</p>=
<ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_19395/shard-rkl-6/igt@kms_frontbuffer_tracking@psr-2p-primscrn-pri-=
indfb-draw-mmap-wc.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.or=
g/drm/i915/kernel/-/issues/14544">i915#14544</a> / <a href=3D"https://gitla=
b.freedesktop.org/drm/i915/kernel/-/issues/17428">i915#17428</a> / <a href=
=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/1825">i915#1825=
</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_1=
69493v6/shard-rkl-3/igt@kms_frontbuffer_tracking@psr-2p-primscrn-pri-indfb-=
draw-mmap-wc.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/=
i915/kernel/-/issues/17428">i915#17428</a> / <a href=3D"https://gitlab.free=
desktop.org/drm/i915/kernel/-/issues/1825">i915#1825</a>)</li>
</ul></li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-indfb-scaledprimary:</p><ul>
<li>shard-dg2:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_19395/shard-dg2-7/igt@kms_frontbuffer_tracking@psr-indfb-scaledprim=
ary.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kern=
el/-/issues/16708">i915#16708</a> / <a href=3D"https://gitlab.freedesktop.o=
rg/drm/i915/kernel/-/issues/5354">i915#5354</a>) -&gt; <a href=3D"https://i=
ntel-gfx-ci.01.org/tree/drm-tip/Patchwork_169493v6/shard-dg2-8/igt@kms_fron=
tbuffer_tracking@psr-indfb-scaledprimary.html">SKIP</a> (<a href=3D"https:/=
/gitlab.freedesktop.org/drm/i915/kernel/-/issues/15102">i915#15102</a>) +9 =
other tests skip</li>
</ul></li>
<li>
<p>igt@kms_frontbuffer_tracking@psrhdr-2p-primscrn-indfb-msflip-blt:</p><ul=
>
<li>shard-dg2:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_19395/shard-dg2-7/igt@kms_frontbuffer_tracking@psrhdr-2p-primscrn-i=
ndfb-msflip-blt.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/d=
rm/i915/kernel/-/issues/16708">i915#16708</a>) -&gt; <a href=3D"https://int=
el-gfx-ci.01.org/tree/drm-tip/Patchwork_169493v6/shard-dg2-8/igt@kms_frontb=
uffer_tracking@psrhdr-2p-primscrn-indfb-msflip-blt.html">SKIP</a> (<a href=
=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15991">i915#159=
91</a>) +27 other tests skip</li>
</ul></li>
<li>
<p>igt@kms_hdmi_audio_bw@suspend-disk-audio-recovery:</p><ul>
<li>shard-dg2:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_19395/shard-dg2-7/igt@kms_hdmi_audio_bw@suspend-disk-audio-recovery=
.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/=
-/issues/17357">i915#17357</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.or=
g/tree/drm-tip/Patchwork_169493v6/shard-dg2-4/igt@kms_hdmi_audio_bw@suspend=
-disk-audio-recovery.html">ABORT</a> (<a href=3D"https://gitlab.freedesktop=
.org/drm/i915/kernel/-/issues/15132">i915#15132</a>)</li>
</ul></li>
<li>
<p>igt@kms_hdr@bpc-switch-suspend:</p><ul>
<li>shard-dg2:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_19395/shard-dg2-7/igt@kms_hdr@bpc-switch-suspend.html">SKIP</a> (<a=
 href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17356">i91=
5#17356</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/Patc=
hwork_169493v6/shard-dg2-1/igt@kms_hdr@bpc-switch-suspend.html">SKIP</a> (<=
a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16518">i9=
15#16518</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/=
issues/3555">i915#3555</a> / <a href=3D"https://gitlab.freedesktop.org/drm/=
i915/kernel/-/issues/8228">i915#8228</a>)</li>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_19395/shard-rkl-6/igt@kms_hdr@bpc-switch-suspend.html">INCOMPLETE</=
a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/1543=
6">i915#15436</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-ti=
p/Patchwork_169493v6/shard-rkl-5/igt@kms_hdr@bpc-switch-suspend.html">SKIP<=
/a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/166=
44">i915#16644</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i915/ker=
nel/-/issues/3555">i915#3555</a> / <a href=3D"https://gitlab.freedesktop.or=
g/drm/i915/kernel/-/issues/8228">i915#8228</a>)</li>
</ul></li>
<li>
<p>igt@kms_joiner@basic-ultra-joiner:</p><ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_19395/shard-rkl-2/igt@kms_joiner@basic-ultra-joiner.html">SKIP</a> =
(<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15458">=
i915#15458</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/P=
atchwork_169493v6/shard-rkl-6/igt@kms_joiner@basic-ultra-joiner.html">SKIP<=
/a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/145=
44">i915#14544</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i915/ker=
nel/-/issues/15458">i915#15458</a>)</li>
</ul></li>
<li>
<p>igt@kms_pipe_b_c_ivb@from-pipe-c-to-b-with-3-lanes:</p><ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_19395/shard-rkl-3/igt@kms_pipe_b_c_ivb@from-pipe-c-to-b-with-3-lane=
s.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel=
/-/issues/17455">i915#17455</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.o=
rg/tree/drm-tip/Patchwork_169493v6/shard-rkl-6/igt@kms_pipe_b_c_ivb@from-pi=
pe-c-to-b-with-3-lanes.html">SKIP</a> (<a href=3D"https://gitlab.freedeskto=
p.org/drm/i915/kernel/-/issues/14544">i915#14544</a> / <a href=3D"https://g=
itlab.freedesktop.org/drm/i915/kernel/-/issues/17455">i915#17455</a>)</li>
</ul></li>
<li>
<p>igt@kms_pipe_stress@stress-xrgb8888-yftiled:</p><ul>
<li>shard-dg2:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_19395/shard-dg2-6/igt@kms_pipe_stress@stress-xrgb8888-yftiled.html"=
>SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issu=
es/14712">i915#14712</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree=
/drm-tip/Patchwork_169493v6/shard-dg2-7/igt@kms_pipe_stress@stress-xrgb8888=
-yftiled.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915=
/kernel/-/issues/17356">i915#17356</a>)</li>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_19395/shard-rkl-3/igt@kms_pipe_stress@stress-xrgb8888-yftiled.html"=
>SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issu=
es/14712">i915#14712</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree=
/drm-tip/Patchwork_169493v6/shard-rkl-6/igt@kms_pipe_stress@stress-xrgb8888=
-yftiled.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915=
/kernel/-/issues/14544">i915#14544</a> / <a href=3D"https://gitlab.freedesk=
top.org/drm/i915/kernel/-/issues/14712">i915#14712</a>)</li>
</ul></li>
<li>
<p>igt@kms_plane@pixel-format-4-tiled-lnl-ccs-modifier-source-clamping:</p>=
<ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_19395/shard-rkl-6/igt@kms_plane@pixel-format-4-tiled-lnl-ccs-modifi=
er-source-clamping.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.or=
g/drm/i915/kernel/-/issues/14544">i915#14544</a> / <a href=3D"https://gitla=
b.freedesktop.org/drm/i915/kernel/-/issues/15709">i915#15709</a>) -&gt; <a =
href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_169493v6/shard-r=
kl-4/igt@kms_plane@pixel-format-4-tiled-lnl-ccs-modifier-source-clamping.ht=
ml">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/i=
ssues/15709">i915#15709</a>) +1 other test skip</li>
</ul></li>
<li>
<p>igt@kms_plane@pixel-format-4-tiled-modifier:</p><ul>
<li>shard-dg1:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_19395/shard-dg1-18/igt@kms_plane@pixel-format-4-tiled-modifier.html=
">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/iss=
ues/15709">i915#15709</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tre=
e/drm-tip/Patchwork_169493v6/shard-dg1-17/igt@kms_plane@pixel-format-4-tile=
d-modifier.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i9=
15/kernel/-/issues/15709">i915#15709</a> / <a href=3D"https://gitlab.freede=
sktop.org/drm/i915/kernel/-/issues/4423">i915#4423</a>)</li>
</ul></li>
<li>
<p>igt@kms_plane@pixel-format-yf-tiled-modifier:</p><ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_19395/shard-rkl-3/igt@kms_plane@pixel-format-yf-tiled-modifier.html=
">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/iss=
ues/15709">i915#15709</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tre=
e/drm-tip/Patchwork_169493v6/shard-rkl-6/igt@kms_plane@pixel-format-yf-tile=
d-modifier.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i9=
15/kernel/-/issues/14544">i915#14544</a> / <a href=3D"https://gitlab.freede=
sktop.org/drm/i915/kernel/-/issues/15709">i915#15709</a>) +2 other tests sk=
ip</li>
</ul></li>
<li>
<p>igt@kms_plane_lowres@tiling-y:</p><ul>
<li>shard-dg2:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_19395/shard-dg2-6/igt@kms_plane_lowres@tiling-y.html">SKIP</a> (<a =
href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8821">i915#=
8821</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/Patchwo=
rk_169493v6/shard-dg2-7/igt@kms_plane_lowres@tiling-y.html">SKIP</a> (<a hr=
ef=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17356">i915#1=
7356</a>)</li>
</ul></li>
<li>
<p>igt@kms_plane_multiple@2x-tiling-y:</p><ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_19395/shard-rkl-2/igt@kms_plane_multiple@2x-tiling-y.html">SKIP</a>=
 (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13958"=
>i915#13958</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/=
Patchwork_169493v6/shard-rkl-6/igt@kms_plane_multiple@2x-tiling-y.html">SKI=
P</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/1=
3958">i915#13958</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i915/k=
ernel/-/issues/14544">i915#14544</a>)</li>
</ul></li>
<li>
<p>igt@kms_plane_multiple@tiling-y:</p><ul>
<li>shard-dg2:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_19395/shard-dg2-7/igt@kms_plane_multiple@tiling-y.html">SKIP</a> (<=
a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17356">i9=
15#17356</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/Pat=
chwork_169493v6/shard-dg2-4/igt@kms_plane_multiple@tiling-y.html">SKIP</a> =
(<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14259">=
i915#14259</a>)</li>
</ul></li>
<li>
<p>igt@kms_pm_dc@dc5-psr:</p><ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_19395/shard-rkl-2/igt@kms_pm_dc@dc5-psr.html">SKIP</a> (<a href=3D"=
https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15948">i915#15948</=
a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_169=
493v6/shard-rkl-6/igt@kms_pm_dc@dc5-psr.html">SKIP</a> (<a href=3D"https://=
gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a> / <a =
href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15948">i915=
#15948</a>)</li>
</ul></li>
<li>
<p>igt@kms_pm_dc@dc5-psr-suspend-resume:</p><ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_19395/shard-rkl-6/igt@kms_pm_dc@dc5-psr-suspend-resume.html">SKIP</=
a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/1454=
4">i915#14544</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i915/kern=
el/-/issues/16914">i915#16914</a>) -&gt; <a href=3D"https://intel-gfx-ci.01=
.org/tree/drm-tip/Patchwork_169493v6/shard-rkl-5/igt@kms_pm_dc@dc5-psr-susp=
end-resume.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i9=
15/kernel/-/issues/16914">i915#16914</a>)</li>
</ul></li>
<li>
<p>igt@kms_pm_rpm@package-g7:</p><ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_19395/shard-rkl-3/igt@kms_pm_rpm@package-g7.html">SKIP</a> (<a href=
=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15403">i915#154=
03</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork=
_169493v6/shard-rkl-6/igt@kms_pm_rpm@package-g7.html">SKIP</a> (<a href=3D"=
https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14544</=
a> / <a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/154=
03">i915#15403</a>)</li>
</ul></li>
<li>
<p>igt@kms_prime@basic-modeset-hybrid:</p><ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_19395/shard-rkl-2/igt@kms_prime@basic-modeset-hybrid.html">SKIP</a>=
 (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6524">=
i915#6524</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/Pa=
tchwork_169493v6/shard-rkl-6/igt@kms_prime@basic-modeset-hybrid.html">SKIP<=
/a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/145=
44">i915#14544</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i915/ker=
nel/-/issues/6524">i915#6524</a>)</li>
</ul></li>
<li>
<p>igt@kms_psr2_sf@fbc-pr-overlay-plane-move-continuous-sf:</p><ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_19395/shard-rkl-2/igt@kms_psr2_sf@fbc-pr-overlay-plane-move-continu=
ous-sf.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/k=
ernel/-/issues/11520">i915#11520</a>) -&gt; <a href=3D"https://intel-gfx-ci=
.01.org/tree/drm-tip/Patchwork_169493v6/shard-rkl-6/igt@kms_psr2_sf@fbc-pr-=
overlay-plane-move-continuous-sf.html">SKIP</a> (<a href=3D"https://gitlab.=
freedesktop.org/drm/i915/kernel/-/issues/11520">i915#11520</a> / <a href=3D=
"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14544<=
/a>) +5 other tests skip</li>
</ul></li>
<li>
<p>igt@kms_psr2_sf@pr-overlay-plane-update-continuous-sf:</p><ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_19395/shard-rkl-6/igt@kms_psr2_sf@pr-overlay-plane-update-continuou=
s-sf.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/ker=
nel/-/issues/11520">i915#11520</a> / <a href=3D"https://gitlab.freedesktop.=
org/drm/i915/kernel/-/issues/14544">i915#14544</a>) -&gt; <a href=3D"https:=
//intel-gfx-ci.01.org/tree/drm-tip/Patchwork_169493v6/shard-rkl-5/igt@kms_p=
sr2_sf@pr-overlay-plane-update-continuous-sf.html">SKIP</a> (<a href=3D"htt=
ps://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11520">i915#11520</a>)=
</li>
</ul></li>
<li>
<p>igt@kms_psr@fbc-pr-sprite-plane-onoff:</p><ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_19395/shard-rkl-6/igt@kms_psr@fbc-pr-sprite-plane-onoff.html">SKIP<=
/a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/107=
2">i915#1072</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i915/kerne=
l/-/issues/14544">i915#14544</a> / <a href=3D"https://gitlab.freedesktop.or=
g/drm/i915/kernel/-/issues/9732">i915#9732</a>) -&gt; <a href=3D"https://in=
tel-gfx-ci.01.org/tree/drm-tip/Patchwork_169493v6/shard-rkl-5/igt@kms_psr@f=
bc-pr-sprite-plane-onoff.html">SKIP</a> (<a href=3D"https://gitlab.freedesk=
top.org/drm/i915/kernel/-/issues/1072">i915#1072</a> / <a href=3D"https://g=
itlab.freedesktop.org/drm/i915/kernel/-/issues/9732">i915#9732</a>) +3 othe=
r tests skip</li>
</ul></li>
<li>
<p>igt@kms_psr@psr2-sprite-mmap-cpu:</p><ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_19395/shard-rkl-2/igt@kms_psr@psr2-sprite-mmap-cpu.html">SKIP</a> (=
<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/1072">i9=
15#1072</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/i=
ssues/9732">i915#9732</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tre=
e/drm-tip/Patchwork_169493v6/shard-rkl-6/igt@kms_psr@psr2-sprite-mmap-cpu.h=
tml">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/=
issues/1072">i915#1072</a> / <a href=3D"https://gitlab.freedesktop.org/drm/=
i915/kernel/-/issues/14544">i915#14544</a> / <a href=3D"https://gitlab.free=
desktop.org/drm/i915/kernel/-/issues/9732">i915#9732</a>) +14 other tests s=
kip</li>
</ul></li>
<li>
<p>igt@kms_rotation_crc@primary-rotation-90:</p><ul>
<li>shard-dg2:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_19395/shard-dg2-5/igt@kms_rotation_crc@primary-rotation-90.html">SK=
IP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/=
12755">i915#12755</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i915/=
kernel/-/issues/15867">i915#15867</a>) -&gt; <a href=3D"https://intel-gfx-c=
i.01.org/tree/drm-tip/Patchwork_169493v6/shard-dg2-7/igt@kms_rotation_crc@p=
rimary-rotation-90.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.or=
g/drm/i915/kernel/-/issues/17356">i915#17356</a>)</li>
</ul></li>
<li>
<p>igt@kms_rotation_crc@primary-yf-tiled-reflect-x-0:</p><ul>
<li>shard-dg2:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_19395/shard-dg2-7/igt@kms_rotation_crc@primary-yf-tiled-reflect-x-0=
.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/=
-/issues/17356">i915#17356</a> / <a href=3D"https://gitlab.freedesktop.org/=
drm/i915/kernel/-/issues/5190">i915#5190</a>) -&gt; <a href=3D"https://inte=
l-gfx-ci.01.org/tree/drm-tip/Patchwork_169493v6/shard-dg2-1/igt@kms_rotatio=
n_crc@primary-yf-tiled-reflect-x-0.html">SKIP</a> (<a href=3D"https://gitla=
b.freedesktop.org/drm/i915/kernel/-/issues/5190">i915#5190</a>) +1 other te=
st skip</li>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_19395/shard-rkl-6/igt@kms_rotation_crc@primary-yf-tiled-reflect-x-0=
.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/=
-/issues/14544">i915#14544</a> / <a href=3D"https://gitlab.freedesktop.org/=
drm/i915/kernel/-/issues/17432">i915#17432</a> / <a href=3D"https://gitlab.=
freedesktop.org/drm/i915/kernel/-/issues/5289">i915#5289</a>) -&gt; <a href=
=3D"https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_169493v6/shard-rkl-5=
/igt@kms_rotation_crc@primary-yf-tiled-reflect-x-0.html">SKIP</a> (<a href=
=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17432">i915#174=
32</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues=
/5289">i915#5289</a>)</li>
</ul></li>
<li>
<p>igt@kms_tiled_display@basic-test-pattern-with-chamelium:</p><ul>
<li>shard-dg2:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_19395/shard-dg2-7/igt@kms_tiled_display@basic-test-pattern-with-cha=
melium.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/k=
ernel/-/issues/17356">i915#17356</a>) -&gt; <a href=3D"https://intel-gfx-ci=
.01.org/tree/drm-tip/Patchwork_169493v6/shard-dg2-5/igt@kms_tiled_display@b=
asic-test-pattern-with-chamelium.html">SKIP</a> (<a href=3D"https://gitlab.=
freedesktop.org/drm/i915/kernel/-/issues/8623">i915#8623</a>)</li>
</ul></li>
<li>
<p>igt@kms_vrr@flip-basic:</p><ul>
<li>shard-dg2:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_19395/shard-dg2-1/igt@kms_vrr@flip-basic.html">SKIP</a> (<a href=3D=
"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15243">i915#15243<=
/a> / <a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/35=
55">i915#3555</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-ti=
p/Patchwork_169493v6/shard-dg2-7/igt@kms_vrr@flip-basic.html">SKIP</a> (<a =
href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17356">i915=
#17356</a>)</li>
</ul></li>
<li>
<p>igt@kms_vrr@max-min:</p><ul>
<li>shard-dg2:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_19395/shard-dg2-7/igt@kms_vrr@max-min.html">SKIP</a> (<a href=3D"ht=
tps://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17356">i915#17356</a>=
) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_16949=
3v6/shard-dg2-8/igt@kms_vrr@max-min.html">SKIP</a> (<a href=3D"https://gitl=
ab.freedesktop.org/drm/i915/kernel/-/issues/9906">i915#9906</a>)</li>
</ul></li>
<li>
<p>igt@kms_vrr@negative-basic:</p><ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_19395/shard-rkl-2/igt@kms_vrr@negative-basic.html">SKIP</a> (<a hre=
f=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3555">i915#355=
5</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/=
9906">i915#9906</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-=
tip/Patchwork_169493v6/shard-rkl-6/igt@kms_vrr@negative-basic.html">SKIP</a=
> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544=
">i915#14544</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i915/kerne=
l/-/issues/3555">i915#3555</a> / <a href=3D"https://gitlab.freedesktop.org/=
drm/i915/kernel/-/issues/9906">i915#9906</a>)</li>
</ul></li>
<li>
<p>igt@kms_vrr@seamless-rr-switch-vrr:</p><ul>
<li>shard-dg2:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_19395/shard-dg2-6/igt@kms_vrr@seamless-rr-switch-vrr.html">SKIP</a>=
 (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9906">=
i915#9906</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/Pa=
tchwork_169493v6/shard-dg2-7/igt@kms_vrr@seamless-rr-switch-vrr.html">SKIP<=
/a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/173=
56">i915#17356</a>) +1 other test skip</li>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_19395/shard-rkl-3/igt@kms_vrr@seamless-rr-switch-vrr.html">SKIP</a>=
 (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9906">=
i915#9906</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/Pa=
tchwork_169493v6/shard-rkl-6/igt@kms_vrr@seamless-rr-switch-vrr.html">SKIP<=
/a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/145=
44">i915#14544</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i915/ker=
nel/-/issues/9906">i915#9906</a>)</li>
</ul></li>
<li>
<p>igt@prime_vgem@basic-read:</p><ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_19395/shard-rkl-2/igt@prime_vgem@basic-read.html">SKIP</a> (<a href=
=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17448">i915#174=
48</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues=
/3291">i915#3291</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i915/k=
ernel/-/issues/3708">i915#3708</a>) -&gt; <a href=3D"https://intel-gfx-ci.0=
1.org/tree/drm-tip/Patchwork_169493v6/shard-rkl-6/igt@prime_vgem@basic-read=
.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/=
-/issues/14544">i915#14544</a> / <a href=3D"https://gitlab.freedesktop.org/=
drm/i915/kernel/-/issues/17448">i915#17448</a> / <a href=3D"https://gitlab.=
freedesktop.org/drm/i915/kernel/-/issues/3291">i915#3291</a> / <a href=3D"h=
ttps://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3708">i915#3708</a>)=
</li>
</ul></li>
<li>
<p>igt@prime_vgem@fence-flip-hang:</p><ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_19395/shard-rkl-6/igt@prime_vgem@fence-flip-hang.html">SKIP</a> (<a=
 href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i91=
5#14544</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/i=
ssues/17448">i915#17448</a> / <a href=3D"https://gitlab.freedesktop.org/drm=
/i915/kernel/-/issues/3708">i915#3708</a>) -&gt; <a href=3D"https://intel-g=
fx-ci.01.org/tree/drm-tip/Patchwork_169493v6/shard-rkl-7/igt@prime_vgem@fen=
ce-flip-hang.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/=
i915/kernel/-/issues/17448">i915#17448</a> / <a href=3D"https://gitlab.free=
desktop.org/drm/i915/kernel/-/issues/3708">i915#3708</a>)</li>
</ul></li>
</ul><h2>Build changes</h2><ul>
<li>Linux: CI_DRM_19395 -&gt; Patchwork_169493v6</li>
</ul><p>CI-20190529: 20190529<br> CI_DRM_19395: 8e30a30c4948a9b30b9af31ebfa=
aa951630ae8a3 @ git://anongit.freedesktop.org/gfx-ci/linux<br> IGT_9164: 91=
64<br> Patchwork_169493v6: 8e30a30c4948a9b30b9af31ebfaaa951630ae8a3 @ git:/=
/anongit.freedesktop.org/gfx-ci/linux<br> piglit_4509: fdc5a4ca11124ab8413c=
7988896eec4c97336694 @ git://anongit.freedesktop.org/piglit</p></blockquote=
><div><br></div><div><span></span></div></body></html>

--=-CIECiLhEH69+RfAN0zLG--
