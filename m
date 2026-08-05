Return-Path: <intel-gfx-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B7B97C55822
	for <intel-gfx@archiver.kernel.org>; Wed,  5 Aug 2026 07:33:36 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4922A10E18F;
	Wed,  5 Aug 2026 07:33:36 +0000 (UTC)
Received: from 61270ab9df2a (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 435A510E18F;
 Wed,  5 Aug 2026 07:33:35 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============5057692811932235384=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=93_i915=2ECI=2EFull=3A_success_for_drm/i915/flipq=3A_Fix_cu?=
 =?utf-8?q?rsor_left_enabled_after_a_pipe_disable?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Mika Kahola" <mika.kahola@intel.com>
Cc: intel-gfx@lists.freedesktop.org
Date: Wed, 05 Aug 2026 07:33:35 -0000
Message-ID: <178591521525.20166.14025727909189110547@61270ab9df2a>
X-Patchwork-Hint: ignore
References: <20260804063058.969207-1-mika.kahola@intel.com>
In-Reply-To: <20260804063058.969207-1-mika.kahola@intel.com>
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

--===============5057692811932235384==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: drm/i915/flipq: Fix cursor left enabled after a pipe disable
URL   : https://patchwork.freedesktop.org/series/171551/
State : success

== Summary ==

CI Bug Log - changes from CI_DRM_18943_full -> Patchwork_171551v1_full
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

  Here are the changes found in Patchwork_171551v1_full that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@fbdev@nullptr:
    - shard-dg2:          [PASS][1] -> [SKIP][2] ([i915#2582])
   [1]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18943/shard-dg2-8/igt@fbdev@nullptr.html
   [2]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_171551v1/shard-dg2-10/igt@fbdev@nullptr.html

  * igt@gem_bad_reloc@negative-reloc-lut:
    - shard-rkl:          NOTRUN -> [SKIP][3] ([i915#3281]) +4 other tests skip
   [3]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_171551v1/shard-rkl-2/igt@gem_bad_reloc@negative-reloc-lut.html

  * igt@gem_ccs@large-ctrl-surf-copy:
    - shard-tglu-1:       NOTRUN -> [SKIP][4] ([i915#13008])
   [4]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_171551v1/shard-tglu-1/igt@gem_ccs@large-ctrl-surf-copy.html

  * igt@gem_ccs@suspend-resume@tile64-compressed-compfmt0-lmem0-lmem0:
    - shard-dg2:          NOTRUN -> [INCOMPLETE][5] ([i915#13356] / [i915#16348])
   [5]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_171551v1/shard-dg2-6/igt@gem_ccs@suspend-resume@tile64-compressed-compfmt0-lmem0-lmem0.html

  * igt@gem_ctx_freq@sysfs@gt0:
    - shard-dg2:          ([PASS][6], [PASS][7]) -> [FAIL][8] ([i915#9561]) +1 other test fail
   [6]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18943/shard-dg2-7/igt@gem_ctx_freq@sysfs@gt0.html
   [7]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18943/shard-dg2-4/igt@gem_ctx_freq@sysfs@gt0.html
   [8]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_171551v1/shard-dg2-5/igt@gem_ctx_freq@sysfs@gt0.html

  * igt@gem_ctx_isolation@preservation-s3:
    - shard-glk10:        NOTRUN -> [INCOMPLETE][9] ([i915#13356] / [i915#16466]) +1 other test incomplete
   [9]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_171551v1/shard-glk10/igt@gem_ctx_isolation@preservation-s3.html

  * igt@gem_exec_suspend@basic-s0:
    - shard-dg2:          ([PASS][10], [PASS][11]) -> [INCOMPLETE][12] ([i915#13356]) +1 other test incomplete
   [10]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18943/shard-dg2-10/igt@gem_exec_suspend@basic-s0.html
   [11]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18943/shard-dg2-8/igt@gem_exec_suspend@basic-s0.html
   [12]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_171551v1/shard-dg2-1/igt@gem_exec_suspend@basic-s0.html

  * igt@gem_lmem_swapping@parallel-multi:
    - shard-glk:          NOTRUN -> [SKIP][13] ([i915#4613])
   [13]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_171551v1/shard-glk2/igt@gem_lmem_swapping@parallel-multi.html

  * igt@gem_media_vme:
    - shard-tglu-1:       NOTRUN -> [SKIP][14] ([i915#284])
   [14]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_171551v1/shard-tglu-1/igt@gem_media_vme.html

  * igt@gem_pread@display:
    - shard-rkl:          NOTRUN -> [SKIP][15] ([i915#3282]) +1 other test skip
   [15]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_171551v1/shard-rkl-2/igt@gem_pread@display.html

  * igt@i915_module_load@fault-injection@intel_connector_register:
    - shard-glk10:        NOTRUN -> [ABORT][16] ([i915#15342]) +1 other test abort
   [16]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_171551v1/shard-glk10/igt@i915_module_load@fault-injection@intel_connector_register.html

  * igt@i915_module_load@fault-injection@intel_gt_init-enodev:
    - shard-glk10:        NOTRUN -> [SKIP][17] +125 other tests skip
   [17]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_171551v1/shard-glk10/igt@i915_module_load@fault-injection@intel_gt_init-enodev.html

  * igt@i915_pm_rc6_residency@media-rc6-accuracy:
    - shard-tglu-1:       NOTRUN -> [SKIP][18] ([i915#16080] / [i915#16166])
   [18]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_171551v1/shard-tglu-1/igt@i915_pm_rc6_residency@media-rc6-accuracy.html

  * igt@i915_pm_rpm@gem-execbuf-stress-pc8:
    - shard-glk:          NOTRUN -> [SKIP][19] +87 other tests skip
   [19]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_171551v1/shard-glk2/igt@i915_pm_rpm@gem-execbuf-stress-pc8.html

  * igt@i915_pm_rpm@system-suspend:
    - shard-rkl:          ([PASS][20], [PASS][21]) -> [INCOMPLETE][22] ([i915#13356])
   [20]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18943/shard-rkl-7/igt@i915_pm_rpm@system-suspend.html
   [21]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18943/shard-rkl-8/igt@i915_pm_rpm@system-suspend.html
   [22]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_171551v1/shard-rkl-4/igt@i915_pm_rpm@system-suspend.html

  * igt@kms_async_flips@alternate-sync-async-flip-atomic@pipe-a-hdmi-a-2:
    - shard-glk:          ([PASS][23], [PASS][24]) -> [FAIL][25] ([i915#14888])
   [23]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18943/shard-glk6/igt@kms_async_flips@alternate-sync-async-flip-atomic@pipe-a-hdmi-a-2.html
   [24]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18943/shard-glk8/igt@kms_async_flips@alternate-sync-async-flip-atomic@pipe-a-hdmi-a-2.html
   [25]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_171551v1/shard-glk2/igt@kms_async_flips@alternate-sync-async-flip-atomic@pipe-a-hdmi-a-2.html

  * igt@kms_atomic@plane-primary-legacy:
    - shard-dg2:          [PASS][26] -> [SKIP][27] ([i915#16707]) +9 other tests skip
   [26]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18943/shard-dg2-8/igt@kms_atomic@plane-primary-legacy.html
   [27]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_171551v1/shard-dg2-10/igt@kms_atomic@plane-primary-legacy.html

  * igt@kms_big_fb@4-tiled-64bpp-rotate-0:
    - shard-tglu-1:       NOTRUN -> [SKIP][28] ([i915#5286])
   [28]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_171551v1/shard-tglu-1/igt@kms_big_fb@4-tiled-64bpp-rotate-0.html

  * igt@kms_big_fb@4-tiled-addfb:
    - shard-rkl:          NOTRUN -> [SKIP][29] ([i915#5286]) +1 other test skip
   [29]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_171551v1/shard-rkl-2/igt@kms_big_fb@4-tiled-addfb.html

  * igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-0-hflip:
    - shard-dg2:          ([PASS][30], [PASS][31]) -> [SKIP][32] ([i915#16707]) +10 other tests skip
   [30]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18943/shard-dg2-6/igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-0-hflip.html
   [31]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18943/shard-dg2-1/igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-0-hflip.html
   [32]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_171551v1/shard-dg2-10/igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-0-hflip.html

  * igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-180-hflip:
    - shard-mtlp:         ([PASS][33], [PASS][34]) -> [FAIL][35] ([i915#15733] / [i915#5138]) +1 other test fail
   [33]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18943/shard-mtlp-6/igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-180-hflip.html
   [34]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18943/shard-mtlp-8/igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-180-hflip.html
   [35]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_171551v1/shard-mtlp-6/igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-180-hflip.html

  * igt@kms_ccs@bad-aux-stride-4-tiled-mtl-mc-ccs@pipe-c-hdmi-a-2:
    - shard-glk11:        NOTRUN -> [SKIP][36] +47 other tests skip
   [36]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_171551v1/shard-glk11/igt@kms_ccs@bad-aux-stride-4-tiled-mtl-mc-ccs@pipe-c-hdmi-a-2.html

  * igt@kms_ccs@bad-aux-stride-y-tiled-gen12-rc-ccs-cc@pipe-d-hdmi-a-1:
    - shard-dg2:          NOTRUN -> [SKIP][37] ([i915#10307] / [i915#10434] / [i915#6095])
   [37]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_171551v1/shard-dg2-4/igt@kms_ccs@bad-aux-stride-y-tiled-gen12-rc-ccs-cc@pipe-d-hdmi-a-1.html

  * igt@kms_ccs@bad-rotation-90-4-tiled-mtl-rc-ccs@pipe-b-hdmi-a-2:
    - shard-rkl:          NOTRUN -> [SKIP][38] ([i915#6095]) +43 other tests skip
   [38]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_171551v1/shard-rkl-7/igt@kms_ccs@bad-rotation-90-4-tiled-mtl-rc-ccs@pipe-b-hdmi-a-2.html

  * igt@kms_ccs@crc-primary-basic-4-tiled-mtl-mc-ccs@pipe-d-hdmi-a-1:
    - shard-dg2:          NOTRUN -> [SKIP][39] ([i915#10307] / [i915#6095]) +26 other tests skip
   [39]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_171551v1/shard-dg2-4/igt@kms_ccs@crc-primary-basic-4-tiled-mtl-mc-ccs@pipe-d-hdmi-a-1.html

  * igt@kms_ccs@crc-primary-suspend-4-tiled-mtl-rc-ccs@pipe-c-hdmi-a-1:
    - shard-dg2:          NOTRUN -> [SKIP][40] ([i915#6095]) +3 other tests skip
   [40]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_171551v1/shard-dg2-4/igt@kms_ccs@crc-primary-suspend-4-tiled-mtl-rc-ccs@pipe-c-hdmi-a-1.html

  * igt@kms_ccs@crc-primary-suspend-yf-tiled-ccs:
    - shard-rkl:          NOTRUN -> [SKIP][41] ([i915#14098] / [i915#6095]) +24 other tests skip
   [41]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_171551v1/shard-rkl-2/igt@kms_ccs@crc-primary-suspend-yf-tiled-ccs.html

  * igt@kms_ccs@crc-sprite-planes-basic-4-tiled-mtl-rc-ccs-cc@pipe-a-hdmi-a-4:
    - shard-dg1:          NOTRUN -> [SKIP][42] ([i915#6095]) +51 other tests skip
   [42]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_171551v1/shard-dg1-19/igt@kms_ccs@crc-sprite-planes-basic-4-tiled-mtl-rc-ccs-cc@pipe-a-hdmi-a-4.html

  * igt@kms_ccs@crc-sprite-planes-basic-yf-tiled-ccs@pipe-a-hdmi-a-2:
    - shard-rkl:          NOTRUN -> [SKIP][43] ([i915#14544] / [i915#6095]) +1 other test skip
   [43]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_171551v1/shard-rkl-6/igt@kms_ccs@crc-sprite-planes-basic-yf-tiled-ccs@pipe-a-hdmi-a-2.html

  * igt@kms_ccs@crc-sprite-planes-basic-yf-tiled-ccs@pipe-c-hdmi-a-2:
    - shard-rkl:          NOTRUN -> [SKIP][44] ([i915#14098] / [i915#14544] / [i915#6095])
   [44]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_171551v1/shard-rkl-6/igt@kms_ccs@crc-sprite-planes-basic-yf-tiled-ccs@pipe-c-hdmi-a-2.html

  * igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs@pipe-d-hdmi-a-1:
    - shard-tglu-1:       NOTRUN -> [SKIP][45] ([i915#6095]) +19 other tests skip
   [45]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_171551v1/shard-tglu-1/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs@pipe-d-hdmi-a-1.html

  * igt@kms_cdclk@plane-scaling@pipe-d-hdmi-a-1:
    - shard-dg2:          NOTRUN -> [SKIP][46] ([i915#13783]) +3 other tests skip
   [46]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_171551v1/shard-dg2-4/igt@kms_cdclk@plane-scaling@pipe-d-hdmi-a-1.html

  * igt@kms_chamelium_color_pipeline@plane-lut1d:
    - shard-tglu-1:       NOTRUN -> [SKIP][47] ([i915#16471])
   [47]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_171551v1/shard-tglu-1/igt@kms_chamelium_color_pipeline@plane-lut1d.html

  * igt@kms_chamelium_hpd@hdmi-hpd-enable-disable-mode:
    - shard-rkl:          NOTRUN -> [SKIP][48] ([i915#11151] / [i915#7828]) +1 other test skip
   [48]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_171551v1/shard-rkl-2/igt@kms_chamelium_hpd@hdmi-hpd-enable-disable-mode.html

  * igt@kms_chamelium_hpd@hdmi-hpd-storm-disable:
    - shard-tglu-1:       NOTRUN -> [SKIP][49] ([i915#11151] / [i915#7828]) +1 other test skip
   [49]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_171551v1/shard-tglu-1/igt@kms_chamelium_hpd@hdmi-hpd-storm-disable.html

  * igt@kms_color@ctm-0-25:
    - shard-dg2:          [PASS][50] -> [SKIP][51] ([i915#12655])
   [50]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18943/shard-dg2-8/igt@kms_color@ctm-0-25.html
   [51]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_171551v1/shard-dg2-10/igt@kms_color@ctm-0-25.html

  * igt@kms_color@ctm-0-75:
    - shard-dg2:          ([PASS][52], [PASS][53]) -> [SKIP][54] ([i915#12655])
   [52]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18943/shard-dg2-1/igt@kms_color@ctm-0-75.html
   [53]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18943/shard-dg2-6/igt@kms_color@ctm-0-75.html
   [54]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_171551v1/shard-dg2-10/igt@kms_color@ctm-0-75.html

  * igt@kms_content_protection@dp-mst-lic-type-0:
    - shard-rkl:          NOTRUN -> [SKIP][55] ([i915#15330] / [i915#3116])
   [55]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_171551v1/shard-rkl-2/igt@kms_content_protection@dp-mst-lic-type-0.html

  * igt@kms_content_protection@suspend-resume:
    - shard-tglu-1:       NOTRUN -> [SKIP][56] ([i915#15865])
   [56]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_171551v1/shard-tglu-1/igt@kms_content_protection@suspend-resume.html

  * igt@kms_cursor_crc@cursor-offscreen-32x10:
    - shard-rkl:          NOTRUN -> [SKIP][57] ([i915#3555]) +1 other test skip
   [57]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_171551v1/shard-rkl-2/igt@kms_cursor_crc@cursor-offscreen-32x10.html

  * igt@kms_cursor_crc@cursor-onscreen-128x42@pipe-a-hdmi-a-1:
    - shard-rkl:          NOTRUN -> [FAIL][58] ([i915#13566])
   [58]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_171551v1/shard-rkl-5/igt@kms_cursor_crc@cursor-onscreen-128x42@pipe-a-hdmi-a-1.html

  * igt@kms_cursor_crc@cursor-onscreen-256x85:
    - shard-tglu:         ([PASS][59], [PASS][60]) -> [FAIL][61] ([i915#13566]) +1 other test fail
   [59]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18943/shard-tglu-6/igt@kms_cursor_crc@cursor-onscreen-256x85.html
   [60]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18943/shard-tglu-9/igt@kms_cursor_crc@cursor-onscreen-256x85.html
   [61]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_171551v1/shard-tglu-9/igt@kms_cursor_crc@cursor-onscreen-256x85.html

  * igt@kms_cursor_crc@cursor-onscreen-32x10:
    - shard-tglu-1:       NOTRUN -> [SKIP][62] ([i915#3555])
   [62]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_171551v1/shard-tglu-1/igt@kms_cursor_crc@cursor-onscreen-32x10.html

  * igt@kms_cursor_crc@cursor-random-256x85@pipe-a-hdmi-a-1:
    - shard-rkl:          [PASS][63] -> [FAIL][64] ([i915#13566]) +1 other test fail
   [63]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18943/shard-rkl-5/igt@kms_cursor_crc@cursor-random-256x85@pipe-a-hdmi-a-1.html
   [64]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_171551v1/shard-rkl-8/igt@kms_cursor_crc@cursor-random-256x85@pipe-a-hdmi-a-1.html

  * igt@kms_cursor_crc@cursor-sliding-512x170:
    - shard-tglu-1:       NOTRUN -> [SKIP][65] ([i915#13049])
   [65]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_171551v1/shard-tglu-1/igt@kms_cursor_crc@cursor-sliding-512x170.html

  * igt@kms_dsc@dsc-fractional-bpp:
    - shard-rkl:          NOTRUN -> [SKIP][66] ([i915#16361]) +1 other test skip
   [66]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_171551v1/shard-rkl-2/igt@kms_dsc@dsc-fractional-bpp.html

  * igt@kms_dsc@dsc-with-output-formats-with-bpc:
    - shard-tglu-1:       NOTRUN -> [SKIP][67] ([i915#16361]) +1 other test skip
   [67]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_171551v1/shard-tglu-1/igt@kms_dsc@dsc-with-output-formats-with-bpc.html

  * igt@kms_flip@2x-flip-vs-suspend-interruptible:
    - shard-glk11:        NOTRUN -> [INCOMPLETE][68] ([i915#12745] / [i915#4839])
   [68]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_171551v1/shard-glk11/igt@kms_flip@2x-flip-vs-suspend-interruptible.html

  * igt@kms_flip@2x-flip-vs-suspend-interruptible@ac-hdmi-a1-hdmi-a2:
    - shard-glk11:        NOTRUN -> [INCOMPLETE][69] ([i915#12745])
   [69]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_171551v1/shard-glk11/igt@kms_flip@2x-flip-vs-suspend-interruptible@ac-hdmi-a1-hdmi-a2.html

  * igt@kms_flip@2x-plain-flip-fb-recreate-interruptible:
    - shard-tglu-1:       NOTRUN -> [SKIP][70] ([i915#3637] / [i915#9934]) +1 other test skip
   [70]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_171551v1/shard-tglu-1/igt@kms_flip@2x-plain-flip-fb-recreate-interruptible.html

  * igt@kms_flip@absolute-wf_vblank:
    - shard-dg2:          [PASS][71] -> [SKIP][72] ([i915#5354]) +1 other test skip
   [71]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18943/shard-dg2-8/igt@kms_flip@absolute-wf_vblank.html
   [72]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_171551v1/shard-dg2-10/igt@kms_flip@absolute-wf_vblank.html

  * igt@kms_flip@flip-vs-absolute-wf_vblank-interruptible:
    - shard-dg1:          ([PASS][73], [PASS][74]) -> [FAIL][75] ([i915#14600])
   [73]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18943/shard-dg1-19/igt@kms_flip@flip-vs-absolute-wf_vblank-interruptible.html
   [74]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18943/shard-dg1-14/igt@kms_flip@flip-vs-absolute-wf_vblank-interruptible.html
   [75]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_171551v1/shard-dg1-15/igt@kms_flip@flip-vs-absolute-wf_vblank-interruptible.html

  * igt@kms_flip@flip-vs-absolute-wf_vblank-interruptible@d-hdmi-a1:
    - shard-dg1:          [PASS][76] -> [FAIL][77] ([i915#14600])
   [76]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18943/shard-dg1-14/igt@kms_flip@flip-vs-absolute-wf_vblank-interruptible@d-hdmi-a1.html
   [77]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_171551v1/shard-dg1-15/igt@kms_flip@flip-vs-absolute-wf_vblank-interruptible@d-hdmi-a1.html

  * igt@kms_flip@flip-vs-dpms-on-nop:
    - shard-dg2:          ([PASS][78], [PASS][79]) -> [SKIP][80] ([i915#16724])
   [78]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18943/shard-dg2-1/igt@kms_flip@flip-vs-dpms-on-nop.html
   [79]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18943/shard-dg2-6/igt@kms_flip@flip-vs-dpms-on-nop.html
   [80]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_171551v1/shard-dg2-10/igt@kms_flip@flip-vs-dpms-on-nop.html

  * igt@kms_flip@flip-vs-expired-vblank-interruptible:
    - shard-rkl:          ([PASS][81], [PASS][82]) -> [FAIL][83] ([i915#13027]) +1 other test fail
   [81]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18943/shard-rkl-1/igt@kms_flip@flip-vs-expired-vblank-interruptible.html
   [82]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18943/shard-rkl-3/igt@kms_flip@flip-vs-expired-vblank-interruptible.html
   [83]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_171551v1/shard-rkl-3/igt@kms_flip@flip-vs-expired-vblank-interruptible.html

  * igt@kms_flip@plain-flip-interruptible:
    - shard-dg2:          ([PASS][84], [PASS][85]) -> [SKIP][86] ([i915#5354]) +2 other tests skip
   [84]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18943/shard-dg2-1/igt@kms_flip@plain-flip-interruptible.html
   [85]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18943/shard-dg2-6/igt@kms_flip@plain-flip-interruptible.html
   [86]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_171551v1/shard-dg2-10/igt@kms_flip@plain-flip-interruptible.html

  * igt@kms_flip@plain-flip-ts-check@c-hdmi-a3:
    - shard-dg2:          ([PASS][87], [PASS][88]) -> [FAIL][89] ([i915#14600]) +1 other test fail
   [87]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18943/shard-dg2-3/igt@kms_flip@plain-flip-ts-check@c-hdmi-a3.html
   [88]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18943/shard-dg2-5/igt@kms_flip@plain-flip-ts-check@c-hdmi-a3.html
   [89]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_171551v1/shard-dg2-8/igt@kms_flip@plain-flip-ts-check@c-hdmi-a3.html

  * igt@kms_flip_scaled_crc@flip-32bpp-4tile-to-64bpp-4tile-downscaling:
    - shard-tglu-1:       NOTRUN -> [SKIP][90] ([i915#15643])
   [90]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_171551v1/shard-tglu-1/igt@kms_flip_scaled_crc@flip-32bpp-4tile-to-64bpp-4tile-downscaling.html

  * igt@kms_flip_scaled_crc@flip-32bpp-xtile-to-64bpp-xtile-downscaling:
    - shard-dg2:          [PASS][91] -> [SKIP][92] ([i915#3555] / [i915#8813])
   [91]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18943/shard-dg2-8/igt@kms_flip_scaled_crc@flip-32bpp-xtile-to-64bpp-xtile-downscaling.html
   [92]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_171551v1/shard-dg2-10/igt@kms_flip_scaled_crc@flip-32bpp-xtile-to-64bpp-xtile-downscaling.html

  * igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-16bpp-4tile-downscaling:
    - shard-rkl:          NOTRUN -> [SKIP][93] ([i915#15643])
   [93]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_171551v1/shard-rkl-2/igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-16bpp-4tile-downscaling.html

  * igt@kms_frontbuffer_tracking@fbc-1p-offscreen-pri-indfb-draw-render:
    - shard-dg2:          ([PASS][94], [PASS][95]) -> [SKIP][96] ([i915#16708])
   [94]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18943/shard-dg2-6/igt@kms_frontbuffer_tracking@fbc-1p-offscreen-pri-indfb-draw-render.html
   [95]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18943/shard-dg2-1/igt@kms_frontbuffer_tracking@fbc-1p-offscreen-pri-indfb-draw-render.html
   [96]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_171551v1/shard-dg2-10/igt@kms_frontbuffer_tracking@fbc-1p-offscreen-pri-indfb-draw-render.html

  * igt@kms_frontbuffer_tracking@fbc-1p-primscrn-cur-indfb-move:
    - shard-dg2:          ([PASS][97], [PASS][98]) -> [SKIP][99] ([i915#16708] / [i915#5354])
   [97]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18943/shard-dg2-6/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-cur-indfb-move.html
   [98]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18943/shard-dg2-1/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-cur-indfb-move.html
   [99]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_171551v1/shard-dg2-10/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-cur-indfb-move.html

  * igt@kms_frontbuffer_tracking@fbchdr-1p-primscrn-pri-indfb-draw-mmap-gtt:
    - shard-rkl:          NOTRUN -> [SKIP][100] ([i915#15989]) +2 other tests skip
   [100]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_171551v1/shard-rkl-2/igt@kms_frontbuffer_tracking@fbchdr-1p-primscrn-pri-indfb-draw-mmap-gtt.html

  * igt@kms_frontbuffer_tracking@fbchdr-tiling-linear:
    - shard-rkl:          [PASS][101] -> [SKIP][102] ([i915#15989]) +5 other tests skip
   [101]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18943/shard-rkl-1/igt@kms_frontbuffer_tracking@fbchdr-tiling-linear.html
   [102]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_171551v1/shard-rkl-4/igt@kms_frontbuffer_tracking@fbchdr-tiling-linear.html

  * igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-spr-indfb-onoff:
    - shard-rkl:          NOTRUN -> [SKIP][103] ([i915#15102] / [i915#3023]) +3 other tests skip
   [103]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_171551v1/shard-rkl-2/igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-spr-indfb-onoff.html

  * igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-pri-shrfb-draw-pwrite:
    - shard-tglu-1:       NOTRUN -> [SKIP][104] +27 other tests skip
   [104]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_171551v1/shard-tglu-1/igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-pri-shrfb-draw-pwrite.html

  * igt@kms_frontbuffer_tracking@fbcpsrhdr-1p-primscrn-cur-indfb-move:
    - shard-tglu-1:       NOTRUN -> [SKIP][105] ([i915#15102]) +12 other tests skip
   [105]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_171551v1/shard-tglu-1/igt@kms_frontbuffer_tracking@fbcpsrhdr-1p-primscrn-cur-indfb-move.html

  * igt@kms_frontbuffer_tracking@hdr-1p-offscreen-pri-indfb-draw-pwrite:
    - shard-rkl:          ([PASS][106], [PASS][107]) -> [SKIP][108] ([i915#15989]) +3 other tests skip
   [106]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18943/shard-rkl-1/igt@kms_frontbuffer_tracking@hdr-1p-offscreen-pri-indfb-draw-pwrite.html
   [107]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18943/shard-rkl-6/igt@kms_frontbuffer_tracking@hdr-1p-offscreen-pri-indfb-draw-pwrite.html
   [108]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_171551v1/shard-rkl-2/igt@kms_frontbuffer_tracking@hdr-1p-offscreen-pri-indfb-draw-pwrite.html
    - shard-tglu-1:       NOTRUN -> [SKIP][109] ([i915#15989]) +3 other tests skip
   [109]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_171551v1/shard-tglu-1/igt@kms_frontbuffer_tracking@hdr-1p-offscreen-pri-indfb-draw-pwrite.html

  * igt@kms_frontbuffer_tracking@hdr-2p-scndscrn-indfb-pgflip-blt:
    - shard-glk:          [PASS][110] -> [SKIP][111] +4 other tests skip
   [110]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18943/shard-glk8/igt@kms_frontbuffer_tracking@hdr-2p-scndscrn-indfb-pgflip-blt.html
   [111]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_171551v1/shard-glk4/igt@kms_frontbuffer_tracking@hdr-2p-scndscrn-indfb-pgflip-blt.html

  * igt@kms_frontbuffer_tracking@pipe-fbc-rte:
    - shard-rkl:          NOTRUN -> [SKIP][112] ([i915#9766])
   [112]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_171551v1/shard-rkl-2/igt@kms_frontbuffer_tracking@pipe-fbc-rte.html

  * igt@kms_frontbuffer_tracking@psrhdr-1p-offscreen-pri-indfb-draw-mmap-cpu:
    - shard-rkl:          NOTRUN -> [SKIP][113] ([i915#15102]) +5 other tests skip
   [113]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_171551v1/shard-rkl-2/igt@kms_frontbuffer_tracking@psrhdr-1p-offscreen-pri-indfb-draw-mmap-cpu.html

  * igt@kms_frontbuffer_tracking@psrhdr-2p-scndscrn-pri-shrfb-draw-blt:
    - shard-rkl:          NOTRUN -> [SKIP][114] +11 other tests skip
   [114]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_171551v1/shard-rkl-2/igt@kms_frontbuffer_tracking@psrhdr-2p-scndscrn-pri-shrfb-draw-blt.html

  * igt@kms_hdr@static-toggle-dpms:
    - shard-rkl:          ([PASS][115], [PASS][116]) -> [SKIP][117] ([i915#16644] / [i915#3555] / [i915#8228])
   [115]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18943/shard-rkl-1/igt@kms_hdr@static-toggle-dpms.html
   [116]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18943/shard-rkl-6/igt@kms_hdr@static-toggle-dpms.html
   [117]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_171551v1/shard-rkl-2/igt@kms_hdr@static-toggle-dpms.html
    - shard-tglu-1:       NOTRUN -> [SKIP][118] ([i915#3555] / [i915#8228])
   [118]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_171551v1/shard-tglu-1/igt@kms_hdr@static-toggle-dpms.html

  * igt@kms_hdr@static-toggle-suspend:
    - shard-rkl:          NOTRUN -> [SKIP][119] ([i915#16644] / [i915#3555] / [i915#8228])
   [119]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_171551v1/shard-rkl-2/igt@kms_hdr@static-toggle-suspend.html

  * igt@kms_invalid_mode@clock-too-high:
    - shard-dg2:          [PASS][120] -> [SKIP][121] ([i915#16746] / [i915#3555])
   [120]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18943/shard-dg2-8/igt@kms_invalid_mode@clock-too-high.html
   [121]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_171551v1/shard-dg2-10/igt@kms_invalid_mode@clock-too-high.html

  * igt@kms_pipe_crc_basic@nonblocking-crc-frame-sequence:
    - shard-dg2:          ([PASS][122], [PASS][123]) -> [SKIP][124] ([i915#11190] / [i915#16707])
   [122]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18943/shard-dg2-1/igt@kms_pipe_crc_basic@nonblocking-crc-frame-sequence.html
   [123]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18943/shard-dg2-6/igt@kms_pipe_crc_basic@nonblocking-crc-frame-sequence.html
   [124]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_171551v1/shard-dg2-10/igt@kms_pipe_crc_basic@nonblocking-crc-frame-sequence.html

  * igt@kms_plane@pixel-format-4-tiled-lnl-ccs-modifier-source-clamping:
    - shard-rkl:          NOTRUN -> [SKIP][125] ([i915#15709])
   [125]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_171551v1/shard-rkl-2/igt@kms_plane@pixel-format-4-tiled-lnl-ccs-modifier-source-clamping.html

  * igt@kms_plane@pixel-format-y-tiled-ccs-modifier:
    - shard-tglu-1:       NOTRUN -> [SKIP][126] ([i915#15709])
   [126]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_171551v1/shard-tglu-1/igt@kms_plane@pixel-format-y-tiled-ccs-modifier.html

  * igt@kms_plane@pixel-format-y-tiled-gen12-rc-ccs-modifier@pipe-a-plane-7:
    - shard-tglu-1:       NOTRUN -> [SKIP][127] ([i915#16386]) +1 other test skip
   [127]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_171551v1/shard-tglu-1/igt@kms_plane@pixel-format-y-tiled-gen12-rc-ccs-modifier@pipe-a-plane-7.html

  * igt@kms_plane_multiple@2x-tiling-x:
    - shard-rkl:          NOTRUN -> [SKIP][128] ([i915#13958])
   [128]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_171551v1/shard-rkl-2/igt@kms_plane_multiple@2x-tiling-x.html

  * igt@kms_plane_scaling@invalid-num-scalers:
    - shard-dg2:          [PASS][129] -> [SKIP][130] ([i915#3555] / [i915#6953] / [i915#9423])
   [129]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18943/shard-dg2-8/igt@kms_plane_scaling@invalid-num-scalers.html
   [130]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_171551v1/shard-dg2-10/igt@kms_plane_scaling@invalid-num-scalers.html

  * igt@kms_plane_scaling@plane-scaler-unity-scaling-with-pixel-format:
    - shard-dg2:          ([PASS][131], [PASS][132]) -> [SKIP][133] ([i915#15329] / [i915#9423])
   [131]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18943/shard-dg2-1/igt@kms_plane_scaling@plane-scaler-unity-scaling-with-pixel-format.html
   [132]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18943/shard-dg2-6/igt@kms_plane_scaling@plane-scaler-unity-scaling-with-pixel-format.html
   [133]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_171551v1/shard-dg2-10/igt@kms_plane_scaling@plane-scaler-unity-scaling-with-pixel-format.html

  * igt@kms_plane_scaling@plane-scaler-with-clipping-clamping-modifiers:
    - shard-dg2:          ([PASS][134], [PASS][135]) -> [SKIP][136] ([i915#15329] / [i915#3555] / [i915#9423])
   [134]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18943/shard-dg2-1/igt@kms_plane_scaling@plane-scaler-with-clipping-clamping-modifiers.html
   [135]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18943/shard-dg2-6/igt@kms_plane_scaling@plane-scaler-with-clipping-clamping-modifiers.html
   [136]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_171551v1/shard-dg2-10/igt@kms_plane_scaling@plane-scaler-with-clipping-clamping-modifiers.html

  * igt@kms_plane_scaling@plane-scaler-with-clipping-clamping-modifiers@pipe-b:
    - shard-dg2:          ([PASS][137], [PASS][138]) -> [SKIP][139] ([i915#15329]) +7 other tests skip
   [137]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18943/shard-dg2-1/igt@kms_plane_scaling@plane-scaler-with-clipping-clamping-modifiers@pipe-b.html
   [138]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18943/shard-dg2-6/igt@kms_plane_scaling@plane-scaler-with-clipping-clamping-modifiers@pipe-b.html
   [139]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_171551v1/shard-dg2-10/igt@kms_plane_scaling@plane-scaler-with-clipping-clamping-modifiers@pipe-b.html

  * igt@kms_plane_scaling@planes-unity-scaling-downscale-factor-0-5:
    - shard-dg2:          [PASS][140] -> [SKIP][141] ([i915#15329] / [i915#6953] / [i915#9423])
   [140]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18943/shard-dg2-8/igt@kms_plane_scaling@planes-unity-scaling-downscale-factor-0-5.html
   [141]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_171551v1/shard-dg2-10/igt@kms_plane_scaling@planes-unity-scaling-downscale-factor-0-5.html

  * igt@kms_plane_scaling@planes-unity-scaling-downscale-factor-0-5@pipe-b:
    - shard-dg2:          [PASS][142] -> [SKIP][143] ([i915#15329]) +3 other tests skip
   [142]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18943/shard-dg2-8/igt@kms_plane_scaling@planes-unity-scaling-downscale-factor-0-5@pipe-b.html
   [143]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_171551v1/shard-dg2-10/igt@kms_plane_scaling@planes-unity-scaling-downscale-factor-0-5@pipe-b.html

  * igt@kms_pm_rpm@dpms-mode-unset-non-lpsp:
    - shard-dg2:          [PASS][144] -> [SKIP][145] ([i915#15073]) +1 other test skip
   [144]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18943/shard-dg2-8/igt@kms_pm_rpm@dpms-mode-unset-non-lpsp.html
   [145]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_171551v1/shard-dg2-10/igt@kms_pm_rpm@dpms-mode-unset-non-lpsp.html

  * igt@kms_pm_rpm@modeset-non-lpsp-stress-no-wait:
    - shard-rkl:          ([PASS][146], [PASS][147]) -> [SKIP][148] ([i915#15073])
   [146]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18943/shard-rkl-3/igt@kms_pm_rpm@modeset-non-lpsp-stress-no-wait.html
   [147]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18943/shard-rkl-6/igt@kms_pm_rpm@modeset-non-lpsp-stress-no-wait.html
   [148]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_171551v1/shard-rkl-5/igt@kms_pm_rpm@modeset-non-lpsp-stress-no-wait.html

  * igt@kms_psr2_sf@fbc-psr2-overlay-plane-move-continuous-exceed-fully-sf:
    - shard-glk10:        NOTRUN -> [SKIP][149] ([i915#11520]) +4 other tests skip
   [149]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_171551v1/shard-glk10/igt@kms_psr2_sf@fbc-psr2-overlay-plane-move-continuous-exceed-fully-sf.html

  * igt@kms_psr2_sf@fbc-psr2-overlay-primary-update-sf-dmg-area:
    - shard-glk11:        NOTRUN -> [SKIP][150] ([i915#11520]) +1 other test skip
   [150]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_171551v1/shard-glk11/igt@kms_psr2_sf@fbc-psr2-overlay-primary-update-sf-dmg-area.html

  * igt@kms_psr2_sf@fbc-psr2-plane-move-sf-dmg-area:
    - shard-tglu-1:       NOTRUN -> [SKIP][151] ([i915#11520])
   [151]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_171551v1/shard-tglu-1/igt@kms_psr2_sf@fbc-psr2-plane-move-sf-dmg-area.html

  * igt@kms_psr2_sf@fbc-psr2-primary-plane-update-sf-dmg-area:
    - shard-glk:          NOTRUN -> [SKIP][152] ([i915#11520])
   [152]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_171551v1/shard-glk2/igt@kms_psr2_sf@fbc-psr2-primary-plane-update-sf-dmg-area.html

  * igt@kms_psr2_sf@psr2-cursor-plane-move-continuous-sf:
    - shard-rkl:          NOTRUN -> [SKIP][153] ([i915#11520]) +1 other test skip
   [153]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_171551v1/shard-rkl-2/igt@kms_psr2_sf@psr2-cursor-plane-move-continuous-sf.html

  * igt@kms_psr2_su@page_flip-p010:
    - shard-tglu-1:       NOTRUN -> [SKIP][154] ([i915#9683])
   [154]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_171551v1/shard-tglu-1/igt@kms_psr2_su@page_flip-p010.html

  * igt@kms_psr@fbc-psr-primary-page-flip:
    - shard-rkl:          NOTRUN -> [SKIP][155] ([i915#1072] / [i915#9732]) +2 other tests skip
   [155]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_171551v1/shard-rkl-2/igt@kms_psr@fbc-psr-primary-page-flip.html

  * igt@kms_psr@psr-no-drrs:
    - shard-tglu-1:       NOTRUN -> [SKIP][156] ([i915#9732]) +4 other tests skip
   [156]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_171551v1/shard-tglu-1/igt@kms_psr@psr-no-drrs.html

  * igt@kms_vblank@ts-continuation-suspend@pipe-a-hdmi-a-2:
    - shard-rkl:          [PASS][157] -> [INCOMPLETE][158] ([i915#12276]) +1 other test incomplete
   [157]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18943/shard-rkl-7/igt@kms_vblank@ts-continuation-suspend@pipe-a-hdmi-a-2.html
   [158]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_171551v1/shard-rkl-6/igt@kms_vblank@ts-continuation-suspend@pipe-a-hdmi-a-2.html

  * igt@kms_vrr@seamless-rr-switch-virtual:
    - shard-rkl:          NOTRUN -> [SKIP][159] ([i915#9906])
   [159]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_171551v1/shard-rkl-2/igt@kms_vrr@seamless-rr-switch-virtual.html

  * igt@prime_mmap_kms@buffer-sharing:
    - shard-dg2:          ([PASS][160], [PASS][161]) -> [SKIP][162]
   [160]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18943/shard-dg2-1/igt@prime_mmap_kms@buffer-sharing.html
   [161]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18943/shard-dg2-6/igt@prime_mmap_kms@buffer-sharing.html
   [162]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_171551v1/shard-dg2-10/igt@prime_mmap_kms@buffer-sharing.html

  
#### Possible fixes ####

  * igt@fbdev@unaligned-read:
    - shard-dg2:          ([SKIP][163], [PASS][164]) ([i915#2582]) -> [PASS][165] +2 other tests pass
   [163]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18943/shard-dg2-10/igt@fbdev@unaligned-read.html
   [164]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18943/shard-dg2-3/igt@fbdev@unaligned-read.html
   [165]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_171551v1/shard-dg2-7/igt@fbdev@unaligned-read.html

  * igt@gem_ccs@suspend-resume@linear-compressed-compfmt0-smem-lmem0:
    - shard-dg2:          ([PASS][166], [INCOMPLETE][167]) ([i915#13356] / [i915#16348]) -> [PASS][168]
   [166]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18943/shard-dg2-4/igt@gem_ccs@suspend-resume@linear-compressed-compfmt0-smem-lmem0.html
   [167]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18943/shard-dg2-6/igt@gem_ccs@suspend-resume@linear-compressed-compfmt0-smem-lmem0.html
   [168]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_171551v1/shard-dg2-6/igt@gem_ccs@suspend-resume@linear-compressed-compfmt0-smem-lmem0.html

  * igt@gem_ccs@suspend-resume@xmajor-compressed-compfmt0-smem-lmem0:
    - shard-dg2:          [INCOMPLETE][169] ([i915#13356] / [i915#16348]) -> [PASS][170]
   [169]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18943/shard-dg2-4/igt@gem_ccs@suspend-resume@xmajor-compressed-compfmt0-smem-lmem0.html
   [170]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_171551v1/shard-dg2-6/igt@gem_ccs@suspend-resume@xmajor-compressed-compfmt0-smem-lmem0.html

  * igt@gem_eio@hibernate:
    - shard-dg1:          ([PASS][171], [DMESG-WARN][172]) ([i915#4391] / [i915#4423]) -> [PASS][173]
   [171]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18943/shard-dg1-19/igt@gem_eio@hibernate.html
   [172]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18943/shard-dg1-13/igt@gem_eio@hibernate.html
   [173]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_171551v1/shard-dg1-12/igt@gem_eio@hibernate.html

  * igt@i915_suspend@fence-restore-untiled:
    - shard-rkl:          ([INCOMPLETE][174], [INCOMPLETE][175]) ([i915#4817]) -> [PASS][176]
   [174]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18943/shard-rkl-3/igt@i915_suspend@fence-restore-untiled.html
   [175]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18943/shard-rkl-6/igt@i915_suspend@fence-restore-untiled.html
   [176]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_171551v1/shard-rkl-2/igt@i915_suspend@fence-restore-untiled.html

  * igt@i915_suspend@sysfs-reader:
    - shard-rkl:          ([PASS][177], [INCOMPLETE][178]) ([i915#4817]) -> [PASS][179]
   [177]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18943/shard-rkl-3/igt@i915_suspend@sysfs-reader.html
   [178]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18943/shard-rkl-6/igt@i915_suspend@sysfs-reader.html
   [179]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_171551v1/shard-rkl-3/igt@i915_suspend@sysfs-reader.html

  * igt@kms_async_flips@alternate-sync-async-flip-atomic@pipe-a-hdmi-a-1:
    - shard-glk:          ([FAIL][180], [PASS][181]) ([i915#14888]) -> [PASS][182]
   [180]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18943/shard-glk8/igt@kms_async_flips@alternate-sync-async-flip-atomic@pipe-a-hdmi-a-1.html
   [181]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18943/shard-glk6/igt@kms_async_flips@alternate-sync-async-flip-atomic@pipe-a-hdmi-a-1.html
   [182]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_171551v1/shard-glk2/igt@kms_async_flips@alternate-sync-async-flip-atomic@pipe-a-hdmi-a-1.html

  * igt@kms_atomic_transition@plane-all-modeset-transition-fencing:
    - shard-tglu:         ([FAIL][183], [PASS][184]) ([i915#15662]) -> [PASS][185] +1 other test pass
   [183]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18943/shard-tglu-8/igt@kms_atomic_transition@plane-all-modeset-transition-fencing.html
   [184]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18943/shard-tglu-3/igt@kms_atomic_transition@plane-all-modeset-transition-fencing.html
   [185]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_171551v1/shard-tglu-5/igt@kms_atomic_transition@plane-all-modeset-transition-fencing.html

  * igt@kms_big_fb@x-tiled-max-hw-stride-64bpp-rotate-0-hflip-async-flip:
    - shard-mtlp:         ([DMESG-WARN][186], [PASS][187]) ([i915#12935]) -> [PASS][188]
   [186]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18943/shard-mtlp-8/igt@kms_big_fb@x-tiled-max-hw-stride-64bpp-rotate-0-hflip-async-flip.html
   [187]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18943/shard-mtlp-7/igt@kms_big_fb@x-tiled-max-hw-stride-64bpp-rotate-0-hflip-async-flip.html
   [188]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_171551v1/shard-mtlp-7/igt@kms_big_fb@x-tiled-max-hw-stride-64bpp-rotate-0-hflip-async-flip.html

  * igt@kms_ccs@crc-primary-suspend-y-tiled-gen12-rc-ccs:
    - shard-rkl:          ([INCOMPLETE][189], [INCOMPLETE][190]) ([i915#14694] / [i915#15582]) -> [PASS][191]
   [189]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18943/shard-rkl-6/igt@kms_ccs@crc-primary-suspend-y-tiled-gen12-rc-ccs.html
   [190]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18943/shard-rkl-3/igt@kms_ccs@crc-primary-suspend-y-tiled-gen12-rc-ccs.html
   [191]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_171551v1/shard-rkl-5/igt@kms_ccs@crc-primary-suspend-y-tiled-gen12-rc-ccs.html

  * igt@kms_color@ctm-max:
    - shard-dg2:          ([SKIP][192], [PASS][193]) ([i915#12655]) -> [PASS][194] +1 other test pass
   [192]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18943/shard-dg2-10/igt@kms_color@ctm-max.html
   [193]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18943/shard-dg2-1/igt@kms_color@ctm-max.html
   [194]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_171551v1/shard-dg2-3/igt@kms_color@ctm-max.html

  * igt@kms_color_pipeline@plane-lut1d-ctm3x4:
    - shard-dg2:          ([SKIP][195], [PASS][196]) ([i915#15529]) -> [PASS][197]
   [195]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18943/shard-dg2-10/igt@kms_color_pipeline@plane-lut1d-ctm3x4.html
   [196]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18943/shard-dg2-1/igt@kms_color_pipeline@plane-lut1d-ctm3x4.html
   [197]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_171551v1/shard-dg2-3/igt@kms_color_pipeline@plane-lut1d-ctm3x4.html

  * igt@kms_cursor_crc@cursor-random-256x85@pipe-a-hdmi-a-1:
    - shard-tglu-1:       [FAIL][198] ([i915#13566]) -> [PASS][199] +1 other test pass
   [198]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18943/shard-tglu-1/igt@kms_cursor_crc@cursor-random-256x85@pipe-a-hdmi-a-1.html
   [199]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_171551v1/shard-tglu-1/igt@kms_cursor_crc@cursor-random-256x85@pipe-a-hdmi-a-1.html

  * igt@kms_cursor_crc@cursor-sliding-256x85:
    - shard-rkl:          ([PASS][200], [FAIL][201]) ([i915#13566]) -> [PASS][202] +1 other test pass
   [200]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18943/shard-rkl-3/igt@kms_cursor_crc@cursor-sliding-256x85.html
   [201]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18943/shard-rkl-1/igt@kms_cursor_crc@cursor-sliding-256x85.html
   [202]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_171551v1/shard-rkl-3/igt@kms_cursor_crc@cursor-sliding-256x85.html

  * igt@kms_fb_coherency@memset-crc:
    - shard-dg2:          ([PASS][203], [SKIP][204]) -> [PASS][205]
   [203]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18943/shard-dg2-1/igt@kms_fb_coherency@memset-crc.html
   [204]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18943/shard-dg2-10/igt@kms_fb_coherency@memset-crc.html
   [205]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_171551v1/shard-dg2-3/igt@kms_fb_coherency@memset-crc.html

  * igt@kms_feature_discovery@hdr:
    - shard-rkl:          ([SKIP][206], [SKIP][207]) ([i915#16600]) -> [PASS][208]
   [206]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18943/shard-rkl-5/igt@kms_feature_discovery@hdr.html
   [207]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18943/shard-rkl-7/igt@kms_feature_discovery@hdr.html
   [208]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_171551v1/shard-rkl-1/igt@kms_feature_discovery@hdr.html

  * igt@kms_flip@basic-flip-vs-dpms:
    - shard-dg2:          ([SKIP][209], [PASS][210]) ([i915#5354]) -> [PASS][211] +5 other tests pass
   [209]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18943/shard-dg2-10/igt@kms_flip@basic-flip-vs-dpms.html
   [210]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18943/shard-dg2-3/igt@kms_flip@basic-flip-vs-dpms.html
   [211]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_171551v1/shard-dg2-7/igt@kms_flip@basic-flip-vs-dpms.html

  * igt@kms_flip@flip-vs-expired-vblank-interruptible:
    - shard-dg1:          ([PASS][212], [FAIL][213]) ([i915#13027]) -> [PASS][214]
   [212]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18943/shard-dg1-18/igt@kms_flip@flip-vs-expired-vblank-interruptible.html
   [213]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18943/shard-dg1-15/igt@kms_flip@flip-vs-expired-vblank-interruptible.html
   [214]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_171551v1/shard-dg1-14/igt@kms_flip@flip-vs-expired-vblank-interruptible.html
    - shard-tglu:         ([FAIL][215], [FAIL][216]) ([i915#13027]) -> [PASS][217]
   [215]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18943/shard-tglu-10/igt@kms_flip@flip-vs-expired-vblank-interruptible.html
   [216]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18943/shard-tglu-4/igt@kms_flip@flip-vs-expired-vblank-interruptible.html
   [217]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_171551v1/shard-tglu-10/igt@kms_flip@flip-vs-expired-vblank-interruptible.html

  * igt@kms_flip@flip-vs-expired-vblank-interruptible@c-hdmi-a1:
    - shard-dg1:          [FAIL][218] ([i915#13027]) -> [PASS][219]
   [218]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18943/shard-dg1-15/igt@kms_flip@flip-vs-expired-vblank-interruptible@c-hdmi-a1.html
   [219]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_171551v1/shard-dg1-14/igt@kms_flip@flip-vs-expired-vblank-interruptible@c-hdmi-a1.html
    - shard-tglu:         ([FAIL][220], [PASS][221]) ([i915#13027]) -> [PASS][222] +1 other test pass
   [220]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18943/shard-tglu-10/igt@kms_flip@flip-vs-expired-vblank-interruptible@c-hdmi-a1.html
   [221]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18943/shard-tglu-4/igt@kms_flip@flip-vs-expired-vblank-interruptible@c-hdmi-a1.html
   [222]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_171551v1/shard-tglu-10/igt@kms_flip@flip-vs-expired-vblank-interruptible@c-hdmi-a1.html

  * igt@kms_flip_event_leak@basic:
    - shard-dg1:          ([DMESG-WARN][223], [PASS][224]) ([i915#4423]) -> [PASS][225] +1 other test pass
   [223]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18943/shard-dg1-18/igt@kms_flip_event_leak@basic.html
   [224]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18943/shard-dg1-17/igt@kms_flip_event_leak@basic.html
   [225]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_171551v1/shard-dg1-17/igt@kms_flip_event_leak@basic.html

  * igt@kms_flip_scaled_crc@flip-32bpp-linear-to-64bpp-linear-downscaling:
    - shard-dg2:          ([PASS][226], [SKIP][227]) ([i915#3555] / [i915#8813]) -> [PASS][228] +4 other tests pass
   [226]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18943/shard-dg2-7/igt@kms_flip_scaled_crc@flip-32bpp-linear-to-64bpp-linear-downscaling.html
   [227]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18943/shard-dg2-10/igt@kms_flip_scaled_crc@flip-32bpp-linear-to-64bpp-linear-downscaling.html
   [228]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_171551v1/shard-dg2-7/igt@kms_flip_scaled_crc@flip-32bpp-linear-to-64bpp-linear-downscaling.html

  * igt@kms_flip_tiling@flip-change-tiling:
    - shard-dg2:          ([PASS][229], [SKIP][230]) ([i915#3555]) -> [PASS][231]
   [229]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18943/shard-dg2-3/igt@kms_flip_tiling@flip-change-tiling.html
   [230]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18943/shard-dg2-10/igt@kms_flip_tiling@flip-change-tiling.html
   [231]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_171551v1/shard-dg2-7/igt@kms_flip_tiling@flip-change-tiling.html

  * igt@kms_force_connector_basic@prune-stale-modes:
    - shard-mtlp:         ([PASS][232], [SKIP][233]) ([i915#15672]) -> [PASS][234]
   [232]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18943/shard-mtlp-5/igt@kms_force_connector_basic@prune-stale-modes.html
   [233]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18943/shard-mtlp-1/igt@kms_force_connector_basic@prune-stale-modes.html
   [234]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_171551v1/shard-mtlp-7/igt@kms_force_connector_basic@prune-stale-modes.html

  * igt@kms_frontbuffer_tracking@fbc-1p-offscreen-pri-shrfb-draw-render:
    - shard-dg2:          ([SKIP][235], [PASS][236]) ([i915#16708]) -> [PASS][237] +1 other test pass
   [235]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18943/shard-dg2-10/igt@kms_frontbuffer_tracking@fbc-1p-offscreen-pri-shrfb-draw-render.html
   [236]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18943/shard-dg2-3/igt@kms_frontbuffer_tracking@fbc-1p-offscreen-pri-shrfb-draw-render.html
   [237]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_171551v1/shard-dg2-7/igt@kms_frontbuffer_tracking@fbc-1p-offscreen-pri-shrfb-draw-render.html

  * igt@kms_frontbuffer_tracking@fbc-1p-primscrn-cur-indfb-draw-pwrite:
    - shard-dg2:          ([PASS][238], [SKIP][239]) ([i915#16708] / [i915#5354]) -> [PASS][240] +4 other tests pass
   [238]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18943/shard-dg2-3/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-cur-indfb-draw-pwrite.html
   [239]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18943/shard-dg2-10/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-cur-indfb-draw-pwrite.html
   [240]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_171551v1/shard-dg2-7/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-cur-indfb-draw-pwrite.html

  * igt@kms_frontbuffer_tracking@fbchdr-rgb101010-draw-mmap-wc:
    - shard-glk:          ([PASS][241], [SKIP][242]) -> [PASS][243] +4 other tests pass
   [241]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18943/shard-glk8/igt@kms_frontbuffer_tracking@fbchdr-rgb101010-draw-mmap-wc.html
   [242]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18943/shard-glk2/igt@kms_frontbuffer_tracking@fbchdr-rgb101010-draw-mmap-wc.html
   [243]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_171551v1/shard-glk8/igt@kms_frontbuffer_tracking@fbchdr-rgb101010-draw-mmap-wc.html

  * igt@kms_frontbuffer_tracking@hdr-1p-primscrn-cur-indfb-draw-blt:
    - shard-rkl:          ([PASS][244], [SKIP][245]) ([i915#15989]) -> [PASS][246] +2 other tests pass
   [244]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18943/shard-rkl-6/igt@kms_frontbuffer_tracking@hdr-1p-primscrn-cur-indfb-draw-blt.html
   [245]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18943/shard-rkl-3/igt@kms_frontbuffer_tracking@hdr-1p-primscrn-cur-indfb-draw-blt.html
   [246]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_171551v1/shard-rkl-6/igt@kms_frontbuffer_tracking@hdr-1p-primscrn-cur-indfb-draw-blt.html

  * igt@kms_frontbuffer_tracking@hdr-1p-primscrn-indfb-plflip-blt:
    - shard-glk:          [SKIP][247] -> [PASS][248] +1 other test pass
   [247]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18943/shard-glk3/igt@kms_frontbuffer_tracking@hdr-1p-primscrn-indfb-plflip-blt.html
   [248]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_171551v1/shard-glk8/igt@kms_frontbuffer_tracking@hdr-1p-primscrn-indfb-plflip-blt.html
    - shard-rkl:          [SKIP][249] ([i915#15989]) -> [PASS][250]
   [249]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18943/shard-rkl-7/igt@kms_frontbuffer_tracking@hdr-1p-primscrn-indfb-plflip-blt.html
   [250]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_171551v1/shard-rkl-6/igt@kms_frontbuffer_tracking@hdr-1p-primscrn-indfb-plflip-blt.html

  * igt@kms_frontbuffer_tracking@hdr-shrfb-scaledprimary:
    - shard-rkl:          ([SKIP][251], [SKIP][252]) ([i915#15989]) -> [PASS][253] +5 other tests pass
   [251]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18943/shard-rkl-7/igt@kms_frontbuffer_tracking@hdr-shrfb-scaledprimary.html
   [252]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18943/shard-rkl-5/igt@kms_frontbuffer_tracking@hdr-shrfb-scaledprimary.html
   [253]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_171551v1/shard-rkl-1/igt@kms_frontbuffer_tracking@hdr-shrfb-scaledprimary.html

  * igt@kms_invalid_mode@int-max-clock:
    - shard-dg2:          ([PASS][254], [SKIP][255]) ([i915#16746] / [i915#3555]) -> [PASS][256] +3 other tests pass
   [254]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18943/shard-dg2-7/igt@kms_invalid_mode@int-max-clock.html
   [255]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18943/shard-dg2-10/igt@kms_invalid_mode@int-max-clock.html
   [256]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_171551v1/shard-dg2-7/igt@kms_invalid_mode@int-max-clock.html

  * igt@kms_pipe_crc_basic@compare-crc-sanitycheck-xr24:
    - shard-dg2:          ([PASS][257], [SKIP][258]) ([i915#11190] / [i915#16707]) -> [PASS][259] +1 other test pass
   [257]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18943/shard-dg2-3/igt@kms_pipe_crc_basic@compare-crc-sanitycheck-xr24.html
   [258]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18943/shard-dg2-10/igt@kms_pipe_crc_basic@compare-crc-sanitycheck-xr24.html
   [259]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_171551v1/shard-dg2-7/igt@kms_pipe_crc_basic@compare-crc-sanitycheck-xr24.html

  * igt@kms_pipe_stress@stress-xrgb8888-ytiled:
    - shard-glk:          ([PASS][260], [DMESG-FAIL][261]) ([i915#118]) -> [PASS][262]
   [260]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18943/shard-glk5/igt@kms_pipe_stress@stress-xrgb8888-ytiled.html
   [261]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18943/shard-glk2/igt@kms_pipe_stress@stress-xrgb8888-ytiled.html
   [262]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_171551v1/shard-glk5/igt@kms_pipe_stress@stress-xrgb8888-ytiled.html

  * igt@kms_plane@pixel-format-linear-modifier:
    - shard-dg2:          ([PASS][263], [SKIP][264]) ([i915#8825]) -> [PASS][265] +3 other tests pass
   [263]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18943/shard-dg2-1/igt@kms_plane@pixel-format-linear-modifier.html
   [264]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18943/shard-dg2-10/igt@kms_plane@pixel-format-linear-modifier.html
   [265]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_171551v1/shard-dg2-3/igt@kms_plane@pixel-format-linear-modifier.html

  * igt@kms_plane_scaling@plane-downscale-factor-0-75-with-pixel-format:
    - shard-dg2:          ([SKIP][266], [PASS][267]) ([i915#15329] / [i915#9423]) -> [PASS][268] +2 other tests pass
   [266]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18943/shard-dg2-10/igt@kms_plane_scaling@plane-downscale-factor-0-75-with-pixel-format.html
   [267]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18943/shard-dg2-1/igt@kms_plane_scaling@plane-downscale-factor-0-75-with-pixel-format.html
   [268]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_171551v1/shard-dg2-3/igt@kms_plane_scaling@plane-downscale-factor-0-75-with-pixel-format.html

  * igt@kms_plane_scaling@plane-downscale-factor-0-75-with-pixel-format@pipe-c:
    - shard-dg2:          ([PASS][269], [SKIP][270]) ([i915#15329]) -> [PASS][271] +23 other tests pass
   [269]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18943/shard-dg2-1/igt@kms_plane_scaling@plane-downscale-factor-0-75-with-pixel-format@pipe-c.html
   [270]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18943/shard-dg2-10/igt@kms_plane_scaling@plane-downscale-factor-0-75-with-pixel-format@pipe-c.html
   [271]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_171551v1/shard-dg2-3/igt@kms_plane_scaling@plane-downscale-factor-0-75-with-pixel-format@pipe-c.html

  * igt@kms_plane_scaling@plane-scaler-with-clipping-clamping-pixel-formats:
    - shard-dg2:          ([SKIP][272], [PASS][273]) ([i915#15329] / [i915#3555] / [i915#9423]) -> [PASS][274]
   [272]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18943/shard-dg2-10/igt@kms_plane_scaling@plane-scaler-with-clipping-clamping-pixel-formats.html
   [273]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18943/shard-dg2-1/igt@kms_plane_scaling@plane-scaler-with-clipping-clamping-pixel-formats.html
   [274]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_171551v1/shard-dg2-3/igt@kms_plane_scaling@plane-scaler-with-clipping-clamping-pixel-formats.html

  * igt@kms_plane_scaling@planes-unity-scaling-downscale-factor-0-75:
    - shard-dg2:          ([SKIP][275], [PASS][276]) ([i915#15329] / [i915#3555] / [i915#6953] / [i915#9423]) -> [PASS][277]
   [275]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18943/shard-dg2-10/igt@kms_plane_scaling@planes-unity-scaling-downscale-factor-0-75.html
   [276]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18943/shard-dg2-7/igt@kms_plane_scaling@planes-unity-scaling-downscale-factor-0-75.html
   [277]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_171551v1/shard-dg2-7/igt@kms_plane_scaling@planes-unity-scaling-downscale-factor-0-75.html

  * igt@kms_plane_scaling@planes-upscale-20x20-downscale-factor-0-75:
    - shard-dg2:          ([PASS][278], [SKIP][279]) ([i915#15329] / [i915#6953] / [i915#9423]) -> [PASS][280]
   [278]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18943/shard-dg2-3/igt@kms_plane_scaling@planes-upscale-20x20-downscale-factor-0-75.html
   [279]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18943/shard-dg2-10/igt@kms_plane_scaling@planes-upscale-20x20-downscale-factor-0-75.html
   [280]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_171551v1/shard-dg2-7/igt@kms_plane_scaling@planes-upscale-20x20-downscale-factor-0-75.html

  * igt@kms_pm_lpsp@kms-lpsp:
    - shard-dg2:          ([SKIP][281], [SKIP][282]) ([i915#9340]) -> [PASS][283]
   [281]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18943/shard-dg2-10/igt@kms_pm_lpsp@kms-lpsp.html
   [282]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18943/shard-dg2-6/igt@kms_pm_lpsp@kms-lpsp.html
   [283]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_171551v1/shard-dg2-4/igt@kms_pm_lpsp@kms-lpsp.html

  * igt@kms_pm_rpm@dpms-mode-unset-non-lpsp:
    - shard-dg1:          ([SKIP][284], [PASS][285]) ([i915#15073]) -> [PASS][286] +2 other tests pass
   [284]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18943/shard-dg1-14/igt@kms_pm_rpm@dpms-mode-unset-non-lpsp.html
   [285]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18943/shard-dg1-13/igt@kms_pm_rpm@dpms-mode-unset-non-lpsp.html
   [286]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_171551v1/shard-dg1-13/igt@kms_pm_rpm@dpms-mode-unset-non-lpsp.html

  * igt@kms_pm_rpm@modeset-lpsp-stress:
    - shard-rkl:          ([PASS][287], [SKIP][288]) ([i915#15073]) -> [PASS][289] +1 other test pass
   [287]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18943/shard-rkl-2/igt@kms_pm_rpm@modeset-lpsp-stress.html
   [288]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18943/shard-rkl-4/igt@kms_pm_rpm@modeset-lpsp-stress.html
   [289]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_171551v1/shard-rkl-8/igt@kms_pm_rpm@modeset-lpsp-stress.html

  * igt@kms_pm_rpm@modeset-non-lpsp-stress:
    - shard-rkl:          [SKIP][290] ([i915#15073]) -> [PASS][291]
   [290]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18943/shard-rkl-5/igt@kms_pm_rpm@modeset-non-lpsp-stress.html
   [291]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_171551v1/shard-rkl-7/igt@kms_pm_rpm@modeset-non-lpsp-stress.html

  * igt@kms_pm_rpm@modeset-non-lpsp-stress-no-wait:
    - shard-dg2:          ([SKIP][292], [PASS][293]) ([i915#15073]) -> [PASS][294] +1 other test pass
   [292]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18943/shard-dg2-10/igt@kms_pm_rpm@modeset-non-lpsp-stress-no-wait.html
   [293]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18943/shard-dg2-1/igt@kms_pm_rpm@modeset-non-lpsp-stress-no-wait.html
   [294]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_171551v1/shard-dg2-3/igt@kms_pm_rpm@modeset-non-lpsp-stress-no-wait.html

  * igt@kms_vblank@ts-continuation-modeset:
    - shard-dg2:          ([SKIP][295], [PASS][296]) ([i915#16707]) -> [PASS][297] +58 other tests pass
   [295]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18943/shard-dg2-10/igt@kms_vblank@ts-continuation-modeset.html
   [296]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18943/shard-dg2-6/igt@kms_vblank@ts-continuation-modeset.html
   [297]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_171551v1/shard-dg2-4/igt@kms_vblank@ts-continuation-modeset.html

  
#### Warnings ####

  * igt@fbdev@info:
    - shard-dg2:          ([PASS][298], [SKIP][299]) ([i915#1849] / [i915#2582]) -> [SKIP][300] ([i915#1849] / [i915#2582])
   [298]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18943/shard-dg2-8/igt@fbdev@info.html
   [299]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18943/shard-dg2-10/igt@fbdev@info.html
   [300]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_171551v1/shard-dg2-10/igt@fbdev@info.html

  * igt@gem_ccs@large-ctrl-surf-copy:
    - shard-rkl:          ([SKIP][301], [SKIP][302]) ([i915#13008] / [i915#14544]) -> [SKIP][303] ([i915#13008])
   [301]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18943/shard-rkl-6/igt@gem_ccs@large-ctrl-surf-copy.html
   [302]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18943/shard-rkl-1/igt@gem_ccs@large-ctrl-surf-copy.html
   [303]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_171551v1/shard-rkl-2/igt@gem_ccs@large-ctrl-surf-copy.html

  * igt@gem_ctx_isolation@preservation-s3:
    - shard-rkl:          ([PASS][304], [INCOMPLETE][305]) ([i915#13356]) -> [INCOMPLETE][306] ([i915#13356]) +1 other test incomplete
   [304]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18943/shard-rkl-2/igt@gem_ctx_isolation@preservation-s3.html
   [305]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18943/shard-rkl-6/igt@gem_ctx_isolation@preservation-s3.html
   [306]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_171551v1/shard-rkl-3/igt@gem_ctx_isolation@preservation-s3.html

  * igt@gem_ctx_sseu@invalid-sseu:
    - shard-rkl:          ([SKIP][307], [SKIP][308]) ([i915#14544] / [i915#280]) -> [SKIP][309] ([i915#280])
   [307]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18943/shard-rkl-6/igt@gem_ctx_sseu@invalid-sseu.html
   [308]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18943/shard-rkl-3/igt@gem_ctx_sseu@invalid-sseu.html
   [309]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_171551v1/shard-rkl-5/igt@gem_ctx_sseu@invalid-sseu.html

  * igt@gem_exec_balancer@parallel-contexts:
    - shard-rkl:          ([SKIP][310], [SKIP][311]) ([i915#14544] / [i915#4525]) -> [SKIP][312] ([i915#4525])
   [310]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18943/shard-rkl-3/igt@gem_exec_balancer@parallel-contexts.html
   [311]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18943/shard-rkl-6/igt@gem_exec_balancer@parallel-contexts.html
   [312]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_171551v1/shard-rkl-5/igt@gem_exec_balancer@parallel-contexts.html

  * igt@gem_exec_capture@capture-recoverable:
    - shard-rkl:          ([SKIP][313], [SKIP][314]) ([i915#6344]) -> [SKIP][315] ([i915#14544] / [i915#6344])
   [313]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18943/shard-rkl-2/igt@gem_exec_capture@capture-recoverable.html
   [314]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18943/shard-rkl-5/igt@gem_exec_capture@capture-recoverable.html
   [315]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_171551v1/shard-rkl-6/igt@gem_exec_capture@capture-recoverable.html

  * igt@gem_exec_reloc@basic-gtt-cpu:
    - shard-rkl:          ([SKIP][316], [SKIP][317]) ([i915#14544] / [i915#3281]) -> [SKIP][318] ([i915#3281]) +8 other tests skip
   [316]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18943/shard-rkl-3/igt@gem_exec_reloc@basic-gtt-cpu.html
   [317]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18943/shard-rkl-6/igt@gem_exec_reloc@basic-gtt-cpu.html
   [318]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_171551v1/shard-rkl-5/igt@gem_exec_reloc@basic-gtt-cpu.html

  * igt@gem_lmem_swapping@parallel-random-verify:
    - shard-rkl:          ([SKIP][319], [SKIP][320]) ([i915#14544] / [i915#4613]) -> [SKIP][321] ([i915#4613]) +2 other tests skip
   [319]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18943/shard-rkl-3/igt@gem_lmem_swapping@parallel-random-verify.html
   [320]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18943/shard-rkl-6/igt@gem_lmem_swapping@parallel-random-verify.html
   [321]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_171551v1/shard-rkl-5/igt@gem_lmem_swapping@parallel-random-verify.html

  * igt@gem_media_vme:
    - shard-rkl:          ([SKIP][322], [SKIP][323]) ([i915#14544] / [i915#284]) -> [SKIP][324] ([i915#284])
   [322]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18943/shard-rkl-6/igt@gem_media_vme.html
   [323]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18943/shard-rkl-1/igt@gem_media_vme.html
   [324]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_171551v1/shard-rkl-2/igt@gem_media_vme.html

  * igt@gem_pread@snoop:
    - shard-rkl:          ([SKIP][325], [SKIP][326]) ([i915#3282]) -> [SKIP][327] ([i915#14544] / [i915#3282])
   [325]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18943/shard-rkl-2/igt@gem_pread@snoop.html
   [326]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18943/shard-rkl-5/igt@gem_pread@snoop.html
   [327]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_171551v1/shard-rkl-6/igt@gem_pread@snoop.html

  * igt@gem_pread@uncached:
    - shard-rkl:          ([SKIP][328], [SKIP][329]) ([i915#14544] / [i915#3282]) -> [SKIP][330] ([i915#3282]) +1 other test skip
   [328]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18943/shard-rkl-6/igt@gem_pread@uncached.html
   [329]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18943/shard-rkl-1/igt@gem_pread@uncached.html
   [330]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_171551v1/shard-rkl-2/igt@gem_pread@uncached.html

  * igt@gen7_exec_parse@basic-allocation:
    - shard-rkl:          [SKIP][331] -> [SKIP][332] ([i915#14544]) +1 other test skip
   [331]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18943/shard-rkl-7/igt@gen7_exec_parse@basic-allocation.html
   [332]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_171551v1/shard-rkl-6/igt@gen7_exec_parse@basic-allocation.html

  * igt@gen9_exec_parse@bb-start-cmd:
    - shard-rkl:          ([SKIP][333], [SKIP][334]) ([i915#14544] / [i915#2527]) -> [SKIP][335] ([i915#2527])
   [333]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18943/shard-rkl-6/igt@gen9_exec_parse@bb-start-cmd.html
   [334]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18943/shard-rkl-3/igt@gen9_exec_parse@bb-start-cmd.html
   [335]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_171551v1/shard-rkl-2/igt@gen9_exec_parse@bb-start-cmd.html

  * igt@i915_pm_rc6_residency@media-rc6-accuracy:
    - shard-rkl:          ([SKIP][336], [SKIP][337]) ([i915#14544] / [i915#16080] / [i915#16166]) -> [SKIP][338] ([i915#16080] / [i915#16166])
   [336]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18943/shard-rkl-6/igt@i915_pm_rc6_residency@media-rc6-accuracy.html
   [337]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18943/shard-rkl-1/igt@i915_pm_rc6_residency@media-rc6-accuracy.html
   [338]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_171551v1/shard-rkl-2/igt@i915_pm_rc6_residency@media-rc6-accuracy.html

  * igt@i915_suspend@fence-restore-tiled2untiled:
    - shard-rkl:          ([PASS][339], [INCOMPLETE][340]) ([i915#4817]) -> [INCOMPLETE][341] ([i915#4817])
   [339]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18943/shard-rkl-8/igt@i915_suspend@fence-restore-tiled2untiled.html
   [340]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18943/shard-rkl-6/igt@i915_suspend@fence-restore-tiled2untiled.html
   [341]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_171551v1/shard-rkl-6/igt@i915_suspend@fence-restore-tiled2untiled.html

  * igt@i915_suspend@fence-restore-untiled:
    - shard-glk:          ([PASS][342], [INCOMPLETE][343]) ([i915#16182] / [i915#4817]) -> [INCOMPLETE][344] ([i915#16182] / [i915#4817])
   [342]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18943/shard-glk6/igt@i915_suspend@fence-restore-untiled.html
   [343]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18943/shard-glk5/igt@i915_suspend@fence-restore-untiled.html
   [344]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_171551v1/shard-glk4/igt@i915_suspend@fence-restore-untiled.html

  * igt@intel_hwmon@hwmon-write:
    - shard-rkl:          ([SKIP][345], [SKIP][346]) ([i915#14544] / [i915#7707]) -> [SKIP][347] ([i915#7707])
   [345]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18943/shard-rkl-3/igt@intel_hwmon@hwmon-write.html
   [346]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18943/shard-rkl-6/igt@intel_hwmon@hwmon-write.html
   [347]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_171551v1/shard-rkl-5/igt@intel_hwmon@hwmon-write.html

  * igt@kms_async_flips@alternate-sync-async-flip-atomic:
    - shard-dg2:          ([FAIL][348], [SKIP][349]) ([i915#14888] / [i915#16707]) -> [SKIP][350] ([i915#16707])
   [348]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18943/shard-dg2-4/igt@kms_async_flips@alternate-sync-async-flip-atomic.html
   [349]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18943/shard-dg2-10/igt@kms_async_flips@alternate-sync-async-flip-atomic.html
   [350]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_171551v1/shard-dg2-10/igt@kms_async_flips@alternate-sync-async-flip-atomic.html
    - shard-glk:          ([FAIL][351], [PASS][352]) ([i915#14888]) -> [FAIL][353] ([i915#14888])
   [351]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18943/shard-glk8/igt@kms_async_flips@alternate-sync-async-flip-atomic.html
   [352]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18943/shard-glk6/igt@kms_async_flips@alternate-sync-async-flip-atomic.html
   [353]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_171551v1/shard-glk2/igt@kms_async_flips@alternate-sync-async-flip-atomic.html

  * igt@kms_atomic@plane-primary-overlay-mutable-zpos:
    - shard-dg2:          ([SKIP][354], [SKIP][355]) ([i915#16707] / [i915#9531]) -> [SKIP][356] ([i915#9531])
   [354]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18943/shard-dg2-7/igt@kms_atomic@plane-primary-overlay-mutable-zpos.html
   [355]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18943/shard-dg2-10/igt@kms_atomic@plane-primary-overlay-mutable-zpos.html
   [356]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_171551v1/shard-dg2-7/igt@kms_atomic@plane-primary-overlay-mutable-zpos.html

  * igt@kms_big_fb@4-tiled-16bpp-rotate-90:
    - shard-rkl:          ([SKIP][357], [SKIP][358]) ([i915#5286]) -> [SKIP][359] ([i915#14544] / [i915#5286])
   [357]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18943/shard-rkl-5/igt@kms_big_fb@4-tiled-16bpp-rotate-90.html
   [358]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18943/shard-rkl-2/igt@kms_big_fb@4-tiled-16bpp-rotate-90.html
   [359]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_171551v1/shard-rkl-6/igt@kms_big_fb@4-tiled-16bpp-rotate-90.html

  * igt@kms_big_fb@4-tiled-64bpp-rotate-0:
    - shard-rkl:          ([SKIP][360], [SKIP][361]) ([i915#14544] / [i915#5286]) -> [SKIP][362] ([i915#5286]) +2 other tests skip
   [360]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18943/shard-rkl-1/igt@kms_big_fb@4-tiled-64bpp-rotate-0.html
   [361]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18943/shard-rkl-6/igt@kms_big_fb@4-tiled-64bpp-rotate-0.html
   [362]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_171551v1/shard-rkl-2/igt@kms_big_fb@4-tiled-64bpp-rotate-0.html

  * igt@kms_big_fb@4-tiled-8bpp-rotate-90:
    - shard-dg2:          ([SKIP][363], [SKIP][364]) -> [SKIP][365] ([i915#16707])
   [363]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18943/shard-dg2-6/igt@kms_big_fb@4-tiled-8bpp-rotate-90.html
   [364]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18943/shard-dg2-1/igt@kms_big_fb@4-tiled-8bpp-rotate-90.html
   [365]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_171551v1/shard-dg2-10/igt@kms_big_fb@4-tiled-8bpp-rotate-90.html

  * igt@kms_big_fb@linear-max-hw-stride-32bpp-rotate-180-hflip:
    - shard-rkl:          ([SKIP][366], [SKIP][367]) ([i915#14544] / [i915#3828]) -> [SKIP][368] ([i915#3828])
   [366]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18943/shard-rkl-3/igt@kms_big_fb@linear-max-hw-stride-32bpp-rotate-180-hflip.html
   [367]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18943/shard-rkl-6/igt@kms_big_fb@linear-max-hw-stride-32bpp-rotate-180-hflip.html
   [368]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_171551v1/shard-rkl-5/igt@kms_big_fb@linear-max-hw-stride-32bpp-rotate-180-hflip.html

  * igt@kms_big_fb@linear-max-hw-stride-64bpp-rotate-0-hflip:
    - shard-dg2:          ([SKIP][369], [SKIP][370]) ([i915#16707] / [i915#3828]) -> [SKIP][371] ([i915#3828]) +1 other test skip
   [369]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18943/shard-dg2-6/igt@kms_big_fb@linear-max-hw-stride-64bpp-rotate-0-hflip.html
   [370]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18943/shard-dg2-10/igt@kms_big_fb@linear-max-hw-stride-64bpp-rotate-0-hflip.html
   [371]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_171551v1/shard-dg2-4/igt@kms_big_fb@linear-max-hw-stride-64bpp-rotate-0-hflip.html

  * igt@kms_big_fb@x-tiled-16bpp-rotate-270:
    - shard-dg2:          ([SKIP][372], [SKIP][373]) ([i915#16707]) -> [SKIP][374] +2 other tests skip
   [372]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18943/shard-dg2-3/igt@kms_big_fb@x-tiled-16bpp-rotate-270.html
   [373]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18943/shard-dg2-10/igt@kms_big_fb@x-tiled-16bpp-rotate-270.html
   [374]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_171551v1/shard-dg2-7/igt@kms_big_fb@x-tiled-16bpp-rotate-270.html

  * igt@kms_big_fb@x-tiled-16bpp-rotate-90:
    - shard-dg2:          [SKIP][375] -> [SKIP][376] ([i915#16707]) +1 other test skip
   [375]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18943/shard-dg2-8/igt@kms_big_fb@x-tiled-16bpp-rotate-90.html
   [376]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_171551v1/shard-dg2-10/igt@kms_big_fb@x-tiled-16bpp-rotate-90.html

  * igt@kms_big_fb@x-tiled-max-hw-stride-64bpp-rotate-180-async-flip:
    - shard-dg2:          ([PASS][377], [SKIP][378]) ([i915#16707]) -> [SKIP][379] ([i915#16707]) +44 other tests skip
   [377]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18943/shard-dg2-4/igt@kms_big_fb@x-tiled-max-hw-stride-64bpp-rotate-180-async-flip.html
   [378]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18943/shard-dg2-10/igt@kms_big_fb@x-tiled-max-hw-stride-64bpp-rotate-180-async-flip.html
   [379]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_171551v1/shard-dg2-10/igt@kms_big_fb@x-tiled-max-hw-stride-64bpp-rotate-180-async-flip.html

  * igt@kms_big_fb@y-tiled-32bpp-rotate-90:
    - shard-dg2:          ([SKIP][380], [SKIP][381]) ([i915#4538] / [i915#5190]) -> [SKIP][382] ([i915#16707] / [i915#5190]) +1 other test skip
   [380]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18943/shard-dg2-6/igt@kms_big_fb@y-tiled-32bpp-rotate-90.html
   [381]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18943/shard-dg2-1/igt@kms_big_fb@y-tiled-32bpp-rotate-90.html
   [382]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_171551v1/shard-dg2-10/igt@kms_big_fb@y-tiled-32bpp-rotate-90.html

  * igt@kms_big_fb@y-tiled-64bpp-rotate-270:
    - shard-rkl:          ([SKIP][383], [SKIP][384]) ([i915#14544] / [i915#3638]) -> [SKIP][385] ([i915#3638])
   [383]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18943/shard-rkl-3/igt@kms_big_fb@y-tiled-64bpp-rotate-270.html
   [384]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18943/shard-rkl-6/igt@kms_big_fb@y-tiled-64bpp-rotate-270.html
   [385]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_171551v1/shard-rkl-5/igt@kms_big_fb@y-tiled-64bpp-rotate-270.html

  * igt@kms_big_fb@y-tiled-8bpp-rotate-270:
    - shard-dg2:          [SKIP][386] ([i915#4538] / [i915#5190]) -> [SKIP][387] ([i915#16707] / [i915#5190]) +2 other tests skip
   [386]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18943/shard-dg2-8/igt@kms_big_fb@y-tiled-8bpp-rotate-270.html
   [387]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_171551v1/shard-dg2-10/igt@kms_big_fb@y-tiled-8bpp-rotate-270.html

  * igt@kms_big_fb@y-tiled-8bpp-rotate-90:
    - shard-dg2:          ([SKIP][388], [SKIP][389]) ([i915#16707] / [i915#4538] / [i915#5190]) -> [SKIP][390] ([i915#16707] / [i915#5190]) +6 other tests skip
   [388]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18943/shard-dg2-4/igt@kms_big_fb@y-tiled-8bpp-rotate-90.html
   [389]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18943/shard-dg2-10/igt@kms_big_fb@y-tiled-8bpp-rotate-90.html
   [390]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_171551v1/shard-dg2-10/igt@kms_big_fb@y-tiled-8bpp-rotate-90.html

  * igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-180-hflip-async-flip:
    - shard-dg2:          ([SKIP][391], [SKIP][392]) ([i915#16707] / [i915#4538] / [i915#5190]) -> [SKIP][393] ([i915#4538] / [i915#5190]) +12 other tests skip
   [391]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18943/shard-dg2-6/igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-180-hflip-async-flip.html
   [392]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18943/shard-dg2-10/igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-180-hflip-async-flip.html
   [393]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_171551v1/shard-dg2-4/igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-180-hflip-async-flip.html

  * igt@kms_big_fb@yf-tiled-addfb-size-offset-overflow:
    - shard-dg2:          ([SKIP][394], [SKIP][395]) ([i915#16707] / [i915#5190]) -> [SKIP][396] ([i915#5190])
   [394]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18943/shard-dg2-6/igt@kms_big_fb@yf-tiled-addfb-size-offset-overflow.html
   [395]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18943/shard-dg2-10/igt@kms_big_fb@yf-tiled-addfb-size-offset-overflow.html
   [396]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_171551v1/shard-dg2-4/igt@kms_big_fb@yf-tiled-addfb-size-offset-overflow.html

  * igt@kms_ccs@bad-pixel-format-y-tiled-gen12-mc-ccs:
    - shard-dg2:          ([SKIP][397], [SKIP][398]) ([i915#10307] / [i915#16707] / [i915#6095]) -> [SKIP][399] ([i915#10307] / [i915#6095]) +10 other tests skip
   [397]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18943/shard-dg2-10/igt@kms_ccs@bad-pixel-format-y-tiled-gen12-mc-ccs.html
   [398]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18943/shard-dg2-1/igt@kms_ccs@bad-pixel-format-y-tiled-gen12-mc-ccs.html
   [399]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_171551v1/shard-dg2-3/igt@kms_ccs@bad-pixel-format-y-tiled-gen12-mc-ccs.html
    - shard-rkl:          ([SKIP][400], [SKIP][401]) ([i915#14098] / [i915#14544] / [i915#6095]) -> [SKIP][402] ([i915#14098] / [i915#6095]) +7 other tests skip
   [400]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18943/shard-rkl-3/igt@kms_ccs@bad-pixel-format-y-tiled-gen12-mc-ccs.html
   [401]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18943/shard-rkl-6/igt@kms_ccs@bad-pixel-format-y-tiled-gen12-mc-ccs.html
   [402]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_171551v1/shard-rkl-5/igt@kms_ccs@bad-pixel-format-y-tiled-gen12-mc-ccs.html

  * igt@kms_ccs@bad-rotation-90-4-tiled-lnl-ccs:
    - shard-dg2:          ([SKIP][403], [SKIP][404]) ([i915#12313]) -> [SKIP][405] ([i915#16707]) +1 other test skip
   [403]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18943/shard-dg2-1/igt@kms_ccs@bad-rotation-90-4-tiled-lnl-ccs.html
   [404]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18943/shard-dg2-6/igt@kms_ccs@bad-rotation-90-4-tiled-lnl-ccs.html
   [405]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_171551v1/shard-dg2-10/igt@kms_ccs@bad-rotation-90-4-tiled-lnl-ccs.html

  * igt@kms_ccs@bad-rotation-90-y-tiled-ccs:
    - shard-dg2:          ([SKIP][406], [SKIP][407]) ([i915#10307] / [i915#6095]) -> [SKIP][408] ([i915#16707])
   [406]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18943/shard-dg2-6/igt@kms_ccs@bad-rotation-90-y-tiled-ccs.html
   [407]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18943/shard-dg2-1/igt@kms_ccs@bad-rotation-90-y-tiled-ccs.html
   [408]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_171551v1/shard-dg2-10/igt@kms_ccs@bad-rotation-90-y-tiled-ccs.html

  * igt@kms_ccs@ccs-on-another-bo-4-tiled-mtl-rc-ccs@pipe-b-hdmi-a-2:
    - shard-rkl:          [SKIP][409] ([i915#6095]) -> [SKIP][410] ([i915#14544] / [i915#6095]) +3 other tests skip
   [409]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18943/shard-rkl-7/igt@kms_ccs@ccs-on-another-bo-4-tiled-mtl-rc-ccs@pipe-b-hdmi-a-2.html
   [410]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_171551v1/shard-rkl-6/igt@kms_ccs@ccs-on-another-bo-4-tiled-mtl-rc-ccs@pipe-b-hdmi-a-2.html

  * igt@kms_ccs@ccs-on-another-bo-4-tiled-mtl-rc-ccs@pipe-c-hdmi-a-2:
    - shard-rkl:          [SKIP][411] ([i915#14098] / [i915#6095]) -> [SKIP][412] ([i915#14098] / [i915#14544] / [i915#6095]) +3 other tests skip
   [411]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18943/shard-rkl-7/igt@kms_ccs@ccs-on-another-bo-4-tiled-mtl-rc-ccs@pipe-c-hdmi-a-2.html
   [412]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_171551v1/shard-rkl-6/igt@kms_ccs@ccs-on-another-bo-4-tiled-mtl-rc-ccs@pipe-c-hdmi-a-2.html

  * igt@kms_ccs@crc-primary-basic-4-tiled-lnl-ccs:
    - shard-rkl:          ([SKIP][413], [SKIP][414]) ([i915#12313]) -> [SKIP][415] ([i915#12313] / [i915#14544])
   [413]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18943/shard-rkl-5/igt@kms_ccs@crc-primary-basic-4-tiled-lnl-ccs.html
   [414]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18943/shard-rkl-2/igt@kms_ccs@crc-primary-basic-4-tiled-lnl-ccs.html
   [415]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_171551v1/shard-rkl-6/igt@kms_ccs@crc-primary-basic-4-tiled-lnl-ccs.html

  * igt@kms_ccs@crc-primary-basic-y-tiled-gen12-mc-ccs:
    - shard-dg2:          ([SKIP][416], [SKIP][417]) ([i915#10307] / [i915#16707] / [i915#6095]) -> [SKIP][418] ([i915#16707]) +8 other tests skip
   [416]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18943/shard-dg2-10/igt@kms_ccs@crc-primary-basic-y-tiled-gen12-mc-ccs.html
   [417]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18943/shard-dg2-4/igt@kms_ccs@crc-primary-basic-y-tiled-gen12-mc-ccs.html
   [418]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_171551v1/shard-dg2-10/igt@kms_ccs@crc-primary-basic-y-tiled-gen12-mc-ccs.html

  * igt@kms_ccs@crc-primary-rotation-180-4-tiled-bmg-ccs:
    - shard-dg2:          ([SKIP][419], [SKIP][420]) ([i915#12313] / [i915#16707]) -> [SKIP][421] ([i915#12313]) +1 other test skip
   [419]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18943/shard-dg2-10/igt@kms_ccs@crc-primary-rotation-180-4-tiled-bmg-ccs.html
   [420]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18943/shard-dg2-3/igt@kms_ccs@crc-primary-rotation-180-4-tiled-bmg-ccs.html
   [421]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_171551v1/shard-dg2-7/igt@kms_ccs@crc-primary-rotation-180-4-tiled-bmg-ccs.html

  * igt@kms_ccs@crc-primary-rotation-180-4-tiled-lnl-ccs:
    - shard-dg2:          ([SKIP][422], [SKIP][423]) ([i915#12313] / [i915#16707]) -> [SKIP][424] ([i915#16707])
   [422]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18943/shard-dg2-10/igt@kms_ccs@crc-primary-rotation-180-4-tiled-lnl-ccs.html
   [423]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18943/shard-dg2-4/igt@kms_ccs@crc-primary-rotation-180-4-tiled-lnl-ccs.html
   [424]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_171551v1/shard-dg2-10/igt@kms_ccs@crc-primary-rotation-180-4-tiled-lnl-ccs.html

  * igt@kms_ccs@crc-primary-suspend-y-tiled-gen12-mc-ccs:
    - shard-dg2:          ([SKIP][425], [SKIP][426]) ([i915#16707] / [i915#6095]) -> [SKIP][427] ([i915#6095]) +2 other tests skip
   [425]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18943/shard-dg2-10/igt@kms_ccs@crc-primary-suspend-y-tiled-gen12-mc-ccs.html
   [426]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18943/shard-dg2-1/igt@kms_ccs@crc-primary-suspend-y-tiled-gen12-mc-ccs.html
   [427]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_171551v1/shard-dg2-3/igt@kms_ccs@crc-primary-suspend-y-tiled-gen12-mc-ccs.html

  * igt@kms_ccs@crc-sprite-planes-basic-yf-tiled-ccs:
    - shard-rkl:          ([SKIP][428], [SKIP][429]) ([i915#14098] / [i915#6095]) -> [SKIP][430] ([i915#14098] / [i915#14544] / [i915#6095])
   [428]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18943/shard-rkl-2/igt@kms_ccs@crc-sprite-planes-basic-yf-tiled-ccs.html
   [429]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18943/shard-rkl-5/igt@kms_ccs@crc-sprite-planes-basic-yf-tiled-ccs.html
   [430]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_171551v1/shard-rkl-6/igt@kms_ccs@crc-sprite-planes-basic-yf-tiled-ccs.html

  * igt@kms_ccs@random-ccs-data-y-tiled-gen12-rc-ccs-cc:
    - shard-dg2:          [SKIP][431] ([i915#10307] / [i915#6095]) -> [SKIP][432] ([i915#16707]) +1 other test skip
   [431]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18943/shard-dg2-8/igt@kms_ccs@random-ccs-data-y-tiled-gen12-rc-ccs-cc.html
   [432]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_171551v1/shard-dg2-10/igt@kms_ccs@random-ccs-data-y-tiled-gen12-rc-ccs-cc.html

  * igt@kms_cdclk@mode-transition-all-outputs:
    - shard-rkl:          ([SKIP][433], [SKIP][434]) ([i915#3742]) -> [SKIP][435] ([i915#14544] / [i915#3742])
   [433]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18943/shard-rkl-2/igt@kms_cdclk@mode-transition-all-outputs.html
   [434]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18943/shard-rkl-5/igt@kms_cdclk@mode-transition-all-outputs.html
   [435]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_171551v1/shard-rkl-6/igt@kms_cdclk@mode-transition-all-outputs.html

  * igt@kms_cdclk@plane-scaling:
    - shard-dg2:          ([SKIP][436], [SKIP][437]) ([i915#13783] / [i915#16707]) -> [SKIP][438] ([i915#13783])
   [436]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18943/shard-dg2-6/igt@kms_cdclk@plane-scaling.html
   [437]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18943/shard-dg2-10/igt@kms_cdclk@plane-scaling.html
   [438]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_171551v1/shard-dg2-4/igt@kms_cdclk@plane-scaling.html

  * igt@kms_chamelium_audio@hdmi-audio:
    - shard-rkl:          [SKIP][439] ([i915#11151] / [i915#7828]) -> [SKIP][440] ([i915#11151] / [i915#14544] / [i915#7828])
   [439]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18943/shard-rkl-7/igt@kms_chamelium_audio@hdmi-audio.html
   [440]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_171551v1/shard-rkl-6/igt@kms_chamelium_audio@hdmi-audio.html

  * igt@kms_chamelium_color_pipeline@plane-lut1d-ctm3x4-lut1d:
    - shard-rkl:          ([SKIP][441], [SKIP][442]) ([i915#14544] / [i915#16471]) -> [SKIP][443] ([i915#16471]) +1 other test skip
   [441]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18943/shard-rkl-3/igt@kms_chamelium_color_pipeline@plane-lut1d-ctm3x4-lut1d.html
   [442]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18943/shard-rkl-6/igt@kms_chamelium_color_pipeline@plane-lut1d-ctm3x4-lut1d.html
   [443]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_171551v1/shard-rkl-2/igt@kms_chamelium_color_pipeline@plane-lut1d-ctm3x4-lut1d.html

  * igt@kms_chamelium_hpd@hdmi-hpd-storm-disable:
    - shard-rkl:          ([SKIP][444], [SKIP][445]) ([i915#11151] / [i915#14544] / [i915#7828]) -> [SKIP][446] ([i915#11151] / [i915#7828]) +5 other tests skip
   [444]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18943/shard-rkl-6/igt@kms_chamelium_hpd@hdmi-hpd-storm-disable.html
   [445]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18943/shard-rkl-1/igt@kms_chamelium_hpd@hdmi-hpd-storm-disable.html
   [446]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_171551v1/shard-rkl-2/igt@kms_chamelium_hpd@hdmi-hpd-storm-disable.html

  * igt@kms_chamelium_hpd@hdmi-hpd-with-enabled-mode:
    - shard-rkl:          ([SKIP][447], [SKIP][448]) ([i915#11151] / [i915#7828]) -> [SKIP][449] ([i915#11151] / [i915#14544] / [i915#7828])
   [447]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18943/shard-rkl-2/igt@kms_chamelium_hpd@hdmi-hpd-with-enabled-mode.html
   [448]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18943/shard-rkl-5/igt@kms_chamelium_hpd@hdmi-hpd-with-enabled-mode.html
   [449]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_171551v1/shard-rkl-6/igt@kms_chamelium_hpd@hdmi-hpd-with-enabled-mode.html

  * igt@kms_content_protection@content-type-change:
    - shard-dg2:          ([SKIP][450], [SKIP][451]) ([i915#15865] / [i915#16707]) -> [SKIP][452] ([i915#16707]) +1 other test skip
   [450]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18943/shard-dg2-4/igt@kms_content_protection@content-type-change.html
   [451]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18943/shard-dg2-10/igt@kms_content_protection@content-type-change.html
   [452]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_171551v1/shard-dg2-10/igt@kms_content_protection@content-type-change.html

  * igt@kms_content_protection@dp-mst-lic-type-1:
    - shard-rkl:          ([SKIP][453], [SKIP][454]) ([i915#14544] / [i915#15330] / [i915#3116]) -> [SKIP][455] ([i915#15330] / [i915#3116])
   [453]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18943/shard-rkl-3/igt@kms_content_protection@dp-mst-lic-type-1.html
   [454]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18943/shard-rkl-6/igt@kms_content_protection@dp-mst-lic-type-1.html
   [455]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_171551v1/shard-rkl-3/igt@kms_content_protection@dp-mst-lic-type-1.html

  * igt@kms_content_protection@dp-mst-type-0:
    - shard-dg2:          ([SKIP][456], [SKIP][457]) ([i915#15330] / [i915#3299]) -> [SKIP][458] ([i915#16707])
   [456]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18943/shard-dg2-1/igt@kms_content_protection@dp-mst-type-0.html
   [457]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18943/shard-dg2-6/igt@kms_content_protection@dp-mst-type-0.html
   [458]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_171551v1/shard-dg2-10/igt@kms_content_protection@dp-mst-type-0.html

  * igt@kms_content_protection@dp-mst-type-0-hdcp14:
    - shard-dg2:          ([SKIP][459], [SKIP][460]) ([i915#15330] / [i915#16707]) -> [SKIP][461] ([i915#16707])
   [459]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18943/shard-dg2-10/igt@kms_content_protection@dp-mst-type-0-hdcp14.html
   [460]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18943/shard-dg2-4/igt@kms_content_protection@dp-mst-type-0-hdcp14.html
   [461]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_171551v1/shard-dg2-10/igt@kms_content_protection@dp-mst-type-0-hdcp14.html

  * igt@kms_content_protection@dp-mst-type-0-suspend-resume:
    - shard-dg2:          ([SKIP][462], [SKIP][463]) ([i915#15330] / [i915#16707]) -> [SKIP][464] ([i915#15330])
   [462]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18943/shard-dg2-3/igt@kms_content_protection@dp-mst-type-0-suspend-resume.html
   [463]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18943/shard-dg2-10/igt@kms_content_protection@dp-mst-type-0-suspend-resume.html
   [464]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_171551v1/shard-dg2-7/igt@kms_content_protection@dp-mst-type-0-suspend-resume.html

  * igt@kms_content_protection@dp-mst-type-1:
    - shard-dg2:          [SKIP][465] ([i915#15330] / [i915#3299]) -> [SKIP][466] ([i915#16707])
   [465]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18943/shard-dg2-8/igt@kms_content_protection@dp-mst-type-1.html
   [466]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_171551v1/shard-dg2-10/igt@kms_content_protection@dp-mst-type-1.html

  * igt@kms_content_protection@mei-interface:
    - shard-dg1:          ([SKIP][467], [SKIP][468]) ([i915#15865] / [i915#9433]) -> [SKIP][469] ([i915#9433])
   [467]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18943/shard-dg1-19/igt@kms_content_protection@mei-interface.html
   [468]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18943/shard-dg1-13/igt@kms_content_protection@mei-interface.html
   [469]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_171551v1/shard-dg1-12/igt@kms_content_protection@mei-interface.html

  * igt@kms_content_protection@srm:
    - shard-dg2:          ([SKIP][470], [SKIP][471]) ([i915#15865] / [i915#16707]) -> [SKIP][472] ([i915#15865]) +4 other tests skip
   [470]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18943/shard-dg2-10/igt@kms_content_protection@srm.html
   [471]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18943/shard-dg2-3/igt@kms_content_protection@srm.html
   [472]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_171551v1/shard-dg2-7/igt@kms_content_protection@srm.html

  * igt@kms_content_protection@suspend-resume:
    - shard-rkl:          ([SKIP][473], [SKIP][474]) ([i915#14544] / [i915#15865]) -> [SKIP][475] ([i915#15865]) +1 other test skip
   [473]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18943/shard-rkl-6/igt@kms_content_protection@suspend-resume.html
   [474]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18943/shard-rkl-1/igt@kms_content_protection@suspend-resume.html
   [475]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_171551v1/shard-rkl-2/igt@kms_content_protection@suspend-resume.html

  * igt@kms_cursor_crc@cursor-onscreen-32x10:
    - shard-rkl:          ([SKIP][476], [SKIP][477]) ([i915#14544] / [i915#3555]) -> [SKIP][478] ([i915#3555])
   [476]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18943/shard-rkl-6/igt@kms_cursor_crc@cursor-onscreen-32x10.html
   [477]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18943/shard-rkl-1/igt@kms_cursor_crc@cursor-onscreen-32x10.html
   [478]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_171551v1/shard-rkl-2/igt@kms_cursor_crc@cursor-onscreen-32x10.html

  * igt@kms_cursor_crc@cursor-onscreen-512x512:
    - shard-dg2:          ([SKIP][479], [SKIP][480]) ([i915#13049] / [i915#16707]) -> [SKIP][481] ([i915#13049])
   [479]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18943/shard-dg2-6/igt@kms_cursor_crc@cursor-onscreen-512x512.html
   [480]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18943/shard-dg2-10/igt@kms_cursor_crc@cursor-onscreen-512x512.html
   [481]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_171551v1/shard-dg2-4/igt@kms_cursor_crc@cursor-onscreen-512x512.html

  * igt@kms_cursor_crc@cursor-onscreen-max-size:
    - shard-dg2:          ([SKIP][482], [SKIP][483]) ([i915#16707] / [i915#3555]) -> [SKIP][484] ([i915#3555])
   [482]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18943/shard-dg2-10/igt@kms_cursor_crc@cursor-onscreen-max-size.html
   [483]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18943/shard-dg2-7/igt@kms_cursor_crc@cursor-onscreen-max-size.html
   [484]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_171551v1/shard-dg2-7/igt@kms_cursor_crc@cursor-onscreen-max-size.html

  * igt@kms_cursor_crc@cursor-random-512x170:
    - shard-dg2:          ([SKIP][485], [SKIP][486]) ([i915#13049]) -> [SKIP][487] ([i915#16707])
   [485]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18943/shard-dg2-6/igt@kms_cursor_crc@cursor-random-512x170.html
   [486]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18943/shard-dg2-1/igt@kms_cursor_crc@cursor-random-512x170.html
   [487]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_171551v1/shard-dg2-10/igt@kms_cursor_crc@cursor-random-512x170.html

  * igt@kms_cursor_crc@cursor-random-max-size:
    - shard-dg2:          ([SKIP][488], [SKIP][489]) ([i915#16707] / [i915#3555]) -> [SKIP][490] ([i915#16707]) +2 other tests skip
   [488]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18943/shard-dg2-4/igt@kms_cursor_crc@cursor-random-max-size.html
   [489]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18943/shard-dg2-10/igt@kms_cursor_crc@cursor-random-max-size.html
   [490]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_171551v1/shard-dg2-10/igt@kms_cursor_crc@cursor-random-max-size.html

  * igt@kms_cursor_crc@cursor-sliding-512x170:
    - shard-dg2:          ([SKIP][491], [SKIP][492]) ([i915#13049] / [i915#16707]) -> [SKIP][493] ([i915#16707])
   [491]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18943/shard-dg2-8/igt@kms_cursor_crc@cursor-sliding-512x170.html
   [492]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18943/shard-dg2-10/igt@kms_cursor_crc@cursor-sliding-512x170.html
   [493]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_171551v1/shard-dg2-10/igt@kms_cursor_crc@cursor-sliding-512x170.html
    - shard-rkl:          ([SKIP][494], [SKIP][495]) ([i915#13049] / [i915#14544]) -> [SKIP][496] ([i915#13049])
   [494]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18943/shard-rkl-1/igt@kms_cursor_crc@cursor-sliding-512x170.html
   [495]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18943/shard-rkl-6/igt@kms_cursor_crc@cursor-sliding-512x170.html
   [496]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_171551v1/shard-rkl-2/igt@kms_cursor_crc@cursor-sliding-512x170.html

  * igt@kms_cursor_legacy@2x-cursor-vs-flip-legacy:
    - shard-dg2:          ([SKIP][497], [SKIP][498]) ([i915#13046] / [i915#16707] / [i915#5354]) -> [SKIP][499] ([i915#16707]) +2 other tests skip
   [497]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18943/shard-dg2-8/igt@kms_cursor_legacy@2x-cursor-vs-flip-legacy.html
   [498]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18943/shard-dg2-10/igt@kms_cursor_legacy@2x-cursor-vs-flip-legacy.html
   [499]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_171551v1/shard-dg2-10/igt@kms_cursor_legacy@2x-cursor-vs-flip-legacy.html

  * igt@kms_cursor_legacy@2x-flip-vs-cursor-legacy:
    - shard-rkl:          ([SKIP][500], [SKIP][501]) ([i915#14544]) -> [SKIP][502] +67 other tests skip
   [500]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18943/shard-rkl-6/igt@kms_cursor_legacy@2x-flip-vs-cursor-legacy.html
   [501]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18943/shard-rkl-1/igt@kms_cursor_legacy@2x-flip-vs-cursor-legacy.html
   [502]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_171551v1/shard-rkl-2/igt@kms_cursor_legacy@2x-flip-vs-cursor-legacy.html

  * igt@kms_cursor_legacy@basic-busy-flip-before-cursor-atomic:
    - shard-dg2:          ([SKIP][503], [SKIP][504]) ([i915#11190] / [i915#16707] / [i915#4103]) -> [SKIP][505] ([i915#11190] / [i915#16707])
   [503]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18943/shard-dg2-10/igt@kms_cursor_legacy@basic-busy-flip-before-cursor-atomic.html
   [504]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18943/shard-dg2-4/igt@kms_cursor_legacy@basic-busy-flip-before-cursor-atomic.html
   [505]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_171551v1/shard-dg2-10/igt@kms_cursor_legacy@basic-busy-flip-before-cursor-atomic.html

  * igt@kms_cursor_legacy@cursorb-vs-flipa-varying-size:
    - shard-dg2:          ([SKIP][506], [SKIP][507]) ([i915#13046] / [i915#5354]) -> [SKIP][508] ([i915#16707]) +1 other test skip
   [506]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18943/shard-dg2-6/igt@kms_cursor_legacy@cursorb-vs-flipa-varying-size.html
   [507]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18943/shard-dg2-1/igt@kms_cursor_legacy@cursorb-vs-flipa-varying-size.html
   [508]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_171551v1/shard-dg2-10/igt@kms_cursor_legacy@cursorb-vs-flipa-varying-size.html

  * igt@kms_cursor_legacy@cursorb-vs-flipb-toggle:
    - shard-dg2:          ([SKIP][509], [SKIP][510]) ([i915#13046] / [i915#16707] / [i915#5354]) -> [SKIP][511] ([i915#13046] / [i915#5354]) +2 other tests skip
   [509]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18943/shard-dg2-3/igt@kms_cursor_legacy@cursorb-vs-flipb-toggle.html
   [510]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18943/shard-dg2-10/igt@kms_cursor_legacy@cursorb-vs-flipb-toggle.html
   [511]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_171551v1/shard-dg2-7/igt@kms_cursor_legacy@cursorb-vs-flipb-toggle.html

  * igt@kms_cursor_legacy@short-busy-flip-before-cursor-toggle:
    - shard-dg2:          ([SKIP][512], [SKIP][513]) ([i915#16707] / [i915#4103]) -> [SKIP][514] ([i915#4103]) +1 other test skip
   [512]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18943/shard-dg2-10/igt@kms_cursor_legacy@short-busy-flip-before-cursor-toggle.html
   [513]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18943/shard-dg2-1/igt@kms_cursor_legacy@short-busy-flip-before-cursor-toggle.html
   [514]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_171551v1/shard-dg2-3/igt@kms_cursor_legacy@short-busy-flip-before-cursor-toggle.html
    - shard-rkl:          ([SKIP][515], [SKIP][516]) ([i915#14544] / [i915#4103]) -> [SKIP][517] ([i915#4103])
   [515]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18943/shard-rkl-6/igt@kms_cursor_legacy@short-busy-flip-before-cursor-toggle.html
   [516]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18943/shard-rkl-3/igt@kms_cursor_legacy@short-busy-flip-before-cursor-toggle.html
   [517]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_171551v1/shard-rkl-5/igt@kms_cursor_legacy@short-busy-flip-before-cursor-toggle.html

  * igt@kms_dirtyfb@drrs-dirtyfb-ioctl:
    - shard-dg2:          [SKIP][518] ([i915#9833]) -> [SKIP][519] ([i915#16707])
   [518]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18943/shard-dg2-8/igt@kms_dirtyfb@drrs-dirtyfb-ioctl.html
   [519]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_171551v1/shard-dg2-10/igt@kms_dirtyfb@drrs-dirtyfb-ioctl.html

  * igt@kms_dp_link_training@uhbr-sst:
    - shard-rkl:          ([SKIP][520], [SKIP][521]) ([i915#13748] / [i915#14544]) -> [SKIP][522] ([i915#13748])
   [520]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18943/shard-rkl-6/igt@kms_dp_link_training@uhbr-sst.html
   [521]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18943/shard-rkl-3/igt@kms_dp_link_training@uhbr-sst.html
   [522]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_171551v1/shard-rkl-5/igt@kms_dp_link_training@uhbr-sst.html
    - shard-dg2:          ([SKIP][523], [SKIP][524]) ([i915#13748] / [i915#16707]) -> [SKIP][525] ([i915#13748])
   [523]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18943/shard-dg2-10/igt@kms_dp_link_training@uhbr-sst.html
   [524]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18943/shard-dg2-1/igt@kms_dp_link_training@uhbr-sst.html
   [525]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_171551v1/shard-dg2-3/igt@kms_dp_link_training@uhbr-sst.html

  * igt@kms_dp_linktrain_fallback@dsc-fallback:
    - shard-dg2:          ([SKIP][526], [SKIP][527]) ([i915#13707]) -> [SKIP][528] ([i915#16707])
   [526]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18943/shard-dg2-6/igt@kms_dp_linktrain_fallback@dsc-fallback.html
   [527]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18943/shard-dg2-1/igt@kms_dp_linktrain_fallback@dsc-fallback.html
   [528]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_171551v1/shard-dg2-10/igt@kms_dp_linktrain_fallback@dsc-fallback.html

  * igt@kms_dsc@dsc-with-bpc-formats:
    - shard-dg2:          ([SKIP][529], [SKIP][530]) ([i915#16361] / [i915#16707]) -> [SKIP][531] ([i915#16707]) +3 other tests skip
   [529]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18943/shard-dg2-10/igt@kms_dsc@dsc-with-bpc-formats.html
   [530]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18943/shard-dg2-4/igt@kms_dsc@dsc-with-bpc-formats.html
   [531]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_171551v1/shard-dg2-10/igt@kms_dsc@dsc-with-bpc-formats.html

  * igt@kms_dsc@dsc-with-output-formats:
    - shard-dg2:          ([SKIP][532], [SKIP][533]) ([i915#16361] / [i915#16707]) -> [SKIP][534] ([i915#16361]) +3 other tests skip
   [532]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18943/shard-dg2-10/igt@kms_dsc@dsc-with-output-formats.html
   [533]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18943/shard-dg2-8/igt@kms_dsc@dsc-with-output-formats.html
   [534]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_171551v1/shard-dg2-1/igt@kms_dsc@dsc-with-output-formats.html

  * igt@kms_dsc@dsc-with-output-formats-with-bpc:
    - shard-rkl:          ([SKIP][535], [SKIP][536]) ([i915#14544] / [i915#16361]) -> [SKIP][537] ([i915#16361]) +1 other test skip
   [535]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18943/shard-rkl-6/igt@kms_dsc@dsc-with-output-formats-with-bpc.html
   [536]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18943/shard-rkl-1/igt@kms_dsc@dsc-with-output-formats-with-bpc.html
   [537]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_171551v1/shard-rkl-2/igt@kms_dsc@dsc-with-output-formats-with-bpc.html

  * igt@kms_dsc@dsc-with-output-formats-with-bpc-bigjoiner:
    - shard-dg2:          [SKIP][538] ([i915#16361]) -> [SKIP][539] ([i915#16707])
   [538]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18943/shard-dg2-8/igt@kms_dsc@dsc-with-output-formats-with-bpc-bigjoiner.html
   [539]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_171551v1/shard-dg2-10/igt@kms_dsc@dsc-with-output-formats-with-bpc-bigjoiner.html

  * igt@kms_fbcon_fbt@fbc:
    - shard-dg2:          ([SKIP][540], [PASS][541]) ([i915#1849]) -> [SKIP][542] ([i915#1849])
   [540]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18943/shard-dg2-10/igt@kms_fbcon_fbt@fbc.html
   [541]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18943/shard-dg2-8/igt@kms_fbcon_fbt@fbc.html
   [542]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_171551v1/shard-dg2-10/igt@kms_fbcon_fbt@fbc.html

  * igt@kms_feature_discovery@display-4x:
    - shard-rkl:          ([SKIP][543], [SKIP][544]) ([i915#14544] / [i915#16081]) -> [SKIP][545] ([i915#16081])
   [543]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18943/shard-rkl-3/igt@kms_feature_discovery@display-4x.html
   [544]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18943/shard-rkl-6/igt@kms_feature_discovery@display-4x.html
   [545]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_171551v1/shard-rkl-3/igt@kms_feature_discovery@display-4x.html

  * igt@kms_feature_discovery@vrr:
    - shard-rkl:          ([SKIP][546], [SKIP][547]) ([i915#14544] / [i915#16600]) -> [SKIP][548] ([i915#16600])
   [546]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18943/shard-rkl-3/igt@kms_feature_discovery@vrr.html
   [547]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18943/shard-rkl-6/igt@kms_feature_discovery@vrr.html
   [548]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_171551v1/shard-rkl-5/igt@kms_feature_discovery@vrr.html

  * igt@kms_flip@2x-dpms-vs-vblank-race:
    - shard-rkl:          ([SKIP][549], [SKIP][550]) ([i915#14544] / [i915#9934]) -> [SKIP][551] ([i915#9934]) +6 other tests skip
   [549]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18943/shard-rkl-6/igt@kms_flip@2x-dpms-vs-vblank-race.html
   [550]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18943/shard-rkl-3/igt@kms_flip@2x-dpms-vs-vblank-race.html
   [551]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_171551v1/shard-rkl-2/igt@kms_flip@2x-dpms-vs-vblank-race.html

  * igt@kms_flip@2x-flip-vs-rmfb:
    - shard-rkl:          [SKIP][552] ([i915#9934]) -> [SKIP][553] ([i915#14544] / [i915#9934])
   [552]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18943/shard-rkl-7/igt@kms_flip@2x-flip-vs-rmfb.html
   [553]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_171551v1/shard-rkl-6/igt@kms_flip@2x-flip-vs-rmfb.html

  * igt@kms_flip@flip-vs-panning:
    - shard-dg2:          ([SKIP][554], [PASS][555]) ([i915#5354]) -> [SKIP][556] ([i915#5354]) +4 other tests skip
   [554]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18943/shard-dg2-10/igt@kms_flip@flip-vs-panning.html
   [555]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18943/shard-dg2-4/igt@kms_flip@flip-vs-panning.html
   [556]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_171551v1/shard-dg2-10/igt@kms_flip@flip-vs-panning.html

  * igt@kms_flip@flip-vs-suspend:
    - shard-glk:          [INCOMPLETE][557] ([i915#12745] / [i915#4839] / [i915#6113]) -> [INCOMPLETE][558] ([i915#12745] / [i915#4839])
   [557]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18943/shard-glk3/igt@kms_flip@flip-vs-suspend.html
   [558]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_171551v1/shard-glk6/igt@kms_flip@flip-vs-suspend.html

  * igt@kms_flip@flip-vs-suspend@a-hdmi-a1:
    - shard-glk:          [INCOMPLETE][559] ([i915#12745] / [i915#6113]) -> [INCOMPLETE][560] ([i915#12745])
   [559]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18943/shard-glk3/igt@kms_flip@flip-vs-suspend@a-hdmi-a1.html
   [560]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_171551v1/shard-glk6/igt@kms_flip@flip-vs-suspend@a-hdmi-a1.html

  * igt@kms_flip_scaled_crc@flip-64bpp-linear-to-32bpp-linear-upscaling:
    - shard-dg2:          ([SKIP][561], [PASS][562]) ([i915#3555] / [i915#8813]) -> [SKIP][563] ([i915#3555] / [i915#8813]) +2 other tests skip
   [561]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18943/shard-dg2-10/igt@kms_flip_scaled_crc@flip-64bpp-linear-to-32bpp-linear-upscaling.html
   [562]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18943/shard-dg2-8/igt@kms_flip_scaled_crc@flip-64bpp-linear-to-32bpp-linear-upscaling.html
   [563]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_171551v1/shard-dg2-10/igt@kms_flip_scaled_crc@flip-64bpp-linear-to-32bpp-linear-upscaling.html

  * igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-32bpp-yftile-downscaling:
    - shard-rkl:          ([SKIP][564], [SKIP][565]) ([i915#14544] / [i915#15643]) -> [SKIP][566] ([i915#15643]) +2 other tests skip
   [564]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18943/shard-rkl-6/igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-32bpp-yftile-downscaling.html
   [565]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18943/shard-rkl-3/igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-32bpp-yftile-downscaling.html
   [566]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_171551v1/shard-rkl-2/igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-32bpp-yftile-downscaling.html

  * igt@kms_frontbuffer_tracking@fbc-2p-primscrn-cur-indfb-draw-mmap-wc:
    - shard-dg2:          ([SKIP][567], [SKIP][568]) ([i915#15990] / [i915#16708] / [i915#5354] / [i915#8708]) -> [SKIP][569] ([i915#16708] / [i915#5354]) +7 other tests skip
   [567]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18943/shard-dg2-4/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-cur-indfb-draw-mmap-wc.html
   [568]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18943/shard-dg2-10/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-cur-indfb-draw-mmap-wc.html
   [569]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_171551v1/shard-dg2-10/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-cur-indfb-draw-mmap-wc.html

  * igt@kms_frontbuffer_tracking@fbc-2p-primscrn-pri-indfb-draw-mmap-gtt:
    - shard-rkl:          ([SKIP][570], [SKIP][571]) ([i915#1825]) -> [SKIP][572] ([i915#14544] / [i915#1825])
   [570]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18943/shard-rkl-5/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-pri-indfb-draw-mmap-gtt.html
   [571]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18943/shard-rkl-2/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-pri-indfb-draw-mmap-gtt.html
   [572]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_171551v1/shard-rkl-6/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-pri-indfb-draw-mmap-gtt.html

  * igt@kms_frontbuffer_tracking@fbc-2p-primscrn-pri-indfb-draw-mmap-wc:
    - shard-rkl:          ([SKIP][573], [SKIP][574]) ([i915#14544] / [i915#1825]) -> [SKIP][575] ([i915#1825]) +1 other test skip
   [573]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18943/shard-rkl-1/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-pri-indfb-draw-mmap-wc.html
   [574]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18943/shard-rkl-6/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-pri-indfb-draw-mmap-wc.html
   [575]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_171551v1/shard-rkl-2/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-pri-indfb-draw-mmap-wc.html

  * igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-pri-shrfb-draw-blt:
    - shard-dg2:          ([SKIP][576], [SKIP][577]) ([i915#15991] / [i915#5354]) -> [SKIP][578] ([i915#16708] / [i915#5354]) +4 other tests skip
   [576]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18943/shard-dg2-1/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-pri-shrfb-draw-blt.html
   [577]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18943/shard-dg2-6/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-pri-shrfb-draw-blt.html
   [578]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_171551v1/shard-dg2-10/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-pri-shrfb-draw-blt.html

  * igt@kms_frontbuffer_tracking@fbc-tiling-4:
    - shard-dg2:          ([PASS][579], [SKIP][580]) ([i915#16708] / [i915#5354]) -> [SKIP][581] ([i915#16708] / [i915#5354]) +2 other tests skip
   [579]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18943/shard-dg2-4/igt@kms_frontbuffer_tracking@fbc-tiling-4.html
   [580]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18943/shard-dg2-10/igt@kms_frontbuffer_tracking@fbc-tiling-4.html
   [581]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_171551v1/shard-dg2-10/igt@kms_frontbuffer_tracking@fbc-tiling-4.html

  * igt@kms_frontbuffer_tracking@fbchdr-1p-primscrn-cur-indfb-onoff:
    - shard-rkl:          ([SKIP][582], [PASS][583]) ([i915#15989]) -> [SKIP][584] ([i915#15989]) +13 other tests skip
   [582]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18943/shard-rkl-3/igt@kms_frontbuffer_tracking@fbchdr-1p-primscrn-cur-indfb-onoff.html
   [583]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18943/shard-rkl-6/igt@kms_frontbuffer_tracking@fbchdr-1p-primscrn-cur-indfb-onoff.html
   [584]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_171551v1/shard-rkl-5/igt@kms_frontbuffer_tracking@fbchdr-1p-primscrn-cur-indfb-onoff.html

  * igt@kms_frontbuffer_tracking@fbchdr-2p-primscrn-spr-indfb-draw-mmap-wc:
    - shard-dg2:          [SKIP][585] ([i915#15990]) -> [SKIP][586] ([i915#16708]) +1 other test skip
   [585]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18943/shard-dg2-8/igt@kms_frontbuffer_tracking@fbchdr-2p-primscrn-spr-indfb-draw-mmap-wc.html
   [586]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_171551v1/shard-dg2-10/igt@kms_frontbuffer_tracking@fbchdr-2p-primscrn-spr-indfb-draw-mmap-wc.html

  * igt@kms_frontbuffer_tracking@fbchdr-2p-scndscrn-pri-indfb-draw-mmap-wc:
    - shard-dg2:          ([SKIP][587], [SKIP][588]) ([i915#15990] / [i915#16708]) -> [SKIP][589] ([i915#16708]) +9 other tests skip
   [587]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18943/shard-dg2-4/igt@kms_frontbuffer_tracking@fbchdr-2p-scndscrn-pri-indfb-draw-mmap-wc.html
   [588]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18943/shard-dg2-10/igt@kms_frontbuffer_tracking@fbchdr-2p-scndscrn-pri-indfb-draw-mmap-wc.html
   [589]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_171551v1/shard-dg2-10/igt@kms_frontbuffer_tracking@fbchdr-2p-scndscrn-pri-indfb-draw-mmap-wc.html

  * igt@kms_frontbuffer_tracking@fbchdr-2p-scndscrn-spr-indfb-draw-mmap-cpu:
    - shard-dg2:          ([SKIP][590], [SKIP][591]) ([i915#15991]) -> [SKIP][592] ([i915#16708]) +9 other tests skip
   [590]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18943/shard-dg2-1/igt@kms_frontbuffer_tracking@fbchdr-2p-scndscrn-spr-indfb-draw-mmap-cpu.html
   [591]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18943/shard-dg2-6/igt@kms_frontbuffer_tracking@fbchdr-2p-scndscrn-spr-indfb-draw-mmap-cpu.html
   [592]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_171551v1/shard-dg2-10/igt@kms_frontbuffer_tracking@fbchdr-2p-scndscrn-spr-indfb-draw-mmap-cpu.html

  * igt@kms_frontbuffer_tracking@fbchdr-rgb101010-draw-blt:
    - shard-dg2:          ([SKIP][593], [SKIP][594]) ([i915#15989] / [i915#16708]) -> [SKIP][595] ([i915#16708]) +11 other tests skip
   [593]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18943/shard-dg2-4/igt@kms_frontbuffer_tracking@fbchdr-rgb101010-draw-blt.html
   [594]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18943/shard-dg2-10/igt@kms_frontbuffer_tracking@fbchdr-rgb101010-draw-blt.html
   [595]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_171551v1/shard-dg2-10/igt@kms_frontbuffer_tracking@fbchdr-rgb101010-draw-blt.html

  * igt@kms_frontbuffer_tracking@fbchdr-rgb565-draw-mmap-cpu:
    - shard-dg2:          [SKIP][596] ([i915#15989]) -> [SKIP][597] ([i915#16708]) +4 other tests skip
   [596]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18943/shard-dg2-8/igt@kms_frontbuffer_tracking@fbchdr-rgb565-draw-mmap-cpu.html
   [597]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_171551v1/shard-dg2-10/igt@kms_frontbuffer_tracking@fbchdr-rgb565-draw-mmap-cpu.html

  * igt@kms_frontbuffer_tracking@fbchdr-suspend:
    - shard-rkl:          ([SKIP][598], [SKIP][599]) ([i915#15989]) -> [INCOMPLETE][600] ([i915#16056])
   [598]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18943/shard-rkl-2/igt@kms_frontbuffer_tracking@fbchdr-suspend.html
   [599]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18943/shard-rkl-5/igt@kms_frontbuffer_tracking@fbchdr-suspend.html
   [600]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_171551v1/shard-rkl-6/igt@kms_frontbuffer_tracking@fbchdr-suspend.html

  * igt@kms_frontbuffer_tracking@fbcpsr-1p-offscreen-pri-shrfb-draw-blt:
    - shard-dg2:          ([SKIP][601], [SKIP][602]) ([i915#15102] / [i915#16708]) -> [SKIP][603] ([i915#16708]) +17 other tests skip
   [601]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18943/shard-dg2-4/igt@kms_frontbuffer_tracking@fbcpsr-1p-offscreen-pri-shrfb-draw-blt.html
   [602]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18943/shard-dg2-10/igt@kms_frontbuffer_tracking@fbcpsr-1p-offscreen-pri-shrfb-draw-blt.html
   [603]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_171551v1/shard-dg2-10/igt@kms_frontbuffer_tracking@fbcpsr-1p-offscreen-pri-shrfb-draw-blt.html

  * igt@kms_frontbuffer_tracking@fbcpsr-1p-offscreen-pri-shrfb-draw-mmap-wc:
    - shard-rkl:          ([SKIP][604], [SKIP][605]) ([i915#15102]) -> [SKIP][606] ([i915#14544] / [i915#15102])
   [604]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18943/shard-rkl-5/igt@kms_frontbuffer_tracking@fbcpsr-1p-offscreen-pri-shrfb-draw-mmap-wc.html
   [605]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18943/shard-rkl-2/igt@kms_frontbuffer_tracking@fbcpsr-1p-offscreen-pri-shrfb-draw-mmap-wc.html
   [606]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_171551v1/shard-rkl-6/igt@kms_frontbuffer_tracking@fbcpsr-1p-offscreen-pri-shrfb-draw-mmap-wc.html

  * igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-cur-indfb-draw-mmap-cpu:
    - shard-dg1:          ([SKIP][607], [SKIP][608]) ([i915#15102] / [i915#4423]) -> [SKIP][609] ([i915#15102])
   [607]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18943/shard-dg1-19/igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-cur-indfb-draw-mmap-cpu.html
   [608]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18943/shard-dg1-13/igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-cur-indfb-draw-mmap-cpu.html
   [609]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_171551v1/shard-dg1-12/igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-cur-indfb-draw-mmap-cpu.html

  * igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-pri-shrfb-draw-mmap-gtt:
    - shard-dg2:          ([SKIP][610], [SKIP][611]) ([i915#15990] / [i915#16708] / [i915#5354] / [i915#8708]) -> [SKIP][612] ([i915#15990] / [i915#8708]) +12 other tests skip
   [610]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18943/shard-dg2-8/igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-pri-shrfb-draw-mmap-gtt.html
   [611]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18943/shard-dg2-10/igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-pri-shrfb-draw-mmap-gtt.html
   [612]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_171551v1/shard-dg2-1/igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-pri-shrfb-draw-mmap-gtt.html

  * igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-spr-indfb-draw-blt:
    - shard-dg2:          ([SKIP][613], [SKIP][614]) ([i915#15102] / [i915#16708] / [i915#5354]) -> [SKIP][615] ([i915#10433] / [i915#15102])
   [613]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18943/shard-dg2-6/igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-spr-indfb-draw-blt.html
   [614]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18943/shard-dg2-10/igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-spr-indfb-draw-blt.html
   [615]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_171551v1/shard-dg2-4/igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-spr-indfb-draw-blt.html

  * igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-pri-shrfb-draw-blt:
    - shard-rkl:          ([SKIP][616], [SKIP][617]) -> [SKIP][618] ([i915#14544]) +11 other tests skip
   [616]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18943/shard-rkl-2/igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-pri-shrfb-draw-blt.html
   [617]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18943/shard-rkl-5/igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-pri-shrfb-draw-blt.html
   [618]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_171551v1/shard-rkl-6/igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-pri-shrfb-draw-blt.html

  * igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-cur-indfb-move:
    - shard-dg2:          ([SKIP][619], [SKIP][620]) ([i915#15991] / [i915#16708] / [i915#5354]) -> [SKIP][621] ([i915#16708] / [i915#5354]) +21 other tests skip
   [619]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18943/shard-dg2-8/igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-cur-indfb-move.html
   [620]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18943/shard-dg2-10/igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-cur-indfb-move.html
   [621]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_171551v1/shard-dg2-10/igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-cur-indfb-move.html

  * igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-pri-shrfb-draw-mmap-cpu:
    - shard-dg2:          [SKIP][622] ([i915#15991] / [i915#5354]) -> [SKIP][623] ([i915#16708] / [i915#5354]) +3 other tests skip
   [622]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18943/shard-dg2-8/igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-pri-shrfb-draw-mmap-cpu.html
   [623]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_171551v1/shard-dg2-10/igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-pri-shrfb-draw-mmap-cpu.html

  * igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-spr-indfb-draw-mmap-gtt:
    - shard-dg2:          [SKIP][624] ([i915#15990] / [i915#8708]) -> [SKIP][625] ([i915#16708] / [i915#5354]) +2 other tests skip
   [624]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18943/shard-dg2-8/igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-spr-indfb-draw-mmap-gtt.html
   [625]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_171551v1/shard-dg2-10/igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-spr-indfb-draw-mmap-gtt.html

  * igt@kms_frontbuffer_tracking@fbcpsr-farfromfence-mmap-gtt:
    - shard-dg2:          ([SKIP][626], [SKIP][627]) ([i915#15990] / [i915#8708]) -> [SKIP][628] ([i915#16708] / [i915#5354]) +2 other tests skip
   [626]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18943/shard-dg2-6/igt@kms_frontbuffer_tracking@fbcpsr-farfromfence-mmap-gtt.html
   [627]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18943/shard-dg2-1/igt@kms_frontbuffer_tracking@fbcpsr-farfromfence-mmap-gtt.html
   [628]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_171551v1/shard-dg2-10/igt@kms_frontbuffer_tracking@fbcpsr-farfromfence-mmap-gtt.html

  * igt@kms_frontbuffer_tracking@fbcpsr-indfb-scaledprimary:
    - shard-dg2:          ([SKIP][629], [SKIP][630]) ([i915#15102]) -> [SKIP][631] ([i915#16708] / [i915#5354]) +4 other tests skip
   [629]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18943/shard-dg2-1/igt@kms_frontbuffer_tracking@fbcpsr-indfb-scaledprimary.html
   [630]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18943/shard-dg2-6/igt@kms_frontbuffer_tracking@fbcpsr-indfb-scaledprimary.html
   [631]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_171551v1/shard-dg2-10/igt@kms_frontbuffer_tracking@fbcpsr-indfb-scaledprimary.html

  * igt@kms_frontbuffer_tracking@fbcpsr-shrfb-scaledprimary:
    - shard-dg2:          ([SKIP][632], [SKIP][633]) ([i915#15102]) -> [SKIP][634] ([i915#10433] / [i915#15102])
   [632]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18943/shard-dg2-5/igt@kms_frontbuffer_tracking@fbcpsr-shrfb-scaledprimary.html
   [633]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18943/shard-dg2-6/igt@kms_frontbuffer_tracking@fbcpsr-shrfb-scaledprimary.html
   [634]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_171551v1/shard-dg2-4/igt@kms_frontbuffer_tracking@fbcpsr-shrfb-scaledprimary.html

  * igt@kms_frontbuffer_tracking@fbcpsr-tiling-y:
    - shard-dg2:          ([SKIP][635], [SKIP][636]) ([i915#10055]) -> [SKIP][637] ([i915#16708] / [i915#5354])
   [635]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18943/shard-dg2-1/igt@kms_frontbuffer_tracking@fbcpsr-tiling-y.html
   [636]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18943/shard-dg2-6/igt@kms_frontbuffer_tracking@fbcpsr-tiling-y.html
   [637]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_171551v1/shard-dg2-10/igt@kms_frontbuffer_tracking@fbcpsr-tiling-y.html

  * igt@kms_frontbuffer_tracking@fbcpsrhdr-1p-offscreen-pri-indfb-draw-mmap-cpu:
    - shard-dg2:          [SKIP][638] ([i915#15102]) -> [SKIP][639] ([i915#16708]) +2 other tests skip
   [638]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18943/shard-dg2-8/igt@kms_frontbuffer_tracking@fbcpsrhdr-1p-offscreen-pri-indfb-draw-mmap-cpu.html
   [639]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_171551v1/shard-dg2-10/igt@kms_frontbuffer_tracking@fbcpsrhdr-1p-offscreen-pri-indfb-draw-mmap-cpu.html

  * igt@kms_frontbuffer_tracking@fbcpsrhdr-1p-primscrn-cur-indfb-draw-mmap-wc:
    - shard-dg2:          ([SKIP][640], [SKIP][641]) ([i915#15990]) -> [SKIP][642] ([i915#16708]) +3 other tests skip
   [640]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18943/shard-dg2-6/igt@kms_frontbuffer_tracking@fbcpsrhdr-1p-primscrn-cur-indfb-draw-mmap-wc.html
   [641]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18943/shard-dg2-1/igt@kms_frontbuffer_tracking@fbcpsrhdr-1p-primscrn-cur-indfb-draw-mmap-wc.html
   [642]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_171551v1/shard-dg2-10/igt@kms_frontbuffer_tracking@fbcpsrhdr-1p-primscrn-cur-indfb-draw-mmap-wc.html

  * igt@kms_frontbuffer_tracking@fbcpsrhdr-1p-primscrn-spr-indfb-draw-mmap-cpu:
    - shard-rkl:          ([SKIP][643], [SKIP][644]) ([i915#14544] / [i915#15102]) -> [SKIP][645] ([i915#15102]) +17 other tests skip
   [643]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18943/shard-rkl-3/igt@kms_frontbuffer_tracking@fbcpsrhdr-1p-primscrn-spr-indfb-draw-mmap-cpu.html
   [644]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18943/shard-rkl-6/igt@kms_frontbuffer_tracking@fbcpsrhdr-1p-primscrn-spr-indfb-draw-mmap-cpu.html
   [645]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_171551v1/shard-rkl-5/igt@kms_frontbuffer_tracking@fbcpsrhdr-1p-primscrn-spr-indfb-draw-mmap-cpu.html

  * igt@kms_frontbuffer_tracking@fbcpsrhdr-1p-primscrn-spr-indfb-draw-render:
    - shard-rkl:          [SKIP][646] ([i915#15102]) -> [SKIP][647] ([i915#14544] / [i915#15102])
   [646]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18943/shard-rkl-7/igt@kms_frontbuffer_tracking@fbcpsrhdr-1p-primscrn-spr-indfb-draw-render.html
   [647]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_171551v1/shard-rkl-6/igt@kms_frontbuffer_tracking@fbcpsrhdr-1p-primscrn-spr-indfb-draw-render.html

  * igt@kms_frontbuffer_tracking@fbcpsrhdr-1p-primscrn-spr-indfb-onoff:
    - shard-dg2:          ([SKIP][648], [SKIP][649]) ([i915#15102]) -> [SKIP][650] ([i915#16708]) +2 other tests skip
   [648]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18943/shard-dg2-1/igt@kms_frontbuffer_tracking@fbcpsrhdr-1p-primscrn-spr-indfb-onoff.html
   [649]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18943/shard-dg2-6/igt@kms_frontbuffer_tracking@fbcpsrhdr-1p-primscrn-spr-indfb-onoff.html
   [650]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_171551v1/shard-dg2-10/igt@kms_frontbuffer_tracking@fbcpsrhdr-1p-primscrn-spr-indfb-onoff.html

  * igt@kms_frontbuffer_tracking@fbcpsrhdr-2p-scndscrn-pri-indfb-draw-mmap-wc:
    - shard-dg2:          ([SKIP][651], [SKIP][652]) ([i915#15990] / [i915#16708]) -> [SKIP][653] ([i915#15990]) +24 other tests skip
   [651]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18943/shard-dg2-7/igt@kms_frontbuffer_tracking@fbcpsrhdr-2p-scndscrn-pri-indfb-draw-mmap-wc.html
   [652]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18943/shard-dg2-10/igt@kms_frontbuffer_tracking@fbcpsrhdr-2p-scndscrn-pri-indfb-draw-mmap-wc.html
   [653]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_171551v1/shard-dg2-7/igt@kms_frontbuffer_tracking@fbcpsrhdr-2p-scndscrn-pri-indfb-draw-mmap-wc.html

  * igt@kms_frontbuffer_tracking@fbcpsrhdr-2p-scndscrn-spr-indfb-draw-mmap-cpu:
    - shard-dg2:          [SKIP][654] ([i915#15991]) -> [SKIP][655] ([i915#16708]) +4 other tests skip
   [654]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18943/shard-dg2-8/igt@kms_frontbuffer_tracking@fbcpsrhdr-2p-scndscrn-spr-indfb-draw-mmap-cpu.html
   [655]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_171551v1/shard-dg2-10/igt@kms_frontbuffer_tracking@fbcpsrhdr-2p-scndscrn-spr-indfb-draw-mmap-cpu.html

  * igt@kms_frontbuffer_tracking@fbcpsrhdr-rgb565-draw-render:
    - shard-dg2:          ([SKIP][656], [SKIP][657]) ([i915#15102] / [i915#16708]) -> [SKIP][658] ([i915#15102]) +17 other tests skip
   [656]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18943/shard-dg2-10/igt@kms_frontbuffer_tracking@fbcpsrhdr-rgb565-draw-render.html
   [657]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18943/shard-dg2-6/igt@kms_frontbuffer_tracking@fbcpsrhdr-rgb565-draw-render.html
   [658]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_171551v1/shard-dg2-4/igt@kms_frontbuffer_tracking@fbcpsrhdr-rgb565-draw-render.html

  * igt@kms_frontbuffer_tracking@fbcpsrhdr-tiling-y:
    - shard-dg2:          [SKIP][659] ([i915#10055]) -> [SKIP][660] ([i915#16708])
   [659]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18943/shard-dg2-8/igt@kms_frontbuffer_tracking@fbcpsrhdr-tiling-y.html
   [660]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_171551v1/shard-dg2-10/igt@kms_frontbuffer_tracking@fbcpsrhdr-tiling-y.html

  * igt@kms_frontbuffer_tracking@hdr-1p-primscrn-pri-shrfb-draw-mmap-cpu:
    - shard-dg2:          ([SKIP][661], [SKIP][662]) ([i915#15989] / [i915#16708]) -> [SKIP][663] ([i915#15989]) +19 other tests skip
   [661]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18943/shard-dg2-7/igt@kms_frontbuffer_tracking@hdr-1p-primscrn-pri-shrfb-draw-mmap-cpu.html
   [662]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18943/shard-dg2-10/igt@kms_frontbuffer_tracking@hdr-1p-primscrn-pri-shrfb-draw-mmap-cpu.html
   [663]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_171551v1/shard-dg2-7/igt@kms_frontbuffer_tracking@hdr-1p-primscrn-pri-shrfb-draw-mmap-cpu.html

  * igt@kms_frontbuffer_tracking@hdr-2p-scndscrn-pri-shrfb-draw-mmap-cpu:
    - shard-glk:          ([SKIP][664], [PASS][665]) -> [SKIP][666] +18 other tests skip
   [664]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18943/shard-glk5/igt@kms_frontbuffer_tracking@hdr-2p-scndscrn-pri-shrfb-draw-mmap-cpu.html
   [665]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18943/shard-glk8/igt@kms_frontbuffer_tracking@hdr-2p-scndscrn-pri-shrfb-draw-mmap-cpu.html
   [666]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_171551v1/shard-glk1/igt@kms_frontbuffer_tracking@hdr-2p-scndscrn-pri-shrfb-draw-mmap-cpu.html

  * igt@kms_frontbuffer_tracking@hdr-rgb565-draw-mmap-cpu:
    - shard-dg2:          ([SKIP][667], [SKIP][668]) ([i915#15989]) -> [SKIP][669] ([i915#16708]) +4 other tests skip
   [667]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18943/shard-dg2-1/igt@kms_frontbuffer_tracking@hdr-rgb565-draw-mmap-cpu.html
   [668]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18943/shard-dg2-6/igt@kms_frontbuffer_tracking@hdr-rgb565-draw-mmap-cpu.html
   [669]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_171551v1/shard-dg2-10/igt@kms_frontbuffer_tracking@hdr-rgb565-draw-mmap-cpu.html

  * igt@kms_frontbuffer_tracking@psr-1p-offscreen-pri-shrfb-draw-mmap-gtt:
    - shard-dg2:          ([SKIP][670], [SKIP][671]) ([i915#15104] / [i915#15990] / [i915#16708]) -> [SKIP][672] ([i915#16708]) +2 other tests skip
   [670]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18943/shard-dg2-4/igt@kms_frontbuffer_tracking@psr-1p-offscreen-pri-shrfb-draw-mmap-gtt.html
   [671]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18943/shard-dg2-10/igt@kms_frontbuffer_tracking@psr-1p-offscreen-pri-shrfb-draw-mmap-gtt.html
   [672]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_171551v1/shard-dg2-10/igt@kms_frontbuffer_tracking@psr-1p-offscreen-pri-shrfb-draw-mmap-gtt.html

  * igt@kms_frontbuffer_tracking@psr-1p-offscreen-pri-shrfb-draw-mmap-wc:
    - shard-dg2:          ([SKIP][673], [SKIP][674]) ([i915#15104] / [i915#15990] / [i915#16708]) -> [SKIP][675] ([i915#15104] / [i915#15990]) +2 other tests skip
   [673]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18943/shard-dg2-10/igt@kms_frontbuffer_tracking@psr-1p-offscreen-pri-shrfb-draw-mmap-wc.html
   [674]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18943/shard-dg2-1/igt@kms_frontbuffer_tracking@psr-1p-offscreen-pri-shrfb-draw-mmap-wc.html
   [675]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_171551v1/shard-dg2-3/igt@kms_frontbuffer_tracking@psr-1p-offscreen-pri-shrfb-draw-mmap-wc.html

  * igt@kms_frontbuffer_tracking@psr-1p-primscrn-cur-indfb-draw-mmap-cpu:
    - shard-dg2:          ([SKIP][676], [SKIP][677]) ([i915#10433] / [i915#15102]) -> [SKIP][678] ([i915#15102]) +1 other test skip
   [676]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18943/shard-dg2-4/igt@kms_frontbuffer_tracking@psr-1p-primscrn-cur-indfb-draw-mmap-cpu.html
   [677]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18943/shard-dg2-6/igt@kms_frontbuffer_tracking@psr-1p-primscrn-cur-indfb-draw-mmap-cpu.html
   [678]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_171551v1/shard-dg2-6/igt@kms_frontbuffer_tracking@psr-1p-primscrn-cur-indfb-draw-mmap-cpu.html

  * igt@kms_frontbuffer_tracking@psr-1p-primscrn-cur-indfb-move:
    - shard-dg2:          ([SKIP][679], [SKIP][680]) ([i915#15102] / [i915#16708] / [i915#5354]) -> [SKIP][681] ([i915#16708] / [i915#5354]) +11 other tests skip
   [679]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18943/shard-dg2-8/igt@kms_frontbuffer_tracking@psr-1p-primscrn-cur-indfb-move.html
   [680]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18943/shard-dg2-10/igt@kms_frontbuffer_tracking@psr-1p-primscrn-cur-indfb-move.html
   [681]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_171551v1/shard-dg2-10/igt@kms_frontbuffer_tracking@psr-1p-primscrn-cur-indfb-move.html

  * igt@kms_frontbuffer_tracking@psr-1p-primscrn-pri-indfb-draw-mmap-cpu:
    - shard-rkl:          ([SKIP][682], [SKIP][683]) ([i915#15102] / [i915#3023]) -> [SKIP][684] ([i915#14544] / [i915#15102] / [i915#3023])
   [682]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18943/shard-rkl-5/igt@kms_frontbuffer_tracking@psr-1p-primscrn-pri-indfb-draw-mmap-cpu.html
   [683]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18943/shard-rkl-2/igt@kms_frontbuffer_tracking@psr-1p-primscrn-pri-indfb-draw-mmap-cpu.html
   [684]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_171551v1/shard-rkl-6/igt@kms_frontbuffer_tracking@psr-1p-primscrn-pri-indfb-draw-mmap-cpu.html

  * igt@kms_frontbuffer_tracking@psr-1p-primscrn-pri-shrfb-draw-blt:
    - shard-dg2:          ([SKIP][685], [SKIP][686]) ([i915#10433] / [i915#15102] / [i915#16708] / [i915#5354]) -> [SKIP][687] ([i915#16708] / [i915#5354]) +1 other test skip
   [685]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18943/shard-dg2-10/igt@kms_frontbuffer_tracking@psr-1p-primscrn-pri-shrfb-draw-blt.html
   [686]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18943/shard-dg2-4/igt@kms_frontbuffer_tracking@psr-1p-primscrn-pri-shrfb-draw-blt.html
   [687]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_171551v1/shard-dg2-10/igt@kms_frontbuffer_tracking@psr-1p-primscrn-pri-shrfb-draw-blt.html

  * igt@kms_frontbuffer_tracking@psr-1p-primscrn-pri-shrfb-draw-render:
    - shard-dg2:          ([SKIP][688], [SKIP][689]) ([i915#15102] / [i915#16708] / [i915#5354]) -> [SKIP][690] ([i915#15102]) +16 other tests skip
   [688]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18943/shard-dg2-10/igt@kms_frontbuffer_tracking@psr-1p-primscrn-pri-shrfb-draw-render.html
   [689]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18943/shard-dg2-6/igt@kms_frontbuffer_tracking@psr-1p-primscrn-pri-shrfb-draw-render.html
   [690]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_171551v1/shard-dg2-4/igt@kms_frontbuffer_tracking@psr-1p-primscrn-pri-shrfb-draw-render.html

  * igt@kms_frontbuffer_tracking@psr-2p-primscrn-pri-indfb-draw-render:
    - shard-dg2:          ([SKIP][691], [SKIP][692]) ([i915#15991] / [i915#16708] / [i915#5354]) -> [SKIP][693] ([i915#15991] / [i915#5354]) +32 other tests skip
   [691]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18943/shard-dg2-10/igt@kms_frontbuffer_tracking@psr-2p-primscrn-pri-indfb-draw-render.html
   [692]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18943/shard-dg2-3/igt@kms_frontbuffer_tracking@psr-2p-primscrn-pri-indfb-draw-render.html
   [693]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_171551v1/shard-dg2-7/igt@kms_frontbuffer_tracking@psr-2p-primscrn-pri-indfb-draw-render.html

  * igt@kms_frontbuffer_tracking@psr-rgb565-draw-mmap-cpu:
    - shard-dg2:          [SKIP][694] ([i915#15102]) -> [SKIP][695] ([i915#16708] / [i915#5354]) +1 other test skip
   [694]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18943/shard-dg2-8/igt@kms_frontbuffer_tracking@psr-rgb565-draw-mmap-cpu.html
   [695]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_171551v1/shard-dg2-10/igt@kms_frontbuffer_tracking@psr-rgb565-draw-mmap-cpu.html

  * igt@kms_frontbuffer_tracking@psr-suspend:
    - shard-rkl:          ([SKIP][696], [SKIP][697]) ([i915#14544] / [i915#15102] / [i915#3023]) -> [SKIP][698] ([i915#15102] / [i915#3023]) +13 other tests skip
   [696]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18943/shard-rkl-6/igt@kms_frontbuffer_tracking@psr-suspend.html
   [697]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18943/shard-rkl-3/igt@kms_frontbuffer_tracking@psr-suspend.html
   [698]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_171551v1/shard-rkl-5/igt@kms_frontbuffer_tracking@psr-suspend.html

  * igt@kms_frontbuffer_tracking@psrhdr-2p-pri-indfb-multidraw:
    - shard-dg2:          ([SKIP][699], [SKIP][700]) ([i915#15991] / [i915#16708]) -> [SKIP][701] ([i915#15991]) +34 other tests skip
   [699]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18943/shard-dg2-7/igt@kms_frontbuffer_tracking@psrhdr-2p-pri-indfb-multidraw.html
   [700]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18943/shard-dg2-10/igt@kms_frontbuffer_tracking@psrhdr-2p-pri-indfb-multidraw.html
   [701]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_171551v1/shard-dg2-7/igt@kms_frontbuffer_tracking@psrhdr-2p-pri-indfb-multidraw.html

  * igt@kms_frontbuffer_tracking@psrhdr-2p-scndscrn-spr-indfb-draw-render:
    - shard-dg2:          ([SKIP][702], [SKIP][703]) ([i915#15991] / [i915#16708]) -> [SKIP][704] ([i915#16708]) +29 other tests skip
   [702]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18943/shard-dg2-10/igt@kms_frontbuffer_tracking@psrhdr-2p-scndscrn-spr-indfb-draw-render.html
   [703]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18943/shard-dg2-4/igt@kms_frontbuffer_tracking@psrhdr-2p-scndscrn-spr-indfb-draw-render.html
   [704]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_171551v1/shard-dg2-10/igt@kms_frontbuffer_tracking@psrhdr-2p-scndscrn-spr-indfb-draw-render.html

  * igt@kms_hdr@bpc-switch:
    - shard-dg2:          ([SKIP][705], [SKIP][706]) ([i915#16518] / [i915#16707] / [i915#3555] / [i915#8228]) -> [SKIP][707] ([i915#16518] / [i915#3555] / [i915#8228])
   [705]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18943/shard-dg2-10/igt@kms_hdr@bpc-switch.html
   [706]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18943/shard-dg2-6/igt@kms_hdr@bpc-switch.html
   [707]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_171551v1/shard-dg2-4/igt@kms_hdr@bpc-switch.html

  * igt@kms_hdr@brightness-with-hdr:
    - shard-rkl:          ([SKIP][708], [SKIP][709]) ([i915#12713] / [i915#16644]) -> [SKIP][710] ([i915#16644])
   [708]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18943/shard-rkl-7/igt@kms_hdr@brightness-with-hdr.html
   [709]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18943/shard-rkl-5/igt@kms_hdr@brightness-with-hdr.html
   [710]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_171551v1/shard-rkl-1/igt@kms_hdr@brightness-with-hdr.html

  * igt@kms_hdr@static-toggle:
    - shard-dg2:          ([SKIP][711], [SKIP][712]) ([i915#16518] / [i915#3555] / [i915#8228]) -> [SKIP][713] ([i915#16707])
   [711]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18943/shard-dg2-6/igt@kms_hdr@static-toggle.html
   [712]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18943/shard-dg2-1/igt@kms_hdr@static-toggle.html
   [713]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_171551v1/shard-dg2-10/igt@kms_hdr@static-toggle.html
    - shard-rkl:          ([SKIP][714], [PASS][715]) ([i915#16644] / [i915#3555] / [i915#8228]) -> [SKIP][716] ([i915#16644] / [i915#3555] / [i915#8228])
   [714]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18943/shard-rkl-3/igt@kms_hdr@static-toggle.html
   [715]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18943/shard-rkl-1/igt@kms_hdr@static-toggle.html
   [716]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_171551v1/shard-rkl-3/igt@kms_hdr@static-toggle.html

  * igt@kms_hdr@static-toggle-dpms:
    - shard-dg2:          ([SKIP][717], [SKIP][718]) ([i915#16518] / [i915#16707] / [i915#3555] / [i915#8228]) -> [SKIP][719] ([i915#16707])
   [717]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18943/shard-dg2-10/igt@kms_hdr@static-toggle-dpms.html
   [718]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18943/shard-dg2-8/igt@kms_hdr@static-toggle-dpms.html
   [719]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_171551v1/shard-dg2-10/igt@kms_hdr@static-toggle-dpms.html

  * igt@kms_invalid_mode@zero-hdisplay:
    - shard-dg2:          ([SKIP][720], [PASS][721]) ([i915#16746] / [i915#3555]) -> [SKIP][722] ([i915#16746] / [i915#3555])
   [720]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18943/shard-dg2-10/igt@kms_invalid_mode@zero-hdisplay.html
   [721]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18943/shard-dg2-4/igt@kms_invalid_mode@zero-hdisplay.html
   [722]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_171551v1/shard-dg2-10/igt@kms_invalid_mode@zero-hdisplay.html

  * igt@kms_panel_fitting@atomic-fastset:
    - shard-dg2:          ([SKIP][723], [SKIP][724]) ([i915#16707] / [i915#6301]) -> [SKIP][725] ([i915#6301])
   [723]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18943/shard-dg2-7/igt@kms_panel_fitting@atomic-fastset.html
   [724]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18943/shard-dg2-10/igt@kms_panel_fitting@atomic-fastset.html
   [725]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_171551v1/shard-dg2-7/igt@kms_panel_fitting@atomic-fastset.html

  * igt@kms_pipe_crc_basic@read-crc:
    - shard-dg2:          ([PASS][726], [SKIP][727]) ([i915#11190] / [i915#16707]) -> [SKIP][728] ([i915#11190] / [i915#16707]) +1 other test skip
   [726]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18943/shard-dg2-4/igt@kms_pipe_crc_basic@read-crc.html
   [727]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18943/shard-dg2-10/igt@kms_pipe_crc_basic@read-crc.html
   [728]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_171551v1/shard-dg2-10/igt@kms_pipe_crc_basic@read-crc.html

  * igt@kms_plane@pixel-format-4-tiled-dg2-rc-ccs-cc-modifier-source-clamping:
    - shard-dg2:          ([SKIP][729], [PASS][730]) ([i915#8825]) -> [SKIP][731] ([i915#8825]) +1 other test skip
   [729]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18943/shard-dg2-10/igt@kms_plane@pixel-format-4-tiled-dg2-rc-ccs-cc-modifier-source-clamping.html
   [730]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18943/shard-dg2-4/igt@kms_plane@pixel-format-4-tiled-dg2-rc-ccs-cc-modifier-source-clamping.html
   [731]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_171551v1/shard-dg2-10/igt@kms_plane@pixel-format-4-tiled-dg2-rc-ccs-cc-modifier-source-clamping.html

  * igt@kms_plane@pixel-format-4-tiled-mtl-mc-ccs-modifier:
    - shard-rkl:          ([SKIP][732], [SKIP][733]) ([i915#15709]) -> [SKIP][734] ([i915#14544] / [i915#15709])
   [732]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18943/shard-rkl-2/igt@kms_plane@pixel-format-4-tiled-mtl-mc-ccs-modifier.html
   [733]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18943/shard-rkl-5/igt@kms_plane@pixel-format-4-tiled-mtl-mc-ccs-modifier.html
   [734]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_171551v1/shard-rkl-6/igt@kms_plane@pixel-format-4-tiled-mtl-mc-ccs-modifier.html

  * igt@kms_plane@pixel-format-y-tiled-ccs-modifier:
    - shard-rkl:          ([SKIP][735], [SKIP][736]) ([i915#14544] / [i915#15709]) -> [SKIP][737] ([i915#15709])
   [735]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18943/shard-rkl-1/igt@kms_plane@pixel-format-y-tiled-ccs-modifier.html
   [736]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18943/shard-rkl-6/igt@kms_plane@pixel-format-y-tiled-ccs-modifier.html
   [737]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_171551v1/shard-rkl-2/igt@kms_plane@pixel-format-y-tiled-ccs-modifier.html

  * igt@kms_plane@pixel-format-yf-tiled-modifier:
    - shard-dg1:          ([SKIP][738], [SKIP][739]) ([i915#15709]) -> [SKIP][740] ([i915#15709] / [i915#4423])
   [738]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18943/shard-dg1-17/igt@kms_plane@pixel-format-yf-tiled-modifier.html
   [739]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18943/shard-dg1-18/igt@kms_plane@pixel-format-yf-tiled-modifier.html
   [740]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_171551v1/shard-dg1-17/igt@kms_plane@pixel-format-yf-tiled-modifier.html

  * igt@kms_plane@planar-pixel-format-settings:
    - shard-dg2:          ([PASS][741], [SKIP][742]) ([i915#16753]) -> [SKIP][743] ([i915#16753])
   [741]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18943/shard-dg2-4/igt@kms_plane@planar-pixel-format-settings.html
   [742]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18943/shard-dg2-10/igt@kms_plane@planar-pixel-format-settings.html
   [743]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_171551v1/shard-dg2-10/igt@kms_plane@planar-pixel-format-settings.html

  * igt@kms_plane_multiple@2x-tiling-none:
    - shard-dg2:          ([SKIP][744], [SKIP][745]) ([i915#13958] / [i915#16707]) -> [SKIP][746] ([i915#13958])
   [744]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18943/shard-dg2-10/igt@kms_plane_multiple@2x-tiling-none.html
   [745]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18943/shard-dg2-6/igt@kms_plane_multiple@2x-tiling-none.html
   [746]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_171551v1/shard-dg2-4/igt@kms_plane_multiple@2x-tiling-none.html

  * igt@kms_plane_multiple@2x-tiling-y:
    - shard-dg2:          ([SKIP][747], [SKIP][748]) ([i915#13958] / [i915#16707]) -> [SKIP][749] ([i915#16707])
   [747]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18943/shard-dg2-10/igt@kms_plane_multiple@2x-tiling-y.html
   [748]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18943/shard-dg2-4/igt@kms_plane_multiple@2x-tiling-y.html
   [749]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_171551v1/shard-dg2-10/igt@kms_plane_multiple@2x-tiling-y.html

  * igt@kms_plane_multiple@tiling-y:
    - shard-dg2:          ([SKIP][750], [SKIP][751]) ([i915#14259] / [i915#16707]) -> [SKIP][752] ([i915#16707])
   [750]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18943/shard-dg2-8/igt@kms_plane_multiple@tiling-y.html
   [751]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18943/shard-dg2-10/igt@kms_plane_multiple@tiling-y.html
   [752]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_171551v1/shard-dg2-10/igt@kms_plane_multiple@tiling-y.html

  * igt@kms_plane_scaling@plane-upscale-20x20-with-modifiers:
    - shard-dg2:          ([SKIP][753], [PASS][754]) ([i915#15329] / [i915#9423]) -> [SKIP][755] ([i915#15329] / [i915#9423]) +2 other tests skip
   [753]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18943/shard-dg2-10/igt@kms_plane_scaling@plane-upscale-20x20-with-modifiers.html
   [754]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18943/shard-dg2-4/igt@kms_plane_scaling@plane-upscale-20x20-with-modifiers.html
   [755]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_171551v1/shard-dg2-10/igt@kms_plane_scaling@plane-upscale-20x20-with-modifiers.html

  * igt@kms_plane_scaling@planes-upscale-factor-0-25:
    - shard-dg2:          ([PASS][756], [SKIP][757]) ([i915#15329] / [i915#3555] / [i915#6953] / [i915#9423]) -> [SKIP][758] ([i915#15329] / [i915#3555] / [i915#6953] / [i915#9423])
   [756]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18943/shard-dg2-8/igt@kms_plane_scaling@planes-upscale-factor-0-25.html
   [757]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18943/shard-dg2-10/igt@kms_plane_scaling@planes-upscale-factor-0-25.html
   [758]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_171551v1/shard-dg2-10/igt@kms_plane_scaling@planes-upscale-factor-0-25.html

  * igt@kms_plane_scaling@planes-upscale-factor-0-25@pipe-d:
    - shard-dg2:          ([SKIP][759], [PASS][760]) ([i915#15329]) -> [SKIP][761] ([i915#15329]) +15 other tests skip
   [759]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18943/shard-dg2-10/igt@kms_plane_scaling@planes-upscale-factor-0-25@pipe-d.html
   [760]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18943/shard-dg2-8/igt@kms_plane_scaling@planes-upscale-factor-0-25@pipe-d.html
   [761]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_171551v1/shard-dg2-10/igt@kms_plane_scaling@planes-upscale-factor-0-25@pipe-d.html

  * igt@kms_pm_dc@dc5-pageflip-negative:
    - shard-rkl:          ([SKIP][762], [SKIP][763]) ([i915#14544] / [i915#9685]) -> [SKIP][764] ([i915#9685])
   [762]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18943/shard-rkl-3/igt@kms_pm_dc@dc5-pageflip-negative.html
   [763]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18943/shard-rkl-6/igt@kms_pm_dc@dc5-pageflip-negative.html
   [764]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_171551v1/shard-rkl-5/igt@kms_pm_dc@dc5-pageflip-negative.html

  * igt@kms_pm_dc@dc9-dpms:
    - shard-tglu:         [SKIP][765] ([i915#15128]) -> [SKIP][766] ([i915#15739])
   [765]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18943/shard-tglu-6/igt@kms_pm_dc@dc9-dpms.html
   [766]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_171551v1/shard-tglu-9/igt@kms_pm_dc@dc9-dpms.html

  * igt@kms_pm_lpsp@kms-lpsp:
    - shard-rkl:          ([SKIP][767], [SKIP][768]) ([i915#3828] / [i915#9340]) -> [SKIP][769] ([i915#9340])
   [767]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18943/shard-rkl-8/igt@kms_pm_lpsp@kms-lpsp.html
   [768]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18943/shard-rkl-7/igt@kms_pm_lpsp@kms-lpsp.html
   [769]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_171551v1/shard-rkl-4/igt@kms_pm_lpsp@kms-lpsp.html
    - shard-dg1:          ([SKIP][770], [SKIP][771]) ([i915#3828] / [i915#9340]) -> [SKIP][772] ([i915#9340])
   [770]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18943/shard-dg1-15/igt@kms_pm_lpsp@kms-lpsp.html
   [771]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18943/shard-dg1-17/igt@kms_pm_lpsp@kms-lpsp.html
   [772]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_171551v1/shard-dg1-16/igt@kms_pm_lpsp@kms-lpsp.html

  * igt@kms_pm_rpm@dpms-lpsp:
    - shard-dg2:          ([SKIP][773], [PASS][774]) ([i915#15073]) -> [SKIP][775] ([i915#15073]) +1 other test skip
   [773]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18943/shard-dg2-10/igt@kms_pm_rpm@dpms-lpsp.html
   [774]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18943/shard-dg2-4/igt@kms_pm_rpm@dpms-lpsp.html
   [775]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_171551v1/shard-dg2-10/igt@kms_pm_rpm@dpms-lpsp.html
    - shard-dg1:          ([PASS][776], [SKIP][777]) ([i915#15073]) -> [SKIP][778] ([i915#15073]) +2 other tests skip
   [776]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18943/shard-dg1-14/igt@kms_pm_rpm@dpms-lpsp.html
   [777]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18943/shard-dg1-13/igt@kms_pm_rpm@dpms-lpsp.html
   [778]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_171551v1/shard-dg1-13/igt@kms_pm_rpm@dpms-lpsp.html

  * igt@kms_pm_rpm@dpms-mode-unset-non-lpsp:
    - shard-rkl:          ([SKIP][779], [PASS][780]) ([i915#15073]) -> [SKIP][781] ([i915#15073]) +1 other test skip
   [779]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18943/shard-rkl-2/igt@kms_pm_rpm@dpms-mode-unset-non-lpsp.html
   [780]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18943/shard-rkl-7/igt@kms_pm_rpm@dpms-mode-unset-non-lpsp.html
   [781]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_171551v1/shard-rkl-8/igt@kms_pm_rpm@dpms-mode-unset-non-lpsp.html

  * igt@kms_pm_rpm@drm-resources-equal:
    - shard-dg2:          ([PASS][782], [SKIP][783]) ([i915#3547]) -> [SKIP][784] ([i915#3547])
   [782]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18943/shard-dg2-4/igt@kms_pm_rpm@drm-resources-equal.html
   [783]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18943/shard-dg2-10/igt@kms_pm_rpm@drm-resources-equal.html
   [784]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_171551v1/shard-dg2-10/igt@kms_pm_rpm@drm-resources-equal.html

  * igt@kms_properties@colorop-properties-legacy:
    - shard-dg2:          ([PASS][785], [SKIP][786]) ([i915#15347]) -> [SKIP][787] ([i915#15347])
   [785]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18943/shard-dg2-8/igt@kms_properties@colorop-properties-legacy.html
   [786]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18943/shard-dg2-10/igt@kms_properties@colorop-properties-legacy.html
   [787]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_171551v1/shard-dg2-10/igt@kms_properties@colorop-properties-legacy.html

  * igt@kms_psr2_sf@fbc-psr2-overlay-plane-update-continuous-sf:
    - shard-rkl:          ([SKIP][788], [SKIP][789]) ([i915#11520] / [i915#14544]) -> [SKIP][790] ([i915#11520]) +3 other tests skip
   [788]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18943/shard-rkl-6/igt@kms_psr2_sf@fbc-psr2-overlay-plane-update-continuous-sf.html
   [789]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18943/shard-rkl-3/igt@kms_psr2_sf@fbc-psr2-overlay-plane-update-continuous-sf.html
   [790]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_171551v1/shard-rkl-5/igt@kms_psr2_sf@fbc-psr2-overlay-plane-update-continuous-sf.html

  * igt@kms_psr2_su@page_flip-p010:
    - shard-rkl:          ([SKIP][791], [SKIP][792]) ([i915#14544] / [i915#9683]) -> [SKIP][793] ([i915#9683])
   [791]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18943/shard-rkl-1/igt@kms_psr2_su@page_flip-p010.html
   [792]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18943/shard-rkl-6/igt@kms_psr2_su@page_flip-p010.html
   [793]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_171551v1/shard-rkl-2/igt@kms_psr2_su@page_flip-p010.html

  * igt@kms_psr@fbc-psr-primary-mmap-cpu:
    - shard-rkl:          [SKIP][794] ([i915#1072] / [i915#9732]) -> [SKIP][795] ([i915#1072] / [i915#14544] / [i915#9732])
   [794]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18943/shard-rkl-7/igt@kms_psr@fbc-psr-primary-mmap-cpu.html
   [795]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_171551v1/shard-rkl-6/igt@kms_psr@fbc-psr-primary-mmap-cpu.html

  * igt@kms_psr@fbc-psr-suspend:
    - shard-rkl:          ([SKIP][796], [SKIP][797]) ([i915#1072] / [i915#9732]) -> [SKIP][798] ([i915#1072] / [i915#14544] / [i915#9732])
   [796]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18943/shard-rkl-5/igt@kms_psr@fbc-psr-suspend.html
   [797]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18943/shard-rkl-2/igt@kms_psr@fbc-psr-suspend.html
   [798]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_171551v1/shard-rkl-6/igt@kms_psr@fbc-psr-suspend.html

  * igt@kms_psr@pr-cursor-mmap-cpu:
    - shard-rkl:          ([SKIP][799], [SKIP][800]) ([i915#1072] / [i915#14544] / [i915#9732]) -> [SKIP][801] ([i915#1072] / [i915#9732]) +12 other tests skip
   [799]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18943/shard-rkl-6/igt@kms_psr@pr-cursor-mmap-cpu.html
   [800]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18943/shard-rkl-3/igt@kms_psr@pr-cursor-mmap-cpu.html
   [801]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_171551v1/shard-rkl-2/igt@kms_psr@pr-cursor-mmap-cpu.html

  * igt@kms_psr_stress_test@flip-primary-invalidate-overlay:
    - shard-rkl:          ([SKIP][802], [SKIP][803]) ([i915#14544] / [i915#15949]) -> [SKIP][804] ([i915#15949])
   [802]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18943/shard-rkl-3/igt@kms_psr_stress_test@flip-primary-invalidate-overlay.html
   [803]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18943/shard-rkl-6/igt@kms_psr_stress_test@flip-primary-invalidate-overlay.html
   [804]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_171551v1/shard-rkl-5/igt@kms_psr_stress_test@flip-primary-invalidate-overlay.html

  * igt@kms_rotation_crc@exhaust-fences:
    - shard-dg2:          ([SKIP][805], [SKIP][806]) ([i915#16707] / [i915#4235]) -> [SKIP][807] ([i915#16707])
   [805]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18943/shard-dg2-10/igt@kms_rotation_crc@exhaust-fences.html
   [806]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18943/shard-dg2-8/igt@kms_rotation_crc@exhaust-fences.html
   [807]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_171551v1/shard-dg2-10/igt@kms_rotation_crc@exhaust-fences.html

  * igt@kms_rotation_crc@primary-rotation-90:
    - shard-dg2:          ([SKIP][808], [SKIP][809]) ([i915#12755] / [i915#15867] / [i915#16707]) -> [SKIP][810] ([i915#16707])
   [808]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18943/shard-dg2-10/igt@kms_rotation_crc@primary-rotation-90.html
   [809]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18943/shard-dg2-4/igt@kms_rotation_crc@primary-rotation-90.html
   [810]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_171551v1/shard-dg2-10/igt@kms_rotation_crc@primary-rotation-90.html

  * igt@kms_rotation_crc@primary-y-tiled-reflect-x-90:
    - shard-dg2:          ([SKIP][811], [SKIP][812]) ([i915#12755] / [i915#15867] / [i915#16707] / [i915#5190]) -> [SKIP][813] ([i915#12755] / [i915#15867] / [i915#5190]) +1 other test skip
   [811]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18943/shard-dg2-10/igt@kms_rotation_crc@primary-y-tiled-reflect-x-90.html
   [812]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18943/shard-dg2-3/igt@kms_rotation_crc@primary-y-tiled-reflect-x-90.html
   [813]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_171551v1/shard-dg2-7/igt@kms_rotation_crc@primary-y-tiled-reflect-x-90.html

  * igt@kms_rotation_crc@sprite-rotation-270:
    - shard-dg2:          ([SKIP][814], [SKIP][815]) ([i915#12755] / [i915#15867] / [i915#16707]) -> [SKIP][816] ([i915#12755] / [i915#15867])
   [814]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18943/shard-dg2-1/igt@kms_rotation_crc@sprite-rotation-270.html
   [815]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18943/shard-dg2-10/igt@kms_rotation_crc@sprite-rotation-270.html
   [816]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_171551v1/shard-dg2-3/igt@kms_rotation_crc@sprite-rotation-270.html

  * igt@kms_rotation_crc@sprite-rotation-90:
    - shard-dg2:          ([SKIP][817], [SKIP][818]) ([i915#12755] / [i915#15867]) -> [SKIP][819] ([i915#16707])
   [817]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18943/shard-dg2-1/igt@kms_rotation_crc@sprite-rotation-90.html
   [818]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18943/shard-dg2-6/igt@kms_rotation_crc@sprite-rotation-90.html
   [819]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_171551v1/shard-dg2-10/igt@kms_rotation_crc@sprite-rotation-90.html

  * igt@kms_scaling_modes@scaling-mode-none:
    - shard-dg2:          ([SKIP][820], [SKIP][821]) ([i915#3555]) -> [SKIP][822] ([i915#16707])
   [820]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18943/shard-dg2-6/igt@kms_scaling_modes@scaling-mode-none.html
   [821]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18943/shard-dg2-1/igt@kms_scaling_modes@scaling-mode-none.html
   [822]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_171551v1/shard-dg2-10/igt@kms_scaling_modes@scaling-mode-none.html

  * igt@kms_tiled_display@basic-test-pattern:
    - shard-dg2:          ([SKIP][823], [SKIP][824]) ([i915#16707] / [i915#8623]) -> [SKIP][825] ([i915#8623])
   [823]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18943/shard-dg2-3/igt@kms_tiled_display@basic-test-pattern.html
   [824]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18943/shard-dg2-10/igt@kms_tiled_display@basic-test-pattern.html
   [825]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_171551v1/shard-dg2-7/igt@kms_tiled_display@basic-test-pattern.html

  * igt@kms_vrr@flip-basic-fastset:
    - shard-dg2:          ([SKIP][826], [SKIP][827]) ([i915#16707] / [i915#9906]) -> [SKIP][828] ([i915#9906]) +1 other test skip
   [826]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18943/shard-dg2-10/igt@kms_vrr@flip-basic-fastset.html
   [827]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18943/shard-dg2-7/igt@kms_vrr@flip-basic-fastset.html
   [828]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_171551v1/shard-dg2-7/igt@kms_vrr@flip-basic-fastset.html

  * igt@kms_vrr@flip-dpms:
    - shard-dg2:          ([SKIP][829], [SKIP][830]) ([i915#15243] / [i915#16707] / [i915#3555]) -> [SKIP][831] ([i915#15243] / [i915#3555])
   [829]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18943/shard-dg2-10/igt@kms_vrr@flip-dpms.html
   [830]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18943/shard-dg2-3/igt@kms_vrr@flip-dpms.html
   [831]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_171551v1/shard-dg2-7/igt@kms_vrr@flip-dpms.html

  * igt@kms_vrr@max-min:
    - shard-dg2:          ([SKIP][832], [SKIP][833]) ([i915#16707] / [i915#9906]) -> [SKIP][834] ([i915#16707])
   [832]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18943/shard-dg2-10/igt@kms_vrr@max-min.html
   [833]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18943/shard-dg2-4/igt@kms_vrr@max-min.html
   [834]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_171551v1/shard-dg2-10/igt@kms_vrr@max-min.html

  * igt@kms_vrr@seamless-rr-switch-vrr:
    - shard-rkl:          ([SKIP][835], [SKIP][836]) ([i915#14544] / [i915#9906]) -> [SKIP][837] ([i915#9906])
   [835]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18943/shard-rkl-6/igt@kms_vrr@seamless-rr-switch-vrr.html
   [836]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18943/shard-rkl-3/igt@kms_vrr@seamless-rr-switch-vrr.html
   [837]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_171551v1/shard-rkl-3/igt@kms_vrr@seamless-rr-switch-vrr.html

  * igt@perf@per-context-mode-unprivileged:
    - shard-rkl:          ([SKIP][838], [SKIP][839]) ([i915#14544] / [i915#2435]) -> [SKIP][840] ([i915#2435])
   [838]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18943/shard-rkl-3/igt@perf@per-context-mode-unprivileged.html
   [839]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18943/shard-rkl-6/igt@perf@per-context-mode-unprivileged.html
   [840]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_171551v1/shard-rkl-5/igt@perf@per-context-mode-unprivileged.html

  * igt@perf_pmu@busy-double-start@rcs0:
    - shard-mtlp:         ([FAIL][841], [PASS][842]) ([i915#4349]) -> [FAIL][843] ([i915#4349])
   [841]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18943/shard-mtlp-5/igt@perf_pmu@busy-double-start@rcs0.html
   [842]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18943/shard-mtlp-2/igt@perf_pmu@busy-double-start@rcs0.html
   [843]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_171551v1/shard-mtlp-7/igt@perf_pmu@busy-double-start@rcs0.html

  * igt@prime_vgem@basic-fence-flip:
    - shard-dg2:          [SKIP][844] ([i915#3708]) -> [SKIP][845] ([i915#16707] / [i915#3708])
   [844]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18943/shard-dg2-8/igt@prime_vgem@basic-fence-flip.html
   [845]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_171551v1/shard-dg2-10/igt@prime_vgem@basic-fence-flip.html

  * igt@prime_vgem@basic-read:
    - shard-rkl:          ([SKIP][846], [SKIP][847]) ([i915#14544] / [i915#3291] / [i915#3708]) -> [SKIP][848] ([i915#3291] / [i915#3708])
   [846]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18943/shard-rkl-3/igt@prime_vgem@basic-read.html
   [847]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18943/shard-rkl-6/igt@prime_vgem@basic-read.html
   [848]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_171551v1/shard-rkl-5/igt@prime_vgem@basic-read.html

  * igt@sriov_basic@bind-unbind-vf:
    - shard-rkl:          ([SKIP][849], [SKIP][850]) ([i915#14544] / [i915#9917]) -> [SKIP][851] ([i915#9917])
   [849]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18943/shard-rkl-6/igt@sriov_basic@bind-unbind-vf.html
   [850]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18943/shard-rkl-3/igt@sriov_basic@bind-unbind-vf.html
   [851]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_171551v1/shard-rkl-5/igt@sriov_basic@bind-unbind-vf.html

  
  [i915#10055]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/10055
  [i915#10307]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/10307
  [i915#10433]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/10433
  [i915#10434]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/10434
  [i915#1072]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/1072
  [i915#11151]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11151
  [i915#11190]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11190
  [i915#11520]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11520
  [i915#118]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/118
  [i915#12276]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12276
  [i915#12313]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12313
  [i915#12655]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12655
  [i915#12713]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12713
  [i915#12745]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12745
  [i915#12755]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12755
  [i915#12935]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12935
  [i915#13008]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13008
  [i915#13027]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13027
  [i915#13046]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13046
  [i915#13049]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13049
  [i915#13356]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13356
  [i915#13566]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13566
  [i915#13707]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13707
  [i915#13748]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13748
  [i915#13783]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13783
  [i915#13958]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13958
  [i915#14098]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14098
  [i915#14259]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14259
  [i915#14544]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544
  [i915#14600]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14600
  [i915#14694]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14694
  [i915#14888]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14888
  [i915#15073]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15073
  [i915#15102]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15102
  [i915#15104]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15104
  [i915#15128]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15128
  [i915#15243]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15243
  [i915#15329]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15329
  [i915#15330]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15330
  [i915#15342]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15342
  [i915#15347]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15347
  [i915#15529]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15529
  [i915#15582]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15582
  [i915#15643]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15643
  [i915#15662]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15662
  [i915#15672]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15672
  [i915#15709]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15709
  [i915#15733]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15733
  [i915#15739]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15739
  [i915#15865]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15865
  [i915#15867]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15867
  [i915#15949]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15949
  [i915#15989]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15989
  [i915#15990]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15990
  [i915#15991]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15991
  [i915#16056]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16056
  [i915#16080]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16080
  [i915#16081]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16081
  [i915#16166]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16166
  [i915#16182]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16182
  [i915#16348]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16348
  [i915#16361]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16361
  [i915#16386]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16386
  [i915#16466]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16466
  [i915#16471]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16471
  [i915#16518]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16518
  [i915#16600]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16600
  [i915#16644]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16644
  [i915#16707]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16707
  [i915#16708]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16708
  [i915#16724]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16724
  [i915#16746]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16746
  [i915#16753]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16753
  [i915#1825]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/1825
  [i915#1849]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/1849
  [i915#2435]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2435
  [i915#2527]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2527
  [i915#2582]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2582
  [i915#280]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/280
  [i915#284]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/284
  [i915#3023]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3023
  [i915#3116]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3116
  [i915#3281]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3281
  [i915#3282]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3282
  [i915#3291]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3291
  [i915#3299]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3299
  [i915#3547]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3547
  [i915#3555]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3555
  [i915#3637]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3637
  [i915#3638]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3638
  [i915#3708]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3708
  [i915#3742]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3742
  [i915#3828]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3828
  [i915#4103]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4103
  [i915#4235]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4235
  [i915#4349]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4349
  [i915#4391]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4391
  [i915#4423]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4423
  [i915#4525]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4525
  [i915#4538]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4538
  [i915#4613]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4613
  [i915#4817]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4817
  [i915#4839]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4839
  [i915#5138]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5138
  [i915#5190]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5190
  [i915#5286]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5286
  [i915#5354]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5354
  [i915#6095]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6095
  [i915#6113]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6113
  [i915#6301]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6301
  [i915#6344]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6344
  [i915#6953]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6953
  [i915#7707]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/7707
  [i915#7828]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/7828
  [i915#8228]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8228
  [i915#8623]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8623
  [i915#8708]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8708
  [i915#8813]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8813
  [i915#8825]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8825
  [i915#9340]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9340
  [i915#9423]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9423
  [i915#9433]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9433
  [i915#9531]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9531
  [i915#9561]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9561
  [i915#9683]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9683
  [i915#9685]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9685
  [i915#9732]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9732
  [i915#9766]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9766
  [i915#9833]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9833
  [i915#9906]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9906
  [i915#9917]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9917
  [i915#9934]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9934


Build changes
-------------

  * Linux: CI_DRM_18943 -> Patchwork_171551v1

  CI-20190529: 20190529
  CI_DRM_18943: 0377b35cbeef071dfeed06ccadc0d7607eccaa64 @ git://anongit.freedesktop.org/gfx-ci/linux
  IGT_9036: 9036
  Patchwork_171551v1: 0377b35cbeef071dfeed06ccadc0d7607eccaa64 @ git://anongit.freedesktop.org/gfx-ci/linux
  piglit_4509: fdc5a4ca11124ab8413c7988896eec4c97336694 @ git://anongit.freedesktop.org/piglit

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_171551v1/index.html

--===============5057692811932235384==
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
<tr><td><b>Series:</b></td><td>drm/i915/flipq: Fix cursor left enabled afte=
r a pipe disable</td></tr>
<tr><td><b>URL:</b></td><td><a href=3D"https://patchwork.freedesktop.org/se=
ries/171551/">https://patchwork.freedesktop.org/series/171551/</a></td></tr>
<tr><td><b>State:</b></td><td>success</td></tr>

    <tr><td><b>Details:</b></td><td><a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/Patchwork_171551v1/index.html">https://intel-gfx-ci.01.org/tre=
e/drm-tip/Patchwork_171551v1/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from CI_DRM_18943_full -&gt; Patchwork_171551v=
1_full</h1>
<h2>Summary</h2>
<p><strong>SUCCESS</strong></p>
<p>No regressions found.</p>
<h2>Participating hosts (10 -&gt; 10)</h2>
<p>No changes in participating hosts</p>
<h2>Known issues</h2>
<p>Here are the changes found in Patchwork_171551v1_full that come from kno=
wn issues:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>
<p>igt@fbdev@nullptr:</p>
<ul>
<li>shard-dg2:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_18943/shard-dg2-8/igt@fbdev@nullptr.html">PASS</a> -&gt; <a href=3D=
"https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_171551v1/shard-dg2-10/i=
gt@fbdev@nullptr.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/=
drm/i915/kernel/-/issues/2582">i915#2582</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_bad_reloc@negative-reloc-lut:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/Patchwork_171551v1/shard-rkl-2/igt@gem_bad_reloc@negative-rel=
oc-lut.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/k=
ernel/-/issues/3281">i915#3281</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@gem_ccs@large-ctrl-surf-copy:</p>
<ul>
<li>shard-tglu-1:       NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/Patchwork_171551v1/shard-tglu-1/igt@gem_ccs@large-ctrl-surf-c=
opy.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kern=
el/-/issues/13008">i915#13008</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_ccs@suspend-resume@tile64-compressed-compfmt0-lmem0-lmem0:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/Patchwork_171551v1/shard-dg2-6/igt@gem_ccs@suspend-resume@til=
e64-compressed-compfmt0-lmem0-lmem0.html">INCOMPLETE</a> (<a href=3D"https:=
//gitlab.freedesktop.org/drm/i915/kernel/-/issues/13356">i915#13356</a> / <=
a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16348">i9=
15#16348</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_ctx_freq@sysfs@gt0:</p>
<ul>
<li>shard-dg2:          (<a href=3D"https://intel-gfx-ci.01.org/tree/drm-ti=
p/CI_DRM_18943/shard-dg2-7/igt@gem_ctx_freq@sysfs@gt0.html">PASS</a>, <a hr=
ef=3D"https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18943/shard-dg2-4/igt=
@gem_ctx_freq@sysfs@gt0.html">PASS</a>) -&gt; <a href=3D"https://intel-gfx-=
ci.01.org/tree/drm-tip/Patchwork_171551v1/shard-dg2-5/igt@gem_ctx_freq@sysf=
s@gt0.html">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/ke=
rnel/-/issues/9561">i915#9561</a>) +1 other test fail</li>
</ul>
</li>
<li>
<p>igt@gem_ctx_isolation@preservation-s3:</p>
<ul>
<li>shard-glk10:        NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/Patchwork_171551v1/shard-glk10/igt@gem_ctx_isolation@preserva=
tion-s3.html">INCOMPLETE</a> (<a href=3D"https://gitlab.freedesktop.org/drm=
/i915/kernel/-/issues/13356">i915#13356</a> / <a href=3D"https://gitlab.fre=
edesktop.org/drm/i915/kernel/-/issues/16466">i915#16466</a>) +1 other test =
incomplete</li>
</ul>
</li>
<li>
<p>igt@gem_exec_suspend@basic-s0:</p>
<ul>
<li>shard-dg2:          (<a href=3D"https://intel-gfx-ci.01.org/tree/drm-ti=
p/CI_DRM_18943/shard-dg2-10/igt@gem_exec_suspend@basic-s0.html">PASS</a>, <=
a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18943/shard-dg2-8=
/igt@gem_exec_suspend@basic-s0.html">PASS</a>) -&gt; <a href=3D"https://int=
el-gfx-ci.01.org/tree/drm-tip/Patchwork_171551v1/shard-dg2-1/igt@gem_exec_s=
uspend@basic-s0.html">INCOMPLETE</a> (<a href=3D"https://gitlab.freedesktop=
.org/drm/i915/kernel/-/issues/13356">i915#13356</a>) +1 other test incomple=
te</li>
</ul>
</li>
<li>
<p>igt@gem_lmem_swapping@parallel-multi:</p>
<ul>
<li>shard-glk:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/Patchwork_171551v1/shard-glk2/igt@gem_lmem_swapping@parallel-=
multi.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/ke=
rnel/-/issues/4613">i915#4613</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_media_vme:</p>
<ul>
<li>shard-tglu-1:       NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/Patchwork_171551v1/shard-tglu-1/igt@gem_media_vme.html">SKIP<=
/a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/284=
">i915#284</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_pread@display:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/Patchwork_171551v1/shard-rkl-2/igt@gem_pread@display.html">SK=
IP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/=
3282">i915#3282</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@i915_module_load@fault-injection@intel_connector_register:</p>
<ul>
<li>shard-glk10:        NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/Patchwork_171551v1/shard-glk10/igt@i915_module_load@fault-inj=
ection@intel_connector_register.html">ABORT</a> (<a href=3D"https://gitlab.=
freedesktop.org/drm/i915/kernel/-/issues/15342">i915#15342</a>) +1 other te=
st abort</li>
</ul>
</li>
<li>
<p>igt@i915_module_load@fault-injection@intel_gt_init-enodev:</p>
<ul>
<li>shard-glk10:        NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/Patchwork_171551v1/shard-glk10/igt@i915_module_load@fault-inj=
ection@intel_gt_init-enodev.html">SKIP</a> +125 other tests skip</li>
</ul>
</li>
<li>
<p>igt@i915_pm_rc6_residency@media-rc6-accuracy:</p>
<ul>
<li>shard-tglu-1:       NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/Patchwork_171551v1/shard-tglu-1/igt@i915_pm_rc6_residency@med=
ia-rc6-accuracy.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/d=
rm/i915/kernel/-/issues/16080">i915#16080</a> / <a href=3D"https://gitlab.f=
reedesktop.org/drm/i915/kernel/-/issues/16166">i915#16166</a>)</li>
</ul>
</li>
<li>
<p>igt@i915_pm_rpm@gem-execbuf-stress-pc8:</p>
<ul>
<li>shard-glk:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/Patchwork_171551v1/shard-glk2/igt@i915_pm_rpm@gem-execbuf-str=
ess-pc8.html">SKIP</a> +87 other tests skip</li>
</ul>
</li>
<li>
<p>igt@i915_pm_rpm@system-suspend:</p>
<ul>
<li>shard-rkl:          (<a href=3D"https://intel-gfx-ci.01.org/tree/drm-ti=
p/CI_DRM_18943/shard-rkl-7/igt@i915_pm_rpm@system-suspend.html">PASS</a>, <=
a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18943/shard-rkl-8=
/igt@i915_pm_rpm@system-suspend.html">PASS</a>) -&gt; <a href=3D"https://in=
tel-gfx-ci.01.org/tree/drm-tip/Patchwork_171551v1/shard-rkl-4/igt@i915_pm_r=
pm@system-suspend.html">INCOMPLETE</a> (<a href=3D"https://gitlab.freedeskt=
op.org/drm/i915/kernel/-/issues/13356">i915#13356</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_async_flips@alternate-sync-async-flip-atomic@pipe-a-hdmi-a-2:</p>
<ul>
<li>shard-glk:          (<a href=3D"https://intel-gfx-ci.01.org/tree/drm-ti=
p/CI_DRM_18943/shard-glk6/igt@kms_async_flips@alternate-sync-async-flip-ato=
mic@pipe-a-hdmi-a-2.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/CI_DRM_18943/shard-glk8/igt@kms_async_flips@alternate-sync-asy=
nc-flip-atomic@pipe-a-hdmi-a-2.html">PASS</a>) -&gt; <a href=3D"https://int=
el-gfx-ci.01.org/tree/drm-tip/Patchwork_171551v1/shard-glk2/igt@kms_async_f=
lips@alternate-sync-async-flip-atomic@pipe-a-hdmi-a-2.html">FAIL</a> (<a hr=
ef=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14888">i915#1=
4888</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_atomic@plane-primary-legacy:</p>
<ul>
<li>shard-dg2:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_18943/shard-dg2-8/igt@kms_atomic@plane-primary-legacy.html">PASS</a=
> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_17155=
1v1/shard-dg2-10/igt@kms_atomic@plane-primary-legacy.html">SKIP</a> (<a hre=
f=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16707">i915#16=
707</a>) +9 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@4-tiled-64bpp-rotate-0:</p>
<ul>
<li>shard-tglu-1:       NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/Patchwork_171551v1/shard-tglu-1/igt@kms_big_fb@4-tiled-64bpp-=
rotate-0.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915=
/kernel/-/issues/5286">i915#5286</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@4-tiled-addfb:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/Patchwork_171551v1/shard-rkl-2/igt@kms_big_fb@4-tiled-addfb.h=
tml">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/=
issues/5286">i915#5286</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-0-hflip:</p>
<ul>
<li>shard-dg2:          (<a href=3D"https://intel-gfx-ci.01.org/tree/drm-ti=
p/CI_DRM_18943/shard-dg2-6/igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotat=
e-0-hflip.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/drm-t=
ip/CI_DRM_18943/shard-dg2-1/igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rota=
te-0-hflip.html">PASS</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tre=
e/drm-tip/Patchwork_171551v1/shard-dg2-10/igt@kms_big_fb@4-tiled-max-hw-str=
ide-64bpp-rotate-0-hflip.html">SKIP</a> (<a href=3D"https://gitlab.freedesk=
top.org/drm/i915/kernel/-/issues/16707">i915#16707</a>) +10 other tests ski=
p</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-180-hflip:</p>
<ul>
<li>shard-mtlp:         (<a href=3D"https://intel-gfx-ci.01.org/tree/drm-ti=
p/CI_DRM_18943/shard-mtlp-6/igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rota=
te-180-hflip.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/dr=
m-tip/CI_DRM_18943/shard-mtlp-8/igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-=
rotate-180-hflip.html">PASS</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.o=
rg/tree/drm-tip/Patchwork_171551v1/shard-mtlp-6/igt@kms_big_fb@4-tiled-max-=
hw-stride-64bpp-rotate-180-hflip.html">FAIL</a> (<a href=3D"https://gitlab.=
freedesktop.org/drm/i915/kernel/-/issues/15733">i915#15733</a> / <a href=3D=
"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5138">i915#5138</a=
>) +1 other test fail</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@bad-aux-stride-4-tiled-mtl-mc-ccs@pipe-c-hdmi-a-2:</p>
<ul>
<li>shard-glk11:        NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/Patchwork_171551v1/shard-glk11/igt@kms_ccs@bad-aux-stride-4-t=
iled-mtl-mc-ccs@pipe-c-hdmi-a-2.html">SKIP</a> +47 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@bad-aux-stride-y-tiled-gen12-rc-ccs-cc@pipe-d-hdmi-a-1:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/Patchwork_171551v1/shard-dg2-4/igt@kms_ccs@bad-aux-stride-y-t=
iled-gen12-rc-ccs-cc@pipe-d-hdmi-a-1.html">SKIP</a> (<a href=3D"https://git=
lab.freedesktop.org/drm/i915/kernel/-/issues/10307">i915#10307</a> / <a hre=
f=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/10434">i915#10=
434</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issue=
s/6095">i915#6095</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@bad-rotation-90-4-tiled-mtl-rc-ccs@pipe-b-hdmi-a-2:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/Patchwork_171551v1/shard-rkl-7/igt@kms_ccs@bad-rotation-90-4-=
tiled-mtl-rc-ccs@pipe-b-hdmi-a-2.html">SKIP</a> (<a href=3D"https://gitlab.=
freedesktop.org/drm/i915/kernel/-/issues/6095">i915#6095</a>) +43 other tes=
ts skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-basic-4-tiled-mtl-mc-ccs@pipe-d-hdmi-a-1:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/Patchwork_171551v1/shard-dg2-4/igt@kms_ccs@crc-primary-basic-=
4-tiled-mtl-mc-ccs@pipe-d-hdmi-a-1.html">SKIP</a> (<a href=3D"https://gitla=
b.freedesktop.org/drm/i915/kernel/-/issues/10307">i915#10307</a> / <a href=
=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6095">i915#6095=
</a>) +26 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-suspend-4-tiled-mtl-rc-ccs@pipe-c-hdmi-a-1:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/Patchwork_171551v1/shard-dg2-4/igt@kms_ccs@crc-primary-suspen=
d-4-tiled-mtl-rc-ccs@pipe-c-hdmi-a-1.html">SKIP</a> (<a href=3D"https://git=
lab.freedesktop.org/drm/i915/kernel/-/issues/6095">i915#6095</a>) +3 other =
tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-suspend-yf-tiled-ccs:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/Patchwork_171551v1/shard-rkl-2/igt@kms_ccs@crc-primary-suspen=
d-yf-tiled-ccs.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/dr=
m/i915/kernel/-/issues/14098">i915#14098</a> / <a href=3D"https://gitlab.fr=
eedesktop.org/drm/i915/kernel/-/issues/6095">i915#6095</a>) +24 other tests=
 skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-sprite-planes-basic-4-tiled-mtl-rc-ccs-cc@pipe-a-hdmi-a-=
4:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/Patchwork_171551v1/shard-dg1-19/igt@kms_ccs@crc-sprite-planes=
-basic-4-tiled-mtl-rc-ccs-cc@pipe-a-hdmi-a-4.html">SKIP</a> (<a href=3D"htt=
ps://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6095">i915#6095</a>) +=
51 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-sprite-planes-basic-yf-tiled-ccs@pipe-a-hdmi-a-2:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/Patchwork_171551v1/shard-rkl-6/igt@kms_ccs@crc-sprite-planes-=
basic-yf-tiled-ccs@pipe-a-hdmi-a-2.html">SKIP</a> (<a href=3D"https://gitla=
b.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a> / <a href=
=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6095">i915#6095=
</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-sprite-planes-basic-yf-tiled-ccs@pipe-c-hdmi-a-2:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/Patchwork_171551v1/shard-rkl-6/igt@kms_ccs@crc-sprite-planes-=
basic-yf-tiled-ccs@pipe-c-hdmi-a-2.html">SKIP</a> (<a href=3D"https://gitla=
b.freedesktop.org/drm/i915/kernel/-/issues/14098">i915#14098</a> / <a href=
=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#145=
44</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues=
/6095">i915#6095</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs@pipe-d-hdmi-a-1:</p>
<ul>
<li>shard-tglu-1:       NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/Patchwork_171551v1/shard-tglu-1/igt@kms_ccs@random-ccs-data-4=
-tiled-dg2-rc-ccs@pipe-d-hdmi-a-1.html">SKIP</a> (<a href=3D"https://gitlab=
.freedesktop.org/drm/i915/kernel/-/issues/6095">i915#6095</a>) +19 other te=
sts skip</li>
</ul>
</li>
<li>
<p>igt@kms_cdclk@plane-scaling@pipe-d-hdmi-a-1:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/Patchwork_171551v1/shard-dg2-4/igt@kms_cdclk@plane-scaling@pi=
pe-d-hdmi-a-1.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm=
/i915/kernel/-/issues/13783">i915#13783</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_color_pipeline@plane-lut1d:</p>
<ul>
<li>shard-tglu-1:       NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/Patchwork_171551v1/shard-tglu-1/igt@kms_chamelium_color_pipel=
ine@plane-lut1d.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/d=
rm/i915/kernel/-/issues/16471">i915#16471</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_hpd@hdmi-hpd-enable-disable-mode:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/Patchwork_171551v1/shard-rkl-2/igt@kms_chamelium_hpd@hdmi-hpd=
-enable-disable-mode.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.=
org/drm/i915/kernel/-/issues/11151">i915#11151</a> / <a href=3D"https://git=
lab.freedesktop.org/drm/i915/kernel/-/issues/7828">i915#7828</a>) +1 other =
test skip</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_hpd@hdmi-hpd-storm-disable:</p>
<ul>
<li>shard-tglu-1:       NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/Patchwork_171551v1/shard-tglu-1/igt@kms_chamelium_hpd@hdmi-hp=
d-storm-disable.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/d=
rm/i915/kernel/-/issues/11151">i915#11151</a> / <a href=3D"https://gitlab.f=
reedesktop.org/drm/i915/kernel/-/issues/7828">i915#7828</a>) +1 other test =
skip</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-0-25:</p>
<ul>
<li>shard-dg2:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_18943/shard-dg2-8/igt@kms_color@ctm-0-25.html">PASS</a> -&gt; <a hr=
ef=3D"https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_171551v1/shard-dg2=
-10/igt@kms_color@ctm-0-25.html">SKIP</a> (<a href=3D"https://gitlab.freede=
sktop.org/drm/i915/kernel/-/issues/12655">i915#12655</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-0-75:</p>
<ul>
<li>shard-dg2:          (<a href=3D"https://intel-gfx-ci.01.org/tree/drm-ti=
p/CI_DRM_18943/shard-dg2-1/igt@kms_color@ctm-0-75.html">PASS</a>, <a href=
=3D"https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18943/shard-dg2-6/igt@k=
ms_color@ctm-0-75.html">PASS</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.=
org/tree/drm-tip/Patchwork_171551v1/shard-dg2-10/igt@kms_color@ctm-0-75.htm=
l">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/is=
sues/12655">i915#12655</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@dp-mst-lic-type-0:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/Patchwork_171551v1/shard-rkl-2/igt@kms_content_protection@dp-=
mst-lic-type-0.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/dr=
m/i915/kernel/-/issues/15330">i915#15330</a> / <a href=3D"https://gitlab.fr=
eedesktop.org/drm/i915/kernel/-/issues/3116">i915#3116</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@suspend-resume:</p>
<ul>
<li>shard-tglu-1:       NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/Patchwork_171551v1/shard-tglu-1/igt@kms_content_protection@su=
spend-resume.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/=
i915/kernel/-/issues/15865">i915#15865</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-offscreen-32x10:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/Patchwork_171551v1/shard-rkl-2/igt@kms_cursor_crc@cursor-offs=
creen-32x10.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i=
915/kernel/-/issues/3555">i915#3555</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-onscreen-128x42@pipe-a-hdmi-a-1:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/Patchwork_171551v1/shard-rkl-5/igt@kms_cursor_crc@cursor-onsc=
reen-128x42@pipe-a-hdmi-a-1.html">FAIL</a> (<a href=3D"https://gitlab.freed=
esktop.org/drm/i915/kernel/-/issues/13566">i915#13566</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-onscreen-256x85:</p>
<ul>
<li>shard-tglu:         (<a href=3D"https://intel-gfx-ci.01.org/tree/drm-ti=
p/CI_DRM_18943/shard-tglu-6/igt@kms_cursor_crc@cursor-onscreen-256x85.html"=
>PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18943=
/shard-tglu-9/igt@kms_cursor_crc@cursor-onscreen-256x85.html">PASS</a>) -&g=
t; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_171551v1/s=
hard-tglu-9/igt@kms_cursor_crc@cursor-onscreen-256x85.html">FAIL</a> (<a hr=
ef=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13566">i915#1=
3566</a>) +1 other test fail</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-onscreen-32x10:</p>
<ul>
<li>shard-tglu-1:       NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/Patchwork_171551v1/shard-tglu-1/igt@kms_cursor_crc@cursor-ons=
creen-32x10.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i=
915/kernel/-/issues/3555">i915#3555</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-random-256x85@pipe-a-hdmi-a-1:</p>
<ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_18943/shard-rkl-5/igt@kms_cursor_crc@cursor-random-256x85@pipe-a-hd=
mi-a-1.html">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm=
-tip/Patchwork_171551v1/shard-rkl-8/igt@kms_cursor_crc@cursor-random-256x85=
@pipe-a-hdmi-a-1.html">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/=
drm/i915/kernel/-/issues/13566">i915#13566</a>) +1 other test fail</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-sliding-512x170:</p>
<ul>
<li>shard-tglu-1:       NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/Patchwork_171551v1/shard-tglu-1/igt@kms_cursor_crc@cursor-sli=
ding-512x170.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/=
i915/kernel/-/issues/13049">i915#13049</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_dsc@dsc-fractional-bpp:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/Patchwork_171551v1/shard-rkl-2/igt@kms_dsc@dsc-fractional-bpp=
.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/=
-/issues/16361">i915#16361</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_dsc@dsc-with-output-formats-with-bpc:</p>
<ul>
<li>shard-tglu-1:       NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/Patchwork_171551v1/shard-tglu-1/igt@kms_dsc@dsc-with-output-f=
ormats-with-bpc.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/d=
rm/i915/kernel/-/issues/16361">i915#16361</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-suspend-interruptible:</p>
<ul>
<li>shard-glk11:        NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/Patchwork_171551v1/shard-glk11/igt@kms_flip@2x-flip-vs-suspen=
d-interruptible.html">INCOMPLETE</a> (<a href=3D"https://gitlab.freedesktop=
.org/drm/i915/kernel/-/issues/12745">i915#12745</a> / <a href=3D"https://gi=
tlab.freedesktop.org/drm/i915/kernel/-/issues/4839">i915#4839</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-suspend-interruptible@ac-hdmi-a1-hdmi-a2:</p>
<ul>
<li>shard-glk11:        NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/Patchwork_171551v1/shard-glk11/igt@kms_flip@2x-flip-vs-suspen=
d-interruptible@ac-hdmi-a1-hdmi-a2.html">INCOMPLETE</a> (<a href=3D"https:/=
/gitlab.freedesktop.org/drm/i915/kernel/-/issues/12745">i915#12745</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-plain-flip-fb-recreate-interruptible:</p>
<ul>
<li>shard-tglu-1:       NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/Patchwork_171551v1/shard-tglu-1/igt@kms_flip@2x-plain-flip-fb=
-recreate-interruptible.html">SKIP</a> (<a href=3D"https://gitlab.freedeskt=
op.org/drm/i915/kernel/-/issues/3637">i915#3637</a> / <a href=3D"https://gi=
tlab.freedesktop.org/drm/i915/kernel/-/issues/9934">i915#9934</a>) +1 other=
 test skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip@absolute-wf_vblank:</p>
<ul>
<li>shard-dg2:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_18943/shard-dg2-8/igt@kms_flip@absolute-wf_vblank.html">PASS</a> -&=
gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_171551v1/=
shard-dg2-10/igt@kms_flip@absolute-wf_vblank.html">SKIP</a> (<a href=3D"htt=
ps://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5354">i915#5354</a>) +=
1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-absolute-wf_vblank-interruptible:</p>
<ul>
<li>shard-dg1:          (<a href=3D"https://intel-gfx-ci.01.org/tree/drm-ti=
p/CI_DRM_18943/shard-dg1-19/igt@kms_flip@flip-vs-absolute-wf_vblank-interru=
ptible.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/=
CI_DRM_18943/shard-dg1-14/igt@kms_flip@flip-vs-absolute-wf_vblank-interrupt=
ible.html">PASS</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-=
tip/Patchwork_171551v1/shard-dg1-15/igt@kms_flip@flip-vs-absolute-wf_vblank=
-interruptible.html">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/dr=
m/i915/kernel/-/issues/14600">i915#14600</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-absolute-wf_vblank-interruptible@d-hdmi-a1:</p>
<ul>
<li>shard-dg1:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_18943/shard-dg1-14/igt@kms_flip@flip-vs-absolute-wf_vblank-interrup=
tible@d-hdmi-a1.html">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/Patchwork_171551v1/shard-dg1-15/igt@kms_flip@flip-vs-absolute=
-wf_vblank-interruptible@d-hdmi-a1.html">FAIL</a> (<a href=3D"https://gitla=
b.freedesktop.org/drm/i915/kernel/-/issues/14600">i915#14600</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-dpms-on-nop:</p>
<ul>
<li>shard-dg2:          (<a href=3D"https://intel-gfx-ci.01.org/tree/drm-ti=
p/CI_DRM_18943/shard-dg2-1/igt@kms_flip@flip-vs-dpms-on-nop.html">PASS</a>,=
 <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18943/shard-dg2=
-6/igt@kms_flip@flip-vs-dpms-on-nop.html">PASS</a>) -&gt; <a href=3D"https:=
//intel-gfx-ci.01.org/tree/drm-tip/Patchwork_171551v1/shard-dg2-10/igt@kms_=
flip@flip-vs-dpms-on-nop.html">SKIP</a> (<a href=3D"https://gitlab.freedesk=
top.org/drm/i915/kernel/-/issues/16724">i915#16724</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-expired-vblank-interruptible:</p>
<ul>
<li>shard-rkl:          (<a href=3D"https://intel-gfx-ci.01.org/tree/drm-ti=
p/CI_DRM_18943/shard-rkl-1/igt@kms_flip@flip-vs-expired-vblank-interruptibl=
e.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/CI_DR=
M_18943/shard-rkl-3/igt@kms_flip@flip-vs-expired-vblank-interruptible.html"=
>PASS</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/Patchw=
ork_171551v1/shard-rkl-3/igt@kms_flip@flip-vs-expired-vblank-interruptible.=
html">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-=
/issues/13027">i915#13027</a>) +1 other test fail</li>
</ul>
</li>
<li>
<p>igt@kms_flip@plain-flip-interruptible:</p>
<ul>
<li>shard-dg2:          (<a href=3D"https://intel-gfx-ci.01.org/tree/drm-ti=
p/CI_DRM_18943/shard-dg2-1/igt@kms_flip@plain-flip-interruptible.html">PASS=
</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18943/shar=
d-dg2-6/igt@kms_flip@plain-flip-interruptible.html">PASS</a>) -&gt; <a href=
=3D"https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_171551v1/shard-dg2-1=
0/igt@kms_flip@plain-flip-interruptible.html">SKIP</a> (<a href=3D"https://=
gitlab.freedesktop.org/drm/i915/kernel/-/issues/5354">i915#5354</a>) +2 oth=
er tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip@plain-flip-ts-check@c-hdmi-a3:</p>
<ul>
<li>shard-dg2:          (<a href=3D"https://intel-gfx-ci.01.org/tree/drm-ti=
p/CI_DRM_18943/shard-dg2-3/igt@kms_flip@plain-flip-ts-check@c-hdmi-a3.html"=
>PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18943=
/shard-dg2-5/igt@kms_flip@plain-flip-ts-check@c-hdmi-a3.html">PASS</a>) -&g=
t; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_171551v1/s=
hard-dg2-8/igt@kms_flip@plain-flip-ts-check@c-hdmi-a3.html">FAIL</a> (<a hr=
ef=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14600">i915#1=
4600</a>) +1 other test fail</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-32bpp-4tile-to-64bpp-4tile-downscaling:</p>
<ul>
<li>shard-tglu-1:       NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/Patchwork_171551v1/shard-tglu-1/igt@kms_flip_scaled_crc@flip-=
32bpp-4tile-to-64bpp-4tile-downscaling.html">SKIP</a> (<a href=3D"https://g=
itlab.freedesktop.org/drm/i915/kernel/-/issues/15643">i915#15643</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-32bpp-xtile-to-64bpp-xtile-downscaling:</p>
<ul>
<li>shard-dg2:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_18943/shard-dg2-8/igt@kms_flip_scaled_crc@flip-32bpp-xtile-to-64bpp=
-xtile-downscaling.html">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.=
org/tree/drm-tip/Patchwork_171551v1/shard-dg2-10/igt@kms_flip_scaled_crc@fl=
ip-32bpp-xtile-to-64bpp-xtile-downscaling.html">SKIP</a> (<a href=3D"https:=
//gitlab.freedesktop.org/drm/i915/kernel/-/issues/3555">i915#3555</a> / <a =
href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8813">i915#=
8813</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-16bpp-4tile-downscaling:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/Patchwork_171551v1/shard-rkl-2/igt@kms_flip_scaled_crc@flip-6=
4bpp-4tile-to-16bpp-4tile-downscaling.html">SKIP</a> (<a href=3D"https://gi=
tlab.freedesktop.org/drm/i915/kernel/-/issues/15643">i915#15643</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-1p-offscreen-pri-indfb-draw-render:</p>
<ul>
<li>shard-dg2:          (<a href=3D"https://intel-gfx-ci.01.org/tree/drm-ti=
p/CI_DRM_18943/shard-dg2-6/igt@kms_frontbuffer_tracking@fbc-1p-offscreen-pr=
i-indfb-draw-render.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/CI_DRM_18943/shard-dg2-1/igt@kms_frontbuffer_tracking@fbc-1p-o=
ffscreen-pri-indfb-draw-render.html">PASS</a>) -&gt; <a href=3D"https://int=
el-gfx-ci.01.org/tree/drm-tip/Patchwork_171551v1/shard-dg2-10/igt@kms_front=
buffer_tracking@fbc-1p-offscreen-pri-indfb-draw-render.html">SKIP</a> (<a h=
ref=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16708">i915#=
16708</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-1p-primscrn-cur-indfb-move:</p>
<ul>
<li>shard-dg2:          (<a href=3D"https://intel-gfx-ci.01.org/tree/drm-ti=
p/CI_DRM_18943/shard-dg2-6/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-cur=
-indfb-move.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/drm=
-tip/CI_DRM_18943/shard-dg2-1/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-=
cur-indfb-move.html">PASS</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/Patchwork_171551v1/shard-dg2-10/igt@kms_frontbuffer_tracking@=
fbc-1p-primscrn-cur-indfb-move.html">SKIP</a> (<a href=3D"https://gitlab.fr=
eedesktop.org/drm/i915/kernel/-/issues/16708">i915#16708</a> / <a href=3D"h=
ttps://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5354">i915#5354</a>)=
</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbchdr-1p-primscrn-pri-indfb-draw-mmap-gtt:=
</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/Patchwork_171551v1/shard-rkl-2/igt@kms_frontbuffer_tracking@f=
bchdr-1p-primscrn-pri-indfb-draw-mmap-gtt.html">SKIP</a> (<a href=3D"https:=
//gitlab.freedesktop.org/drm/i915/kernel/-/issues/15989">i915#15989</a>) +2=
 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbchdr-tiling-linear:</p>
<ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_18943/shard-rkl-1/igt@kms_frontbuffer_tracking@fbchdr-tiling-linear=
.html">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/P=
atchwork_171551v1/shard-rkl-4/igt@kms_frontbuffer_tracking@fbchdr-tiling-li=
near.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/ker=
nel/-/issues/15989">i915#15989</a>) +5 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-spr-indfb-onoff:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/Patchwork_171551v1/shard-rkl-2/igt@kms_frontbuffer_tracking@f=
bcpsr-1p-primscrn-spr-indfb-onoff.html">SKIP</a> (<a href=3D"https://gitlab=
.freedesktop.org/drm/i915/kernel/-/issues/15102">i915#15102</a> / <a href=
=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3023">i915#3023=
</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-pri-shrfb-draw-pwrite:</=
p>
<ul>
<li>shard-tglu-1:       NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/Patchwork_171551v1/shard-tglu-1/igt@kms_frontbuffer_tracking@=
fbcpsr-2p-primscrn-pri-shrfb-draw-pwrite.html">SKIP</a> +27 other tests ski=
p</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsrhdr-1p-primscrn-cur-indfb-move:</p>
<ul>
<li>shard-tglu-1:       NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/Patchwork_171551v1/shard-tglu-1/igt@kms_frontbuffer_tracking@=
fbcpsrhdr-1p-primscrn-cur-indfb-move.html">SKIP</a> (<a href=3D"https://git=
lab.freedesktop.org/drm/i915/kernel/-/issues/15102">i915#15102</a>) +12 oth=
er tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@hdr-1p-offscreen-pri-indfb-draw-pwrite:</p>
<ul>
<li>shard-rkl:          (<a href=3D"https://intel-gfx-ci.01.org/tree/drm-ti=
p/CI_DRM_18943/shard-rkl-1/igt@kms_frontbuffer_tracking@hdr-1p-offscreen-pr=
i-indfb-draw-pwrite.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/CI_DRM_18943/shard-rkl-6/igt@kms_frontbuffer_tracking@hdr-1p-o=
ffscreen-pri-indfb-draw-pwrite.html">PASS</a>) -&gt; <a href=3D"https://int=
el-gfx-ci.01.org/tree/drm-tip/Patchwork_171551v1/shard-rkl-2/igt@kms_frontb=
uffer_tracking@hdr-1p-offscreen-pri-indfb-draw-pwrite.html">SKIP</a> (<a hr=
ef=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15989">i915#1=
5989</a>) +3 other tests skip</li>
<li>shard-tglu-1:       NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/Patchwork_171551v1/shard-tglu-1/igt@kms_frontbuffer_tracking@=
hdr-1p-offscreen-pri-indfb-draw-pwrite.html">SKIP</a> (<a href=3D"https://g=
itlab.freedesktop.org/drm/i915/kernel/-/issues/15989">i915#15989</a>) +3 ot=
her tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@hdr-2p-scndscrn-indfb-pgflip-blt:</p>
<ul>
<li>shard-glk:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_18943/shard-glk8/igt@kms_frontbuffer_tracking@hdr-2p-scndscrn-indfb=
-pgflip-blt.html">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tre=
e/drm-tip/Patchwork_171551v1/shard-glk4/igt@kms_frontbuffer_tracking@hdr-2p=
-scndscrn-indfb-pgflip-blt.html">SKIP</a> +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@pipe-fbc-rte:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/Patchwork_171551v1/shard-rkl-2/igt@kms_frontbuffer_tracking@p=
ipe-fbc-rte.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i=
915/kernel/-/issues/9766">i915#9766</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psrhdr-1p-offscreen-pri-indfb-draw-mmap-cpu=
:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/Patchwork_171551v1/shard-rkl-2/igt@kms_frontbuffer_tracking@p=
srhdr-1p-offscreen-pri-indfb-draw-mmap-cpu.html">SKIP</a> (<a href=3D"https=
://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15102">i915#15102</a>) +=
5 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psrhdr-2p-scndscrn-pri-shrfb-draw-blt:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/Patchwork_171551v1/shard-rkl-2/igt@kms_frontbuffer_tracking@p=
srhdr-2p-scndscrn-pri-shrfb-draw-blt.html">SKIP</a> +11 other tests skip</l=
i>
</ul>
</li>
<li>
<p>igt@kms_hdr@static-toggle-dpms:</p>
<ul>
<li>shard-rkl:          (<a href=3D"https://intel-gfx-ci.01.org/tree/drm-ti=
p/CI_DRM_18943/shard-rkl-1/igt@kms_hdr@static-toggle-dpms.html">PASS</a>, <=
a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18943/shard-rkl-6=
/igt@kms_hdr@static-toggle-dpms.html">PASS</a>) -&gt; <a href=3D"https://in=
tel-gfx-ci.01.org/tree/drm-tip/Patchwork_171551v1/shard-rkl-2/igt@kms_hdr@s=
tatic-toggle-dpms.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org=
/drm/i915/kernel/-/issues/16644">i915#16644</a> / <a href=3D"https://gitlab=
.freedesktop.org/drm/i915/kernel/-/issues/3555">i915#3555</a> / <a href=3D"=
https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8228">i915#8228</a>=
)</li>
<li>shard-tglu-1:       NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/Patchwork_171551v1/shard-tglu-1/igt@kms_hdr@static-toggle-dpm=
s.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel=
/-/issues/3555">i915#3555</a> / <a href=3D"https://gitlab.freedesktop.org/d=
rm/i915/kernel/-/issues/8228">i915#8228</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_hdr@static-toggle-suspend:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/Patchwork_171551v1/shard-rkl-2/igt@kms_hdr@static-toggle-susp=
end.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kern=
el/-/issues/16644">i915#16644</a> / <a href=3D"https://gitlab.freedesktop.o=
rg/drm/i915/kernel/-/issues/3555">i915#3555</a> / <a href=3D"https://gitlab=
.freedesktop.org/drm/i915/kernel/-/issues/8228">i915#8228</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_invalid_mode@clock-too-high:</p>
<ul>
<li>shard-dg2:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_18943/shard-dg2-8/igt@kms_invalid_mode@clock-too-high.html">PASS</a=
> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_17155=
1v1/shard-dg2-10/igt@kms_invalid_mode@clock-too-high.html">SKIP</a> (<a hre=
f=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16746">i915#16=
746</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issue=
s/3555">i915#3555</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pipe_crc_basic@nonblocking-crc-frame-sequence:</p>
<ul>
<li>shard-dg2:          (<a href=3D"https://intel-gfx-ci.01.org/tree/drm-ti=
p/CI_DRM_18943/shard-dg2-1/igt@kms_pipe_crc_basic@nonblocking-crc-frame-seq=
uence.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/C=
I_DRM_18943/shard-dg2-6/igt@kms_pipe_crc_basic@nonblocking-crc-frame-sequen=
ce.html">PASS</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-ti=
p/Patchwork_171551v1/shard-dg2-10/igt@kms_pipe_crc_basic@nonblocking-crc-fr=
ame-sequence.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/=
i915/kernel/-/issues/11190">i915#11190</a> / <a href=3D"https://gitlab.free=
desktop.org/drm/i915/kernel/-/issues/16707">i915#16707</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane@pixel-format-4-tiled-lnl-ccs-modifier-source-clamping:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/Patchwork_171551v1/shard-rkl-2/igt@kms_plane@pixel-format-4-t=
iled-lnl-ccs-modifier-source-clamping.html">SKIP</a> (<a href=3D"https://gi=
tlab.freedesktop.org/drm/i915/kernel/-/issues/15709">i915#15709</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane@pixel-format-y-tiled-ccs-modifier:</p>
<ul>
<li>shard-tglu-1:       NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/Patchwork_171551v1/shard-tglu-1/igt@kms_plane@pixel-format-y-=
tiled-ccs-modifier.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.or=
g/drm/i915/kernel/-/issues/15709">i915#15709</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane@pixel-format-y-tiled-gen12-rc-ccs-modifier@pipe-a-plane-7:=
</p>
<ul>
<li>shard-tglu-1:       NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/Patchwork_171551v1/shard-tglu-1/igt@kms_plane@pixel-format-y-=
tiled-gen12-rc-ccs-modifier@pipe-a-plane-7.html">SKIP</a> (<a href=3D"https=
://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16386">i915#16386</a>) +=
1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_plane_multiple@2x-tiling-x:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/Patchwork_171551v1/shard-rkl-2/igt@kms_plane_multiple@2x-tili=
ng-x.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/ker=
nel/-/issues/13958">i915#13958</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@invalid-num-scalers:</p>
<ul>
<li>shard-dg2:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_18943/shard-dg2-8/igt@kms_plane_scaling@invalid-num-scalers.html">P=
ASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork=
_171551v1/shard-dg2-10/igt@kms_plane_scaling@invalid-num-scalers.html">SKIP=
</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/35=
55">i915#3555</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i915/kern=
el/-/issues/6953">i915#6953</a> / <a href=3D"https://gitlab.freedesktop.org=
/drm/i915/kernel/-/issues/9423">i915#9423</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-scaler-unity-scaling-with-pixel-format:</p>
<ul>
<li>shard-dg2:          (<a href=3D"https://intel-gfx-ci.01.org/tree/drm-ti=
p/CI_DRM_18943/shard-dg2-1/igt@kms_plane_scaling@plane-scaler-unity-scaling=
-with-pixel-format.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/t=
ree/drm-tip/CI_DRM_18943/shard-dg2-6/igt@kms_plane_scaling@plane-scaler-uni=
ty-scaling-with-pixel-format.html">PASS</a>) -&gt; <a href=3D"https://intel=
-gfx-ci.01.org/tree/drm-tip/Patchwork_171551v1/shard-dg2-10/igt@kms_plane_s=
caling@plane-scaler-unity-scaling-with-pixel-format.html">SKIP</a> (<a href=
=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15329">i915#153=
29</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues=
/9423">i915#9423</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-scaler-with-clipping-clamping-modifiers:</p>
<ul>
<li>shard-dg2:          (<a href=3D"https://intel-gfx-ci.01.org/tree/drm-ti=
p/CI_DRM_18943/shard-dg2-1/igt@kms_plane_scaling@plane-scaler-with-clipping=
-clamping-modifiers.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/CI_DRM_18943/shard-dg2-6/igt@kms_plane_scaling@plane-scaler-wi=
th-clipping-clamping-modifiers.html">PASS</a>) -&gt; <a href=3D"https://int=
el-gfx-ci.01.org/tree/drm-tip/Patchwork_171551v1/shard-dg2-10/igt@kms_plane=
_scaling@plane-scaler-with-clipping-clamping-modifiers.html">SKIP</a> (<a h=
ref=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15329">i915#=
15329</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/iss=
ues/3555">i915#3555</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i91=
5/kernel/-/issues/9423">i915#9423</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-scaler-with-clipping-clamping-modifiers@pipe=
-b:</p>
<ul>
<li>shard-dg2:          (<a href=3D"https://intel-gfx-ci.01.org/tree/drm-ti=
p/CI_DRM_18943/shard-dg2-1/igt@kms_plane_scaling@plane-scaler-with-clipping=
-clamping-modifiers@pipe-b.html">PASS</a>, <a href=3D"https://intel-gfx-ci.=
01.org/tree/drm-tip/CI_DRM_18943/shard-dg2-6/igt@kms_plane_scaling@plane-sc=
aler-with-clipping-clamping-modifiers@pipe-b.html">PASS</a>) -&gt; <a href=
=3D"https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_171551v1/shard-dg2-1=
0/igt@kms_plane_scaling@plane-scaler-with-clipping-clamping-modifiers@pipe-=
b.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel=
/-/issues/15329">i915#15329</a>) +7 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@planes-unity-scaling-downscale-factor-0-5:</p>
<ul>
<li>shard-dg2:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_18943/shard-dg2-8/igt@kms_plane_scaling@planes-unity-scaling-downsc=
ale-factor-0-5.html">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/Patchwork_171551v1/shard-dg2-10/igt@kms_plane_scaling@planes-u=
nity-scaling-downscale-factor-0-5.html">SKIP</a> (<a href=3D"https://gitlab=
.freedesktop.org/drm/i915/kernel/-/issues/15329">i915#15329</a> / <a href=
=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6953">i915#6953=
</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9=
423">i915#9423</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@planes-unity-scaling-downscale-factor-0-5@pipe-b:<=
/p>
<ul>
<li>shard-dg2:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_18943/shard-dg2-8/igt@kms_plane_scaling@planes-unity-scaling-downsc=
ale-factor-0-5@pipe-b.html">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.=
01.org/tree/drm-tip/Patchwork_171551v1/shard-dg2-10/igt@kms_plane_scaling@p=
lanes-unity-scaling-downscale-factor-0-5@pipe-b.html">SKIP</a> (<a href=3D"=
https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15329">i915#15329</=
a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_pm_rpm@dpms-mode-unset-non-lpsp:</p>
<ul>
<li>shard-dg2:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_18943/shard-dg2-8/igt@kms_pm_rpm@dpms-mode-unset-non-lpsp.html">PAS=
S</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_1=
71551v1/shard-dg2-10/igt@kms_pm_rpm@dpms-mode-unset-non-lpsp.html">SKIP</a>=
 (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15073"=
>i915#15073</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_pm_rpm@modeset-non-lpsp-stress-no-wait:</p>
<ul>
<li>shard-rkl:          (<a href=3D"https://intel-gfx-ci.01.org/tree/drm-ti=
p/CI_DRM_18943/shard-rkl-3/igt@kms_pm_rpm@modeset-non-lpsp-stress-no-wait.h=
tml">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_1=
8943/shard-rkl-6/igt@kms_pm_rpm@modeset-non-lpsp-stress-no-wait.html">PASS<=
/a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_17=
1551v1/shard-rkl-5/igt@kms_pm_rpm@modeset-non-lpsp-stress-no-wait.html">SKI=
P</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/1=
5073">i915#15073</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@fbc-psr2-overlay-plane-move-continuous-exceed-fully-sf:<=
/p>
<ul>
<li>shard-glk10:        NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/Patchwork_171551v1/shard-glk10/igt@kms_psr2_sf@fbc-psr2-overl=
ay-plane-move-continuous-exceed-fully-sf.html">SKIP</a> (<a href=3D"https:/=
/gitlab.freedesktop.org/drm/i915/kernel/-/issues/11520">i915#11520</a>) +4 =
other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@fbc-psr2-overlay-primary-update-sf-dmg-area:</p>
<ul>
<li>shard-glk11:        NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/Patchwork_171551v1/shard-glk11/igt@kms_psr2_sf@fbc-psr2-overl=
ay-primary-update-sf-dmg-area.html">SKIP</a> (<a href=3D"https://gitlab.fre=
edesktop.org/drm/i915/kernel/-/issues/11520">i915#11520</a>) +1 other test =
skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@fbc-psr2-plane-move-sf-dmg-area:</p>
<ul>
<li>shard-tglu-1:       NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/Patchwork_171551v1/shard-tglu-1/igt@kms_psr2_sf@fbc-psr2-plan=
e-move-sf-dmg-area.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.or=
g/drm/i915/kernel/-/issues/11520">i915#11520</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@fbc-psr2-primary-plane-update-sf-dmg-area:</p>
<ul>
<li>shard-glk:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/Patchwork_171551v1/shard-glk2/igt@kms_psr2_sf@fbc-psr2-primar=
y-plane-update-sf-dmg-area.html">SKIP</a> (<a href=3D"https://gitlab.freede=
sktop.org/drm/i915/kernel/-/issues/11520">i915#11520</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@psr2-cursor-plane-move-continuous-sf:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/Patchwork_171551v1/shard-rkl-2/igt@kms_psr2_sf@psr2-cursor-pl=
ane-move-continuous-sf.html">SKIP</a> (<a href=3D"https://gitlab.freedeskto=
p.org/drm/i915/kernel/-/issues/11520">i915#11520</a>) +1 other test skip</l=
i>
</ul>
</li>
<li>
<p>igt@kms_psr2_su@page_flip-p010:</p>
<ul>
<li>shard-tglu-1:       NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/Patchwork_171551v1/shard-tglu-1/igt@kms_psr2_su@page_flip-p01=
0.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel=
/-/issues/9683">i915#9683</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr@fbc-psr-primary-page-flip:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/Patchwork_171551v1/shard-rkl-2/igt@kms_psr@fbc-psr-primary-pa=
ge-flip.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/=
kernel/-/issues/1072">i915#1072</a> / <a href=3D"https://gitlab.freedesktop=
.org/drm/i915/kernel/-/issues/9732">i915#9732</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr@psr-no-drrs:</p>
<ul>
<li>shard-tglu-1:       NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/Patchwork_171551v1/shard-tglu-1/igt@kms_psr@psr-no-drrs.html"=
>SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issu=
es/9732">i915#9732</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_vblank@ts-continuation-suspend@pipe-a-hdmi-a-2:</p>
<ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_18943/shard-rkl-7/igt@kms_vblank@ts-continuation-suspend@pipe-a-hdm=
i-a-2.html">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-=
tip/Patchwork_171551v1/shard-rkl-6/igt@kms_vblank@ts-continuation-suspend@p=
ipe-a-hdmi-a-2.html">INCOMPLETE</a> (<a href=3D"https://gitlab.freedesktop.=
org/drm/i915/kernel/-/issues/12276">i915#12276</a>) +1 other test incomplet=
e</li>
</ul>
</li>
<li>
<p>igt@kms_vrr@seamless-rr-switch-virtual:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/Patchwork_171551v1/shard-rkl-2/igt@kms_vrr@seamless-rr-switch=
-virtual.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915=
/kernel/-/issues/9906">i915#9906</a>)</li>
</ul>
</li>
<li>
<p>igt@prime_mmap_kms@buffer-sharing:</p>
<ul>
<li>shard-dg2:          (<a href=3D"https://intel-gfx-ci.01.org/tree/drm-ti=
p/CI_DRM_18943/shard-dg2-1/igt@prime_mmap_kms@buffer-sharing.html">PASS</a>=
, <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18943/shard-dg=
2-6/igt@prime_mmap_kms@buffer-sharing.html">PASS</a>) -&gt; <a href=3D"http=
s://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_171551v1/shard-dg2-10/igt@pr=
ime_mmap_kms@buffer-sharing.html">SKIP</a></li>
</ul>
</li>
</ul>
<h4>Possible fixes</h4>
<ul>
<li>
<p>igt@fbdev@unaligned-read:</p>
<ul>
<li>shard-dg2:          (<a href=3D"https://intel-gfx-ci.01.org/tree/drm-ti=
p/CI_DRM_18943/shard-dg2-10/igt@fbdev@unaligned-read.html">SKIP</a>, <a hre=
f=3D"https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18943/shard-dg2-3/igt@=
fbdev@unaligned-read.html">PASS</a>) (<a href=3D"https://gitlab.freedesktop=
.org/drm/i915/kernel/-/issues/2582">i915#2582</a>) -&gt; <a href=3D"https:/=
/intel-gfx-ci.01.org/tree/drm-tip/Patchwork_171551v1/shard-dg2-7/igt@fbdev@=
unaligned-read.html">PASS</a> +2 other tests pass</li>
</ul>
</li>
<li>
<p>igt@gem_ccs@suspend-resume@linear-compressed-compfmt0-smem-lmem0:</p>
<ul>
<li>shard-dg2:          (<a href=3D"https://intel-gfx-ci.01.org/tree/drm-ti=
p/CI_DRM_18943/shard-dg2-4/igt@gem_ccs@suspend-resume@linear-compressed-com=
pfmt0-smem-lmem0.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tre=
e/drm-tip/CI_DRM_18943/shard-dg2-6/igt@gem_ccs@suspend-resume@linear-compre=
ssed-compfmt0-smem-lmem0.html">INCOMPLETE</a>) (<a href=3D"https://gitlab.f=
reedesktop.org/drm/i915/kernel/-/issues/13356">i915#13356</a> / <a href=3D"=
https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16348">i915#16348</=
a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_171=
551v1/shard-dg2-6/igt@gem_ccs@suspend-resume@linear-compressed-compfmt0-sme=
m-lmem0.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@gem_ccs@suspend-resume@xmajor-compressed-compfmt0-smem-lmem0:</p>
<ul>
<li>shard-dg2:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_18943/shard-dg2-4/igt@gem_ccs@suspend-resume@xmajor-compressed-comp=
fmt0-smem-lmem0.html">INCOMPLETE</a> (<a href=3D"https://gitlab.freedesktop=
.org/drm/i915/kernel/-/issues/13356">i915#13356</a> / <a href=3D"https://gi=
tlab.freedesktop.org/drm/i915/kernel/-/issues/16348">i915#16348</a>) -&gt; =
<a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_171551v1/shar=
d-dg2-6/igt@gem_ccs@suspend-resume@xmajor-compressed-compfmt0-smem-lmem0.ht=
ml">PASS</a></li>
</ul>
</li>
<li>
<p>igt@gem_eio@hibernate:</p>
<ul>
<li>shard-dg1:          (<a href=3D"https://intel-gfx-ci.01.org/tree/drm-ti=
p/CI_DRM_18943/shard-dg1-19/igt@gem_eio@hibernate.html">PASS</a>, <a href=
=3D"https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18943/shard-dg1-13/igt@=
gem_eio@hibernate.html">DMESG-WARN</a>) (<a href=3D"https://gitlab.freedesk=
top.org/drm/i915/kernel/-/issues/4391">i915#4391</a> / <a href=3D"https://g=
itlab.freedesktop.org/drm/i915/kernel/-/issues/4423">i915#4423</a>) -&gt; <=
a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_171551v1/shard=
-dg1-12/igt@gem_eio@hibernate.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@i915_suspend@fence-restore-untiled:</p>
<ul>
<li>shard-rkl:          (<a href=3D"https://intel-gfx-ci.01.org/tree/drm-ti=
p/CI_DRM_18943/shard-rkl-3/igt@i915_suspend@fence-restore-untiled.html">INC=
OMPLETE</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_189=
43/shard-rkl-6/igt@i915_suspend@fence-restore-untiled.html">INCOMPLETE</a>)=
 (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4817">=
i915#4817</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/Pa=
tchwork_171551v1/shard-rkl-2/igt@i915_suspend@fence-restore-untiled.html">P=
ASS</a></li>
</ul>
</li>
<li>
<p>igt@i915_suspend@sysfs-reader:</p>
<ul>
<li>shard-rkl:          (<a href=3D"https://intel-gfx-ci.01.org/tree/drm-ti=
p/CI_DRM_18943/shard-rkl-3/igt@i915_suspend@sysfs-reader.html">PASS</a>, <a=
 href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18943/shard-rkl-6/=
igt@i915_suspend@sysfs-reader.html">INCOMPLETE</a>) (<a href=3D"https://git=
lab.freedesktop.org/drm/i915/kernel/-/issues/4817">i915#4817</a>) -&gt; <a =
href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_171551v1/shard-r=
kl-3/igt@i915_suspend@sysfs-reader.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_async_flips@alternate-sync-async-flip-atomic@pipe-a-hdmi-a-1:</p>
<ul>
<li>shard-glk:          (<a href=3D"https://intel-gfx-ci.01.org/tree/drm-ti=
p/CI_DRM_18943/shard-glk8/igt@kms_async_flips@alternate-sync-async-flip-ato=
mic@pipe-a-hdmi-a-1.html">FAIL</a>, <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/CI_DRM_18943/shard-glk6/igt@kms_async_flips@alternate-sync-asy=
nc-flip-atomic@pipe-a-hdmi-a-1.html">PASS</a>) (<a href=3D"https://gitlab.f=
reedesktop.org/drm/i915/kernel/-/issues/14888">i915#14888</a>) -&gt; <a hre=
f=3D"https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_171551v1/shard-glk2=
/igt@kms_async_flips@alternate-sync-async-flip-atomic@pipe-a-hdmi-a-1.html"=
>PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_atomic_transition@plane-all-modeset-transition-fencing:</p>
<ul>
<li>shard-tglu:         (<a href=3D"https://intel-gfx-ci.01.org/tree/drm-ti=
p/CI_DRM_18943/shard-tglu-8/igt@kms_atomic_transition@plane-all-modeset-tra=
nsition-fencing.html">FAIL</a>, <a href=3D"https://intel-gfx-ci.01.org/tree=
/drm-tip/CI_DRM_18943/shard-tglu-3/igt@kms_atomic_transition@plane-all-mode=
set-transition-fencing.html">PASS</a>) (<a href=3D"https://gitlab.freedeskt=
op.org/drm/i915/kernel/-/issues/15662">i915#15662</a>) -&gt; <a href=3D"htt=
ps://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_171551v1/shard-tglu-5/igt@k=
ms_atomic_transition@plane-all-modeset-transition-fencing.html">PASS</a> +1=
 other test pass</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@x-tiled-max-hw-stride-64bpp-rotate-0-hflip-async-flip:</p>
<ul>
<li>shard-mtlp:         (<a href=3D"https://intel-gfx-ci.01.org/tree/drm-ti=
p/CI_DRM_18943/shard-mtlp-8/igt@kms_big_fb@x-tiled-max-hw-stride-64bpp-rota=
te-0-hflip-async-flip.html">DMESG-WARN</a>, <a href=3D"https://intel-gfx-ci=
.01.org/tree/drm-tip/CI_DRM_18943/shard-mtlp-7/igt@kms_big_fb@x-tiled-max-h=
w-stride-64bpp-rotate-0-hflip-async-flip.html">PASS</a>) (<a href=3D"https:=
//gitlab.freedesktop.org/drm/i915/kernel/-/issues/12935">i915#12935</a>) -&=
gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_171551v1/=
shard-mtlp-7/igt@kms_big_fb@x-tiled-max-hw-stride-64bpp-rotate-0-hflip-asyn=
c-flip.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-suspend-y-tiled-gen12-rc-ccs:</p>
<ul>
<li>shard-rkl:          (<a href=3D"https://intel-gfx-ci.01.org/tree/drm-ti=
p/CI_DRM_18943/shard-rkl-6/igt@kms_ccs@crc-primary-suspend-y-tiled-gen12-rc=
-ccs.html">INCOMPLETE</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/drm-=
tip/CI_DRM_18943/shard-rkl-3/igt@kms_ccs@crc-primary-suspend-y-tiled-gen12-=
rc-ccs.html">INCOMPLETE</a>) (<a href=3D"https://gitlab.freedesktop.org/drm=
/i915/kernel/-/issues/14694">i915#14694</a> / <a href=3D"https://gitlab.fre=
edesktop.org/drm/i915/kernel/-/issues/15582">i915#15582</a>) -&gt; <a href=
=3D"https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_171551v1/shard-rkl-5=
/igt@kms_ccs@crc-primary-suspend-y-tiled-gen12-rc-ccs.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-max:</p>
<ul>
<li>shard-dg2:          (<a href=3D"https://intel-gfx-ci.01.org/tree/drm-ti=
p/CI_DRM_18943/shard-dg2-10/igt@kms_color@ctm-max.html">SKIP</a>, <a href=
=3D"https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18943/shard-dg2-1/igt@k=
ms_color@ctm-max.html">PASS</a>) (<a href=3D"https://gitlab.freedesktop.org=
/drm/i915/kernel/-/issues/12655">i915#12655</a>) -&gt; <a href=3D"https://i=
ntel-gfx-ci.01.org/tree/drm-tip/Patchwork_171551v1/shard-dg2-3/igt@kms_colo=
r@ctm-max.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@kms_color_pipeline@plane-lut1d-ctm3x4:</p>
<ul>
<li>shard-dg2:          (<a href=3D"https://intel-gfx-ci.01.org/tree/drm-ti=
p/CI_DRM_18943/shard-dg2-10/igt@kms_color_pipeline@plane-lut1d-ctm3x4.html"=
>SKIP</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18943=
/shard-dg2-1/igt@kms_color_pipeline@plane-lut1d-ctm3x4.html">PASS</a>) (<a =
href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15529">i915=
#15529</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/Patch=
work_171551v1/shard-dg2-3/igt@kms_color_pipeline@plane-lut1d-ctm3x4.html">P=
ASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-random-256x85@pipe-a-hdmi-a-1:</p>
<ul>
<li>shard-tglu-1:       <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_18943/shard-tglu-1/igt@kms_cursor_crc@cursor-random-256x85@pipe-a-h=
dmi-a-1.html">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/=
kernel/-/issues/13566">i915#13566</a>) -&gt; <a href=3D"https://intel-gfx-c=
i.01.org/tree/drm-tip/Patchwork_171551v1/shard-tglu-1/igt@kms_cursor_crc@cu=
rsor-random-256x85@pipe-a-hdmi-a-1.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-sliding-256x85:</p>
<ul>
<li>shard-rkl:          (<a href=3D"https://intel-gfx-ci.01.org/tree/drm-ti=
p/CI_DRM_18943/shard-rkl-3/igt@kms_cursor_crc@cursor-sliding-256x85.html">P=
ASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18943/s=
hard-rkl-1/igt@kms_cursor_crc@cursor-sliding-256x85.html">FAIL</a>) (<a hre=
f=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13566">i915#13=
566</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/Patchwor=
k_171551v1/shard-rkl-3/igt@kms_cursor_crc@cursor-sliding-256x85.html">PASS<=
/a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@kms_fb_coherency@memset-crc:</p>
<ul>
<li>shard-dg2:          (<a href=3D"https://intel-gfx-ci.01.org/tree/drm-ti=
p/CI_DRM_18943/shard-dg2-1/igt@kms_fb_coherency@memset-crc.html">PASS</a>, =
<a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18943/shard-dg2-=
10/igt@kms_fb_coherency@memset-crc.html">SKIP</a>) -&gt; <a href=3D"https:/=
/intel-gfx-ci.01.org/tree/drm-tip/Patchwork_171551v1/shard-dg2-3/igt@kms_fb=
_coherency@memset-crc.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_feature_discovery@hdr:</p>
<ul>
<li>shard-rkl:          (<a href=3D"https://intel-gfx-ci.01.org/tree/drm-ti=
p/CI_DRM_18943/shard-rkl-5/igt@kms_feature_discovery@hdr.html">SKIP</a>, <a=
 href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18943/shard-rkl-7/=
igt@kms_feature_discovery@hdr.html">SKIP</a>) (<a href=3D"https://gitlab.fr=
eedesktop.org/drm/i915/kernel/-/issues/16600">i915#16600</a>) -&gt; <a href=
=3D"https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_171551v1/shard-rkl-1=
/igt@kms_feature_discovery@hdr.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_flip@basic-flip-vs-dpms:</p>
<ul>
<li>shard-dg2:          (<a href=3D"https://intel-gfx-ci.01.org/tree/drm-ti=
p/CI_DRM_18943/shard-dg2-10/igt@kms_flip@basic-flip-vs-dpms.html">SKIP</a>,=
 <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18943/shard-dg2=
-3/igt@kms_flip@basic-flip-vs-dpms.html">PASS</a>) (<a href=3D"https://gitl=
ab.freedesktop.org/drm/i915/kernel/-/issues/5354">i915#5354</a>) -&gt; <a h=
ref=3D"https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_171551v1/shard-dg=
2-7/igt@kms_flip@basic-flip-vs-dpms.html">PASS</a> +5 other tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-expired-vblank-interruptible:</p>
<ul>
<li>shard-dg1:          (<a href=3D"https://intel-gfx-ci.01.org/tree/drm-ti=
p/CI_DRM_18943/shard-dg1-18/igt@kms_flip@flip-vs-expired-vblank-interruptib=
le.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/CI_D=
RM_18943/shard-dg1-15/igt@kms_flip@flip-vs-expired-vblank-interruptible.htm=
l">FAIL</a>) (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/i=
ssues/13027">i915#13027</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/t=
ree/drm-tip/Patchwork_171551v1/shard-dg1-14/igt@kms_flip@flip-vs-expired-vb=
lank-interruptible.html">PASS</a></li>
<li>shard-tglu:         (<a href=3D"https://intel-gfx-ci.01.org/tree/drm-ti=
p/CI_DRM_18943/shard-tglu-10/igt@kms_flip@flip-vs-expired-vblank-interrupti=
ble.html">FAIL</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/CI_=
DRM_18943/shard-tglu-4/igt@kms_flip@flip-vs-expired-vblank-interruptible.ht=
ml">FAIL</a>) (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/=
issues/13027">i915#13027</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/Patchwork_171551v1/shard-tglu-10/igt@kms_flip@flip-vs-expired-=
vblank-interruptible.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-expired-vblank-interruptible@c-hdmi-a1:</p>
<ul>
<li>shard-dg1:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_18943/shard-dg1-15/igt@kms_flip@flip-vs-expired-vblank-interruptibl=
e@c-hdmi-a1.html">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i=
915/kernel/-/issues/13027">i915#13027</a>) -&gt; <a href=3D"https://intel-g=
fx-ci.01.org/tree/drm-tip/Patchwork_171551v1/shard-dg1-14/igt@kms_flip@flip=
-vs-expired-vblank-interruptible@c-hdmi-a1.html">PASS</a></li>
<li>shard-tglu:         (<a href=3D"https://intel-gfx-ci.01.org/tree/drm-ti=
p/CI_DRM_18943/shard-tglu-10/igt@kms_flip@flip-vs-expired-vblank-interrupti=
ble@c-hdmi-a1.html">FAIL</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/d=
rm-tip/CI_DRM_18943/shard-tglu-4/igt@kms_flip@flip-vs-expired-vblank-interr=
uptible@c-hdmi-a1.html">PASS</a>) (<a href=3D"https://gitlab.freedesktop.or=
g/drm/i915/kernel/-/issues/13027">i915#13027</a>) -&gt; <a href=3D"https://=
intel-gfx-ci.01.org/tree/drm-tip/Patchwork_171551v1/shard-tglu-10/igt@kms_f=
lip@flip-vs-expired-vblank-interruptible@c-hdmi-a1.html">PASS</a> +1 other =
test pass</li>
</ul>
</li>
<li>
<p>igt@kms_flip_event_leak@basic:</p>
<ul>
<li>shard-dg1:          (<a href=3D"https://intel-gfx-ci.01.org/tree/drm-ti=
p/CI_DRM_18943/shard-dg1-18/igt@kms_flip_event_leak@basic.html">DMESG-WARN<=
/a>, <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18943/shard=
-dg1-17/igt@kms_flip_event_leak@basic.html">PASS</a>) (<a href=3D"https://g=
itlab.freedesktop.org/drm/i915/kernel/-/issues/4423">i915#4423</a>) -&gt; <=
a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_171551v1/shard=
-dg1-17/igt@kms_flip_event_leak@basic.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-32bpp-linear-to-64bpp-linear-downscaling:</=
p>
<ul>
<li>shard-dg2:          (<a href=3D"https://intel-gfx-ci.01.org/tree/drm-ti=
p/CI_DRM_18943/shard-dg2-7/igt@kms_flip_scaled_crc@flip-32bpp-linear-to-64b=
pp-linear-downscaling.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.or=
g/tree/drm-tip/CI_DRM_18943/shard-dg2-10/igt@kms_flip_scaled_crc@flip-32bpp=
-linear-to-64bpp-linear-downscaling.html">SKIP</a>) (<a href=3D"https://git=
lab.freedesktop.org/drm/i915/kernel/-/issues/3555">i915#3555</a> / <a href=
=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8813">i915#8813=
</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_1=
71551v1/shard-dg2-7/igt@kms_flip_scaled_crc@flip-32bpp-linear-to-64bpp-line=
ar-downscaling.html">PASS</a> +4 other tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_flip_tiling@flip-change-tiling:</p>
<ul>
<li>shard-dg2:          (<a href=3D"https://intel-gfx-ci.01.org/tree/drm-ti=
p/CI_DRM_18943/shard-dg2-3/igt@kms_flip_tiling@flip-change-tiling.html">PAS=
S</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18943/sha=
rd-dg2-10/igt@kms_flip_tiling@flip-change-tiling.html">SKIP</a>) (<a href=
=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3555">i915#3555=
</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_1=
71551v1/shard-dg2-7/igt@kms_flip_tiling@flip-change-tiling.html">PASS</a></=
li>
</ul>
</li>
<li>
<p>igt@kms_force_connector_basic@prune-stale-modes:</p>
<ul>
<li>shard-mtlp:         (<a href=3D"https://intel-gfx-ci.01.org/tree/drm-ti=
p/CI_DRM_18943/shard-mtlp-5/igt@kms_force_connector_basic@prune-stale-modes=
.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM=
_18943/shard-mtlp-1/igt@kms_force_connector_basic@prune-stale-modes.html">S=
KIP</a>) (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issue=
s/15672">i915#15672</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/=
drm-tip/Patchwork_171551v1/shard-mtlp-7/igt@kms_force_connector_basic@prune=
-stale-modes.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-1p-offscreen-pri-shrfb-draw-render:</p>
<ul>
<li>shard-dg2:          (<a href=3D"https://intel-gfx-ci.01.org/tree/drm-ti=
p/CI_DRM_18943/shard-dg2-10/igt@kms_frontbuffer_tracking@fbc-1p-offscreen-p=
ri-shrfb-draw-render.html">SKIP</a>, <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/CI_DRM_18943/shard-dg2-3/igt@kms_frontbuffer_tracking@fbc-1p-=
offscreen-pri-shrfb-draw-render.html">PASS</a>) (<a href=3D"https://gitlab.=
freedesktop.org/drm/i915/kernel/-/issues/16708">i915#16708</a>) -&gt; <a hr=
ef=3D"https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_171551v1/shard-dg2=
-7/igt@kms_frontbuffer_tracking@fbc-1p-offscreen-pri-shrfb-draw-render.html=
">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-1p-primscrn-cur-indfb-draw-pwrite:</p>
<ul>
<li>shard-dg2:          (<a href=3D"https://intel-gfx-ci.01.org/tree/drm-ti=
p/CI_DRM_18943/shard-dg2-3/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-cur=
-indfb-draw-pwrite.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/t=
ree/drm-tip/CI_DRM_18943/shard-dg2-10/igt@kms_frontbuffer_tracking@fbc-1p-p=
rimscrn-cur-indfb-draw-pwrite.html">SKIP</a>) (<a href=3D"https://gitlab.fr=
eedesktop.org/drm/i915/kernel/-/issues/16708">i915#16708</a> / <a href=3D"h=
ttps://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5354">i915#5354</a>)=
 -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_171551=
v1/shard-dg2-7/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-cur-indfb-draw-=
pwrite.html">PASS</a> +4 other tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbchdr-rgb101010-draw-mmap-wc:</p>
<ul>
<li>shard-glk:          (<a href=3D"https://intel-gfx-ci.01.org/tree/drm-ti=
p/CI_DRM_18943/shard-glk8/igt@kms_frontbuffer_tracking@fbchdr-rgb101010-dra=
w-mmap-wc.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/drm-t=
ip/CI_DRM_18943/shard-glk2/igt@kms_frontbuffer_tracking@fbchdr-rgb101010-dr=
aw-mmap-wc.html">SKIP</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tre=
e/drm-tip/Patchwork_171551v1/shard-glk8/igt@kms_frontbuffer_tracking@fbchdr=
-rgb101010-draw-mmap-wc.html">PASS</a> +4 other tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@hdr-1p-primscrn-cur-indfb-draw-blt:</p>
<ul>
<li>shard-rkl:          (<a href=3D"https://intel-gfx-ci.01.org/tree/drm-ti=
p/CI_DRM_18943/shard-rkl-6/igt@kms_frontbuffer_tracking@hdr-1p-primscrn-cur=
-indfb-draw-blt.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree=
/drm-tip/CI_DRM_18943/shard-rkl-3/igt@kms_frontbuffer_tracking@hdr-1p-prims=
crn-cur-indfb-draw-blt.html">SKIP</a>) (<a href=3D"https://gitlab.freedeskt=
op.org/drm/i915/kernel/-/issues/15989">i915#15989</a>) -&gt; <a href=3D"htt=
ps://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_171551v1/shard-rkl-6/igt@km=
s_frontbuffer_tracking@hdr-1p-primscrn-cur-indfb-draw-blt.html">PASS</a> +2=
 other tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@hdr-1p-primscrn-indfb-plflip-blt:</p>
<ul>
<li>shard-glk:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_18943/shard-glk3/igt@kms_frontbuffer_tracking@hdr-1p-primscrn-indfb=
-plflip-blt.html">SKIP</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tre=
e/drm-tip/Patchwork_171551v1/shard-glk8/igt@kms_frontbuffer_tracking@hdr-1p=
-primscrn-indfb-plflip-blt.html">PASS</a> +1 other test pass</li>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_18943/shard-rkl-7/igt@kms_frontbuffer_tracking@hdr-1p-primscrn-indf=
b-plflip-blt.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/=
i915/kernel/-/issues/15989">i915#15989</a>) -&gt; <a href=3D"https://intel-=
gfx-ci.01.org/tree/drm-tip/Patchwork_171551v1/shard-rkl-6/igt@kms_frontbuff=
er_tracking@hdr-1p-primscrn-indfb-plflip-blt.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@hdr-shrfb-scaledprimary:</p>
<ul>
<li>shard-rkl:          (<a href=3D"https://intel-gfx-ci.01.org/tree/drm-ti=
p/CI_DRM_18943/shard-rkl-7/igt@kms_frontbuffer_tracking@hdr-shrfb-scaledpri=
mary.html">SKIP</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/CI=
_DRM_18943/shard-rkl-5/igt@kms_frontbuffer_tracking@hdr-shrfb-scaledprimary=
.html">SKIP</a>) (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel=
/-/issues/15989">i915#15989</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.o=
rg/tree/drm-tip/Patchwork_171551v1/shard-rkl-1/igt@kms_frontbuffer_tracking=
@hdr-shrfb-scaledprimary.html">PASS</a> +5 other tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_invalid_mode@int-max-clock:</p>
<ul>
<li>shard-dg2:          (<a href=3D"https://intel-gfx-ci.01.org/tree/drm-ti=
p/CI_DRM_18943/shard-dg2-7/igt@kms_invalid_mode@int-max-clock.html">PASS</a=
>, <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18943/shard-d=
g2-10/igt@kms_invalid_mode@int-max-clock.html">SKIP</a>) (<a href=3D"https:=
//gitlab.freedesktop.org/drm/i915/kernel/-/issues/16746">i915#16746</a> / <=
a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3555">i91=
5#3555</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/Patch=
work_171551v1/shard-dg2-7/igt@kms_invalid_mode@int-max-clock.html">PASS</a>=
 +3 other tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_pipe_crc_basic@compare-crc-sanitycheck-xr24:</p>
<ul>
<li>shard-dg2:          (<a href=3D"https://intel-gfx-ci.01.org/tree/drm-ti=
p/CI_DRM_18943/shard-dg2-3/igt@kms_pipe_crc_basic@compare-crc-sanitycheck-x=
r24.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/CI_=
DRM_18943/shard-dg2-10/igt@kms_pipe_crc_basic@compare-crc-sanitycheck-xr24.=
html">SKIP</a>) (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/=
-/issues/11190">i915#11190</a> / <a href=3D"https://gitlab.freedesktop.org/=
drm/i915/kernel/-/issues/16707">i915#16707</a>) -&gt; <a href=3D"https://in=
tel-gfx-ci.01.org/tree/drm-tip/Patchwork_171551v1/shard-dg2-7/igt@kms_pipe_=
crc_basic@compare-crc-sanitycheck-xr24.html">PASS</a> +1 other test pass</l=
i>
</ul>
</li>
<li>
<p>igt@kms_pipe_stress@stress-xrgb8888-ytiled:</p>
<ul>
<li>shard-glk:          (<a href=3D"https://intel-gfx-ci.01.org/tree/drm-ti=
p/CI_DRM_18943/shard-glk5/igt@kms_pipe_stress@stress-xrgb8888-ytiled.html">=
PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18943/=
shard-glk2/igt@kms_pipe_stress@stress-xrgb8888-ytiled.html">DMESG-FAIL</a>)=
 (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/118">i=
915#118</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/Patc=
hwork_171551v1/shard-glk5/igt@kms_pipe_stress@stress-xrgb8888-ytiled.html">=
PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_plane@pixel-format-linear-modifier:</p>
<ul>
<li>shard-dg2:          (<a href=3D"https://intel-gfx-ci.01.org/tree/drm-ti=
p/CI_DRM_18943/shard-dg2-1/igt@kms_plane@pixel-format-linear-modifier.html"=
>PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18943=
/shard-dg2-10/igt@kms_plane@pixel-format-linear-modifier.html">SKIP</a>) (<=
a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8825">i91=
5#8825</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/Patch=
work_171551v1/shard-dg2-3/igt@kms_plane@pixel-format-linear-modifier.html">=
PASS</a> +3 other tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-downscale-factor-0-75-with-pixel-format:</p>
<ul>
<li>shard-dg2:          (<a href=3D"https://intel-gfx-ci.01.org/tree/drm-ti=
p/CI_DRM_18943/shard-dg2-10/igt@kms_plane_scaling@plane-downscale-factor-0-=
75-with-pixel-format.html">SKIP</a>, <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/CI_DRM_18943/shard-dg2-1/igt@kms_plane_scaling@plane-downscal=
e-factor-0-75-with-pixel-format.html">PASS</a>) (<a href=3D"https://gitlab.=
freedesktop.org/drm/i915/kernel/-/issues/15329">i915#15329</a> / <a href=3D=
"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9423">i915#9423</a=
>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_1715=
51v1/shard-dg2-3/igt@kms_plane_scaling@plane-downscale-factor-0-75-with-pix=
el-format.html">PASS</a> +2 other tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-downscale-factor-0-75-with-pixel-format@pipe=
-c:</p>
<ul>
<li>shard-dg2:          (<a href=3D"https://intel-gfx-ci.01.org/tree/drm-ti=
p/CI_DRM_18943/shard-dg2-1/igt@kms_plane_scaling@plane-downscale-factor-0-7=
5-with-pixel-format@pipe-c.html">PASS</a>, <a href=3D"https://intel-gfx-ci.=
01.org/tree/drm-tip/CI_DRM_18943/shard-dg2-10/igt@kms_plane_scaling@plane-d=
ownscale-factor-0-75-with-pixel-format@pipe-c.html">SKIP</a>) (<a href=3D"h=
ttps://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15329">i915#15329</a=
>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_1715=
51v1/shard-dg2-3/igt@kms_plane_scaling@plane-downscale-factor-0-75-with-pix=
el-format@pipe-c.html">PASS</a> +23 other tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-scaler-with-clipping-clamping-pixel-formats:=
</p>
<ul>
<li>shard-dg2:          (<a href=3D"https://intel-gfx-ci.01.org/tree/drm-ti=
p/CI_DRM_18943/shard-dg2-10/igt@kms_plane_scaling@plane-scaler-with-clippin=
g-clamping-pixel-formats.html">SKIP</a>, <a href=3D"https://intel-gfx-ci.01=
.org/tree/drm-tip/CI_DRM_18943/shard-dg2-1/igt@kms_plane_scaling@plane-scal=
er-with-clipping-clamping-pixel-formats.html">PASS</a>) (<a href=3D"https:/=
/gitlab.freedesktop.org/drm/i915/kernel/-/issues/15329">i915#15329</a> / <a=
 href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3555">i915=
#3555</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/iss=
ues/9423">i915#9423</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/=
drm-tip/Patchwork_171551v1/shard-dg2-3/igt@kms_plane_scaling@plane-scaler-w=
ith-clipping-clamping-pixel-formats.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@planes-unity-scaling-downscale-factor-0-75:</p>
<ul>
<li>shard-dg2:          (<a href=3D"https://intel-gfx-ci.01.org/tree/drm-ti=
p/CI_DRM_18943/shard-dg2-10/igt@kms_plane_scaling@planes-unity-scaling-down=
scale-factor-0-75.html">SKIP</a>, <a href=3D"https://intel-gfx-ci.01.org/tr=
ee/drm-tip/CI_DRM_18943/shard-dg2-7/igt@kms_plane_scaling@planes-unity-scal=
ing-downscale-factor-0-75.html">PASS</a>) (<a href=3D"https://gitlab.freede=
sktop.org/drm/i915/kernel/-/issues/15329">i915#15329</a> / <a href=3D"https=
://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3555">i915#3555</a> / <a=
 href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6953">i915=
#6953</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/iss=
ues/9423">i915#9423</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/=
drm-tip/Patchwork_171551v1/shard-dg2-7/igt@kms_plane_scaling@planes-unity-s=
caling-downscale-factor-0-75.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@planes-upscale-20x20-downscale-factor-0-75:</p>
<ul>
<li>shard-dg2:          (<a href=3D"https://intel-gfx-ci.01.org/tree/drm-ti=
p/CI_DRM_18943/shard-dg2-3/igt@kms_plane_scaling@planes-upscale-20x20-downs=
cale-factor-0-75.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tre=
e/drm-tip/CI_DRM_18943/shard-dg2-10/igt@kms_plane_scaling@planes-upscale-20=
x20-downscale-factor-0-75.html">SKIP</a>) (<a href=3D"https://gitlab.freede=
sktop.org/drm/i915/kernel/-/issues/15329">i915#15329</a> / <a href=3D"https=
://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6953">i915#6953</a> / <a=
 href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9423">i915=
#9423</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/Patchw=
ork_171551v1/shard-dg2-7/igt@kms_plane_scaling@planes-upscale-20x20-downsca=
le-factor-0-75.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_pm_lpsp@kms-lpsp:</p>
<ul>
<li>shard-dg2:          (<a href=3D"https://intel-gfx-ci.01.org/tree/drm-ti=
p/CI_DRM_18943/shard-dg2-10/igt@kms_pm_lpsp@kms-lpsp.html">SKIP</a>, <a hre=
f=3D"https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18943/shard-dg2-6/igt@=
kms_pm_lpsp@kms-lpsp.html">SKIP</a>) (<a href=3D"https://gitlab.freedesktop=
.org/drm/i915/kernel/-/issues/9340">i915#9340</a>) -&gt; <a href=3D"https:/=
/intel-gfx-ci.01.org/tree/drm-tip/Patchwork_171551v1/shard-dg2-4/igt@kms_pm=
_lpsp@kms-lpsp.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_pm_rpm@dpms-mode-unset-non-lpsp:</p>
<ul>
<li>shard-dg1:          (<a href=3D"https://intel-gfx-ci.01.org/tree/drm-ti=
p/CI_DRM_18943/shard-dg1-14/igt@kms_pm_rpm@dpms-mode-unset-non-lpsp.html">S=
KIP</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18943/s=
hard-dg1-13/igt@kms_pm_rpm@dpms-mode-unset-non-lpsp.html">PASS</a>) (<a hre=
f=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15073">i915#15=
073</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/Patchwor=
k_171551v1/shard-dg1-13/igt@kms_pm_rpm@dpms-mode-unset-non-lpsp.html">PASS<=
/a> +2 other tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_pm_rpm@modeset-lpsp-stress:</p>
<ul>
<li>shard-rkl:          (<a href=3D"https://intel-gfx-ci.01.org/tree/drm-ti=
p/CI_DRM_18943/shard-rkl-2/igt@kms_pm_rpm@modeset-lpsp-stress.html">PASS</a=
>, <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18943/shard-r=
kl-4/igt@kms_pm_rpm@modeset-lpsp-stress.html">SKIP</a>) (<a href=3D"https:/=
/gitlab.freedesktop.org/drm/i915/kernel/-/issues/15073">i915#15073</a>) -&g=
t; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_171551v1/s=
hard-rkl-8/igt@kms_pm_rpm@modeset-lpsp-stress.html">PASS</a> +1 other test =
pass</li>
</ul>
</li>
<li>
<p>igt@kms_pm_rpm@modeset-non-lpsp-stress:</p>
<ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_18943/shard-rkl-5/igt@kms_pm_rpm@modeset-non-lpsp-stress.html">SKIP=
</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15=
073">i915#15073</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-=
tip/Patchwork_171551v1/shard-rkl-7/igt@kms_pm_rpm@modeset-non-lpsp-stress.h=
tml">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_pm_rpm@modeset-non-lpsp-stress-no-wait:</p>
<ul>
<li>shard-dg2:          (<a href=3D"https://intel-gfx-ci.01.org/tree/drm-ti=
p/CI_DRM_18943/shard-dg2-10/igt@kms_pm_rpm@modeset-non-lpsp-stress-no-wait.=
html">SKIP</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_=
18943/shard-dg2-1/igt@kms_pm_rpm@modeset-non-lpsp-stress-no-wait.html">PASS=
</a>) (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/1=
5073">i915#15073</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm=
-tip/Patchwork_171551v1/shard-dg2-3/igt@kms_pm_rpm@modeset-non-lpsp-stress-=
no-wait.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@kms_vblank@ts-continuation-modeset:</p>
<ul>
<li>shard-dg2:          (<a href=3D"https://intel-gfx-ci.01.org/tree/drm-ti=
p/CI_DRM_18943/shard-dg2-10/igt@kms_vblank@ts-continuation-modeset.html">SK=
IP</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18943/sh=
ard-dg2-6/igt@kms_vblank@ts-continuation-modeset.html">PASS</a>) (<a href=
=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16707">i915#167=
07</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork=
_171551v1/shard-dg2-4/igt@kms_vblank@ts-continuation-modeset.html">PASS</a>=
 +58 other tests pass</li>
</ul>
</li>
</ul>
<h4>Warnings</h4>
<ul>
<li>
<p>igt@fbdev@info:</p>
<ul>
<li>shard-dg2:          (<a href=3D"https://intel-gfx-ci.01.org/tree/drm-ti=
p/CI_DRM_18943/shard-dg2-8/igt@fbdev@info.html">PASS</a>, <a href=3D"https:=
//intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18943/shard-dg2-10/igt@fbdev@info=
.html">SKIP</a>) (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel=
/-/issues/1849">i915#1849</a> / <a href=3D"https://gitlab.freedesktop.org/d=
rm/i915/kernel/-/issues/2582">i915#2582</a>) -&gt; <a href=3D"https://intel=
-gfx-ci.01.org/tree/drm-tip/Patchwork_171551v1/shard-dg2-10/igt@fbdev@info.=
html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-=
/issues/1849">i915#1849</a> / <a href=3D"https://gitlab.freedesktop.org/drm=
/i915/kernel/-/issues/2582">i915#2582</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_ccs@large-ctrl-surf-copy:</p>
<ul>
<li>shard-rkl:          (<a href=3D"https://intel-gfx-ci.01.org/tree/drm-ti=
p/CI_DRM_18943/shard-rkl-6/igt@gem_ccs@large-ctrl-surf-copy.html">SKIP</a>,=
 <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18943/shard-rkl=
-1/igt@gem_ccs@large-ctrl-surf-copy.html">SKIP</a>) (<a href=3D"https://git=
lab.freedesktop.org/drm/i915/kernel/-/issues/13008">i915#13008</a> / <a hre=
f=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14=
544</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/Patchwor=
k_171551v1/shard-rkl-2/igt@gem_ccs@large-ctrl-surf-copy.html">SKIP</a> (<a =
href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13008">i915=
#13008</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_ctx_isolation@preservation-s3:</p>
<ul>
<li>shard-rkl:          (<a href=3D"https://intel-gfx-ci.01.org/tree/drm-ti=
p/CI_DRM_18943/shard-rkl-2/igt@gem_ctx_isolation@preservation-s3.html">PASS=
</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18943/shar=
d-rkl-6/igt@gem_ctx_isolation@preservation-s3.html">INCOMPLETE</a>) (<a hre=
f=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13356">i915#13=
356</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/Patchwor=
k_171551v1/shard-rkl-3/igt@gem_ctx_isolation@preservation-s3.html">INCOMPLE=
TE</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/=
13356">i915#13356</a>) +1 other test incomplete</li>
</ul>
</li>
<li>
<p>igt@gem_ctx_sseu@invalid-sseu:</p>
<ul>
<li>shard-rkl:          (<a href=3D"https://intel-gfx-ci.01.org/tree/drm-ti=
p/CI_DRM_18943/shard-rkl-6/igt@gem_ctx_sseu@invalid-sseu.html">SKIP</a>, <a=
 href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18943/shard-rkl-3/=
igt@gem_ctx_sseu@invalid-sseu.html">SKIP</a>) (<a href=3D"https://gitlab.fr=
eedesktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a> / <a href=3D"h=
ttps://gitlab.freedesktop.org/drm/i915/kernel/-/issues/280">i915#280</a>) -=
&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_171551v1=
/shard-rkl-5/igt@gem_ctx_sseu@invalid-sseu.html">SKIP</a> (<a href=3D"https=
://gitlab.freedesktop.org/drm/i915/kernel/-/issues/280">i915#280</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_exec_balancer@parallel-contexts:</p>
<ul>
<li>shard-rkl:          (<a href=3D"https://intel-gfx-ci.01.org/tree/drm-ti=
p/CI_DRM_18943/shard-rkl-3/igt@gem_exec_balancer@parallel-contexts.html">SK=
IP</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18943/sh=
ard-rkl-6/igt@gem_exec_balancer@parallel-contexts.html">SKIP</a>) (<a href=
=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#145=
44</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues=
/4525">i915#4525</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm=
-tip/Patchwork_171551v1/shard-rkl-5/igt@gem_exec_balancer@parallel-contexts=
.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/=
-/issues/4525">i915#4525</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_exec_capture@capture-recoverable:</p>
<ul>
<li>shard-rkl:          (<a href=3D"https://intel-gfx-ci.01.org/tree/drm-ti=
p/CI_DRM_18943/shard-rkl-2/igt@gem_exec_capture@capture-recoverable.html">S=
KIP</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18943/s=
hard-rkl-5/igt@gem_exec_capture@capture-recoverable.html">SKIP</a>) (<a hre=
f=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6344">i915#634=
4</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_=
171551v1/shard-rkl-6/igt@gem_exec_capture@capture-recoverable.html">SKIP</a=
> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544=
">i915#14544</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i915/kerne=
l/-/issues/6344">i915#6344</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_exec_reloc@basic-gtt-cpu:</p>
<ul>
<li>shard-rkl:          (<a href=3D"https://intel-gfx-ci.01.org/tree/drm-ti=
p/CI_DRM_18943/shard-rkl-3/igt@gem_exec_reloc@basic-gtt-cpu.html">SKIP</a>,=
 <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18943/shard-rkl=
-6/igt@gem_exec_reloc@basic-gtt-cpu.html">SKIP</a>) (<a href=3D"https://git=
lab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a> / <a hre=
f=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3281">i915#328=
1</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_=
171551v1/shard-rkl-5/igt@gem_exec_reloc@basic-gtt-cpu.html">SKIP</a> (<a hr=
ef=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3281">i915#32=
81</a>) +8 other tests skip</li>
</ul>
</li>
<li>
<p>igt@gem_lmem_swapping@parallel-random-verify:</p>
<ul>
<li>shard-rkl:          (<a href=3D"https://intel-gfx-ci.01.org/tree/drm-ti=
p/CI_DRM_18943/shard-rkl-3/igt@gem_lmem_swapping@parallel-random-verify.htm=
l">SKIP</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_189=
43/shard-rkl-6/igt@gem_lmem_swapping@parallel-random-verify.html">SKIP</a>)=
 (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544"=
>i915#14544</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel=
/-/issues/4613">i915#4613</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/Patchwork_171551v1/shard-rkl-5/igt@gem_lmem_swapping@parallel=
-random-verify.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/dr=
m/i915/kernel/-/issues/4613">i915#4613</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@gem_media_vme:</p>
<ul>
<li>shard-rkl:          (<a href=3D"https://intel-gfx-ci.01.org/tree/drm-ti=
p/CI_DRM_18943/shard-rkl-6/igt@gem_media_vme.html">SKIP</a>, <a href=3D"htt=
ps://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18943/shard-rkl-1/igt@gem_medi=
a_vme.html">SKIP</a>) (<a href=3D"https://gitlab.freedesktop.org/drm/i915/k=
ernel/-/issues/14544">i915#14544</a> / <a href=3D"https://gitlab.freedeskto=
p.org/drm/i915/kernel/-/issues/284">i915#284</a>) -&gt; <a href=3D"https://=
intel-gfx-ci.01.org/tree/drm-tip/Patchwork_171551v1/shard-rkl-2/igt@gem_med=
ia_vme.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/k=
ernel/-/issues/284">i915#284</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_pread@snoop:</p>
<ul>
<li>shard-rkl:          (<a href=3D"https://intel-gfx-ci.01.org/tree/drm-ti=
p/CI_DRM_18943/shard-rkl-2/igt@gem_pread@snoop.html">SKIP</a>, <a href=3D"h=
ttps://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18943/shard-rkl-5/igt@gem_pr=
ead@snoop.html">SKIP</a>) (<a href=3D"https://gitlab.freedesktop.org/drm/i9=
15/kernel/-/issues/3282">i915#3282</a>) -&gt; <a href=3D"https://intel-gfx-=
ci.01.org/tree/drm-tip/Patchwork_171551v1/shard-rkl-6/igt@gem_pread@snoop.h=
tml">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/=
issues/14544">i915#14544</a> / <a href=3D"https://gitlab.freedesktop.org/dr=
m/i915/kernel/-/issues/3282">i915#3282</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_pread@uncached:</p>
<ul>
<li>shard-rkl:          (<a href=3D"https://intel-gfx-ci.01.org/tree/drm-ti=
p/CI_DRM_18943/shard-rkl-6/igt@gem_pread@uncached.html">SKIP</a>, <a href=
=3D"https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18943/shard-rkl-1/igt@g=
em_pread@uncached.html">SKIP</a>) (<a href=3D"https://gitlab.freedesktop.or=
g/drm/i915/kernel/-/issues/14544">i915#14544</a> / <a href=3D"https://gitla=
b.freedesktop.org/drm/i915/kernel/-/issues/3282">i915#3282</a>) -&gt; <a hr=
ef=3D"https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_171551v1/shard-rkl=
-2/igt@gem_pread@uncached.html">SKIP</a> (<a href=3D"https://gitlab.freedes=
ktop.org/drm/i915/kernel/-/issues/3282">i915#3282</a>) +1 other test skip</=
li>
</ul>
</li>
<li>
<p>igt@gen7_exec_parse@basic-allocation:</p>
<ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_18943/shard-rkl-7/igt@gen7_exec_parse@basic-allocation.html">SKIP</=
a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_1715=
51v1/shard-rkl-6/igt@gen7_exec_parse@basic-allocation.html">SKIP</a> (<a hr=
ef=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#1=
4544</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@gen9_exec_parse@bb-start-cmd:</p>
<ul>
<li>shard-rkl:          (<a href=3D"https://intel-gfx-ci.01.org/tree/drm-ti=
p/CI_DRM_18943/shard-rkl-6/igt@gen9_exec_parse@bb-start-cmd.html">SKIP</a>,=
 <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18943/shard-rkl=
-3/igt@gen9_exec_parse@bb-start-cmd.html">SKIP</a>) (<a href=3D"https://git=
lab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a> / <a hre=
f=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2527">i915#252=
7</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_=
171551v1/shard-rkl-2/igt@gen9_exec_parse@bb-start-cmd.html">SKIP</a> (<a hr=
ef=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2527">i915#25=
27</a>)</li>
</ul>
</li>
<li>
<p>igt@i915_pm_rc6_residency@media-rc6-accuracy:</p>
<ul>
<li>shard-rkl:          (<a href=3D"https://intel-gfx-ci.01.org/tree/drm-ti=
p/CI_DRM_18943/shard-rkl-6/igt@i915_pm_rc6_residency@media-rc6-accuracy.htm=
l">SKIP</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_189=
43/shard-rkl-1/igt@i915_pm_rc6_residency@media-rc6-accuracy.html">SKIP</a>)=
 (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544"=
>i915#14544</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel=
/-/issues/16080">i915#16080</a> / <a href=3D"https://gitlab.freedesktop.org=
/drm/i915/kernel/-/issues/16166">i915#16166</a>) -&gt; <a href=3D"https://i=
ntel-gfx-ci.01.org/tree/drm-tip/Patchwork_171551v1/shard-rkl-2/igt@i915_pm_=
rc6_residency@media-rc6-accuracy.html">SKIP</a> (<a href=3D"https://gitlab.=
freedesktop.org/drm/i915/kernel/-/issues/16080">i915#16080</a> / <a href=3D=
"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16166">i915#16166<=
/a>)</li>
</ul>
</li>
<li>
<p>igt@i915_suspend@fence-restore-tiled2untiled:</p>
<ul>
<li>shard-rkl:          (<a href=3D"https://intel-gfx-ci.01.org/tree/drm-ti=
p/CI_DRM_18943/shard-rkl-8/igt@i915_suspend@fence-restore-tiled2untiled.htm=
l">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_189=
43/shard-rkl-6/igt@i915_suspend@fence-restore-tiled2untiled.html">INCOMPLET=
E</a>) (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/=
4817">i915#4817</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-=
tip/Patchwork_171551v1/shard-rkl-6/igt@i915_suspend@fence-restore-tiled2unt=
iled.html">INCOMPLETE</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i9=
15/kernel/-/issues/4817">i915#4817</a>)</li>
</ul>
</li>
<li>
<p>igt@i915_suspend@fence-restore-untiled:</p>
<ul>
<li>shard-glk:          (<a href=3D"https://intel-gfx-ci.01.org/tree/drm-ti=
p/CI_DRM_18943/shard-glk6/igt@i915_suspend@fence-restore-untiled.html">PASS=
</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18943/shar=
d-glk5/igt@i915_suspend@fence-restore-untiled.html">INCOMPLETE</a>) (<a hre=
f=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16182">i915#16=
182</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issue=
s/4817">i915#4817</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/dr=
m-tip/Patchwork_171551v1/shard-glk4/igt@i915_suspend@fence-restore-untiled.=
html">INCOMPLETE</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/ke=
rnel/-/issues/16182">i915#16182</a> / <a href=3D"https://gitlab.freedesktop=
.org/drm/i915/kernel/-/issues/4817">i915#4817</a>)</li>
</ul>
</li>
<li>
<p>igt@intel_hwmon@hwmon-write:</p>
<ul>
<li>shard-rkl:          (<a href=3D"https://intel-gfx-ci.01.org/tree/drm-ti=
p/CI_DRM_18943/shard-rkl-3/igt@intel_hwmon@hwmon-write.html">SKIP</a>, <a h=
ref=3D"https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18943/shard-rkl-6/ig=
t@intel_hwmon@hwmon-write.html">SKIP</a>) (<a href=3D"https://gitlab.freede=
sktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a> / <a href=3D"https=
://gitlab.freedesktop.org/drm/i915/kernel/-/issues/7707">i915#7707</a>) -&g=
t; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_171551v1/s=
hard-rkl-5/igt@intel_hwmon@hwmon-write.html">SKIP</a> (<a href=3D"https://g=
itlab.freedesktop.org/drm/i915/kernel/-/issues/7707">i915#7707</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_async_flips@alternate-sync-async-flip-atomic:</p>
<ul>
<li>shard-dg2:          (<a href=3D"https://intel-gfx-ci.01.org/tree/drm-ti=
p/CI_DRM_18943/shard-dg2-4/igt@kms_async_flips@alternate-sync-async-flip-at=
omic.html">FAIL</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/CI=
_DRM_18943/shard-dg2-10/igt@kms_async_flips@alternate-sync-async-flip-atomi=
c.html">SKIP</a>) (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kerne=
l/-/issues/14888">i915#14888</a> / <a href=3D"https://gitlab.freedesktop.or=
g/drm/i915/kernel/-/issues/16707">i915#16707</a>) -&gt; <a href=3D"https://=
intel-gfx-ci.01.org/tree/drm-tip/Patchwork_171551v1/shard-dg2-10/igt@kms_as=
ync_flips@alternate-sync-async-flip-atomic.html">SKIP</a> (<a href=3D"https=
://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16707">i915#16707</a>)</=
li>
<li>shard-glk:          (<a href=3D"https://intel-gfx-ci.01.org/tree/drm-ti=
p/CI_DRM_18943/shard-glk8/igt@kms_async_flips@alternate-sync-async-flip-ato=
mic.html">FAIL</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/CI_=
DRM_18943/shard-glk6/igt@kms_async_flips@alternate-sync-async-flip-atomic.h=
tml">PASS</a>) (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-=
/issues/14888">i915#14888</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/Patchwork_171551v1/shard-glk2/igt@kms_async_flips@alternate-s=
ync-async-flip-atomic.html">FAIL</a> (<a href=3D"https://gitlab.freedesktop=
.org/drm/i915/kernel/-/issues/14888">i915#14888</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_atomic@plane-primary-overlay-mutable-zpos:</p>
<ul>
<li>shard-dg2:          (<a href=3D"https://intel-gfx-ci.01.org/tree/drm-ti=
p/CI_DRM_18943/shard-dg2-7/igt@kms_atomic@plane-primary-overlay-mutable-zpo=
s.html">SKIP</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/CI_DR=
M_18943/shard-dg2-10/igt@kms_atomic@plane-primary-overlay-mutable-zpos.html=
">SKIP</a>) (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/is=
sues/16707">i915#16707</a> / <a href=3D"https://gitlab.freedesktop.org/drm/=
i915/kernel/-/issues/9531">i915#9531</a>) -&gt; <a href=3D"https://intel-gf=
x-ci.01.org/tree/drm-tip/Patchwork_171551v1/shard-dg2-7/igt@kms_atomic@plan=
e-primary-overlay-mutable-zpos.html">SKIP</a> (<a href=3D"https://gitlab.fr=
eedesktop.org/drm/i915/kernel/-/issues/9531">i915#9531</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@4-tiled-16bpp-rotate-90:</p>
<ul>
<li>shard-rkl:          (<a href=3D"https://intel-gfx-ci.01.org/tree/drm-ti=
p/CI_DRM_18943/shard-rkl-5/igt@kms_big_fb@4-tiled-16bpp-rotate-90.html">SKI=
P</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18943/sha=
rd-rkl-2/igt@kms_big_fb@4-tiled-16bpp-rotate-90.html">SKIP</a>) (<a href=3D=
"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5286">i915#5286</a=
>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_1715=
51v1/shard-rkl-6/igt@kms_big_fb@4-tiled-16bpp-rotate-90.html">SKIP</a> (<a =
href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915=
#14544</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/is=
sues/5286">i915#5286</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@4-tiled-64bpp-rotate-0:</p>
<ul>
<li>shard-rkl:          (<a href=3D"https://intel-gfx-ci.01.org/tree/drm-ti=
p/CI_DRM_18943/shard-rkl-1/igt@kms_big_fb@4-tiled-64bpp-rotate-0.html">SKIP=
</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18943/shar=
d-rkl-6/igt@kms_big_fb@4-tiled-64bpp-rotate-0.html">SKIP</a>) (<a href=3D"h=
ttps://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a=
> / <a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5286=
">i915#5286</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/=
Patchwork_171551v1/shard-rkl-2/igt@kms_big_fb@4-tiled-64bpp-rotate-0.html">=
SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issue=
s/5286">i915#5286</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@4-tiled-8bpp-rotate-90:</p>
<ul>
<li>shard-dg2:          (<a href=3D"https://intel-gfx-ci.01.org/tree/drm-ti=
p/CI_DRM_18943/shard-dg2-6/igt@kms_big_fb@4-tiled-8bpp-rotate-90.html">SKIP=
</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18943/shar=
d-dg2-1/igt@kms_big_fb@4-tiled-8bpp-rotate-90.html">SKIP</a>) -&gt; <a href=
=3D"https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_171551v1/shard-dg2-1=
0/igt@kms_big_fb@4-tiled-8bpp-rotate-90.html">SKIP</a> (<a href=3D"https://=
gitlab.freedesktop.org/drm/i915/kernel/-/issues/16707">i915#16707</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@linear-max-hw-stride-32bpp-rotate-180-hflip:</p>
<ul>
<li>shard-rkl:          (<a href=3D"https://intel-gfx-ci.01.org/tree/drm-ti=
p/CI_DRM_18943/shard-rkl-3/igt@kms_big_fb@linear-max-hw-stride-32bpp-rotate=
-180-hflip.html">SKIP</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/drm-=
tip/CI_DRM_18943/shard-rkl-6/igt@kms_big_fb@linear-max-hw-stride-32bpp-rota=
te-180-hflip.html">SKIP</a>) (<a href=3D"https://gitlab.freedesktop.org/drm=
/i915/kernel/-/issues/14544">i915#14544</a> / <a href=3D"https://gitlab.fre=
edesktop.org/drm/i915/kernel/-/issues/3828">i915#3828</a>) -&gt; <a href=3D=
"https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_171551v1/shard-rkl-5/ig=
t@kms_big_fb@linear-max-hw-stride-32bpp-rotate-180-hflip.html">SKIP</a> (<a=
 href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3828">i915=
#3828</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@linear-max-hw-stride-64bpp-rotate-0-hflip:</p>
<ul>
<li>shard-dg2:          (<a href=3D"https://intel-gfx-ci.01.org/tree/drm-ti=
p/CI_DRM_18943/shard-dg2-6/igt@kms_big_fb@linear-max-hw-stride-64bpp-rotate=
-0-hflip.html">SKIP</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/drm-ti=
p/CI_DRM_18943/shard-dg2-10/igt@kms_big_fb@linear-max-hw-stride-64bpp-rotat=
e-0-hflip.html">SKIP</a>) (<a href=3D"https://gitlab.freedesktop.org/drm/i9=
15/kernel/-/issues/16707">i915#16707</a> / <a href=3D"https://gitlab.freede=
sktop.org/drm/i915/kernel/-/issues/3828">i915#3828</a>) -&gt; <a href=3D"ht=
tps://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_171551v1/shard-dg2-4/igt@k=
ms_big_fb@linear-max-hw-stride-64bpp-rotate-0-hflip.html">SKIP</a> (<a href=
=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3828">i915#3828=
</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@x-tiled-16bpp-rotate-270:</p>
<ul>
<li>shard-dg2:          (<a href=3D"https://intel-gfx-ci.01.org/tree/drm-ti=
p/CI_DRM_18943/shard-dg2-3/igt@kms_big_fb@x-tiled-16bpp-rotate-270.html">SK=
IP</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18943/sh=
ard-dg2-10/igt@kms_big_fb@x-tiled-16bpp-rotate-270.html">SKIP</a>) (<a href=
=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16707">i915#167=
07</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork=
_171551v1/shard-dg2-7/igt@kms_big_fb@x-tiled-16bpp-rotate-270.html">SKIP</a=
> +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@x-tiled-16bpp-rotate-90:</p>
<ul>
<li>shard-dg2:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_18943/shard-dg2-8/igt@kms_big_fb@x-tiled-16bpp-rotate-90.html">SKIP=
</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_17=
1551v1/shard-dg2-10/igt@kms_big_fb@x-tiled-16bpp-rotate-90.html">SKIP</a> (=
<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16707">i=
915#16707</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@x-tiled-max-hw-stride-64bpp-rotate-180-async-flip:</p>
<ul>
<li>shard-dg2:          (<a href=3D"https://intel-gfx-ci.01.org/tree/drm-ti=
p/CI_DRM_18943/shard-dg2-4/igt@kms_big_fb@x-tiled-max-hw-stride-64bpp-rotat=
e-180-async-flip.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tre=
e/drm-tip/CI_DRM_18943/shard-dg2-10/igt@kms_big_fb@x-tiled-max-hw-stride-64=
bpp-rotate-180-async-flip.html">SKIP</a>) (<a href=3D"https://gitlab.freede=
sktop.org/drm/i915/kernel/-/issues/16707">i915#16707</a>) -&gt; <a href=3D"=
https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_171551v1/shard-dg2-10/ig=
t@kms_big_fb@x-tiled-max-hw-stride-64bpp-rotate-180-async-flip.html">SKIP</=
a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/1670=
7">i915#16707</a>) +44 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@y-tiled-32bpp-rotate-90:</p>
<ul>
<li>shard-dg2:          (<a href=3D"https://intel-gfx-ci.01.org/tree/drm-ti=
p/CI_DRM_18943/shard-dg2-6/igt@kms_big_fb@y-tiled-32bpp-rotate-90.html">SKI=
P</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18943/sha=
rd-dg2-1/igt@kms_big_fb@y-tiled-32bpp-rotate-90.html">SKIP</a>) (<a href=3D=
"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4538">i915#4538</a=
> / <a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5190=
">i915#5190</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/=
Patchwork_171551v1/shard-dg2-10/igt@kms_big_fb@y-tiled-32bpp-rotate-90.html=
">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/iss=
ues/16707">i915#16707</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i=
915/kernel/-/issues/5190">i915#5190</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@y-tiled-64bpp-rotate-270:</p>
<ul>
<li>shard-rkl:          (<a href=3D"https://intel-gfx-ci.01.org/tree/drm-ti=
p/CI_DRM_18943/shard-rkl-3/igt@kms_big_fb@y-tiled-64bpp-rotate-270.html">SK=
IP</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18943/sh=
ard-rkl-6/igt@kms_big_fb@y-tiled-64bpp-rotate-270.html">SKIP</a>) (<a href=
=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#145=
44</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues=
/3638">i915#3638</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm=
-tip/Patchwork_171551v1/shard-rkl-5/igt@kms_big_fb@y-tiled-64bpp-rotate-270=
.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/=
-/issues/3638">i915#3638</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@y-tiled-8bpp-rotate-270:</p>
<ul>
<li>shard-dg2:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_18943/shard-dg2-8/igt@kms_big_fb@y-tiled-8bpp-rotate-270.html">SKIP=
</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/45=
38">i915#4538</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i915/kern=
el/-/issues/5190">i915#5190</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.o=
rg/tree/drm-tip/Patchwork_171551v1/shard-dg2-10/igt@kms_big_fb@y-tiled-8bpp=
-rotate-270.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i=
915/kernel/-/issues/16707">i915#16707</a> / <a href=3D"https://gitlab.freed=
esktop.org/drm/i915/kernel/-/issues/5190">i915#5190</a>) +2 other tests ski=
p</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@y-tiled-8bpp-rotate-90:</p>
<ul>
<li>shard-dg2:          (<a href=3D"https://intel-gfx-ci.01.org/tree/drm-ti=
p/CI_DRM_18943/shard-dg2-4/igt@kms_big_fb@y-tiled-8bpp-rotate-90.html">SKIP=
</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18943/shar=
d-dg2-10/igt@kms_big_fb@y-tiled-8bpp-rotate-90.html">SKIP</a>) (<a href=3D"=
https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16707">i915#16707</=
a> / <a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/453=
8">i915#4538</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i915/kerne=
l/-/issues/5190">i915#5190</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.or=
g/tree/drm-tip/Patchwork_171551v1/shard-dg2-10/igt@kms_big_fb@y-tiled-8bpp-=
rotate-90.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i91=
5/kernel/-/issues/16707">i915#16707</a> / <a href=3D"https://gitlab.freedes=
ktop.org/drm/i915/kernel/-/issues/5190">i915#5190</a>) +6 other tests skip<=
/li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-180-hflip-async-flip:<=
/p>
<ul>
<li>shard-dg2:          (<a href=3D"https://intel-gfx-ci.01.org/tree/drm-ti=
p/CI_DRM_18943/shard-dg2-6/igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotat=
e-180-hflip-async-flip.html">SKIP</a>, <a href=3D"https://intel-gfx-ci.01.o=
rg/tree/drm-tip/CI_DRM_18943/shard-dg2-10/igt@kms_big_fb@y-tiled-max-hw-str=
ide-64bpp-rotate-180-hflip-async-flip.html">SKIP</a>) (<a href=3D"https://g=
itlab.freedesktop.org/drm/i915/kernel/-/issues/16707">i915#16707</a> / <a h=
ref=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4538">i915#4=
538</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issue=
s/5190">i915#5190</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/dr=
m-tip/Patchwork_171551v1/shard-dg2-4/igt@kms_big_fb@y-tiled-max-hw-stride-6=
4bpp-rotate-180-hflip-async-flip.html">SKIP</a> (<a href=3D"https://gitlab.=
freedesktop.org/drm/i915/kernel/-/issues/4538">i915#4538</a> / <a href=3D"h=
ttps://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5190">i915#5190</a>)=
 +12 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@yf-tiled-addfb-size-offset-overflow:</p>
<ul>
<li>shard-dg2:          (<a href=3D"https://intel-gfx-ci.01.org/tree/drm-ti=
p/CI_DRM_18943/shard-dg2-6/igt@kms_big_fb@yf-tiled-addfb-size-offset-overfl=
ow.html">SKIP</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/CI_D=
RM_18943/shard-dg2-10/igt@kms_big_fb@yf-tiled-addfb-size-offset-overflow.ht=
ml">SKIP</a>) (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/=
issues/16707">i915#16707</a> / <a href=3D"https://gitlab.freedesktop.org/dr=
m/i915/kernel/-/issues/5190">i915#5190</a>) -&gt; <a href=3D"https://intel-=
gfx-ci.01.org/tree/drm-tip/Patchwork_171551v1/shard-dg2-4/igt@kms_big_fb@yf=
-tiled-addfb-size-offset-overflow.html">SKIP</a> (<a href=3D"https://gitlab=
.freedesktop.org/drm/i915/kernel/-/issues/5190">i915#5190</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@bad-pixel-format-y-tiled-gen12-mc-ccs:</p>
<ul>
<li>shard-dg2:          (<a href=3D"https://intel-gfx-ci.01.org/tree/drm-ti=
p/CI_DRM_18943/shard-dg2-10/igt@kms_ccs@bad-pixel-format-y-tiled-gen12-mc-c=
cs.html">SKIP</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/CI_D=
RM_18943/shard-dg2-1/igt@kms_ccs@bad-pixel-format-y-tiled-gen12-mc-ccs.html=
">SKIP</a>) (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/is=
sues/10307">i915#10307</a> / <a href=3D"https://gitlab.freedesktop.org/drm/=
i915/kernel/-/issues/16707">i915#16707</a> / <a href=3D"https://gitlab.free=
desktop.org/drm/i915/kernel/-/issues/6095">i915#6095</a>) -&gt; <a href=3D"=
https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_171551v1/shard-dg2-3/igt=
@kms_ccs@bad-pixel-format-y-tiled-gen12-mc-ccs.html">SKIP</a> (<a href=3D"h=
ttps://gitlab.freedesktop.org/drm/i915/kernel/-/issues/10307">i915#10307</a=
> / <a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6095=
">i915#6095</a>) +10 other tests skip</li>
<li>shard-rkl:          (<a href=3D"https://intel-gfx-ci.01.org/tree/drm-ti=
p/CI_DRM_18943/shard-rkl-3/igt@kms_ccs@bad-pixel-format-y-tiled-gen12-mc-cc=
s.html">SKIP</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/CI_DR=
M_18943/shard-rkl-6/igt@kms_ccs@bad-pixel-format-y-tiled-gen12-mc-ccs.html"=
>SKIP</a>) (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/iss=
ues/14098">i915#14098</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i=
915/kernel/-/issues/14544">i915#14544</a> / <a href=3D"https://gitlab.freed=
esktop.org/drm/i915/kernel/-/issues/6095">i915#6095</a>) -&gt; <a href=3D"h=
ttps://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_171551v1/shard-rkl-5/igt@=
kms_ccs@bad-pixel-format-y-tiled-gen12-mc-ccs.html">SKIP</a> (<a href=3D"ht=
tps://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14098">i915#14098</a>=
 / <a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6095"=
>i915#6095</a>) +7 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@bad-rotation-90-4-tiled-lnl-ccs:</p>
<ul>
<li>shard-dg2:          (<a href=3D"https://intel-gfx-ci.01.org/tree/drm-ti=
p/CI_DRM_18943/shard-dg2-1/igt@kms_ccs@bad-rotation-90-4-tiled-lnl-ccs.html=
">SKIP</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_1894=
3/shard-dg2-6/igt@kms_ccs@bad-rotation-90-4-tiled-lnl-ccs.html">SKIP</a>) (=
<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12313">i=
915#12313</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/Pa=
tchwork_171551v1/shard-dg2-10/igt@kms_ccs@bad-rotation-90-4-tiled-lnl-ccs.h=
tml">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/=
issues/16707">i915#16707</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@bad-rotation-90-y-tiled-ccs:</p>
<ul>
<li>shard-dg2:          (<a href=3D"https://intel-gfx-ci.01.org/tree/drm-ti=
p/CI_DRM_18943/shard-dg2-6/igt@kms_ccs@bad-rotation-90-y-tiled-ccs.html">SK=
IP</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18943/sh=
ard-dg2-1/igt@kms_ccs@bad-rotation-90-y-tiled-ccs.html">SKIP</a>) (<a href=
=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/10307">i915#103=
07</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues=
/6095">i915#6095</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm=
-tip/Patchwork_171551v1/shard-dg2-10/igt@kms_ccs@bad-rotation-90-y-tiled-cc=
s.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel=
/-/issues/16707">i915#16707</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@ccs-on-another-bo-4-tiled-mtl-rc-ccs@pipe-b-hdmi-a-2:</p>
<ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_18943/shard-rkl-7/igt@kms_ccs@ccs-on-another-bo-4-tiled-mtl-rc-ccs@=
pipe-b-hdmi-a-2.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/d=
rm/i915/kernel/-/issues/6095">i915#6095</a>) -&gt; <a href=3D"https://intel=
-gfx-ci.01.org/tree/drm-tip/Patchwork_171551v1/shard-rkl-6/igt@kms_ccs@ccs-=
on-another-bo-4-tiled-mtl-rc-ccs@pipe-b-hdmi-a-2.html">SKIP</a> (<a href=3D=
"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14544<=
/a> / <a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/60=
95">i915#6095</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@ccs-on-another-bo-4-tiled-mtl-rc-ccs@pipe-c-hdmi-a-2:</p>
<ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_18943/shard-rkl-7/igt@kms_ccs@ccs-on-another-bo-4-tiled-mtl-rc-ccs@=
pipe-c-hdmi-a-2.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/d=
rm/i915/kernel/-/issues/14098">i915#14098</a> / <a href=3D"https://gitlab.f=
reedesktop.org/drm/i915/kernel/-/issues/6095">i915#6095</a>) -&gt; <a href=
=3D"https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_171551v1/shard-rkl-6=
/igt@kms_ccs@ccs-on-another-bo-4-tiled-mtl-rc-ccs@pipe-c-hdmi-a-2.html">SKI=
P</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/1=
4098">i915#14098</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i915/k=
ernel/-/issues/14544">i915#14544</a> / <a href=3D"https://gitlab.freedeskto=
p.org/drm/i915/kernel/-/issues/6095">i915#6095</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-basic-4-tiled-lnl-ccs:</p>
<ul>
<li>shard-rkl:          (<a href=3D"https://intel-gfx-ci.01.org/tree/drm-ti=
p/CI_DRM_18943/shard-rkl-5/igt@kms_ccs@crc-primary-basic-4-tiled-lnl-ccs.ht=
ml">SKIP</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18=
943/shard-rkl-2/igt@kms_ccs@crc-primary-basic-4-tiled-lnl-ccs.html">SKIP</a=
>) (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/1231=
3">i915#12313</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-ti=
p/Patchwork_171551v1/shard-rkl-6/igt@kms_ccs@crc-primary-basic-4-tiled-lnl-=
ccs.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kern=
el/-/issues/12313">i915#12313</a> / <a href=3D"https://gitlab.freedesktop.o=
rg/drm/i915/kernel/-/issues/14544">i915#14544</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-basic-y-tiled-gen12-mc-ccs:</p>
<ul>
<li>shard-dg2:          (<a href=3D"https://intel-gfx-ci.01.org/tree/drm-ti=
p/CI_DRM_18943/shard-dg2-10/igt@kms_ccs@crc-primary-basic-y-tiled-gen12-mc-=
ccs.html">SKIP</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/CI_=
DRM_18943/shard-dg2-4/igt@kms_ccs@crc-primary-basic-y-tiled-gen12-mc-ccs.ht=
ml">SKIP</a>) (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/=
issues/10307">i915#10307</a> / <a href=3D"https://gitlab.freedesktop.org/dr=
m/i915/kernel/-/issues/16707">i915#16707</a> / <a href=3D"https://gitlab.fr=
eedesktop.org/drm/i915/kernel/-/issues/6095">i915#6095</a>) -&gt; <a href=
=3D"https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_171551v1/shard-dg2-1=
0/igt@kms_ccs@crc-primary-basic-y-tiled-gen12-mc-ccs.html">SKIP</a> (<a hre=
f=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16707">i915#16=
707</a>) +8 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-rotation-180-4-tiled-bmg-ccs:</p>
<ul>
<li>shard-dg2:          (<a href=3D"https://intel-gfx-ci.01.org/tree/drm-ti=
p/CI_DRM_18943/shard-dg2-10/igt@kms_ccs@crc-primary-rotation-180-4-tiled-bm=
g-ccs.html">SKIP</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/C=
I_DRM_18943/shard-dg2-3/igt@kms_ccs@crc-primary-rotation-180-4-tiled-bmg-cc=
s.html">SKIP</a>) (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kerne=
l/-/issues/12313">i915#12313</a> / <a href=3D"https://gitlab.freedesktop.or=
g/drm/i915/kernel/-/issues/16707">i915#16707</a>) -&gt; <a href=3D"https://=
intel-gfx-ci.01.org/tree/drm-tip/Patchwork_171551v1/shard-dg2-7/igt@kms_ccs=
@crc-primary-rotation-180-4-tiled-bmg-ccs.html">SKIP</a> (<a href=3D"https:=
//gitlab.freedesktop.org/drm/i915/kernel/-/issues/12313">i915#12313</a>) +1=
 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-rotation-180-4-tiled-lnl-ccs:</p>
<ul>
<li>shard-dg2:          (<a href=3D"https://intel-gfx-ci.01.org/tree/drm-ti=
p/CI_DRM_18943/shard-dg2-10/igt@kms_ccs@crc-primary-rotation-180-4-tiled-ln=
l-ccs.html">SKIP</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/C=
I_DRM_18943/shard-dg2-4/igt@kms_ccs@crc-primary-rotation-180-4-tiled-lnl-cc=
s.html">SKIP</a>) (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kerne=
l/-/issues/12313">i915#12313</a> / <a href=3D"https://gitlab.freedesktop.or=
g/drm/i915/kernel/-/issues/16707">i915#16707</a>) -&gt; <a href=3D"https://=
intel-gfx-ci.01.org/tree/drm-tip/Patchwork_171551v1/shard-dg2-10/igt@kms_cc=
s@crc-primary-rotation-180-4-tiled-lnl-ccs.html">SKIP</a> (<a href=3D"https=
://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16707">i915#16707</a>)</=
li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-suspend-y-tiled-gen12-mc-ccs:</p>
<ul>
<li>shard-dg2:          (<a href=3D"https://intel-gfx-ci.01.org/tree/drm-ti=
p/CI_DRM_18943/shard-dg2-10/igt@kms_ccs@crc-primary-suspend-y-tiled-gen12-m=
c-ccs.html">SKIP</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/C=
I_DRM_18943/shard-dg2-1/igt@kms_ccs@crc-primary-suspend-y-tiled-gen12-mc-cc=
s.html">SKIP</a>) (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kerne=
l/-/issues/16707">i915#16707</a> / <a href=3D"https://gitlab.freedesktop.or=
g/drm/i915/kernel/-/issues/6095">i915#6095</a>) -&gt; <a href=3D"https://in=
tel-gfx-ci.01.org/tree/drm-tip/Patchwork_171551v1/shard-dg2-3/igt@kms_ccs@c=
rc-primary-suspend-y-tiled-gen12-mc-ccs.html">SKIP</a> (<a href=3D"https://=
gitlab.freedesktop.org/drm/i915/kernel/-/issues/6095">i915#6095</a>) +2 oth=
er tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-sprite-planes-basic-yf-tiled-ccs:</p>
<ul>
<li>shard-rkl:          (<a href=3D"https://intel-gfx-ci.01.org/tree/drm-ti=
p/CI_DRM_18943/shard-rkl-2/igt@kms_ccs@crc-sprite-planes-basic-yf-tiled-ccs=
.html">SKIP</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM=
_18943/shard-rkl-5/igt@kms_ccs@crc-sprite-planes-basic-yf-tiled-ccs.html">S=
KIP</a>) (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issue=
s/14098">i915#14098</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i91=
5/kernel/-/issues/6095">i915#6095</a>) -&gt; <a href=3D"https://intel-gfx-c=
i.01.org/tree/drm-tip/Patchwork_171551v1/shard-rkl-6/igt@kms_ccs@crc-sprite=
-planes-basic-yf-tiled-ccs.html">SKIP</a> (<a href=3D"https://gitlab.freede=
sktop.org/drm/i915/kernel/-/issues/14098">i915#14098</a> / <a href=3D"https=
://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a> / =
<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6095">i9=
15#6095</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@random-ccs-data-y-tiled-gen12-rc-ccs-cc:</p>
<ul>
<li>shard-dg2:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_18943/shard-dg2-8/igt@kms_ccs@random-ccs-data-y-tiled-gen12-rc-ccs-=
cc.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kerne=
l/-/issues/10307">i915#10307</a> / <a href=3D"https://gitlab.freedesktop.or=
g/drm/i915/kernel/-/issues/6095">i915#6095</a>) -&gt; <a href=3D"https://in=
tel-gfx-ci.01.org/tree/drm-tip/Patchwork_171551v1/shard-dg2-10/igt@kms_ccs@=
random-ccs-data-y-tiled-gen12-rc-ccs-cc.html">SKIP</a> (<a href=3D"https://=
gitlab.freedesktop.org/drm/i915/kernel/-/issues/16707">i915#16707</a>) +1 o=
ther test skip</li>
</ul>
</li>
<li>
<p>igt@kms_cdclk@mode-transition-all-outputs:</p>
<ul>
<li>shard-rkl:          (<a href=3D"https://intel-gfx-ci.01.org/tree/drm-ti=
p/CI_DRM_18943/shard-rkl-2/igt@kms_cdclk@mode-transition-all-outputs.html">=
SKIP</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18943/=
shard-rkl-5/igt@kms_cdclk@mode-transition-all-outputs.html">SKIP</a>) (<a h=
ref=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3742">i915#3=
742</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/Patchwor=
k_171551v1/shard-rkl-6/igt@kms_cdclk@mode-transition-all-outputs.html">SKIP=
</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14=
544">i915#14544</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i915/ke=
rnel/-/issues/3742">i915#3742</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cdclk@plane-scaling:</p>
<ul>
<li>shard-dg2:          (<a href=3D"https://intel-gfx-ci.01.org/tree/drm-ti=
p/CI_DRM_18943/shard-dg2-6/igt@kms_cdclk@plane-scaling.html">SKIP</a>, <a h=
ref=3D"https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18943/shard-dg2-10/i=
gt@kms_cdclk@plane-scaling.html">SKIP</a>) (<a href=3D"https://gitlab.freed=
esktop.org/drm/i915/kernel/-/issues/13783">i915#13783</a> / <a href=3D"http=
s://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16707">i915#16707</a>) =
-&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_171551v=
1/shard-dg2-4/igt@kms_cdclk@plane-scaling.html">SKIP</a> (<a href=3D"https:=
//gitlab.freedesktop.org/drm/i915/kernel/-/issues/13783">i915#13783</a>)</l=
i>
</ul>
</li>
<li>
<p>igt@kms_chamelium_audio@hdmi-audio:</p>
<ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_18943/shard-rkl-7/igt@kms_chamelium_audio@hdmi-audio.html">SKIP</a>=
 (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11151"=
>i915#11151</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel=
/-/issues/7828">i915#7828</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/Patchwork_171551v1/shard-rkl-6/igt@kms_chamelium_audio@hdmi-a=
udio.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/ker=
nel/-/issues/11151">i915#11151</a> / <a href=3D"https://gitlab.freedesktop.=
org/drm/i915/kernel/-/issues/14544">i915#14544</a> / <a href=3D"https://git=
lab.freedesktop.org/drm/i915/kernel/-/issues/7828">i915#7828</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_color_pipeline@plane-lut1d-ctm3x4-lut1d:</p>
<ul>
<li>shard-rkl:          (<a href=3D"https://intel-gfx-ci.01.org/tree/drm-ti=
p/CI_DRM_18943/shard-rkl-3/igt@kms_chamelium_color_pipeline@plane-lut1d-ctm=
3x4-lut1d.html">SKIP</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/drm-t=
ip/CI_DRM_18943/shard-rkl-6/igt@kms_chamelium_color_pipeline@plane-lut1d-ct=
m3x4-lut1d.html">SKIP</a>) (<a href=3D"https://gitlab.freedesktop.org/drm/i=
915/kernel/-/issues/14544">i915#14544</a> / <a href=3D"https://gitlab.freed=
esktop.org/drm/i915/kernel/-/issues/16471">i915#16471</a>) -&gt; <a href=3D=
"https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_171551v1/shard-rkl-2/ig=
t@kms_chamelium_color_pipeline@plane-lut1d-ctm3x4-lut1d.html">SKIP</a> (<a =
href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16471">i915=
#16471</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_hpd@hdmi-hpd-storm-disable:</p>
<ul>
<li>shard-rkl:          (<a href=3D"https://intel-gfx-ci.01.org/tree/drm-ti=
p/CI_DRM_18943/shard-rkl-6/igt@kms_chamelium_hpd@hdmi-hpd-storm-disable.htm=
l">SKIP</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_189=
43/shard-rkl-1/igt@kms_chamelium_hpd@hdmi-hpd-storm-disable.html">SKIP</a>)=
 (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11151"=
>i915#11151</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel=
/-/issues/14544">i915#14544</a> / <a href=3D"https://gitlab.freedesktop.org=
/drm/i915/kernel/-/issues/7828">i915#7828</a>) -&gt; <a href=3D"https://int=
el-gfx-ci.01.org/tree/drm-tip/Patchwork_171551v1/shard-rkl-2/igt@kms_chamel=
ium_hpd@hdmi-hpd-storm-disable.html">SKIP</a> (<a href=3D"https://gitlab.fr=
eedesktop.org/drm/i915/kernel/-/issues/11151">i915#11151</a> / <a href=3D"h=
ttps://gitlab.freedesktop.org/drm/i915/kernel/-/issues/7828">i915#7828</a>)=
 +5 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_hpd@hdmi-hpd-with-enabled-mode:</p>
<ul>
<li>shard-rkl:          (<a href=3D"https://intel-gfx-ci.01.org/tree/drm-ti=
p/CI_DRM_18943/shard-rkl-2/igt@kms_chamelium_hpd@hdmi-hpd-with-enabled-mode=
.html">SKIP</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM=
_18943/shard-rkl-5/igt@kms_chamelium_hpd@hdmi-hpd-with-enabled-mode.html">S=
KIP</a>) (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issue=
s/11151">i915#11151</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i91=
5/kernel/-/issues/7828">i915#7828</a>) -&gt; <a href=3D"https://intel-gfx-c=
i.01.org/tree/drm-tip/Patchwork_171551v1/shard-rkl-6/igt@kms_chamelium_hpd@=
hdmi-hpd-with-enabled-mode.html">SKIP</a> (<a href=3D"https://gitlab.freede=
sktop.org/drm/i915/kernel/-/issues/11151">i915#11151</a> / <a href=3D"https=
://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a> / =
<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/7828">i9=
15#7828</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@content-type-change:</p>
<ul>
<li>shard-dg2:          (<a href=3D"https://intel-gfx-ci.01.org/tree/drm-ti=
p/CI_DRM_18943/shard-dg2-4/igt@kms_content_protection@content-type-change.h=
tml">SKIP</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_1=
8943/shard-dg2-10/igt@kms_content_protection@content-type-change.html">SKIP=
</a>) (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/1=
5865">i915#15865</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i915/k=
ernel/-/issues/16707">i915#16707</a>) -&gt; <a href=3D"https://intel-gfx-ci=
.01.org/tree/drm-tip/Patchwork_171551v1/shard-dg2-10/igt@kms_content_protec=
tion@content-type-change.html">SKIP</a> (<a href=3D"https://gitlab.freedesk=
top.org/drm/i915/kernel/-/issues/16707">i915#16707</a>) +1 other test skip<=
/li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@dp-mst-lic-type-1:</p>
<ul>
<li>shard-rkl:          (<a href=3D"https://intel-gfx-ci.01.org/tree/drm-ti=
p/CI_DRM_18943/shard-rkl-3/igt@kms_content_protection@dp-mst-lic-type-1.htm=
l">SKIP</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_189=
43/shard-rkl-6/igt@kms_content_protection@dp-mst-lic-type-1.html">SKIP</a>)=
 (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544"=
>i915#14544</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel=
/-/issues/15330">i915#15330</a> / <a href=3D"https://gitlab.freedesktop.org=
/drm/i915/kernel/-/issues/3116">i915#3116</a>) -&gt; <a href=3D"https://int=
el-gfx-ci.01.org/tree/drm-tip/Patchwork_171551v1/shard-rkl-3/igt@kms_conten=
t_protection@dp-mst-lic-type-1.html">SKIP</a> (<a href=3D"https://gitlab.fr=
eedesktop.org/drm/i915/kernel/-/issues/15330">i915#15330</a> / <a href=3D"h=
ttps://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3116">i915#3116</a>)=
</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@dp-mst-type-0:</p>
<ul>
<li>shard-dg2:          (<a href=3D"https://intel-gfx-ci.01.org/tree/drm-ti=
p/CI_DRM_18943/shard-dg2-1/igt@kms_content_protection@dp-mst-type-0.html">S=
KIP</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18943/s=
hard-dg2-6/igt@kms_content_protection@dp-mst-type-0.html">SKIP</a>) (<a hre=
f=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15330">i915#15=
330</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issue=
s/3299">i915#3299</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/dr=
m-tip/Patchwork_171551v1/shard-dg2-10/igt@kms_content_protection@dp-mst-typ=
e-0.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kern=
el/-/issues/16707">i915#16707</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@dp-mst-type-0-hdcp14:</p>
<ul>
<li>shard-dg2:          (<a href=3D"https://intel-gfx-ci.01.org/tree/drm-ti=
p/CI_DRM_18943/shard-dg2-10/igt@kms_content_protection@dp-mst-type-0-hdcp14=
.html">SKIP</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM=
_18943/shard-dg2-4/igt@kms_content_protection@dp-mst-type-0-hdcp14.html">SK=
IP</a>) (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues=
/15330">i915#15330</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i915=
/kernel/-/issues/16707">i915#16707</a>) -&gt; <a href=3D"https://intel-gfx-=
ci.01.org/tree/drm-tip/Patchwork_171551v1/shard-dg2-10/igt@kms_content_prot=
ection@dp-mst-type-0-hdcp14.html">SKIP</a> (<a href=3D"https://gitlab.freed=
esktop.org/drm/i915/kernel/-/issues/16707">i915#16707</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@dp-mst-type-0-suspend-resume:</p>
<ul>
<li>shard-dg2:          (<a href=3D"https://intel-gfx-ci.01.org/tree/drm-ti=
p/CI_DRM_18943/shard-dg2-3/igt@kms_content_protection@dp-mst-type-0-suspend=
-resume.html">SKIP</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_18943/shard-dg2-10/igt@kms_content_protection@dp-mst-type-0-suspend=
-resume.html">SKIP</a>) (<a href=3D"https://gitlab.freedesktop.org/drm/i915=
/kernel/-/issues/15330">i915#15330</a> / <a href=3D"https://gitlab.freedesk=
top.org/drm/i915/kernel/-/issues/16707">i915#16707</a>) -&gt; <a href=3D"ht=
tps://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_171551v1/shard-dg2-7/igt@k=
ms_content_protection@dp-mst-type-0-suspend-resume.html">SKIP</a> (<a href=
=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15330">i915#153=
30</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@dp-mst-type-1:</p>
<ul>
<li>shard-dg2:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_18943/shard-dg2-8/igt@kms_content_protection@dp-mst-type-1.html">SK=
IP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/=
15330">i915#15330</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i915/=
kernel/-/issues/3299">i915#3299</a>) -&gt; <a href=3D"https://intel-gfx-ci.=
01.org/tree/drm-tip/Patchwork_171551v1/shard-dg2-10/igt@kms_content_protect=
ion@dp-mst-type-1.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org=
/drm/i915/kernel/-/issues/16707">i915#16707</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@mei-interface:</p>
<ul>
<li>shard-dg1:          (<a href=3D"https://intel-gfx-ci.01.org/tree/drm-ti=
p/CI_DRM_18943/shard-dg1-19/igt@kms_content_protection@mei-interface.html">=
SKIP</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18943/=
shard-dg1-13/igt@kms_content_protection@mei-interface.html">SKIP</a>) (<a h=
ref=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15865">i915#=
15865</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/iss=
ues/9433">i915#9433</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/=
drm-tip/Patchwork_171551v1/shard-dg1-12/igt@kms_content_protection@mei-inte=
rface.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/ke=
rnel/-/issues/9433">i915#9433</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@srm:</p>
<ul>
<li>shard-dg2:          (<a href=3D"https://intel-gfx-ci.01.org/tree/drm-ti=
p/CI_DRM_18943/shard-dg2-10/igt@kms_content_protection@srm.html">SKIP</a>, =
<a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18943/shard-dg2-=
3/igt@kms_content_protection@srm.html">SKIP</a>) (<a href=3D"https://gitlab=
.freedesktop.org/drm/i915/kernel/-/issues/15865">i915#15865</a> / <a href=
=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16707">i915#167=
07</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork=
_171551v1/shard-dg2-7/igt@kms_content_protection@srm.html">SKIP</a> (<a hre=
f=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15865">i915#15=
865</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@suspend-resume:</p>
<ul>
<li>shard-rkl:          (<a href=3D"https://intel-gfx-ci.01.org/tree/drm-ti=
p/CI_DRM_18943/shard-rkl-6/igt@kms_content_protection@suspend-resume.html">=
SKIP</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18943/=
shard-rkl-1/igt@kms_content_protection@suspend-resume.html">SKIP</a>) (<a h=
ref=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#=
14544</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/iss=
ues/15865">i915#15865</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tre=
e/drm-tip/Patchwork_171551v1/shard-rkl-2/igt@kms_content_protection@suspend=
-resume.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/=
kernel/-/issues/15865">i915#15865</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-onscreen-32x10:</p>
<ul>
<li>shard-rkl:          (<a href=3D"https://intel-gfx-ci.01.org/tree/drm-ti=
p/CI_DRM_18943/shard-rkl-6/igt@kms_cursor_crc@cursor-onscreen-32x10.html">S=
KIP</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18943/s=
hard-rkl-1/igt@kms_cursor_crc@cursor-onscreen-32x10.html">SKIP</a>) (<a hre=
f=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14=
544</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issue=
s/3555">i915#3555</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/dr=
m-tip/Patchwork_171551v1/shard-rkl-2/igt@kms_cursor_crc@cursor-onscreen-32x=
10.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kerne=
l/-/issues/3555">i915#3555</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-onscreen-512x512:</p>
<ul>
<li>shard-dg2:          (<a href=3D"https://intel-gfx-ci.01.org/tree/drm-ti=
p/CI_DRM_18943/shard-dg2-6/igt@kms_cursor_crc@cursor-onscreen-512x512.html"=
>SKIP</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18943=
/shard-dg2-10/igt@kms_cursor_crc@cursor-onscreen-512x512.html">SKIP</a>) (<=
a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13049">i9=
15#13049</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/=
issues/16707">i915#16707</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/Patchwork_171551v1/shard-dg2-4/igt@kms_cursor_crc@cursor-onscr=
een-512x512.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i=
915/kernel/-/issues/13049">i915#13049</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-onscreen-max-size:</p>
<ul>
<li>shard-dg2:          (<a href=3D"https://intel-gfx-ci.01.org/tree/drm-ti=
p/CI_DRM_18943/shard-dg2-10/igt@kms_cursor_crc@cursor-onscreen-max-size.htm=
l">SKIP</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_189=
43/shard-dg2-7/igt@kms_cursor_crc@cursor-onscreen-max-size.html">SKIP</a>) =
(<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16707">=
i915#16707</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/=
-/issues/3555">i915#3555</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/Patchwork_171551v1/shard-dg2-7/igt@kms_cursor_crc@cursor-onscr=
een-max-size.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/=
i915/kernel/-/issues/3555">i915#3555</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-random-512x170:</p>
<ul>
<li>shard-dg2:          (<a href=3D"https://intel-gfx-ci.01.org/tree/drm-ti=
p/CI_DRM_18943/shard-dg2-6/igt@kms_cursor_crc@cursor-random-512x170.html">S=
KIP</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18943/s=
hard-dg2-1/igt@kms_cursor_crc@cursor-random-512x170.html">SKIP</a>) (<a hre=
f=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13049">i915#13=
049</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/Patchwor=
k_171551v1/shard-dg2-10/igt@kms_cursor_crc@cursor-random-512x170.html">SKIP=
</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16=
707">i915#16707</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-random-max-size:</p>
<ul>
<li>shard-dg2:          (<a href=3D"https://intel-gfx-ci.01.org/tree/drm-ti=
p/CI_DRM_18943/shard-dg2-4/igt@kms_cursor_crc@cursor-random-max-size.html">=
SKIP</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18943/=
shard-dg2-10/igt@kms_cursor_crc@cursor-random-max-size.html">SKIP</a>) (<a =
href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16707">i915=
#16707</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/is=
sues/3555">i915#3555</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree=
/drm-tip/Patchwork_171551v1/shard-dg2-10/igt@kms_cursor_crc@cursor-random-m=
ax-size.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/=
kernel/-/issues/16707">i915#16707</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-sliding-512x170:</p>
<ul>
<li>shard-dg2:          (<a href=3D"https://intel-gfx-ci.01.org/tree/drm-ti=
p/CI_DRM_18943/shard-dg2-8/igt@kms_cursor_crc@cursor-sliding-512x170.html">=
SKIP</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18943/=
shard-dg2-10/igt@kms_cursor_crc@cursor-sliding-512x170.html">SKIP</a>) (<a =
href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13049">i915=
#13049</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/is=
sues/16707">i915#16707</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tr=
ee/drm-tip/Patchwork_171551v1/shard-dg2-10/igt@kms_cursor_crc@cursor-slidin=
g-512x170.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i91=
5/kernel/-/issues/16707">i915#16707</a>)</li>
<li>shard-rkl:          (<a href=3D"https://intel-gfx-ci.01.org/tree/drm-ti=
p/CI_DRM_18943/shard-rkl-1/igt@kms_cursor_crc@cursor-sliding-512x170.html">=
SKIP</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18943/=
shard-rkl-6/igt@kms_cursor_crc@cursor-sliding-512x170.html">SKIP</a>) (<a h=
ref=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13049">i915#=
13049</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/iss=
ues/14544">i915#14544</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tre=
e/drm-tip/Patchwork_171551v1/shard-rkl-2/igt@kms_cursor_crc@cursor-sliding-=
512x170.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/=
kernel/-/issues/13049">i915#13049</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@2x-cursor-vs-flip-legacy:</p>
<ul>
<li>shard-dg2:          (<a href=3D"https://intel-gfx-ci.01.org/tree/drm-ti=
p/CI_DRM_18943/shard-dg2-8/igt@kms_cursor_legacy@2x-cursor-vs-flip-legacy.h=
tml">SKIP</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_1=
8943/shard-dg2-10/igt@kms_cursor_legacy@2x-cursor-vs-flip-legacy.html">SKIP=
</a>) (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/1=
3046">i915#13046</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i915/k=
ernel/-/issues/16707">i915#16707</a> / <a href=3D"https://gitlab.freedeskto=
p.org/drm/i915/kernel/-/issues/5354">i915#5354</a>) -&gt; <a href=3D"https:=
//intel-gfx-ci.01.org/tree/drm-tip/Patchwork_171551v1/shard-dg2-10/igt@kms_=
cursor_legacy@2x-cursor-vs-flip-legacy.html">SKIP</a> (<a href=3D"https://g=
itlab.freedesktop.org/drm/i915/kernel/-/issues/16707">i915#16707</a>) +2 ot=
her tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@2x-flip-vs-cursor-legacy:</p>
<ul>
<li>shard-rkl:          (<a href=3D"https://intel-gfx-ci.01.org/tree/drm-ti=
p/CI_DRM_18943/shard-rkl-6/igt@kms_cursor_legacy@2x-flip-vs-cursor-legacy.h=
tml">SKIP</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_1=
8943/shard-rkl-1/igt@kms_cursor_legacy@2x-flip-vs-cursor-legacy.html">SKIP<=
/a>) (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14=
544">i915#14544</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-=
tip/Patchwork_171551v1/shard-rkl-2/igt@kms_cursor_legacy@2x-flip-vs-cursor-=
legacy.html">SKIP</a> +67 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@basic-busy-flip-before-cursor-atomic:</p>
<ul>
<li>shard-dg2:          (<a href=3D"https://intel-gfx-ci.01.org/tree/drm-ti=
p/CI_DRM_18943/shard-dg2-10/igt@kms_cursor_legacy@basic-busy-flip-before-cu=
rsor-atomic.html">SKIP</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/drm=
-tip/CI_DRM_18943/shard-dg2-4/igt@kms_cursor_legacy@basic-busy-flip-before-=
cursor-atomic.html">SKIP</a>) (<a href=3D"https://gitlab.freedesktop.org/dr=
m/i915/kernel/-/issues/11190">i915#11190</a> / <a href=3D"https://gitlab.fr=
eedesktop.org/drm/i915/kernel/-/issues/16707">i915#16707</a> / <a href=3D"h=
ttps://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4103">i915#4103</a>)=
 -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_171551=
v1/shard-dg2-10/igt@kms_cursor_legacy@basic-busy-flip-before-cursor-atomic.=
html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-=
/issues/11190">i915#11190</a> / <a href=3D"https://gitlab.freedesktop.org/d=
rm/i915/kernel/-/issues/16707">i915#16707</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@cursorb-vs-flipa-varying-size:</p>
<ul>
<li>shard-dg2:          (<a href=3D"https://intel-gfx-ci.01.org/tree/drm-ti=
p/CI_DRM_18943/shard-dg2-6/igt@kms_cursor_legacy@cursorb-vs-flipa-varying-s=
ize.html">SKIP</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/CI_=
DRM_18943/shard-dg2-1/igt@kms_cursor_legacy@cursorb-vs-flipa-varying-size.h=
tml">SKIP</a>) (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-=
/issues/13046">i915#13046</a> / <a href=3D"https://gitlab.freedesktop.org/d=
rm/i915/kernel/-/issues/5354">i915#5354</a>) -&gt; <a href=3D"https://intel=
-gfx-ci.01.org/tree/drm-tip/Patchwork_171551v1/shard-dg2-10/igt@kms_cursor_=
legacy@cursorb-vs-flipa-varying-size.html">SKIP</a> (<a href=3D"https://git=
lab.freedesktop.org/drm/i915/kernel/-/issues/16707">i915#16707</a>) +1 othe=
r test skip</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@cursorb-vs-flipb-toggle:</p>
<ul>
<li>shard-dg2:          (<a href=3D"https://intel-gfx-ci.01.org/tree/drm-ti=
p/CI_DRM_18943/shard-dg2-3/igt@kms_cursor_legacy@cursorb-vs-flipb-toggle.ht=
ml">SKIP</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18=
943/shard-dg2-10/igt@kms_cursor_legacy@cursorb-vs-flipb-toggle.html">SKIP</=
a>) (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/130=
46">i915#13046</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i915/ker=
nel/-/issues/16707">i915#16707</a> / <a href=3D"https://gitlab.freedesktop.=
org/drm/i915/kernel/-/issues/5354">i915#5354</a>) -&gt; <a href=3D"https://=
intel-gfx-ci.01.org/tree/drm-tip/Patchwork_171551v1/shard-dg2-7/igt@kms_cur=
sor_legacy@cursorb-vs-flipb-toggle.html">SKIP</a> (<a href=3D"https://gitla=
b.freedesktop.org/drm/i915/kernel/-/issues/13046">i915#13046</a> / <a href=
=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5354">i915#5354=
</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@short-busy-flip-before-cursor-toggle:</p>
<ul>
<li>shard-dg2:          (<a href=3D"https://intel-gfx-ci.01.org/tree/drm-ti=
p/CI_DRM_18943/shard-dg2-10/igt@kms_cursor_legacy@short-busy-flip-before-cu=
rsor-toggle.html">SKIP</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/drm=
-tip/CI_DRM_18943/shard-dg2-1/igt@kms_cursor_legacy@short-busy-flip-before-=
cursor-toggle.html">SKIP</a>) (<a href=3D"https://gitlab.freedesktop.org/dr=
m/i915/kernel/-/issues/16707">i915#16707</a> / <a href=3D"https://gitlab.fr=
eedesktop.org/drm/i915/kernel/-/issues/4103">i915#4103</a>) -&gt; <a href=
=3D"https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_171551v1/shard-dg2-3=
/igt@kms_cursor_legacy@short-busy-flip-before-cursor-toggle.html">SKIP</a> =
(<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4103">i=
915#4103</a>) +1 other test skip</li>
<li>shard-rkl:          (<a href=3D"https://intel-gfx-ci.01.org/tree/drm-ti=
p/CI_DRM_18943/shard-rkl-6/igt@kms_cursor_legacy@short-busy-flip-before-cur=
sor-toggle.html">SKIP</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/drm-=
tip/CI_DRM_18943/shard-rkl-3/igt@kms_cursor_legacy@short-busy-flip-before-c=
ursor-toggle.html">SKIP</a>) (<a href=3D"https://gitlab.freedesktop.org/drm=
/i915/kernel/-/issues/14544">i915#14544</a> / <a href=3D"https://gitlab.fre=
edesktop.org/drm/i915/kernel/-/issues/4103">i915#4103</a>) -&gt; <a href=3D=
"https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_171551v1/shard-rkl-5/ig=
t@kms_cursor_legacy@short-busy-flip-before-cursor-toggle.html">SKIP</a> (<a=
 href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4103">i915=
#4103</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_dirtyfb@drrs-dirtyfb-ioctl:</p>
<ul>
<li>shard-dg2:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_18943/shard-dg2-8/igt@kms_dirtyfb@drrs-dirtyfb-ioctl.html">SKIP</a>=
 (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9833">=
i915#9833</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/Pa=
tchwork_171551v1/shard-dg2-10/igt@kms_dirtyfb@drrs-dirtyfb-ioctl.html">SKIP=
</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16=
707">i915#16707</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_dp_link_training@uhbr-sst:</p>
<ul>
<li>shard-rkl:          (<a href=3D"https://intel-gfx-ci.01.org/tree/drm-ti=
p/CI_DRM_18943/shard-rkl-6/igt@kms_dp_link_training@uhbr-sst.html">SKIP</a>=
, <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18943/shard-rk=
l-3/igt@kms_dp_link_training@uhbr-sst.html">SKIP</a>) (<a href=3D"https://g=
itlab.freedesktop.org/drm/i915/kernel/-/issues/13748">i915#13748</a> / <a h=
ref=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#=
14544</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/Patchw=
ork_171551v1/shard-rkl-5/igt@kms_dp_link_training@uhbr-sst.html">SKIP</a> (=
<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13748">i=
915#13748</a>)</li>
<li>shard-dg2:          (<a href=3D"https://intel-gfx-ci.01.org/tree/drm-ti=
p/CI_DRM_18943/shard-dg2-10/igt@kms_dp_link_training@uhbr-sst.html">SKIP</a=
>, <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18943/shard-d=
g2-1/igt@kms_dp_link_training@uhbr-sst.html">SKIP</a>) (<a href=3D"https://=
gitlab.freedesktop.org/drm/i915/kernel/-/issues/13748">i915#13748</a> / <a =
href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16707">i915=
#16707</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/Patch=
work_171551v1/shard-dg2-3/igt@kms_dp_link_training@uhbr-sst.html">SKIP</a> =
(<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13748">=
i915#13748</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_dp_linktrain_fallback@dsc-fallback:</p>
<ul>
<li>shard-dg2:          (<a href=3D"https://intel-gfx-ci.01.org/tree/drm-ti=
p/CI_DRM_18943/shard-dg2-6/igt@kms_dp_linktrain_fallback@dsc-fallback.html"=
>SKIP</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18943=
/shard-dg2-1/igt@kms_dp_linktrain_fallback@dsc-fallback.html">SKIP</a>) (<a=
 href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13707">i91=
5#13707</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/Patc=
hwork_171551v1/shard-dg2-10/igt@kms_dp_linktrain_fallback@dsc-fallback.html=
">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/iss=
ues/16707">i915#16707</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_dsc@dsc-with-bpc-formats:</p>
<ul>
<li>shard-dg2:          (<a href=3D"https://intel-gfx-ci.01.org/tree/drm-ti=
p/CI_DRM_18943/shard-dg2-10/igt@kms_dsc@dsc-with-bpc-formats.html">SKIP</a>=
, <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18943/shard-dg=
2-4/igt@kms_dsc@dsc-with-bpc-formats.html">SKIP</a>) (<a href=3D"https://gi=
tlab.freedesktop.org/drm/i915/kernel/-/issues/16361">i915#16361</a> / <a hr=
ef=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16707">i915#1=
6707</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/Patchwo=
rk_171551v1/shard-dg2-10/igt@kms_dsc@dsc-with-bpc-formats.html">SKIP</a> (<=
a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16707">i9=
15#16707</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_dsc@dsc-with-output-formats:</p>
<ul>
<li>shard-dg2:          (<a href=3D"https://intel-gfx-ci.01.org/tree/drm-ti=
p/CI_DRM_18943/shard-dg2-10/igt@kms_dsc@dsc-with-output-formats.html">SKIP<=
/a>, <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18943/shard=
-dg2-8/igt@kms_dsc@dsc-with-output-formats.html">SKIP</a>) (<a href=3D"http=
s://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16361">i915#16361</a> /=
 <a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16707">=
i915#16707</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/P=
atchwork_171551v1/shard-dg2-1/igt@kms_dsc@dsc-with-output-formats.html">SKI=
P</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/1=
6361">i915#16361</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_dsc@dsc-with-output-formats-with-bpc:</p>
<ul>
<li>shard-rkl:          (<a href=3D"https://intel-gfx-ci.01.org/tree/drm-ti=
p/CI_DRM_18943/shard-rkl-6/igt@kms_dsc@dsc-with-output-formats-with-bpc.htm=
l">SKIP</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_189=
43/shard-rkl-1/igt@kms_dsc@dsc-with-output-formats-with-bpc.html">SKIP</a>)=
 (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544"=
>i915#14544</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel=
/-/issues/16361">i915#16361</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.o=
rg/tree/drm-tip/Patchwork_171551v1/shard-rkl-2/igt@kms_dsc@dsc-with-output-=
formats-with-bpc.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/=
drm/i915/kernel/-/issues/16361">i915#16361</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_dsc@dsc-with-output-formats-with-bpc-bigjoiner:</p>
<ul>
<li>shard-dg2:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_18943/shard-dg2-8/igt@kms_dsc@dsc-with-output-formats-with-bpc-bigj=
oiner.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/ke=
rnel/-/issues/16361">i915#16361</a>) -&gt; <a href=3D"https://intel-gfx-ci.=
01.org/tree/drm-tip/Patchwork_171551v1/shard-dg2-10/igt@kms_dsc@dsc-with-ou=
tput-formats-with-bpc-bigjoiner.html">SKIP</a> (<a href=3D"https://gitlab.f=
reedesktop.org/drm/i915/kernel/-/issues/16707">i915#16707</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_fbcon_fbt@fbc:</p>
<ul>
<li>shard-dg2:          (<a href=3D"https://intel-gfx-ci.01.org/tree/drm-ti=
p/CI_DRM_18943/shard-dg2-10/igt@kms_fbcon_fbt@fbc.html">SKIP</a>, <a href=
=3D"https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18943/shard-dg2-8/igt@k=
ms_fbcon_fbt@fbc.html">PASS</a>) (<a href=3D"https://gitlab.freedesktop.org=
/drm/i915/kernel/-/issues/1849">i915#1849</a>) -&gt; <a href=3D"https://int=
el-gfx-ci.01.org/tree/drm-tip/Patchwork_171551v1/shard-dg2-10/igt@kms_fbcon=
_fbt@fbc.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915=
/kernel/-/issues/1849">i915#1849</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_feature_discovery@display-4x:</p>
<ul>
<li>shard-rkl:          (<a href=3D"https://intel-gfx-ci.01.org/tree/drm-ti=
p/CI_DRM_18943/shard-rkl-3/igt@kms_feature_discovery@display-4x.html">SKIP<=
/a>, <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18943/shard=
-rkl-6/igt@kms_feature_discovery@display-4x.html">SKIP</a>) (<a href=3D"htt=
ps://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a> =
/ <a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16081"=
>i915#16081</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/=
Patchwork_171551v1/shard-rkl-3/igt@kms_feature_discovery@display-4x.html">S=
KIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues=
/16081">i915#16081</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_feature_discovery@vrr:</p>
<ul>
<li>shard-rkl:          (<a href=3D"https://intel-gfx-ci.01.org/tree/drm-ti=
p/CI_DRM_18943/shard-rkl-3/igt@kms_feature_discovery@vrr.html">SKIP</a>, <a=
 href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18943/shard-rkl-6/=
igt@kms_feature_discovery@vrr.html">SKIP</a>) (<a href=3D"https://gitlab.fr=
eedesktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a> / <a href=3D"h=
ttps://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16600">i915#16600</a=
>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_1715=
51v1/shard-rkl-5/igt@kms_feature_discovery@vrr.html">SKIP</a> (<a href=3D"h=
ttps://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16600">i915#16600</a=
>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-dpms-vs-vblank-race:</p>
<ul>
<li>shard-rkl:          (<a href=3D"https://intel-gfx-ci.01.org/tree/drm-ti=
p/CI_DRM_18943/shard-rkl-6/igt@kms_flip@2x-dpms-vs-vblank-race.html">SKIP</=
a>, <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18943/shard-=
rkl-3/igt@kms_flip@2x-dpms-vs-vblank-race.html">SKIP</a>) (<a href=3D"https=
://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a> / =
<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9934">i9=
15#9934</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/Patc=
hwork_171551v1/shard-rkl-2/igt@kms_flip@2x-dpms-vs-vblank-race.html">SKIP</=
a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9934=
">i915#9934</a>) +6 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-rmfb:</p>
<ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_18943/shard-rkl-7/igt@kms_flip@2x-flip-vs-rmfb.html">SKIP</a> (<a h=
ref=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9934">i915#9=
934</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/Patchwor=
k_171551v1/shard-rkl-6/igt@kms_flip@2x-flip-vs-rmfb.html">SKIP</a> (<a href=
=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#145=
44</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues=
/9934">i915#9934</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-panning:</p>
<ul>
<li>shard-dg2:          (<a href=3D"https://intel-gfx-ci.01.org/tree/drm-ti=
p/CI_DRM_18943/shard-dg2-10/igt@kms_flip@flip-vs-panning.html">SKIP</a>, <a=
 href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18943/shard-dg2-4/=
igt@kms_flip@flip-vs-panning.html">PASS</a>) (<a href=3D"https://gitlab.fre=
edesktop.org/drm/i915/kernel/-/issues/5354">i915#5354</a>) -&gt; <a href=3D=
"https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_171551v1/shard-dg2-10/i=
gt@kms_flip@flip-vs-panning.html">SKIP</a> (<a href=3D"https://gitlab.freed=
esktop.org/drm/i915/kernel/-/issues/5354">i915#5354</a>) +4 other tests ski=
p</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-suspend:</p>
<ul>
<li>shard-glk:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_18943/shard-glk3/igt@kms_flip@flip-vs-suspend.html">INCOMPLETE</a> =
(<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12745">=
i915#12745</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/=
-/issues/4839">i915#4839</a> / <a href=3D"https://gitlab.freedesktop.org/dr=
m/i915/kernel/-/issues/6113">i915#6113</a>) -&gt; <a href=3D"https://intel-=
gfx-ci.01.org/tree/drm-tip/Patchwork_171551v1/shard-glk6/igt@kms_flip@flip-=
vs-suspend.html">INCOMPLETE</a> (<a href=3D"https://gitlab.freedesktop.org/=
drm/i915/kernel/-/issues/12745">i915#12745</a> / <a href=3D"https://gitlab.=
freedesktop.org/drm/i915/kernel/-/issues/4839">i915#4839</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-suspend@a-hdmi-a1:</p>
<ul>
<li>shard-glk:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_18943/shard-glk3/igt@kms_flip@flip-vs-suspend@a-hdmi-a1.html">INCOM=
PLETE</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issu=
es/12745">i915#12745</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i9=
15/kernel/-/issues/6113">i915#6113</a>) -&gt; <a href=3D"https://intel-gfx-=
ci.01.org/tree/drm-tip/Patchwork_171551v1/shard-glk6/igt@kms_flip@flip-vs-s=
uspend@a-hdmi-a1.html">INCOMPLETE</a> (<a href=3D"https://gitlab.freedeskto=
p.org/drm/i915/kernel/-/issues/12745">i915#12745</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-64bpp-linear-to-32bpp-linear-upscaling:</p>
<ul>
<li>shard-dg2:          (<a href=3D"https://intel-gfx-ci.01.org/tree/drm-ti=
p/CI_DRM_18943/shard-dg2-10/igt@kms_flip_scaled_crc@flip-64bpp-linear-to-32=
bpp-linear-upscaling.html">SKIP</a>, <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/CI_DRM_18943/shard-dg2-8/igt@kms_flip_scaled_crc@flip-64bpp-l=
inear-to-32bpp-linear-upscaling.html">PASS</a>) (<a href=3D"https://gitlab.=
freedesktop.org/drm/i915/kernel/-/issues/3555">i915#3555</a> / <a href=3D"h=
ttps://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8813">i915#8813</a>)=
 -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_171551=
v1/shard-dg2-10/igt@kms_flip_scaled_crc@flip-64bpp-linear-to-32bpp-linear-u=
pscaling.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915=
/kernel/-/issues/3555">i915#3555</a> / <a href=3D"https://gitlab.freedeskto=
p.org/drm/i915/kernel/-/issues/8813">i915#8813</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-32bpp-yftile-downscaling:</=
p>
<ul>
<li>shard-rkl:          (<a href=3D"https://intel-gfx-ci.01.org/tree/drm-ti=
p/CI_DRM_18943/shard-rkl-6/igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-32b=
pp-yftile-downscaling.html">SKIP</a>, <a href=3D"https://intel-gfx-ci.01.or=
g/tree/drm-tip/CI_DRM_18943/shard-rkl-3/igt@kms_flip_scaled_crc@flip-64bpp-=
yftile-to-32bpp-yftile-downscaling.html">SKIP</a>) (<a href=3D"https://gitl=
ab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a> / <a href=
=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15643">i915#156=
43</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork=
_171551v1/shard-rkl-2/igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-32bpp-yf=
tile-downscaling.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/=
drm/i915/kernel/-/issues/15643">i915#15643</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-2p-primscrn-cur-indfb-draw-mmap-wc:</p>
<ul>
<li>shard-dg2:          (<a href=3D"https://intel-gfx-ci.01.org/tree/drm-ti=
p/CI_DRM_18943/shard-dg2-4/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-cur=
-indfb-draw-mmap-wc.html">SKIP</a>, <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/CI_DRM_18943/shard-dg2-10/igt@kms_frontbuffer_tracking@fbc-2p-=
primscrn-cur-indfb-draw-mmap-wc.html">SKIP</a>) (<a href=3D"https://gitlab.=
freedesktop.org/drm/i915/kernel/-/issues/15990">i915#15990</a> / <a href=3D=
"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16708">i915#16708<=
/a> / <a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/53=
54">i915#5354</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i915/kern=
el/-/issues/8708">i915#8708</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.o=
rg/tree/drm-tip/Patchwork_171551v1/shard-dg2-10/igt@kms_frontbuffer_trackin=
g@fbc-2p-primscrn-cur-indfb-draw-mmap-wc.html">SKIP</a> (<a href=3D"https:/=
/gitlab.freedesktop.org/drm/i915/kernel/-/issues/16708">i915#16708</a> / <a=
 href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5354">i915=
#5354</a>) +7 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-2p-primscrn-pri-indfb-draw-mmap-gtt:</p>
<ul>
<li>shard-rkl:          (<a href=3D"https://intel-gfx-ci.01.org/tree/drm-ti=
p/CI_DRM_18943/shard-rkl-5/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-pri=
-indfb-draw-mmap-gtt.html">SKIP</a>, <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/CI_DRM_18943/shard-rkl-2/igt@kms_frontbuffer_tracking@fbc-2p-=
primscrn-pri-indfb-draw-mmap-gtt.html">SKIP</a>) (<a href=3D"https://gitlab=
.freedesktop.org/drm/i915/kernel/-/issues/1825">i915#1825</a>) -&gt; <a hre=
f=3D"https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_171551v1/shard-rkl-=
6/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-pri-indfb-draw-mmap-gtt.html=
">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/iss=
ues/14544">i915#14544</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i=
915/kernel/-/issues/1825">i915#1825</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-2p-primscrn-pri-indfb-draw-mmap-wc:</p>
<ul>
<li>shard-rkl:          (<a href=3D"https://intel-gfx-ci.01.org/tree/drm-ti=
p/CI_DRM_18943/shard-rkl-1/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-pri=
-indfb-draw-mmap-wc.html">SKIP</a>, <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/CI_DRM_18943/shard-rkl-6/igt@kms_frontbuffer_tracking@fbc-2p-p=
rimscrn-pri-indfb-draw-mmap-wc.html">SKIP</a>) (<a href=3D"https://gitlab.f=
reedesktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a> / <a href=3D"=
https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/1825">i915#1825</a>=
) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_17155=
1v1/shard-rkl-2/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-pri-indfb-draw=
-mmap-wc.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915=
/kernel/-/issues/1825">i915#1825</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-pri-shrfb-draw-blt:</p>
<ul>
<li>shard-dg2:          (<a href=3D"https://intel-gfx-ci.01.org/tree/drm-ti=
p/CI_DRM_18943/shard-dg2-1/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-pri=
-shrfb-draw-blt.html">SKIP</a>, <a href=3D"https://intel-gfx-ci.01.org/tree=
/drm-tip/CI_DRM_18943/shard-dg2-6/igt@kms_frontbuffer_tracking@fbc-2p-scnds=
crn-pri-shrfb-draw-blt.html">SKIP</a>) (<a href=3D"https://gitlab.freedeskt=
op.org/drm/i915/kernel/-/issues/15991">i915#15991</a> / <a href=3D"https://=
gitlab.freedesktop.org/drm/i915/kernel/-/issues/5354">i915#5354</a>) -&gt; =
<a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_171551v1/shar=
d-dg2-10/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-pri-shrfb-draw-blt.ht=
ml">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/i=
ssues/16708">i915#16708</a> / <a href=3D"https://gitlab.freedesktop.org/drm=
/i915/kernel/-/issues/5354">i915#5354</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-tiling-4:</p>
<ul>
<li>shard-dg2:          (<a href=3D"https://intel-gfx-ci.01.org/tree/drm-ti=
p/CI_DRM_18943/shard-dg2-4/igt@kms_frontbuffer_tracking@fbc-tiling-4.html">=
PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18943/=
shard-dg2-10/igt@kms_frontbuffer_tracking@fbc-tiling-4.html">SKIP</a>) (<a =
href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16708">i915=
#16708</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/is=
sues/5354">i915#5354</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree=
/drm-tip/Patchwork_171551v1/shard-dg2-10/igt@kms_frontbuffer_tracking@fbc-t=
iling-4.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/=
kernel/-/issues/16708">i915#16708</a> / <a href=3D"https://gitlab.freedeskt=
op.org/drm/i915/kernel/-/issues/5354">i915#5354</a>) +2 other tests skip</l=
i>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbchdr-1p-primscrn-cur-indfb-onoff:</p>
<ul>
<li>shard-rkl:          (<a href=3D"https://intel-gfx-ci.01.org/tree/drm-ti=
p/CI_DRM_18943/shard-rkl-3/igt@kms_frontbuffer_tracking@fbchdr-1p-primscrn-=
cur-indfb-onoff.html">SKIP</a>, <a href=3D"https://intel-gfx-ci.01.org/tree=
/drm-tip/CI_DRM_18943/shard-rkl-6/igt@kms_frontbuffer_tracking@fbchdr-1p-pr=
imscrn-cur-indfb-onoff.html">PASS</a>) (<a href=3D"https://gitlab.freedeskt=
op.org/drm/i915/kernel/-/issues/15989">i915#15989</a>) -&gt; <a href=3D"htt=
ps://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_171551v1/shard-rkl-5/igt@km=
s_frontbuffer_tracking@fbchdr-1p-primscrn-cur-indfb-onoff.html">SKIP</a> (<=
a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15989">i9=
15#15989</a>) +13 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbchdr-2p-primscrn-spr-indfb-draw-mmap-wc:<=
/p>
<ul>
<li>shard-dg2:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_18943/shard-dg2-8/igt@kms_frontbuffer_tracking@fbchdr-2p-primscrn-s=
pr-indfb-draw-mmap-wc.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop=
.org/drm/i915/kernel/-/issues/15990">i915#15990</a>) -&gt; <a href=3D"https=
://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_171551v1/shard-dg2-10/igt@kms=
_frontbuffer_tracking@fbchdr-2p-primscrn-spr-indfb-draw-mmap-wc.html">SKIP<=
/a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/167=
08">i915#16708</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbchdr-2p-scndscrn-pri-indfb-draw-mmap-wc:<=
/p>
<ul>
<li>shard-dg2:          (<a href=3D"https://intel-gfx-ci.01.org/tree/drm-ti=
p/CI_DRM_18943/shard-dg2-4/igt@kms_frontbuffer_tracking@fbchdr-2p-scndscrn-=
pri-indfb-draw-mmap-wc.html">SKIP</a>, <a href=3D"https://intel-gfx-ci.01.o=
rg/tree/drm-tip/CI_DRM_18943/shard-dg2-10/igt@kms_frontbuffer_tracking@fbch=
dr-2p-scndscrn-pri-indfb-draw-mmap-wc.html">SKIP</a>) (<a href=3D"https://g=
itlab.freedesktop.org/drm/i915/kernel/-/issues/15990">i915#15990</a> / <a h=
ref=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16708">i915#=
16708</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/Patchw=
ork_171551v1/shard-dg2-10/igt@kms_frontbuffer_tracking@fbchdr-2p-scndscrn-p=
ri-indfb-draw-mmap-wc.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop=
.org/drm/i915/kernel/-/issues/16708">i915#16708</a>) +9 other tests skip</l=
i>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbchdr-2p-scndscrn-spr-indfb-draw-mmap-cpu:=
</p>
<ul>
<li>shard-dg2:          (<a href=3D"https://intel-gfx-ci.01.org/tree/drm-ti=
p/CI_DRM_18943/shard-dg2-1/igt@kms_frontbuffer_tracking@fbchdr-2p-scndscrn-=
spr-indfb-draw-mmap-cpu.html">SKIP</a>, <a href=3D"https://intel-gfx-ci.01.=
org/tree/drm-tip/CI_DRM_18943/shard-dg2-6/igt@kms_frontbuffer_tracking@fbch=
dr-2p-scndscrn-spr-indfb-draw-mmap-cpu.html">SKIP</a>) (<a href=3D"https://=
gitlab.freedesktop.org/drm/i915/kernel/-/issues/15991">i915#15991</a>) -&gt=
; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_171551v1/sh=
ard-dg2-10/igt@kms_frontbuffer_tracking@fbchdr-2p-scndscrn-spr-indfb-draw-m=
map-cpu.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/=
kernel/-/issues/16708">i915#16708</a>) +9 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbchdr-rgb101010-draw-blt:</p>
<ul>
<li>shard-dg2:          (<a href=3D"https://intel-gfx-ci.01.org/tree/drm-ti=
p/CI_DRM_18943/shard-dg2-4/igt@kms_frontbuffer_tracking@fbchdr-rgb101010-dr=
aw-blt.html">SKIP</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/=
CI_DRM_18943/shard-dg2-10/igt@kms_frontbuffer_tracking@fbchdr-rgb101010-dra=
w-blt.html">SKIP</a>) (<a href=3D"https://gitlab.freedesktop.org/drm/i915/k=
ernel/-/issues/15989">i915#15989</a> / <a href=3D"https://gitlab.freedeskto=
p.org/drm/i915/kernel/-/issues/16708">i915#16708</a>) -&gt; <a href=3D"http=
s://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_171551v1/shard-dg2-10/igt@km=
s_frontbuffer_tracking@fbchdr-rgb101010-draw-blt.html">SKIP</a> (<a href=3D=
"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16708">i915#16708<=
/a>) +11 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbchdr-rgb565-draw-mmap-cpu:</p>
<ul>
<li>shard-dg2:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_18943/shard-dg2-8/igt@kms_frontbuffer_tracking@fbchdr-rgb565-draw-m=
map-cpu.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/=
kernel/-/issues/15989">i915#15989</a>) -&gt; <a href=3D"https://intel-gfx-c=
i.01.org/tree/drm-tip/Patchwork_171551v1/shard-dg2-10/igt@kms_frontbuffer_t=
racking@fbchdr-rgb565-draw-mmap-cpu.html">SKIP</a> (<a href=3D"https://gitl=
ab.freedesktop.org/drm/i915/kernel/-/issues/16708">i915#16708</a>) +4 other=
 tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbchdr-suspend:</p>
<ul>
<li>shard-rkl:          (<a href=3D"https://intel-gfx-ci.01.org/tree/drm-ti=
p/CI_DRM_18943/shard-rkl-2/igt@kms_frontbuffer_tracking@fbchdr-suspend.html=
">SKIP</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_1894=
3/shard-rkl-5/igt@kms_frontbuffer_tracking@fbchdr-suspend.html">SKIP</a>) (=
<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15989">i=
915#15989</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/Pa=
tchwork_171551v1/shard-rkl-6/igt@kms_frontbuffer_tracking@fbchdr-suspend.ht=
ml">INCOMPLETE</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kern=
el/-/issues/16056">i915#16056</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-1p-offscreen-pri-shrfb-draw-blt:</p>
<ul>
<li>shard-dg2:          (<a href=3D"https://intel-gfx-ci.01.org/tree/drm-ti=
p/CI_DRM_18943/shard-dg2-4/igt@kms_frontbuffer_tracking@fbcpsr-1p-offscreen=
-pri-shrfb-draw-blt.html">SKIP</a>, <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/CI_DRM_18943/shard-dg2-10/igt@kms_frontbuffer_tracking@fbcpsr-=
1p-offscreen-pri-shrfb-draw-blt.html">SKIP</a>) (<a href=3D"https://gitlab.=
freedesktop.org/drm/i915/kernel/-/issues/15102">i915#15102</a> / <a href=3D=
"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16708">i915#16708<=
/a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_17=
1551v1/shard-dg2-10/igt@kms_frontbuffer_tracking@fbcpsr-1p-offscreen-pri-sh=
rfb-draw-blt.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/=
i915/kernel/-/issues/16708">i915#16708</a>) +17 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-1p-offscreen-pri-shrfb-draw-mmap-wc:=
</p>
<ul>
<li>shard-rkl:          (<a href=3D"https://intel-gfx-ci.01.org/tree/drm-ti=
p/CI_DRM_18943/shard-rkl-5/igt@kms_frontbuffer_tracking@fbcpsr-1p-offscreen=
-pri-shrfb-draw-mmap-wc.html">SKIP</a>, <a href=3D"https://intel-gfx-ci.01.=
org/tree/drm-tip/CI_DRM_18943/shard-rkl-2/igt@kms_frontbuffer_tracking@fbcp=
sr-1p-offscreen-pri-shrfb-draw-mmap-wc.html">SKIP</a>) (<a href=3D"https://=
gitlab.freedesktop.org/drm/i915/kernel/-/issues/15102">i915#15102</a>) -&gt=
; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_171551v1/sh=
ard-rkl-6/igt@kms_frontbuffer_tracking@fbcpsr-1p-offscreen-pri-shrfb-draw-m=
map-wc.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/k=
ernel/-/issues/14544">i915#14544</a> / <a href=3D"https://gitlab.freedeskto=
p.org/drm/i915/kernel/-/issues/15102">i915#15102</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-cur-indfb-draw-mmap-cpu:=
</p>
<ul>
<li>shard-dg1:          (<a href=3D"https://intel-gfx-ci.01.org/tree/drm-ti=
p/CI_DRM_18943/shard-dg1-19/igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn=
-cur-indfb-draw-mmap-cpu.html">SKIP</a>, <a href=3D"https://intel-gfx-ci.01=
.org/tree/drm-tip/CI_DRM_18943/shard-dg1-13/igt@kms_frontbuffer_tracking@fb=
cpsr-1p-primscrn-cur-indfb-draw-mmap-cpu.html">SKIP</a>) (<a href=3D"https:=
//gitlab.freedesktop.org/drm/i915/kernel/-/issues/15102">i915#15102</a> / <=
a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4423">i91=
5#4423</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/Patch=
work_171551v1/shard-dg1-12/igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-=
cur-indfb-draw-mmap-cpu.html">SKIP</a> (<a href=3D"https://gitlab.freedeskt=
op.org/drm/i915/kernel/-/issues/15102">i915#15102</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-pri-shrfb-draw-mmap-gtt:=
</p>
<ul>
<li>shard-dg2:          (<a href=3D"https://intel-gfx-ci.01.org/tree/drm-ti=
p/CI_DRM_18943/shard-dg2-8/igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-=
pri-shrfb-draw-mmap-gtt.html">SKIP</a>, <a href=3D"https://intel-gfx-ci.01.=
org/tree/drm-tip/CI_DRM_18943/shard-dg2-10/igt@kms_frontbuffer_tracking@fbc=
psr-1p-primscrn-pri-shrfb-draw-mmap-gtt.html">SKIP</a>) (<a href=3D"https:/=
/gitlab.freedesktop.org/drm/i915/kernel/-/issues/15990">i915#15990</a> / <a=
 href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16708">i91=
5#16708</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/i=
ssues/5354">i915#5354</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i=
915/kernel/-/issues/8708">i915#8708</a>) -&gt; <a href=3D"https://intel-gfx=
-ci.01.org/tree/drm-tip/Patchwork_171551v1/shard-dg2-1/igt@kms_frontbuffer_=
tracking@fbcpsr-1p-primscrn-pri-shrfb-draw-mmap-gtt.html">SKIP</a> (<a href=
=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15990">i915#159=
90</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues=
/8708">i915#8708</a>) +12 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-spr-indfb-draw-blt:</p>
<ul>
<li>shard-dg2:          (<a href=3D"https://intel-gfx-ci.01.org/tree/drm-ti=
p/CI_DRM_18943/shard-dg2-6/igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-=
spr-indfb-draw-blt.html">SKIP</a>, <a href=3D"https://intel-gfx-ci.01.org/t=
ree/drm-tip/CI_DRM_18943/shard-dg2-10/igt@kms_frontbuffer_tracking@fbcpsr-1=
p-primscrn-spr-indfb-draw-blt.html">SKIP</a>) (<a href=3D"https://gitlab.fr=
eedesktop.org/drm/i915/kernel/-/issues/15102">i915#15102</a> / <a href=3D"h=
ttps://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16708">i915#16708</a=
> / <a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5354=
">i915#5354</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/=
Patchwork_171551v1/shard-dg2-4/igt@kms_frontbuffer_tracking@fbcpsr-1p-prims=
crn-spr-indfb-draw-blt.html">SKIP</a> (<a href=3D"https://gitlab.freedeskto=
p.org/drm/i915/kernel/-/issues/10433">i915#10433</a> / <a href=3D"https://g=
itlab.freedesktop.org/drm/i915/kernel/-/issues/15102">i915#15102</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-pri-shrfb-draw-blt:</p>
<ul>
<li>shard-rkl:          (<a href=3D"https://intel-gfx-ci.01.org/tree/drm-ti=
p/CI_DRM_18943/shard-rkl-2/igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-=
pri-shrfb-draw-blt.html">SKIP</a>, <a href=3D"https://intel-gfx-ci.01.org/t=
ree/drm-tip/CI_DRM_18943/shard-rkl-5/igt@kms_frontbuffer_tracking@fbcpsr-2p=
-primscrn-pri-shrfb-draw-blt.html">SKIP</a>) -&gt; <a href=3D"https://intel=
-gfx-ci.01.org/tree/drm-tip/Patchwork_171551v1/shard-rkl-6/igt@kms_frontbuf=
fer_tracking@fbcpsr-2p-primscrn-pri-shrfb-draw-blt.html">SKIP</a> (<a href=
=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#145=
44</a>) +11 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-cur-indfb-move:</p>
<ul>
<li>shard-dg2:          (<a href=3D"https://intel-gfx-ci.01.org/tree/drm-ti=
p/CI_DRM_18943/shard-dg2-8/igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-=
cur-indfb-move.html">SKIP</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/=
drm-tip/CI_DRM_18943/shard-dg2-10/igt@kms_frontbuffer_tracking@fbcpsr-2p-sc=
ndscrn-cur-indfb-move.html">SKIP</a>) (<a href=3D"https://gitlab.freedeskto=
p.org/drm/i915/kernel/-/issues/15991">i915#15991</a> / <a href=3D"https://g=
itlab.freedesktop.org/drm/i915/kernel/-/issues/16708">i915#16708</a> / <a h=
ref=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5354">i915#5=
354</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/Patchwor=
k_171551v1/shard-dg2-10/igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-cur=
-indfb-move.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i=
915/kernel/-/issues/16708">i915#16708</a> / <a href=3D"https://gitlab.freed=
esktop.org/drm/i915/kernel/-/issues/5354">i915#5354</a>) +21 other tests sk=
ip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-pri-shrfb-draw-mmap-cpu:=
</p>
<ul>
<li>shard-dg2:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_18943/shard-dg2-8/igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-p=
ri-shrfb-draw-mmap-cpu.html">SKIP</a> (<a href=3D"https://gitlab.freedeskto=
p.org/drm/i915/kernel/-/issues/15991">i915#15991</a> / <a href=3D"https://g=
itlab.freedesktop.org/drm/i915/kernel/-/issues/5354">i915#5354</a>) -&gt; <=
a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_171551v1/shard=
-dg2-10/igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-pri-shrfb-draw-mmap=
-cpu.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/ker=
nel/-/issues/16708">i915#16708</a> / <a href=3D"https://gitlab.freedesktop.=
org/drm/i915/kernel/-/issues/5354">i915#5354</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-spr-indfb-draw-mmap-gtt:=
</p>
<ul>
<li>shard-dg2:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_18943/shard-dg2-8/igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-s=
pr-indfb-draw-mmap-gtt.html">SKIP</a> (<a href=3D"https://gitlab.freedeskto=
p.org/drm/i915/kernel/-/issues/15990">i915#15990</a> / <a href=3D"https://g=
itlab.freedesktop.org/drm/i915/kernel/-/issues/8708">i915#8708</a>) -&gt; <=
a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_171551v1/shard=
-dg2-10/igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-spr-indfb-draw-mmap=
-gtt.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/ker=
nel/-/issues/16708">i915#16708</a> / <a href=3D"https://gitlab.freedesktop.=
org/drm/i915/kernel/-/issues/5354">i915#5354</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-farfromfence-mmap-gtt:</p>
<ul>
<li>shard-dg2:          (<a href=3D"https://intel-gfx-ci.01.org/tree/drm-ti=
p/CI_DRM_18943/shard-dg2-6/igt@kms_frontbuffer_tracking@fbcpsr-farfromfence=
-mmap-gtt.html">SKIP</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/drm-t=
ip/CI_DRM_18943/shard-dg2-1/igt@kms_frontbuffer_tracking@fbcpsr-farfromfenc=
e-mmap-gtt.html">SKIP</a>) (<a href=3D"https://gitlab.freedesktop.org/drm/i=
915/kernel/-/issues/15990">i915#15990</a> / <a href=3D"https://gitlab.freed=
esktop.org/drm/i915/kernel/-/issues/8708">i915#8708</a>) -&gt; <a href=3D"h=
ttps://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_171551v1/shard-dg2-10/igt=
@kms_frontbuffer_tracking@fbcpsr-farfromfence-mmap-gtt.html">SKIP</a> (<a h=
ref=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16708">i915#=
16708</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/iss=
ues/5354">i915#5354</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-indfb-scaledprimary:</p>
<ul>
<li>shard-dg2:          (<a href=3D"https://intel-gfx-ci.01.org/tree/drm-ti=
p/CI_DRM_18943/shard-dg2-1/igt@kms_frontbuffer_tracking@fbcpsr-indfb-scaled=
primary.html">SKIP</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_18943/shard-dg2-6/igt@kms_frontbuffer_tracking@fbcpsr-indfb-scaledp=
rimary.html">SKIP</a>) (<a href=3D"https://gitlab.freedesktop.org/drm/i915/=
kernel/-/issues/15102">i915#15102</a>) -&gt; <a href=3D"https://intel-gfx-c=
i.01.org/tree/drm-tip/Patchwork_171551v1/shard-dg2-10/igt@kms_frontbuffer_t=
racking@fbcpsr-indfb-scaledprimary.html">SKIP</a> (<a href=3D"https://gitla=
b.freedesktop.org/drm/i915/kernel/-/issues/16708">i915#16708</a> / <a href=
=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5354">i915#5354=
</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-shrfb-scaledprimary:</p>
<ul>
<li>shard-dg2:          (<a href=3D"https://intel-gfx-ci.01.org/tree/drm-ti=
p/CI_DRM_18943/shard-dg2-5/igt@kms_frontbuffer_tracking@fbcpsr-shrfb-scaled=
primary.html">SKIP</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_18943/shard-dg2-6/igt@kms_frontbuffer_tracking@fbcpsr-shrfb-scaledp=
rimary.html">SKIP</a>) (<a href=3D"https://gitlab.freedesktop.org/drm/i915/=
kernel/-/issues/15102">i915#15102</a>) -&gt; <a href=3D"https://intel-gfx-c=
i.01.org/tree/drm-tip/Patchwork_171551v1/shard-dg2-4/igt@kms_frontbuffer_tr=
acking@fbcpsr-shrfb-scaledprimary.html">SKIP</a> (<a href=3D"https://gitlab=
.freedesktop.org/drm/i915/kernel/-/issues/10433">i915#10433</a> / <a href=
=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15102">i915#151=
02</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-tiling-y:</p>
<ul>
<li>shard-dg2:          (<a href=3D"https://intel-gfx-ci.01.org/tree/drm-ti=
p/CI_DRM_18943/shard-dg2-1/igt@kms_frontbuffer_tracking@fbcpsr-tiling-y.htm=
l">SKIP</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_189=
43/shard-dg2-6/igt@kms_frontbuffer_tracking@fbcpsr-tiling-y.html">SKIP</a>)=
 (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/10055"=
>i915#10055</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/=
Patchwork_171551v1/shard-dg2-10/igt@kms_frontbuffer_tracking@fbcpsr-tiling-=
y.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel=
/-/issues/16708">i915#16708</a> / <a href=3D"https://gitlab.freedesktop.org=
/drm/i915/kernel/-/issues/5354">i915#5354</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsrhdr-1p-offscreen-pri-indfb-draw-mmap-=
cpu:</p>
<ul>
<li>shard-dg2:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_18943/shard-dg2-8/igt@kms_frontbuffer_tracking@fbcpsrhdr-1p-offscre=
en-pri-indfb-draw-mmap-cpu.html">SKIP</a> (<a href=3D"https://gitlab.freede=
sktop.org/drm/i915/kernel/-/issues/15102">i915#15102</a>) -&gt; <a href=3D"=
https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_171551v1/shard-dg2-10/ig=
t@kms_frontbuffer_tracking@fbcpsrhdr-1p-offscreen-pri-indfb-draw-mmap-cpu.h=
tml">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/=
issues/16708">i915#16708</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsrhdr-1p-primscrn-cur-indfb-draw-mmap-w=
c:</p>
<ul>
<li>shard-dg2:          (<a href=3D"https://intel-gfx-ci.01.org/tree/drm-ti=
p/CI_DRM_18943/shard-dg2-6/igt@kms_frontbuffer_tracking@fbcpsrhdr-1p-primsc=
rn-cur-indfb-draw-mmap-wc.html">SKIP</a>, <a href=3D"https://intel-gfx-ci.0=
1.org/tree/drm-tip/CI_DRM_18943/shard-dg2-1/igt@kms_frontbuffer_tracking@fb=
cpsrhdr-1p-primscrn-cur-indfb-draw-mmap-wc.html">SKIP</a>) (<a href=3D"http=
s://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15990">i915#15990</a>) =
-&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_171551v=
1/shard-dg2-10/igt@kms_frontbuffer_tracking@fbcpsrhdr-1p-primscrn-cur-indfb=
-draw-mmap-wc.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm=
/i915/kernel/-/issues/16708">i915#16708</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsrhdr-1p-primscrn-spr-indfb-draw-mmap-c=
pu:</p>
<ul>
<li>shard-rkl:          (<a href=3D"https://intel-gfx-ci.01.org/tree/drm-ti=
p/CI_DRM_18943/shard-rkl-3/igt@kms_frontbuffer_tracking@fbcpsrhdr-1p-primsc=
rn-spr-indfb-draw-mmap-cpu.html">SKIP</a>, <a href=3D"https://intel-gfx-ci.=
01.org/tree/drm-tip/CI_DRM_18943/shard-rkl-6/igt@kms_frontbuffer_tracking@f=
bcpsrhdr-1p-primscrn-spr-indfb-draw-mmap-cpu.html">SKIP</a>) (<a href=3D"ht=
tps://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a>=
 / <a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15102=
">i915#15102</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/Patchwork_171551v1/shard-rkl-5/igt@kms_frontbuffer_tracking@fbcpsrhdr-1p-p=
rimscrn-spr-indfb-draw-mmap-cpu.html">SKIP</a> (<a href=3D"https://gitlab.f=
reedesktop.org/drm/i915/kernel/-/issues/15102">i915#15102</a>) +17 other te=
sts skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsrhdr-1p-primscrn-spr-indfb-draw-render=
:</p>
<ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_18943/shard-rkl-7/igt@kms_frontbuffer_tracking@fbcpsrhdr-1p-primscr=
n-spr-indfb-draw-render.html">SKIP</a> (<a href=3D"https://gitlab.freedeskt=
op.org/drm/i915/kernel/-/issues/15102">i915#15102</a>) -&gt; <a href=3D"htt=
ps://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_171551v1/shard-rkl-6/igt@km=
s_frontbuffer_tracking@fbcpsrhdr-1p-primscrn-spr-indfb-draw-render.html">SK=
IP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/=
14544">i915#14544</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i915/=
kernel/-/issues/15102">i915#15102</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsrhdr-1p-primscrn-spr-indfb-onoff:</p>
<ul>
<li>shard-dg2:          (<a href=3D"https://intel-gfx-ci.01.org/tree/drm-ti=
p/CI_DRM_18943/shard-dg2-1/igt@kms_frontbuffer_tracking@fbcpsrhdr-1p-primsc=
rn-spr-indfb-onoff.html">SKIP</a>, <a href=3D"https://intel-gfx-ci.01.org/t=
ree/drm-tip/CI_DRM_18943/shard-dg2-6/igt@kms_frontbuffer_tracking@fbcpsrhdr=
-1p-primscrn-spr-indfb-onoff.html">SKIP</a>) (<a href=3D"https://gitlab.fre=
edesktop.org/drm/i915/kernel/-/issues/15102">i915#15102</a>) -&gt; <a href=
=3D"https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_171551v1/shard-dg2-1=
0/igt@kms_frontbuffer_tracking@fbcpsrhdr-1p-primscrn-spr-indfb-onoff.html">=
SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issue=
s/16708">i915#16708</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsrhdr-2p-scndscrn-pri-indfb-draw-mmap-w=
c:</p>
<ul>
<li>shard-dg2:          (<a href=3D"https://intel-gfx-ci.01.org/tree/drm-ti=
p/CI_DRM_18943/shard-dg2-7/igt@kms_frontbuffer_tracking@fbcpsrhdr-2p-scndsc=
rn-pri-indfb-draw-mmap-wc.html">SKIP</a>, <a href=3D"https://intel-gfx-ci.0=
1.org/tree/drm-tip/CI_DRM_18943/shard-dg2-10/igt@kms_frontbuffer_tracking@f=
bcpsrhdr-2p-scndscrn-pri-indfb-draw-mmap-wc.html">SKIP</a>) (<a href=3D"htt=
ps://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15990">i915#15990</a> =
/ <a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16708"=
>i915#16708</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/=
Patchwork_171551v1/shard-dg2-7/igt@kms_frontbuffer_tracking@fbcpsrhdr-2p-sc=
ndscrn-pri-indfb-draw-mmap-wc.html">SKIP</a> (<a href=3D"https://gitlab.fre=
edesktop.org/drm/i915/kernel/-/issues/15990">i915#15990</a>) +24 other test=
s skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsrhdr-2p-scndscrn-spr-indfb-draw-mmap-c=
pu:</p>
<ul>
<li>shard-dg2:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_18943/shard-dg2-8/igt@kms_frontbuffer_tracking@fbcpsrhdr-2p-scndscr=
n-spr-indfb-draw-mmap-cpu.html">SKIP</a> (<a href=3D"https://gitlab.freedes=
ktop.org/drm/i915/kernel/-/issues/15991">i915#15991</a>) -&gt; <a href=3D"h=
ttps://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_171551v1/shard-dg2-10/igt=
@kms_frontbuffer_tracking@fbcpsrhdr-2p-scndscrn-spr-indfb-draw-mmap-cpu.htm=
l">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/is=
sues/16708">i915#16708</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsrhdr-rgb565-draw-render:</p>
<ul>
<li>shard-dg2:          (<a href=3D"https://intel-gfx-ci.01.org/tree/drm-ti=
p/CI_DRM_18943/shard-dg2-10/igt@kms_frontbuffer_tracking@fbcpsrhdr-rgb565-d=
raw-render.html">SKIP</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/drm-=
tip/CI_DRM_18943/shard-dg2-6/igt@kms_frontbuffer_tracking@fbcpsrhdr-rgb565-=
draw-render.html">SKIP</a>) (<a href=3D"https://gitlab.freedesktop.org/drm/=
i915/kernel/-/issues/15102">i915#15102</a> / <a href=3D"https://gitlab.free=
desktop.org/drm/i915/kernel/-/issues/16708">i915#16708</a>) -&gt; <a href=
=3D"https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_171551v1/shard-dg2-4=
/igt@kms_frontbuffer_tracking@fbcpsrhdr-rgb565-draw-render.html">SKIP</a> (=
<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15102">i=
915#15102</a>) +17 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsrhdr-tiling-y:</p>
<ul>
<li>shard-dg2:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_18943/shard-dg2-8/igt@kms_frontbuffer_tracking@fbcpsrhdr-tiling-y.h=
tml">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/=
issues/10055">i915#10055</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/Patchwork_171551v1/shard-dg2-10/igt@kms_frontbuffer_tracking@f=
bcpsrhdr-tiling-y.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org=
/drm/i915/kernel/-/issues/16708">i915#16708</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@hdr-1p-primscrn-pri-shrfb-draw-mmap-cpu:</p>
<ul>
<li>shard-dg2:          (<a href=3D"https://intel-gfx-ci.01.org/tree/drm-ti=
p/CI_DRM_18943/shard-dg2-7/igt@kms_frontbuffer_tracking@hdr-1p-primscrn-pri=
-shrfb-draw-mmap-cpu.html">SKIP</a>, <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/CI_DRM_18943/shard-dg2-10/igt@kms_frontbuffer_tracking@hdr-1p=
-primscrn-pri-shrfb-draw-mmap-cpu.html">SKIP</a>) (<a href=3D"https://gitla=
b.freedesktop.org/drm/i915/kernel/-/issues/15989">i915#15989</a> / <a href=
=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16708">i915#167=
08</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork=
_171551v1/shard-dg2-7/igt@kms_frontbuffer_tracking@hdr-1p-primscrn-pri-shrf=
b-draw-mmap-cpu.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/d=
rm/i915/kernel/-/issues/15989">i915#15989</a>) +19 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@hdr-2p-scndscrn-pri-shrfb-draw-mmap-cpu:</p>
<ul>
<li>shard-glk:          (<a href=3D"https://intel-gfx-ci.01.org/tree/drm-ti=
p/CI_DRM_18943/shard-glk5/igt@kms_frontbuffer_tracking@hdr-2p-scndscrn-pri-=
shrfb-draw-mmap-cpu.html">SKIP</a>, <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/CI_DRM_18943/shard-glk8/igt@kms_frontbuffer_tracking@hdr-2p-sc=
ndscrn-pri-shrfb-draw-mmap-cpu.html">PASS</a>) -&gt; <a href=3D"https://int=
el-gfx-ci.01.org/tree/drm-tip/Patchwork_171551v1/shard-glk1/igt@kms_frontbu=
ffer_tracking@hdr-2p-scndscrn-pri-shrfb-draw-mmap-cpu.html">SKIP</a> +18 ot=
her tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@hdr-rgb565-draw-mmap-cpu:</p>
<ul>
<li>shard-dg2:          (<a href=3D"https://intel-gfx-ci.01.org/tree/drm-ti=
p/CI_DRM_18943/shard-dg2-1/igt@kms_frontbuffer_tracking@hdr-rgb565-draw-mma=
p-cpu.html">SKIP</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/C=
I_DRM_18943/shard-dg2-6/igt@kms_frontbuffer_tracking@hdr-rgb565-draw-mmap-c=
pu.html">SKIP</a>) (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kern=
el/-/issues/15989">i915#15989</a>) -&gt; <a href=3D"https://intel-gfx-ci.01=
.org/tree/drm-tip/Patchwork_171551v1/shard-dg2-10/igt@kms_frontbuffer_track=
ing@hdr-rgb565-draw-mmap-cpu.html">SKIP</a> (<a href=3D"https://gitlab.free=
desktop.org/drm/i915/kernel/-/issues/16708">i915#16708</a>) +4 other tests =
skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-1p-offscreen-pri-shrfb-draw-mmap-gtt:</=
p>
<ul>
<li>shard-dg2:          (<a href=3D"https://intel-gfx-ci.01.org/tree/drm-ti=
p/CI_DRM_18943/shard-dg2-4/igt@kms_frontbuffer_tracking@psr-1p-offscreen-pr=
i-shrfb-draw-mmap-gtt.html">SKIP</a>, <a href=3D"https://intel-gfx-ci.01.or=
g/tree/drm-tip/CI_DRM_18943/shard-dg2-10/igt@kms_frontbuffer_tracking@psr-1=
p-offscreen-pri-shrfb-draw-mmap-gtt.html">SKIP</a>) (<a href=3D"https://git=
lab.freedesktop.org/drm/i915/kernel/-/issues/15104">i915#15104</a> / <a hre=
f=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15990">i915#15=
990</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issue=
s/16708">i915#16708</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/=
drm-tip/Patchwork_171551v1/shard-dg2-10/igt@kms_frontbuffer_tracking@psr-1p=
-offscreen-pri-shrfb-draw-mmap-gtt.html">SKIP</a> (<a href=3D"https://gitla=
b.freedesktop.org/drm/i915/kernel/-/issues/16708">i915#16708</a>) +2 other =
tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-1p-offscreen-pri-shrfb-draw-mmap-wc:</p>
<ul>
<li>shard-dg2:          (<a href=3D"https://intel-gfx-ci.01.org/tree/drm-ti=
p/CI_DRM_18943/shard-dg2-10/igt@kms_frontbuffer_tracking@psr-1p-offscreen-p=
ri-shrfb-draw-mmap-wc.html">SKIP</a>, <a href=3D"https://intel-gfx-ci.01.or=
g/tree/drm-tip/CI_DRM_18943/shard-dg2-1/igt@kms_frontbuffer_tracking@psr-1p=
-offscreen-pri-shrfb-draw-mmap-wc.html">SKIP</a>) (<a href=3D"https://gitla=
b.freedesktop.org/drm/i915/kernel/-/issues/15104">i915#15104</a> / <a href=
=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15990">i915#159=
90</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues=
/16708">i915#16708</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/d=
rm-tip/Patchwork_171551v1/shard-dg2-3/igt@kms_frontbuffer_tracking@psr-1p-o=
ffscreen-pri-shrfb-draw-mmap-wc.html">SKIP</a> (<a href=3D"https://gitlab.f=
reedesktop.org/drm/i915/kernel/-/issues/15104">i915#15104</a> / <a href=3D"=
https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15990">i915#15990</=
a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-1p-primscrn-cur-indfb-draw-mmap-cpu:</p>
<ul>
<li>shard-dg2:          (<a href=3D"https://intel-gfx-ci.01.org/tree/drm-ti=
p/CI_DRM_18943/shard-dg2-4/igt@kms_frontbuffer_tracking@psr-1p-primscrn-cur=
-indfb-draw-mmap-cpu.html">SKIP</a>, <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/CI_DRM_18943/shard-dg2-6/igt@kms_frontbuffer_tracking@psr-1p-=
primscrn-cur-indfb-draw-mmap-cpu.html">SKIP</a>) (<a href=3D"https://gitlab=
.freedesktop.org/drm/i915/kernel/-/issues/10433">i915#10433</a> / <a href=
=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15102">i915#151=
02</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork=
_171551v1/shard-dg2-6/igt@kms_frontbuffer_tracking@psr-1p-primscrn-cur-indf=
b-draw-mmap-cpu.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/d=
rm/i915/kernel/-/issues/15102">i915#15102</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-1p-primscrn-cur-indfb-move:</p>
<ul>
<li>shard-dg2:          (<a href=3D"https://intel-gfx-ci.01.org/tree/drm-ti=
p/CI_DRM_18943/shard-dg2-8/igt@kms_frontbuffer_tracking@psr-1p-primscrn-cur=
-indfb-move.html">SKIP</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/drm=
-tip/CI_DRM_18943/shard-dg2-10/igt@kms_frontbuffer_tracking@psr-1p-primscrn=
-cur-indfb-move.html">SKIP</a>) (<a href=3D"https://gitlab.freedesktop.org/=
drm/i915/kernel/-/issues/15102">i915#15102</a> / <a href=3D"https://gitlab.=
freedesktop.org/drm/i915/kernel/-/issues/16708">i915#16708</a> / <a href=3D=
"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5354">i915#5354</a=
>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_1715=
51v1/shard-dg2-10/igt@kms_frontbuffer_tracking@psr-1p-primscrn-cur-indfb-mo=
ve.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kerne=
l/-/issues/16708">i915#16708</a> / <a href=3D"https://gitlab.freedesktop.or=
g/drm/i915/kernel/-/issues/5354">i915#5354</a>) +11 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-1p-primscrn-pri-indfb-draw-mmap-cpu:</p>
<ul>
<li>shard-rkl:          (<a href=3D"https://intel-gfx-ci.01.org/tree/drm-ti=
p/CI_DRM_18943/shard-rkl-5/igt@kms_frontbuffer_tracking@psr-1p-primscrn-pri=
-indfb-draw-mmap-cpu.html">SKIP</a>, <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/CI_DRM_18943/shard-rkl-2/igt@kms_frontbuffer_tracking@psr-1p-=
primscrn-pri-indfb-draw-mmap-cpu.html">SKIP</a>) (<a href=3D"https://gitlab=
.freedesktop.org/drm/i915/kernel/-/issues/15102">i915#15102</a> / <a href=
=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3023">i915#3023=
</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_1=
71551v1/shard-rkl-6/igt@kms_frontbuffer_tracking@psr-1p-primscrn-pri-indfb-=
draw-mmap-cpu.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm=
/i915/kernel/-/issues/14544">i915#14544</a> / <a href=3D"https://gitlab.fre=
edesktop.org/drm/i915/kernel/-/issues/15102">i915#15102</a> / <a href=3D"ht=
tps://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3023">i915#3023</a>)<=
/li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-1p-primscrn-pri-shrfb-draw-blt:</p>
<ul>
<li>shard-dg2:          (<a href=3D"https://intel-gfx-ci.01.org/tree/drm-ti=
p/CI_DRM_18943/shard-dg2-10/igt@kms_frontbuffer_tracking@psr-1p-primscrn-pr=
i-shrfb-draw-blt.html">SKIP</a>, <a href=3D"https://intel-gfx-ci.01.org/tre=
e/drm-tip/CI_DRM_18943/shard-dg2-4/igt@kms_frontbuffer_tracking@psr-1p-prim=
scrn-pri-shrfb-draw-blt.html">SKIP</a>) (<a href=3D"https://gitlab.freedesk=
top.org/drm/i915/kernel/-/issues/10433">i915#10433</a> / <a href=3D"https:/=
/gitlab.freedesktop.org/drm/i915/kernel/-/issues/15102">i915#15102</a> / <a=
 href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16708">i91=
5#16708</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/i=
ssues/5354">i915#5354</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tre=
e/drm-tip/Patchwork_171551v1/shard-dg2-10/igt@kms_frontbuffer_tracking@psr-=
1p-primscrn-pri-shrfb-draw-blt.html">SKIP</a> (<a href=3D"https://gitlab.fr=
eedesktop.org/drm/i915/kernel/-/issues/16708">i915#16708</a> / <a href=3D"h=
ttps://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5354">i915#5354</a>)=
 +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-1p-primscrn-pri-shrfb-draw-render:</p>
<ul>
<li>shard-dg2:          (<a href=3D"https://intel-gfx-ci.01.org/tree/drm-ti=
p/CI_DRM_18943/shard-dg2-10/igt@kms_frontbuffer_tracking@psr-1p-primscrn-pr=
i-shrfb-draw-render.html">SKIP</a>, <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/CI_DRM_18943/shard-dg2-6/igt@kms_frontbuffer_tracking@psr-1p-p=
rimscrn-pri-shrfb-draw-render.html">SKIP</a>) (<a href=3D"https://gitlab.fr=
eedesktop.org/drm/i915/kernel/-/issues/15102">i915#15102</a> / <a href=3D"h=
ttps://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16708">i915#16708</a=
> / <a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5354=
">i915#5354</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/=
Patchwork_171551v1/shard-dg2-4/igt@kms_frontbuffer_tracking@psr-1p-primscrn=
-pri-shrfb-draw-render.html">SKIP</a> (<a href=3D"https://gitlab.freedeskto=
p.org/drm/i915/kernel/-/issues/15102">i915#15102</a>) +16 other tests skip<=
/li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-2p-primscrn-pri-indfb-draw-render:</p>
<ul>
<li>shard-dg2:          (<a href=3D"https://intel-gfx-ci.01.org/tree/drm-ti=
p/CI_DRM_18943/shard-dg2-10/igt@kms_frontbuffer_tracking@psr-2p-primscrn-pr=
i-indfb-draw-render.html">SKIP</a>, <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/CI_DRM_18943/shard-dg2-3/igt@kms_frontbuffer_tracking@psr-2p-p=
rimscrn-pri-indfb-draw-render.html">SKIP</a>) (<a href=3D"https://gitlab.fr=
eedesktop.org/drm/i915/kernel/-/issues/15991">i915#15991</a> / <a href=3D"h=
ttps://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16708">i915#16708</a=
> / <a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5354=
">i915#5354</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/=
Patchwork_171551v1/shard-dg2-7/igt@kms_frontbuffer_tracking@psr-2p-primscrn=
-pri-indfb-draw-render.html">SKIP</a> (<a href=3D"https://gitlab.freedeskto=
p.org/drm/i915/kernel/-/issues/15991">i915#15991</a> / <a href=3D"https://g=
itlab.freedesktop.org/drm/i915/kernel/-/issues/5354">i915#5354</a>) +32 oth=
er tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-rgb565-draw-mmap-cpu:</p>
<ul>
<li>shard-dg2:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_18943/shard-dg2-8/igt@kms_frontbuffer_tracking@psr-rgb565-draw-mmap=
-cpu.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/ker=
nel/-/issues/15102">i915#15102</a>) -&gt; <a href=3D"https://intel-gfx-ci.0=
1.org/tree/drm-tip/Patchwork_171551v1/shard-dg2-10/igt@kms_frontbuffer_trac=
king@psr-rgb565-draw-mmap-cpu.html">SKIP</a> (<a href=3D"https://gitlab.fre=
edesktop.org/drm/i915/kernel/-/issues/16708">i915#16708</a> / <a href=3D"ht=
tps://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5354">i915#5354</a>) =
+1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-suspend:</p>
<ul>
<li>shard-rkl:          (<a href=3D"https://intel-gfx-ci.01.org/tree/drm-ti=
p/CI_DRM_18943/shard-rkl-6/igt@kms_frontbuffer_tracking@psr-suspend.html">S=
KIP</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18943/s=
hard-rkl-3/igt@kms_frontbuffer_tracking@psr-suspend.html">SKIP</a>) (<a hre=
f=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14=
544</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issue=
s/15102">i915#15102</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i91=
5/kernel/-/issues/3023">i915#3023</a>) -&gt; <a href=3D"https://intel-gfx-c=
i.01.org/tree/drm-tip/Patchwork_171551v1/shard-rkl-5/igt@kms_frontbuffer_tr=
acking@psr-suspend.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.or=
g/drm/i915/kernel/-/issues/15102">i915#15102</a> / <a href=3D"https://gitla=
b.freedesktop.org/drm/i915/kernel/-/issues/3023">i915#3023</a>) +13 other t=
ests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psrhdr-2p-pri-indfb-multidraw:</p>
<ul>
<li>shard-dg2:          (<a href=3D"https://intel-gfx-ci.01.org/tree/drm-ti=
p/CI_DRM_18943/shard-dg2-7/igt@kms_frontbuffer_tracking@psrhdr-2p-pri-indfb=
-multidraw.html">SKIP</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/drm-=
tip/CI_DRM_18943/shard-dg2-10/igt@kms_frontbuffer_tracking@psrhdr-2p-pri-in=
dfb-multidraw.html">SKIP</a>) (<a href=3D"https://gitlab.freedesktop.org/dr=
m/i915/kernel/-/issues/15991">i915#15991</a> / <a href=3D"https://gitlab.fr=
eedesktop.org/drm/i915/kernel/-/issues/16708">i915#16708</a>) -&gt; <a href=
=3D"https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_171551v1/shard-dg2-7=
/igt@kms_frontbuffer_tracking@psrhdr-2p-pri-indfb-multidraw.html">SKIP</a> =
(<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15991">=
i915#15991</a>) +34 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psrhdr-2p-scndscrn-spr-indfb-draw-render:</=
p>
<ul>
<li>shard-dg2:          (<a href=3D"https://intel-gfx-ci.01.org/tree/drm-ti=
p/CI_DRM_18943/shard-dg2-10/igt@kms_frontbuffer_tracking@psrhdr-2p-scndscrn=
-spr-indfb-draw-render.html">SKIP</a>, <a href=3D"https://intel-gfx-ci.01.o=
rg/tree/drm-tip/CI_DRM_18943/shard-dg2-4/igt@kms_frontbuffer_tracking@psrhd=
r-2p-scndscrn-spr-indfb-draw-render.html">SKIP</a>) (<a href=3D"https://git=
lab.freedesktop.org/drm/i915/kernel/-/issues/15991">i915#15991</a> / <a hre=
f=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16708">i915#16=
708</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/Patchwor=
k_171551v1/shard-dg2-10/igt@kms_frontbuffer_tracking@psrhdr-2p-scndscrn-spr=
-indfb-draw-render.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.or=
g/drm/i915/kernel/-/issues/16708">i915#16708</a>) +29 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_hdr@bpc-switch:</p>
<ul>
<li>shard-dg2:          (<a href=3D"https://intel-gfx-ci.01.org/tree/drm-ti=
p/CI_DRM_18943/shard-dg2-10/igt@kms_hdr@bpc-switch.html">SKIP</a>, <a href=
=3D"https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18943/shard-dg2-6/igt@k=
ms_hdr@bpc-switch.html">SKIP</a>) (<a href=3D"https://gitlab.freedesktop.or=
g/drm/i915/kernel/-/issues/16518">i915#16518</a> / <a href=3D"https://gitla=
b.freedesktop.org/drm/i915/kernel/-/issues/16707">i915#16707</a> / <a href=
=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3555">i915#3555=
</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8=
228">i915#8228</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-t=
ip/Patchwork_171551v1/shard-dg2-4/igt@kms_hdr@bpc-switch.html">SKIP</a> (<a=
 href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16518">i91=
5#16518</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/i=
ssues/3555">i915#3555</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i=
915/kernel/-/issues/8228">i915#8228</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_hdr@brightness-with-hdr:</p>
<ul>
<li>shard-rkl:          (<a href=3D"https://intel-gfx-ci.01.org/tree/drm-ti=
p/CI_DRM_18943/shard-rkl-7/igt@kms_hdr@brightness-with-hdr.html">SKIP</a>, =
<a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18943/shard-rkl-=
5/igt@kms_hdr@brightness-with-hdr.html">SKIP</a>) (<a href=3D"https://gitla=
b.freedesktop.org/drm/i915/kernel/-/issues/12713">i915#12713</a> / <a href=
=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16644">i915#166=
44</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork=
_171551v1/shard-rkl-1/igt@kms_hdr@brightness-with-hdr.html">SKIP</a> (<a hr=
ef=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16644">i915#1=
6644</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_hdr@static-toggle:</p>
<ul>
<li>shard-dg2:          (<a href=3D"https://intel-gfx-ci.01.org/tree/drm-ti=
p/CI_DRM_18943/shard-dg2-6/igt@kms_hdr@static-toggle.html">SKIP</a>, <a hre=
f=3D"https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18943/shard-dg2-1/igt@=
kms_hdr@static-toggle.html">SKIP</a>) (<a href=3D"https://gitlab.freedeskto=
p.org/drm/i915/kernel/-/issues/16518">i915#16518</a> / <a href=3D"https://g=
itlab.freedesktop.org/drm/i915/kernel/-/issues/3555">i915#3555</a> / <a hre=
f=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8228">i915#822=
8</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_=
171551v1/shard-dg2-10/igt@kms_hdr@static-toggle.html">SKIP</a> (<a href=3D"=
https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16707">i915#16707</=
a>)</li>
<li>shard-rkl:          (<a href=3D"https://intel-gfx-ci.01.org/tree/drm-ti=
p/CI_DRM_18943/shard-rkl-3/igt@kms_hdr@static-toggle.html">SKIP</a>, <a hre=
f=3D"https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18943/shard-rkl-1/igt@=
kms_hdr@static-toggle.html">PASS</a>) (<a href=3D"https://gitlab.freedeskto=
p.org/drm/i915/kernel/-/issues/16644">i915#16644</a> / <a href=3D"https://g=
itlab.freedesktop.org/drm/i915/kernel/-/issues/3555">i915#3555</a> / <a hre=
f=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8228">i915#822=
8</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_=
171551v1/shard-rkl-3/igt@kms_hdr@static-toggle.html">SKIP</a> (<a href=3D"h=
ttps://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16644">i915#16644</a=
> / <a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3555=
">i915#3555</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel=
/-/issues/8228">i915#8228</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_hdr@static-toggle-dpms:</p>
<ul>
<li>shard-dg2:          (<a href=3D"https://intel-gfx-ci.01.org/tree/drm-ti=
p/CI_DRM_18943/shard-dg2-10/igt@kms_hdr@static-toggle-dpms.html">SKIP</a>, =
<a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18943/shard-dg2-=
8/igt@kms_hdr@static-toggle-dpms.html">SKIP</a>) (<a href=3D"https://gitlab=
.freedesktop.org/drm/i915/kernel/-/issues/16518">i915#16518</a> / <a href=
=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16707">i915#167=
07</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues=
/3555">i915#3555</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i915/k=
ernel/-/issues/8228">i915#8228</a>) -&gt; <a href=3D"https://intel-gfx-ci.0=
1.org/tree/drm-tip/Patchwork_171551v1/shard-dg2-10/igt@kms_hdr@static-toggl=
e-dpms.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/k=
ernel/-/issues/16707">i915#16707</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_invalid_mode@zero-hdisplay:</p>
<ul>
<li>shard-dg2:          (<a href=3D"https://intel-gfx-ci.01.org/tree/drm-ti=
p/CI_DRM_18943/shard-dg2-10/igt@kms_invalid_mode@zero-hdisplay.html">SKIP</=
a>, <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18943/shard-=
dg2-4/igt@kms_invalid_mode@zero-hdisplay.html">PASS</a>) (<a href=3D"https:=
//gitlab.freedesktop.org/drm/i915/kernel/-/issues/16746">i915#16746</a> / <=
a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3555">i91=
5#3555</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/Patch=
work_171551v1/shard-dg2-10/igt@kms_invalid_mode@zero-hdisplay.html">SKIP</a=
> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16746=
">i915#16746</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i915/kerne=
l/-/issues/3555">i915#3555</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_panel_fitting@atomic-fastset:</p>
<ul>
<li>shard-dg2:          (<a href=3D"https://intel-gfx-ci.01.org/tree/drm-ti=
p/CI_DRM_18943/shard-dg2-7/igt@kms_panel_fitting@atomic-fastset.html">SKIP<=
/a>, <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18943/shard=
-dg2-10/igt@kms_panel_fitting@atomic-fastset.html">SKIP</a>) (<a href=3D"ht=
tps://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16707">i915#16707</a>=
 / <a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6301"=
>i915#6301</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/P=
atchwork_171551v1/shard-dg2-7/igt@kms_panel_fitting@atomic-fastset.html">SK=
IP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/=
6301">i915#6301</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pipe_crc_basic@read-crc:</p>
<ul>
<li>shard-dg2:          (<a href=3D"https://intel-gfx-ci.01.org/tree/drm-ti=
p/CI_DRM_18943/shard-dg2-4/igt@kms_pipe_crc_basic@read-crc.html">PASS</a>, =
<a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18943/shard-dg2-=
10/igt@kms_pipe_crc_basic@read-crc.html">SKIP</a>) (<a href=3D"https://gitl=
ab.freedesktop.org/drm/i915/kernel/-/issues/11190">i915#11190</a> / <a href=
=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16707">i915#167=
07</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork=
_171551v1/shard-dg2-10/igt@kms_pipe_crc_basic@read-crc.html">SKIP</a> (<a h=
ref=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11190">i915#=
11190</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/iss=
ues/16707">i915#16707</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_plane@pixel-format-4-tiled-dg2-rc-ccs-cc-modifier-source-clampin=
g:</p>
<ul>
<li>shard-dg2:          (<a href=3D"https://intel-gfx-ci.01.org/tree/drm-ti=
p/CI_DRM_18943/shard-dg2-10/igt@kms_plane@pixel-format-4-tiled-dg2-rc-ccs-c=
c-modifier-source-clamping.html">SKIP</a>, <a href=3D"https://intel-gfx-ci.=
01.org/tree/drm-tip/CI_DRM_18943/shard-dg2-4/igt@kms_plane@pixel-format-4-t=
iled-dg2-rc-ccs-cc-modifier-source-clamping.html">PASS</a>) (<a href=3D"htt=
ps://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8825">i915#8825</a>) -=
&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_171551v1=
/shard-dg2-10/igt@kms_plane@pixel-format-4-tiled-dg2-rc-ccs-cc-modifier-sou=
rce-clamping.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/=
i915/kernel/-/issues/8825">i915#8825</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_plane@pixel-format-4-tiled-mtl-mc-ccs-modifier:</p>
<ul>
<li>shard-rkl:          (<a href=3D"https://intel-gfx-ci.01.org/tree/drm-ti=
p/CI_DRM_18943/shard-rkl-2/igt@kms_plane@pixel-format-4-tiled-mtl-mc-ccs-mo=
difier.html">SKIP</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/=
CI_DRM_18943/shard-rkl-5/igt@kms_plane@pixel-format-4-tiled-mtl-mc-ccs-modi=
fier.html">SKIP</a>) (<a href=3D"https://gitlab.freedesktop.org/drm/i915/ke=
rnel/-/issues/15709">i915#15709</a>) -&gt; <a href=3D"https://intel-gfx-ci.=
01.org/tree/drm-tip/Patchwork_171551v1/shard-rkl-6/igt@kms_plane@pixel-form=
at-4-tiled-mtl-mc-ccs-modifier.html">SKIP</a> (<a href=3D"https://gitlab.fr=
eedesktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a> / <a href=3D"h=
ttps://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15709">i915#15709</a=
>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane@pixel-format-y-tiled-ccs-modifier:</p>
<ul>
<li>shard-rkl:          (<a href=3D"https://intel-gfx-ci.01.org/tree/drm-ti=
p/CI_DRM_18943/shard-rkl-1/igt@kms_plane@pixel-format-y-tiled-ccs-modifier.=
html">SKIP</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_=
18943/shard-rkl-6/igt@kms_plane@pixel-format-y-tiled-ccs-modifier.html">SKI=
P</a>) (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/=
14544">i915#14544</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i915/=
kernel/-/issues/15709">i915#15709</a>) -&gt; <a href=3D"https://intel-gfx-c=
i.01.org/tree/drm-tip/Patchwork_171551v1/shard-rkl-2/igt@kms_plane@pixel-fo=
rmat-y-tiled-ccs-modifier.html">SKIP</a> (<a href=3D"https://gitlab.freedes=
ktop.org/drm/i915/kernel/-/issues/15709">i915#15709</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane@pixel-format-yf-tiled-modifier:</p>
<ul>
<li>shard-dg1:          (<a href=3D"https://intel-gfx-ci.01.org/tree/drm-ti=
p/CI_DRM_18943/shard-dg1-17/igt@kms_plane@pixel-format-yf-tiled-modifier.ht=
ml">SKIP</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18=
943/shard-dg1-18/igt@kms_plane@pixel-format-yf-tiled-modifier.html">SKIP</a=
>) (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/1570=
9">i915#15709</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-ti=
p/Patchwork_171551v1/shard-dg1-17/igt@kms_plane@pixel-format-yf-tiled-modif=
ier.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kern=
el/-/issues/15709">i915#15709</a> / <a href=3D"https://gitlab.freedesktop.o=
rg/drm/i915/kernel/-/issues/4423">i915#4423</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane@planar-pixel-format-settings:</p>
<ul>
<li>shard-dg2:          (<a href=3D"https://intel-gfx-ci.01.org/tree/drm-ti=
p/CI_DRM_18943/shard-dg2-4/igt@kms_plane@planar-pixel-format-settings.html"=
>PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18943=
/shard-dg2-10/igt@kms_plane@planar-pixel-format-settings.html">SKIP</a>) (<=
a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16753">i9=
15#16753</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/Pat=
chwork_171551v1/shard-dg2-10/igt@kms_plane@planar-pixel-format-settings.htm=
l">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/is=
sues/16753">i915#16753</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane_multiple@2x-tiling-none:</p>
<ul>
<li>shard-dg2:          (<a href=3D"https://intel-gfx-ci.01.org/tree/drm-ti=
p/CI_DRM_18943/shard-dg2-10/igt@kms_plane_multiple@2x-tiling-none.html">SKI=
P</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18943/sha=
rd-dg2-6/igt@kms_plane_multiple@2x-tiling-none.html">SKIP</a>) (<a href=3D"=
https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13958">i915#13958</=
a> / <a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/167=
07">i915#16707</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-t=
ip/Patchwork_171551v1/shard-dg2-4/igt@kms_plane_multiple@2x-tiling-none.htm=
l">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/is=
sues/13958">i915#13958</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane_multiple@2x-tiling-y:</p>
<ul>
<li>shard-dg2:          (<a href=3D"https://intel-gfx-ci.01.org/tree/drm-ti=
p/CI_DRM_18943/shard-dg2-10/igt@kms_plane_multiple@2x-tiling-y.html">SKIP</=
a>, <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18943/shard-=
dg2-4/igt@kms_plane_multiple@2x-tiling-y.html">SKIP</a>) (<a href=3D"https:=
//gitlab.freedesktop.org/drm/i915/kernel/-/issues/13958">i915#13958</a> / <=
a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16707">i9=
15#16707</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/Pat=
chwork_171551v1/shard-dg2-10/igt@kms_plane_multiple@2x-tiling-y.html">SKIP<=
/a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/167=
07">i915#16707</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane_multiple@tiling-y:</p>
<ul>
<li>shard-dg2:          (<a href=3D"https://intel-gfx-ci.01.org/tree/drm-ti=
p/CI_DRM_18943/shard-dg2-8/igt@kms_plane_multiple@tiling-y.html">SKIP</a>, =
<a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18943/shard-dg2-=
10/igt@kms_plane_multiple@tiling-y.html">SKIP</a>) (<a href=3D"https://gitl=
ab.freedesktop.org/drm/i915/kernel/-/issues/14259">i915#14259</a> / <a href=
=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16707">i915#167=
07</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork=
_171551v1/shard-dg2-10/igt@kms_plane_multiple@tiling-y.html">SKIP</a> (<a h=
ref=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16707">i915#=
16707</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-upscale-20x20-with-modifiers:</p>
<ul>
<li>shard-dg2:          (<a href=3D"https://intel-gfx-ci.01.org/tree/drm-ti=
p/CI_DRM_18943/shard-dg2-10/igt@kms_plane_scaling@plane-upscale-20x20-with-=
modifiers.html">SKIP</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/drm-t=
ip/CI_DRM_18943/shard-dg2-4/igt@kms_plane_scaling@plane-upscale-20x20-with-=
modifiers.html">PASS</a>) (<a href=3D"https://gitlab.freedesktop.org/drm/i9=
15/kernel/-/issues/15329">i915#15329</a> / <a href=3D"https://gitlab.freede=
sktop.org/drm/i915/kernel/-/issues/9423">i915#9423</a>) -&gt; <a href=3D"ht=
tps://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_171551v1/shard-dg2-10/igt@=
kms_plane_scaling@plane-upscale-20x20-with-modifiers.html">SKIP</a> (<a hre=
f=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15329">i915#15=
329</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issue=
s/9423">i915#9423</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@planes-upscale-factor-0-25:</p>
<ul>
<li>shard-dg2:          (<a href=3D"https://intel-gfx-ci.01.org/tree/drm-ti=
p/CI_DRM_18943/shard-dg2-8/igt@kms_plane_scaling@planes-upscale-factor-0-25=
.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM=
_18943/shard-dg2-10/igt@kms_plane_scaling@planes-upscale-factor-0-25.html">=
SKIP</a>) (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issu=
es/15329">i915#15329</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i9=
15/kernel/-/issues/3555">i915#3555</a> / <a href=3D"https://gitlab.freedesk=
top.org/drm/i915/kernel/-/issues/6953">i915#6953</a> / <a href=3D"https://g=
itlab.freedesktop.org/drm/i915/kernel/-/issues/9423">i915#9423</a>) -&gt; <=
a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_171551v1/shard=
-dg2-10/igt@kms_plane_scaling@planes-upscale-factor-0-25.html">SKIP</a> (<a=
 href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15329">i91=
5#15329</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/i=
ssues/3555">i915#3555</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i=
915/kernel/-/issues/6953">i915#6953</a> / <a href=3D"https://gitlab.freedes=
ktop.org/drm/i915/kernel/-/issues/9423">i915#9423</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@planes-upscale-factor-0-25@pipe-d:</p>
<ul>
<li>shard-dg2:          (<a href=3D"https://intel-gfx-ci.01.org/tree/drm-ti=
p/CI_DRM_18943/shard-dg2-10/igt@kms_plane_scaling@planes-upscale-factor-0-2=
5@pipe-d.html">SKIP</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/drm-ti=
p/CI_DRM_18943/shard-dg2-8/igt@kms_plane_scaling@planes-upscale-factor-0-25=
@pipe-d.html">PASS</a>) (<a href=3D"https://gitlab.freedesktop.org/drm/i915=
/kernel/-/issues/15329">i915#15329</a>) -&gt; <a href=3D"https://intel-gfx-=
ci.01.org/tree/drm-tip/Patchwork_171551v1/shard-dg2-10/igt@kms_plane_scalin=
g@planes-upscale-factor-0-25@pipe-d.html">SKIP</a> (<a href=3D"https://gitl=
ab.freedesktop.org/drm/i915/kernel/-/issues/15329">i915#15329</a>) +15 othe=
r tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_pm_dc@dc5-pageflip-negative:</p>
<ul>
<li>shard-rkl:          (<a href=3D"https://intel-gfx-ci.01.org/tree/drm-ti=
p/CI_DRM_18943/shard-rkl-3/igt@kms_pm_dc@dc5-pageflip-negative.html">SKIP</=
a>, <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18943/shard-=
rkl-6/igt@kms_pm_dc@dc5-pageflip-negative.html">SKIP</a>) (<a href=3D"https=
://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a> / =
<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9685">i9=
15#9685</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/Patc=
hwork_171551v1/shard-rkl-5/igt@kms_pm_dc@dc5-pageflip-negative.html">SKIP</=
a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9685=
">i915#9685</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pm_dc@dc9-dpms:</p>
<ul>
<li>shard-tglu:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_18943/shard-tglu-6/igt@kms_pm_dc@dc9-dpms.html">SKIP</a> (<a href=
=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15128">i915#151=
28</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork=
_171551v1/shard-tglu-9/igt@kms_pm_dc@dc9-dpms.html">SKIP</a> (<a href=3D"ht=
tps://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15739">i915#15739</a>=
)</li>
</ul>
</li>
<li>
<p>igt@kms_pm_lpsp@kms-lpsp:</p>
<ul>
<li>shard-rkl:          (<a href=3D"https://intel-gfx-ci.01.org/tree/drm-ti=
p/CI_DRM_18943/shard-rkl-8/igt@kms_pm_lpsp@kms-lpsp.html">SKIP</a>, <a href=
=3D"https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18943/shard-rkl-7/igt@k=
ms_pm_lpsp@kms-lpsp.html">SKIP</a>) (<a href=3D"https://gitlab.freedesktop.=
org/drm/i915/kernel/-/issues/3828">i915#3828</a> / <a href=3D"https://gitla=
b.freedesktop.org/drm/i915/kernel/-/issues/9340">i915#9340</a>) -&gt; <a hr=
ef=3D"https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_171551v1/shard-rkl=
-4/igt@kms_pm_lpsp@kms-lpsp.html">SKIP</a> (<a href=3D"https://gitlab.freed=
esktop.org/drm/i915/kernel/-/issues/9340">i915#9340</a>)</li>
<li>shard-dg1:          (<a href=3D"https://intel-gfx-ci.01.org/tree/drm-ti=
p/CI_DRM_18943/shard-dg1-15/igt@kms_pm_lpsp@kms-lpsp.html">SKIP</a>, <a hre=
f=3D"https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18943/shard-dg1-17/igt=
@kms_pm_lpsp@kms-lpsp.html">SKIP</a>) (<a href=3D"https://gitlab.freedeskto=
p.org/drm/i915/kernel/-/issues/3828">i915#3828</a> / <a href=3D"https://git=
lab.freedesktop.org/drm/i915/kernel/-/issues/9340">i915#9340</a>) -&gt; <a =
href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_171551v1/shard-d=
g1-16/igt@kms_pm_lpsp@kms-lpsp.html">SKIP</a> (<a href=3D"https://gitlab.fr=
eedesktop.org/drm/i915/kernel/-/issues/9340">i915#9340</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pm_rpm@dpms-lpsp:</p>
<ul>
<li>shard-dg2:          (<a href=3D"https://intel-gfx-ci.01.org/tree/drm-ti=
p/CI_DRM_18943/shard-dg2-10/igt@kms_pm_rpm@dpms-lpsp.html">SKIP</a>, <a hre=
f=3D"https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18943/shard-dg2-4/igt@=
kms_pm_rpm@dpms-lpsp.html">PASS</a>) (<a href=3D"https://gitlab.freedesktop=
.org/drm/i915/kernel/-/issues/15073">i915#15073</a>) -&gt; <a href=3D"https=
://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_171551v1/shard-dg2-10/igt@kms=
_pm_rpm@dpms-lpsp.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org=
/drm/i915/kernel/-/issues/15073">i915#15073</a>) +1 other test skip</li>
<li>shard-dg1:          (<a href=3D"https://intel-gfx-ci.01.org/tree/drm-ti=
p/CI_DRM_18943/shard-dg1-14/igt@kms_pm_rpm@dpms-lpsp.html">PASS</a>, <a hre=
f=3D"https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18943/shard-dg1-13/igt=
@kms_pm_rpm@dpms-lpsp.html">SKIP</a>) (<a href=3D"https://gitlab.freedeskto=
p.org/drm/i915/kernel/-/issues/15073">i915#15073</a>) -&gt; <a href=3D"http=
s://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_171551v1/shard-dg1-13/igt@km=
s_pm_rpm@dpms-lpsp.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.or=
g/drm/i915/kernel/-/issues/15073">i915#15073</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_pm_rpm@dpms-mode-unset-non-lpsp:</p>
<ul>
<li>shard-rkl:          (<a href=3D"https://intel-gfx-ci.01.org/tree/drm-ti=
p/CI_DRM_18943/shard-rkl-2/igt@kms_pm_rpm@dpms-mode-unset-non-lpsp.html">SK=
IP</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18943/sh=
ard-rkl-7/igt@kms_pm_rpm@dpms-mode-unset-non-lpsp.html">PASS</a>) (<a href=
=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15073">i915#150=
73</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork=
_171551v1/shard-rkl-8/igt@kms_pm_rpm@dpms-mode-unset-non-lpsp.html">SKIP</a=
> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15073=
">i915#15073</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_pm_rpm@drm-resources-equal:</p>
<ul>
<li>shard-dg2:          (<a href=3D"https://intel-gfx-ci.01.org/tree/drm-ti=
p/CI_DRM_18943/shard-dg2-4/igt@kms_pm_rpm@drm-resources-equal.html">PASS</a=
>, <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18943/shard-d=
g2-10/igt@kms_pm_rpm@drm-resources-equal.html">SKIP</a>) (<a href=3D"https:=
//gitlab.freedesktop.org/drm/i915/kernel/-/issues/3547">i915#3547</a>) -&gt=
; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_171551v1/sh=
ard-dg2-10/igt@kms_pm_rpm@drm-resources-equal.html">SKIP</a> (<a href=3D"ht=
tps://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3547">i915#3547</a>)<=
/li>
</ul>
</li>
<li>
<p>igt@kms_properties@colorop-properties-legacy:</p>
<ul>
<li>shard-dg2:          (<a href=3D"https://intel-gfx-ci.01.org/tree/drm-ti=
p/CI_DRM_18943/shard-dg2-8/igt@kms_properties@colorop-properties-legacy.htm=
l">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_189=
43/shard-dg2-10/igt@kms_properties@colorop-properties-legacy.html">SKIP</a>=
) (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15347=
">i915#15347</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/Patchwork_171551v1/shard-dg2-10/igt@kms_properties@colorop-properties-lega=
cy.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kerne=
l/-/issues/15347">i915#15347</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@fbc-psr2-overlay-plane-update-continuous-sf:</p>
<ul>
<li>shard-rkl:          (<a href=3D"https://intel-gfx-ci.01.org/tree/drm-ti=
p/CI_DRM_18943/shard-rkl-6/igt@kms_psr2_sf@fbc-psr2-overlay-plane-update-co=
ntinuous-sf.html">SKIP</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/drm=
-tip/CI_DRM_18943/shard-rkl-3/igt@kms_psr2_sf@fbc-psr2-overlay-plane-update=
-continuous-sf.html">SKIP</a>) (<a href=3D"https://gitlab.freedesktop.org/d=
rm/i915/kernel/-/issues/11520">i915#11520</a> / <a href=3D"https://gitlab.f=
reedesktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a>) -&gt; <a hre=
f=3D"https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_171551v1/shard-rkl-=
5/igt@kms_psr2_sf@fbc-psr2-overlay-plane-update-continuous-sf.html">SKIP</a=
> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11520=
">i915#11520</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_su@page_flip-p010:</p>
<ul>
<li>shard-rkl:          (<a href=3D"https://intel-gfx-ci.01.org/tree/drm-ti=
p/CI_DRM_18943/shard-rkl-1/igt@kms_psr2_su@page_flip-p010.html">SKIP</a>, <=
a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18943/shard-rkl-6=
/igt@kms_psr2_su@page_flip-p010.html">SKIP</a>) (<a href=3D"https://gitlab.=
freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a> / <a href=3D=
"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9683">i915#9683</a=
>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_1715=
51v1/shard-rkl-2/igt@kms_psr2_su@page_flip-p010.html">SKIP</a> (<a href=3D"=
https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9683">i915#9683</a>=
)</li>
</ul>
</li>
<li>
<p>igt@kms_psr@fbc-psr-primary-mmap-cpu:</p>
<ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_18943/shard-rkl-7/igt@kms_psr@fbc-psr-primary-mmap-cpu.html">SKIP</=
a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/1072=
">i915#1072</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel=
/-/issues/9732">i915#9732</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/Patchwork_171551v1/shard-rkl-6/igt@kms_psr@fbc-psr-primary-mm=
ap-cpu.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/k=
ernel/-/issues/1072">i915#1072</a> / <a href=3D"https://gitlab.freedesktop.=
org/drm/i915/kernel/-/issues/14544">i915#14544</a> / <a href=3D"https://git=
lab.freedesktop.org/drm/i915/kernel/-/issues/9732">i915#9732</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr@fbc-psr-suspend:</p>
<ul>
<li>shard-rkl:          (<a href=3D"https://intel-gfx-ci.01.org/tree/drm-ti=
p/CI_DRM_18943/shard-rkl-5/igt@kms_psr@fbc-psr-suspend.html">SKIP</a>, <a h=
ref=3D"https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18943/shard-rkl-2/ig=
t@kms_psr@fbc-psr-suspend.html">SKIP</a>) (<a href=3D"https://gitlab.freede=
sktop.org/drm/i915/kernel/-/issues/1072">i915#1072</a> / <a href=3D"https:/=
/gitlab.freedesktop.org/drm/i915/kernel/-/issues/9732">i915#9732</a>) -&gt;=
 <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_171551v1/sha=
rd-rkl-6/igt@kms_psr@fbc-psr-suspend.html">SKIP</a> (<a href=3D"https://git=
lab.freedesktop.org/drm/i915/kernel/-/issues/1072">i915#1072</a> / <a href=
=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#145=
44</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues=
/9732">i915#9732</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr@pr-cursor-mmap-cpu:</p>
<ul>
<li>shard-rkl:          (<a href=3D"https://intel-gfx-ci.01.org/tree/drm-ti=
p/CI_DRM_18943/shard-rkl-6/igt@kms_psr@pr-cursor-mmap-cpu.html">SKIP</a>, <=
a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18943/shard-rkl-3=
/igt@kms_psr@pr-cursor-mmap-cpu.html">SKIP</a>) (<a href=3D"https://gitlab.=
freedesktop.org/drm/i915/kernel/-/issues/1072">i915#1072</a> / <a href=3D"h=
ttps://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a=
> / <a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9732=
">i915#9732</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/=
Patchwork_171551v1/shard-rkl-2/igt@kms_psr@pr-cursor-mmap-cpu.html">SKIP</a=
> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/1072"=
>i915#1072</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/=
-/issues/9732">i915#9732</a>) +12 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr_stress_test@flip-primary-invalidate-overlay:</p>
<ul>
<li>shard-rkl:          (<a href=3D"https://intel-gfx-ci.01.org/tree/drm-ti=
p/CI_DRM_18943/shard-rkl-3/igt@kms_psr_stress_test@flip-primary-invalidate-=
overlay.html">SKIP</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_18943/shard-rkl-6/igt@kms_psr_stress_test@flip-primary-invalidate-o=
verlay.html">SKIP</a>) (<a href=3D"https://gitlab.freedesktop.org/drm/i915/=
kernel/-/issues/14544">i915#14544</a> / <a href=3D"https://gitlab.freedeskt=
op.org/drm/i915/kernel/-/issues/15949">i915#15949</a>) -&gt; <a href=3D"htt=
ps://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_171551v1/shard-rkl-5/igt@km=
s_psr_stress_test@flip-primary-invalidate-overlay.html">SKIP</a> (<a href=
=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15949">i915#159=
49</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_rotation_crc@exhaust-fences:</p>
<ul>
<li>shard-dg2:          (<a href=3D"https://intel-gfx-ci.01.org/tree/drm-ti=
p/CI_DRM_18943/shard-dg2-10/igt@kms_rotation_crc@exhaust-fences.html">SKIP<=
/a>, <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18943/shard=
-dg2-8/igt@kms_rotation_crc@exhaust-fences.html">SKIP</a>) (<a href=3D"http=
s://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16707">i915#16707</a> /=
 <a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4235">i=
915#4235</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/Pat=
chwork_171551v1/shard-dg2-10/igt@kms_rotation_crc@exhaust-fences.html">SKIP=
</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16=
707">i915#16707</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_rotation_crc@primary-rotation-90:</p>
<ul>
<li>shard-dg2:          (<a href=3D"https://intel-gfx-ci.01.org/tree/drm-ti=
p/CI_DRM_18943/shard-dg2-10/igt@kms_rotation_crc@primary-rotation-90.html">=
SKIP</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18943/=
shard-dg2-4/igt@kms_rotation_crc@primary-rotation-90.html">SKIP</a>) (<a hr=
ef=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12755">i915#1=
2755</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issu=
es/15867">i915#15867</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i9=
15/kernel/-/issues/16707">i915#16707</a>) -&gt; <a href=3D"https://intel-gf=
x-ci.01.org/tree/drm-tip/Patchwork_171551v1/shard-dg2-10/igt@kms_rotation_c=
rc@primary-rotation-90.html">SKIP</a> (<a href=3D"https://gitlab.freedeskto=
p.org/drm/i915/kernel/-/issues/16707">i915#16707</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_rotation_crc@primary-y-tiled-reflect-x-90:</p>
<ul>
<li>shard-dg2:          (<a href=3D"https://intel-gfx-ci.01.org/tree/drm-ti=
p/CI_DRM_18943/shard-dg2-10/igt@kms_rotation_crc@primary-y-tiled-reflect-x-=
90.html">SKIP</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/CI_D=
RM_18943/shard-dg2-3/igt@kms_rotation_crc@primary-y-tiled-reflect-x-90.html=
">SKIP</a>) (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/is=
sues/12755">i915#12755</a> / <a href=3D"https://gitlab.freedesktop.org/drm/=
i915/kernel/-/issues/15867">i915#15867</a> / <a href=3D"https://gitlab.free=
desktop.org/drm/i915/kernel/-/issues/16707">i915#16707</a> / <a href=3D"htt=
ps://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5190">i915#5190</a>) -=
&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_171551v1=
/shard-dg2-7/igt@kms_rotation_crc@primary-y-tiled-reflect-x-90.html">SKIP</=
a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/1275=
5">i915#12755</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i915/kern=
el/-/issues/15867">i915#15867</a> / <a href=3D"https://gitlab.freedesktop.o=
rg/drm/i915/kernel/-/issues/5190">i915#5190</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_rotation_crc@sprite-rotation-270:</p>
<ul>
<li>shard-dg2:          (<a href=3D"https://intel-gfx-ci.01.org/tree/drm-ti=
p/CI_DRM_18943/shard-dg2-1/igt@kms_rotation_crc@sprite-rotation-270.html">S=
KIP</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18943/s=
hard-dg2-10/igt@kms_rotation_crc@sprite-rotation-270.html">SKIP</a>) (<a hr=
ef=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12755">i915#1=
2755</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issu=
es/15867">i915#15867</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i9=
15/kernel/-/issues/16707">i915#16707</a>) -&gt; <a href=3D"https://intel-gf=
x-ci.01.org/tree/drm-tip/Patchwork_171551v1/shard-dg2-3/igt@kms_rotation_cr=
c@sprite-rotation-270.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop=
.org/drm/i915/kernel/-/issues/12755">i915#12755</a> / <a href=3D"https://gi=
tlab.freedesktop.org/drm/i915/kernel/-/issues/15867">i915#15867</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_rotation_crc@sprite-rotation-90:</p>
<ul>
<li>shard-dg2:          (<a href=3D"https://intel-gfx-ci.01.org/tree/drm-ti=
p/CI_DRM_18943/shard-dg2-1/igt@kms_rotation_crc@sprite-rotation-90.html">SK=
IP</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18943/sh=
ard-dg2-6/igt@kms_rotation_crc@sprite-rotation-90.html">SKIP</a>) (<a href=
=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12755">i915#127=
55</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues=
/15867">i915#15867</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/d=
rm-tip/Patchwork_171551v1/shard-dg2-10/igt@kms_rotation_crc@sprite-rotation=
-90.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kern=
el/-/issues/16707">i915#16707</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_scaling_modes@scaling-mode-none:</p>
<ul>
<li>shard-dg2:          (<a href=3D"https://intel-gfx-ci.01.org/tree/drm-ti=
p/CI_DRM_18943/shard-dg2-6/igt@kms_scaling_modes@scaling-mode-none.html">SK=
IP</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18943/sh=
ard-dg2-1/igt@kms_scaling_modes@scaling-mode-none.html">SKIP</a>) (<a href=
=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3555">i915#3555=
</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_1=
71551v1/shard-dg2-10/igt@kms_scaling_modes@scaling-mode-none.html">SKIP</a>=
 (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16707"=
>i915#16707</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_tiled_display@basic-test-pattern:</p>
<ul>
<li>shard-dg2:          (<a href=3D"https://intel-gfx-ci.01.org/tree/drm-ti=
p/CI_DRM_18943/shard-dg2-3/igt@kms_tiled_display@basic-test-pattern.html">S=
KIP</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18943/s=
hard-dg2-10/igt@kms_tiled_display@basic-test-pattern.html">SKIP</a>) (<a hr=
ef=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16707">i915#1=
6707</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issu=
es/8623">i915#8623</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/d=
rm-tip/Patchwork_171551v1/shard-dg2-7/igt@kms_tiled_display@basic-test-patt=
ern.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kern=
el/-/issues/8623">i915#8623</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_vrr@flip-basic-fastset:</p>
<ul>
<li>shard-dg2:          (<a href=3D"https://intel-gfx-ci.01.org/tree/drm-ti=
p/CI_DRM_18943/shard-dg2-10/igt@kms_vrr@flip-basic-fastset.html">SKIP</a>, =
<a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18943/shard-dg2-=
7/igt@kms_vrr@flip-basic-fastset.html">SKIP</a>) (<a href=3D"https://gitlab=
.freedesktop.org/drm/i915/kernel/-/issues/16707">i915#16707</a> / <a href=
=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9906">i915#9906=
</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_1=
71551v1/shard-dg2-7/igt@kms_vrr@flip-basic-fastset.html">SKIP</a> (<a href=
=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9906">i915#9906=
</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_vrr@flip-dpms:</p>
<ul>
<li>shard-dg2:          (<a href=3D"https://intel-gfx-ci.01.org/tree/drm-ti=
p/CI_DRM_18943/shard-dg2-10/igt@kms_vrr@flip-dpms.html">SKIP</a>, <a href=
=3D"https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18943/shard-dg2-3/igt@k=
ms_vrr@flip-dpms.html">SKIP</a>) (<a href=3D"https://gitlab.freedesktop.org=
/drm/i915/kernel/-/issues/15243">i915#15243</a> / <a href=3D"https://gitlab=
.freedesktop.org/drm/i915/kernel/-/issues/16707">i915#16707</a> / <a href=
=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3555">i915#3555=
</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_1=
71551v1/shard-dg2-7/igt@kms_vrr@flip-dpms.html">SKIP</a> (<a href=3D"https:=
//gitlab.freedesktop.org/drm/i915/kernel/-/issues/15243">i915#15243</a> / <=
a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3555">i91=
5#3555</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_vrr@max-min:</p>
<ul>
<li>shard-dg2:          (<a href=3D"https://intel-gfx-ci.01.org/tree/drm-ti=
p/CI_DRM_18943/shard-dg2-10/igt@kms_vrr@max-min.html">SKIP</a>, <a href=3D"=
https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18943/shard-dg2-4/igt@kms_v=
rr@max-min.html">SKIP</a>) (<a href=3D"https://gitlab.freedesktop.org/drm/i=
915/kernel/-/issues/16707">i915#16707</a> / <a href=3D"https://gitlab.freed=
esktop.org/drm/i915/kernel/-/issues/9906">i915#9906</a>) -&gt; <a href=3D"h=
ttps://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_171551v1/shard-dg2-10/igt=
@kms_vrr@max-min.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/=
drm/i915/kernel/-/issues/16707">i915#16707</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_vrr@seamless-rr-switch-vrr:</p>
<ul>
<li>shard-rkl:          (<a href=3D"https://intel-gfx-ci.01.org/tree/drm-ti=
p/CI_DRM_18943/shard-rkl-6/igt@kms_vrr@seamless-rr-switch-vrr.html">SKIP</a=
>, <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18943/shard-r=
kl-3/igt@kms_vrr@seamless-rr-switch-vrr.html">SKIP</a>) (<a href=3D"https:/=
/gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a> / <a=
 href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9906">i915=
#9906</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/Patchw=
ork_171551v1/shard-rkl-3/igt@kms_vrr@seamless-rr-switch-vrr.html">SKIP</a> =
(<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9906">i=
915#9906</a>)</li>
</ul>
</li>
<li>
<p>igt@perf@per-context-mode-unprivileged:</p>
<ul>
<li>shard-rkl:          (<a href=3D"https://intel-gfx-ci.01.org/tree/drm-ti=
p/CI_DRM_18943/shard-rkl-3/igt@perf@per-context-mode-unprivileged.html">SKI=
P</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18943/sha=
rd-rkl-6/igt@perf@per-context-mode-unprivileged.html">SKIP</a>) (<a href=3D=
"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14544<=
/a> / <a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/24=
35">i915#2435</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-ti=
p/Patchwork_171551v1/shard-rkl-5/igt@perf@per-context-mode-unprivileged.htm=
l">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/is=
sues/2435">i915#2435</a>)</li>
</ul>
</li>
<li>
<p>igt@perf_pmu@busy-double-start@rcs0:</p>
<ul>
<li>shard-mtlp:         (<a href=3D"https://intel-gfx-ci.01.org/tree/drm-ti=
p/CI_DRM_18943/shard-mtlp-5/igt@perf_pmu@busy-double-start@rcs0.html">FAIL<=
/a>, <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18943/shard=
-mtlp-2/igt@perf_pmu@busy-double-start@rcs0.html">PASS</a>) (<a href=3D"htt=
ps://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4349">i915#4349</a>) -=
&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_171551v1=
/shard-mtlp-7/igt@perf_pmu@busy-double-start@rcs0.html">FAIL</a> (<a href=
=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4349">i915#4349=
</a>)</li>
</ul>
</li>
<li>
<p>igt@prime_vgem@basic-fence-flip:</p>
<ul>
<li>shard-dg2:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_18943/shard-dg2-8/igt@prime_vgem@basic-fence-flip.html">SKIP</a> (<=
a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3708">i91=
5#3708</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/Patch=
work_171551v1/shard-dg2-10/igt@prime_vgem@basic-fence-flip.html">SKIP</a> (=
<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16707">i=
915#16707</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-=
/issues/3708">i915#3708</a>)</li>
</ul>
</li>
<li>
<p>igt@prime_vgem@basic-read:</p>
<ul>
<li>shard-rkl:          (<a href=3D"https://intel-gfx-ci.01.org/tree/drm-ti=
p/CI_DRM_18943/shard-rkl-3/igt@prime_vgem@basic-read.html">SKIP</a>, <a hre=
f=3D"https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18943/shard-rkl-6/igt@=
prime_vgem@basic-read.html">SKIP</a>) (<a href=3D"https://gitlab.freedeskto=
p.org/drm/i915/kernel/-/issues/14544">i915#14544</a> / <a href=3D"https://g=
itlab.freedesktop.org/drm/i915/kernel/-/issues/3291">i915#3291</a> / <a hre=
f=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3708">i915#370=
8</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_=
171551v1/shard-rkl-5/igt@prime_vgem@basic-read.html">SKIP</a> (<a href=3D"h=
ttps://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3291">i915#3291</a> =
/ <a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3708">=
i915#3708</a>)</li>
</ul>
</li>
<li>
<p>igt@sriov_basic@bind-unbind-vf:</p>
<ul>
<li>shard-rkl:          (<a href=3D"https://intel-gfx-ci.01.org/tree/drm-ti=
p/CI_DRM_18943/shard-rkl-6/igt@sriov_basic@bind-unbind-vf.html">SKIP</a>, <=
a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18943/shard-rkl-3=
/igt@sriov_basic@bind-unbind-vf.html">SKIP</a>) (<a href=3D"https://gitlab.=
freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a> / <a href=3D=
"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9917">i915#9917</a=
>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_1715=
51v1/shard-rkl-5/igt@sriov_basic@bind-unbind-vf.html">SKIP</a> (<a href=3D"=
https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9917">i915#9917</a>=
)</li>
</ul>
</li>
</ul>
<h2>Build changes</h2>
<ul>
<li>Linux: CI_DRM_18943 -&gt; Patchwork_171551v1</li>
</ul>
<p>CI-20190529: 20190529<br />
  CI_DRM_18943: 0377b35cbeef071dfeed06ccadc0d7607eccaa64 @ git://anongit.fr=
eedesktop.org/gfx-ci/linux<br />
  IGT_9036: 9036<br />
  Patchwork_171551v1: 0377b35cbeef071dfeed06ccadc0d7607eccaa64 @ git://anon=
git.freedesktop.org/gfx-ci/linux<br />
  piglit_4509: fdc5a4ca11124ab8413c7988896eec4c97336694 @ git://anongit.fre=
edesktop.org/piglit</p>

</body>
</html>

--===============5057692811932235384==--
