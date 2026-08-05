Return-Path: <intel-gfx-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 622B2C55174
	for <intel-gfx@archiver.kernel.org>; Wed,  5 Aug 2026 06:33:30 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A763810E1DF;
	Wed,  5 Aug 2026 06:33:29 +0000 (UTC)
Received: from 61270ab9df2a (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 063A610E182;
 Wed,  5 Aug 2026 06:33:28 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============9202677912254395861=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=97_i915=2ECI=2EFull=3A_failure_for_drm/dp=3A_Add_EDP=5F20_r?=
 =?utf-8?q?ev_definition?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Suraj Kandpal" <suraj.kandpal@intel.com>
Cc: intel-gfx@lists.freedesktop.org
Date: Wed, 05 Aug 2026 06:33:27 -0000
Message-ID: <178591160799.20501.10322669723424183287@61270ab9df2a>
X-Patchwork-Hint: ignore
References: <20260804054806.1110078-1-suraj.kandpal@intel.com>
In-Reply-To: <20260804054806.1110078-1-suraj.kandpal@intel.com>
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

--===============9202677912254395861==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: drm/dp: Add EDP_20 rev definition
URL   : https://patchwork.freedesktop.org/series/171547/
State : failure

== Summary ==

CI Bug Log - changes from CI_DRM_18943_full -> Patchwork_171547v1_full
====================================================

Summary
-------

  **FAILURE**

  Serious unknown changes coming with Patchwork_171547v1_full absolutely need to be
  verified manually.
  
  If you think the reported changes have nothing to do with the changes
  introduced in Patchwork_171547v1_full, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them
  to document this new failure mode, which will reduce false positives in CI.

  

Participating hosts (10 -> 10)
------------------------------

  No changes in participating hosts

Possible new issues
-------------------

  Here are the unknown changes that may have been introduced in Patchwork_171547v1_full:

### IGT changes ###

#### Possible regressions ####

  * igt@kms_psr2_sf@psr2-overlay-plane-move-continuous-sf@pipe-b-edp-1:
    - shard-mtlp:         ([PASS][1], [PASS][2]) -> [FAIL][3] +4 other tests fail
   [1]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18943/shard-mtlp-4/igt@kms_psr2_sf@psr2-overlay-plane-move-continuous-sf@pipe-b-edp-1.html
   [2]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18943/shard-mtlp-8/igt@kms_psr2_sf@psr2-overlay-plane-move-continuous-sf@pipe-b-edp-1.html
   [3]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_171547v1/shard-mtlp-5/igt@kms_psr2_sf@psr2-overlay-plane-move-continuous-sf@pipe-b-edp-1.html

  
Known issues
------------

  Here are the changes found in Patchwork_171547v1_full that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@fbdev@nullptr:
    - shard-dg2:          [PASS][4] -> [SKIP][5] ([i915#2582])
   [4]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18943/shard-dg2-8/igt@fbdev@nullptr.html
   [5]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_171547v1/shard-dg2-10/igt@fbdev@nullptr.html

  * igt@gem_bad_reloc@negative-reloc-lut:
    - shard-rkl:          NOTRUN -> [SKIP][6] ([i915#3281]) +4 other tests skip
   [6]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_171547v1/shard-rkl-8/igt@gem_bad_reloc@negative-reloc-lut.html

  * igt@gem_basic@multigpu-create-close:
    - shard-tglu-1:       NOTRUN -> [SKIP][7] ([i915#7697])
   [7]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_171547v1/shard-tglu-1/igt@gem_basic@multigpu-create-close.html

  * igt@gem_ctx_isolation@preservation-s3:
    - shard-glk10:        NOTRUN -> [INCOMPLETE][8] ([i915#13356] / [i915#16466]) +1 other test incomplete
   [8]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_171547v1/shard-glk10/igt@gem_ctx_isolation@preservation-s3.html

  * igt@gem_ctx_sseu@engines:
    - shard-tglu-1:       NOTRUN -> [SKIP][9] ([i915#280])
   [9]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_171547v1/shard-tglu-1/igt@gem_ctx_sseu@engines.html

  * igt@gem_eio@in-flight-suspend:
    - shard-dg1:          ([PASS][10], [PASS][11]) -> [DMESG-WARN][12] ([i915#13390] / [i915#4391] / [i915#4423])
   [10]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18943/shard-dg1-19/igt@gem_eio@in-flight-suspend.html
   [11]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18943/shard-dg1-13/igt@gem_eio@in-flight-suspend.html
   [12]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_171547v1/shard-dg1-12/igt@gem_eio@in-flight-suspend.html

  * igt@gem_exec_balancer@parallel-keep-submit-fence:
    - shard-tglu-1:       NOTRUN -> [SKIP][13] ([i915#4525])
   [13]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_171547v1/shard-tglu-1/igt@gem_exec_balancer@parallel-keep-submit-fence.html

  * igt@gem_lmem_swapping@massive-random:
    - shard-tglu-1:       NOTRUN -> [SKIP][14] ([i915#4613])
   [14]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_171547v1/shard-tglu-1/igt@gem_lmem_swapping@massive-random.html

  * igt@gem_lmem_swapping@parallel-multi:
    - shard-glk:          NOTRUN -> [SKIP][15] ([i915#4613])
   [15]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_171547v1/shard-glk8/igt@gem_lmem_swapping@parallel-multi.html

  * igt@gem_pread@display:
    - shard-rkl:          NOTRUN -> [SKIP][16] ([i915#3282]) +1 other test skip
   [16]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_171547v1/shard-rkl-8/igt@gem_pread@display.html

  * igt@gem_pread@exhaustion:
    - shard-glk11:        NOTRUN -> [WARN][17] ([i915#2658])
   [17]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_171547v1/shard-glk11/igt@gem_pread@exhaustion.html

  * igt@gem_workarounds@suspend-resume-fd:
    - shard-glk11:        NOTRUN -> [INCOMPLETE][18] ([i915#13356] / [i915#14586])
   [18]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_171547v1/shard-glk11/igt@gem_workarounds@suspend-resume-fd.html

  * igt@gen9_exec_parse@bb-start-far:
    - shard-tglu-1:       NOTRUN -> [SKIP][19] ([i915#2527] / [i915#2856])
   [19]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_171547v1/shard-tglu-1/igt@gen9_exec_parse@bb-start-far.html

  * igt@i915_module_load@fault-injection@intel_connector_register:
    - shard-glk10:        NOTRUN -> [ABORT][20] ([i915#15342]) +1 other test abort
   [20]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_171547v1/shard-glk10/igt@i915_module_load@fault-injection@intel_connector_register.html

  * igt@i915_module_load@fault-injection@intel_gt_init-enodev:
    - shard-glk10:        NOTRUN -> [SKIP][21] +215 other tests skip
   [21]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_171547v1/shard-glk10/igt@i915_module_load@fault-injection@intel_gt_init-enodev.html

  * igt@i915_pm_freq_api@freq-suspend@gt0:
    - shard-dg2:          ([PASS][22], [PASS][23]) -> [INCOMPLETE][24] ([i915#13356] / [i915#13820]) +1 other test incomplete
   [22]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18943/shard-dg2-7/igt@i915_pm_freq_api@freq-suspend@gt0.html
   [23]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18943/shard-dg2-8/igt@i915_pm_freq_api@freq-suspend@gt0.html
   [24]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_171547v1/shard-dg2-3/igt@i915_pm_freq_api@freq-suspend@gt0.html

  * igt@i915_pm_freq_mult@media-freq@gt0:
    - shard-tglu-1:       NOTRUN -> [SKIP][25] ([i915#6590]) +1 other test skip
   [25]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_171547v1/shard-tglu-1/igt@i915_pm_freq_mult@media-freq@gt0.html

  * igt@i915_pm_rpm@gem-execbuf-stress-pc8:
    - shard-glk:          NOTRUN -> [SKIP][26] +76 other tests skip
   [26]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_171547v1/shard-glk8/igt@i915_pm_rpm@gem-execbuf-stress-pc8.html

  * igt@i915_pm_rpm@system-suspend:
    - shard-rkl:          ([PASS][27], [PASS][28]) -> [INCOMPLETE][29] ([i915#13356])
   [27]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18943/shard-rkl-7/igt@i915_pm_rpm@system-suspend.html
   [28]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18943/shard-rkl-8/igt@i915_pm_rpm@system-suspend.html
   [29]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_171547v1/shard-rkl-6/igt@i915_pm_rpm@system-suspend.html

  * igt@i915_suspend@sysfs-reader:
    - shard-glk:          [PASS][30] -> [INCOMPLETE][31] ([i915#16182] / [i915#4817])
   [30]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18943/shard-glk1/igt@i915_suspend@sysfs-reader.html
   [31]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_171547v1/shard-glk6/igt@i915_suspend@sysfs-reader.html

  * igt@kms_atomic@plane-primary-legacy:
    - shard-dg2:          [PASS][32] -> [SKIP][33] ([i915#16707]) +9 other tests skip
   [32]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18943/shard-dg2-8/igt@kms_atomic@plane-primary-legacy.html
   [33]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_171547v1/shard-dg2-10/igt@kms_atomic@plane-primary-legacy.html

  * igt@kms_big_fb@4-tiled-addfb:
    - shard-rkl:          NOTRUN -> [SKIP][34] ([i915#5286]) +1 other test skip
   [34]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_171547v1/shard-rkl-8/igt@kms_big_fb@4-tiled-addfb.html

  * igt@kms_big_fb@4-tiled-max-hw-stride-32bpp-rotate-180-hflip-async-flip:
    - shard-tglu-1:       NOTRUN -> [SKIP][35] ([i915#5286]) +2 other tests skip
   [35]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_171547v1/shard-tglu-1/igt@kms_big_fb@4-tiled-max-hw-stride-32bpp-rotate-180-hflip-async-flip.html

  * igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-0-hflip:
    - shard-dg2:          ([PASS][36], [PASS][37]) -> [SKIP][38] ([i915#16707]) +23 other tests skip
   [36]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18943/shard-dg2-6/igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-0-hflip.html
   [37]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18943/shard-dg2-1/igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-0-hflip.html
   [38]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_171547v1/shard-dg2-10/igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-0-hflip.html

  * igt@kms_big_fb@linear-max-hw-stride-32bpp-rotate-0-hflip:
    - shard-tglu-1:       NOTRUN -> [SKIP][39] ([i915#3828])
   [39]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_171547v1/shard-tglu-1/igt@kms_big_fb@linear-max-hw-stride-32bpp-rotate-0-hflip.html

  * igt@kms_ccs@bad-aux-stride-y-tiled-gen12-mc-ccs@pipe-c-hdmi-a-2:
    - shard-glk11:        NOTRUN -> [SKIP][40] +156 other tests skip
   [40]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_171547v1/shard-glk11/igt@kms_ccs@bad-aux-stride-y-tiled-gen12-mc-ccs@pipe-c-hdmi-a-2.html

  * igt@kms_ccs@bad-aux-stride-y-tiled-gen12-rc-ccs-cc@pipe-d-hdmi-a-1:
    - shard-dg2:          NOTRUN -> [SKIP][41] ([i915#10307] / [i915#10434] / [i915#6095])
   [41]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_171547v1/shard-dg2-4/igt@kms_ccs@bad-aux-stride-y-tiled-gen12-rc-ccs-cc@pipe-d-hdmi-a-1.html

  * igt@kms_ccs@bad-rotation-90-4-tiled-mtl-rc-ccs@pipe-b-hdmi-a-2:
    - shard-rkl:          NOTRUN -> [SKIP][42] ([i915#6095]) +43 other tests skip
   [42]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_171547v1/shard-rkl-7/igt@kms_ccs@bad-rotation-90-4-tiled-mtl-rc-ccs@pipe-b-hdmi-a-2.html

  * igt@kms_ccs@crc-primary-basic-4-tiled-mtl-mc-ccs@pipe-d-hdmi-a-1:
    - shard-dg2:          NOTRUN -> [SKIP][43] ([i915#10307] / [i915#6095]) +34 other tests skip
   [43]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_171547v1/shard-dg2-4/igt@kms_ccs@crc-primary-basic-4-tiled-mtl-mc-ccs@pipe-d-hdmi-a-1.html

  * igt@kms_ccs@crc-primary-suspend-4-tiled-dg2-mc-ccs:
    - shard-tglu-1:       NOTRUN -> [SKIP][44] ([i915#6095]) +44 other tests skip
   [44]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_171547v1/shard-tglu-1/igt@kms_ccs@crc-primary-suspend-4-tiled-dg2-mc-ccs.html

  * igt@kms_ccs@crc-primary-suspend-4-tiled-lnl-ccs:
    - shard-tglu-1:       NOTRUN -> [SKIP][45] ([i915#12805])
   [45]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_171547v1/shard-tglu-1/igt@kms_ccs@crc-primary-suspend-4-tiled-lnl-ccs.html

  * igt@kms_ccs@crc-primary-suspend-4-tiled-mtl-rc-ccs-cc@pipe-c-hdmi-a-1:
    - shard-dg1:          NOTRUN -> [SKIP][46] ([i915#6095]) +51 other tests skip
   [46]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_171547v1/shard-dg1-15/igt@kms_ccs@crc-primary-suspend-4-tiled-mtl-rc-ccs-cc@pipe-c-hdmi-a-1.html

  * igt@kms_ccs@crc-primary-suspend-yf-tiled-ccs:
    - shard-rkl:          NOTRUN -> [SKIP][47] ([i915#14098] / [i915#6095]) +24 other tests skip
   [47]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_171547v1/shard-rkl-8/igt@kms_ccs@crc-primary-suspend-yf-tiled-ccs.html

  * igt@kms_cdclk@plane-scaling@pipe-d-hdmi-a-1:
    - shard-dg2:          NOTRUN -> [SKIP][48] ([i915#13783]) +3 other tests skip
   [48]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_171547v1/shard-dg2-4/igt@kms_cdclk@plane-scaling@pipe-d-hdmi-a-1.html

  * igt@kms_chamelium_hpd@dp-hpd-fast:
    - shard-tglu-1:       NOTRUN -> [SKIP][49] ([i915#11151] / [i915#7828]) +3 other tests skip
   [49]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_171547v1/shard-tglu-1/igt@kms_chamelium_hpd@dp-hpd-fast.html

  * igt@kms_chamelium_hpd@hdmi-hpd-enable-disable-mode:
    - shard-rkl:          NOTRUN -> [SKIP][50] ([i915#11151] / [i915#7828]) +1 other test skip
   [50]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_171547v1/shard-rkl-8/igt@kms_chamelium_hpd@hdmi-hpd-enable-disable-mode.html

  * igt@kms_color@ctm-0-25:
    - shard-dg2:          [PASS][51] -> [SKIP][52] ([i915#12655])
   [51]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18943/shard-dg2-8/igt@kms_color@ctm-0-25.html
   [52]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_171547v1/shard-dg2-10/igt@kms_color@ctm-0-25.html

  * igt@kms_color@ctm-0-50:
    - shard-dg2:          ([PASS][53], [PASS][54]) -> [SKIP][55] ([i915#12655]) +1 other test skip
   [53]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18943/shard-dg2-6/igt@kms_color@ctm-0-50.html
   [54]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18943/shard-dg2-5/igt@kms_color@ctm-0-50.html
   [55]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_171547v1/shard-dg2-10/igt@kms_color@ctm-0-50.html

  * igt@kms_color@deep-color:
    - shard-tglu-1:       NOTRUN -> [SKIP][56] ([i915#3555] / [i915#9979])
   [56]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_171547v1/shard-tglu-1/igt@kms_color@deep-color.html

  * igt@kms_content_protection@dp-mst-lic-type-0:
    - shard-rkl:          NOTRUN -> [SKIP][57] ([i915#15330] / [i915#3116])
   [57]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_171547v1/shard-rkl-8/igt@kms_content_protection@dp-mst-lic-type-0.html

  * igt@kms_content_protection@dp-mst-lic-type-0-hdcp14:
    - shard-tglu-1:       NOTRUN -> [SKIP][58] ([i915#15330])
   [58]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_171547v1/shard-tglu-1/igt@kms_content_protection@dp-mst-lic-type-0-hdcp14.html

  * igt@kms_content_protection@uevent:
    - shard-tglu-1:       NOTRUN -> [SKIP][59] ([i915#15865])
   [59]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_171547v1/shard-tglu-1/igt@kms_content_protection@uevent.html

  * igt@kms_cursor_crc@cursor-offscreen-32x10:
    - shard-rkl:          NOTRUN -> [SKIP][60] ([i915#3555]) +1 other test skip
   [60]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_171547v1/shard-rkl-8/igt@kms_cursor_crc@cursor-offscreen-32x10.html

  * igt@kms_cursor_crc@cursor-onscreen-128x42@pipe-a-hdmi-a-1:
    - shard-rkl:          NOTRUN -> [FAIL][61] ([i915#13566])
   [61]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_171547v1/shard-rkl-5/igt@kms_cursor_crc@cursor-onscreen-128x42@pipe-a-hdmi-a-1.html

  * igt@kms_cursor_crc@cursor-onscreen-64x21@pipe-a-hdmi-a-1:
    - shard-tglu-1:       NOTRUN -> [FAIL][62] ([i915#13566]) +1 other test fail
   [62]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_171547v1/shard-tglu-1/igt@kms_cursor_crc@cursor-onscreen-64x21@pipe-a-hdmi-a-1.html

  * igt@kms_cursor_crc@cursor-random-256x85@pipe-a-hdmi-a-1:
    - shard-tglu:         [PASS][63] -> [FAIL][64] ([i915#13566]) +1 other test fail
   [63]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18943/shard-tglu-4/igt@kms_cursor_crc@cursor-random-256x85@pipe-a-hdmi-a-1.html
   [64]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_171547v1/shard-tglu-10/igt@kms_cursor_crc@cursor-random-256x85@pipe-a-hdmi-a-1.html

  * igt@kms_cursor_crc@cursor-rapid-movement-512x512:
    - shard-tglu-1:       NOTRUN -> [SKIP][65] ([i915#13049])
   [65]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_171547v1/shard-tglu-1/igt@kms_cursor_crc@cursor-rapid-movement-512x512.html

  * igt@kms_cursor_legacy@cursora-vs-flipa-atomic:
    - shard-dg1:          ([PASS][66], [PASS][67]) -> [DMESG-WARN][68] ([i915#4423]) +3 other tests dmesg-warn
   [66]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18943/shard-dg1-17/igt@kms_cursor_legacy@cursora-vs-flipa-atomic.html
   [67]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18943/shard-dg1-15/igt@kms_cursor_legacy@cursora-vs-flipa-atomic.html
   [68]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_171547v1/shard-dg1-14/igt@kms_cursor_legacy@cursora-vs-flipa-atomic.html

  * igt@kms_cursor_legacy@short-busy-flip-before-cursor-atomic-transitions-varying-size:
    - shard-tglu-1:       NOTRUN -> [SKIP][69] ([i915#4103])
   [69]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_171547v1/shard-tglu-1/igt@kms_cursor_legacy@short-busy-flip-before-cursor-atomic-transitions-varying-size.html

  * igt@kms_dp_link_training@non-uhbr-mst:
    - shard-tglu-1:       NOTRUN -> [SKIP][70] ([i915#13749])
   [70]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_171547v1/shard-tglu-1/igt@kms_dp_link_training@non-uhbr-mst.html

  * igt@kms_dsc@dsc-fractional-bpp:
    - shard-rkl:          NOTRUN -> [SKIP][71] ([i915#16361]) +1 other test skip
   [71]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_171547v1/shard-rkl-8/igt@kms_dsc@dsc-fractional-bpp.html

  * igt@kms_dsc@dsc-with-output-formats:
    - shard-tglu-1:       NOTRUN -> [SKIP][72] ([i915#16361]) +2 other tests skip
   [72]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_171547v1/shard-tglu-1/igt@kms_dsc@dsc-with-output-formats.html

  * igt@kms_fbcon_fbt@fbc-suspend:
    - shard-dg2:          ([PASS][73], [PASS][74]) -> [SKIP][75] ([i915#1849])
   [73]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18943/shard-dg2-5/igt@kms_fbcon_fbt@fbc-suspend.html
   [74]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18943/shard-dg2-6/igt@kms_fbcon_fbt@fbc-suspend.html
   [75]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_171547v1/shard-dg2-10/igt@kms_fbcon_fbt@fbc-suspend.html

  * igt@kms_feature_discovery@dsc:
    - shard-tglu-1:       NOTRUN -> [SKIP][76] ([i915#16600])
   [76]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_171547v1/shard-tglu-1/igt@kms_feature_discovery@dsc.html

  * igt@kms_feature_discovery@psr1:
    - shard-tglu-1:       NOTRUN -> [SKIP][77] ([i915#658])
   [77]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_171547v1/shard-tglu-1/igt@kms_feature_discovery@psr1.html

  * igt@kms_flip@2x-absolute-wf_vblank:
    - shard-tglu-1:       NOTRUN -> [SKIP][78] ([i915#3637] / [i915#9934]) +4 other tests skip
   [78]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_171547v1/shard-tglu-1/igt@kms_flip@2x-absolute-wf_vblank.html

  * igt@kms_flip@absolute-wf_vblank:
    - shard-dg2:          [PASS][79] -> [SKIP][80] ([i915#5354]) +1 other test skip
   [79]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18943/shard-dg2-8/igt@kms_flip@absolute-wf_vblank.html
   [80]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_171547v1/shard-dg2-10/igt@kms_flip@absolute-wf_vblank.html

  * igt@kms_flip@dpms-off-confusion-interruptible:
    - shard-dg2:          ([PASS][81], [PASS][82]) -> [SKIP][83] ([i915#5354]) +6 other tests skip
   [81]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18943/shard-dg2-5/igt@kms_flip@dpms-off-confusion-interruptible.html
   [82]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18943/shard-dg2-6/igt@kms_flip@dpms-off-confusion-interruptible.html
   [83]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_171547v1/shard-dg2-10/igt@kms_flip@dpms-off-confusion-interruptible.html

  * igt@kms_flip@flip-vs-absolute-wf_vblank-interruptible:
    - shard-dg1:          ([PASS][84], [PASS][85]) -> [FAIL][86] ([i915#14600])
   [84]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18943/shard-dg1-19/igt@kms_flip@flip-vs-absolute-wf_vblank-interruptible.html
   [85]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18943/shard-dg1-14/igt@kms_flip@flip-vs-absolute-wf_vblank-interruptible.html
   [86]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_171547v1/shard-dg1-16/igt@kms_flip@flip-vs-absolute-wf_vblank-interruptible.html

  * igt@kms_flip@flip-vs-absolute-wf_vblank-interruptible@c-hdmi-a4:
    - shard-dg1:          [PASS][87] -> [FAIL][88] ([i915#14600])
   [87]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18943/shard-dg1-19/igt@kms_flip@flip-vs-absolute-wf_vblank-interruptible@c-hdmi-a4.html
   [88]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_171547v1/shard-dg1-16/igt@kms_flip@flip-vs-absolute-wf_vblank-interruptible@c-hdmi-a4.html

  * igt@kms_flip@flip-vs-dpms-on-nop:
    - shard-dg2:          ([PASS][89], [PASS][90]) -> [SKIP][91] ([i915#16724])
   [89]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18943/shard-dg2-1/igt@kms_flip@flip-vs-dpms-on-nop.html
   [90]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18943/shard-dg2-6/igt@kms_flip@flip-vs-dpms-on-nop.html
   [91]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_171547v1/shard-dg2-10/igt@kms_flip@flip-vs-dpms-on-nop.html

  * igt@kms_flip@flip-vs-suspend:
    - shard-rkl:          [PASS][92] -> [ABORT][93] ([i915#15132])
   [92]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18943/shard-rkl-5/igt@kms_flip@flip-vs-suspend.html
   [93]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_171547v1/shard-rkl-1/igt@kms_flip@flip-vs-suspend.html

  * igt@kms_flip@flip-vs-suspend@a-hdmi-a2:
    - shard-rkl:          NOTRUN -> [ABORT][94] ([i915#15132])
   [94]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_171547v1/shard-rkl-1/igt@kms_flip@flip-vs-suspend@a-hdmi-a2.html

  * igt@kms_flip_scaled_crc@flip-32bpp-4tile-to-32bpp-4tiledg2rcccs-downscaling:
    - shard-dg2:          ([PASS][95], [PASS][96]) -> [SKIP][97] ([i915#3555] / [i915#8813]) +1 other test skip
   [95]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18943/shard-dg2-6/igt@kms_flip_scaled_crc@flip-32bpp-4tile-to-32bpp-4tiledg2rcccs-downscaling.html
   [96]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18943/shard-dg2-5/igt@kms_flip_scaled_crc@flip-32bpp-4tile-to-32bpp-4tiledg2rcccs-downscaling.html
   [97]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_171547v1/shard-dg2-10/igt@kms_flip_scaled_crc@flip-32bpp-4tile-to-32bpp-4tiledg2rcccs-downscaling.html

  * igt@kms_flip_scaled_crc@flip-32bpp-xtile-to-64bpp-xtile-downscaling:
    - shard-dg2:          [PASS][98] -> [SKIP][99] ([i915#3555] / [i915#8813])
   [98]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18943/shard-dg2-8/igt@kms_flip_scaled_crc@flip-32bpp-xtile-to-64bpp-xtile-downscaling.html
   [99]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_171547v1/shard-dg2-10/igt@kms_flip_scaled_crc@flip-32bpp-xtile-to-64bpp-xtile-downscaling.html

  * igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-16bpp-4tile-downscaling:
    - shard-rkl:          NOTRUN -> [SKIP][100] ([i915#15643])
   [100]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_171547v1/shard-rkl-8/igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-16bpp-4tile-downscaling.html

  * igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-32bpp-4tiledg2rcccs-upscaling:
    - shard-tglu-1:       NOTRUN -> [SKIP][101] ([i915#15643]) +1 other test skip
   [101]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_171547v1/shard-tglu-1/igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-32bpp-4tiledg2rcccs-upscaling.html

  * igt@kms_frontbuffer_tracking@fbc-1p-offscreen-pri-indfb-draw-render:
    - shard-dg2:          ([PASS][102], [PASS][103]) -> [SKIP][104] ([i915#16708])
   [102]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18943/shard-dg2-6/igt@kms_frontbuffer_tracking@fbc-1p-offscreen-pri-indfb-draw-render.html
   [103]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18943/shard-dg2-1/igt@kms_frontbuffer_tracking@fbc-1p-offscreen-pri-indfb-draw-render.html
   [104]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_171547v1/shard-dg2-10/igt@kms_frontbuffer_tracking@fbc-1p-offscreen-pri-indfb-draw-render.html

  * igt@kms_frontbuffer_tracking@fbc-2p-primscrn-pri-shrfb-draw-mmap-cpu:
    - shard-tglu-1:       NOTRUN -> [SKIP][105] +53 other tests skip
   [105]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_171547v1/shard-tglu-1/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-pri-shrfb-draw-mmap-cpu.html

  * igt@kms_frontbuffer_tracking@fbc-rgb565-draw-render:
    - shard-dg2:          ([PASS][106], [PASS][107]) -> [SKIP][108] ([i915#16708] / [i915#5354]) +2 other tests skip
   [106]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18943/shard-dg2-5/igt@kms_frontbuffer_tracking@fbc-rgb565-draw-render.html
   [107]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18943/shard-dg2-6/igt@kms_frontbuffer_tracking@fbc-rgb565-draw-render.html
   [108]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_171547v1/shard-dg2-10/igt@kms_frontbuffer_tracking@fbc-rgb565-draw-render.html

  * igt@kms_frontbuffer_tracking@fbchdr-1p-primscrn-pri-indfb-draw-mmap-gtt:
    - shard-rkl:          NOTRUN -> [SKIP][109] ([i915#15989]) +2 other tests skip
   [109]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_171547v1/shard-rkl-8/igt@kms_frontbuffer_tracking@fbchdr-1p-primscrn-pri-indfb-draw-mmap-gtt.html

  * igt@kms_frontbuffer_tracking@fbchdr-rgb101010-draw-render:
    - shard-tglu-1:       NOTRUN -> [SKIP][110] ([i915#15989]) +9 other tests skip
   [110]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_171547v1/shard-tglu-1/igt@kms_frontbuffer_tracking@fbchdr-rgb101010-draw-render.html

  * igt@kms_frontbuffer_tracking@fbchdr-suspend:
    - shard-glk11:        NOTRUN -> [INCOMPLETE][111] ([i915#16056] / [i915#16593])
   [111]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_171547v1/shard-glk11/igt@kms_frontbuffer_tracking@fbchdr-suspend.html

  * igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-spr-indfb-onoff:
    - shard-rkl:          NOTRUN -> [SKIP][112] ([i915#15102] / [i915#3023]) +3 other tests skip
   [112]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_171547v1/shard-rkl-8/igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-spr-indfb-onoff.html

  * igt@kms_frontbuffer_tracking@fbcpsr-tiling-4:
    - shard-tglu-1:       NOTRUN -> [SKIP][113] ([i915#5439])
   [113]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_171547v1/shard-tglu-1/igt@kms_frontbuffer_tracking@fbcpsr-tiling-4.html

  * igt@kms_frontbuffer_tracking@fbcpsrhdr-1p-offscreen-pri-shrfb-draw-mmap-cpu:
    - shard-tglu-1:       NOTRUN -> [SKIP][114] ([i915#15102]) +21 other tests skip
   [114]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_171547v1/shard-tglu-1/igt@kms_frontbuffer_tracking@fbcpsrhdr-1p-offscreen-pri-shrfb-draw-mmap-cpu.html

  * igt@kms_frontbuffer_tracking@hdr-1p-offscreen-pri-indfb-draw-pwrite:
    - shard-rkl:          ([PASS][115], [PASS][116]) -> [SKIP][117] ([i915#15989]) +3 other tests skip
   [115]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18943/shard-rkl-1/igt@kms_frontbuffer_tracking@hdr-1p-offscreen-pri-indfb-draw-pwrite.html
   [116]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18943/shard-rkl-6/igt@kms_frontbuffer_tracking@hdr-1p-offscreen-pri-indfb-draw-pwrite.html
   [117]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_171547v1/shard-rkl-4/igt@kms_frontbuffer_tracking@hdr-1p-offscreen-pri-indfb-draw-pwrite.html

  * igt@kms_frontbuffer_tracking@hdr-2p-scndscrn-indfb-pgflip-blt:
    - shard-glk:          [PASS][118] -> [SKIP][119] +4 other tests skip
   [118]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18943/shard-glk8/igt@kms_frontbuffer_tracking@hdr-2p-scndscrn-indfb-pgflip-blt.html
   [119]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_171547v1/shard-glk5/igt@kms_frontbuffer_tracking@hdr-2p-scndscrn-indfb-pgflip-blt.html

  * igt@kms_frontbuffer_tracking@pipe-fbc-rte:
    - shard-rkl:          NOTRUN -> [SKIP][120] ([i915#9766])
   [120]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_171547v1/shard-rkl-8/igt@kms_frontbuffer_tracking@pipe-fbc-rte.html

  * igt@kms_frontbuffer_tracking@psrhdr-1p-offscreen-pri-indfb-draw-mmap-cpu:
    - shard-rkl:          NOTRUN -> [SKIP][121] ([i915#15102]) +5 other tests skip
   [121]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_171547v1/shard-rkl-8/igt@kms_frontbuffer_tracking@psrhdr-1p-offscreen-pri-indfb-draw-mmap-cpu.html

  * igt@kms_frontbuffer_tracking@psrhdr-2p-scndscrn-pri-shrfb-draw-blt:
    - shard-rkl:          NOTRUN -> [SKIP][122] +11 other tests skip
   [122]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_171547v1/shard-rkl-8/igt@kms_frontbuffer_tracking@psrhdr-2p-scndscrn-pri-shrfb-draw-blt.html

  * igt@kms_hdr@static-toggle-dpms:
    - shard-rkl:          ([PASS][123], [PASS][124]) -> [SKIP][125] ([i915#16644] / [i915#3555] / [i915#8228])
   [123]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18943/shard-rkl-1/igt@kms_hdr@static-toggle-dpms.html
   [124]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18943/shard-rkl-6/igt@kms_hdr@static-toggle-dpms.html
   [125]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_171547v1/shard-rkl-4/igt@kms_hdr@static-toggle-dpms.html

  * igt@kms_hdr@static-toggle-suspend:
    - shard-rkl:          NOTRUN -> [SKIP][126] ([i915#16644] / [i915#3555] / [i915#8228])
   [126]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_171547v1/shard-rkl-8/igt@kms_hdr@static-toggle-suspend.html

  * igt@kms_invalid_mode@clock-too-high:
    - shard-dg2:          [PASS][127] -> [SKIP][128] ([i915#16746] / [i915#3555])
   [127]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18943/shard-dg2-8/igt@kms_invalid_mode@clock-too-high.html
   [128]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_171547v1/shard-dg2-10/igt@kms_invalid_mode@clock-too-high.html

  * igt@kms_invalid_mode@zero-vdisplay:
    - shard-dg2:          ([PASS][129], [PASS][130]) -> [SKIP][131] ([i915#16746] / [i915#3555])
   [129]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18943/shard-dg2-5/igt@kms_invalid_mode@zero-vdisplay.html
   [130]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18943/shard-dg2-6/igt@kms_invalid_mode@zero-vdisplay.html
   [131]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_171547v1/shard-dg2-10/igt@kms_invalid_mode@zero-vdisplay.html

  * igt@kms_joiner@basic-force-big-joiner:
    - shard-tglu-1:       NOTRUN -> [SKIP][132] ([i915#15459])
   [132]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_171547v1/shard-tglu-1/igt@kms_joiner@basic-force-big-joiner.html

  * igt@kms_joiner@invalid-modeset-big-joiner:
    - shard-tglu-1:       NOTRUN -> [SKIP][133] ([i915#15460])
   [133]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_171547v1/shard-tglu-1/igt@kms_joiner@invalid-modeset-big-joiner.html

  * igt@kms_multipipe_modeset@basic-max-pipe-crc-check:
    - shard-tglu-1:       NOTRUN -> [SKIP][134] ([i915#15815])
   [134]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_171547v1/shard-tglu-1/igt@kms_multipipe_modeset@basic-max-pipe-crc-check.html

  * igt@kms_pipe_crc_basic@nonblocking-crc-frame-sequence:
    - shard-dg2:          ([PASS][135], [PASS][136]) -> [SKIP][137] ([i915#11190] / [i915#16707])
   [135]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18943/shard-dg2-1/igt@kms_pipe_crc_basic@nonblocking-crc-frame-sequence.html
   [136]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18943/shard-dg2-6/igt@kms_pipe_crc_basic@nonblocking-crc-frame-sequence.html
   [137]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_171547v1/shard-dg2-10/igt@kms_pipe_crc_basic@nonblocking-crc-frame-sequence.html

  * igt@kms_pipe_crc_basic@suspend-read-crc:
    - shard-snb:          [PASS][138] -> [DMESG-WARN][139] ([i915#16358]) +1 other test dmesg-warn
   [138]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18943/shard-snb5/igt@kms_pipe_crc_basic@suspend-read-crc.html
   [139]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_171547v1/shard-snb4/igt@kms_pipe_crc_basic@suspend-read-crc.html

  * igt@kms_plane@pixel-format-4-tiled-dg2-rc-ccs-modifier:
    - shard-tglu-1:       NOTRUN -> [SKIP][140] ([i915#15709]) +1 other test skip
   [140]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_171547v1/shard-tglu-1/igt@kms_plane@pixel-format-4-tiled-dg2-rc-ccs-modifier.html

  * igt@kms_plane@pixel-format-4-tiled-lnl-ccs-modifier-source-clamping:
    - shard-rkl:          NOTRUN -> [SKIP][141] ([i915#15709])
   [141]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_171547v1/shard-rkl-8/igt@kms_plane@pixel-format-4-tiled-lnl-ccs-modifier-source-clamping.html

  * igt@kms_plane@pixel-format-4-tiled-modifier:
    - shard-dg2:          ([PASS][142], [PASS][143]) -> [SKIP][144] ([i915#8825])
   [142]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18943/shard-dg2-5/igt@kms_plane@pixel-format-4-tiled-modifier.html
   [143]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18943/shard-dg2-6/igt@kms_plane@pixel-format-4-tiled-modifier.html
   [144]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_171547v1/shard-dg2-10/igt@kms_plane@pixel-format-4-tiled-modifier.html

  * igt@kms_plane_alpha_blend@alpha-transparent-fb:
    - shard-glk10:        NOTRUN -> [FAIL][145] ([i915#10647] / [i915#12177])
   [145]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_171547v1/shard-glk10/igt@kms_plane_alpha_blend@alpha-transparent-fb.html

  * igt@kms_plane_alpha_blend@alpha-transparent-fb@pipe-a-hdmi-a-1:
    - shard-glk10:        NOTRUN -> [FAIL][146] ([i915#10647]) +1 other test fail
   [146]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_171547v1/shard-glk10/igt@kms_plane_alpha_blend@alpha-transparent-fb@pipe-a-hdmi-a-1.html

  * igt@kms_plane_multiple@2x-tiling-4:
    - shard-tglu-1:       NOTRUN -> [SKIP][147] ([i915#13958])
   [147]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_171547v1/shard-tglu-1/igt@kms_plane_multiple@2x-tiling-4.html

  * igt@kms_plane_multiple@2x-tiling-x:
    - shard-rkl:          NOTRUN -> [SKIP][148] ([i915#13958])
   [148]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_171547v1/shard-rkl-8/igt@kms_plane_multiple@2x-tiling-x.html

  * igt@kms_plane_scaling@invalid-num-scalers:
    - shard-dg2:          [PASS][149] -> [SKIP][150] ([i915#3555] / [i915#6953] / [i915#9423])
   [149]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18943/shard-dg2-8/igt@kms_plane_scaling@invalid-num-scalers.html
   [150]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_171547v1/shard-dg2-10/igt@kms_plane_scaling@invalid-num-scalers.html

  * igt@kms_plane_scaling@plane-scaler-unity-scaling-with-pixel-format:
    - shard-dg2:          ([PASS][151], [PASS][152]) -> [SKIP][153] ([i915#15329] / [i915#9423])
   [151]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18943/shard-dg2-1/igt@kms_plane_scaling@plane-scaler-unity-scaling-with-pixel-format.html
   [152]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18943/shard-dg2-6/igt@kms_plane_scaling@plane-scaler-unity-scaling-with-pixel-format.html
   [153]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_171547v1/shard-dg2-10/igt@kms_plane_scaling@plane-scaler-unity-scaling-with-pixel-format.html

  * igt@kms_plane_scaling@plane-scaler-with-clipping-clamping-modifiers:
    - shard-dg2:          ([PASS][154], [PASS][155]) -> [SKIP][156] ([i915#15329] / [i915#3555] / [i915#9423])
   [154]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18943/shard-dg2-1/igt@kms_plane_scaling@plane-scaler-with-clipping-clamping-modifiers.html
   [155]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18943/shard-dg2-6/igt@kms_plane_scaling@plane-scaler-with-clipping-clamping-modifiers.html
   [156]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_171547v1/shard-dg2-10/igt@kms_plane_scaling@plane-scaler-with-clipping-clamping-modifiers.html

  * igt@kms_plane_scaling@plane-scaler-with-clipping-clamping-modifiers@pipe-b:
    - shard-dg2:          ([PASS][157], [PASS][158]) -> [SKIP][159] ([i915#15329]) +11 other tests skip
   [157]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18943/shard-dg2-1/igt@kms_plane_scaling@plane-scaler-with-clipping-clamping-modifiers@pipe-b.html
   [158]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18943/shard-dg2-6/igt@kms_plane_scaling@plane-scaler-with-clipping-clamping-modifiers@pipe-b.html
   [159]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_171547v1/shard-dg2-10/igt@kms_plane_scaling@plane-scaler-with-clipping-clamping-modifiers@pipe-b.html

  * igt@kms_plane_scaling@planes-unity-scaling-downscale-factor-0-5:
    - shard-dg2:          [PASS][160] -> [SKIP][161] ([i915#15329] / [i915#6953] / [i915#9423])
   [160]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18943/shard-dg2-8/igt@kms_plane_scaling@planes-unity-scaling-downscale-factor-0-5.html
   [161]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_171547v1/shard-dg2-10/igt@kms_plane_scaling@planes-unity-scaling-downscale-factor-0-5.html

  * igt@kms_plane_scaling@planes-unity-scaling-downscale-factor-0-5@pipe-b:
    - shard-dg2:          [PASS][162] -> [SKIP][163] ([i915#15329]) +3 other tests skip
   [162]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18943/shard-dg2-8/igt@kms_plane_scaling@planes-unity-scaling-downscale-factor-0-5@pipe-b.html
   [163]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_171547v1/shard-dg2-10/igt@kms_plane_scaling@planes-unity-scaling-downscale-factor-0-5@pipe-b.html

  * igt@kms_plane_scaling@planes-upscale-factor-0-25-downscale-factor-0-5:
    - shard-dg2:          ([PASS][164], [PASS][165]) -> [SKIP][166] ([i915#15329] / [i915#6953] / [i915#9423])
   [164]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18943/shard-dg2-5/igt@kms_plane_scaling@planes-upscale-factor-0-25-downscale-factor-0-5.html
   [165]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18943/shard-dg2-6/igt@kms_plane_scaling@planes-upscale-factor-0-25-downscale-factor-0-5.html
   [166]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_171547v1/shard-dg2-10/igt@kms_plane_scaling@planes-upscale-factor-0-25-downscale-factor-0-5.html

  * igt@kms_pm_backlight@bad-brightness:
    - shard-tglu-1:       NOTRUN -> [SKIP][167] ([i915#12343] / [i915#9812])
   [167]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_171547v1/shard-tglu-1/igt@kms_pm_backlight@bad-brightness.html

  * igt@kms_pm_backlight@brightness-with-dpms:
    - shard-tglu-1:       NOTRUN -> [SKIP][168] ([i915#12343])
   [168]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_171547v1/shard-tglu-1/igt@kms_pm_backlight@brightness-with-dpms.html

  * igt@kms_pm_rpm@dpms-mode-unset-non-lpsp:
    - shard-dg2:          [PASS][169] -> [SKIP][170] ([i915#15073]) +1 other test skip
   [169]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18943/shard-dg2-8/igt@kms_pm_rpm@dpms-mode-unset-non-lpsp.html
   [170]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_171547v1/shard-dg2-10/igt@kms_pm_rpm@dpms-mode-unset-non-lpsp.html

  * igt@kms_pm_rpm@i2c:
    - shard-dg1:          [PASS][171] -> [DMESG-WARN][172] ([i915#4423]) +1 other test dmesg-warn
   [171]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18943/shard-dg1-12/igt@kms_pm_rpm@i2c.html
   [172]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_171547v1/shard-dg1-18/igt@kms_pm_rpm@i2c.html

  * igt@kms_pm_rpm@modeset-non-lpsp-stress-no-wait:
    - shard-rkl:          ([PASS][173], [PASS][174]) -> [SKIP][175] ([i915#15073])
   [173]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18943/shard-rkl-3/igt@kms_pm_rpm@modeset-non-lpsp-stress-no-wait.html
   [174]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18943/shard-rkl-6/igt@kms_pm_rpm@modeset-non-lpsp-stress-no-wait.html
   [175]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_171547v1/shard-rkl-5/igt@kms_pm_rpm@modeset-non-lpsp-stress-no-wait.html

  * igt@kms_prime@basic-crc-hybrid:
    - shard-tglu-1:       NOTRUN -> [SKIP][176] ([i915#6524]) +1 other test skip
   [176]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_171547v1/shard-tglu-1/igt@kms_prime@basic-crc-hybrid.html

  * igt@kms_psr2_sf@fbc-psr2-cursor-plane-move-continuous-exceed-sf:
    - shard-tglu-1:       NOTRUN -> [SKIP][177] ([i915#11520]) +4 other tests skip
   [177]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_171547v1/shard-tglu-1/igt@kms_psr2_sf@fbc-psr2-cursor-plane-move-continuous-exceed-sf.html

  * igt@kms_psr2_sf@fbc-psr2-overlay-plane-move-continuous-exceed-fully-sf:
    - shard-glk10:        NOTRUN -> [SKIP][178] ([i915#11520]) +5 other tests skip
   [178]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_171547v1/shard-glk10/igt@kms_psr2_sf@fbc-psr2-overlay-plane-move-continuous-exceed-fully-sf.html

  * igt@kms_psr2_sf@fbc-psr2-primary-plane-update-sf-dmg-area:
    - shard-glk:          NOTRUN -> [SKIP][179] ([i915#11520])
   [179]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_171547v1/shard-glk8/igt@kms_psr2_sf@fbc-psr2-primary-plane-update-sf-dmg-area.html

  * igt@kms_psr2_sf@pr-plane-move-sf-dmg-area:
    - shard-glk11:        NOTRUN -> [SKIP][180] ([i915#11520]) +1 other test skip
   [180]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_171547v1/shard-glk11/igt@kms_psr2_sf@pr-plane-move-sf-dmg-area.html

  * igt@kms_psr2_sf@psr2-cursor-plane-move-continuous-sf:
    - shard-rkl:          NOTRUN -> [SKIP][181] ([i915#11520]) +1 other test skip
   [181]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_171547v1/shard-rkl-8/igt@kms_psr2_sf@psr2-cursor-plane-move-continuous-sf.html

  * igt@kms_psr@fbc-psr-primary-page-flip:
    - shard-rkl:          NOTRUN -> [SKIP][182] ([i915#1072] / [i915#9732]) +2 other tests skip
   [182]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_171547v1/shard-rkl-8/igt@kms_psr@fbc-psr-primary-page-flip.html

  * igt@kms_psr@psr-cursor-plane-onoff:
    - shard-tglu-1:       NOTRUN -> [SKIP][183] ([i915#9732]) +8 other tests skip
   [183]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_171547v1/shard-tglu-1/igt@kms_psr@psr-cursor-plane-onoff.html

  * igt@kms_rotation_crc@multiplane-rotation-cropping-bottom:
    - shard-glk11:        NOTRUN -> [INCOMPLETE][184] ([i915#15500] / [i915#16184])
   [184]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_171547v1/shard-glk11/igt@kms_rotation_crc@multiplane-rotation-cropping-bottom.html

  * igt@kms_vblank@ts-continuation-suspend@pipe-a-hdmi-a-2:
    - shard-rkl:          [PASS][185] -> [INCOMPLETE][186] ([i915#12276]) +1 other test incomplete
   [185]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18943/shard-rkl-7/igt@kms_vblank@ts-continuation-suspend@pipe-a-hdmi-a-2.html
   [186]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_171547v1/shard-rkl-3/igt@kms_vblank@ts-continuation-suspend@pipe-a-hdmi-a-2.html

  * igt@kms_vrr@seamless-rr-switch-virtual:
    - shard-rkl:          NOTRUN -> [SKIP][187] ([i915#9906])
   [187]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_171547v1/shard-rkl-8/igt@kms_vrr@seamless-rr-switch-virtual.html

  * igt@perf_pmu@rc6-suspend:
    - shard-glk11:        NOTRUN -> [INCOMPLETE][188] ([i915#13356] / [i915#16236])
   [188]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_171547v1/shard-glk11/igt@perf_pmu@rc6-suspend.html

  * igt@prime_mmap_kms@buffer-sharing:
    - shard-dg2:          ([PASS][189], [PASS][190]) -> [SKIP][191]
   [189]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18943/shard-dg2-1/igt@prime_mmap_kms@buffer-sharing.html
   [190]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18943/shard-dg2-6/igt@prime_mmap_kms@buffer-sharing.html
   [191]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_171547v1/shard-dg2-10/igt@prime_mmap_kms@buffer-sharing.html

  
#### Possible fixes ####

  * igt@fbdev@unaligned-read:
    - shard-dg2:          ([SKIP][192], [PASS][193]) ([i915#2582]) -> [PASS][194] +2 other tests pass
   [192]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18943/shard-dg2-10/igt@fbdev@unaligned-read.html
   [193]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18943/shard-dg2-3/igt@fbdev@unaligned-read.html
   [194]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_171547v1/shard-dg2-6/igt@fbdev@unaligned-read.html

  * igt@gem_ctx_isolation@preservation-s3:
    - shard-rkl:          ([PASS][195], [INCOMPLETE][196]) ([i915#13356]) -> [PASS][197] +1 other test pass
   [195]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18943/shard-rkl-2/igt@gem_ctx_isolation@preservation-s3.html
   [196]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18943/shard-rkl-6/igt@gem_ctx_isolation@preservation-s3.html
   [197]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_171547v1/shard-rkl-2/igt@gem_ctx_isolation@preservation-s3.html

  * igt@gem_eio@hibernate:
    - shard-dg1:          ([PASS][198], [DMESG-WARN][199]) ([i915#4391] / [i915#4423]) -> [PASS][200]
   [198]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18943/shard-dg1-19/igt@gem_eio@hibernate.html
   [199]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18943/shard-dg1-13/igt@gem_eio@hibernate.html
   [200]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_171547v1/shard-dg1-12/igt@gem_eio@hibernate.html

  * igt@i915_suspend@fence-restore-untiled:
    - shard-rkl:          ([INCOMPLETE][201], [INCOMPLETE][202]) ([i915#4817]) -> [PASS][203]
   [201]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18943/shard-rkl-3/igt@i915_suspend@fence-restore-untiled.html
   [202]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18943/shard-rkl-6/igt@i915_suspend@fence-restore-untiled.html
   [203]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_171547v1/shard-rkl-8/igt@i915_suspend@fence-restore-untiled.html

  * igt@i915_suspend@sysfs-reader:
    - shard-rkl:          ([PASS][204], [INCOMPLETE][205]) ([i915#4817]) -> [PASS][206]
   [204]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18943/shard-rkl-3/igt@i915_suspend@sysfs-reader.html
   [205]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18943/shard-rkl-6/igt@i915_suspend@sysfs-reader.html
   [206]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_171547v1/shard-rkl-3/igt@i915_suspend@sysfs-reader.html

  * igt@kms_async_flips@alternate-sync-async-flip-atomic:
    - shard-dg2:          ([FAIL][207], [SKIP][208]) ([i915#14888] / [i915#16707]) -> [PASS][209]
   [207]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18943/shard-dg2-4/igt@kms_async_flips@alternate-sync-async-flip-atomic.html
   [208]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18943/shard-dg2-10/igt@kms_async_flips@alternate-sync-async-flip-atomic.html
   [209]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_171547v1/shard-dg2-1/igt@kms_async_flips@alternate-sync-async-flip-atomic.html

  * igt@kms_big_fb@x-tiled-max-hw-stride-64bpp-rotate-0-hflip-async-flip:
    - shard-mtlp:         ([DMESG-WARN][210], [PASS][211]) ([i915#12935]) -> [PASS][212]
   [210]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18943/shard-mtlp-8/igt@kms_big_fb@x-tiled-max-hw-stride-64bpp-rotate-0-hflip-async-flip.html
   [211]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18943/shard-mtlp-7/igt@kms_big_fb@x-tiled-max-hw-stride-64bpp-rotate-0-hflip-async-flip.html
   [212]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_171547v1/shard-mtlp-7/igt@kms_big_fb@x-tiled-max-hw-stride-64bpp-rotate-0-hflip-async-flip.html

  * igt@kms_ccs@crc-primary-suspend-y-tiled-gen12-rc-ccs:
    - shard-rkl:          ([INCOMPLETE][213], [INCOMPLETE][214]) ([i915#14694] / [i915#15582]) -> [PASS][215]
   [213]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18943/shard-rkl-6/igt@kms_ccs@crc-primary-suspend-y-tiled-gen12-rc-ccs.html
   [214]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18943/shard-rkl-3/igt@kms_ccs@crc-primary-suspend-y-tiled-gen12-rc-ccs.html
   [215]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_171547v1/shard-rkl-5/igt@kms_ccs@crc-primary-suspend-y-tiled-gen12-rc-ccs.html

  * igt@kms_color@ctm-max:
    - shard-dg2:          ([SKIP][216], [PASS][217]) ([i915#12655]) -> [PASS][218] +1 other test pass
   [216]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18943/shard-dg2-10/igt@kms_color@ctm-max.html
   [217]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18943/shard-dg2-1/igt@kms_color@ctm-max.html
   [218]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_171547v1/shard-dg2-1/igt@kms_color@ctm-max.html

  * igt@kms_color_pipeline@plane-lut1d-ctm3x4:
    - shard-dg2:          ([SKIP][219], [PASS][220]) ([i915#15529]) -> [PASS][221]
   [219]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18943/shard-dg2-10/igt@kms_color_pipeline@plane-lut1d-ctm3x4.html
   [220]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18943/shard-dg2-1/igt@kms_color_pipeline@plane-lut1d-ctm3x4.html
   [221]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_171547v1/shard-dg2-1/igt@kms_color_pipeline@plane-lut1d-ctm3x4.html

  * igt@kms_cursor_crc@cursor-sliding-256x85:
    - shard-rkl:          ([PASS][222], [FAIL][223]) ([i915#13566]) -> [PASS][224] +1 other test pass
   [222]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18943/shard-rkl-3/igt@kms_cursor_crc@cursor-sliding-256x85.html
   [223]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18943/shard-rkl-1/igt@kms_cursor_crc@cursor-sliding-256x85.html
   [224]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_171547v1/shard-rkl-8/igt@kms_cursor_crc@cursor-sliding-256x85.html

  * igt@kms_fb_coherency@memset-crc:
    - shard-dg2:          ([PASS][225], [SKIP][226]) -> [PASS][227]
   [225]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18943/shard-dg2-1/igt@kms_fb_coherency@memset-crc.html
   [226]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18943/shard-dg2-10/igt@kms_fb_coherency@memset-crc.html
   [227]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_171547v1/shard-dg2-1/igt@kms_fb_coherency@memset-crc.html

  * igt@kms_flip@basic-flip-vs-dpms:
    - shard-dg2:          ([SKIP][228], [PASS][229]) ([i915#5354]) -> [PASS][230] +10 other tests pass
   [228]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18943/shard-dg2-10/igt@kms_flip@basic-flip-vs-dpms.html
   [229]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18943/shard-dg2-3/igt@kms_flip@basic-flip-vs-dpms.html
   [230]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_171547v1/shard-dg2-6/igt@kms_flip@basic-flip-vs-dpms.html

  * igt@kms_flip@flip-vs-expired-vblank-interruptible:
    - shard-dg1:          ([PASS][231], [FAIL][232]) ([i915#13027]) -> [PASS][233]
   [231]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18943/shard-dg1-18/igt@kms_flip@flip-vs-expired-vblank-interruptible.html
   [232]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18943/shard-dg1-15/igt@kms_flip@flip-vs-expired-vblank-interruptible.html
   [233]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_171547v1/shard-dg1-18/igt@kms_flip@flip-vs-expired-vblank-interruptible.html
    - shard-tglu:         ([FAIL][234], [FAIL][235]) ([i915#13027]) -> [PASS][236]
   [234]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18943/shard-tglu-10/igt@kms_flip@flip-vs-expired-vblank-interruptible.html
   [235]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18943/shard-tglu-4/igt@kms_flip@flip-vs-expired-vblank-interruptible.html
   [236]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_171547v1/shard-tglu-8/igt@kms_flip@flip-vs-expired-vblank-interruptible.html

  * igt@kms_flip@flip-vs-expired-vblank-interruptible@c-hdmi-a1:
    - shard-tglu:         ([FAIL][237], [PASS][238]) ([i915#13027]) -> [PASS][239] +1 other test pass
   [237]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18943/shard-tglu-10/igt@kms_flip@flip-vs-expired-vblank-interruptible@c-hdmi-a1.html
   [238]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18943/shard-tglu-4/igt@kms_flip@flip-vs-expired-vblank-interruptible@c-hdmi-a1.html
   [239]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_171547v1/shard-tglu-8/igt@kms_flip@flip-vs-expired-vblank-interruptible@c-hdmi-a1.html

  * igt@kms_flip_event_leak@basic:
    - shard-dg1:          ([DMESG-WARN][240], [PASS][241]) ([i915#4423]) -> [PASS][242] +1 other test pass
   [240]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18943/shard-dg1-18/igt@kms_flip_event_leak@basic.html
   [241]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18943/shard-dg1-17/igt@kms_flip_event_leak@basic.html
   [242]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_171547v1/shard-dg1-17/igt@kms_flip_event_leak@basic.html

  * igt@kms_flip_scaled_crc@flip-32bpp-linear-to-64bpp-linear-downscaling:
    - shard-dg2:          ([PASS][243], [SKIP][244]) ([i915#3555] / [i915#8813]) -> [PASS][245] +5 other tests pass
   [243]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18943/shard-dg2-7/igt@kms_flip_scaled_crc@flip-32bpp-linear-to-64bpp-linear-downscaling.html
   [244]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18943/shard-dg2-10/igt@kms_flip_scaled_crc@flip-32bpp-linear-to-64bpp-linear-downscaling.html
   [245]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_171547v1/shard-dg2-8/igt@kms_flip_scaled_crc@flip-32bpp-linear-to-64bpp-linear-downscaling.html

  * igt@kms_flip_tiling@flip-change-tiling:
    - shard-dg2:          ([PASS][246], [SKIP][247]) ([i915#3555]) -> [PASS][248]
   [246]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18943/shard-dg2-3/igt@kms_flip_tiling@flip-change-tiling.html
   [247]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18943/shard-dg2-10/igt@kms_flip_tiling@flip-change-tiling.html
   [248]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_171547v1/shard-dg2-6/igt@kms_flip_tiling@flip-change-tiling.html

  * igt@kms_force_connector_basic@prune-stale-modes:
    - shard-mtlp:         ([PASS][249], [SKIP][250]) ([i915#15672]) -> [PASS][251]
   [249]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18943/shard-mtlp-5/igt@kms_force_connector_basic@prune-stale-modes.html
   [250]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18943/shard-mtlp-1/igt@kms_force_connector_basic@prune-stale-modes.html
   [251]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_171547v1/shard-mtlp-8/igt@kms_force_connector_basic@prune-stale-modes.html

  * igt@kms_frontbuffer_tracking@fbc-1p-offscreen-pri-shrfb-draw-render:
    - shard-dg2:          ([SKIP][252], [PASS][253]) ([i915#16708]) -> [PASS][254] +1 other test pass
   [252]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18943/shard-dg2-10/igt@kms_frontbuffer_tracking@fbc-1p-offscreen-pri-shrfb-draw-render.html
   [253]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18943/shard-dg2-3/igt@kms_frontbuffer_tracking@fbc-1p-offscreen-pri-shrfb-draw-render.html
   [254]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_171547v1/shard-dg2-6/igt@kms_frontbuffer_tracking@fbc-1p-offscreen-pri-shrfb-draw-render.html

  * igt@kms_frontbuffer_tracking@fbc-1p-primscrn-cur-indfb-draw-pwrite:
    - shard-dg2:          ([PASS][255], [SKIP][256]) ([i915#16708] / [i915#5354]) -> [PASS][257] +6 other tests pass
   [255]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18943/shard-dg2-3/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-cur-indfb-draw-pwrite.html
   [256]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18943/shard-dg2-10/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-cur-indfb-draw-pwrite.html
   [257]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_171547v1/shard-dg2-6/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-cur-indfb-draw-pwrite.html

  * igt@kms_frontbuffer_tracking@fbchdr-1p-offscreen-pri-indfb-draw-mmap-gtt:
    - shard-rkl:          [SKIP][258] ([i915#15989]) -> [PASS][259] +2 other tests pass
   [258]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18943/shard-rkl-5/igt@kms_frontbuffer_tracking@fbchdr-1p-offscreen-pri-indfb-draw-mmap-gtt.html
   [259]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_171547v1/shard-rkl-1/igt@kms_frontbuffer_tracking@fbchdr-1p-offscreen-pri-indfb-draw-mmap-gtt.html

  * igt@kms_frontbuffer_tracking@fbchdr-1p-primscrn-cur-indfb-move:
    - shard-glk:          [SKIP][260] -> [PASS][261] +19 other tests pass
   [260]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18943/shard-glk1/igt@kms_frontbuffer_tracking@fbchdr-1p-primscrn-cur-indfb-move.html
   [261]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_171547v1/shard-glk8/igt@kms_frontbuffer_tracking@fbchdr-1p-primscrn-cur-indfb-move.html

  * igt@kms_frontbuffer_tracking@hdr-1p-primscrn-cur-indfb-draw-blt:
    - shard-rkl:          ([PASS][262], [SKIP][263]) ([i915#15989]) -> [PASS][264] +2 other tests pass
   [262]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18943/shard-rkl-6/igt@kms_frontbuffer_tracking@hdr-1p-primscrn-cur-indfb-draw-blt.html
   [263]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18943/shard-rkl-3/igt@kms_frontbuffer_tracking@hdr-1p-primscrn-cur-indfb-draw-blt.html
   [264]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_171547v1/shard-rkl-6/igt@kms_frontbuffer_tracking@hdr-1p-primscrn-cur-indfb-draw-blt.html

  * igt@kms_frontbuffer_tracking@hdr-rgb565-draw-pwrite:
    - shard-rkl:          ([SKIP][265], [SKIP][266]) ([i915#15989]) -> [PASS][267] +3 other tests pass
   [265]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18943/shard-rkl-8/igt@kms_frontbuffer_tracking@hdr-rgb565-draw-pwrite.html
   [266]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18943/shard-rkl-7/igt@kms_frontbuffer_tracking@hdr-rgb565-draw-pwrite.html
   [267]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_171547v1/shard-rkl-6/igt@kms_frontbuffer_tracking@hdr-rgb565-draw-pwrite.html

  * igt@kms_hdr@bpc-switch:
    - shard-rkl:          ([SKIP][268], [SKIP][269]) ([i915#16644] / [i915#3555] / [i915#8228]) -> [PASS][270]
   [268]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18943/shard-rkl-8/igt@kms_hdr@bpc-switch.html
   [269]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18943/shard-rkl-7/igt@kms_hdr@bpc-switch.html
   [270]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_171547v1/shard-rkl-6/igt@kms_hdr@bpc-switch.html

  * igt@kms_invalid_mode@int-max-clock:
    - shard-dg2:          ([PASS][271], [SKIP][272]) ([i915#16746] / [i915#3555]) -> [PASS][273] +4 other tests pass
   [271]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18943/shard-dg2-7/igt@kms_invalid_mode@int-max-clock.html
   [272]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18943/shard-dg2-10/igt@kms_invalid_mode@int-max-clock.html
   [273]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_171547v1/shard-dg2-8/igt@kms_invalid_mode@int-max-clock.html

  * igt@kms_pipe_crc_basic@compare-crc-sanitycheck-xr24:
    - shard-dg2:          ([PASS][274], [SKIP][275]) ([i915#11190] / [i915#16707]) -> [PASS][276] +2 other tests pass
   [274]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18943/shard-dg2-3/igt@kms_pipe_crc_basic@compare-crc-sanitycheck-xr24.html
   [275]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18943/shard-dg2-10/igt@kms_pipe_crc_basic@compare-crc-sanitycheck-xr24.html
   [276]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_171547v1/shard-dg2-6/igt@kms_pipe_crc_basic@compare-crc-sanitycheck-xr24.html

  * igt@kms_pipe_stress@stress-xrgb8888-ytiled:
    - shard-glk:          ([PASS][277], [DMESG-FAIL][278]) ([i915#118]) -> [PASS][279]
   [277]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18943/shard-glk5/igt@kms_pipe_stress@stress-xrgb8888-ytiled.html
   [278]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18943/shard-glk2/igt@kms_pipe_stress@stress-xrgb8888-ytiled.html
   [279]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_171547v1/shard-glk6/igt@kms_pipe_stress@stress-xrgb8888-ytiled.html

  * igt@kms_plane@pixel-format-linear-modifier:
    - shard-dg2:          ([PASS][280], [SKIP][281]) ([i915#8825]) -> [PASS][282] +5 other tests pass
   [280]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18943/shard-dg2-1/igt@kms_plane@pixel-format-linear-modifier.html
   [281]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18943/shard-dg2-10/igt@kms_plane@pixel-format-linear-modifier.html
   [282]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_171547v1/shard-dg2-1/igt@kms_plane@pixel-format-linear-modifier.html

  * igt@kms_plane@planar-pixel-format-settings:
    - shard-dg2:          ([PASS][283], [SKIP][284]) ([i915#16753]) -> [PASS][285]
   [283]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18943/shard-dg2-4/igt@kms_plane@planar-pixel-format-settings.html
   [284]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18943/shard-dg2-10/igt@kms_plane@planar-pixel-format-settings.html
   [285]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_171547v1/shard-dg2-1/igt@kms_plane@planar-pixel-format-settings.html

  * igt@kms_plane_scaling@plane-scaler-with-clipping-clamping-pixel-formats:
    - shard-dg2:          ([SKIP][286], [PASS][287]) ([i915#15329] / [i915#3555] / [i915#9423]) -> [PASS][288]
   [286]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18943/shard-dg2-10/igt@kms_plane_scaling@plane-scaler-with-clipping-clamping-pixel-formats.html
   [287]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18943/shard-dg2-1/igt@kms_plane_scaling@plane-scaler-with-clipping-clamping-pixel-formats.html
   [288]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_171547v1/shard-dg2-1/igt@kms_plane_scaling@plane-scaler-with-clipping-clamping-pixel-formats.html

  * igt@kms_plane_scaling@plane-upscale-20x20-with-modifiers:
    - shard-dg2:          ([SKIP][289], [PASS][290]) ([i915#15329] / [i915#9423]) -> [PASS][291] +5 other tests pass
   [289]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18943/shard-dg2-10/igt@kms_plane_scaling@plane-upscale-20x20-with-modifiers.html
   [290]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18943/shard-dg2-4/igt@kms_plane_scaling@plane-upscale-20x20-with-modifiers.html
   [291]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_171547v1/shard-dg2-4/igt@kms_plane_scaling@plane-upscale-20x20-with-modifiers.html

  * igt@kms_plane_scaling@plane-upscale-20x20-with-rotation@pipe-d:
    - shard-dg2:          ([SKIP][292], [PASS][293]) ([i915#15329]) -> [PASS][294] +35 other tests pass
   [292]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18943/shard-dg2-10/igt@kms_plane_scaling@plane-upscale-20x20-with-rotation@pipe-d.html
   [293]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18943/shard-dg2-4/igt@kms_plane_scaling@plane-upscale-20x20-with-rotation@pipe-d.html
   [294]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_171547v1/shard-dg2-1/igt@kms_plane_scaling@plane-upscale-20x20-with-rotation@pipe-d.html

  * igt@kms_plane_scaling@planes-unity-scaling-downscale-factor-0-75:
    - shard-dg2:          ([SKIP][295], [PASS][296]) ([i915#15329] / [i915#3555] / [i915#6953] / [i915#9423]) -> [PASS][297]
   [295]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18943/shard-dg2-10/igt@kms_plane_scaling@planes-unity-scaling-downscale-factor-0-75.html
   [296]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18943/shard-dg2-7/igt@kms_plane_scaling@planes-unity-scaling-downscale-factor-0-75.html
   [297]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_171547v1/shard-dg2-8/igt@kms_plane_scaling@planes-unity-scaling-downscale-factor-0-75.html

  * igt@kms_plane_scaling@planes-upscale-20x20-downscale-factor-0-75:
    - shard-dg2:          ([PASS][298], [SKIP][299]) ([i915#15329] / [i915#6953] / [i915#9423]) -> [PASS][300]
   [298]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18943/shard-dg2-3/igt@kms_plane_scaling@planes-upscale-20x20-downscale-factor-0-75.html
   [299]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18943/shard-dg2-10/igt@kms_plane_scaling@planes-upscale-20x20-downscale-factor-0-75.html
   [300]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_171547v1/shard-dg2-6/igt@kms_plane_scaling@planes-upscale-20x20-downscale-factor-0-75.html

  * igt@kms_pm_lpsp@kms-lpsp:
    - shard-dg2:          ([SKIP][301], [SKIP][302]) ([i915#9340]) -> [PASS][303]
   [301]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18943/shard-dg2-10/igt@kms_pm_lpsp@kms-lpsp.html
   [302]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18943/shard-dg2-6/igt@kms_pm_lpsp@kms-lpsp.html
   [303]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_171547v1/shard-dg2-4/igt@kms_pm_lpsp@kms-lpsp.html

  * igt@kms_pm_rpm@dpms-lpsp:
    - shard-dg2:          ([SKIP][304], [PASS][305]) ([i915#15073]) -> [PASS][306] +3 other tests pass
   [304]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18943/shard-dg2-10/igt@kms_pm_rpm@dpms-lpsp.html
   [305]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18943/shard-dg2-4/igt@kms_pm_rpm@dpms-lpsp.html
   [306]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_171547v1/shard-dg2-4/igt@kms_pm_rpm@dpms-lpsp.html
    - shard-dg1:          ([PASS][307], [SKIP][308]) ([i915#15073]) -> [PASS][309] +2 other tests pass
   [307]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18943/shard-dg1-14/igt@kms_pm_rpm@dpms-lpsp.html
   [308]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18943/shard-dg1-13/igt@kms_pm_rpm@dpms-lpsp.html
   [309]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_171547v1/shard-dg1-15/igt@kms_pm_rpm@dpms-lpsp.html

  * igt@kms_pm_rpm@dpms-mode-unset-lpsp:
    - shard-rkl:          ([SKIP][310], [SKIP][311]) ([i915#15073]) -> [PASS][312]
   [310]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18943/shard-rkl-3/igt@kms_pm_rpm@dpms-mode-unset-lpsp.html
   [311]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18943/shard-rkl-1/igt@kms_pm_rpm@dpms-mode-unset-lpsp.html
   [312]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_171547v1/shard-rkl-8/igt@kms_pm_rpm@dpms-mode-unset-lpsp.html

  * igt@kms_pm_rpm@drm-resources-equal:
    - shard-dg2:          ([PASS][313], [SKIP][314]) ([i915#3547]) -> [PASS][315]
   [313]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18943/shard-dg2-4/igt@kms_pm_rpm@drm-resources-equal.html
   [314]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18943/shard-dg2-10/igt@kms_pm_rpm@drm-resources-equal.html
   [315]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_171547v1/shard-dg2-4/igt@kms_pm_rpm@drm-resources-equal.html

  * igt@kms_pm_rpm@modeset-lpsp-stress:
    - shard-rkl:          ([PASS][316], [SKIP][317]) ([i915#15073]) -> [PASS][318] +1 other test pass
   [316]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18943/shard-rkl-2/igt@kms_pm_rpm@modeset-lpsp-stress.html
   [317]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18943/shard-rkl-4/igt@kms_pm_rpm@modeset-lpsp-stress.html
   [318]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_171547v1/shard-rkl-2/igt@kms_pm_rpm@modeset-lpsp-stress.html
    - shard-dg1:          ([SKIP][319], [SKIP][320]) ([i915#15073]) -> [PASS][321]
   [319]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18943/shard-dg1-16/igt@kms_pm_rpm@modeset-lpsp-stress.html
   [320]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18943/shard-dg1-13/igt@kms_pm_rpm@modeset-lpsp-stress.html
   [321]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_171547v1/shard-dg1-15/igt@kms_pm_rpm@modeset-lpsp-stress.html

  * igt@kms_pm_rpm@modeset-non-lpsp-stress:
    - shard-rkl:          [SKIP][322] ([i915#15073]) -> [PASS][323]
   [322]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18943/shard-rkl-5/igt@kms_pm_rpm@modeset-non-lpsp-stress.html
   [323]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_171547v1/shard-rkl-7/igt@kms_pm_rpm@modeset-non-lpsp-stress.html

  * igt@kms_vblank@ts-continuation-modeset:
    - shard-dg2:          ([SKIP][324], [PASS][325]) ([i915#16707]) -> [PASS][326] +81 other tests pass
   [324]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18943/shard-dg2-10/igt@kms_vblank@ts-continuation-modeset.html
   [325]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18943/shard-dg2-6/igt@kms_vblank@ts-continuation-modeset.html
   [326]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_171547v1/shard-dg2-4/igt@kms_vblank@ts-continuation-modeset.html

  
#### Warnings ####

  * igt@fbdev@info:
    - shard-dg2:          ([PASS][327], [SKIP][328]) ([i915#1849] / [i915#2582]) -> [SKIP][329] ([i915#1849] / [i915#2582])
   [327]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18943/shard-dg2-8/igt@fbdev@info.html
   [328]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18943/shard-dg2-10/igt@fbdev@info.html
   [329]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_171547v1/shard-dg2-10/igt@fbdev@info.html

  * igt@gem_ccs@large-ctrl-surf-copy:
    - shard-rkl:          ([SKIP][330], [SKIP][331]) ([i915#13008] / [i915#14544]) -> [SKIP][332] ([i915#13008])
   [330]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18943/shard-rkl-6/igt@gem_ccs@large-ctrl-surf-copy.html
   [331]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18943/shard-rkl-1/igt@gem_ccs@large-ctrl-surf-copy.html
   [332]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_171547v1/shard-rkl-4/igt@gem_ccs@large-ctrl-surf-copy.html

  * igt@gem_ccs@suspend-resume@linear-compressed-compfmt0-smem-lmem0:
    - shard-dg2:          ([PASS][333], [INCOMPLETE][334]) ([i915#13356] / [i915#16348]) -> [INCOMPLETE][335] ([i915#13356] / [i915#16348])
   [333]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18943/shard-dg2-4/igt@gem_ccs@suspend-resume@linear-compressed-compfmt0-smem-lmem0.html
   [334]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18943/shard-dg2-6/igt@gem_ccs@suspend-resume@linear-compressed-compfmt0-smem-lmem0.html
   [335]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_171547v1/shard-dg2-1/igt@gem_ccs@suspend-resume@linear-compressed-compfmt0-smem-lmem0.html

  * igt@gem_ctx_sseu@invalid-sseu:
    - shard-rkl:          ([SKIP][336], [SKIP][337]) ([i915#14544] / [i915#280]) -> [SKIP][338] ([i915#280])
   [336]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18943/shard-rkl-6/igt@gem_ctx_sseu@invalid-sseu.html
   [337]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18943/shard-rkl-3/igt@gem_ctx_sseu@invalid-sseu.html
   [338]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_171547v1/shard-rkl-5/igt@gem_ctx_sseu@invalid-sseu.html

  * igt@gem_exec_balancer@parallel-contexts:
    - shard-rkl:          ([SKIP][339], [SKIP][340]) ([i915#14544] / [i915#4525]) -> [SKIP][341] ([i915#4525])
   [339]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18943/shard-rkl-3/igt@gem_exec_balancer@parallel-contexts.html
   [340]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18943/shard-rkl-6/igt@gem_exec_balancer@parallel-contexts.html
   [341]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_171547v1/shard-rkl-5/igt@gem_exec_balancer@parallel-contexts.html

  * igt@gem_exec_reloc@basic-gtt-cpu:
    - shard-rkl:          ([SKIP][342], [SKIP][343]) ([i915#14544] / [i915#3281]) -> [SKIP][344] ([i915#3281]) +8 other tests skip
   [342]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18943/shard-rkl-3/igt@gem_exec_reloc@basic-gtt-cpu.html
   [343]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18943/shard-rkl-6/igt@gem_exec_reloc@basic-gtt-cpu.html
   [344]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_171547v1/shard-rkl-5/igt@gem_exec_reloc@basic-gtt-cpu.html

  * igt@gem_exec_reloc@basic-gtt-cpu-active:
    - shard-rkl:          [SKIP][345] ([i915#3281]) -> [SKIP][346] ([i915#14544] / [i915#3281])
   [345]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18943/shard-rkl-1/igt@gem_exec_reloc@basic-gtt-cpu-active.html
   [346]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_171547v1/shard-rkl-6/igt@gem_exec_reloc@basic-gtt-cpu-active.html

  * igt@gem_lmem_swapping@parallel-random-verify:
    - shard-rkl:          ([SKIP][347], [SKIP][348]) ([i915#14544] / [i915#4613]) -> [SKIP][349] ([i915#4613]) +2 other tests skip
   [347]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18943/shard-rkl-3/igt@gem_lmem_swapping@parallel-random-verify.html
   [348]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18943/shard-rkl-6/igt@gem_lmem_swapping@parallel-random-verify.html
   [349]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_171547v1/shard-rkl-5/igt@gem_lmem_swapping@parallel-random-verify.html

  * igt@gem_lmem_swapping@random-engines:
    - shard-rkl:          ([SKIP][350], [SKIP][351]) ([i915#4613]) -> [SKIP][352] ([i915#14544] / [i915#4613])
   [350]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18943/shard-rkl-7/igt@gem_lmem_swapping@random-engines.html
   [351]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18943/shard-rkl-8/igt@gem_lmem_swapping@random-engines.html
   [352]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_171547v1/shard-rkl-6/igt@gem_lmem_swapping@random-engines.html

  * igt@gem_lmem_swapping@verify-random:
    - shard-rkl:          [SKIP][353] ([i915#4613]) -> [SKIP][354] ([i915#14544] / [i915#4613])
   [353]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18943/shard-rkl-1/igt@gem_lmem_swapping@verify-random.html
   [354]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_171547v1/shard-rkl-6/igt@gem_lmem_swapping@verify-random.html

  * igt@gem_media_vme:
    - shard-rkl:          ([SKIP][355], [SKIP][356]) ([i915#14544] / [i915#284]) -> [SKIP][357] ([i915#284])
   [355]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18943/shard-rkl-6/igt@gem_media_vme.html
   [356]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18943/shard-rkl-1/igt@gem_media_vme.html
   [357]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_171547v1/shard-rkl-4/igt@gem_media_vme.html

  * igt@gem_pread@uncached:
    - shard-rkl:          ([SKIP][358], [SKIP][359]) ([i915#14544] / [i915#3282]) -> [SKIP][360] ([i915#3282]) +1 other test skip
   [358]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18943/shard-rkl-6/igt@gem_pread@uncached.html
   [359]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18943/shard-rkl-1/igt@gem_pread@uncached.html
   [360]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_171547v1/shard-rkl-4/igt@gem_pread@uncached.html

  * igt@gem_set_tiling_vs_blt@tiled-to-untiled:
    - shard-rkl:          ([SKIP][361], [SKIP][362]) ([i915#8411]) -> [SKIP][363] ([i915#14544] / [i915#8411])
   [361]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18943/shard-rkl-7/igt@gem_set_tiling_vs_blt@tiled-to-untiled.html
   [362]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18943/shard-rkl-8/igt@gem_set_tiling_vs_blt@tiled-to-untiled.html
   [363]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_171547v1/shard-rkl-6/igt@gem_set_tiling_vs_blt@tiled-to-untiled.html

  * igt@gem_userptr_blits@unsync-unmap-cycles:
    - shard-rkl:          ([SKIP][364], [SKIP][365]) ([i915#3297]) -> [SKIP][366] ([i915#14544] / [i915#3297])
   [364]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18943/shard-rkl-8/igt@gem_userptr_blits@unsync-unmap-cycles.html
   [365]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18943/shard-rkl-7/igt@gem_userptr_blits@unsync-unmap-cycles.html
   [366]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_171547v1/shard-rkl-6/igt@gem_userptr_blits@unsync-unmap-cycles.html

  * igt@gen9_exec_parse@basic-rejected-ctx-param:
    - shard-rkl:          ([SKIP][367], [SKIP][368]) ([i915#2527]) -> [SKIP][369] ([i915#14544] / [i915#2527])
   [367]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18943/shard-rkl-8/igt@gen9_exec_parse@basic-rejected-ctx-param.html
   [368]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18943/shard-rkl-7/igt@gen9_exec_parse@basic-rejected-ctx-param.html
   [369]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_171547v1/shard-rkl-6/igt@gen9_exec_parse@basic-rejected-ctx-param.html

  * igt@gen9_exec_parse@bb-start-cmd:
    - shard-rkl:          ([SKIP][370], [SKIP][371]) ([i915#14544] / [i915#2527]) -> [SKIP][372] ([i915#2527])
   [370]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18943/shard-rkl-6/igt@gen9_exec_parse@bb-start-cmd.html
   [371]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18943/shard-rkl-3/igt@gen9_exec_parse@bb-start-cmd.html
   [372]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_171547v1/shard-rkl-8/igt@gen9_exec_parse@bb-start-cmd.html

  * igt@gen9_exec_parse@shadow-peek:
    - shard-rkl:          [SKIP][373] ([i915#2527]) -> [SKIP][374] ([i915#14544] / [i915#2527]) +1 other test skip
   [373]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18943/shard-rkl-1/igt@gen9_exec_parse@shadow-peek.html
   [374]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_171547v1/shard-rkl-6/igt@gen9_exec_parse@shadow-peek.html

  * igt@i915_module_load@fault-injection@__uc_init:
    - shard-rkl:          [SKIP][375] ([i915#15479]) -> [SKIP][376] ([i915#14544] / [i915#15479]) +4 other tests skip
   [375]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18943/shard-rkl-1/igt@i915_module_load@fault-injection@__uc_init.html
   [376]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_171547v1/shard-rkl-6/igt@i915_module_load@fault-injection@__uc_init.html

  * igt@i915_pm_rc6_residency@media-rc6-accuracy:
    - shard-rkl:          ([SKIP][377], [SKIP][378]) ([i915#14544] / [i915#16080] / [i915#16166]) -> [SKIP][379] ([i915#16080] / [i915#16166])
   [377]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18943/shard-rkl-6/igt@i915_pm_rc6_residency@media-rc6-accuracy.html
   [378]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18943/shard-rkl-1/igt@i915_pm_rc6_residency@media-rc6-accuracy.html
   [379]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_171547v1/shard-rkl-4/igt@i915_pm_rc6_residency@media-rc6-accuracy.html

  * igt@i915_suspend@fence-restore-tiled2untiled:
    - shard-rkl:          ([PASS][380], [INCOMPLETE][381]) ([i915#4817]) -> [INCOMPLETE][382] ([i915#4817])
   [380]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18943/shard-rkl-8/igt@i915_suspend@fence-restore-tiled2untiled.html
   [381]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18943/shard-rkl-6/igt@i915_suspend@fence-restore-tiled2untiled.html
   [382]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_171547v1/shard-rkl-3/igt@i915_suspend@fence-restore-tiled2untiled.html

  * igt@i915_suspend@fence-restore-untiled:
    - shard-glk:          ([PASS][383], [INCOMPLETE][384]) ([i915#16182] / [i915#4817]) -> [INCOMPLETE][385] ([i915#16182] / [i915#4817])
   [383]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18943/shard-glk6/igt@i915_suspend@fence-restore-untiled.html
   [384]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18943/shard-glk5/igt@i915_suspend@fence-restore-untiled.html
   [385]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_171547v1/shard-glk1/igt@i915_suspend@fence-restore-untiled.html

  * igt@intel_hwmon@hwmon-write:
    - shard-rkl:          ([SKIP][386], [SKIP][387]) ([i915#14544] / [i915#7707]) -> [SKIP][388] ([i915#7707])
   [386]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18943/shard-rkl-3/igt@intel_hwmon@hwmon-write.html
   [387]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18943/shard-rkl-6/igt@intel_hwmon@hwmon-write.html
   [388]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_171547v1/shard-rkl-5/igt@intel_hwmon@hwmon-write.html

  * igt@kms_atomic@plane-primary-overlay-mutable-zpos:
    - shard-dg2:          ([SKIP][389], [SKIP][390]) ([i915#16707] / [i915#9531]) -> [SKIP][391] ([i915#9531])
   [389]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18943/shard-dg2-7/igt@kms_atomic@plane-primary-overlay-mutable-zpos.html
   [390]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18943/shard-dg2-10/igt@kms_atomic@plane-primary-overlay-mutable-zpos.html
   [391]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_171547v1/shard-dg2-8/igt@kms_atomic@plane-primary-overlay-mutable-zpos.html

  * igt@kms_atomic_transition@plane-all-modeset-transition-fencing:
    - shard-tglu:         ([FAIL][392], [PASS][393]) ([i915#15662]) -> [FAIL][394] ([i915#15662]) +1 other test fail
   [392]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18943/shard-tglu-8/igt@kms_atomic_transition@plane-all-modeset-transition-fencing.html
   [393]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18943/shard-tglu-3/igt@kms_atomic_transition@plane-all-modeset-transition-fencing.html
   [394]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_171547v1/shard-tglu-6/igt@kms_atomic_transition@plane-all-modeset-transition-fencing.html

  * igt@kms_big_fb@4-tiled-32bpp-rotate-90:
    - shard-dg2:          ([SKIP][395], [SKIP][396]) -> [SKIP][397] ([i915#16707]) +1 other test skip
   [395]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18943/shard-dg2-6/igt@kms_big_fb@4-tiled-32bpp-rotate-90.html
   [396]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18943/shard-dg2-5/igt@kms_big_fb@4-tiled-32bpp-rotate-90.html
   [397]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_171547v1/shard-dg2-10/igt@kms_big_fb@4-tiled-32bpp-rotate-90.html

  * igt@kms_big_fb@4-tiled-64bpp-rotate-0:
    - shard-rkl:          ([SKIP][398], [SKIP][399]) ([i915#14544] / [i915#5286]) -> [SKIP][400] ([i915#5286]) +2 other tests skip
   [398]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18943/shard-rkl-1/igt@kms_big_fb@4-tiled-64bpp-rotate-0.html
   [399]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18943/shard-rkl-6/igt@kms_big_fb@4-tiled-64bpp-rotate-0.html
   [400]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_171547v1/shard-rkl-4/igt@kms_big_fb@4-tiled-64bpp-rotate-0.html

  * igt@kms_big_fb@4-tiled-8bpp-rotate-0:
    - shard-rkl:          [SKIP][401] ([i915#5286]) -> [SKIP][402] ([i915#14544] / [i915#5286])
   [401]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18943/shard-rkl-1/igt@kms_big_fb@4-tiled-8bpp-rotate-0.html
   [402]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_171547v1/shard-rkl-6/igt@kms_big_fb@4-tiled-8bpp-rotate-0.html

  * igt@kms_big_fb@4-tiled-addfb-size-offset-overflow:
    - shard-rkl:          ([SKIP][403], [SKIP][404]) ([i915#5286]) -> [SKIP][405] ([i915#14544] / [i915#5286])
   [403]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18943/shard-rkl-8/igt@kms_big_fb@4-tiled-addfb-size-offset-overflow.html
   [404]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18943/shard-rkl-7/igt@kms_big_fb@4-tiled-addfb-size-offset-overflow.html
   [405]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_171547v1/shard-rkl-6/igt@kms_big_fb@4-tiled-addfb-size-offset-overflow.html

  * igt@kms_big_fb@linear-max-hw-stride-32bpp-rotate-0-hflip:
    - shard-dg2:          ([SKIP][406], [SKIP][407]) ([i915#16707] / [i915#3828]) -> [SKIP][408] ([i915#16707])
   [406]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18943/shard-dg2-8/igt@kms_big_fb@linear-max-hw-stride-32bpp-rotate-0-hflip.html
   [407]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18943/shard-dg2-10/igt@kms_big_fb@linear-max-hw-stride-32bpp-rotate-0-hflip.html
   [408]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_171547v1/shard-dg2-10/igt@kms_big_fb@linear-max-hw-stride-32bpp-rotate-0-hflip.html

  * igt@kms_big_fb@linear-max-hw-stride-32bpp-rotate-180-hflip:
    - shard-rkl:          ([SKIP][409], [SKIP][410]) ([i915#14544] / [i915#3828]) -> [SKIP][411] ([i915#3828])
   [409]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18943/shard-rkl-3/igt@kms_big_fb@linear-max-hw-stride-32bpp-rotate-180-hflip.html
   [410]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18943/shard-rkl-6/igt@kms_big_fb@linear-max-hw-stride-32bpp-rotate-180-hflip.html
   [411]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_171547v1/shard-rkl-5/igt@kms_big_fb@linear-max-hw-stride-32bpp-rotate-180-hflip.html

  * igt@kms_big_fb@linear-max-hw-stride-64bpp-rotate-0-hflip:
    - shard-dg2:          ([SKIP][412], [SKIP][413]) ([i915#16707] / [i915#3828]) -> [SKIP][414] ([i915#3828]) +1 other test skip
   [412]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18943/shard-dg2-6/igt@kms_big_fb@linear-max-hw-stride-64bpp-rotate-0-hflip.html
   [413]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18943/shard-dg2-10/igt@kms_big_fb@linear-max-hw-stride-64bpp-rotate-0-hflip.html
   [414]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_171547v1/shard-dg2-4/igt@kms_big_fb@linear-max-hw-stride-64bpp-rotate-0-hflip.html

  * igt@kms_big_fb@linear-max-hw-stride-64bpp-rotate-180-hflip:
    - shard-dg2:          ([SKIP][415], [SKIP][416]) ([i915#3828]) -> [SKIP][417] ([i915#16707])
   [415]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18943/shard-dg2-5/igt@kms_big_fb@linear-max-hw-stride-64bpp-rotate-180-hflip.html
   [416]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18943/shard-dg2-6/igt@kms_big_fb@linear-max-hw-stride-64bpp-rotate-180-hflip.html
   [417]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_171547v1/shard-dg2-10/igt@kms_big_fb@linear-max-hw-stride-64bpp-rotate-180-hflip.html

  * igt@kms_big_fb@x-tiled-16bpp-rotate-270:
    - shard-dg2:          ([SKIP][418], [SKIP][419]) ([i915#16707]) -> [SKIP][420] +5 other tests skip
   [418]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18943/shard-dg2-3/igt@kms_big_fb@x-tiled-16bpp-rotate-270.html
   [419]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18943/shard-dg2-10/igt@kms_big_fb@x-tiled-16bpp-rotate-270.html
   [420]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_171547v1/shard-dg2-6/igt@kms_big_fb@x-tiled-16bpp-rotate-270.html

  * igt@kms_big_fb@x-tiled-16bpp-rotate-90:
    - shard-dg2:          [SKIP][421] -> [SKIP][422] ([i915#16707]) +1 other test skip
   [421]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18943/shard-dg2-8/igt@kms_big_fb@x-tiled-16bpp-rotate-90.html
   [422]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_171547v1/shard-dg2-10/igt@kms_big_fb@x-tiled-16bpp-rotate-90.html

  * igt@kms_big_fb@y-tiled-32bpp-rotate-180:
    - shard-dg2:          ([SKIP][423], [SKIP][424]) ([i915#16707] / [i915#4538] / [i915#5190]) -> [SKIP][425] ([i915#16707] / [i915#5190]) +5 other tests skip
   [423]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18943/shard-dg2-10/igt@kms_big_fb@y-tiled-32bpp-rotate-180.html
   [424]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18943/shard-dg2-8/igt@kms_big_fb@y-tiled-32bpp-rotate-180.html
   [425]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_171547v1/shard-dg2-10/igt@kms_big_fb@y-tiled-32bpp-rotate-180.html

  * igt@kms_big_fb@y-tiled-64bpp-rotate-270:
    - shard-rkl:          ([SKIP][426], [SKIP][427]) ([i915#14544] / [i915#3638]) -> [SKIP][428] ([i915#3638])
   [426]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18943/shard-rkl-3/igt@kms_big_fb@y-tiled-64bpp-rotate-270.html
   [427]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18943/shard-rkl-6/igt@kms_big_fb@y-tiled-64bpp-rotate-270.html
   [428]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_171547v1/shard-rkl-5/igt@kms_big_fb@y-tiled-64bpp-rotate-270.html

  * igt@kms_big_fb@y-tiled-8bpp-rotate-270:
    - shard-dg2:          [SKIP][429] ([i915#4538] / [i915#5190]) -> [SKIP][430] ([i915#16707] / [i915#5190]) +2 other tests skip
   [429]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18943/shard-dg2-8/igt@kms_big_fb@y-tiled-8bpp-rotate-270.html
   [430]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_171547v1/shard-dg2-10/igt@kms_big_fb@y-tiled-8bpp-rotate-270.html

  * igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-180-hflip-async-flip:
    - shard-dg2:          ([SKIP][431], [SKIP][432]) ([i915#16707] / [i915#4538] / [i915#5190]) -> [SKIP][433] ([i915#4538] / [i915#5190]) +14 other tests skip
   [431]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18943/shard-dg2-6/igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-180-hflip-async-flip.html
   [432]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18943/shard-dg2-10/igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-180-hflip-async-flip.html
   [433]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_171547v1/shard-dg2-4/igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-180-hflip-async-flip.html

  * igt@kms_big_fb@yf-tiled-32bpp-rotate-90:
    - shard-dg2:          ([SKIP][434], [SKIP][435]) ([i915#4538] / [i915#5190]) -> [SKIP][436] ([i915#16707] / [i915#5190]) +4 other tests skip
   [434]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18943/shard-dg2-6/igt@kms_big_fb@yf-tiled-32bpp-rotate-90.html
   [435]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18943/shard-dg2-5/igt@kms_big_fb@yf-tiled-32bpp-rotate-90.html
   [436]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_171547v1/shard-dg2-10/igt@kms_big_fb@yf-tiled-32bpp-rotate-90.html

  * igt@kms_ccs@bad-aux-stride-4-tiled-mtl-rc-ccs@pipe-c-hdmi-a-2:
    - shard-rkl:          [SKIP][437] ([i915#14098] / [i915#6095]) -> [SKIP][438] ([i915#14098] / [i915#14544] / [i915#6095]) +4 other tests skip
   [437]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18943/shard-rkl-1/igt@kms_ccs@bad-aux-stride-4-tiled-mtl-rc-ccs@pipe-c-hdmi-a-2.html
   [438]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_171547v1/shard-rkl-6/igt@kms_ccs@bad-aux-stride-4-tiled-mtl-rc-ccs@pipe-c-hdmi-a-2.html

  * igt@kms_ccs@bad-pixel-format-y-tiled-gen12-mc-ccs:
    - shard-dg2:          ([SKIP][439], [SKIP][440]) ([i915#10307] / [i915#16707] / [i915#6095]) -> [SKIP][441] ([i915#10307] / [i915#6095]) +15 other tests skip
   [439]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18943/shard-dg2-10/igt@kms_ccs@bad-pixel-format-y-tiled-gen12-mc-ccs.html
   [440]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18943/shard-dg2-1/igt@kms_ccs@bad-pixel-format-y-tiled-gen12-mc-ccs.html
   [441]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_171547v1/shard-dg2-1/igt@kms_ccs@bad-pixel-format-y-tiled-gen12-mc-ccs.html

  * igt@kms_ccs@ccs-on-another-bo-4-tiled-mtl-mc-ccs@pipe-a-hdmi-a-2:
    - shard-rkl:          [SKIP][442] ([i915#6095]) -> [SKIP][443] ([i915#14544] / [i915#6095]) +5 other tests skip
   [442]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18943/shard-rkl-1/igt@kms_ccs@ccs-on-another-bo-4-tiled-mtl-mc-ccs@pipe-a-hdmi-a-2.html
   [443]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_171547v1/shard-rkl-6/igt@kms_ccs@ccs-on-another-bo-4-tiled-mtl-mc-ccs@pipe-a-hdmi-a-2.html

  * igt@kms_ccs@crc-primary-basic-4-tiled-bmg-ccs:
    - shard-dg2:          ([SKIP][444], [SKIP][445]) ([i915#12313]) -> [SKIP][446] ([i915#16707]) +2 other tests skip
   [444]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18943/shard-dg2-5/igt@kms_ccs@crc-primary-basic-4-tiled-bmg-ccs.html
   [445]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18943/shard-dg2-6/igt@kms_ccs@crc-primary-basic-4-tiled-bmg-ccs.html
   [446]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_171547v1/shard-dg2-10/igt@kms_ccs@crc-primary-basic-4-tiled-bmg-ccs.html

  * igt@kms_ccs@crc-primary-basic-4-tiled-mtl-mc-ccs:
    - shard-rkl:          ([SKIP][447], [SKIP][448]) ([i915#14098] / [i915#6095]) -> [SKIP][449] ([i915#14098] / [i915#14544] / [i915#6095])
   [447]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18943/shard-rkl-7/igt@kms_ccs@crc-primary-basic-4-tiled-mtl-mc-ccs.html
   [448]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18943/shard-rkl-8/igt@kms_ccs@crc-primary-basic-4-tiled-mtl-mc-ccs.html
   [449]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_171547v1/shard-rkl-6/igt@kms_ccs@crc-primary-basic-4-tiled-mtl-mc-ccs.html

  * igt@kms_ccs@crc-primary-rotation-180-4-tiled-lnl-ccs:
    - shard-dg2:          ([SKIP][450], [SKIP][451]) ([i915#12313] / [i915#16707]) -> [SKIP][452] ([i915#12313]) +2 other tests skip
   [450]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18943/shard-dg2-10/igt@kms_ccs@crc-primary-rotation-180-4-tiled-lnl-ccs.html
   [451]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18943/shard-dg2-4/igt@kms_ccs@crc-primary-rotation-180-4-tiled-lnl-ccs.html
   [452]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_171547v1/shard-dg2-4/igt@kms_ccs@crc-primary-rotation-180-4-tiled-lnl-ccs.html

  * igt@kms_ccs@crc-primary-rotation-180-y-tiled-ccs:
    - shard-dg2:          ([SKIP][453], [SKIP][454]) ([i915#10307] / [i915#16707] / [i915#6095]) -> [SKIP][455] ([i915#16707]) +5 other tests skip
   [453]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18943/shard-dg2-8/igt@kms_ccs@crc-primary-rotation-180-y-tiled-ccs.html
   [454]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18943/shard-dg2-10/igt@kms_ccs@crc-primary-rotation-180-y-tiled-ccs.html
   [455]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_171547v1/shard-dg2-10/igt@kms_ccs@crc-primary-rotation-180-y-tiled-ccs.html

  * igt@kms_ccs@crc-primary-suspend-4-tiled-lnl-ccs:
    - shard-dg2:          ([SKIP][456], [SKIP][457]) ([i915#12805] / [i915#16707]) -> [SKIP][458] ([i915#16707])
   [456]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18943/shard-dg2-8/igt@kms_ccs@crc-primary-suspend-4-tiled-lnl-ccs.html
   [457]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18943/shard-dg2-10/igt@kms_ccs@crc-primary-suspend-4-tiled-lnl-ccs.html
   [458]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_171547v1/shard-dg2-10/igt@kms_ccs@crc-primary-suspend-4-tiled-lnl-ccs.html

  * igt@kms_ccs@crc-primary-suspend-y-tiled-gen12-mc-ccs:
    - shard-dg2:          ([SKIP][459], [SKIP][460]) ([i915#16707] / [i915#6095]) -> [SKIP][461] ([i915#6095]) +2 other tests skip
   [459]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18943/shard-dg2-10/igt@kms_ccs@crc-primary-suspend-y-tiled-gen12-mc-ccs.html
   [460]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18943/shard-dg2-1/igt@kms_ccs@crc-primary-suspend-y-tiled-gen12-mc-ccs.html
   [461]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_171547v1/shard-dg2-1/igt@kms_ccs@crc-primary-suspend-y-tiled-gen12-mc-ccs.html

  * igt@kms_ccs@crc-sprite-planes-basic-4-tiled-lnl-ccs:
    - shard-rkl:          ([SKIP][462], [SKIP][463]) ([i915#12313]) -> [SKIP][464] ([i915#12313] / [i915#14544])
   [462]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18943/shard-rkl-8/igt@kms_ccs@crc-sprite-planes-basic-4-tiled-lnl-ccs.html
   [463]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18943/shard-rkl-7/igt@kms_ccs@crc-sprite-planes-basic-4-tiled-lnl-ccs.html
   [464]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_171547v1/shard-rkl-6/igt@kms_ccs@crc-sprite-planes-basic-4-tiled-lnl-ccs.html

  * igt@kms_ccs@random-ccs-data-4-tiled-dg2-mc-ccs@pipe-a-hdmi-a-2:
    - shard-rkl:          ([SKIP][465], [SKIP][466]) ([i915#14544] / [i915#6095]) -> [SKIP][467] ([i915#6095]) +7 other tests skip
   [465]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18943/shard-rkl-1/igt@kms_ccs@random-ccs-data-4-tiled-dg2-mc-ccs@pipe-a-hdmi-a-2.html
   [466]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18943/shard-rkl-6/igt@kms_ccs@random-ccs-data-4-tiled-dg2-mc-ccs@pipe-a-hdmi-a-2.html
   [467]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_171547v1/shard-rkl-4/igt@kms_ccs@random-ccs-data-4-tiled-dg2-mc-ccs@pipe-a-hdmi-a-2.html

  * igt@kms_ccs@random-ccs-data-4-tiled-dg2-mc-ccs@pipe-c-hdmi-a-2:
    - shard-rkl:          ([SKIP][468], [SKIP][469]) ([i915#14098] / [i915#14544] / [i915#6095]) -> [SKIP][470] ([i915#14098] / [i915#6095]) +11 other tests skip
   [468]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18943/shard-rkl-1/igt@kms_ccs@random-ccs-data-4-tiled-dg2-mc-ccs@pipe-c-hdmi-a-2.html
   [469]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18943/shard-rkl-6/igt@kms_ccs@random-ccs-data-4-tiled-dg2-mc-ccs@pipe-c-hdmi-a-2.html
   [470]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_171547v1/shard-rkl-4/igt@kms_ccs@random-ccs-data-4-tiled-dg2-mc-ccs@pipe-c-hdmi-a-2.html

  * igt@kms_ccs@random-ccs-data-4-tiled-lnl-ccs:
    - shard-rkl:          [SKIP][471] ([i915#12313]) -> [SKIP][472] ([i915#12313] / [i915#14544])
   [471]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18943/shard-rkl-1/igt@kms_ccs@random-ccs-data-4-tiled-lnl-ccs.html
   [472]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_171547v1/shard-rkl-6/igt@kms_ccs@random-ccs-data-4-tiled-lnl-ccs.html

  * igt@kms_ccs@random-ccs-data-4-tiled-mtl-rc-ccs:
    - shard-dg2:          ([SKIP][473], [SKIP][474]) ([i915#10307] / [i915#6095]) -> [SKIP][475] ([i915#16707]) +3 other tests skip
   [473]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18943/shard-dg2-5/igt@kms_ccs@random-ccs-data-4-tiled-mtl-rc-ccs.html
   [474]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18943/shard-dg2-6/igt@kms_ccs@random-ccs-data-4-tiled-mtl-rc-ccs.html
   [475]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_171547v1/shard-dg2-10/igt@kms_ccs@random-ccs-data-4-tiled-mtl-rc-ccs.html

  * igt@kms_ccs@random-ccs-data-y-tiled-gen12-rc-ccs-cc:
    - shard-dg2:          [SKIP][476] ([i915#10307] / [i915#6095]) -> [SKIP][477] ([i915#16707]) +1 other test skip
   [476]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18943/shard-dg2-8/igt@kms_ccs@random-ccs-data-y-tiled-gen12-rc-ccs-cc.html
   [477]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_171547v1/shard-dg2-10/igt@kms_ccs@random-ccs-data-y-tiled-gen12-rc-ccs-cc.html

  * igt@kms_cdclk@plane-scaling:
    - shard-dg2:          ([SKIP][478], [SKIP][479]) ([i915#13783] / [i915#16707]) -> [SKIP][480] ([i915#13783])
   [478]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18943/shard-dg2-6/igt@kms_cdclk@plane-scaling.html
   [479]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18943/shard-dg2-10/igt@kms_cdclk@plane-scaling.html
   [480]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_171547v1/shard-dg2-4/igt@kms_cdclk@plane-scaling.html

  * igt@kms_chamelium_color_pipeline@plane-lut1d-ctm3x4-lut1d:
    - shard-rkl:          ([SKIP][481], [SKIP][482]) ([i915#14544] / [i915#16471]) -> [SKIP][483] ([i915#16471]) +1 other test skip
   [481]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18943/shard-rkl-3/igt@kms_chamelium_color_pipeline@plane-lut1d-ctm3x4-lut1d.html
   [482]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18943/shard-rkl-6/igt@kms_chamelium_color_pipeline@plane-lut1d-ctm3x4-lut1d.html
   [483]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_171547v1/shard-rkl-8/igt@kms_chamelium_color_pipeline@plane-lut1d-ctm3x4-lut1d.html

  * igt@kms_chamelium_frames@hdmi-crc-single:
    - shard-rkl:          [SKIP][484] ([i915#11151] / [i915#7828]) -> [SKIP][485] ([i915#11151] / [i915#14544] / [i915#7828])
   [484]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18943/shard-rkl-1/igt@kms_chamelium_frames@hdmi-crc-single.html
   [485]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_171547v1/shard-rkl-6/igt@kms_chamelium_frames@hdmi-crc-single.html

  * igt@kms_chamelium_hpd@hdmi-hpd-storm-disable:
    - shard-rkl:          ([SKIP][486], [SKIP][487]) ([i915#11151] / [i915#14544] / [i915#7828]) -> [SKIP][488] ([i915#11151] / [i915#7828]) +5 other tests skip
   [486]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18943/shard-rkl-6/igt@kms_chamelium_hpd@hdmi-hpd-storm-disable.html
   [487]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18943/shard-rkl-1/igt@kms_chamelium_hpd@hdmi-hpd-storm-disable.html
   [488]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_171547v1/shard-rkl-4/igt@kms_chamelium_hpd@hdmi-hpd-storm-disable.html

  * igt@kms_chamelium_hpd@vga-hpd-for-each-pipe:
    - shard-rkl:          ([SKIP][489], [SKIP][490]) ([i915#11151] / [i915#7828]) -> [SKIP][491] ([i915#11151] / [i915#14544] / [i915#7828]) +2 other tests skip
   [489]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18943/shard-rkl-8/igt@kms_chamelium_hpd@vga-hpd-for-each-pipe.html
   [490]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18943/shard-rkl-7/igt@kms_chamelium_hpd@vga-hpd-for-each-pipe.html
   [491]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_171547v1/shard-rkl-6/igt@kms_chamelium_hpd@vga-hpd-for-each-pipe.html

  * igt@kms_color_pipeline@plane-lut1d:
    - shard-dg2:          ([PASS][492], [SKIP][493]) ([i915#15529]) -> [SKIP][494] ([i915#15529])
   [492]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18943/shard-dg2-8/igt@kms_color_pipeline@plane-lut1d.html
   [493]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18943/shard-dg2-10/igt@kms_color_pipeline@plane-lut1d.html
   [494]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_171547v1/shard-dg2-10/igt@kms_color_pipeline@plane-lut1d.html

  * igt@kms_content_protection@atomic:
    - shard-dg2:          ([SKIP][495], [SKIP][496]) ([i915#15865]) -> [SKIP][497] ([i915#16707])
   [495]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18943/shard-dg2-5/igt@kms_content_protection@atomic.html
   [496]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18943/shard-dg2-6/igt@kms_content_protection@atomic.html
   [497]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_171547v1/shard-dg2-10/igt@kms_content_protection@atomic.html

  * igt@kms_content_protection@atomic-hdcp14:
    - shard-rkl:          ([SKIP][498], [SKIP][499]) ([i915#15865]) -> [SKIP][500] ([i915#14544] / [i915#15865])
   [498]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18943/shard-rkl-7/igt@kms_content_protection@atomic-hdcp14.html
   [499]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18943/shard-rkl-8/igt@kms_content_protection@atomic-hdcp14.html
   [500]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_171547v1/shard-rkl-6/igt@kms_content_protection@atomic-hdcp14.html

  * igt@kms_content_protection@dp-mst-lic-type-1:
    - shard-rkl:          ([SKIP][501], [SKIP][502]) ([i915#14544] / [i915#15330] / [i915#3116]) -> [SKIP][503] ([i915#15330] / [i915#3116])
   [501]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18943/shard-rkl-3/igt@kms_content_protection@dp-mst-lic-type-1.html
   [502]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18943/shard-rkl-6/igt@kms_content_protection@dp-mst-lic-type-1.html
   [503]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_171547v1/shard-rkl-3/igt@kms_content_protection@dp-mst-lic-type-1.html

  * igt@kms_content_protection@dp-mst-type-0:
    - shard-dg2:          ([SKIP][504], [SKIP][505]) ([i915#15330] / [i915#3299]) -> [SKIP][506] ([i915#16707])
   [504]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18943/shard-dg2-1/igt@kms_content_protection@dp-mst-type-0.html
   [505]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18943/shard-dg2-6/igt@kms_content_protection@dp-mst-type-0.html
   [506]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_171547v1/shard-dg2-10/igt@kms_content_protection@dp-mst-type-0.html

  * igt@kms_content_protection@dp-mst-type-0-hdcp14:
    - shard-dg2:          ([SKIP][507], [SKIP][508]) ([i915#15330] / [i915#16707]) -> [SKIP][509] ([i915#15330]) +1 other test skip
   [507]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18943/shard-dg2-10/igt@kms_content_protection@dp-mst-type-0-hdcp14.html
   [508]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18943/shard-dg2-4/igt@kms_content_protection@dp-mst-type-0-hdcp14.html
   [509]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_171547v1/shard-dg2-1/igt@kms_content_protection@dp-mst-type-0-hdcp14.html

  * igt@kms_content_protection@dp-mst-type-1:
    - shard-dg2:          [SKIP][510] ([i915#15330] / [i915#3299]) -> [SKIP][511] ([i915#16707])
   [510]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18943/shard-dg2-8/igt@kms_content_protection@dp-mst-type-1.html
   [511]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_171547v1/shard-dg2-10/igt@kms_content_protection@dp-mst-type-1.html

  * igt@kms_content_protection@mei-interface:
    - shard-rkl:          [SKIP][512] ([i915#15865]) -> [SKIP][513] ([i915#14544] / [i915#15865])
   [512]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18943/shard-rkl-1/igt@kms_content_protection@mei-interface.html
   [513]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_171547v1/shard-rkl-6/igt@kms_content_protection@mei-interface.html
    - shard-dg1:          ([SKIP][514], [SKIP][515]) ([i915#15865] / [i915#9433]) -> [SKIP][516] ([i915#9433])
   [514]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18943/shard-dg1-19/igt@kms_content_protection@mei-interface.html
   [515]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18943/shard-dg1-13/igt@kms_content_protection@mei-interface.html
   [516]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_171547v1/shard-dg1-12/igt@kms_content_protection@mei-interface.html

  * igt@kms_content_protection@srm:
    - shard-dg2:          ([SKIP][517], [SKIP][518]) ([i915#15865] / [i915#16707]) -> [SKIP][519] ([i915#15865]) +5 other tests skip
   [517]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18943/shard-dg2-10/igt@kms_content_protection@srm.html
   [518]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18943/shard-dg2-3/igt@kms_content_protection@srm.html
   [519]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_171547v1/shard-dg2-6/igt@kms_content_protection@srm.html

  * igt@kms_content_protection@suspend-resume:
    - shard-dg2:          ([SKIP][520], [SKIP][521]) ([i915#15865] / [i915#16707]) -> [SKIP][522] ([i915#16707])
   [520]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18943/shard-dg2-10/igt@kms_content_protection@suspend-resume.html
   [521]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18943/shard-dg2-8/igt@kms_content_protection@suspend-resume.html
   [522]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_171547v1/shard-dg2-10/igt@kms_content_protection@suspend-resume.html
    - shard-rkl:          ([SKIP][523], [SKIP][524]) ([i915#14544] / [i915#15865]) -> [SKIP][525] ([i915#15865]) +1 other test skip
   [523]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18943/shard-rkl-6/igt@kms_content_protection@suspend-resume.html
   [524]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18943/shard-rkl-1/igt@kms_content_protection@suspend-resume.html
   [525]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_171547v1/shard-rkl-4/igt@kms_content_protection@suspend-resume.html

  * igt@kms_cursor_crc@cursor-onscreen-32x10:
    - shard-dg2:          ([SKIP][526], [SKIP][527]) ([i915#16707] / [i915#3555]) -> [SKIP][528] ([i915#16707])
   [526]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18943/shard-dg2-10/igt@kms_cursor_crc@cursor-onscreen-32x10.html
   [527]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18943/shard-dg2-8/igt@kms_cursor_crc@cursor-onscreen-32x10.html
   [528]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_171547v1/shard-dg2-10/igt@kms_cursor_crc@cursor-onscreen-32x10.html
    - shard-rkl:          ([SKIP][529], [SKIP][530]) ([i915#14544] / [i915#3555]) -> [SKIP][531] ([i915#3555])
   [529]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18943/shard-rkl-6/igt@kms_cursor_crc@cursor-onscreen-32x10.html
   [530]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18943/shard-rkl-1/igt@kms_cursor_crc@cursor-onscreen-32x10.html
   [531]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_171547v1/shard-rkl-4/igt@kms_cursor_crc@cursor-onscreen-32x10.html

  * igt@kms_cursor_crc@cursor-onscreen-512x512:
    - shard-dg2:          ([SKIP][532], [SKIP][533]) ([i915#13049] / [i915#16707]) -> [SKIP][534] ([i915#13049])
   [532]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18943/shard-dg2-6/igt@kms_cursor_crc@cursor-onscreen-512x512.html
   [533]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18943/shard-dg2-10/igt@kms_cursor_crc@cursor-onscreen-512x512.html
   [534]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_171547v1/shard-dg2-4/igt@kms_cursor_crc@cursor-onscreen-512x512.html
    - shard-rkl:          ([SKIP][535], [SKIP][536]) ([i915#13049]) -> [SKIP][537] ([i915#13049] / [i915#14544])
   [535]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18943/shard-rkl-8/igt@kms_cursor_crc@cursor-onscreen-512x512.html
   [536]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18943/shard-rkl-7/igt@kms_cursor_crc@cursor-onscreen-512x512.html
   [537]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_171547v1/shard-rkl-6/igt@kms_cursor_crc@cursor-onscreen-512x512.html

  * igt@kms_cursor_crc@cursor-onscreen-max-size:
    - shard-dg2:          ([SKIP][538], [SKIP][539]) ([i915#16707] / [i915#3555]) -> [SKIP][540] ([i915#3555]) +2 other tests skip
   [538]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18943/shard-dg2-10/igt@kms_cursor_crc@cursor-onscreen-max-size.html
   [539]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18943/shard-dg2-7/igt@kms_cursor_crc@cursor-onscreen-max-size.html
   [540]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_171547v1/shard-dg2-8/igt@kms_cursor_crc@cursor-onscreen-max-size.html

  * igt@kms_cursor_crc@cursor-random-512x170:
    - shard-dg2:          ([SKIP][541], [SKIP][542]) ([i915#13049]) -> [SKIP][543] ([i915#16707]) +1 other test skip
   [541]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18943/shard-dg2-6/igt@kms_cursor_crc@cursor-random-512x170.html
   [542]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18943/shard-dg2-1/igt@kms_cursor_crc@cursor-random-512x170.html
   [543]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_171547v1/shard-dg2-10/igt@kms_cursor_crc@cursor-random-512x170.html

  * igt@kms_cursor_crc@cursor-random-512x512:
    - shard-rkl:          [SKIP][544] ([i915#13049]) -> [SKIP][545] ([i915#13049] / [i915#14544])
   [544]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18943/shard-rkl-1/igt@kms_cursor_crc@cursor-random-512x512.html
   [545]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_171547v1/shard-rkl-6/igt@kms_cursor_crc@cursor-random-512x512.html

  * igt@kms_cursor_crc@cursor-sliding-512x170:
    - shard-dg2:          ([SKIP][546], [SKIP][547]) ([i915#13049] / [i915#16707]) -> [SKIP][548] ([i915#16707]) +1 other test skip
   [546]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18943/shard-dg2-8/igt@kms_cursor_crc@cursor-sliding-512x170.html
   [547]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18943/shard-dg2-10/igt@kms_cursor_crc@cursor-sliding-512x170.html
   [548]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_171547v1/shard-dg2-10/igt@kms_cursor_crc@cursor-sliding-512x170.html
    - shard-rkl:          ([SKIP][549], [SKIP][550]) ([i915#13049] / [i915#14544]) -> [SKIP][551] ([i915#13049])
   [549]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18943/shard-rkl-1/igt@kms_cursor_crc@cursor-sliding-512x170.html
   [550]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18943/shard-rkl-6/igt@kms_cursor_crc@cursor-sliding-512x170.html
   [551]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_171547v1/shard-rkl-4/igt@kms_cursor_crc@cursor-sliding-512x170.html

  * igt@kms_cursor_legacy@2x-flip-vs-cursor-legacy:
    - shard-rkl:          ([SKIP][552], [SKIP][553]) ([i915#14544]) -> [SKIP][554] +70 other tests skip
   [552]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18943/shard-rkl-6/igt@kms_cursor_legacy@2x-flip-vs-cursor-legacy.html
   [553]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18943/shard-rkl-1/igt@kms_cursor_legacy@2x-flip-vs-cursor-legacy.html
   [554]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_171547v1/shard-rkl-4/igt@kms_cursor_legacy@2x-flip-vs-cursor-legacy.html

  * igt@kms_cursor_legacy@basic-busy-flip-before-cursor-atomic:
    - shard-dg2:          ([SKIP][555], [SKIP][556]) ([i915#11190] / [i915#16707] / [i915#4103]) -> [SKIP][557] ([i915#4103])
   [555]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18943/shard-dg2-10/igt@kms_cursor_legacy@basic-busy-flip-before-cursor-atomic.html
   [556]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18943/shard-dg2-4/igt@kms_cursor_legacy@basic-busy-flip-before-cursor-atomic.html
   [557]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_171547v1/shard-dg2-4/igt@kms_cursor_legacy@basic-busy-flip-before-cursor-atomic.html

  * igt@kms_cursor_legacy@basic-busy-flip-before-cursor-varying-size:
    - shard-rkl:          ([SKIP][558], [SKIP][559]) ([i915#4103]) -> [SKIP][560] ([i915#14544] / [i915#4103])
   [558]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18943/shard-rkl-7/igt@kms_cursor_legacy@basic-busy-flip-before-cursor-varying-size.html
   [559]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18943/shard-rkl-8/igt@kms_cursor_legacy@basic-busy-flip-before-cursor-varying-size.html
   [560]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_171547v1/shard-rkl-6/igt@kms_cursor_legacy@basic-busy-flip-before-cursor-varying-size.html

  * igt@kms_cursor_legacy@basic-flip-after-cursor-varying-size:
    - shard-dg2:          ([SKIP][561], [PASS][562]) ([i915#11190] / [i915#16707]) -> [SKIP][563] ([i915#11190] / [i915#16707])
   [561]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18943/shard-dg2-10/igt@kms_cursor_legacy@basic-flip-after-cursor-varying-size.html
   [562]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18943/shard-dg2-8/igt@kms_cursor_legacy@basic-flip-after-cursor-varying-size.html
   [563]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_171547v1/shard-dg2-10/igt@kms_cursor_legacy@basic-flip-after-cursor-varying-size.html

  * igt@kms_cursor_legacy@cursora-vs-flipb-legacy:
    - shard-dg1:          ([SKIP][564], [SKIP][565]) -> [SKIP][566] ([i915#4423]) +2 other tests skip
   [564]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18943/shard-dg1-14/igt@kms_cursor_legacy@cursora-vs-flipb-legacy.html
   [565]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18943/shard-dg1-19/igt@kms_cursor_legacy@cursora-vs-flipb-legacy.html
   [566]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_171547v1/shard-dg1-16/igt@kms_cursor_legacy@cursora-vs-flipb-legacy.html

  * igt@kms_cursor_legacy@cursorb-vs-flipb-atomic:
    - shard-dg2:          ([SKIP][567], [SKIP][568]) ([i915#13046] / [i915#5354]) -> [SKIP][569] ([i915#16707]) +3 other tests skip
   [567]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18943/shard-dg2-6/igt@kms_cursor_legacy@cursorb-vs-flipb-atomic.html
   [568]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18943/shard-dg2-5/igt@kms_cursor_legacy@cursorb-vs-flipb-atomic.html
   [569]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_171547v1/shard-dg2-10/igt@kms_cursor_legacy@cursorb-vs-flipb-atomic.html

  * igt@kms_cursor_legacy@cursorb-vs-flipb-legacy:
    - shard-dg2:          ([SKIP][570], [SKIP][571]) ([i915#13046] / [i915#16707] / [i915#5354]) -> [SKIP][572] ([i915#16707]) +3 other tests skip
   [570]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18943/shard-dg2-10/igt@kms_cursor_legacy@cursorb-vs-flipb-legacy.html
   [571]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18943/shard-dg2-8/igt@kms_cursor_legacy@cursorb-vs-flipb-legacy.html
   [572]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_171547v1/shard-dg2-10/igt@kms_cursor_legacy@cursorb-vs-flipb-legacy.html

  * igt@kms_cursor_legacy@cursorb-vs-flipb-toggle:
    - shard-dg2:          ([SKIP][573], [SKIP][574]) ([i915#13046] / [i915#16707] / [i915#5354]) -> [SKIP][575] ([i915#13046] / [i915#5354]) +3 other tests skip
   [573]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18943/shard-dg2-3/igt@kms_cursor_legacy@cursorb-vs-flipb-toggle.html
   [574]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18943/shard-dg2-10/igt@kms_cursor_legacy@cursorb-vs-flipb-toggle.html
   [575]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_171547v1/shard-dg2-6/igt@kms_cursor_legacy@cursorb-vs-flipb-toggle.html

  * igt@kms_cursor_legacy@short-busy-flip-before-cursor-atomic-transitions-varying-size:
    - shard-dg2:          ([SKIP][576], [SKIP][577]) ([i915#16707] / [i915#4103]) -> [SKIP][578] ([i915#16707])
   [576]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18943/shard-dg2-10/igt@kms_cursor_legacy@short-busy-flip-before-cursor-atomic-transitions-varying-size.html
   [577]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18943/shard-dg2-8/igt@kms_cursor_legacy@short-busy-flip-before-cursor-atomic-transitions-varying-size.html
   [578]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_171547v1/shard-dg2-10/igt@kms_cursor_legacy@short-busy-flip-before-cursor-atomic-transitions-varying-size.html

  * igt@kms_cursor_legacy@short-busy-flip-before-cursor-toggle:
    - shard-dg2:          ([SKIP][579], [SKIP][580]) ([i915#16707] / [i915#4103]) -> [SKIP][581] ([i915#4103]) +1 other test skip
   [579]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18943/shard-dg2-10/igt@kms_cursor_legacy@short-busy-flip-before-cursor-toggle.html
   [580]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18943/shard-dg2-1/igt@kms_cursor_legacy@short-busy-flip-before-cursor-toggle.html
   [581]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_171547v1/shard-dg2-1/igt@kms_cursor_legacy@short-busy-flip-before-cursor-toggle.html
    - shard-rkl:          ([SKIP][582], [SKIP][583]) ([i915#14544] / [i915#4103]) -> [SKIP][584] ([i915#4103])
   [582]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18943/shard-rkl-6/igt@kms_cursor_legacy@short-busy-flip-before-cursor-toggle.html
   [583]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18943/shard-rkl-3/igt@kms_cursor_legacy@short-busy-flip-before-cursor-toggle.html
   [584]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_171547v1/shard-rkl-5/igt@kms_cursor_legacy@short-busy-flip-before-cursor-toggle.html

  * igt@kms_dirtyfb@drrs-dirtyfb-ioctl:
    - shard-dg2:          [SKIP][585] ([i915#9833]) -> [SKIP][586] ([i915#16707])
   [585]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18943/shard-dg2-8/igt@kms_dirtyfb@drrs-dirtyfb-ioctl.html
   [586]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_171547v1/shard-dg2-10/igt@kms_dirtyfb@drrs-dirtyfb-ioctl.html

  * igt@kms_dp_aux_dev@basic:
    - shard-rkl:          ([SKIP][587], [SKIP][588]) ([i915#1257]) -> [SKIP][589] ([i915#1257] / [i915#14544])
   [587]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18943/shard-rkl-8/igt@kms_dp_aux_dev@basic.html
   [588]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18943/shard-rkl-7/igt@kms_dp_aux_dev@basic.html
   [589]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_171547v1/shard-rkl-6/igt@kms_dp_aux_dev@basic.html

  * igt@kms_dp_link_training@non-uhbr-mst:
    - shard-dg2:          ([SKIP][590], [SKIP][591]) ([i915#13749] / [i915#16707]) -> [SKIP][592] ([i915#16707])
   [590]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18943/shard-dg2-8/igt@kms_dp_link_training@non-uhbr-mst.html
   [591]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18943/shard-dg2-10/igt@kms_dp_link_training@non-uhbr-mst.html
   [592]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_171547v1/shard-dg2-10/igt@kms_dp_link_training@non-uhbr-mst.html

  * igt@kms_dp_link_training@non-uhbr-sst:
    - shard-rkl:          [SKIP][593] ([i915#13749]) -> [SKIP][594] ([i915#13749] / [i915#14544])
   [593]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18943/shard-rkl-1/igt@kms_dp_link_training@non-uhbr-sst.html
   [594]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_171547v1/shard-rkl-6/igt@kms_dp_link_training@non-uhbr-sst.html

  * igt@kms_dp_link_training@uhbr-sst:
    - shard-rkl:          ([SKIP][595], [SKIP][596]) ([i915#13748] / [i915#14544]) -> [SKIP][597] ([i915#13748])
   [595]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18943/shard-rkl-6/igt@kms_dp_link_training@uhbr-sst.html
   [596]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18943/shard-rkl-3/igt@kms_dp_link_training@uhbr-sst.html
   [597]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_171547v1/shard-rkl-5/igt@kms_dp_link_training@uhbr-sst.html
    - shard-dg2:          ([SKIP][598], [SKIP][599]) ([i915#13748] / [i915#16707]) -> [SKIP][600] ([i915#13748])
   [598]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18943/shard-dg2-10/igt@kms_dp_link_training@uhbr-sst.html
   [599]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18943/shard-dg2-1/igt@kms_dp_link_training@uhbr-sst.html
   [600]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_171547v1/shard-dg2-1/igt@kms_dp_link_training@uhbr-sst.html

  * igt@kms_dp_linktrain_fallback@dsc-fallback:
    - shard-dg2:          ([SKIP][601], [SKIP][602]) ([i915#13707]) -> [SKIP][603] ([i915#16707])
   [601]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18943/shard-dg2-6/igt@kms_dp_linktrain_fallback@dsc-fallback.html
   [602]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18943/shard-dg2-1/igt@kms_dp_linktrain_fallback@dsc-fallback.html
   [603]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_171547v1/shard-dg2-10/igt@kms_dp_linktrain_fallback@dsc-fallback.html

  * igt@kms_dsc@dsc-with-bpc-formats:
    - shard-dg2:          ([SKIP][604], [SKIP][605]) ([i915#16361] / [i915#16707]) -> [SKIP][606] ([i915#16361]) +4 other tests skip
   [604]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18943/shard-dg2-10/igt@kms_dsc@dsc-with-bpc-formats.html
   [605]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18943/shard-dg2-4/igt@kms_dsc@dsc-with-bpc-formats.html
   [606]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_171547v1/shard-dg2-1/igt@kms_dsc@dsc-with-bpc-formats.html

  * igt@kms_dsc@dsc-with-bpc-ultrajoiner:
    - shard-dg2:          ([SKIP][607], [SKIP][608]) ([i915#16361]) -> [SKIP][609] ([i915#16707]) +1 other test skip
   [607]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18943/shard-dg2-5/igt@kms_dsc@dsc-with-bpc-ultrajoiner.html
   [608]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18943/shard-dg2-6/igt@kms_dsc@dsc-with-bpc-ultrajoiner.html
   [609]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_171547v1/shard-dg2-10/igt@kms_dsc@dsc-with-bpc-ultrajoiner.html

  * igt@kms_dsc@dsc-with-formats-bigjoiner:
    - shard-rkl:          ([SKIP][610], [SKIP][611]) ([i915#16361]) -> [SKIP][612] ([i915#14544] / [i915#16361])
   [610]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18943/shard-rkl-7/igt@kms_dsc@dsc-with-formats-bigjoiner.html
   [611]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18943/shard-rkl-8/igt@kms_dsc@dsc-with-formats-bigjoiner.html
   [612]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_171547v1/shard-rkl-6/igt@kms_dsc@dsc-with-formats-bigjoiner.html

  * igt@kms_dsc@dsc-with-output-formats:
    - shard-dg2:          ([SKIP][613], [SKIP][614]) ([i915#16361] / [i915#16707]) -> [SKIP][615] ([i915#16707]) +2 other tests skip
   [613]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18943/shard-dg2-10/igt@kms_dsc@dsc-with-output-formats.html
   [614]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18943/shard-dg2-8/igt@kms_dsc@dsc-with-output-formats.html
   [615]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_171547v1/shard-dg2-10/igt@kms_dsc@dsc-with-output-formats.html

  * igt@kms_dsc@dsc-with-output-formats-ultrajoiner:
    - shard-dg1:          ([SKIP][616], [SKIP][617]) ([i915#16361]) -> [SKIP][618] ([i915#16361] / [i915#4423])
   [616]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18943/shard-dg1-16/igt@kms_dsc@dsc-with-output-formats-ultrajoiner.html
   [617]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18943/shard-dg1-18/igt@kms_dsc@dsc-with-output-formats-ultrajoiner.html
   [618]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_171547v1/shard-dg1-18/igt@kms_dsc@dsc-with-output-formats-ultrajoiner.html

  * igt@kms_dsc@dsc-with-output-formats-with-bpc:
    - shard-rkl:          ([SKIP][619], [SKIP][620]) ([i915#14544] / [i915#16361]) -> [SKIP][621] ([i915#16361]) +1 other test skip
   [619]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18943/shard-rkl-6/igt@kms_dsc@dsc-with-output-formats-with-bpc.html
   [620]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18943/shard-rkl-1/igt@kms_dsc@dsc-with-output-formats-with-bpc.html
   [621]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_171547v1/shard-rkl-4/igt@kms_dsc@dsc-with-output-formats-with-bpc.html

  * igt@kms_dsc@dsc-with-output-formats-with-bpc-bigjoiner:
    - shard-dg2:          [SKIP][622] ([i915#16361]) -> [SKIP][623] ([i915#16707])
   [622]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18943/shard-dg2-8/igt@kms_dsc@dsc-with-output-formats-with-bpc-bigjoiner.html
   [623]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_171547v1/shard-dg2-10/igt@kms_dsc@dsc-with-output-formats-with-bpc-bigjoiner.html

  * igt@kms_fbcon_fbt@fbc:
    - shard-dg2:          ([SKIP][624], [PASS][625]) ([i915#1849]) -> [SKIP][626] ([i915#1849])
   [624]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18943/shard-dg2-10/igt@kms_fbcon_fbt@fbc.html
   [625]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18943/shard-dg2-8/igt@kms_fbcon_fbt@fbc.html
   [626]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_171547v1/shard-dg2-10/igt@kms_fbcon_fbt@fbc.html

  * igt@kms_feature_discovery@display-4x:
    - shard-rkl:          ([SKIP][627], [SKIP][628]) ([i915#14544] / [i915#16081]) -> [SKIP][629] ([i915#16081])
   [627]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18943/shard-rkl-3/igt@kms_feature_discovery@display-4x.html
   [628]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18943/shard-rkl-6/igt@kms_feature_discovery@display-4x.html
   [629]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_171547v1/shard-rkl-3/igt@kms_feature_discovery@display-4x.html

  * igt@kms_feature_discovery@vrr:
    - shard-rkl:          ([SKIP][630], [SKIP][631]) ([i915#14544] / [i915#16600]) -> [SKIP][632] ([i915#16600])
   [630]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18943/shard-rkl-3/igt@kms_feature_discovery@vrr.html
   [631]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18943/shard-rkl-6/igt@kms_feature_discovery@vrr.html
   [632]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_171547v1/shard-rkl-5/igt@kms_feature_discovery@vrr.html

  * igt@kms_flip@2x-dpms-vs-vblank-race:
    - shard-rkl:          ([SKIP][633], [SKIP][634]) ([i915#14544] / [i915#9934]) -> [SKIP][635] ([i915#9934]) +6 other tests skip
   [633]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18943/shard-rkl-6/igt@kms_flip@2x-dpms-vs-vblank-race.html
   [634]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18943/shard-rkl-3/igt@kms_flip@2x-dpms-vs-vblank-race.html
   [635]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_171547v1/shard-rkl-8/igt@kms_flip@2x-dpms-vs-vblank-race.html

  * igt@kms_flip@2x-flip-vs-suspend-interruptible:
    - shard-glk:          [INCOMPLETE][636] ([i915#12745] / [i915#4839]) -> [INCOMPLETE][637] ([i915#12314] / [i915#12745] / [i915#4839])
   [636]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18943/shard-glk1/igt@kms_flip@2x-flip-vs-suspend-interruptible.html
   [637]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_171547v1/shard-glk8/igt@kms_flip@2x-flip-vs-suspend-interruptible.html

  * igt@kms_flip@2x-flip-vs-suspend-interruptible@ac-hdmi-a1-hdmi-a2:
    - shard-glk:          [INCOMPLETE][638] ([i915#12745]) -> [INCOMPLETE][639] ([i915#12314] / [i915#12745])
   [638]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18943/shard-glk1/igt@kms_flip@2x-flip-vs-suspend-interruptible@ac-hdmi-a1-hdmi-a2.html
   [639]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_171547v1/shard-glk8/igt@kms_flip@2x-flip-vs-suspend-interruptible@ac-hdmi-a1-hdmi-a2.html

  * igt@kms_flip@2x-single-buffer-flip-vs-dpms-off-vs-modeset-interruptible:
    - shard-rkl:          ([SKIP][640], [SKIP][641]) ([i915#9934]) -> [SKIP][642] ([i915#14544] / [i915#9934])
   [640]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18943/shard-rkl-8/igt@kms_flip@2x-single-buffer-flip-vs-dpms-off-vs-modeset-interruptible.html
   [641]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18943/shard-rkl-7/igt@kms_flip@2x-single-buffer-flip-vs-dpms-off-vs-modeset-interruptible.html
   [642]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_171547v1/shard-rkl-6/igt@kms_flip@2x-single-buffer-flip-vs-dpms-off-vs-modeset-interruptible.html

  * igt@kms_flip@flip-vs-dpms-off-vs-modeset:
    - shard-dg2:          ([SKIP][643], [PASS][644]) ([i915#5354]) -> [SKIP][645] ([i915#5354])
   [643]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18943/shard-dg2-10/igt@kms_flip@flip-vs-dpms-off-vs-modeset.html
   [644]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18943/shard-dg2-8/igt@kms_flip@flip-vs-dpms-off-vs-modeset.html
   [645]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_171547v1/shard-dg2-10/igt@kms_flip@flip-vs-dpms-off-vs-modeset.html

  * igt@kms_flip@flip-vs-suspend:
    - shard-glk:          [INCOMPLETE][646] ([i915#12745] / [i915#4839] / [i915#6113]) -> [INCOMPLETE][647] ([i915#12314] / [i915#12745] / [i915#4839] / [i915#6113])
   [646]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18943/shard-glk3/igt@kms_flip@flip-vs-suspend.html
   [647]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_171547v1/shard-glk5/igt@kms_flip@flip-vs-suspend.html

  * igt@kms_flip@flip-vs-suspend@a-hdmi-a1:
    - shard-glk:          [INCOMPLETE][648] ([i915#12745] / [i915#6113]) -> [INCOMPLETE][649] ([i915#12314] / [i915#12745] / [i915#6113])
   [648]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18943/shard-glk3/igt@kms_flip@flip-vs-suspend@a-hdmi-a1.html
   [649]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_171547v1/shard-glk5/igt@kms_flip@flip-vs-suspend@a-hdmi-a1.html

  * igt@kms_flip_scaled_crc@flip-32bpp-yftile-to-64bpp-yftile-downscaling:
    - shard-rkl:          ([SKIP][650], [SKIP][651]) ([i915#15643]) -> [SKIP][652] ([i915#14544] / [i915#15643])
   [650]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18943/shard-rkl-7/igt@kms_flip_scaled_crc@flip-32bpp-yftile-to-64bpp-yftile-downscaling.html
   [651]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18943/shard-rkl-8/igt@kms_flip_scaled_crc@flip-32bpp-yftile-to-64bpp-yftile-downscaling.html
   [652]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_171547v1/shard-rkl-6/igt@kms_flip_scaled_crc@flip-32bpp-yftile-to-64bpp-yftile-downscaling.html

  * igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-32bpp-4tiledg2rcccs-upscaling:
    - shard-dg2:          ([SKIP][653], [PASS][654]) ([i915#3555] / [i915#8813]) -> [SKIP][655] ([i915#3555] / [i915#8813]) +3 other tests skip
   [653]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18943/shard-dg2-10/igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-32bpp-4tiledg2rcccs-upscaling.html
   [654]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18943/shard-dg2-8/igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-32bpp-4tiledg2rcccs-upscaling.html
   [655]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_171547v1/shard-dg2-10/igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-32bpp-4tiledg2rcccs-upscaling.html

  * igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-32bpp-yftile-downscaling:
    - shard-rkl:          ([SKIP][656], [SKIP][657]) ([i915#14544] / [i915#15643]) -> [SKIP][658] ([i915#15643]) +2 other tests skip
   [656]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18943/shard-rkl-6/igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-32bpp-yftile-downscaling.html
   [657]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18943/shard-rkl-3/igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-32bpp-yftile-downscaling.html
   [658]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_171547v1/shard-rkl-8/igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-32bpp-yftile-downscaling.html

  * igt@kms_frontbuffer_tracking@fbc-1p-offscreen-pri-shrfb-draw-mmap-wc:
    - shard-dg2:          ([SKIP][659], [SKIP][660]) ([i915#15104] / [i915#15990] / [i915#16708]) -> [SKIP][661] ([i915#16708])
   [659]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18943/shard-dg2-8/igt@kms_frontbuffer_tracking@fbc-1p-offscreen-pri-shrfb-draw-mmap-wc.html
   [660]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18943/shard-dg2-10/igt@kms_frontbuffer_tracking@fbc-1p-offscreen-pri-shrfb-draw-mmap-wc.html
   [661]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_171547v1/shard-dg2-10/igt@kms_frontbuffer_tracking@fbc-1p-offscreen-pri-shrfb-draw-mmap-wc.html

  * igt@kms_frontbuffer_tracking@fbc-1p-primscrn-pri-indfb-draw-render:
    - shard-dg2:          ([PASS][662], [SKIP][663]) ([i915#16708] / [i915#5354]) -> [SKIP][664] ([i915#16708] / [i915#5354]) +2 other tests skip
   [662]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18943/shard-dg2-8/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-pri-indfb-draw-render.html
   [663]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18943/shard-dg2-10/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-pri-indfb-draw-render.html
   [664]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_171547v1/shard-dg2-10/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-pri-indfb-draw-render.html

  * igt@kms_frontbuffer_tracking@fbc-1p-primscrn-pri-shrfb-draw-mmap-wc:
    - shard-dg2:          ([SKIP][665], [SKIP][666]) ([i915#15990] / [i915#8708]) -> [SKIP][667] ([i915#16708] / [i915#5354]) +5 other tests skip
   [665]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18943/shard-dg2-6/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-pri-shrfb-draw-mmap-wc.html
   [666]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18943/shard-dg2-5/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-pri-shrfb-draw-mmap-wc.html
   [667]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_171547v1/shard-dg2-10/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-pri-shrfb-draw-mmap-wc.html

  * igt@kms_frontbuffer_tracking@fbc-2p-primscrn-cur-indfb-draw-mmap-wc:
    - shard-dg2:          ([SKIP][668], [SKIP][669]) ([i915#15990] / [i915#16708] / [i915#5354] / [i915#8708]) -> [SKIP][670] ([i915#15990] / [i915#8708]) +18 other tests skip
   [668]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18943/shard-dg2-4/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-cur-indfb-draw-mmap-wc.html
   [669]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18943/shard-dg2-10/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-cur-indfb-draw-mmap-wc.html
   [670]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_171547v1/shard-dg2-1/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-cur-indfb-draw-mmap-wc.html

  * igt@kms_frontbuffer_tracking@fbc-2p-primscrn-pri-indfb-draw-mmap-wc:
    - shard-rkl:          ([SKIP][671], [SKIP][672]) ([i915#14544] / [i915#1825]) -> [SKIP][673] ([i915#1825]) +1 other test skip
   [671]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18943/shard-rkl-1/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-pri-indfb-draw-mmap-wc.html
   [672]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18943/shard-rkl-6/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-pri-indfb-draw-mmap-wc.html
   [673]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_171547v1/shard-rkl-4/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-pri-indfb-draw-mmap-wc.html

  * igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-indfb-draw-mmap-wc:
    - shard-rkl:          [SKIP][674] ([i915#1825]) -> [SKIP][675] ([i915#14544] / [i915#1825]) +2 other tests skip
   [674]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18943/shard-rkl-1/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-indfb-draw-mmap-wc.html
   [675]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_171547v1/shard-rkl-6/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-indfb-draw-mmap-wc.html

  * igt@kms_frontbuffer_tracking@fbchdr-1p-offscreen-pri-shrfb-draw-mmap-wc:
    - shard-dg2:          ([SKIP][676], [SKIP][677]) ([i915#15990]) -> [SKIP][678] ([i915#16708]) +7 other tests skip
   [676]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18943/shard-dg2-5/igt@kms_frontbuffer_tracking@fbchdr-1p-offscreen-pri-shrfb-draw-mmap-wc.html
   [677]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18943/shard-dg2-6/igt@kms_frontbuffer_tracking@fbchdr-1p-offscreen-pri-shrfb-draw-mmap-wc.html
   [678]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_171547v1/shard-dg2-10/igt@kms_frontbuffer_tracking@fbchdr-1p-offscreen-pri-shrfb-draw-mmap-wc.html

  * igt@kms_frontbuffer_tracking@fbchdr-1p-primscrn-cur-indfb-onoff:
    - shard-rkl:          ([SKIP][679], [PASS][680]) ([i915#15989]) -> [SKIP][681] ([i915#15989]) +13 other tests skip
   [679]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18943/shard-rkl-3/igt@kms_frontbuffer_tracking@fbchdr-1p-primscrn-cur-indfb-onoff.html
   [680]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18943/shard-rkl-6/igt@kms_frontbuffer_tracking@fbchdr-1p-primscrn-cur-indfb-onoff.html
   [681]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_171547v1/shard-rkl-5/igt@kms_frontbuffer_tracking@fbchdr-1p-primscrn-cur-indfb-onoff.html

  * igt@kms_frontbuffer_tracking@fbchdr-2p-primscrn-spr-indfb-draw-mmap-wc:
    - shard-dg2:          [SKIP][682] ([i915#15990]) -> [SKIP][683] ([i915#16708]) +1 other test skip
   [682]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18943/shard-dg2-8/igt@kms_frontbuffer_tracking@fbchdr-2p-primscrn-spr-indfb-draw-mmap-wc.html
   [683]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_171547v1/shard-dg2-10/igt@kms_frontbuffer_tracking@fbchdr-2p-primscrn-spr-indfb-draw-mmap-wc.html

  * igt@kms_frontbuffer_tracking@fbchdr-2p-scndscrn-spr-indfb-draw-mmap-cpu:
    - shard-dg2:          ([SKIP][684], [SKIP][685]) ([i915#15991]) -> [SKIP][686] ([i915#16708]) +18 other tests skip
   [684]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18943/shard-dg2-1/igt@kms_frontbuffer_tracking@fbchdr-2p-scndscrn-spr-indfb-draw-mmap-cpu.html
   [685]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18943/shard-dg2-6/igt@kms_frontbuffer_tracking@fbchdr-2p-scndscrn-spr-indfb-draw-mmap-cpu.html
   [686]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_171547v1/shard-dg2-10/igt@kms_frontbuffer_tracking@fbchdr-2p-scndscrn-spr-indfb-draw-mmap-cpu.html

  * igt@kms_frontbuffer_tracking@fbchdr-2p-scndscrn-spr-indfb-draw-render:
    - shard-rkl:          ([SKIP][687], [SKIP][688]) -> [SKIP][689] ([i915#14544]) +15 other tests skip
   [687]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18943/shard-rkl-8/igt@kms_frontbuffer_tracking@fbchdr-2p-scndscrn-spr-indfb-draw-render.html
   [688]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18943/shard-rkl-7/igt@kms_frontbuffer_tracking@fbchdr-2p-scndscrn-spr-indfb-draw-render.html
   [689]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_171547v1/shard-rkl-6/igt@kms_frontbuffer_tracking@fbchdr-2p-scndscrn-spr-indfb-draw-render.html

  * igt@kms_frontbuffer_tracking@fbchdr-rgb565-draw-mmap-cpu:
    - shard-dg2:          [SKIP][690] ([i915#15989]) -> [SKIP][691] ([i915#16708]) +4 other tests skip
   [690]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18943/shard-dg2-8/igt@kms_frontbuffer_tracking@fbchdr-rgb565-draw-mmap-cpu.html
   [691]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_171547v1/shard-dg2-10/igt@kms_frontbuffer_tracking@fbchdr-rgb565-draw-mmap-cpu.html

  * igt@kms_frontbuffer_tracking@fbcpsr-1p-offscreen-pri-shrfb-draw-blt:
    - shard-dg2:          ([SKIP][692], [SKIP][693]) ([i915#15102] / [i915#16708]) -> [SKIP][694] ([i915#15102]) +26 other tests skip
   [692]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18943/shard-dg2-4/igt@kms_frontbuffer_tracking@fbcpsr-1p-offscreen-pri-shrfb-draw-blt.html
   [693]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18943/shard-dg2-10/igt@kms_frontbuffer_tracking@fbcpsr-1p-offscreen-pri-shrfb-draw-blt.html
   [694]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_171547v1/shard-dg2-4/igt@kms_frontbuffer_tracking@fbcpsr-1p-offscreen-pri-shrfb-draw-blt.html

  * igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-cur-indfb-draw-mmap-cpu:
    - shard-dg2:          ([SKIP][695], [SKIP][696]) ([i915#15102] / [i915#16708] / [i915#5354]) -> [SKIP][697] ([i915#15102]) +19 other tests skip
   [695]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18943/shard-dg2-4/igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-cur-indfb-draw-mmap-cpu.html
   [696]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18943/shard-dg2-10/igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-cur-indfb-draw-mmap-cpu.html
   [697]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_171547v1/shard-dg2-1/igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-cur-indfb-draw-mmap-cpu.html
    - shard-dg1:          ([SKIP][698], [SKIP][699]) ([i915#15102] / [i915#4423]) -> [SKIP][700] ([i915#15102])
   [698]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18943/shard-dg1-19/igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-cur-indfb-draw-mmap-cpu.html
   [699]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18943/shard-dg1-13/igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-cur-indfb-draw-mmap-cpu.html
   [700]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_171547v1/shard-dg1-12/igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-cur-indfb-draw-mmap-cpu.html

  * igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-indfb-plflip-blt:
    - shard-dg2:          ([SKIP][701], [SKIP][702]) ([i915#15102]) -> [SKIP][703] ([i915#10433] / [i915#15102])
   [701]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18943/shard-dg2-6/igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-indfb-plflip-blt.html
   [702]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18943/shard-dg2-1/igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-indfb-plflip-blt.html
   [703]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_171547v1/shard-dg2-4/igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-indfb-plflip-blt.html

  * igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-pri-shrfb-draw-mmap-cpu:
    - shard-dg2:          ([SKIP][704], [SKIP][705]) ([i915#15102]) -> [SKIP][706] ([i915#16708] / [i915#5354]) +5 other tests skip
   [704]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18943/shard-dg2-6/igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-pri-shrfb-draw-mmap-cpu.html
   [705]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18943/shard-dg2-5/igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-pri-shrfb-draw-mmap-cpu.html
   [706]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_171547v1/shard-dg2-10/igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-pri-shrfb-draw-mmap-cpu.html

  * igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-pri-shrfb-draw-mmap-gtt:
    - shard-dg2:          ([SKIP][707], [SKIP][708]) ([i915#15990] / [i915#16708] / [i915#5354] / [i915#8708]) -> [SKIP][709] ([i915#16708] / [i915#5354]) +3 other tests skip
   [707]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18943/shard-dg2-8/igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-pri-shrfb-draw-mmap-gtt.html
   [708]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18943/shard-dg2-10/igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-pri-shrfb-draw-mmap-gtt.html
   [709]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_171547v1/shard-dg2-10/igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-pri-shrfb-draw-mmap-gtt.html

  * igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-spr-indfb-draw-blt:
    - shard-dg2:          ([SKIP][710], [SKIP][711]) ([i915#15102] / [i915#16708] / [i915#5354]) -> [SKIP][712] ([i915#10433] / [i915#15102])
   [710]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18943/shard-dg2-6/igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-spr-indfb-draw-blt.html
   [711]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18943/shard-dg2-10/igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-spr-indfb-draw-blt.html
   [712]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_171547v1/shard-dg2-4/igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-spr-indfb-draw-blt.html
    - shard-rkl:          ([SKIP][713], [SKIP][714]) ([i915#15102] / [i915#3023]) -> [SKIP][715] ([i915#14544] / [i915#15102] / [i915#3023]) +3 other tests skip
   [713]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18943/shard-rkl-7/igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-spr-indfb-draw-blt.html
   [714]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18943/shard-rkl-8/igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-spr-indfb-draw-blt.html
   [715]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_171547v1/shard-rkl-6/igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-spr-indfb-draw-blt.html

  * igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-cur-indfb-move:
    - shard-dg2:          ([SKIP][716], [SKIP][717]) ([i915#15991] / [i915#16708] / [i915#5354]) -> [SKIP][718] ([i915#16708] / [i915#5354]) +10 other tests skip
   [716]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18943/shard-dg2-8/igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-cur-indfb-move.html
   [717]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18943/shard-dg2-10/igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-cur-indfb-move.html
   [718]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_171547v1/shard-dg2-10/igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-cur-indfb-move.html

  * igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-pri-shrfb-draw-mmap-cpu:
    - shard-dg2:          [SKIP][719] ([i915#15991] / [i915#5354]) -> [SKIP][720] ([i915#16708] / [i915#5354]) +3 other tests skip
   [719]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18943/shard-dg2-8/igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-pri-shrfb-draw-mmap-cpu.html
   [720]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_171547v1/shard-dg2-10/igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-pri-shrfb-draw-mmap-cpu.html

  * igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-spr-indfb-draw-mmap-gtt:
    - shard-dg2:          [SKIP][721] ([i915#15990] / [i915#8708]) -> [SKIP][722] ([i915#16708] / [i915#5354]) +2 other tests skip
   [721]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18943/shard-dg2-8/igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-spr-indfb-draw-mmap-gtt.html
   [722]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_171547v1/shard-dg2-10/igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-spr-indfb-draw-mmap-gtt.html

  * igt@kms_frontbuffer_tracking@fbcpsr-rgb101010-draw-pwrite:
    - shard-dg2:          ([SKIP][723], [SKIP][724]) ([i915#10433] / [i915#15102] / [i915#16708] / [i915#5354]) -> [SKIP][725] ([i915#10433] / [i915#15102])
   [723]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18943/shard-dg2-10/igt@kms_frontbuffer_tracking@fbcpsr-rgb101010-draw-pwrite.html
   [724]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18943/shard-dg2-4/igt@kms_frontbuffer_tracking@fbcpsr-rgb101010-draw-pwrite.html
   [725]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_171547v1/shard-dg2-4/igt@kms_frontbuffer_tracking@fbcpsr-rgb101010-draw-pwrite.html

  * igt@kms_frontbuffer_tracking@fbcpsr-tiling-y:
    - shard-dg2:          ([SKIP][726], [SKIP][727]) ([i915#10055]) -> [SKIP][728] ([i915#16708] / [i915#5354]) +1 other test skip
   [726]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18943/shard-dg2-1/igt@kms_frontbuffer_tracking@fbcpsr-tiling-y.html
   [727]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18943/shard-dg2-6/igt@kms_frontbuffer_tracking@fbcpsr-tiling-y.html
   [728]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_171547v1/shard-dg2-10/igt@kms_frontbuffer_tracking@fbcpsr-tiling-y.html

  * igt@kms_frontbuffer_tracking@fbcpsrhdr-1p-offscreen-pri-indfb-draw-mmap-cpu:
    - shard-dg2:          [SKIP][729] ([i915#15102]) -> [SKIP][730] ([i915#16708]) +2 other tests skip
   [729]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18943/shard-dg2-8/igt@kms_frontbuffer_tracking@fbcpsrhdr-1p-offscreen-pri-indfb-draw-mmap-cpu.html
   [730]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_171547v1/shard-dg2-10/igt@kms_frontbuffer_tracking@fbcpsrhdr-1p-offscreen-pri-indfb-draw-mmap-cpu.html

  * igt@kms_frontbuffer_tracking@fbcpsrhdr-1p-primscrn-spr-indfb-draw-mmap-cpu:
    - shard-rkl:          ([SKIP][731], [SKIP][732]) ([i915#14544] / [i915#15102]) -> [SKIP][733] ([i915#15102]) +17 other tests skip
   [731]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18943/shard-rkl-3/igt@kms_frontbuffer_tracking@fbcpsrhdr-1p-primscrn-spr-indfb-draw-mmap-cpu.html
   [732]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18943/shard-rkl-6/igt@kms_frontbuffer_tracking@fbcpsrhdr-1p-primscrn-spr-indfb-draw-mmap-cpu.html
   [733]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_171547v1/shard-rkl-5/igt@kms_frontbuffer_tracking@fbcpsrhdr-1p-primscrn-spr-indfb-draw-mmap-cpu.html

  * igt@kms_frontbuffer_tracking@fbcpsrhdr-2p-scndscrn-pri-indfb-draw-mmap-wc:
    - shard-dg2:          ([SKIP][734], [SKIP][735]) ([i915#15990] / [i915#16708]) -> [SKIP][736] ([i915#15990]) +29 other tests skip
   [734]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18943/shard-dg2-7/igt@kms_frontbuffer_tracking@fbcpsrhdr-2p-scndscrn-pri-indfb-draw-mmap-wc.html
   [735]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18943/shard-dg2-10/igt@kms_frontbuffer_tracking@fbcpsrhdr-2p-scndscrn-pri-indfb-draw-mmap-wc.html
   [736]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_171547v1/shard-dg2-8/igt@kms_frontbuffer_tracking@fbcpsrhdr-2p-scndscrn-pri-indfb-draw-mmap-wc.html

  * igt@kms_frontbuffer_tracking@fbcpsrhdr-2p-scndscrn-shrfb-plflip-blt:
    - shard-rkl:          [SKIP][737] -> [SKIP][738] ([i915#14544]) +16 other tests skip
   [737]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18943/shard-rkl-1/igt@kms_frontbuffer_tracking@fbcpsrhdr-2p-scndscrn-shrfb-plflip-blt.html
   [738]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_171547v1/shard-rkl-6/igt@kms_frontbuffer_tracking@fbcpsrhdr-2p-scndscrn-shrfb-plflip-blt.html

  * igt@kms_frontbuffer_tracking@fbcpsrhdr-2p-scndscrn-spr-indfb-draw-mmap-cpu:
    - shard-dg2:          [SKIP][739] ([i915#15991]) -> [SKIP][740] ([i915#16708]) +4 other tests skip
   [739]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18943/shard-dg2-8/igt@kms_frontbuffer_tracking@fbcpsrhdr-2p-scndscrn-spr-indfb-draw-mmap-cpu.html
   [740]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_171547v1/shard-dg2-10/igt@kms_frontbuffer_tracking@fbcpsrhdr-2p-scndscrn-spr-indfb-draw-mmap-cpu.html

  * igt@kms_frontbuffer_tracking@fbcpsrhdr-2p-shrfb-fliptrack-mmap-gtt:
    - shard-dg2:          ([SKIP][741], [SKIP][742]) ([i915#15990] / [i915#16708]) -> [SKIP][743] ([i915#16708]) +8 other tests skip
   [741]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18943/shard-dg2-8/igt@kms_frontbuffer_tracking@fbcpsrhdr-2p-shrfb-fliptrack-mmap-gtt.html
   [742]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18943/shard-dg2-10/igt@kms_frontbuffer_tracking@fbcpsrhdr-2p-shrfb-fliptrack-mmap-gtt.html
   [743]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_171547v1/shard-dg2-10/igt@kms_frontbuffer_tracking@fbcpsrhdr-2p-shrfb-fliptrack-mmap-gtt.html

  * igt@kms_frontbuffer_tracking@fbcpsrhdr-rgb565-draw-render:
    - shard-rkl:          ([SKIP][744], [SKIP][745]) ([i915#15102]) -> [SKIP][746] ([i915#14544] / [i915#15102]) +3 other tests skip
   [744]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18943/shard-rkl-7/igt@kms_frontbuffer_tracking@fbcpsrhdr-rgb565-draw-render.html
   [745]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18943/shard-rkl-8/igt@kms_frontbuffer_tracking@fbcpsrhdr-rgb565-draw-render.html
   [746]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_171547v1/shard-rkl-6/igt@kms_frontbuffer_tracking@fbcpsrhdr-rgb565-draw-render.html

  * igt@kms_frontbuffer_tracking@fbcpsrhdr-tiling-y:
    - shard-dg2:          [SKIP][747] ([i915#10055]) -> [SKIP][748] ([i915#16708])
   [747]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18943/shard-dg2-8/igt@kms_frontbuffer_tracking@fbcpsrhdr-tiling-y.html
   [748]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_171547v1/shard-dg2-10/igt@kms_frontbuffer_tracking@fbcpsrhdr-tiling-y.html

  * igt@kms_frontbuffer_tracking@hdr-1p-offscreen-pri-indfb-draw-pwrite:
    - shard-dg2:          ([SKIP][749], [SKIP][750]) ([i915#15989] / [i915#16708]) -> [SKIP][751] ([i915#16708]) +8 other tests skip
   [749]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18943/shard-dg2-10/igt@kms_frontbuffer_tracking@hdr-1p-offscreen-pri-indfb-draw-pwrite.html
   [750]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18943/shard-dg2-8/igt@kms_frontbuffer_tracking@hdr-1p-offscreen-pri-indfb-draw-pwrite.html
   [751]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_171547v1/shard-dg2-10/igt@kms_frontbuffer_tracking@hdr-1p-offscreen-pri-indfb-draw-pwrite.html

  * igt@kms_frontbuffer_tracking@hdr-1p-primscrn-pri-shrfb-draw-mmap-cpu:
    - shard-dg2:          ([SKIP][752], [SKIP][753]) ([i915#15989] / [i915#16708]) -> [SKIP][754] ([i915#15989]) +25 other tests skip
   [752]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18943/shard-dg2-7/igt@kms_frontbuffer_tracking@hdr-1p-primscrn-pri-shrfb-draw-mmap-cpu.html
   [753]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18943/shard-dg2-10/igt@kms_frontbuffer_tracking@hdr-1p-primscrn-pri-shrfb-draw-mmap-cpu.html
   [754]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_171547v1/shard-dg2-8/igt@kms_frontbuffer_tracking@hdr-1p-primscrn-pri-shrfb-draw-mmap-cpu.html

  * igt@kms_frontbuffer_tracking@hdr-1p-primscrn-spr-indfb-draw-mmap-cpu:
    - shard-dg2:          ([SKIP][755], [SKIP][756]) ([i915#15989]) -> [SKIP][757] ([i915#16708]) +9 other tests skip
   [755]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18943/shard-dg2-6/igt@kms_frontbuffer_tracking@hdr-1p-primscrn-spr-indfb-draw-mmap-cpu.html
   [756]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18943/shard-dg2-5/igt@kms_frontbuffer_tracking@hdr-1p-primscrn-spr-indfb-draw-mmap-cpu.html
   [757]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_171547v1/shard-dg2-10/igt@kms_frontbuffer_tracking@hdr-1p-primscrn-spr-indfb-draw-mmap-cpu.html

  * igt@kms_frontbuffer_tracking@hdr-2p-primscrn-pri-shrfb-draw-blt:
    - shard-dg2:          ([SKIP][758], [SKIP][759]) ([i915#15991] / [i915#16708]) -> [SKIP][760] ([i915#16708]) +17 other tests skip
   [758]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18943/shard-dg2-8/igt@kms_frontbuffer_tracking@hdr-2p-primscrn-pri-shrfb-draw-blt.html
   [759]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18943/shard-dg2-10/igt@kms_frontbuffer_tracking@hdr-2p-primscrn-pri-shrfb-draw-blt.html
   [760]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_171547v1/shard-dg2-10/igt@kms_frontbuffer_tracking@hdr-2p-primscrn-pri-shrfb-draw-blt.html

  * igt@kms_frontbuffer_tracking@hdr-2p-scndscrn-pri-shrfb-draw-mmap-cpu:
    - shard-glk:          ([SKIP][761], [PASS][762]) -> [SKIP][763] +9 other tests skip
   [761]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18943/shard-glk5/igt@kms_frontbuffer_tracking@hdr-2p-scndscrn-pri-shrfb-draw-mmap-cpu.html
   [762]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18943/shard-glk8/igt@kms_frontbuffer_tracking@hdr-2p-scndscrn-pri-shrfb-draw-mmap-cpu.html
   [763]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_171547v1/shard-glk4/igt@kms_frontbuffer_tracking@hdr-2p-scndscrn-pri-shrfb-draw-mmap-cpu.html

  * igt@kms_frontbuffer_tracking@psr-1p-offscreen-pri-shrfb-draw-mmap-wc:
    - shard-dg2:          ([SKIP][764], [SKIP][765]) ([i915#15104] / [i915#15990] / [i915#16708]) -> [SKIP][766] ([i915#15104] / [i915#15990]) +4 other tests skip
   [764]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18943/shard-dg2-10/igt@kms_frontbuffer_tracking@psr-1p-offscreen-pri-shrfb-draw-mmap-wc.html
   [765]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18943/shard-dg2-1/igt@kms_frontbuffer_tracking@psr-1p-offscreen-pri-shrfb-draw-mmap-wc.html
   [766]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_171547v1/shard-dg2-1/igt@kms_frontbuffer_tracking@psr-1p-offscreen-pri-shrfb-draw-mmap-wc.html

  * igt@kms_frontbuffer_tracking@psr-1p-primscrn-cur-indfb-draw-mmap-cpu:
    - shard-dg2:          ([SKIP][767], [SKIP][768]) ([i915#10433] / [i915#15102]) -> [SKIP][769] ([i915#15102]) +1 other test skip
   [767]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18943/shard-dg2-4/igt@kms_frontbuffer_tracking@psr-1p-primscrn-cur-indfb-draw-mmap-cpu.html
   [768]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18943/shard-dg2-6/igt@kms_frontbuffer_tracking@psr-1p-primscrn-cur-indfb-draw-mmap-cpu.html
   [769]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_171547v1/shard-dg2-1/igt@kms_frontbuffer_tracking@psr-1p-primscrn-cur-indfb-draw-mmap-cpu.html

  * igt@kms_frontbuffer_tracking@psr-1p-primscrn-cur-indfb-move:
    - shard-dg2:          ([SKIP][770], [SKIP][771]) ([i915#15102] / [i915#16708] / [i915#5354]) -> [SKIP][772] ([i915#16708] / [i915#5354]) +10 other tests skip
   [770]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18943/shard-dg2-8/igt@kms_frontbuffer_tracking@psr-1p-primscrn-cur-indfb-move.html
   [771]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18943/shard-dg2-10/igt@kms_frontbuffer_tracking@psr-1p-primscrn-cur-indfb-move.html
   [772]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_171547v1/shard-dg2-10/igt@kms_frontbuffer_tracking@psr-1p-primscrn-cur-indfb-move.html

  * igt@kms_frontbuffer_tracking@psr-1p-primscrn-pri-shrfb-draw-blt:
    - shard-dg2:          ([SKIP][773], [SKIP][774]) ([i915#10433] / [i915#15102] / [i915#16708] / [i915#5354]) -> [SKIP][775] ([i915#15102])
   [773]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18943/shard-dg2-10/igt@kms_frontbuffer_tracking@psr-1p-primscrn-pri-shrfb-draw-blt.html
   [774]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18943/shard-dg2-4/igt@kms_frontbuffer_tracking@psr-1p-primscrn-pri-shrfb-draw-blt.html
   [775]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_171547v1/shard-dg2-1/igt@kms_frontbuffer_tracking@psr-1p-primscrn-pri-shrfb-draw-blt.html

  * igt@kms_frontbuffer_tracking@psr-2p-primscrn-pri-indfb-draw-render:
    - shard-dg2:          ([SKIP][776], [SKIP][777]) ([i915#15991] / [i915#16708] / [i915#5354]) -> [SKIP][778] ([i915#15991] / [i915#5354]) +45 other tests skip
   [776]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18943/shard-dg2-10/igt@kms_frontbuffer_tracking@psr-2p-primscrn-pri-indfb-draw-render.html
   [777]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18943/shard-dg2-3/igt@kms_frontbuffer_tracking@psr-2p-primscrn-pri-indfb-draw-render.html
   [778]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_171547v1/shard-dg2-6/igt@kms_frontbuffer_tracking@psr-2p-primscrn-pri-indfb-draw-render.html

  * igt@kms_frontbuffer_tracking@psr-2p-scndscrn-pri-shrfb-draw-mmap-wc:
    - shard-rkl:          ([SKIP][779], [SKIP][780]) ([i915#1825]) -> [SKIP][781] ([i915#14544] / [i915#1825])
   [779]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18943/shard-rkl-8/igt@kms_frontbuffer_tracking@psr-2p-scndscrn-pri-shrfb-draw-mmap-wc.html
   [780]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18943/shard-rkl-7/igt@kms_frontbuffer_tracking@psr-2p-scndscrn-pri-shrfb-draw-mmap-wc.html
   [781]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_171547v1/shard-rkl-6/igt@kms_frontbuffer_tracking@psr-2p-scndscrn-pri-shrfb-draw-mmap-wc.html

  * igt@kms_frontbuffer_tracking@psr-2p-scndscrn-shrfb-pgflip-blt:
    - shard-dg2:          ([SKIP][782], [SKIP][783]) ([i915#15991] / [i915#5354]) -> [SKIP][784] ([i915#16708] / [i915#5354]) +12 other tests skip
   [782]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18943/shard-dg2-5/igt@kms_frontbuffer_tracking@psr-2p-scndscrn-shrfb-pgflip-blt.html
   [783]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18943/shard-dg2-6/igt@kms_frontbuffer_tracking@psr-2p-scndscrn-shrfb-pgflip-blt.html
   [784]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_171547v1/shard-dg2-10/igt@kms_frontbuffer_tracking@psr-2p-scndscrn-shrfb-pgflip-blt.html

  * igt@kms_frontbuffer_tracking@psr-rgb101010-draw-mmap-cpu:
    - shard-rkl:          [SKIP][785] ([i915#15102] / [i915#3023]) -> [SKIP][786] ([i915#14544] / [i915#15102] / [i915#3023]) +1 other test skip
   [785]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18943/shard-rkl-1/igt@kms_frontbuffer_tracking@psr-rgb101010-draw-mmap-cpu.html
   [786]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_171547v1/shard-rkl-6/igt@kms_frontbuffer_tracking@psr-rgb101010-draw-mmap-cpu.html

  * igt@kms_frontbuffer_tracking@psr-rgb565-draw-mmap-cpu:
    - shard-dg2:          [SKIP][787] ([i915#15102]) -> [SKIP][788] ([i915#16708] / [i915#5354]) +1 other test skip
   [787]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18943/shard-dg2-8/igt@kms_frontbuffer_tracking@psr-rgb565-draw-mmap-cpu.html
   [788]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_171547v1/shard-dg2-10/igt@kms_frontbuffer_tracking@psr-rgb565-draw-mmap-cpu.html

  * igt@kms_frontbuffer_tracking@psr-suspend:
    - shard-rkl:          ([SKIP][789], [SKIP][790]) ([i915#14544] / [i915#15102] / [i915#3023]) -> [SKIP][791] ([i915#15102] / [i915#3023]) +14 other tests skip
   [789]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18943/shard-rkl-6/igt@kms_frontbuffer_tracking@psr-suspend.html
   [790]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18943/shard-rkl-3/igt@kms_frontbuffer_tracking@psr-suspend.html
   [791]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_171547v1/shard-rkl-5/igt@kms_frontbuffer_tracking@psr-suspend.html

  * igt@kms_frontbuffer_tracking@psrhdr-1p-offscreen-pri-shrfb-draw-pwrite:
    - shard-dg2:          ([SKIP][792], [SKIP][793]) ([i915#15102]) -> [SKIP][794] ([i915#16708]) +8 other tests skip
   [792]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18943/shard-dg2-5/igt@kms_frontbuffer_tracking@psrhdr-1p-offscreen-pri-shrfb-draw-pwrite.html
   [793]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18943/shard-dg2-6/igt@kms_frontbuffer_tracking@psrhdr-1p-offscreen-pri-shrfb-draw-pwrite.html
   [794]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_171547v1/shard-dg2-10/igt@kms_frontbuffer_tracking@psrhdr-1p-offscreen-pri-shrfb-draw-pwrite.html

  * igt@kms_frontbuffer_tracking@psrhdr-2p-pri-indfb-multidraw:
    - shard-dg2:          ([SKIP][795], [SKIP][796]) ([i915#15991] / [i915#16708]) -> [SKIP][797] ([i915#15991]) +53 other tests skip
   [795]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18943/shard-dg2-7/igt@kms_frontbuffer_tracking@psrhdr-2p-pri-indfb-multidraw.html
   [796]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18943/shard-dg2-10/igt@kms_frontbuffer_tracking@psrhdr-2p-pri-indfb-multidraw.html
   [797]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_171547v1/shard-dg2-8/igt@kms_frontbuffer_tracking@psrhdr-2p-pri-indfb-multidraw.html

  * igt@kms_frontbuffer_tracking@psrhdr-slowdraw:
    - shard-rkl:          [SKIP][798] ([i915#15102]) -> [SKIP][799] ([i915#14544] / [i915#15102]) +6 other tests skip
   [798]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18943/shard-rkl-1/igt@kms_frontbuffer_tracking@psrhdr-slowdraw.html
   [799]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_171547v1/shard-rkl-6/igt@kms_frontbuffer_tracking@psrhdr-slowdraw.html

  * igt@kms_frontbuffer_tracking@psrhdr-suspend:
    - shard-dg2:          ([SKIP][800], [SKIP][801]) ([i915#15102] / [i915#16708]) -> [SKIP][802] ([i915#16708]) +12 other tests skip
   [800]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18943/shard-dg2-10/igt@kms_frontbuffer_tracking@psrhdr-suspend.html
   [801]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18943/shard-dg2-8/igt@kms_frontbuffer_tracking@psrhdr-suspend.html
   [802]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_171547v1/shard-dg2-10/igt@kms_frontbuffer_tracking@psrhdr-suspend.html

  * igt@kms_hdr@bpc-switch:
    - shard-dg2:          ([SKIP][803], [SKIP][804]) ([i915#16518] / [i915#16707] / [i915#3555] / [i915#8228]) -> [SKIP][805] ([i915#16518] / [i915#3555] / [i915#8228])
   [803]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18943/shard-dg2-10/igt@kms_hdr@bpc-switch.html
   [804]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18943/shard-dg2-6/igt@kms_hdr@bpc-switch.html
   [805]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_171547v1/shard-dg2-4/igt@kms_hdr@bpc-switch.html

  * igt@kms_hdr@static-toggle:
    - shard-dg2:          ([SKIP][806], [SKIP][807]) ([i915#16518] / [i915#3555] / [i915#8228]) -> [SKIP][808] ([i915#16707])
   [806]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18943/shard-dg2-6/igt@kms_hdr@static-toggle.html
   [807]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18943/shard-dg2-1/igt@kms_hdr@static-toggle.html
   [808]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_171547v1/shard-dg2-10/igt@kms_hdr@static-toggle.html
    - shard-rkl:          ([SKIP][809], [PASS][810]) ([i915#16644] / [i915#3555] / [i915#8228]) -> [SKIP][811] ([i915#16644] / [i915#3555] / [i915#8228])
   [809]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18943/shard-rkl-3/igt@kms_hdr@static-toggle.html
   [810]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18943/shard-rkl-1/igt@kms_hdr@static-toggle.html
   [811]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_171547v1/shard-rkl-8/igt@kms_hdr@static-toggle.html

  * igt@kms_hdr@static-toggle-dpms:
    - shard-dg2:          ([SKIP][812], [SKIP][813]) ([i915#16518] / [i915#16707] / [i915#3555] / [i915#8228]) -> [SKIP][814] ([i915#16707])
   [812]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18943/shard-dg2-10/igt@kms_hdr@static-toggle-dpms.html
   [813]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18943/shard-dg2-8/igt@kms_hdr@static-toggle-dpms.html
   [814]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_171547v1/shard-dg2-10/igt@kms_hdr@static-toggle-dpms.html

  * igt@kms_joiner@invalid-modeset-ultra-joiner:
    - shard-rkl:          [SKIP][815] ([i915#15458]) -> [SKIP][816] ([i915#14544] / [i915#15458])
   [815]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18943/shard-rkl-1/igt@kms_joiner@invalid-modeset-ultra-joiner.html
   [816]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_171547v1/shard-rkl-6/igt@kms_joiner@invalid-modeset-ultra-joiner.html

  * igt@kms_panel_fitting@atomic-fastset:
    - shard-dg2:          ([SKIP][817], [SKIP][818]) ([i915#16707] / [i915#6301]) -> [SKIP][819] ([i915#6301])
   [817]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18943/shard-dg2-7/igt@kms_panel_fitting@atomic-fastset.html
   [818]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18943/shard-dg2-10/igt@kms_panel_fitting@atomic-fastset.html
   [819]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_171547v1/shard-dg2-8/igt@kms_panel_fitting@atomic-fastset.html

  * igt@kms_plane@pixel-format-y-tiled-ccs-modifier:
    - shard-rkl:          ([SKIP][820], [SKIP][821]) ([i915#14544] / [i915#15709]) -> [SKIP][822] ([i915#15709])
   [820]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18943/shard-rkl-1/igt@kms_plane@pixel-format-y-tiled-ccs-modifier.html
   [821]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18943/shard-rkl-6/igt@kms_plane@pixel-format-y-tiled-ccs-modifier.html
   [822]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_171547v1/shard-rkl-4/igt@kms_plane@pixel-format-y-tiled-ccs-modifier.html

  * igt@kms_plane@plane-panning-bottom-right:
    - shard-dg2:          ([PASS][823], [SKIP][824]) ([i915#8825]) -> [SKIP][825] ([i915#8825])
   [823]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18943/shard-dg2-8/igt@kms_plane@plane-panning-bottom-right.html
   [824]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18943/shard-dg2-10/igt@kms_plane@plane-panning-bottom-right.html
   [825]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_171547v1/shard-dg2-10/igt@kms_plane@plane-panning-bottom-right.html

  * igt@kms_plane_multiple@2x-tiling-4:
    - shard-dg2:          ([SKIP][826], [SKIP][827]) ([i915#13958] / [i915#16707]) -> [SKIP][828] ([i915#16707])
   [826]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18943/shard-dg2-10/igt@kms_plane_multiple@2x-tiling-4.html
   [827]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18943/shard-dg2-8/igt@kms_plane_multiple@2x-tiling-4.html
   [828]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_171547v1/shard-dg2-10/igt@kms_plane_multiple@2x-tiling-4.html

  * igt@kms_plane_multiple@2x-tiling-none:
    - shard-dg2:          ([SKIP][829], [SKIP][830]) ([i915#13958] / [i915#16707]) -> [SKIP][831] ([i915#13958]) +1 other test skip
   [829]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18943/shard-dg2-10/igt@kms_plane_multiple@2x-tiling-none.html
   [830]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18943/shard-dg2-6/igt@kms_plane_multiple@2x-tiling-none.html
   [831]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_171547v1/shard-dg2-4/igt@kms_plane_multiple@2x-tiling-none.html

  * igt@kms_plane_multiple@tiling-y:
    - shard-dg2:          ([SKIP][832], [SKIP][833]) ([i915#14259] / [i915#16707]) -> [SKIP][834] ([i915#16707])
   [832]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18943/shard-dg2-8/igt@kms_plane_multiple@tiling-y.html
   [833]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18943/shard-dg2-10/igt@kms_plane_multiple@tiling-y.html
   [834]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_171547v1/shard-dg2-10/igt@kms_plane_multiple@tiling-y.html

  * igt@kms_plane_scaling@planes-upscale-factor-0-25:
    - shard-dg2:          ([PASS][835], [SKIP][836]) ([i915#15329] / [i915#3555] / [i915#6953] / [i915#9423]) -> [SKIP][837] ([i915#15329] / [i915#3555] / [i915#6953] / [i915#9423]) +1 other test skip
   [835]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18943/shard-dg2-8/igt@kms_plane_scaling@planes-upscale-factor-0-25.html
   [836]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18943/shard-dg2-10/igt@kms_plane_scaling@planes-upscale-factor-0-25.html
   [837]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_171547v1/shard-dg2-10/igt@kms_plane_scaling@planes-upscale-factor-0-25.html

  * igt@kms_plane_scaling@planes-upscale-factor-0-25@pipe-d:
    - shard-dg2:          ([SKIP][838], [PASS][839]) ([i915#15329]) -> [SKIP][840] ([i915#15329]) +7 other tests skip
   [838]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18943/shard-dg2-10/igt@kms_plane_scaling@planes-upscale-factor-0-25@pipe-d.html
   [839]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18943/shard-dg2-8/igt@kms_plane_scaling@planes-upscale-factor-0-25@pipe-d.html
   [840]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_171547v1/shard-dg2-10/igt@kms_plane_scaling@planes-upscale-factor-0-25@pipe-d.html

  * igt@kms_pm_dc@dc5-pageflip-negative:
    - shard-rkl:          ([SKIP][841], [SKIP][842]) ([i915#14544] / [i915#9685]) -> [SKIP][843] ([i915#9685])
   [841]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18943/shard-rkl-3/igt@kms_pm_dc@dc5-pageflip-negative.html
   [842]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18943/shard-rkl-6/igt@kms_pm_dc@dc5-pageflip-negative.html
   [843]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_171547v1/shard-rkl-5/igt@kms_pm_dc@dc5-pageflip-negative.html

  * igt@kms_pm_dc@dc5-retention-flops:
    - shard-rkl:          [SKIP][844] ([i915#3828]) -> [SKIP][845] ([i915#14544] / [i915#3828])
   [844]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18943/shard-rkl-1/igt@kms_pm_dc@dc5-retention-flops.html
   [845]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_171547v1/shard-rkl-6/igt@kms_pm_dc@dc5-retention-flops.html

  * igt@kms_pm_dc@dc9-dpms:
    - shard-tglu:         [SKIP][846] ([i915#15128]) -> [SKIP][847] ([i915#15739])
   [846]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18943/shard-tglu-6/igt@kms_pm_dc@dc9-dpms.html
   [847]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_171547v1/shard-tglu-5/igt@kms_pm_dc@dc9-dpms.html

  * igt@kms_pm_lpsp@kms-lpsp:
    - shard-rkl:          ([SKIP][848], [SKIP][849]) ([i915#3828] / [i915#9340]) -> [SKIP][850] ([i915#14544] / [i915#9340])
   [848]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18943/shard-rkl-8/igt@kms_pm_lpsp@kms-lpsp.html
   [849]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18943/shard-rkl-7/igt@kms_pm_lpsp@kms-lpsp.html
   [850]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_171547v1/shard-rkl-6/igt@kms_pm_lpsp@kms-lpsp.html
    - shard-dg1:          ([SKIP][851], [SKIP][852]) ([i915#3828] / [i915#9340]) -> [SKIP][853] ([i915#3828])
   [851]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18943/shard-dg1-15/igt@kms_pm_lpsp@kms-lpsp.html
   [852]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18943/shard-dg1-17/igt@kms_pm_lpsp@kms-lpsp.html
   [853]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_171547v1/shard-dg1-14/igt@kms_pm_lpsp@kms-lpsp.html

  * igt@kms_pm_lpsp@screens-disabled:
    - shard-rkl:          ([SKIP][854], [SKIP][855]) ([i915#14544] / [i915#8430]) -> [SKIP][856] ([i915#8430])
   [854]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18943/shard-rkl-8/igt@kms_pm_lpsp@screens-disabled.html
   [855]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18943/shard-rkl-6/igt@kms_pm_lpsp@screens-disabled.html
   [856]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_171547v1/shard-rkl-3/igt@kms_pm_lpsp@screens-disabled.html

  * igt@kms_pm_rpm@dpms-lpsp:
    - shard-rkl:          ([PASS][857], [SKIP][858]) ([i915#15073]) -> [SKIP][859] ([i915#15073]) +2 other tests skip
   [857]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18943/shard-rkl-8/igt@kms_pm_rpm@dpms-lpsp.html
   [858]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18943/shard-rkl-3/igt@kms_pm_rpm@dpms-lpsp.html
   [859]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_171547v1/shard-rkl-4/igt@kms_pm_rpm@dpms-lpsp.html

  * igt@kms_pm_rpm@dpms-mode-unset-non-lpsp:
    - shard-dg1:          ([SKIP][860], [PASS][861]) ([i915#15073]) -> [SKIP][862] ([i915#15073]) +2 other tests skip
   [860]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18943/shard-dg1-14/igt@kms_pm_rpm@dpms-mode-unset-non-lpsp.html
   [861]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18943/shard-dg1-13/igt@kms_pm_rpm@dpms-mode-unset-non-lpsp.html
   [862]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_171547v1/shard-dg1-15/igt@kms_pm_rpm@dpms-mode-unset-non-lpsp.html

  * igt@kms_properties@colorop-properties-legacy:
    - shard-dg2:          ([PASS][863], [SKIP][864]) ([i915#15347]) -> [SKIP][865] ([i915#15347])
   [863]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18943/shard-dg2-8/igt@kms_properties@colorop-properties-legacy.html
   [864]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18943/shard-dg2-10/igt@kms_properties@colorop-properties-legacy.html
   [865]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_171547v1/shard-dg2-10/igt@kms_properties@colorop-properties-legacy.html

  * igt@kms_psr2_sf@fbc-psr2-overlay-plane-update-continuous-sf:
    - shard-rkl:          ([SKIP][866], [SKIP][867]) ([i915#11520] / [i915#14544]) -> [SKIP][868] ([i915#11520]) +3 other tests skip
   [866]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18943/shard-rkl-6/igt@kms_psr2_sf@fbc-psr2-overlay-plane-update-continuous-sf.html
   [867]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18943/shard-rkl-3/igt@kms_psr2_sf@fbc-psr2-overlay-plane-update-continuous-sf.html
   [868]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_171547v1/shard-rkl-5/igt@kms_psr2_sf@fbc-psr2-overlay-plane-update-continuous-sf.html

  * igt@kms_psr2_sf@pr-primary-plane-update-sf-dmg-area-big-fb:
    - shard-rkl:          ([SKIP][869], [SKIP][870]) ([i915#11520]) -> [SKIP][871] ([i915#11520] / [i915#14544])
   [869]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18943/shard-rkl-7/igt@kms_psr2_sf@pr-primary-plane-update-sf-dmg-area-big-fb.html
   [870]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18943/shard-rkl-8/igt@kms_psr2_sf@pr-primary-plane-update-sf-dmg-area-big-fb.html
   [871]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_171547v1/shard-rkl-6/igt@kms_psr2_sf@pr-primary-plane-update-sf-dmg-area-big-fb.html

  * igt@kms_psr2_sf@psr2-overlay-plane-move-continuous-exceed-sf:
    - shard-rkl:          [SKIP][872] ([i915#11520]) -> [SKIP][873] ([i915#11520] / [i915#14544]) +1 other test skip
   [872]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18943/shard-rkl-1/igt@kms_psr2_sf@psr2-overlay-plane-move-continuous-exceed-sf.html
   [873]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_171547v1/shard-rkl-6/igt@kms_psr2_sf@psr2-overlay-plane-move-continuous-exceed-sf.html

  * igt@kms_psr2_sf@psr2-overlay-plane-move-continuous-sf:
    - shard-dg1:          ([SKIP][874], [SKIP][875]) ([i915#11520]) -> [SKIP][876] ([i915#11520] / [i915#4423])
   [874]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18943/shard-dg1-13/igt@kms_psr2_sf@psr2-overlay-plane-move-continuous-sf.html
   [875]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18943/shard-dg1-19/igt@kms_psr2_sf@psr2-overlay-plane-move-continuous-sf.html
   [876]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_171547v1/shard-dg1-12/igt@kms_psr2_sf@psr2-overlay-plane-move-continuous-sf.html

  * igt@kms_psr2_su@page_flip-p010:
    - shard-rkl:          ([SKIP][877], [SKIP][878]) ([i915#14544] / [i915#9683]) -> [SKIP][879] ([i915#9683])
   [877]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18943/shard-rkl-1/igt@kms_psr2_su@page_flip-p010.html
   [878]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18943/shard-rkl-6/igt@kms_psr2_su@page_flip-p010.html
   [879]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_171547v1/shard-rkl-4/igt@kms_psr2_su@page_flip-p010.html

  * igt@kms_psr@fbc-pr-sprite-plane-onoff:
    - shard-rkl:          ([SKIP][880], [SKIP][881]) ([i915#1072] / [i915#9732]) -> [SKIP][882] ([i915#1072] / [i915#14544] / [i915#9732]) +1 other test skip
   [880]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18943/shard-rkl-8/igt@kms_psr@fbc-pr-sprite-plane-onoff.html
   [881]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18943/shard-rkl-7/igt@kms_psr@fbc-pr-sprite-plane-onoff.html
   [882]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_171547v1/shard-rkl-6/igt@kms_psr@fbc-pr-sprite-plane-onoff.html

  * igt@kms_psr@pr-cursor-mmap-cpu:
    - shard-rkl:          ([SKIP][883], [SKIP][884]) ([i915#1072] / [i915#14544] / [i915#9732]) -> [SKIP][885] ([i915#1072] / [i915#9732]) +12 other tests skip
   [883]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18943/shard-rkl-6/igt@kms_psr@pr-cursor-mmap-cpu.html
   [884]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18943/shard-rkl-3/igt@kms_psr@pr-cursor-mmap-cpu.html
   [885]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_171547v1/shard-rkl-8/igt@kms_psr@pr-cursor-mmap-cpu.html

  * igt@kms_psr@psr2-sprite-plane-onoff:
    - shard-rkl:          [SKIP][886] ([i915#1072] / [i915#9732]) -> [SKIP][887] ([i915#1072] / [i915#14544] / [i915#9732]) +2 other tests skip
   [886]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18943/shard-rkl-1/igt@kms_psr@psr2-sprite-plane-onoff.html
   [887]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_171547v1/shard-rkl-6/igt@kms_psr@psr2-sprite-plane-onoff.html

  * igt@kms_psr_stress_test@flip-primary-invalidate-overlay:
    - shard-rkl:          ([SKIP][888], [SKIP][889]) ([i915#14544] / [i915#15949]) -> [SKIP][890] ([i915#15949])
   [888]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18943/shard-rkl-3/igt@kms_psr_stress_test@flip-primary-invalidate-overlay.html
   [889]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18943/shard-rkl-6/igt@kms_psr_stress_test@flip-primary-invalidate-overlay.html
   [890]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_171547v1/shard-rkl-5/igt@kms_psr_stress_test@flip-primary-invalidate-overlay.html

  * igt@kms_rotation_crc@exhaust-fences:
    - shard-dg2:          ([SKIP][891], [SKIP][892]) ([i915#16707] / [i915#4235]) -> [SKIP][893] ([i915#16707])
   [891]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18943/shard-dg2-10/igt@kms_rotation_crc@exhaust-fences.html
   [892]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18943/shard-dg2-8/igt@kms_rotation_crc@exhaust-fences.html
   [893]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_171547v1/shard-dg2-10/igt@kms_rotation_crc@exhaust-fences.html

  * igt@kms_rotation_crc@primary-y-tiled-reflect-x-90:
    - shard-dg2:          ([SKIP][894], [SKIP][895]) ([i915#12755] / [i915#15867] / [i915#16707] / [i915#5190]) -> [SKIP][896] ([i915#12755] / [i915#15867] / [i915#5190]) +1 other test skip
   [894]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18943/shard-dg2-10/igt@kms_rotation_crc@primary-y-tiled-reflect-x-90.html
   [895]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18943/shard-dg2-3/igt@kms_rotation_crc@primary-y-tiled-reflect-x-90.html
   [896]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_171547v1/shard-dg2-6/igt@kms_rotation_crc@primary-y-tiled-reflect-x-90.html

  * igt@kms_rotation_crc@primary-yf-tiled-reflect-x-0:
    - shard-dg2:          ([SKIP][897], [SKIP][898]) ([i915#16707] / [i915#5190]) -> [SKIP][899] ([i915#5190]) +1 other test skip
   [897]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18943/shard-dg2-10/igt@kms_rotation_crc@primary-yf-tiled-reflect-x-0.html
   [898]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18943/shard-dg2-4/igt@kms_rotation_crc@primary-yf-tiled-reflect-x-0.html
   [899]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_171547v1/shard-dg2-4/igt@kms_rotation_crc@primary-yf-tiled-reflect-x-0.html

  * igt@kms_rotation_crc@primary-yf-tiled-reflect-x-180:
    - shard-dg2:          ([SKIP][900], [SKIP][901]) ([i915#5190]) -> [SKIP][902] ([i915#16707] / [i915#5190])
   [900]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18943/shard-dg2-5/igt@kms_rotation_crc@primary-yf-tiled-reflect-x-180.html
   [901]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18943/shard-dg2-6/igt@kms_rotation_crc@primary-yf-tiled-reflect-x-180.html
   [902]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_171547v1/shard-dg2-10/igt@kms_rotation_crc@primary-yf-tiled-reflect-x-180.html

  * igt@kms_rotation_crc@sprite-rotation-270:
    - shard-dg2:          ([SKIP][903], [SKIP][904]) ([i915#12755] / [i915#15867] / [i915#16707]) -> [SKIP][905] ([i915#12755] / [i915#15867]) +1 other test skip
   [903]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18943/shard-dg2-1/igt@kms_rotation_crc@sprite-rotation-270.html
   [904]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18943/shard-dg2-10/igt@kms_rotation_crc@sprite-rotation-270.html
   [905]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_171547v1/shard-dg2-1/igt@kms_rotation_crc@sprite-rotation-270.html

  * igt@kms_rotation_crc@sprite-rotation-90:
    - shard-dg2:          ([SKIP][906], [SKIP][907]) ([i915#12755] / [i915#15867]) -> [SKIP][908] ([i915#16707])
   [906]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18943/shard-dg2-1/igt@kms_rotation_crc@sprite-rotation-90.html
   [907]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18943/shard-dg2-6/igt@kms_rotation_crc@sprite-rotation-90.html
   [908]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_171547v1/shard-dg2-10/igt@kms_rotation_crc@sprite-rotation-90.html

  * igt@kms_scaling_modes@scaling-mode-none:
    - shard-dg2:          ([SKIP][909], [SKIP][910]) ([i915#3555]) -> [SKIP][911] ([i915#16707]) +1 other test skip
   [909]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18943/shard-dg2-6/igt@kms_scaling_modes@scaling-mode-none.html
   [910]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18943/shard-dg2-1/igt@kms_scaling_modes@scaling-mode-none.html
   [911]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_171547v1/shard-dg2-10/igt@kms_scaling_modes@scaling-mode-none.html

  * igt@kms_tiled_display@basic-test-pattern:
    - shard-dg2:          ([SKIP][912], [SKIP][913]) ([i915#16707] / [i915#8623]) -> [SKIP][914] ([i915#8623])
   [912]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18943/shard-dg2-3/igt@kms_tiled_display@basic-test-pattern.html
   [913]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18943/shard-dg2-10/igt@kms_tiled_display@basic-test-pattern.html
   [914]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_171547v1/shard-dg2-6/igt@kms_tiled_display@basic-test-pattern.html

  * igt@kms_vblank@ts-continuation-dpms-suspend:
    - shard-dg2:          ([SKIP][915], [PASS][916]) ([i915#16707]) -> [SKIP][917] ([i915#16707]) +27 other tests skip
   [915]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18943/shard-dg2-10/igt@kms_vblank@ts-continuation-dpms-suspend.html
   [916]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18943/shard-dg2-8/igt@kms_vblank@ts-continuation-dpms-suspend.html
   [917]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_171547v1/shard-dg2-10/igt@kms_vblank@ts-continuation-dpms-suspend.html

  * igt@kms_vrr@flip-basic-fastset:
    - shard-dg2:          ([SKIP][918], [SKIP][919]) ([i915#16707] / [i915#9906]) -> [SKIP][920] ([i915#9906]) +2 other tests skip
   [918]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18943/shard-dg2-10/igt@kms_vrr@flip-basic-fastset.html
   [919]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18943/shard-dg2-7/igt@kms_vrr@flip-basic-fastset.html
   [920]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_171547v1/shard-dg2-8/igt@kms_vrr@flip-basic-fastset.html

  * igt@kms_vrr@flip-dpms:
    - shard-dg2:          ([SKIP][921], [SKIP][922]) ([i915#15243] / [i915#16707] / [i915#3555]) -> [SKIP][923] ([i915#15243] / [i915#3555])
   [921]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18943/shard-dg2-10/igt@kms_vrr@flip-dpms.html
   [922]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18943/shard-dg2-3/igt@kms_vrr@flip-dpms.html
   [923]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_171547v1/shard-dg2-6/igt@kms_vrr@flip-dpms.html

  * igt@kms_vrr@flip-suspend:
    - shard-dg2:          ([SKIP][924], [SKIP][925]) ([i915#15243] / [i915#3555]) -> [SKIP][926] ([i915#16707])
   [924]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18943/shard-dg2-6/igt@kms_vrr@flip-suspend.html
   [925]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18943/shard-dg2-5/igt@kms_vrr@flip-suspend.html
   [926]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_171547v1/shard-dg2-10/igt@kms_vrr@flip-suspend.html

  * igt@kms_vrr@seamless-rr-switch-drrs:
    - shard-rkl:          ([SKIP][927], [SKIP][928]) ([i915#9906]) -> [SKIP][929] ([i915#14544] / [i915#9906])
   [927]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18943/shard-rkl-8/igt@kms_vrr@seamless-rr-switch-drrs.html
   [928]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18943/shard-rkl-7/igt@kms_vrr@seamless-rr-switch-drrs.html
   [929]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_171547v1/shard-rkl-6/igt@kms_vrr@seamless-rr-switch-drrs.html

  * igt@kms_vrr@seamless-rr-switch-vrr:
    - shard-rkl:          ([SKIP][930], [SKIP][931]) ([i915#14544] / [i915#9906]) -> [SKIP][932] ([i915#9906])
   [930]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18943/shard-rkl-6/igt@kms_vrr@seamless-rr-switch-vrr.html
   [931]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18943/shard-rkl-3/igt@kms_vrr@seamless-rr-switch-vrr.html
   [932]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_171547v1/shard-rkl-3/igt@kms_vrr@seamless-rr-switch-vrr.html

  * igt@perf@per-context-mode-unprivileged:
    - shard-rkl:          ([SKIP][933], [SKIP][934]) ([i915#14544] / [i915#2435]) -> [SKIP][935] ([i915#2435])
   [933]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18943/shard-rkl-3/igt@perf@per-context-mode-unprivileged.html
   [934]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18943/shard-rkl-6/igt@perf@per-context-mode-unprivileged.html
   [935]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_171547v1/shard-rkl-5/igt@perf@per-context-mode-unprivileged.html

  * igt@perf_pmu@busy-double-start@rcs0:
    - shard-mtlp:         ([FAIL][936], [PASS][937]) ([i915#4349]) -> [FAIL][938] ([i915#4349])
   [936]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18943/shard-mtlp-5/igt@perf_pmu@busy-double-start@rcs0.html
   [937]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18943/shard-mtlp-2/igt@perf_pmu@busy-double-start@rcs0.html
   [938]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_171547v1/shard-mtlp-8/igt@perf_pmu@busy-double-start@rcs0.html

  * igt@prime_vgem@basic-fence-flip:
    - shard-dg2:          [SKIP][939] ([i915#3708]) -> [SKIP][940] ([i915#16707] / [i915#3708])
   [939]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18943/shard-dg2-8/igt@prime_vgem@basic-fence-flip.html
   [940]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_171547v1/shard-dg2-10/igt@prime_vgem@basic-fence-flip.html

  * igt@prime_vgem@basic-read:
    - shard-rkl:          ([SKIP][941], [SKIP][942]) ([i915#14544] / [i915#3291] / [i915#3708]) -> [SKIP][943] ([i915#3291] / [i915#3708])
   [941]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18943/shard-rkl-3/igt@prime_vgem@basic-read.html
   [942]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18943/shard-rkl-6/igt@prime_vgem@basic-read.html
   [943]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_171547v1/shard-rkl-5/igt@prime_vgem@basic-read.html

  * igt@prime_vgem@fence-write-hang:
    - shard-rkl:          [SKIP][944] ([i915#3708]) -> [SKIP][945] ([i915#14544] / [i915#3708])
   [944]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18943/shard-rkl-1/igt@prime_vgem@fence-write-hang.html
   [945]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_171547v1/shard-rkl-6/igt@prime_vgem@fence-write-hang.html

  * igt@sriov_basic@bind-unbind-vf:
    - shard-rkl:          ([SKIP][946], [SKIP][947]) ([i915#14544] / [i915#9917]) -> [SKIP][948] ([i915#9917])
   [946]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18943/shard-rkl-6/igt@sriov_basic@bind-unbind-vf.html
   [947]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18943/shard-rkl-3/igt@sriov_basic@bind-unbind-vf.html
   [948]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_171547v1/shard-rkl-5/igt@sriov_basic@bind-unbind-vf.html

  
  [i915#10055]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/10055
  [i915#10307]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/10307
  [i915#10433]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/10433
  [i915#10434]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/10434
  [i915#10647]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/10647
  [i915#1072]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/1072
  [i915#11151]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11151
  [i915#11190]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11190
  [i915#11520]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11520
  [i915#118]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/118
  [i915#12177]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12177
  [i915#12276]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12276
  [i915#12313]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12313
  [i915#12314]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12314
  [i915#12343]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12343
  [i915#1257]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/1257
  [i915#12655]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12655
  [i915#12745]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12745
  [i915#12755]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12755
  [i915#12805]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12805
  [i915#12935]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12935
  [i915#13008]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13008
  [i915#13027]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13027
  [i915#13046]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13046
  [i915#13049]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13049
  [i915#13356]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13356
  [i915#13390]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13390
  [i915#13566]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13566
  [i915#13707]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13707
  [i915#13748]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13748
  [i915#13749]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13749
  [i915#13783]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13783
  [i915#13820]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13820
  [i915#13958]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13958
  [i915#14098]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14098
  [i915#14259]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14259
  [i915#14544]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544
  [i915#14586]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14586
  [i915#14600]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14600
  [i915#14694]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14694
  [i915#14888]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14888
  [i915#15073]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15073
  [i915#15102]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15102
  [i915#15104]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15104
  [i915#15128]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15128
  [i915#15132]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15132
  [i915#15243]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15243
  [i915#15329]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15329
  [i915#15330]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15330
  [i915#15342]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15342
  [i915#15347]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15347
  [i915#15458]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15458
  [i915#15459]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15459
  [i915#15460]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15460
  [i915#15479]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15479
  [i915#15500]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15500
  [i915#15529]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15529
  [i915#15582]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15582
  [i915#15643]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15643
  [i915#15662]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15662
  [i915#15672]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15672
  [i915#15709]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15709
  [i915#15739]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15739
  [i915#15815]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15815
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
  [i915#16184]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16184
  [i915#16236]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16236
  [i915#16348]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16348
  [i915#16358]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16358
  [i915#16361]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16361
  [i915#16466]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16466
  [i915#16471]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16471
  [i915#16518]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16518
  [i915#16593]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16593
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
  [i915#2658]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2658
  [i915#280]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/280
  [i915#284]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/284
  [i915#2856]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2856
  [i915#3023]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3023
  [i915#3116]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3116
  [i915#3281]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3281
  [i915#3282]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3282
  [i915#3291]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3291
  [i915#3297]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3297
  [i915#3299]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3299
  [i915#3547]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3547
  [i915#3555]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3555
  [i915#3637]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3637
  [i915#3638]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3638
  [i915#3708]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3708
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
  [i915#5190]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5190
  [i915#5286]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5286
  [i915#5354]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5354
  [i915#5439]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5439
  [i915#6095]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6095
  [i915#6113]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6113
  [i915#6301]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6301
  [i915#6524]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6524
  [i915#658]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/658
  [i915#6590]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6590
  [i915#6953]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6953
  [i915#7697]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/7697
  [i915#7707]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/7707
  [i915#7828]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/7828
  [i915#8228]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8228
  [i915#8411]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8411
  [i915#8430]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8430
  [i915#8623]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8623
  [i915#8708]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8708
  [i915#8813]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8813
  [i915#8825]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8825
  [i915#9340]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9340
  [i915#9423]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9423
  [i915#9433]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9433
  [i915#9531]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9531
  [i915#9683]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9683
  [i915#9685]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9685
  [i915#9732]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9732
  [i915#9766]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9766
  [i915#9812]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9812
  [i915#9833]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9833
  [i915#9906]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9906
  [i915#9917]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9917
  [i915#9934]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9934
  [i915#9979]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9979


Build changes
-------------

  * Linux: CI_DRM_18943 -> Patchwork_171547v1

  CI-20190529: 20190529
  CI_DRM_18943: 0377b35cbeef071dfeed06ccadc0d7607eccaa64 @ git://anongit.freedesktop.org/gfx-ci/linux
  IGT_9036: 9036
  Patchwork_171547v1: 0377b35cbeef071dfeed06ccadc0d7607eccaa64 @ git://anongit.freedesktop.org/gfx-ci/linux
  piglit_4509: fdc5a4ca11124ab8413c7988896eec4c97336694 @ git://anongit.freedesktop.org/piglit

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_171547v1/index.html

--===============9202677912254395861==
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
<tr><td><b>Series:</b></td><td>drm/dp: Add EDP_20 rev definition</td></tr>
<tr><td><b>URL:</b></td><td><a href=3D"https://patchwork.freedesktop.org/se=
ries/171547/">https://patchwork.freedesktop.org/series/171547/</a></td></tr>
<tr><td><b>State:</b></td><td>failure</td></tr>

    <tr><td><b>Details:</b></td><td><a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/Patchwork_171547v1/index.html">https://intel-gfx-ci.01.org/tre=
e/drm-tip/Patchwork_171547v1/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from CI_DRM_18943_full -&gt; Patchwork_171547v=
1_full</h1>
<h2>Summary</h2>
<p><strong>FAILURE</strong></p>
<p>Serious unknown changes coming with Patchwork_171547v1_full absolutely n=
eed to be<br />
  verified manually.</p>
<p>If you think the reported changes have nothing to do with the changes<br=
 />
  introduced in Patchwork_171547v1_full, please notify your bug team (I915-=
ci-infra@lists.freedesktop.org) to allow them<br />
  to document this new failure mode, which will reduce false positives in C=
I.</p>
<h2>Participating hosts (10 -&gt; 10)</h2>
<p>No changes in participating hosts</p>
<h2>Possible new issues</h2>
<p>Here are the unknown changes that may have been introduced in Patchwork_=
171547v1_full:</p>
<h3>IGT changes</h3>
<h4>Possible regressions</h4>
<ul>
<li>igt@kms_psr2_sf@psr2-overlay-plane-move-continuous-sf@pipe-b-edp-1:<ul>
<li>shard-mtlp:         (<a href=3D"https://intel-gfx-ci.01.org/tree/drm-ti=
p/CI_DRM_18943/shard-mtlp-4/igt@kms_psr2_sf@psr2-overlay-plane-move-continu=
ous-sf@pipe-b-edp-1.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/CI_DRM_18943/shard-mtlp-8/igt@kms_psr2_sf@psr2-overlay-plane-m=
ove-continuous-sf@pipe-b-edp-1.html">PASS</a>) -&gt; <a href=3D"https://int=
el-gfx-ci.01.org/tree/drm-tip/Patchwork_171547v1/shard-mtlp-5/igt@kms_psr2_=
sf@psr2-overlay-plane-move-continuous-sf@pipe-b-edp-1.html">FAIL</a> +4 oth=
er tests fail</li>
</ul>
</li>
</ul>
<h2>Known issues</h2>
<p>Here are the changes found in Patchwork_171547v1_full that come from kno=
wn issues:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>
<p>igt@fbdev@nullptr:</p>
<ul>
<li>shard-dg2:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_18943/shard-dg2-8/igt@fbdev@nullptr.html">PASS</a> -&gt; <a href=3D=
"https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_171547v1/shard-dg2-10/i=
gt@fbdev@nullptr.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/=
drm/i915/kernel/-/issues/2582">i915#2582</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_bad_reloc@negative-reloc-lut:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/Patchwork_171547v1/shard-rkl-8/igt@gem_bad_reloc@negative-rel=
oc-lut.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/k=
ernel/-/issues/3281">i915#3281</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@gem_basic@multigpu-create-close:</p>
<ul>
<li>shard-tglu-1:       NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/Patchwork_171547v1/shard-tglu-1/igt@gem_basic@multigpu-create=
-close.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/k=
ernel/-/issues/7697">i915#7697</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_ctx_isolation@preservation-s3:</p>
<ul>
<li>shard-glk10:        NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/Patchwork_171547v1/shard-glk10/igt@gem_ctx_isolation@preserva=
tion-s3.html">INCOMPLETE</a> (<a href=3D"https://gitlab.freedesktop.org/drm=
/i915/kernel/-/issues/13356">i915#13356</a> / <a href=3D"https://gitlab.fre=
edesktop.org/drm/i915/kernel/-/issues/16466">i915#16466</a>) +1 other test =
incomplete</li>
</ul>
</li>
<li>
<p>igt@gem_ctx_sseu@engines:</p>
<ul>
<li>shard-tglu-1:       NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/Patchwork_171547v1/shard-tglu-1/igt@gem_ctx_sseu@engines.html=
">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/iss=
ues/280">i915#280</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_eio@in-flight-suspend:</p>
<ul>
<li>shard-dg1:          (<a href=3D"https://intel-gfx-ci.01.org/tree/drm-ti=
p/CI_DRM_18943/shard-dg1-19/igt@gem_eio@in-flight-suspend.html">PASS</a>, <=
a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18943/shard-dg1-1=
3/igt@gem_eio@in-flight-suspend.html">PASS</a>) -&gt; <a href=3D"https://in=
tel-gfx-ci.01.org/tree/drm-tip/Patchwork_171547v1/shard-dg1-12/igt@gem_eio@=
in-flight-suspend.html">DMESG-WARN</a> (<a href=3D"https://gitlab.freedeskt=
op.org/drm/i915/kernel/-/issues/13390">i915#13390</a> / <a href=3D"https://=
gitlab.freedesktop.org/drm/i915/kernel/-/issues/4391">i915#4391</a> / <a hr=
ef=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4423">i915#44=
23</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_exec_balancer@parallel-keep-submit-fence:</p>
<ul>
<li>shard-tglu-1:       NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/Patchwork_171547v1/shard-tglu-1/igt@gem_exec_balancer@paralle=
l-keep-submit-fence.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.o=
rg/drm/i915/kernel/-/issues/4525">i915#4525</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_lmem_swapping@massive-random:</p>
<ul>
<li>shard-tglu-1:       NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/Patchwork_171547v1/shard-tglu-1/igt@gem_lmem_swapping@massive=
-random.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/=
kernel/-/issues/4613">i915#4613</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_lmem_swapping@parallel-multi:</p>
<ul>
<li>shard-glk:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/Patchwork_171547v1/shard-glk8/igt@gem_lmem_swapping@parallel-=
multi.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/ke=
rnel/-/issues/4613">i915#4613</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_pread@display:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/Patchwork_171547v1/shard-rkl-8/igt@gem_pread@display.html">SK=
IP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/=
3282">i915#3282</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@gem_pread@exhaustion:</p>
<ul>
<li>shard-glk11:        NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/Patchwork_171547v1/shard-glk11/igt@gem_pread@exhaustion.html"=
>WARN</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issu=
es/2658">i915#2658</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_workarounds@suspend-resume-fd:</p>
<ul>
<li>shard-glk11:        NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/Patchwork_171547v1/shard-glk11/igt@gem_workarounds@suspend-re=
sume-fd.html">INCOMPLETE</a> (<a href=3D"https://gitlab.freedesktop.org/drm=
/i915/kernel/-/issues/13356">i915#13356</a> / <a href=3D"https://gitlab.fre=
edesktop.org/drm/i915/kernel/-/issues/14586">i915#14586</a>)</li>
</ul>
</li>
<li>
<p>igt@gen9_exec_parse@bb-start-far:</p>
<ul>
<li>shard-tglu-1:       NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/Patchwork_171547v1/shard-tglu-1/igt@gen9_exec_parse@bb-start-=
far.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kern=
el/-/issues/2527">i915#2527</a> / <a href=3D"https://gitlab.freedesktop.org=
/drm/i915/kernel/-/issues/2856">i915#2856</a>)</li>
</ul>
</li>
<li>
<p>igt@i915_module_load@fault-injection@intel_connector_register:</p>
<ul>
<li>shard-glk10:        NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/Patchwork_171547v1/shard-glk10/igt@i915_module_load@fault-inj=
ection@intel_connector_register.html">ABORT</a> (<a href=3D"https://gitlab.=
freedesktop.org/drm/i915/kernel/-/issues/15342">i915#15342</a>) +1 other te=
st abort</li>
</ul>
</li>
<li>
<p>igt@i915_module_load@fault-injection@intel_gt_init-enodev:</p>
<ul>
<li>shard-glk10:        NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/Patchwork_171547v1/shard-glk10/igt@i915_module_load@fault-inj=
ection@intel_gt_init-enodev.html">SKIP</a> +215 other tests skip</li>
</ul>
</li>
<li>
<p>igt@i915_pm_freq_api@freq-suspend@gt0:</p>
<ul>
<li>shard-dg2:          (<a href=3D"https://intel-gfx-ci.01.org/tree/drm-ti=
p/CI_DRM_18943/shard-dg2-7/igt@i915_pm_freq_api@freq-suspend@gt0.html">PASS=
</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18943/shar=
d-dg2-8/igt@i915_pm_freq_api@freq-suspend@gt0.html">PASS</a>) -&gt; <a href=
=3D"https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_171547v1/shard-dg2-3=
/igt@i915_pm_freq_api@freq-suspend@gt0.html">INCOMPLETE</a> (<a href=3D"htt=
ps://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13356">i915#13356</a> =
/ <a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13820"=
>i915#13820</a>) +1 other test incomplete</li>
</ul>
</li>
<li>
<p>igt@i915_pm_freq_mult@media-freq@gt0:</p>
<ul>
<li>shard-tglu-1:       NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/Patchwork_171547v1/shard-tglu-1/igt@i915_pm_freq_mult@media-f=
req@gt0.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/=
kernel/-/issues/6590">i915#6590</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@i915_pm_rpm@gem-execbuf-stress-pc8:</p>
<ul>
<li>shard-glk:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/Patchwork_171547v1/shard-glk8/igt@i915_pm_rpm@gem-execbuf-str=
ess-pc8.html">SKIP</a> +76 other tests skip</li>
</ul>
</li>
<li>
<p>igt@i915_pm_rpm@system-suspend:</p>
<ul>
<li>shard-rkl:          (<a href=3D"https://intel-gfx-ci.01.org/tree/drm-ti=
p/CI_DRM_18943/shard-rkl-7/igt@i915_pm_rpm@system-suspend.html">PASS</a>, <=
a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18943/shard-rkl-8=
/igt@i915_pm_rpm@system-suspend.html">PASS</a>) -&gt; <a href=3D"https://in=
tel-gfx-ci.01.org/tree/drm-tip/Patchwork_171547v1/shard-rkl-6/igt@i915_pm_r=
pm@system-suspend.html">INCOMPLETE</a> (<a href=3D"https://gitlab.freedeskt=
op.org/drm/i915/kernel/-/issues/13356">i915#13356</a>)</li>
</ul>
</li>
<li>
<p>igt@i915_suspend@sysfs-reader:</p>
<ul>
<li>shard-glk:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_18943/shard-glk1/igt@i915_suspend@sysfs-reader.html">PASS</a> -&gt;=
 <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_171547v1/sha=
rd-glk6/igt@i915_suspend@sysfs-reader.html">INCOMPLETE</a> (<a href=3D"http=
s://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16182">i915#16182</a> /=
 <a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4817">i=
915#4817</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_atomic@plane-primary-legacy:</p>
<ul>
<li>shard-dg2:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_18943/shard-dg2-8/igt@kms_atomic@plane-primary-legacy.html">PASS</a=
> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_17154=
7v1/shard-dg2-10/igt@kms_atomic@plane-primary-legacy.html">SKIP</a> (<a hre=
f=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16707">i915#16=
707</a>) +9 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@4-tiled-addfb:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/Patchwork_171547v1/shard-rkl-8/igt@kms_big_fb@4-tiled-addfb.h=
tml">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/=
issues/5286">i915#5286</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@4-tiled-max-hw-stride-32bpp-rotate-180-hflip-async-flip:<=
/p>
<ul>
<li>shard-tglu-1:       NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/Patchwork_171547v1/shard-tglu-1/igt@kms_big_fb@4-tiled-max-hw=
-stride-32bpp-rotate-180-hflip-async-flip.html">SKIP</a> (<a href=3D"https:=
//gitlab.freedesktop.org/drm/i915/kernel/-/issues/5286">i915#5286</a>) +2 o=
ther tests skip</li>
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
e/drm-tip/Patchwork_171547v1/shard-dg2-10/igt@kms_big_fb@4-tiled-max-hw-str=
ide-64bpp-rotate-0-hflip.html">SKIP</a> (<a href=3D"https://gitlab.freedesk=
top.org/drm/i915/kernel/-/issues/16707">i915#16707</a>) +23 other tests ski=
p</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@linear-max-hw-stride-32bpp-rotate-0-hflip:</p>
<ul>
<li>shard-tglu-1:       NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/Patchwork_171547v1/shard-tglu-1/igt@kms_big_fb@linear-max-hw-=
stride-32bpp-rotate-0-hflip.html">SKIP</a> (<a href=3D"https://gitlab.freed=
esktop.org/drm/i915/kernel/-/issues/3828">i915#3828</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@bad-aux-stride-y-tiled-gen12-mc-ccs@pipe-c-hdmi-a-2:</p>
<ul>
<li>shard-glk11:        NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/Patchwork_171547v1/shard-glk11/igt@kms_ccs@bad-aux-stride-y-t=
iled-gen12-mc-ccs@pipe-c-hdmi-a-2.html">SKIP</a> +156 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@bad-aux-stride-y-tiled-gen12-rc-ccs-cc@pipe-d-hdmi-a-1:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/Patchwork_171547v1/shard-dg2-4/igt@kms_ccs@bad-aux-stride-y-t=
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
/tree/drm-tip/Patchwork_171547v1/shard-rkl-7/igt@kms_ccs@bad-rotation-90-4-=
tiled-mtl-rc-ccs@pipe-b-hdmi-a-2.html">SKIP</a> (<a href=3D"https://gitlab.=
freedesktop.org/drm/i915/kernel/-/issues/6095">i915#6095</a>) +43 other tes=
ts skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-basic-4-tiled-mtl-mc-ccs@pipe-d-hdmi-a-1:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/Patchwork_171547v1/shard-dg2-4/igt@kms_ccs@crc-primary-basic-=
4-tiled-mtl-mc-ccs@pipe-d-hdmi-a-1.html">SKIP</a> (<a href=3D"https://gitla=
b.freedesktop.org/drm/i915/kernel/-/issues/10307">i915#10307</a> / <a href=
=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6095">i915#6095=
</a>) +34 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-suspend-4-tiled-dg2-mc-ccs:</p>
<ul>
<li>shard-tglu-1:       NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/Patchwork_171547v1/shard-tglu-1/igt@kms_ccs@crc-primary-suspe=
nd-4-tiled-dg2-mc-ccs.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop=
.org/drm/i915/kernel/-/issues/6095">i915#6095</a>) +44 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-suspend-4-tiled-lnl-ccs:</p>
<ul>
<li>shard-tglu-1:       NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/Patchwork_171547v1/shard-tglu-1/igt@kms_ccs@crc-primary-suspe=
nd-4-tiled-lnl-ccs.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.or=
g/drm/i915/kernel/-/issues/12805">i915#12805</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-suspend-4-tiled-mtl-rc-ccs-cc@pipe-c-hdmi-a-1:</=
p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/Patchwork_171547v1/shard-dg1-15/igt@kms_ccs@crc-primary-suspe=
nd-4-tiled-mtl-rc-ccs-cc@pipe-c-hdmi-a-1.html">SKIP</a> (<a href=3D"https:/=
/gitlab.freedesktop.org/drm/i915/kernel/-/issues/6095">i915#6095</a>) +51 o=
ther tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-suspend-yf-tiled-ccs:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/Patchwork_171547v1/shard-rkl-8/igt@kms_ccs@crc-primary-suspen=
d-yf-tiled-ccs.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/dr=
m/i915/kernel/-/issues/14098">i915#14098</a> / <a href=3D"https://gitlab.fr=
eedesktop.org/drm/i915/kernel/-/issues/6095">i915#6095</a>) +24 other tests=
 skip</li>
</ul>
</li>
<li>
<p>igt@kms_cdclk@plane-scaling@pipe-d-hdmi-a-1:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/Patchwork_171547v1/shard-dg2-4/igt@kms_cdclk@plane-scaling@pi=
pe-d-hdmi-a-1.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm=
/i915/kernel/-/issues/13783">i915#13783</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_hpd@dp-hpd-fast:</p>
<ul>
<li>shard-tglu-1:       NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/Patchwork_171547v1/shard-tglu-1/igt@kms_chamelium_hpd@dp-hpd-=
fast.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/ker=
nel/-/issues/11151">i915#11151</a> / <a href=3D"https://gitlab.freedesktop.=
org/drm/i915/kernel/-/issues/7828">i915#7828</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_hpd@hdmi-hpd-enable-disable-mode:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/Patchwork_171547v1/shard-rkl-8/igt@kms_chamelium_hpd@hdmi-hpd=
-enable-disable-mode.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.=
org/drm/i915/kernel/-/issues/11151">i915#11151</a> / <a href=3D"https://git=
lab.freedesktop.org/drm/i915/kernel/-/issues/7828">i915#7828</a>) +1 other =
test skip</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-0-25:</p>
<ul>
<li>shard-dg2:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_18943/shard-dg2-8/igt@kms_color@ctm-0-25.html">PASS</a> -&gt; <a hr=
ef=3D"https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_171547v1/shard-dg2=
-10/igt@kms_color@ctm-0-25.html">SKIP</a> (<a href=3D"https://gitlab.freede=
sktop.org/drm/i915/kernel/-/issues/12655">i915#12655</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-0-50:</p>
<ul>
<li>shard-dg2:          (<a href=3D"https://intel-gfx-ci.01.org/tree/drm-ti=
p/CI_DRM_18943/shard-dg2-6/igt@kms_color@ctm-0-50.html">PASS</a>, <a href=
=3D"https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18943/shard-dg2-5/igt@k=
ms_color@ctm-0-50.html">PASS</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.=
org/tree/drm-tip/Patchwork_171547v1/shard-dg2-10/igt@kms_color@ctm-0-50.htm=
l">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/is=
sues/12655">i915#12655</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_color@deep-color:</p>
<ul>
<li>shard-tglu-1:       NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/Patchwork_171547v1/shard-tglu-1/igt@kms_color@deep-color.html=
">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/iss=
ues/3555">i915#3555</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i91=
5/kernel/-/issues/9979">i915#9979</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@dp-mst-lic-type-0:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/Patchwork_171547v1/shard-rkl-8/igt@kms_content_protection@dp-=
mst-lic-type-0.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/dr=
m/i915/kernel/-/issues/15330">i915#15330</a> / <a href=3D"https://gitlab.fr=
eedesktop.org/drm/i915/kernel/-/issues/3116">i915#3116</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@dp-mst-lic-type-0-hdcp14:</p>
<ul>
<li>shard-tglu-1:       NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/Patchwork_171547v1/shard-tglu-1/igt@kms_content_protection@dp=
-mst-lic-type-0-hdcp14.html">SKIP</a> (<a href=3D"https://gitlab.freedeskto=
p.org/drm/i915/kernel/-/issues/15330">i915#15330</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@uevent:</p>
<ul>
<li>shard-tglu-1:       NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/Patchwork_171547v1/shard-tglu-1/igt@kms_content_protection@ue=
vent.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/ker=
nel/-/issues/15865">i915#15865</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-offscreen-32x10:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/Patchwork_171547v1/shard-rkl-8/igt@kms_cursor_crc@cursor-offs=
creen-32x10.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i=
915/kernel/-/issues/3555">i915#3555</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-onscreen-128x42@pipe-a-hdmi-a-1:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/Patchwork_171547v1/shard-rkl-5/igt@kms_cursor_crc@cursor-onsc=
reen-128x42@pipe-a-hdmi-a-1.html">FAIL</a> (<a href=3D"https://gitlab.freed=
esktop.org/drm/i915/kernel/-/issues/13566">i915#13566</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-onscreen-64x21@pipe-a-hdmi-a-1:</p>
<ul>
<li>shard-tglu-1:       NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/Patchwork_171547v1/shard-tglu-1/igt@kms_cursor_crc@cursor-ons=
creen-64x21@pipe-a-hdmi-a-1.html">FAIL</a> (<a href=3D"https://gitlab.freed=
esktop.org/drm/i915/kernel/-/issues/13566">i915#13566</a>) +1 other test fa=
il</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-random-256x85@pipe-a-hdmi-a-1:</p>
<ul>
<li>shard-tglu:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_18943/shard-tglu-4/igt@kms_cursor_crc@cursor-random-256x85@pipe-a-h=
dmi-a-1.html">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/dr=
m-tip/Patchwork_171547v1/shard-tglu-10/igt@kms_cursor_crc@cursor-random-256=
x85@pipe-a-hdmi-a-1.html">FAIL</a> (<a href=3D"https://gitlab.freedesktop.o=
rg/drm/i915/kernel/-/issues/13566">i915#13566</a>) +1 other test fail</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-rapid-movement-512x512:</p>
<ul>
<li>shard-tglu-1:       NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/Patchwork_171547v1/shard-tglu-1/igt@kms_cursor_crc@cursor-rap=
id-movement-512x512.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.o=
rg/drm/i915/kernel/-/issues/13049">i915#13049</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@cursora-vs-flipa-atomic:</p>
<ul>
<li>shard-dg1:          (<a href=3D"https://intel-gfx-ci.01.org/tree/drm-ti=
p/CI_DRM_18943/shard-dg1-17/igt@kms_cursor_legacy@cursora-vs-flipa-atomic.h=
tml">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_1=
8943/shard-dg1-15/igt@kms_cursor_legacy@cursora-vs-flipa-atomic.html">PASS<=
/a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_17=
1547v1/shard-dg1-14/igt@kms_cursor_legacy@cursora-vs-flipa-atomic.html">DME=
SG-WARN</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/is=
sues/4423">i915#4423</a>) +3 other tests dmesg-warn</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@short-busy-flip-before-cursor-atomic-transitions-v=
arying-size:</p>
<ul>
<li>shard-tglu-1:       NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/Patchwork_171547v1/shard-tglu-1/igt@kms_cursor_legacy@short-b=
usy-flip-before-cursor-atomic-transitions-varying-size.html">SKIP</a> (<a h=
ref=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4103">i915#4=
103</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_dp_link_training@non-uhbr-mst:</p>
<ul>
<li>shard-tglu-1:       NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/Patchwork_171547v1/shard-tglu-1/igt@kms_dp_link_training@non-=
uhbr-mst.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915=
/kernel/-/issues/13749">i915#13749</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_dsc@dsc-fractional-bpp:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/Patchwork_171547v1/shard-rkl-8/igt@kms_dsc@dsc-fractional-bpp=
.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/=
-/issues/16361">i915#16361</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_dsc@dsc-with-output-formats:</p>
<ul>
<li>shard-tglu-1:       NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/Patchwork_171547v1/shard-tglu-1/igt@kms_dsc@dsc-with-output-f=
ormats.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/k=
ernel/-/issues/16361">i915#16361</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_fbcon_fbt@fbc-suspend:</p>
<ul>
<li>shard-dg2:          (<a href=3D"https://intel-gfx-ci.01.org/tree/drm-ti=
p/CI_DRM_18943/shard-dg2-5/igt@kms_fbcon_fbt@fbc-suspend.html">PASS</a>, <a=
 href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18943/shard-dg2-6/=
igt@kms_fbcon_fbt@fbc-suspend.html">PASS</a>) -&gt; <a href=3D"https://inte=
l-gfx-ci.01.org/tree/drm-tip/Patchwork_171547v1/shard-dg2-10/igt@kms_fbcon_=
fbt@fbc-suspend.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/d=
rm/i915/kernel/-/issues/1849">i915#1849</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_feature_discovery@dsc:</p>
<ul>
<li>shard-tglu-1:       NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/Patchwork_171547v1/shard-tglu-1/igt@kms_feature_discovery@dsc=
.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/=
-/issues/16600">i915#16600</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_feature_discovery@psr1:</p>
<ul>
<li>shard-tglu-1:       NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/Patchwork_171547v1/shard-tglu-1/igt@kms_feature_discovery@psr=
1.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel=
/-/issues/658">i915#658</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-absolute-wf_vblank:</p>
<ul>
<li>shard-tglu-1:       NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/Patchwork_171547v1/shard-tglu-1/igt@kms_flip@2x-absolute-wf_v=
blank.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/ke=
rnel/-/issues/3637">i915#3637</a> / <a href=3D"https://gitlab.freedesktop.o=
rg/drm/i915/kernel/-/issues/9934">i915#9934</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip@absolute-wf_vblank:</p>
<ul>
<li>shard-dg2:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_18943/shard-dg2-8/igt@kms_flip@absolute-wf_vblank.html">PASS</a> -&=
gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_171547v1/=
shard-dg2-10/igt@kms_flip@absolute-wf_vblank.html">SKIP</a> (<a href=3D"htt=
ps://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5354">i915#5354</a>) +=
1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip@dpms-off-confusion-interruptible:</p>
<ul>
<li>shard-dg2:          (<a href=3D"https://intel-gfx-ci.01.org/tree/drm-ti=
p/CI_DRM_18943/shard-dg2-5/igt@kms_flip@dpms-off-confusion-interruptible.ht=
ml">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18=
943/shard-dg2-6/igt@kms_flip@dpms-off-confusion-interruptible.html">PASS</a=
>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_1715=
47v1/shard-dg2-10/igt@kms_flip@dpms-off-confusion-interruptible.html">SKIP<=
/a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/535=
4">i915#5354</a>) +6 other tests skip</li>
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
tip/Patchwork_171547v1/shard-dg1-16/igt@kms_flip@flip-vs-absolute-wf_vblank=
-interruptible.html">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/dr=
m/i915/kernel/-/issues/14600">i915#14600</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-absolute-wf_vblank-interruptible@c-hdmi-a4:</p>
<ul>
<li>shard-dg1:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_18943/shard-dg1-19/igt@kms_flip@flip-vs-absolute-wf_vblank-interrup=
tible@c-hdmi-a4.html">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/Patchwork_171547v1/shard-dg1-16/igt@kms_flip@flip-vs-absolute=
-wf_vblank-interruptible@c-hdmi-a4.html">FAIL</a> (<a href=3D"https://gitla=
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
//intel-gfx-ci.01.org/tree/drm-tip/Patchwork_171547v1/shard-dg2-10/igt@kms_=
flip@flip-vs-dpms-on-nop.html">SKIP</a> (<a href=3D"https://gitlab.freedesk=
top.org/drm/i915/kernel/-/issues/16724">i915#16724</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-suspend:</p>
<ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_18943/shard-rkl-5/igt@kms_flip@flip-vs-suspend.html">PASS</a> -&gt;=
 <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_171547v1/sha=
rd-rkl-1/igt@kms_flip@flip-vs-suspend.html">ABORT</a> (<a href=3D"https://g=
itlab.freedesktop.org/drm/i915/kernel/-/issues/15132">i915#15132</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-suspend@a-hdmi-a2:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/Patchwork_171547v1/shard-rkl-1/igt@kms_flip@flip-vs-suspend@a=
-hdmi-a2.html">ABORT</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i91=
5/kernel/-/issues/15132">i915#15132</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-32bpp-4tile-to-32bpp-4tiledg2rcccs-downscal=
ing:</p>
<ul>
<li>shard-dg2:          (<a href=3D"https://intel-gfx-ci.01.org/tree/drm-ti=
p/CI_DRM_18943/shard-dg2-6/igt@kms_flip_scaled_crc@flip-32bpp-4tile-to-32bp=
p-4tiledg2rcccs-downscaling.html">PASS</a>, <a href=3D"https://intel-gfx-ci=
.01.org/tree/drm-tip/CI_DRM_18943/shard-dg2-5/igt@kms_flip_scaled_crc@flip-=
32bpp-4tile-to-32bpp-4tiledg2rcccs-downscaling.html">PASS</a>) -&gt; <a hre=
f=3D"https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_171547v1/shard-dg2-=
10/igt@kms_flip_scaled_crc@flip-32bpp-4tile-to-32bpp-4tiledg2rcccs-downscal=
ing.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kern=
el/-/issues/3555">i915#3555</a> / <a href=3D"https://gitlab.freedesktop.org=
/drm/i915/kernel/-/issues/8813">i915#8813</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-32bpp-xtile-to-64bpp-xtile-downscaling:</p>
<ul>
<li>shard-dg2:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_18943/shard-dg2-8/igt@kms_flip_scaled_crc@flip-32bpp-xtile-to-64bpp=
-xtile-downscaling.html">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.=
org/tree/drm-tip/Patchwork_171547v1/shard-dg2-10/igt@kms_flip_scaled_crc@fl=
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
/tree/drm-tip/Patchwork_171547v1/shard-rkl-8/igt@kms_flip_scaled_crc@flip-6=
4bpp-4tile-to-16bpp-4tile-downscaling.html">SKIP</a> (<a href=3D"https://gi=
tlab.freedesktop.org/drm/i915/kernel/-/issues/15643">i915#15643</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-32bpp-4tiledg2rcccs-upscalin=
g:</p>
<ul>
<li>shard-tglu-1:       NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/Patchwork_171547v1/shard-tglu-1/igt@kms_flip_scaled_crc@flip-=
64bpp-4tile-to-32bpp-4tiledg2rcccs-upscaling.html">SKIP</a> (<a href=3D"htt=
ps://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15643">i915#15643</a>)=
 +1 other test skip</li>
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
el-gfx-ci.01.org/tree/drm-tip/Patchwork_171547v1/shard-dg2-10/igt@kms_front=
buffer_tracking@fbc-1p-offscreen-pri-indfb-draw-render.html">SKIP</a> (<a h=
ref=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16708">i915#=
16708</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-2p-primscrn-pri-shrfb-draw-mmap-cpu:</p>
<ul>
<li>shard-tglu-1:       NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/Patchwork_171547v1/shard-tglu-1/igt@kms_frontbuffer_tracking@=
fbc-2p-primscrn-pri-shrfb-draw-mmap-cpu.html">SKIP</a> +53 other tests skip=
</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-rgb565-draw-render:</p>
<ul>
<li>shard-dg2:          (<a href=3D"https://intel-gfx-ci.01.org/tree/drm-ti=
p/CI_DRM_18943/shard-dg2-5/igt@kms_frontbuffer_tracking@fbc-rgb565-draw-ren=
der.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/CI_=
DRM_18943/shard-dg2-6/igt@kms_frontbuffer_tracking@fbc-rgb565-draw-render.h=
tml">PASS</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/Pa=
tchwork_171547v1/shard-dg2-10/igt@kms_frontbuffer_tracking@fbc-rgb565-draw-=
render.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/k=
ernel/-/issues/16708">i915#16708</a> / <a href=3D"https://gitlab.freedeskto=
p.org/drm/i915/kernel/-/issues/5354">i915#5354</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbchdr-1p-primscrn-pri-indfb-draw-mmap-gtt:=
</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/Patchwork_171547v1/shard-rkl-8/igt@kms_frontbuffer_tracking@f=
bchdr-1p-primscrn-pri-indfb-draw-mmap-gtt.html">SKIP</a> (<a href=3D"https:=
//gitlab.freedesktop.org/drm/i915/kernel/-/issues/15989">i915#15989</a>) +2=
 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbchdr-rgb101010-draw-render:</p>
<ul>
<li>shard-tglu-1:       NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/Patchwork_171547v1/shard-tglu-1/igt@kms_frontbuffer_tracking@=
fbchdr-rgb101010-draw-render.html">SKIP</a> (<a href=3D"https://gitlab.free=
desktop.org/drm/i915/kernel/-/issues/15989">i915#15989</a>) +9 other tests =
skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbchdr-suspend:</p>
<ul>
<li>shard-glk11:        NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/Patchwork_171547v1/shard-glk11/igt@kms_frontbuffer_tracking@f=
bchdr-suspend.html">INCOMPLETE</a> (<a href=3D"https://gitlab.freedesktop.o=
rg/drm/i915/kernel/-/issues/16056">i915#16056</a> / <a href=3D"https://gitl=
ab.freedesktop.org/drm/i915/kernel/-/issues/16593">i915#16593</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-spr-indfb-onoff:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/Patchwork_171547v1/shard-rkl-8/igt@kms_frontbuffer_tracking@f=
bcpsr-1p-primscrn-spr-indfb-onoff.html">SKIP</a> (<a href=3D"https://gitlab=
.freedesktop.org/drm/i915/kernel/-/issues/15102">i915#15102</a> / <a href=
=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3023">i915#3023=
</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-tiling-4:</p>
<ul>
<li>shard-tglu-1:       NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/Patchwork_171547v1/shard-tglu-1/igt@kms_frontbuffer_tracking@=
fbcpsr-tiling-4.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/d=
rm/i915/kernel/-/issues/5439">i915#5439</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsrhdr-1p-offscreen-pri-shrfb-draw-mmap-=
cpu:</p>
<ul>
<li>shard-tglu-1:       NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/Patchwork_171547v1/shard-tglu-1/igt@kms_frontbuffer_tracking@=
fbcpsrhdr-1p-offscreen-pri-shrfb-draw-mmap-cpu.html">SKIP</a> (<a href=3D"h=
ttps://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15102">i915#15102</a=
>) +21 other tests skip</li>
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
el-gfx-ci.01.org/tree/drm-tip/Patchwork_171547v1/shard-rkl-4/igt@kms_frontb=
uffer_tracking@hdr-1p-offscreen-pri-indfb-draw-pwrite.html">SKIP</a> (<a hr=
ef=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15989">i915#1=
5989</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@hdr-2p-scndscrn-indfb-pgflip-blt:</p>
<ul>
<li>shard-glk:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_18943/shard-glk8/igt@kms_frontbuffer_tracking@hdr-2p-scndscrn-indfb=
-pgflip-blt.html">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tre=
e/drm-tip/Patchwork_171547v1/shard-glk5/igt@kms_frontbuffer_tracking@hdr-2p=
-scndscrn-indfb-pgflip-blt.html">SKIP</a> +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@pipe-fbc-rte:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/Patchwork_171547v1/shard-rkl-8/igt@kms_frontbuffer_tracking@p=
ipe-fbc-rte.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i=
915/kernel/-/issues/9766">i915#9766</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psrhdr-1p-offscreen-pri-indfb-draw-mmap-cpu=
:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/Patchwork_171547v1/shard-rkl-8/igt@kms_frontbuffer_tracking@p=
srhdr-1p-offscreen-pri-indfb-draw-mmap-cpu.html">SKIP</a> (<a href=3D"https=
://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15102">i915#15102</a>) +=
5 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psrhdr-2p-scndscrn-pri-shrfb-draw-blt:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/Patchwork_171547v1/shard-rkl-8/igt@kms_frontbuffer_tracking@p=
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
tel-gfx-ci.01.org/tree/drm-tip/Patchwork_171547v1/shard-rkl-4/igt@kms_hdr@s=
tatic-toggle-dpms.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org=
/drm/i915/kernel/-/issues/16644">i915#16644</a> / <a href=3D"https://gitlab=
.freedesktop.org/drm/i915/kernel/-/issues/3555">i915#3555</a> / <a href=3D"=
https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8228">i915#8228</a>=
)</li>
</ul>
</li>
<li>
<p>igt@kms_hdr@static-toggle-suspend:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/Patchwork_171547v1/shard-rkl-8/igt@kms_hdr@static-toggle-susp=
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
> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_17154=
7v1/shard-dg2-10/igt@kms_invalid_mode@clock-too-high.html">SKIP</a> (<a hre=
f=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16746">i915#16=
746</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issue=
s/3555">i915#3555</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_invalid_mode@zero-vdisplay:</p>
<ul>
<li>shard-dg2:          (<a href=3D"https://intel-gfx-ci.01.org/tree/drm-ti=
p/CI_DRM_18943/shard-dg2-5/igt@kms_invalid_mode@zero-vdisplay.html">PASS</a=
>, <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18943/shard-d=
g2-6/igt@kms_invalid_mode@zero-vdisplay.html">PASS</a>) -&gt; <a href=3D"ht=
tps://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_171547v1/shard-dg2-10/igt@=
kms_invalid_mode@zero-vdisplay.html">SKIP</a> (<a href=3D"https://gitlab.fr=
eedesktop.org/drm/i915/kernel/-/issues/16746">i915#16746</a> / <a href=3D"h=
ttps://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3555">i915#3555</a>)=
</li>
</ul>
</li>
<li>
<p>igt@kms_joiner@basic-force-big-joiner:</p>
<ul>
<li>shard-tglu-1:       NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/Patchwork_171547v1/shard-tglu-1/igt@kms_joiner@basic-force-bi=
g-joiner.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915=
/kernel/-/issues/15459">i915#15459</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_joiner@invalid-modeset-big-joiner:</p>
<ul>
<li>shard-tglu-1:       NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/Patchwork_171547v1/shard-tglu-1/igt@kms_joiner@invalid-modese=
t-big-joiner.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/=
i915/kernel/-/issues/15460">i915#15460</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_multipipe_modeset@basic-max-pipe-crc-check:</p>
<ul>
<li>shard-tglu-1:       NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/Patchwork_171547v1/shard-tglu-1/igt@kms_multipipe_modeset@bas=
ic-max-pipe-crc-check.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop=
.org/drm/i915/kernel/-/issues/15815">i915#15815</a>)</li>
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
p/Patchwork_171547v1/shard-dg2-10/igt@kms_pipe_crc_basic@nonblocking-crc-fr=
ame-sequence.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/=
i915/kernel/-/issues/11190">i915#11190</a> / <a href=3D"https://gitlab.free=
desktop.org/drm/i915/kernel/-/issues/16707">i915#16707</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pipe_crc_basic@suspend-read-crc:</p>
<ul>
<li>shard-snb:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_18943/shard-snb5/igt@kms_pipe_crc_basic@suspend-read-crc.html">PASS=
</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_17=
1547v1/shard-snb4/igt@kms_pipe_crc_basic@suspend-read-crc.html">DMESG-WARN<=
/a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/163=
58">i915#16358</a>) +1 other test dmesg-warn</li>
</ul>
</li>
<li>
<p>igt@kms_plane@pixel-format-4-tiled-dg2-rc-ccs-modifier:</p>
<ul>
<li>shard-tglu-1:       NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/Patchwork_171547v1/shard-tglu-1/igt@kms_plane@pixel-format-4-=
tiled-dg2-rc-ccs-modifier.html">SKIP</a> (<a href=3D"https://gitlab.freedes=
ktop.org/drm/i915/kernel/-/issues/15709">i915#15709</a>) +1 other test skip=
</li>
</ul>
</li>
<li>
<p>igt@kms_plane@pixel-format-4-tiled-lnl-ccs-modifier-source-clamping:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/Patchwork_171547v1/shard-rkl-8/igt@kms_plane@pixel-format-4-t=
iled-lnl-ccs-modifier-source-clamping.html">SKIP</a> (<a href=3D"https://gi=
tlab.freedesktop.org/drm/i915/kernel/-/issues/15709">i915#15709</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane@pixel-format-4-tiled-modifier:</p>
<ul>
<li>shard-dg2:          (<a href=3D"https://intel-gfx-ci.01.org/tree/drm-ti=
p/CI_DRM_18943/shard-dg2-5/igt@kms_plane@pixel-format-4-tiled-modifier.html=
">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_1894=
3/shard-dg2-6/igt@kms_plane@pixel-format-4-tiled-modifier.html">PASS</a>) -=
&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_171547v1=
/shard-dg2-10/igt@kms_plane@pixel-format-4-tiled-modifier.html">SKIP</a> (<=
a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8825">i91=
5#8825</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane_alpha_blend@alpha-transparent-fb:</p>
<ul>
<li>shard-glk10:        NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/Patchwork_171547v1/shard-glk10/igt@kms_plane_alpha_blend@alph=
a-transparent-fb.html">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/=
drm/i915/kernel/-/issues/10647">i915#10647</a> / <a href=3D"https://gitlab.=
freedesktop.org/drm/i915/kernel/-/issues/12177">i915#12177</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane_alpha_blend@alpha-transparent-fb@pipe-a-hdmi-a-1:</p>
<ul>
<li>shard-glk10:        NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/Patchwork_171547v1/shard-glk10/igt@kms_plane_alpha_blend@alph=
a-transparent-fb@pipe-a-hdmi-a-1.html">FAIL</a> (<a href=3D"https://gitlab.=
freedesktop.org/drm/i915/kernel/-/issues/10647">i915#10647</a>) +1 other te=
st fail</li>
</ul>
</li>
<li>
<p>igt@kms_plane_multiple@2x-tiling-4:</p>
<ul>
<li>shard-tglu-1:       NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/Patchwork_171547v1/shard-tglu-1/igt@kms_plane_multiple@2x-til=
ing-4.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/ke=
rnel/-/issues/13958">i915#13958</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane_multiple@2x-tiling-x:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/Patchwork_171547v1/shard-rkl-8/igt@kms_plane_multiple@2x-tili=
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
_171547v1/shard-dg2-10/igt@kms_plane_scaling@invalid-num-scalers.html">SKIP=
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
-gfx-ci.01.org/tree/drm-tip/Patchwork_171547v1/shard-dg2-10/igt@kms_plane_s=
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
el-gfx-ci.01.org/tree/drm-tip/Patchwork_171547v1/shard-dg2-10/igt@kms_plane=
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
=3D"https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_171547v1/shard-dg2-1=
0/igt@kms_plane_scaling@plane-scaler-with-clipping-clamping-modifiers@pipe-=
b.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel=
/-/issues/15329">i915#15329</a>) +11 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@planes-unity-scaling-downscale-factor-0-5:</p>
<ul>
<li>shard-dg2:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_18943/shard-dg2-8/igt@kms_plane_scaling@planes-unity-scaling-downsc=
ale-factor-0-5.html">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/Patchwork_171547v1/shard-dg2-10/igt@kms_plane_scaling@planes-u=
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
01.org/tree/drm-tip/Patchwork_171547v1/shard-dg2-10/igt@kms_plane_scaling@p=
lanes-unity-scaling-downscale-factor-0-5@pipe-b.html">SKIP</a> (<a href=3D"=
https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15329">i915#15329</=
a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@planes-upscale-factor-0-25-downscale-factor-0-5:</=
p>
<ul>
<li>shard-dg2:          (<a href=3D"https://intel-gfx-ci.01.org/tree/drm-ti=
p/CI_DRM_18943/shard-dg2-5/igt@kms_plane_scaling@planes-upscale-factor-0-25=
-downscale-factor-0-5.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.or=
g/tree/drm-tip/CI_DRM_18943/shard-dg2-6/igt@kms_plane_scaling@planes-upscal=
e-factor-0-25-downscale-factor-0-5.html">PASS</a>) -&gt; <a href=3D"https:/=
/intel-gfx-ci.01.org/tree/drm-tip/Patchwork_171547v1/shard-dg2-10/igt@kms_p=
lane_scaling@planes-upscale-factor-0-25-downscale-factor-0-5.html">SKIP</a>=
 (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15329"=
>i915#15329</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel=
/-/issues/6953">i915#6953</a> / <a href=3D"https://gitlab.freedesktop.org/d=
rm/i915/kernel/-/issues/9423">i915#9423</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pm_backlight@bad-brightness:</p>
<ul>
<li>shard-tglu-1:       NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/Patchwork_171547v1/shard-tglu-1/igt@kms_pm_backlight@bad-brig=
htness.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/k=
ernel/-/issues/12343">i915#12343</a> / <a href=3D"https://gitlab.freedeskto=
p.org/drm/i915/kernel/-/issues/9812">i915#9812</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pm_backlight@brightness-with-dpms:</p>
<ul>
<li>shard-tglu-1:       NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/Patchwork_171547v1/shard-tglu-1/igt@kms_pm_backlight@brightne=
ss-with-dpms.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/=
i915/kernel/-/issues/12343">i915#12343</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pm_rpm@dpms-mode-unset-non-lpsp:</p>
<ul>
<li>shard-dg2:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_18943/shard-dg2-8/igt@kms_pm_rpm@dpms-mode-unset-non-lpsp.html">PAS=
S</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_1=
71547v1/shard-dg2-10/igt@kms_pm_rpm@dpms-mode-unset-non-lpsp.html">SKIP</a>=
 (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15073"=
>i915#15073</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_pm_rpm@i2c:</p>
<ul>
<li>shard-dg1:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_18943/shard-dg1-12/igt@kms_pm_rpm@i2c.html">PASS</a> -&gt; <a href=
=3D"https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_171547v1/shard-dg1-1=
8/igt@kms_pm_rpm@i2c.html">DMESG-WARN</a> (<a href=3D"https://gitlab.freede=
sktop.org/drm/i915/kernel/-/issues/4423">i915#4423</a>) +1 other test dmesg=
-warn</li>
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
1547v1/shard-rkl-5/igt@kms_pm_rpm@modeset-non-lpsp-stress-no-wait.html">SKI=
P</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/1=
5073">i915#15073</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_prime@basic-crc-hybrid:</p>
<ul>
<li>shard-tglu-1:       NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/Patchwork_171547v1/shard-tglu-1/igt@kms_prime@basic-crc-hybri=
d.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel=
/-/issues/6524">i915#6524</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@fbc-psr2-cursor-plane-move-continuous-exceed-sf:</p>
<ul>
<li>shard-tglu-1:       NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/Patchwork_171547v1/shard-tglu-1/igt@kms_psr2_sf@fbc-psr2-curs=
or-plane-move-continuous-exceed-sf.html">SKIP</a> (<a href=3D"https://gitla=
b.freedesktop.org/drm/i915/kernel/-/issues/11520">i915#11520</a>) +4 other =
tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@fbc-psr2-overlay-plane-move-continuous-exceed-fully-sf:<=
/p>
<ul>
<li>shard-glk10:        NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/Patchwork_171547v1/shard-glk10/igt@kms_psr2_sf@fbc-psr2-overl=
ay-plane-move-continuous-exceed-fully-sf.html">SKIP</a> (<a href=3D"https:/=
/gitlab.freedesktop.org/drm/i915/kernel/-/issues/11520">i915#11520</a>) +5 =
other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@fbc-psr2-primary-plane-update-sf-dmg-area:</p>
<ul>
<li>shard-glk:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/Patchwork_171547v1/shard-glk8/igt@kms_psr2_sf@fbc-psr2-primar=
y-plane-update-sf-dmg-area.html">SKIP</a> (<a href=3D"https://gitlab.freede=
sktop.org/drm/i915/kernel/-/issues/11520">i915#11520</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@pr-plane-move-sf-dmg-area:</p>
<ul>
<li>shard-glk11:        NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/Patchwork_171547v1/shard-glk11/igt@kms_psr2_sf@pr-plane-move-=
sf-dmg-area.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i=
915/kernel/-/issues/11520">i915#11520</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@psr2-cursor-plane-move-continuous-sf:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/Patchwork_171547v1/shard-rkl-8/igt@kms_psr2_sf@psr2-cursor-pl=
ane-move-continuous-sf.html">SKIP</a> (<a href=3D"https://gitlab.freedeskto=
p.org/drm/i915/kernel/-/issues/11520">i915#11520</a>) +1 other test skip</l=
i>
</ul>
</li>
<li>
<p>igt@kms_psr@fbc-psr-primary-page-flip:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/Patchwork_171547v1/shard-rkl-8/igt@kms_psr@fbc-psr-primary-pa=
ge-flip.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/=
kernel/-/issues/1072">i915#1072</a> / <a href=3D"https://gitlab.freedesktop=
.org/drm/i915/kernel/-/issues/9732">i915#9732</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr@psr-cursor-plane-onoff:</p>
<ul>
<li>shard-tglu-1:       NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/Patchwork_171547v1/shard-tglu-1/igt@kms_psr@psr-cursor-plane-=
onoff.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/ke=
rnel/-/issues/9732">i915#9732</a>) +8 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_rotation_crc@multiplane-rotation-cropping-bottom:</p>
<ul>
<li>shard-glk11:        NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/Patchwork_171547v1/shard-glk11/igt@kms_rotation_crc@multiplan=
e-rotation-cropping-bottom.html">INCOMPLETE</a> (<a href=3D"https://gitlab.=
freedesktop.org/drm/i915/kernel/-/issues/15500">i915#15500</a> / <a href=3D=
"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16184">i915#16184<=
/a>)</li>
</ul>
</li>
<li>
<p>igt@kms_vblank@ts-continuation-suspend@pipe-a-hdmi-a-2:</p>
<ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_18943/shard-rkl-7/igt@kms_vblank@ts-continuation-suspend@pipe-a-hdm=
i-a-2.html">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-=
tip/Patchwork_171547v1/shard-rkl-3/igt@kms_vblank@ts-continuation-suspend@p=
ipe-a-hdmi-a-2.html">INCOMPLETE</a> (<a href=3D"https://gitlab.freedesktop.=
org/drm/i915/kernel/-/issues/12276">i915#12276</a>) +1 other test incomplet=
e</li>
</ul>
</li>
<li>
<p>igt@kms_vrr@seamless-rr-switch-virtual:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/Patchwork_171547v1/shard-rkl-8/igt@kms_vrr@seamless-rr-switch=
-virtual.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915=
/kernel/-/issues/9906">i915#9906</a>)</li>
</ul>
</li>
<li>
<p>igt@perf_pmu@rc6-suspend:</p>
<ul>
<li>shard-glk11:        NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/Patchwork_171547v1/shard-glk11/igt@perf_pmu@rc6-suspend.html"=
>INCOMPLETE</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/=
-/issues/13356">i915#13356</a> / <a href=3D"https://gitlab.freedesktop.org/=
drm/i915/kernel/-/issues/16236">i915#16236</a>)</li>
</ul>
</li>
<li>
<p>igt@prime_mmap_kms@buffer-sharing:</p>
<ul>
<li>shard-dg2:          (<a href=3D"https://intel-gfx-ci.01.org/tree/drm-ti=
p/CI_DRM_18943/shard-dg2-1/igt@prime_mmap_kms@buffer-sharing.html">PASS</a>=
, <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18943/shard-dg=
2-6/igt@prime_mmap_kms@buffer-sharing.html">PASS</a>) -&gt; <a href=3D"http=
s://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_171547v1/shard-dg2-10/igt@pr=
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
/intel-gfx-ci.01.org/tree/drm-tip/Patchwork_171547v1/shard-dg2-6/igt@fbdev@=
unaligned-read.html">PASS</a> +2 other tests pass</li>
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
k_171547v1/shard-rkl-2/igt@gem_ctx_isolation@preservation-s3.html">PASS</a>=
 +1 other test pass</li>
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
a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_171547v1/shard=
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
tchwork_171547v1/shard-rkl-8/igt@i915_suspend@fence-restore-untiled.html">P=
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
href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_171547v1/shard-r=
kl-3/igt@i915_suspend@sysfs-reader.html">PASS</a></li>
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
intel-gfx-ci.01.org/tree/drm-tip/Patchwork_171547v1/shard-dg2-1/igt@kms_asy=
nc_flips@alternate-sync-async-flip-atomic.html">PASS</a></li>
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
gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_171547v1/=
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
=3D"https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_171547v1/shard-rkl-5=
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
ntel-gfx-ci.01.org/tree/drm-tip/Patchwork_171547v1/shard-dg2-1/igt@kms_colo=
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
work_171547v1/shard-dg2-1/igt@kms_color_pipeline@plane-lut1d-ctm3x4.html">P=
ASS</a></li>
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
k_171547v1/shard-rkl-8/igt@kms_cursor_crc@cursor-sliding-256x85.html">PASS<=
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
/intel-gfx-ci.01.org/tree/drm-tip/Patchwork_171547v1/shard-dg2-1/igt@kms_fb=
_coherency@memset-crc.html">PASS</a></li>
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
ref=3D"https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_171547v1/shard-dg=
2-6/igt@kms_flip@basic-flip-vs-dpms.html">PASS</a> +10 other tests pass</li>
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
ree/drm-tip/Patchwork_171547v1/shard-dg1-18/igt@kms_flip@flip-vs-expired-vb=
lank-interruptible.html">PASS</a></li>
<li>shard-tglu:         (<a href=3D"https://intel-gfx-ci.01.org/tree/drm-ti=
p/CI_DRM_18943/shard-tglu-10/igt@kms_flip@flip-vs-expired-vblank-interrupti=
ble.html">FAIL</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/CI_=
DRM_18943/shard-tglu-4/igt@kms_flip@flip-vs-expired-vblank-interruptible.ht=
ml">FAIL</a>) (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/=
issues/13027">i915#13027</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/Patchwork_171547v1/shard-tglu-8/igt@kms_flip@flip-vs-expired-v=
blank-interruptible.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-expired-vblank-interruptible@c-hdmi-a1:</p>
<ul>
<li>shard-tglu:         (<a href=3D"https://intel-gfx-ci.01.org/tree/drm-ti=
p/CI_DRM_18943/shard-tglu-10/igt@kms_flip@flip-vs-expired-vblank-interrupti=
ble@c-hdmi-a1.html">FAIL</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/d=
rm-tip/CI_DRM_18943/shard-tglu-4/igt@kms_flip@flip-vs-expired-vblank-interr=
uptible@c-hdmi-a1.html">PASS</a>) (<a href=3D"https://gitlab.freedesktop.or=
g/drm/i915/kernel/-/issues/13027">i915#13027</a>) -&gt; <a href=3D"https://=
intel-gfx-ci.01.org/tree/drm-tip/Patchwork_171547v1/shard-tglu-8/igt@kms_fl=
ip@flip-vs-expired-vblank-interruptible@c-hdmi-a1.html">PASS</a> +1 other t=
est pass</li>
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
a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_171547v1/shard=
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
71547v1/shard-dg2-8/igt@kms_flip_scaled_crc@flip-32bpp-linear-to-64bpp-line=
ar-downscaling.html">PASS</a> +5 other tests pass</li>
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
71547v1/shard-dg2-6/igt@kms_flip_tiling@flip-change-tiling.html">PASS</a></=
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
drm-tip/Patchwork_171547v1/shard-mtlp-8/igt@kms_force_connector_basic@prune=
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
ef=3D"https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_171547v1/shard-dg2=
-6/igt@kms_frontbuffer_tracking@fbc-1p-offscreen-pri-shrfb-draw-render.html=
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
 -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_171547=
v1/shard-dg2-6/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-cur-indfb-draw-=
pwrite.html">PASS</a> +6 other tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbchdr-1p-offscreen-pri-indfb-draw-mmap-gtt=
:</p>
<ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_18943/shard-rkl-5/igt@kms_frontbuffer_tracking@fbchdr-1p-offscreen-=
pri-indfb-draw-mmap-gtt.html">SKIP</a> (<a href=3D"https://gitlab.freedeskt=
op.org/drm/i915/kernel/-/issues/15989">i915#15989</a>) -&gt; <a href=3D"htt=
ps://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_171547v1/shard-rkl-1/igt@km=
s_frontbuffer_tracking@fbchdr-1p-offscreen-pri-indfb-draw-mmap-gtt.html">PA=
SS</a> +2 other tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbchdr-1p-primscrn-cur-indfb-move:</p>
<ul>
<li>shard-glk:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_18943/shard-glk1/igt@kms_frontbuffer_tracking@fbchdr-1p-primscrn-cu=
r-indfb-move.html">SKIP</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tr=
ee/drm-tip/Patchwork_171547v1/shard-glk8/igt@kms_frontbuffer_tracking@fbchd=
r-1p-primscrn-cur-indfb-move.html">PASS</a> +19 other tests pass</li>
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
ps://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_171547v1/shard-rkl-6/igt@km=
s_frontbuffer_tracking@hdr-1p-primscrn-cur-indfb-draw-blt.html">PASS</a> +2=
 other tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@hdr-rgb565-draw-pwrite:</p>
<ul>
<li>shard-rkl:          (<a href=3D"https://intel-gfx-ci.01.org/tree/drm-ti=
p/CI_DRM_18943/shard-rkl-8/igt@kms_frontbuffer_tracking@hdr-rgb565-draw-pwr=
ite.html">SKIP</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/CI_=
DRM_18943/shard-rkl-7/igt@kms_frontbuffer_tracking@hdr-rgb565-draw-pwrite.h=
tml">SKIP</a>) (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-=
/issues/15989">i915#15989</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/Patchwork_171547v1/shard-rkl-6/igt@kms_frontbuffer_tracking@h=
dr-rgb565-draw-pwrite.html">PASS</a> +3 other tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_hdr@bpc-switch:</p>
<ul>
<li>shard-rkl:          (<a href=3D"https://intel-gfx-ci.01.org/tree/drm-ti=
p/CI_DRM_18943/shard-rkl-8/igt@kms_hdr@bpc-switch.html">SKIP</a>, <a href=
=3D"https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18943/shard-rkl-7/igt@k=
ms_hdr@bpc-switch.html">SKIP</a>) (<a href=3D"https://gitlab.freedesktop.or=
g/drm/i915/kernel/-/issues/16644">i915#16644</a> / <a href=3D"https://gitla=
b.freedesktop.org/drm/i915/kernel/-/issues/3555">i915#3555</a> / <a href=3D=
"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8228">i915#8228</a=
>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_1715=
47v1/shard-rkl-6/igt@kms_hdr@bpc-switch.html">PASS</a></li>
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
work_171547v1/shard-dg2-8/igt@kms_invalid_mode@int-max-clock.html">PASS</a>=
 +4 other tests pass</li>
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
tel-gfx-ci.01.org/tree/drm-tip/Patchwork_171547v1/shard-dg2-6/igt@kms_pipe_=
crc_basic@compare-crc-sanitycheck-xr24.html">PASS</a> +2 other tests pass</=
li>
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
hwork_171547v1/shard-glk6/igt@kms_pipe_stress@stress-xrgb8888-ytiled.html">=
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
work_171547v1/shard-dg2-1/igt@kms_plane@pixel-format-linear-modifier.html">=
PASS</a> +5 other tests pass</li>
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
chwork_171547v1/shard-dg2-1/igt@kms_plane@planar-pixel-format-settings.html=
">PASS</a></li>
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
drm-tip/Patchwork_171547v1/shard-dg2-1/igt@kms_plane_scaling@plane-scaler-w=
ith-clipping-clamping-pixel-formats.html">PASS</a></li>
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
tps://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_171547v1/shard-dg2-4/igt@k=
ms_plane_scaling@plane-upscale-20x20-with-modifiers.html">PASS</a> +5 other=
 tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-upscale-20x20-with-rotation@pipe-d:</p>
<ul>
<li>shard-dg2:          (<a href=3D"https://intel-gfx-ci.01.org/tree/drm-ti=
p/CI_DRM_18943/shard-dg2-10/igt@kms_plane_scaling@plane-upscale-20x20-with-=
rotation@pipe-d.html">SKIP</a>, <a href=3D"https://intel-gfx-ci.01.org/tree=
/drm-tip/CI_DRM_18943/shard-dg2-4/igt@kms_plane_scaling@plane-upscale-20x20=
-with-rotation@pipe-d.html">PASS</a>) (<a href=3D"https://gitlab.freedeskto=
p.org/drm/i915/kernel/-/issues/15329">i915#15329</a>) -&gt; <a href=3D"http=
s://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_171547v1/shard-dg2-1/igt@kms=
_plane_scaling@plane-upscale-20x20-with-rotation@pipe-d.html">PASS</a> +35 =
other tests pass</li>
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
drm-tip/Patchwork_171547v1/shard-dg2-8/igt@kms_plane_scaling@planes-unity-s=
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
ork_171547v1/shard-dg2-6/igt@kms_plane_scaling@planes-upscale-20x20-downsca=
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
/intel-gfx-ci.01.org/tree/drm-tip/Patchwork_171547v1/shard-dg2-4/igt@kms_pm=
_lpsp@kms-lpsp.html">PASS</a></li>
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
://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_171547v1/shard-dg2-4/igt@kms_=
pm_rpm@dpms-lpsp.html">PASS</a> +3 other tests pass</li>
<li>shard-dg1:          (<a href=3D"https://intel-gfx-ci.01.org/tree/drm-ti=
p/CI_DRM_18943/shard-dg1-14/igt@kms_pm_rpm@dpms-lpsp.html">PASS</a>, <a hre=
f=3D"https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18943/shard-dg1-13/igt=
@kms_pm_rpm@dpms-lpsp.html">SKIP</a>) (<a href=3D"https://gitlab.freedeskto=
p.org/drm/i915/kernel/-/issues/15073">i915#15073</a>) -&gt; <a href=3D"http=
s://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_171547v1/shard-dg1-15/igt@km=
s_pm_rpm@dpms-lpsp.html">PASS</a> +2 other tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_pm_rpm@dpms-mode-unset-lpsp:</p>
<ul>
<li>shard-rkl:          (<a href=3D"https://intel-gfx-ci.01.org/tree/drm-ti=
p/CI_DRM_18943/shard-rkl-3/igt@kms_pm_rpm@dpms-mode-unset-lpsp.html">SKIP</=
a>, <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18943/shard-=
rkl-1/igt@kms_pm_rpm@dpms-mode-unset-lpsp.html">SKIP</a>) (<a href=3D"https=
://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15073">i915#15073</a>) -=
&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_171547v1=
/shard-rkl-8/igt@kms_pm_rpm@dpms-mode-unset-lpsp.html">PASS</a></li>
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
; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_171547v1/sh=
ard-dg2-4/igt@kms_pm_rpm@drm-resources-equal.html">PASS</a></li>
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
t; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_171547v1/s=
hard-rkl-2/igt@kms_pm_rpm@modeset-lpsp-stress.html">PASS</a> +1 other test =
pass</li>
<li>shard-dg1:          (<a href=3D"https://intel-gfx-ci.01.org/tree/drm-ti=
p/CI_DRM_18943/shard-dg1-16/igt@kms_pm_rpm@modeset-lpsp-stress.html">SKIP</=
a>, <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18943/shard-=
dg1-13/igt@kms_pm_rpm@modeset-lpsp-stress.html">SKIP</a>) (<a href=3D"https=
://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15073">i915#15073</a>) -=
&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_171547v1=
/shard-dg1-15/igt@kms_pm_rpm@modeset-lpsp-stress.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_pm_rpm@modeset-non-lpsp-stress:</p>
<ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_18943/shard-rkl-5/igt@kms_pm_rpm@modeset-non-lpsp-stress.html">SKIP=
</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15=
073">i915#15073</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-=
tip/Patchwork_171547v1/shard-rkl-7/igt@kms_pm_rpm@modeset-non-lpsp-stress.h=
tml">PASS</a></li>
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
_171547v1/shard-dg2-4/igt@kms_vblank@ts-continuation-modeset.html">PASS</a>=
 +81 other tests pass</li>
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
-gfx-ci.01.org/tree/drm-tip/Patchwork_171547v1/shard-dg2-10/igt@fbdev@info.=
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
k_171547v1/shard-rkl-4/igt@gem_ccs@large-ctrl-surf-copy.html">SKIP</a> (<a =
href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13008">i915=
#13008</a>)</li>
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
547v1/shard-dg2-1/igt@gem_ccs@suspend-resume@linear-compressed-compfmt0-sme=
m-lmem0.html">INCOMPLETE</a> (<a href=3D"https://gitlab.freedesktop.org/drm=
/i915/kernel/-/issues/13356">i915#13356</a> / <a href=3D"https://gitlab.fre=
edesktop.org/drm/i915/kernel/-/issues/16348">i915#16348</a>)</li>
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
&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_171547v1=
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
-tip/Patchwork_171547v1/shard-rkl-5/igt@gem_exec_balancer@parallel-contexts=
.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/=
-/issues/4525">i915#4525</a>)</li>
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
171547v1/shard-rkl-5/igt@gem_exec_reloc@basic-gtt-cpu.html">SKIP</a> (<a hr=
ef=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3281">i915#32=
81</a>) +8 other tests skip</li>
</ul>
</li>
<li>
<p>igt@gem_exec_reloc@basic-gtt-cpu-active:</p>
<ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_18943/shard-rkl-1/igt@gem_exec_reloc@basic-gtt-cpu-active.html">SKI=
P</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3=
281">i915#3281</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-t=
ip/Patchwork_171547v1/shard-rkl-6/igt@gem_exec_reloc@basic-gtt-cpu-active.h=
tml">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/=
issues/14544">i915#14544</a> / <a href=3D"https://gitlab.freedesktop.org/dr=
m/i915/kernel/-/issues/3281">i915#3281</a>)</li>
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
/tree/drm-tip/Patchwork_171547v1/shard-rkl-5/igt@gem_lmem_swapping@parallel=
-random-verify.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/dr=
m/i915/kernel/-/issues/4613">i915#4613</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@gem_lmem_swapping@random-engines:</p>
<ul>
<li>shard-rkl:          (<a href=3D"https://intel-gfx-ci.01.org/tree/drm-ti=
p/CI_DRM_18943/shard-rkl-7/igt@gem_lmem_swapping@random-engines.html">SKIP<=
/a>, <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18943/shard=
-rkl-8/igt@gem_lmem_swapping@random-engines.html">SKIP</a>) (<a href=3D"htt=
ps://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4613">i915#4613</a>) -=
&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_171547v1=
/shard-rkl-6/igt@gem_lmem_swapping@random-engines.html">SKIP</a> (<a href=
=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#145=
44</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues=
/4613">i915#4613</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_lmem_swapping@verify-random:</p>
<ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_18943/shard-rkl-1/igt@gem_lmem_swapping@verify-random.html">SKIP</a=
> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4613"=
>i915#4613</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/P=
atchwork_171547v1/shard-rkl-6/igt@gem_lmem_swapping@verify-random.html">SKI=
P</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/1=
4544">i915#14544</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i915/k=
ernel/-/issues/4613">i915#4613</a>)</li>
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
intel-gfx-ci.01.org/tree/drm-tip/Patchwork_171547v1/shard-rkl-4/igt@gem_med=
ia_vme.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/k=
ernel/-/issues/284">i915#284</a>)</li>
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
ef=3D"https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_171547v1/shard-rkl=
-4/igt@gem_pread@uncached.html">SKIP</a> (<a href=3D"https://gitlab.freedes=
ktop.org/drm/i915/kernel/-/issues/3282">i915#3282</a>) +1 other test skip</=
li>
</ul>
</li>
<li>
<p>igt@gem_set_tiling_vs_blt@tiled-to-untiled:</p>
<ul>
<li>shard-rkl:          (<a href=3D"https://intel-gfx-ci.01.org/tree/drm-ti=
p/CI_DRM_18943/shard-rkl-7/igt@gem_set_tiling_vs_blt@tiled-to-untiled.html"=
>SKIP</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18943=
/shard-rkl-8/igt@gem_set_tiling_vs_blt@tiled-to-untiled.html">SKIP</a>) (<a=
 href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8411">i915=
#8411</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/Patchw=
ork_171547v1/shard-rkl-6/igt@gem_set_tiling_vs_blt@tiled-to-untiled.html">S=
KIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues=
/14544">i915#14544</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i915=
/kernel/-/issues/8411">i915#8411</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_userptr_blits@unsync-unmap-cycles:</p>
<ul>
<li>shard-rkl:          (<a href=3D"https://intel-gfx-ci.01.org/tree/drm-ti=
p/CI_DRM_18943/shard-rkl-8/igt@gem_userptr_blits@unsync-unmap-cycles.html">=
SKIP</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18943/=
shard-rkl-7/igt@gem_userptr_blits@unsync-unmap-cycles.html">SKIP</a>) (<a h=
ref=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3297">i915#3=
297</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/Patchwor=
k_171547v1/shard-rkl-6/igt@gem_userptr_blits@unsync-unmap-cycles.html">SKIP=
</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14=
544">i915#14544</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i915/ke=
rnel/-/issues/3297">i915#3297</a>)</li>
</ul>
</li>
<li>
<p>igt@gen9_exec_parse@basic-rejected-ctx-param:</p>
<ul>
<li>shard-rkl:          (<a href=3D"https://intel-gfx-ci.01.org/tree/drm-ti=
p/CI_DRM_18943/shard-rkl-8/igt@gen9_exec_parse@basic-rejected-ctx-param.htm=
l">SKIP</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_189=
43/shard-rkl-7/igt@gen9_exec_parse@basic-rejected-ctx-param.html">SKIP</a>)=
 (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2527">=
i915#2527</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/Pa=
tchwork_171547v1/shard-rkl-6/igt@gen9_exec_parse@basic-rejected-ctx-param.h=
tml">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/=
issues/14544">i915#14544</a> / <a href=3D"https://gitlab.freedesktop.org/dr=
m/i915/kernel/-/issues/2527">i915#2527</a>)</li>
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
171547v1/shard-rkl-8/igt@gen9_exec_parse@bb-start-cmd.html">SKIP</a> (<a hr=
ef=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2527">i915#25=
27</a>)</li>
</ul>
</li>
<li>
<p>igt@gen9_exec_parse@shadow-peek:</p>
<ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_18943/shard-rkl-1/igt@gen9_exec_parse@shadow-peek.html">SKIP</a> (<=
a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2527">i91=
5#2527</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/Patch=
work_171547v1/shard-rkl-6/igt@gen9_exec_parse@shadow-peek.html">SKIP</a> (<=
a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i9=
15#14544</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/=
issues/2527">i915#2527</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@i915_module_load@fault-injection@__uc_init:</p>
<ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_18943/shard-rkl-1/igt@i915_module_load@fault-injection@__uc_init.ht=
ml">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/i=
ssues/15479">i915#15479</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/t=
ree/drm-tip/Patchwork_171547v1/shard-rkl-6/igt@i915_module_load@fault-injec=
tion@__uc_init.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/dr=
m/i915/kernel/-/issues/14544">i915#14544</a> / <a href=3D"https://gitlab.fr=
eedesktop.org/drm/i915/kernel/-/issues/15479">i915#15479</a>) +4 other test=
s skip</li>
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
ntel-gfx-ci.01.org/tree/drm-tip/Patchwork_171547v1/shard-rkl-4/igt@i915_pm_=
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
tip/Patchwork_171547v1/shard-rkl-3/igt@i915_suspend@fence-restore-tiled2unt=
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
m-tip/Patchwork_171547v1/shard-glk1/igt@i915_suspend@fence-restore-untiled.=
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
t; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_171547v1/s=
hard-rkl-5/igt@intel_hwmon@hwmon-write.html">SKIP</a> (<a href=3D"https://g=
itlab.freedesktop.org/drm/i915/kernel/-/issues/7707">i915#7707</a>)</li>
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
x-ci.01.org/tree/drm-tip/Patchwork_171547v1/shard-dg2-8/igt@kms_atomic@plan=
e-primary-overlay-mutable-zpos.html">SKIP</a> (<a href=3D"https://gitlab.fr=
eedesktop.org/drm/i915/kernel/-/issues/9531">i915#9531</a>)</li>
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
ps://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_171547v1/shard-tglu-6/igt@k=
ms_atomic_transition@plane-all-modeset-transition-fencing.html">FAIL</a> (<=
a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15662">i9=
15#15662</a>) +1 other test fail</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@4-tiled-32bpp-rotate-90:</p>
<ul>
<li>shard-dg2:          (<a href=3D"https://intel-gfx-ci.01.org/tree/drm-ti=
p/CI_DRM_18943/shard-dg2-6/igt@kms_big_fb@4-tiled-32bpp-rotate-90.html">SKI=
P</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18943/sha=
rd-dg2-5/igt@kms_big_fb@4-tiled-32bpp-rotate-90.html">SKIP</a>) -&gt; <a hr=
ef=3D"https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_171547v1/shard-dg2=
-10/igt@kms_big_fb@4-tiled-32bpp-rotate-90.html">SKIP</a> (<a href=3D"https=
://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16707">i915#16707</a>) +=
1 other test skip</li>
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
Patchwork_171547v1/shard-rkl-4/igt@kms_big_fb@4-tiled-64bpp-rotate-0.html">=
SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issue=
s/5286">i915#5286</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@4-tiled-8bpp-rotate-0:</p>
<ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_18943/shard-rkl-1/igt@kms_big_fb@4-tiled-8bpp-rotate-0.html">SKIP</=
a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5286=
">i915#5286</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/=
Patchwork_171547v1/shard-rkl-6/igt@kms_big_fb@4-tiled-8bpp-rotate-0.html">S=
KIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues=
/14544">i915#14544</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i915=
/kernel/-/issues/5286">i915#5286</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@4-tiled-addfb-size-offset-overflow:</p>
<ul>
<li>shard-rkl:          (<a href=3D"https://intel-gfx-ci.01.org/tree/drm-ti=
p/CI_DRM_18943/shard-rkl-8/igt@kms_big_fb@4-tiled-addfb-size-offset-overflo=
w.html">SKIP</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/CI_DR=
M_18943/shard-rkl-7/igt@kms_big_fb@4-tiled-addfb-size-offset-overflow.html"=
>SKIP</a>) (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/iss=
ues/5286">i915#5286</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/=
drm-tip/Patchwork_171547v1/shard-rkl-6/igt@kms_big_fb@4-tiled-addfb-size-of=
fset-overflow.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm=
/i915/kernel/-/issues/14544">i915#14544</a> / <a href=3D"https://gitlab.fre=
edesktop.org/drm/i915/kernel/-/issues/5286">i915#5286</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@linear-max-hw-stride-32bpp-rotate-0-hflip:</p>
<ul>
<li>shard-dg2:          (<a href=3D"https://intel-gfx-ci.01.org/tree/drm-ti=
p/CI_DRM_18943/shard-dg2-8/igt@kms_big_fb@linear-max-hw-stride-32bpp-rotate=
-0-hflip.html">SKIP</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/drm-ti=
p/CI_DRM_18943/shard-dg2-10/igt@kms_big_fb@linear-max-hw-stride-32bpp-rotat=
e-0-hflip.html">SKIP</a>) (<a href=3D"https://gitlab.freedesktop.org/drm/i9=
15/kernel/-/issues/16707">i915#16707</a> / <a href=3D"https://gitlab.freede=
sktop.org/drm/i915/kernel/-/issues/3828">i915#3828</a>) -&gt; <a href=3D"ht=
tps://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_171547v1/shard-dg2-10/igt@=
kms_big_fb@linear-max-hw-stride-32bpp-rotate-0-hflip.html">SKIP</a> (<a hre=
f=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16707">i915#16=
707</a>)</li>
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
"https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_171547v1/shard-rkl-5/ig=
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
tps://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_171547v1/shard-dg2-4/igt@k=
ms_big_fb@linear-max-hw-stride-64bpp-rotate-0-hflip.html">SKIP</a> (<a href=
=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3828">i915#3828=
</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@linear-max-hw-stride-64bpp-rotate-180-hflip:</p>
<ul>
<li>shard-dg2:          (<a href=3D"https://intel-gfx-ci.01.org/tree/drm-ti=
p/CI_DRM_18943/shard-dg2-5/igt@kms_big_fb@linear-max-hw-stride-64bpp-rotate=
-180-hflip.html">SKIP</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/drm-=
tip/CI_DRM_18943/shard-dg2-6/igt@kms_big_fb@linear-max-hw-stride-64bpp-rota=
te-180-hflip.html">SKIP</a>) (<a href=3D"https://gitlab.freedesktop.org/drm=
/i915/kernel/-/issues/3828">i915#3828</a>) -&gt; <a href=3D"https://intel-g=
fx-ci.01.org/tree/drm-tip/Patchwork_171547v1/shard-dg2-10/igt@kms_big_fb@li=
near-max-hw-stride-64bpp-rotate-180-hflip.html">SKIP</a> (<a href=3D"https:=
//gitlab.freedesktop.org/drm/i915/kernel/-/issues/16707">i915#16707</a>)</l=
i>
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
_171547v1/shard-dg2-6/igt@kms_big_fb@x-tiled-16bpp-rotate-270.html">SKIP</a=
> +5 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@x-tiled-16bpp-rotate-90:</p>
<ul>
<li>shard-dg2:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_18943/shard-dg2-8/igt@kms_big_fb@x-tiled-16bpp-rotate-90.html">SKIP=
</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_17=
1547v1/shard-dg2-10/igt@kms_big_fb@x-tiled-16bpp-rotate-90.html">SKIP</a> (=
<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16707">i=
915#16707</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@y-tiled-32bpp-rotate-180:</p>
<ul>
<li>shard-dg2:          (<a href=3D"https://intel-gfx-ci.01.org/tree/drm-ti=
p/CI_DRM_18943/shard-dg2-10/igt@kms_big_fb@y-tiled-32bpp-rotate-180.html">S=
KIP</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18943/s=
hard-dg2-8/igt@kms_big_fb@y-tiled-32bpp-rotate-180.html">SKIP</a>) (<a href=
=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16707">i915#167=
07</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues=
/4538">i915#4538</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i915/k=
ernel/-/issues/5190">i915#5190</a>) -&gt; <a href=3D"https://intel-gfx-ci.0=
1.org/tree/drm-tip/Patchwork_171547v1/shard-dg2-10/igt@kms_big_fb@y-tiled-3=
2bpp-rotate-180.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/d=
rm/i915/kernel/-/issues/16707">i915#16707</a> / <a href=3D"https://gitlab.f=
reedesktop.org/drm/i915/kernel/-/issues/5190">i915#5190</a>) +5 other tests=
 skip</li>
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
-tip/Patchwork_171547v1/shard-rkl-5/igt@kms_big_fb@y-tiled-64bpp-rotate-270=
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
rg/tree/drm-tip/Patchwork_171547v1/shard-dg2-10/igt@kms_big_fb@y-tiled-8bpp=
-rotate-270.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i=
915/kernel/-/issues/16707">i915#16707</a> / <a href=3D"https://gitlab.freed=
esktop.org/drm/i915/kernel/-/issues/5190">i915#5190</a>) +2 other tests ski=
p</li>
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
m-tip/Patchwork_171547v1/shard-dg2-4/igt@kms_big_fb@y-tiled-max-hw-stride-6=
4bpp-rotate-180-hflip-async-flip.html">SKIP</a> (<a href=3D"https://gitlab.=
freedesktop.org/drm/i915/kernel/-/issues/4538">i915#4538</a> / <a href=3D"h=
ttps://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5190">i915#5190</a>)=
 +14 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@yf-tiled-32bpp-rotate-90:</p>
<ul>
<li>shard-dg2:          (<a href=3D"https://intel-gfx-ci.01.org/tree/drm-ti=
p/CI_DRM_18943/shard-dg2-6/igt@kms_big_fb@yf-tiled-32bpp-rotate-90.html">SK=
IP</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18943/sh=
ard-dg2-5/igt@kms_big_fb@yf-tiled-32bpp-rotate-90.html">SKIP</a>) (<a href=
=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4538">i915#4538=
</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5=
190">i915#5190</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-t=
ip/Patchwork_171547v1/shard-dg2-10/igt@kms_big_fb@yf-tiled-32bpp-rotate-90.=
html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-=
/issues/16707">i915#16707</a> / <a href=3D"https://gitlab.freedesktop.org/d=
rm/i915/kernel/-/issues/5190">i915#5190</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@bad-aux-stride-4-tiled-mtl-rc-ccs@pipe-c-hdmi-a-2:</p>
<ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_18943/shard-rkl-1/igt@kms_ccs@bad-aux-stride-4-tiled-mtl-rc-ccs@pip=
e-c-hdmi-a-2.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/=
i915/kernel/-/issues/14098">i915#14098</a> / <a href=3D"https://gitlab.free=
desktop.org/drm/i915/kernel/-/issues/6095">i915#6095</a>) -&gt; <a href=3D"=
https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_171547v1/shard-rkl-6/igt=
@kms_ccs@bad-aux-stride-4-tiled-mtl-rc-ccs@pipe-c-hdmi-a-2.html">SKIP</a> (=
<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14098">i=
915#14098</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-=
/issues/14544">i915#14544</a> / <a href=3D"https://gitlab.freedesktop.org/d=
rm/i915/kernel/-/issues/6095">i915#6095</a>) +4 other tests skip</li>
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
https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_171547v1/shard-dg2-1/igt=
@kms_ccs@bad-pixel-format-y-tiled-gen12-mc-ccs.html">SKIP</a> (<a href=3D"h=
ttps://gitlab.freedesktop.org/drm/i915/kernel/-/issues/10307">i915#10307</a=
> / <a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6095=
">i915#6095</a>) +15 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@ccs-on-another-bo-4-tiled-mtl-mc-ccs@pipe-a-hdmi-a-2:</p>
<ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_18943/shard-rkl-1/igt@kms_ccs@ccs-on-another-bo-4-tiled-mtl-mc-ccs@=
pipe-a-hdmi-a-2.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/d=
rm/i915/kernel/-/issues/6095">i915#6095</a>) -&gt; <a href=3D"https://intel=
-gfx-ci.01.org/tree/drm-tip/Patchwork_171547v1/shard-rkl-6/igt@kms_ccs@ccs-=
on-another-bo-4-tiled-mtl-mc-ccs@pipe-a-hdmi-a-2.html">SKIP</a> (<a href=3D=
"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14544<=
/a> / <a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/60=
95">i915#6095</a>) +5 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-basic-4-tiled-bmg-ccs:</p>
<ul>
<li>shard-dg2:          (<a href=3D"https://intel-gfx-ci.01.org/tree/drm-ti=
p/CI_DRM_18943/shard-dg2-5/igt@kms_ccs@crc-primary-basic-4-tiled-bmg-ccs.ht=
ml">SKIP</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18=
943/shard-dg2-6/igt@kms_ccs@crc-primary-basic-4-tiled-bmg-ccs.html">SKIP</a=
>) (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/1231=
3">i915#12313</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-ti=
p/Patchwork_171547v1/shard-dg2-10/igt@kms_ccs@crc-primary-basic-4-tiled-bmg=
-ccs.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/ker=
nel/-/issues/16707">i915#16707</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-basic-4-tiled-mtl-mc-ccs:</p>
<ul>
<li>shard-rkl:          (<a href=3D"https://intel-gfx-ci.01.org/tree/drm-ti=
p/CI_DRM_18943/shard-rkl-7/igt@kms_ccs@crc-primary-basic-4-tiled-mtl-mc-ccs=
.html">SKIP</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM=
_18943/shard-rkl-8/igt@kms_ccs@crc-primary-basic-4-tiled-mtl-mc-ccs.html">S=
KIP</a>) (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issue=
s/14098">i915#14098</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i91=
5/kernel/-/issues/6095">i915#6095</a>) -&gt; <a href=3D"https://intel-gfx-c=
i.01.org/tree/drm-tip/Patchwork_171547v1/shard-rkl-6/igt@kms_ccs@crc-primar=
y-basic-4-tiled-mtl-mc-ccs.html">SKIP</a> (<a href=3D"https://gitlab.freede=
sktop.org/drm/i915/kernel/-/issues/14098">i915#14098</a> / <a href=3D"https=
://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a> / =
<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6095">i9=
15#6095</a>)</li>
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
intel-gfx-ci.01.org/tree/drm-tip/Patchwork_171547v1/shard-dg2-4/igt@kms_ccs=
@crc-primary-rotation-180-4-tiled-lnl-ccs.html">SKIP</a> (<a href=3D"https:=
//gitlab.freedesktop.org/drm/i915/kernel/-/issues/12313">i915#12313</a>) +2=
 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-rotation-180-y-tiled-ccs:</p>
<ul>
<li>shard-dg2:          (<a href=3D"https://intel-gfx-ci.01.org/tree/drm-ti=
p/CI_DRM_18943/shard-dg2-8/igt@kms_ccs@crc-primary-rotation-180-y-tiled-ccs=
.html">SKIP</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM=
_18943/shard-dg2-10/igt@kms_ccs@crc-primary-rotation-180-y-tiled-ccs.html">=
SKIP</a>) (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issu=
es/10307">i915#10307</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i9=
15/kernel/-/issues/16707">i915#16707</a> / <a href=3D"https://gitlab.freede=
sktop.org/drm/i915/kernel/-/issues/6095">i915#6095</a>) -&gt; <a href=3D"ht=
tps://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_171547v1/shard-dg2-10/igt@=
kms_ccs@crc-primary-rotation-180-y-tiled-ccs.html">SKIP</a> (<a href=3D"htt=
ps://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16707">i915#16707</a>)=
 +5 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-suspend-4-tiled-lnl-ccs:</p>
<ul>
<li>shard-dg2:          (<a href=3D"https://intel-gfx-ci.01.org/tree/drm-ti=
p/CI_DRM_18943/shard-dg2-8/igt@kms_ccs@crc-primary-suspend-4-tiled-lnl-ccs.=
html">SKIP</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_=
18943/shard-dg2-10/igt@kms_ccs@crc-primary-suspend-4-tiled-lnl-ccs.html">SK=
IP</a>) (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues=
/12805">i915#12805</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i915=
/kernel/-/issues/16707">i915#16707</a>) -&gt; <a href=3D"https://intel-gfx-=
ci.01.org/tree/drm-tip/Patchwork_171547v1/shard-dg2-10/igt@kms_ccs@crc-prim=
ary-suspend-4-tiled-lnl-ccs.html">SKIP</a> (<a href=3D"https://gitlab.freed=
esktop.org/drm/i915/kernel/-/issues/16707">i915#16707</a>)</li>
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
tel-gfx-ci.01.org/tree/drm-tip/Patchwork_171547v1/shard-dg2-1/igt@kms_ccs@c=
rc-primary-suspend-y-tiled-gen12-mc-ccs.html">SKIP</a> (<a href=3D"https://=
gitlab.freedesktop.org/drm/i915/kernel/-/issues/6095">i915#6095</a>) +2 oth=
er tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-sprite-planes-basic-4-tiled-lnl-ccs:</p>
<ul>
<li>shard-rkl:          (<a href=3D"https://intel-gfx-ci.01.org/tree/drm-ti=
p/CI_DRM_18943/shard-rkl-8/igt@kms_ccs@crc-sprite-planes-basic-4-tiled-lnl-=
ccs.html">SKIP</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/CI_=
DRM_18943/shard-rkl-7/igt@kms_ccs@crc-sprite-planes-basic-4-tiled-lnl-ccs.h=
tml">SKIP</a>) (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-=
/issues/12313">i915#12313</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/Patchwork_171547v1/shard-rkl-6/igt@kms_ccs@crc-sprite-planes-=
basic-4-tiled-lnl-ccs.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop=
.org/drm/i915/kernel/-/issues/12313">i915#12313</a> / <a href=3D"https://gi=
tlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@random-ccs-data-4-tiled-dg2-mc-ccs@pipe-a-hdmi-a-2:</p>
<ul>
<li>shard-rkl:          (<a href=3D"https://intel-gfx-ci.01.org/tree/drm-ti=
p/CI_DRM_18943/shard-rkl-1/igt@kms_ccs@random-ccs-data-4-tiled-dg2-mc-ccs@p=
ipe-a-hdmi-a-2.html">SKIP</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/=
drm-tip/CI_DRM_18943/shard-rkl-6/igt@kms_ccs@random-ccs-data-4-tiled-dg2-mc=
-ccs@pipe-a-hdmi-a-2.html">SKIP</a>) (<a href=3D"https://gitlab.freedesktop=
.org/drm/i915/kernel/-/issues/14544">i915#14544</a> / <a href=3D"https://gi=
tlab.freedesktop.org/drm/i915/kernel/-/issues/6095">i915#6095</a>) -&gt; <a=
 href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_171547v1/shard-=
rkl-4/igt@kms_ccs@random-ccs-data-4-tiled-dg2-mc-ccs@pipe-a-hdmi-a-2.html">=
SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issue=
s/6095">i915#6095</a>) +7 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@random-ccs-data-4-tiled-dg2-mc-ccs@pipe-c-hdmi-a-2:</p>
<ul>
<li>shard-rkl:          (<a href=3D"https://intel-gfx-ci.01.org/tree/drm-ti=
p/CI_DRM_18943/shard-rkl-1/igt@kms_ccs@random-ccs-data-4-tiled-dg2-mc-ccs@p=
ipe-c-hdmi-a-2.html">SKIP</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/=
drm-tip/CI_DRM_18943/shard-rkl-6/igt@kms_ccs@random-ccs-data-4-tiled-dg2-mc=
-ccs@pipe-c-hdmi-a-2.html">SKIP</a>) (<a href=3D"https://gitlab.freedesktop=
.org/drm/i915/kernel/-/issues/14098">i915#14098</a> / <a href=3D"https://gi=
tlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a> / <a hr=
ef=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6095">i915#60=
95</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork=
_171547v1/shard-rkl-4/igt@kms_ccs@random-ccs-data-4-tiled-dg2-mc-ccs@pipe-c=
-hdmi-a-2.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i91=
5/kernel/-/issues/14098">i915#14098</a> / <a href=3D"https://gitlab.freedes=
ktop.org/drm/i915/kernel/-/issues/6095">i915#6095</a>) +11 other tests skip=
</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@random-ccs-data-4-tiled-lnl-ccs:</p>
<ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_18943/shard-rkl-1/igt@kms_ccs@random-ccs-data-4-tiled-lnl-ccs.html"=
>SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issu=
es/12313">i915#12313</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree=
/drm-tip/Patchwork_171547v1/shard-rkl-6/igt@kms_ccs@random-ccs-data-4-tiled=
-lnl-ccs.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915=
/kernel/-/issues/12313">i915#12313</a> / <a href=3D"https://gitlab.freedesk=
top.org/drm/i915/kernel/-/issues/14544">i915#14544</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@random-ccs-data-4-tiled-mtl-rc-ccs:</p>
<ul>
<li>shard-dg2:          (<a href=3D"https://intel-gfx-ci.01.org/tree/drm-ti=
p/CI_DRM_18943/shard-dg2-5/igt@kms_ccs@random-ccs-data-4-tiled-mtl-rc-ccs.h=
tml">SKIP</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_1=
8943/shard-dg2-6/igt@kms_ccs@random-ccs-data-4-tiled-mtl-rc-ccs.html">SKIP<=
/a>) (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/10=
307">i915#10307</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i915/ke=
rnel/-/issues/6095">i915#6095</a>) -&gt; <a href=3D"https://intel-gfx-ci.01=
.org/tree/drm-tip/Patchwork_171547v1/shard-dg2-10/igt@kms_ccs@random-ccs-da=
ta-4-tiled-mtl-rc-ccs.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop=
.org/drm/i915/kernel/-/issues/16707">i915#16707</a>) +3 other tests skip</l=
i>
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
tel-gfx-ci.01.org/tree/drm-tip/Patchwork_171547v1/shard-dg2-10/igt@kms_ccs@=
random-ccs-data-y-tiled-gen12-rc-ccs-cc.html">SKIP</a> (<a href=3D"https://=
gitlab.freedesktop.org/drm/i915/kernel/-/issues/16707">i915#16707</a>) +1 o=
ther test skip</li>
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
-&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_171547v=
1/shard-dg2-4/igt@kms_cdclk@plane-scaling.html">SKIP</a> (<a href=3D"https:=
//gitlab.freedesktop.org/drm/i915/kernel/-/issues/13783">i915#13783</a>)</l=
i>
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
"https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_171547v1/shard-rkl-8/ig=
t@kms_chamelium_color_pipeline@plane-lut1d-ctm3x4-lut1d.html">SKIP</a> (<a =
href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16471">i915=
#16471</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_frames@hdmi-crc-single:</p>
<ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_18943/shard-rkl-1/igt@kms_chamelium_frames@hdmi-crc-single.html">SK=
IP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/=
11151">i915#11151</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i915/=
kernel/-/issues/7828">i915#7828</a>) -&gt; <a href=3D"https://intel-gfx-ci.=
01.org/tree/drm-tip/Patchwork_171547v1/shard-rkl-6/igt@kms_chamelium_frames=
@hdmi-crc-single.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/=
drm/i915/kernel/-/issues/11151">i915#11151</a> / <a href=3D"https://gitlab.=
freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a> / <a href=3D=
"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/7828">i915#7828</a=
>)</li>
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
el-gfx-ci.01.org/tree/drm-tip/Patchwork_171547v1/shard-rkl-4/igt@kms_chamel=
ium_hpd@hdmi-hpd-storm-disable.html">SKIP</a> (<a href=3D"https://gitlab.fr=
eedesktop.org/drm/i915/kernel/-/issues/11151">i915#11151</a> / <a href=3D"h=
ttps://gitlab.freedesktop.org/drm/i915/kernel/-/issues/7828">i915#7828</a>)=
 +5 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_hpd@vga-hpd-for-each-pipe:</p>
<ul>
<li>shard-rkl:          (<a href=3D"https://intel-gfx-ci.01.org/tree/drm-ti=
p/CI_DRM_18943/shard-rkl-8/igt@kms_chamelium_hpd@vga-hpd-for-each-pipe.html=
">SKIP</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_1894=
3/shard-rkl-7/igt@kms_chamelium_hpd@vga-hpd-for-each-pipe.html">SKIP</a>) (=
<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11151">i=
915#11151</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-=
/issues/7828">i915#7828</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/t=
ree/drm-tip/Patchwork_171547v1/shard-rkl-6/igt@kms_chamelium_hpd@vga-hpd-fo=
r-each-pipe.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i=
915/kernel/-/issues/11151">i915#11151</a> / <a href=3D"https://gitlab.freed=
esktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a> / <a href=3D"http=
s://gitlab.freedesktop.org/drm/i915/kernel/-/issues/7828">i915#7828</a>) +2=
 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_color_pipeline@plane-lut1d:</p>
<ul>
<li>shard-dg2:          (<a href=3D"https://intel-gfx-ci.01.org/tree/drm-ti=
p/CI_DRM_18943/shard-dg2-8/igt@kms_color_pipeline@plane-lut1d.html">PASS</a=
>, <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18943/shard-d=
g2-10/igt@kms_color_pipeline@plane-lut1d.html">SKIP</a>) (<a href=3D"https:=
//gitlab.freedesktop.org/drm/i915/kernel/-/issues/15529">i915#15529</a>) -&=
gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_171547v1/=
shard-dg2-10/igt@kms_color_pipeline@plane-lut1d.html">SKIP</a> (<a href=3D"=
https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15529">i915#15529</=
a>)</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@atomic:</p>
<ul>
<li>shard-dg2:          (<a href=3D"https://intel-gfx-ci.01.org/tree/drm-ti=
p/CI_DRM_18943/shard-dg2-5/igt@kms_content_protection@atomic.html">SKIP</a>=
, <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18943/shard-dg=
2-6/igt@kms_content_protection@atomic.html">SKIP</a>) (<a href=3D"https://g=
itlab.freedesktop.org/drm/i915/kernel/-/issues/15865">i915#15865</a>) -&gt;=
 <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_171547v1/sha=
rd-dg2-10/igt@kms_content_protection@atomic.html">SKIP</a> (<a href=3D"http=
s://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16707">i915#16707</a>)<=
/li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@atomic-hdcp14:</p>
<ul>
<li>shard-rkl:          (<a href=3D"https://intel-gfx-ci.01.org/tree/drm-ti=
p/CI_DRM_18943/shard-rkl-7/igt@kms_content_protection@atomic-hdcp14.html">S=
KIP</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18943/s=
hard-rkl-8/igt@kms_content_protection@atomic-hdcp14.html">SKIP</a>) (<a hre=
f=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15865">i915#15=
865</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/Patchwor=
k_171547v1/shard-rkl-6/igt@kms_content_protection@atomic-hdcp14.html">SKIP<=
/a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/145=
44">i915#14544</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i915/ker=
nel/-/issues/15865">i915#15865</a>)</li>
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
el-gfx-ci.01.org/tree/drm-tip/Patchwork_171547v1/shard-rkl-3/igt@kms_conten=
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
m-tip/Patchwork_171547v1/shard-dg2-10/igt@kms_content_protection@dp-mst-typ=
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
ci.01.org/tree/drm-tip/Patchwork_171547v1/shard-dg2-1/igt@kms_content_prote=
ction@dp-mst-type-0-hdcp14.html">SKIP</a> (<a href=3D"https://gitlab.freede=
sktop.org/drm/i915/kernel/-/issues/15330">i915#15330</a>) +1 other test ski=
p</li>
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
01.org/tree/drm-tip/Patchwork_171547v1/shard-dg2-10/igt@kms_content_protect=
ion@dp-mst-type-1.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org=
/drm/i915/kernel/-/issues/16707">i915#16707</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@mei-interface:</p>
<ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_18943/shard-rkl-1/igt@kms_content_protection@mei-interface.html">SK=
IP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/=
15865">i915#15865</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/dr=
m-tip/Patchwork_171547v1/shard-rkl-6/igt@kms_content_protection@mei-interfa=
ce.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kerne=
l/-/issues/14544">i915#14544</a> / <a href=3D"https://gitlab.freedesktop.or=
g/drm/i915/kernel/-/issues/15865">i915#15865</a>)</li>
<li>shard-dg1:          (<a href=3D"https://intel-gfx-ci.01.org/tree/drm-ti=
p/CI_DRM_18943/shard-dg1-19/igt@kms_content_protection@mei-interface.html">=
SKIP</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18943/=
shard-dg1-13/igt@kms_content_protection@mei-interface.html">SKIP</a>) (<a h=
ref=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15865">i915#=
15865</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/iss=
ues/9433">i915#9433</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/=
drm-tip/Patchwork_171547v1/shard-dg1-12/igt@kms_content_protection@mei-inte=
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
_171547v1/shard-dg2-6/igt@kms_content_protection@srm.html">SKIP</a> (<a hre=
f=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15865">i915#15=
865</a>) +5 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@suspend-resume:</p>
<ul>
<li>shard-dg2:          (<a href=3D"https://intel-gfx-ci.01.org/tree/drm-ti=
p/CI_DRM_18943/shard-dg2-10/igt@kms_content_protection@suspend-resume.html"=
>SKIP</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18943=
/shard-dg2-8/igt@kms_content_protection@suspend-resume.html">SKIP</a>) (<a =
href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15865">i915=
#15865</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/is=
sues/16707">i915#16707</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tr=
ee/drm-tip/Patchwork_171547v1/shard-dg2-10/igt@kms_content_protection@suspe=
nd-resume.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i91=
5/kernel/-/issues/16707">i915#16707</a>)</li>
<li>shard-rkl:          (<a href=3D"https://intel-gfx-ci.01.org/tree/drm-ti=
p/CI_DRM_18943/shard-rkl-6/igt@kms_content_protection@suspend-resume.html">=
SKIP</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18943/=
shard-rkl-1/igt@kms_content_protection@suspend-resume.html">SKIP</a>) (<a h=
ref=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#=
14544</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/iss=
ues/15865">i915#15865</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tre=
e/drm-tip/Patchwork_171547v1/shard-rkl-4/igt@kms_content_protection@suspend=
-resume.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/=
kernel/-/issues/15865">i915#15865</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-onscreen-32x10:</p>
<ul>
<li>shard-dg2:          (<a href=3D"https://intel-gfx-ci.01.org/tree/drm-ti=
p/CI_DRM_18943/shard-dg2-10/igt@kms_cursor_crc@cursor-onscreen-32x10.html">=
SKIP</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18943/=
shard-dg2-8/igt@kms_cursor_crc@cursor-onscreen-32x10.html">SKIP</a>) (<a hr=
ef=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16707">i915#1=
6707</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issu=
es/3555">i915#3555</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/d=
rm-tip/Patchwork_171547v1/shard-dg2-10/igt@kms_cursor_crc@cursor-onscreen-3=
2x10.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/ker=
nel/-/issues/16707">i915#16707</a>)</li>
<li>shard-rkl:          (<a href=3D"https://intel-gfx-ci.01.org/tree/drm-ti=
p/CI_DRM_18943/shard-rkl-6/igt@kms_cursor_crc@cursor-onscreen-32x10.html">S=
KIP</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18943/s=
hard-rkl-1/igt@kms_cursor_crc@cursor-onscreen-32x10.html">SKIP</a>) (<a hre=
f=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14=
544</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issue=
s/3555">i915#3555</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/dr=
m-tip/Patchwork_171547v1/shard-rkl-4/igt@kms_cursor_crc@cursor-onscreen-32x=
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
tree/drm-tip/Patchwork_171547v1/shard-dg2-4/igt@kms_cursor_crc@cursor-onscr=
een-512x512.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i=
915/kernel/-/issues/13049">i915#13049</a>)</li>
<li>shard-rkl:          (<a href=3D"https://intel-gfx-ci.01.org/tree/drm-ti=
p/CI_DRM_18943/shard-rkl-8/igt@kms_cursor_crc@cursor-onscreen-512x512.html"=
>SKIP</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18943=
/shard-rkl-7/igt@kms_cursor_crc@cursor-onscreen-512x512.html">SKIP</a>) (<a=
 href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13049">i91=
5#13049</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/Patc=
hwork_171547v1/shard-rkl-6/igt@kms_cursor_crc@cursor-onscreen-512x512.html"=
>SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issu=
es/13049">i915#13049</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i9=
15/kernel/-/issues/14544">i915#14544</a>)</li>
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
tree/drm-tip/Patchwork_171547v1/shard-dg2-8/igt@kms_cursor_crc@cursor-onscr=
een-max-size.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/=
i915/kernel/-/issues/3555">i915#3555</a>) +2 other tests skip</li>
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
k_171547v1/shard-dg2-10/igt@kms_cursor_crc@cursor-random-512x170.html">SKIP=
</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16=
707">i915#16707</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-random-512x512:</p>
<ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_18943/shard-rkl-1/igt@kms_cursor_crc@cursor-random-512x512.html">SK=
IP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/=
13049">i915#13049</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/dr=
m-tip/Patchwork_171547v1/shard-rkl-6/igt@kms_cursor_crc@cursor-random-512x5=
12.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kerne=
l/-/issues/13049">i915#13049</a> / <a href=3D"https://gitlab.freedesktop.or=
g/drm/i915/kernel/-/issues/14544">i915#14544</a>)</li>
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
ee/drm-tip/Patchwork_171547v1/shard-dg2-10/igt@kms_cursor_crc@cursor-slidin=
g-512x170.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i91=
5/kernel/-/issues/16707">i915#16707</a>) +1 other test skip</li>
<li>shard-rkl:          (<a href=3D"https://intel-gfx-ci.01.org/tree/drm-ti=
p/CI_DRM_18943/shard-rkl-1/igt@kms_cursor_crc@cursor-sliding-512x170.html">=
SKIP</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18943/=
shard-rkl-6/igt@kms_cursor_crc@cursor-sliding-512x170.html">SKIP</a>) (<a h=
ref=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13049">i915#=
13049</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/iss=
ues/14544">i915#14544</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tre=
e/drm-tip/Patchwork_171547v1/shard-rkl-4/igt@kms_cursor_crc@cursor-sliding-=
512x170.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/=
kernel/-/issues/13049">i915#13049</a>)</li>
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
tip/Patchwork_171547v1/shard-rkl-4/igt@kms_cursor_legacy@2x-flip-vs-cursor-=
legacy.html">SKIP</a> +70 other tests skip</li>
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
 -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_171547=
v1/shard-dg2-4/igt@kms_cursor_legacy@basic-busy-flip-before-cursor-atomic.h=
tml">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/=
issues/4103">i915#4103</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@basic-busy-flip-before-cursor-varying-size:</p>
<ul>
<li>shard-rkl:          (<a href=3D"https://intel-gfx-ci.01.org/tree/drm-ti=
p/CI_DRM_18943/shard-rkl-7/igt@kms_cursor_legacy@basic-busy-flip-before-cur=
sor-varying-size.html">SKIP</a>, <a href=3D"https://intel-gfx-ci.01.org/tre=
e/drm-tip/CI_DRM_18943/shard-rkl-8/igt@kms_cursor_legacy@basic-busy-flip-be=
fore-cursor-varying-size.html">SKIP</a>) (<a href=3D"https://gitlab.freedes=
ktop.org/drm/i915/kernel/-/issues/4103">i915#4103</a>) -&gt; <a href=3D"htt=
ps://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_171547v1/shard-rkl-6/igt@km=
s_cursor_legacy@basic-busy-flip-before-cursor-varying-size.html">SKIP</a> (=
<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i=
915#14544</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-=
/issues/4103">i915#4103</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@basic-flip-after-cursor-varying-size:</p>
<ul>
<li>shard-dg2:          (<a href=3D"https://intel-gfx-ci.01.org/tree/drm-ti=
p/CI_DRM_18943/shard-dg2-10/igt@kms_cursor_legacy@basic-flip-after-cursor-v=
arying-size.html">SKIP</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/drm=
-tip/CI_DRM_18943/shard-dg2-8/igt@kms_cursor_legacy@basic-flip-after-cursor=
-varying-size.html">PASS</a>) (<a href=3D"https://gitlab.freedesktop.org/dr=
m/i915/kernel/-/issues/11190">i915#11190</a> / <a href=3D"https://gitlab.fr=
eedesktop.org/drm/i915/kernel/-/issues/16707">i915#16707</a>) -&gt; <a href=
=3D"https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_171547v1/shard-dg2-1=
0/igt@kms_cursor_legacy@basic-flip-after-cursor-varying-size.html">SKIP</a>=
 (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11190"=
>i915#11190</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel=
/-/issues/16707">i915#16707</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@cursora-vs-flipb-legacy:</p>
<ul>
<li>shard-dg1:          (<a href=3D"https://intel-gfx-ci.01.org/tree/drm-ti=
p/CI_DRM_18943/shard-dg1-14/igt@kms_cursor_legacy@cursora-vs-flipb-legacy.h=
tml">SKIP</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_1=
8943/shard-dg1-19/igt@kms_cursor_legacy@cursora-vs-flipb-legacy.html">SKIP<=
/a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_17=
1547v1/shard-dg1-16/igt@kms_cursor_legacy@cursora-vs-flipb-legacy.html">SKI=
P</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4=
423">i915#4423</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@cursorb-vs-flipb-atomic:</p>
<ul>
<li>shard-dg2:          (<a href=3D"https://intel-gfx-ci.01.org/tree/drm-ti=
p/CI_DRM_18943/shard-dg2-6/igt@kms_cursor_legacy@cursorb-vs-flipb-atomic.ht=
ml">SKIP</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18=
943/shard-dg2-5/igt@kms_cursor_legacy@cursorb-vs-flipb-atomic.html">SKIP</a=
>) (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/1304=
6">i915#13046</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i915/kern=
el/-/issues/5354">i915#5354</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.o=
rg/tree/drm-tip/Patchwork_171547v1/shard-dg2-10/igt@kms_cursor_legacy@curso=
rb-vs-flipb-atomic.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.or=
g/drm/i915/kernel/-/issues/16707">i915#16707</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@cursorb-vs-flipb-legacy:</p>
<ul>
<li>shard-dg2:          (<a href=3D"https://intel-gfx-ci.01.org/tree/drm-ti=
p/CI_DRM_18943/shard-dg2-10/igt@kms_cursor_legacy@cursorb-vs-flipb-legacy.h=
tml">SKIP</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_1=
8943/shard-dg2-8/igt@kms_cursor_legacy@cursorb-vs-flipb-legacy.html">SKIP</=
a>) (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/130=
46">i915#13046</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i915/ker=
nel/-/issues/16707">i915#16707</a> / <a href=3D"https://gitlab.freedesktop.=
org/drm/i915/kernel/-/issues/5354">i915#5354</a>) -&gt; <a href=3D"https://=
intel-gfx-ci.01.org/tree/drm-tip/Patchwork_171547v1/shard-dg2-10/igt@kms_cu=
rsor_legacy@cursorb-vs-flipb-legacy.html">SKIP</a> (<a href=3D"https://gitl=
ab.freedesktop.org/drm/i915/kernel/-/issues/16707">i915#16707</a>) +3 other=
 tests skip</li>
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
intel-gfx-ci.01.org/tree/drm-tip/Patchwork_171547v1/shard-dg2-6/igt@kms_cur=
sor_legacy@cursorb-vs-flipb-toggle.html">SKIP</a> (<a href=3D"https://gitla=
b.freedesktop.org/drm/i915/kernel/-/issues/13046">i915#13046</a> / <a href=
=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5354">i915#5354=
</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@short-busy-flip-before-cursor-atomic-transitions-v=
arying-size:</p>
<ul>
<li>shard-dg2:          (<a href=3D"https://intel-gfx-ci.01.org/tree/drm-ti=
p/CI_DRM_18943/shard-dg2-10/igt@kms_cursor_legacy@short-busy-flip-before-cu=
rsor-atomic-transitions-varying-size.html">SKIP</a>, <a href=3D"https://int=
el-gfx-ci.01.org/tree/drm-tip/CI_DRM_18943/shard-dg2-8/igt@kms_cursor_legac=
y@short-busy-flip-before-cursor-atomic-transitions-varying-size.html">SKIP<=
/a>) (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16=
707">i915#16707</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i915/ke=
rnel/-/issues/4103">i915#4103</a>) -&gt; <a href=3D"https://intel-gfx-ci.01=
.org/tree/drm-tip/Patchwork_171547v1/shard-dg2-10/igt@kms_cursor_legacy@sho=
rt-busy-flip-before-cursor-atomic-transitions-varying-size.html">SKIP</a> (=
<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16707">i=
915#16707</a>)</li>
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
=3D"https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_171547v1/shard-dg2-1=
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
"https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_171547v1/shard-rkl-5/ig=
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
tchwork_171547v1/shard-dg2-10/igt@kms_dirtyfb@drrs-dirtyfb-ioctl.html">SKIP=
</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16=
707">i915#16707</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_dp_aux_dev@basic:</p>
<ul>
<li>shard-rkl:          (<a href=3D"https://intel-gfx-ci.01.org/tree/drm-ti=
p/CI_DRM_18943/shard-rkl-8/igt@kms_dp_aux_dev@basic.html">SKIP</a>, <a href=
=3D"https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18943/shard-rkl-7/igt@k=
ms_dp_aux_dev@basic.html">SKIP</a>) (<a href=3D"https://gitlab.freedesktop.=
org/drm/i915/kernel/-/issues/1257">i915#1257</a>) -&gt; <a href=3D"https://=
intel-gfx-ci.01.org/tree/drm-tip/Patchwork_171547v1/shard-rkl-6/igt@kms_dp_=
aux_dev@basic.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm=
/i915/kernel/-/issues/1257">i915#1257</a> / <a href=3D"https://gitlab.freed=
esktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_dp_link_training@non-uhbr-mst:</p>
<ul>
<li>shard-dg2:          (<a href=3D"https://intel-gfx-ci.01.org/tree/drm-ti=
p/CI_DRM_18943/shard-dg2-8/igt@kms_dp_link_training@non-uhbr-mst.html">SKIP=
</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18943/shar=
d-dg2-10/igt@kms_dp_link_training@non-uhbr-mst.html">SKIP</a>) (<a href=3D"=
https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13749">i915#13749</=
a> / <a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/167=
07">i915#16707</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-t=
ip/Patchwork_171547v1/shard-dg2-10/igt@kms_dp_link_training@non-uhbr-mst.ht=
ml">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/i=
ssues/16707">i915#16707</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_dp_link_training@non-uhbr-sst:</p>
<ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_18943/shard-rkl-1/igt@kms_dp_link_training@non-uhbr-sst.html">SKIP<=
/a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/137=
49">i915#13749</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-t=
ip/Patchwork_171547v1/shard-rkl-6/igt@kms_dp_link_training@non-uhbr-sst.htm=
l">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/is=
sues/13749">i915#13749</a> / <a href=3D"https://gitlab.freedesktop.org/drm/=
i915/kernel/-/issues/14544">i915#14544</a>)</li>
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
ork_171547v1/shard-rkl-5/igt@kms_dp_link_training@uhbr-sst.html">SKIP</a> (=
<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13748">i=
915#13748</a>)</li>
<li>shard-dg2:          (<a href=3D"https://intel-gfx-ci.01.org/tree/drm-ti=
p/CI_DRM_18943/shard-dg2-10/igt@kms_dp_link_training@uhbr-sst.html">SKIP</a=
>, <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18943/shard-d=
g2-1/igt@kms_dp_link_training@uhbr-sst.html">SKIP</a>) (<a href=3D"https://=
gitlab.freedesktop.org/drm/i915/kernel/-/issues/13748">i915#13748</a> / <a =
href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16707">i915=
#16707</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/Patch=
work_171547v1/shard-dg2-1/igt@kms_dp_link_training@uhbr-sst.html">SKIP</a> =
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
hwork_171547v1/shard-dg2-10/igt@kms_dp_linktrain_fallback@dsc-fallback.html=
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
rk_171547v1/shard-dg2-1/igt@kms_dsc@dsc-with-bpc-formats.html">SKIP</a> (<a=
 href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16361">i91=
5#16361</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_dsc@dsc-with-bpc-ultrajoiner:</p>
<ul>
<li>shard-dg2:          (<a href=3D"https://intel-gfx-ci.01.org/tree/drm-ti=
p/CI_DRM_18943/shard-dg2-5/igt@kms_dsc@dsc-with-bpc-ultrajoiner.html">SKIP<=
/a>, <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18943/shard=
-dg2-6/igt@kms_dsc@dsc-with-bpc-ultrajoiner.html">SKIP</a>) (<a href=3D"htt=
ps://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16361">i915#16361</a>)=
 -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_171547=
v1/shard-dg2-10/igt@kms_dsc@dsc-with-bpc-ultrajoiner.html">SKIP</a> (<a hre=
f=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16707">i915#16=
707</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_dsc@dsc-with-formats-bigjoiner:</p>
<ul>
<li>shard-rkl:          (<a href=3D"https://intel-gfx-ci.01.org/tree/drm-ti=
p/CI_DRM_18943/shard-rkl-7/igt@kms_dsc@dsc-with-formats-bigjoiner.html">SKI=
P</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18943/sha=
rd-rkl-8/igt@kms_dsc@dsc-with-formats-bigjoiner.html">SKIP</a>) (<a href=3D=
"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16361">i915#16361<=
/a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_17=
1547v1/shard-rkl-6/igt@kms_dsc@dsc-with-formats-bigjoiner.html">SKIP</a> (<=
a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i9=
15#14544</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/=
issues/16361">i915#16361</a>)</li>
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
atchwork_171547v1/shard-dg2-10/igt@kms_dsc@dsc-with-output-formats.html">SK=
IP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/=
16707">i915#16707</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_dsc@dsc-with-output-formats-ultrajoiner:</p>
<ul>
<li>shard-dg1:          (<a href=3D"https://intel-gfx-ci.01.org/tree/drm-ti=
p/CI_DRM_18943/shard-dg1-16/igt@kms_dsc@dsc-with-output-formats-ultrajoiner=
.html">SKIP</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM=
_18943/shard-dg1-18/igt@kms_dsc@dsc-with-output-formats-ultrajoiner.html">S=
KIP</a>) (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issue=
s/16361">i915#16361</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/=
drm-tip/Patchwork_171547v1/shard-dg1-18/igt@kms_dsc@dsc-with-output-formats=
-ultrajoiner.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/=
i915/kernel/-/issues/16361">i915#16361</a> / <a href=3D"https://gitlab.free=
desktop.org/drm/i915/kernel/-/issues/4423">i915#4423</a>)</li>
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
rg/tree/drm-tip/Patchwork_171547v1/shard-rkl-4/igt@kms_dsc@dsc-with-output-=
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
01.org/tree/drm-tip/Patchwork_171547v1/shard-dg2-10/igt@kms_dsc@dsc-with-ou=
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
el-gfx-ci.01.org/tree/drm-tip/Patchwork_171547v1/shard-dg2-10/igt@kms_fbcon=
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
Patchwork_171547v1/shard-rkl-3/igt@kms_feature_discovery@display-4x.html">S=
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
47v1/shard-rkl-5/igt@kms_feature_discovery@vrr.html">SKIP</a> (<a href=3D"h=
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
hwork_171547v1/shard-rkl-8/igt@kms_flip@2x-dpms-vs-vblank-race.html">SKIP</=
a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9934=
">i915#9934</a>) +6 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-suspend-interruptible:</p>
<ul>
<li>shard-glk:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_18943/shard-glk1/igt@kms_flip@2x-flip-vs-suspend-interruptible.html=
">INCOMPLETE</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel=
/-/issues/12745">i915#12745</a> / <a href=3D"https://gitlab.freedesktop.org=
/drm/i915/kernel/-/issues/4839">i915#4839</a>) -&gt; <a href=3D"https://int=
el-gfx-ci.01.org/tree/drm-tip/Patchwork_171547v1/shard-glk8/igt@kms_flip@2x=
-flip-vs-suspend-interruptible.html">INCOMPLETE</a> (<a href=3D"https://git=
lab.freedesktop.org/drm/i915/kernel/-/issues/12314">i915#12314</a> / <a hre=
f=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12745">i915#12=
745</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issue=
s/4839">i915#4839</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-suspend-interruptible@ac-hdmi-a1-hdmi-a2:</p>
<ul>
<li>shard-glk:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_18943/shard-glk1/igt@kms_flip@2x-flip-vs-suspend-interruptible@ac-h=
dmi-a1-hdmi-a2.html">INCOMPLETE</a> (<a href=3D"https://gitlab.freedesktop.=
org/drm/i915/kernel/-/issues/12745">i915#12745</a>) -&gt; <a href=3D"https:=
//intel-gfx-ci.01.org/tree/drm-tip/Patchwork_171547v1/shard-glk8/igt@kms_fl=
ip@2x-flip-vs-suspend-interruptible@ac-hdmi-a1-hdmi-a2.html">INCOMPLETE</a>=
 (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12314"=
>i915#12314</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel=
/-/issues/12745">i915#12745</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-single-buffer-flip-vs-dpms-off-vs-modeset-interruptible:=
</p>
<ul>
<li>shard-rkl:          (<a href=3D"https://intel-gfx-ci.01.org/tree/drm-ti=
p/CI_DRM_18943/shard-rkl-8/igt@kms_flip@2x-single-buffer-flip-vs-dpms-off-v=
s-modeset-interruptible.html">SKIP</a>, <a href=3D"https://intel-gfx-ci.01.=
org/tree/drm-tip/CI_DRM_18943/shard-rkl-7/igt@kms_flip@2x-single-buffer-fli=
p-vs-dpms-off-vs-modeset-interruptible.html">SKIP</a>) (<a href=3D"https://=
gitlab.freedesktop.org/drm/i915/kernel/-/issues/9934">i915#9934</a>) -&gt; =
<a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_171547v1/shar=
d-rkl-6/igt@kms_flip@2x-single-buffer-flip-vs-dpms-off-vs-modeset-interrupt=
ible.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/ker=
nel/-/issues/14544">i915#14544</a> / <a href=3D"https://gitlab.freedesktop.=
org/drm/i915/kernel/-/issues/9934">i915#9934</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-dpms-off-vs-modeset:</p>
<ul>
<li>shard-dg2:          (<a href=3D"https://intel-gfx-ci.01.org/tree/drm-ti=
p/CI_DRM_18943/shard-dg2-10/igt@kms_flip@flip-vs-dpms-off-vs-modeset.html">=
SKIP</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18943/=
shard-dg2-8/igt@kms_flip@flip-vs-dpms-off-vs-modeset.html">PASS</a>) (<a hr=
ef=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5354">i915#53=
54</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork=
_171547v1/shard-dg2-10/igt@kms_flip@flip-vs-dpms-off-vs-modeset.html">SKIP<=
/a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/535=
4">i915#5354</a>)</li>
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
gfx-ci.01.org/tree/drm-tip/Patchwork_171547v1/shard-glk5/igt@kms_flip@flip-=
vs-suspend.html">INCOMPLETE</a> (<a href=3D"https://gitlab.freedesktop.org/=
drm/i915/kernel/-/issues/12314">i915#12314</a> / <a href=3D"https://gitlab.=
freedesktop.org/drm/i915/kernel/-/issues/12745">i915#12745</a> / <a href=3D=
"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4839">i915#4839</a=
> / <a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6113=
">i915#6113</a>)</li>
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
ci.01.org/tree/drm-tip/Patchwork_171547v1/shard-glk5/igt@kms_flip@flip-vs-s=
uspend@a-hdmi-a1.html">INCOMPLETE</a> (<a href=3D"https://gitlab.freedeskto=
p.org/drm/i915/kernel/-/issues/12314">i915#12314</a> / <a href=3D"https://g=
itlab.freedesktop.org/drm/i915/kernel/-/issues/12745">i915#12745</a> / <a h=
ref=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6113">i915#6=
113</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-32bpp-yftile-to-64bpp-yftile-downscaling:</=
p>
<ul>
<li>shard-rkl:          (<a href=3D"https://intel-gfx-ci.01.org/tree/drm-ti=
p/CI_DRM_18943/shard-rkl-7/igt@kms_flip_scaled_crc@flip-32bpp-yftile-to-64b=
pp-yftile-downscaling.html">SKIP</a>, <a href=3D"https://intel-gfx-ci.01.or=
g/tree/drm-tip/CI_DRM_18943/shard-rkl-8/igt@kms_flip_scaled_crc@flip-32bpp-=
yftile-to-64bpp-yftile-downscaling.html">SKIP</a>) (<a href=3D"https://gitl=
ab.freedesktop.org/drm/i915/kernel/-/issues/15643">i915#15643</a>) -&gt; <a=
 href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_171547v1/shard-=
rkl-6/igt@kms_flip_scaled_crc@flip-32bpp-yftile-to-64bpp-yftile-downscaling=
.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/=
-/issues/14544">i915#14544</a> / <a href=3D"https://gitlab.freedesktop.org/=
drm/i915/kernel/-/issues/15643">i915#15643</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-32bpp-4tiledg2rcccs-upscalin=
g:</p>
<ul>
<li>shard-dg2:          (<a href=3D"https://intel-gfx-ci.01.org/tree/drm-ti=
p/CI_DRM_18943/shard-dg2-10/igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-32b=
pp-4tiledg2rcccs-upscaling.html">SKIP</a>, <a href=3D"https://intel-gfx-ci.=
01.org/tree/drm-tip/CI_DRM_18943/shard-dg2-8/igt@kms_flip_scaled_crc@flip-6=
4bpp-4tile-to-32bpp-4tiledg2rcccs-upscaling.html">PASS</a>) (<a href=3D"htt=
ps://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3555">i915#3555</a> / =
<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8813">i9=
15#8813</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/Patc=
hwork_171547v1/shard-dg2-10/igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-32b=
pp-4tiledg2rcccs-upscaling.html">SKIP</a> (<a href=3D"https://gitlab.freede=
sktop.org/drm/i915/kernel/-/issues/3555">i915#3555</a> / <a href=3D"https:/=
/gitlab.freedesktop.org/drm/i915/kernel/-/issues/8813">i915#8813</a>) +3 ot=
her tests skip</li>
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
_171547v1/shard-rkl-8/igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-32bpp-yf=
tile-downscaling.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/=
drm/i915/kernel/-/issues/15643">i915#15643</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-1p-offscreen-pri-shrfb-draw-mmap-wc:</p>
<ul>
<li>shard-dg2:          (<a href=3D"https://intel-gfx-ci.01.org/tree/drm-ti=
p/CI_DRM_18943/shard-dg2-8/igt@kms_frontbuffer_tracking@fbc-1p-offscreen-pr=
i-shrfb-draw-mmap-wc.html">SKIP</a>, <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/CI_DRM_18943/shard-dg2-10/igt@kms_frontbuffer_tracking@fbc-1p=
-offscreen-pri-shrfb-draw-mmap-wc.html">SKIP</a>) (<a href=3D"https://gitla=
b.freedesktop.org/drm/i915/kernel/-/issues/15104">i915#15104</a> / <a href=
=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15990">i915#159=
90</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues=
/16708">i915#16708</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/d=
rm-tip/Patchwork_171547v1/shard-dg2-10/igt@kms_frontbuffer_tracking@fbc-1p-=
offscreen-pri-shrfb-draw-mmap-wc.html">SKIP</a> (<a href=3D"https://gitlab.=
freedesktop.org/drm/i915/kernel/-/issues/16708">i915#16708</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-1p-primscrn-pri-indfb-draw-render:</p>
<ul>
<li>shard-dg2:          (<a href=3D"https://intel-gfx-ci.01.org/tree/drm-ti=
p/CI_DRM_18943/shard-dg2-8/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-pri=
-indfb-draw-render.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/t=
ree/drm-tip/CI_DRM_18943/shard-dg2-10/igt@kms_frontbuffer_tracking@fbc-1p-p=
rimscrn-pri-indfb-draw-render.html">SKIP</a>) (<a href=3D"https://gitlab.fr=
eedesktop.org/drm/i915/kernel/-/issues/16708">i915#16708</a> / <a href=3D"h=
ttps://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5354">i915#5354</a>)=
 -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_171547=
v1/shard-dg2-10/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-pri-indfb-draw=
-render.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/=
kernel/-/issues/16708">i915#16708</a> / <a href=3D"https://gitlab.freedeskt=
op.org/drm/i915/kernel/-/issues/5354">i915#5354</a>) +2 other tests skip</l=
i>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-1p-primscrn-pri-shrfb-draw-mmap-wc:</p>
<ul>
<li>shard-dg2:          (<a href=3D"https://intel-gfx-ci.01.org/tree/drm-ti=
p/CI_DRM_18943/shard-dg2-6/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-pri=
-shrfb-draw-mmap-wc.html">SKIP</a>, <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/CI_DRM_18943/shard-dg2-5/igt@kms_frontbuffer_tracking@fbc-1p-p=
rimscrn-pri-shrfb-draw-mmap-wc.html">SKIP</a>) (<a href=3D"https://gitlab.f=
reedesktop.org/drm/i915/kernel/-/issues/15990">i915#15990</a> / <a href=3D"=
https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8708">i915#8708</a>=
) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_17154=
7v1/shard-dg2-10/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-pri-shrfb-dra=
w-mmap-wc.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i91=
5/kernel/-/issues/16708">i915#16708</a> / <a href=3D"https://gitlab.freedes=
ktop.org/drm/i915/kernel/-/issues/5354">i915#5354</a>) +5 other tests skip<=
/li>
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
rg/tree/drm-tip/Patchwork_171547v1/shard-dg2-1/igt@kms_frontbuffer_tracking=
@fbc-2p-primscrn-cur-indfb-draw-mmap-wc.html">SKIP</a> (<a href=3D"https://=
gitlab.freedesktop.org/drm/i915/kernel/-/issues/15990">i915#15990</a> / <a =
href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8708">i915#=
8708</a>) +18 other tests skip</li>
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
) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_17154=
7v1/shard-rkl-4/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-pri-indfb-draw=
-mmap-wc.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915=
/kernel/-/issues/1825">i915#1825</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-indfb-draw-mmap-wc:</p>
<ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_18943/shard-rkl-1/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-=
indfb-draw-mmap-wc.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.or=
g/drm/i915/kernel/-/issues/1825">i915#1825</a>) -&gt; <a href=3D"https://in=
tel-gfx-ci.01.org/tree/drm-tip/Patchwork_171547v1/shard-rkl-6/igt@kms_front=
buffer_tracking@fbc-2p-scndscrn-spr-indfb-draw-mmap-wc.html">SKIP</a> (<a h=
ref=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#=
14544</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/iss=
ues/1825">i915#1825</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbchdr-1p-offscreen-pri-shrfb-draw-mmap-wc:=
</p>
<ul>
<li>shard-dg2:          (<a href=3D"https://intel-gfx-ci.01.org/tree/drm-ti=
p/CI_DRM_18943/shard-dg2-5/igt@kms_frontbuffer_tracking@fbchdr-1p-offscreen=
-pri-shrfb-draw-mmap-wc.html">SKIP</a>, <a href=3D"https://intel-gfx-ci.01.=
org/tree/drm-tip/CI_DRM_18943/shard-dg2-6/igt@kms_frontbuffer_tracking@fbch=
dr-1p-offscreen-pri-shrfb-draw-mmap-wc.html">SKIP</a>) (<a href=3D"https://=
gitlab.freedesktop.org/drm/i915/kernel/-/issues/15990">i915#15990</a>) -&gt=
; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_171547v1/sh=
ard-dg2-10/igt@kms_frontbuffer_tracking@fbchdr-1p-offscreen-pri-shrfb-draw-=
mmap-wc.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/=
kernel/-/issues/16708">i915#16708</a>) +7 other tests skip</li>
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
ps://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_171547v1/shard-rkl-5/igt@km=
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
://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_171547v1/shard-dg2-10/igt@kms=
_frontbuffer_tracking@fbchdr-2p-primscrn-spr-indfb-draw-mmap-wc.html">SKIP<=
/a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/167=
08">i915#16708</a>) +1 other test skip</li>
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
; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_171547v1/sh=
ard-dg2-10/igt@kms_frontbuffer_tracking@fbchdr-2p-scndscrn-spr-indfb-draw-m=
map-cpu.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/=
kernel/-/issues/16708">i915#16708</a>) +18 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbchdr-2p-scndscrn-spr-indfb-draw-render:</=
p>
<ul>
<li>shard-rkl:          (<a href=3D"https://intel-gfx-ci.01.org/tree/drm-ti=
p/CI_DRM_18943/shard-rkl-8/igt@kms_frontbuffer_tracking@fbchdr-2p-scndscrn-=
spr-indfb-draw-render.html">SKIP</a>, <a href=3D"https://intel-gfx-ci.01.or=
g/tree/drm-tip/CI_DRM_18943/shard-rkl-7/igt@kms_frontbuffer_tracking@fbchdr=
-2p-scndscrn-spr-indfb-draw-render.html">SKIP</a>) -&gt; <a href=3D"https:/=
/intel-gfx-ci.01.org/tree/drm-tip/Patchwork_171547v1/shard-rkl-6/igt@kms_fr=
ontbuffer_tracking@fbchdr-2p-scndscrn-spr-indfb-draw-render.html">SKIP</a> =
(<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">=
i915#14544</a>) +15 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbchdr-rgb565-draw-mmap-cpu:</p>
<ul>
<li>shard-dg2:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_18943/shard-dg2-8/igt@kms_frontbuffer_tracking@fbchdr-rgb565-draw-m=
map-cpu.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/=
kernel/-/issues/15989">i915#15989</a>) -&gt; <a href=3D"https://intel-gfx-c=
i.01.org/tree/drm-tip/Patchwork_171547v1/shard-dg2-10/igt@kms_frontbuffer_t=
racking@fbchdr-rgb565-draw-mmap-cpu.html">SKIP</a> (<a href=3D"https://gitl=
ab.freedesktop.org/drm/i915/kernel/-/issues/16708">i915#16708</a>) +4 other=
 tests skip</li>
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
1547v1/shard-dg2-4/igt@kms_frontbuffer_tracking@fbcpsr-1p-offscreen-pri-shr=
fb-draw-blt.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i=
915/kernel/-/issues/15102">i915#15102</a>) +26 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-cur-indfb-draw-mmap-cpu:=
</p>
<ul>
<li>shard-dg2:          (<a href=3D"https://intel-gfx-ci.01.org/tree/drm-ti=
p/CI_DRM_18943/shard-dg2-4/igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-=
cur-indfb-draw-mmap-cpu.html">SKIP</a>, <a href=3D"https://intel-gfx-ci.01.=
org/tree/drm-tip/CI_DRM_18943/shard-dg2-10/igt@kms_frontbuffer_tracking@fbc=
psr-1p-primscrn-cur-indfb-draw-mmap-cpu.html">SKIP</a>) (<a href=3D"https:/=
/gitlab.freedesktop.org/drm/i915/kernel/-/issues/15102">i915#15102</a> / <a=
 href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16708">i91=
5#16708</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/i=
ssues/5354">i915#5354</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tre=
e/drm-tip/Patchwork_171547v1/shard-dg2-1/igt@kms_frontbuffer_tracking@fbcps=
r-1p-primscrn-cur-indfb-draw-mmap-cpu.html">SKIP</a> (<a href=3D"https://gi=
tlab.freedesktop.org/drm/i915/kernel/-/issues/15102">i915#15102</a>) +19 ot=
her tests skip</li>
<li>shard-dg1:          (<a href=3D"https://intel-gfx-ci.01.org/tree/drm-ti=
p/CI_DRM_18943/shard-dg1-19/igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn=
-cur-indfb-draw-mmap-cpu.html">SKIP</a>, <a href=3D"https://intel-gfx-ci.01=
.org/tree/drm-tip/CI_DRM_18943/shard-dg1-13/igt@kms_frontbuffer_tracking@fb=
cpsr-1p-primscrn-cur-indfb-draw-mmap-cpu.html">SKIP</a>) (<a href=3D"https:=
//gitlab.freedesktop.org/drm/i915/kernel/-/issues/15102">i915#15102</a> / <=
a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4423">i91=
5#4423</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/Patch=
work_171547v1/shard-dg1-12/igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-=
cur-indfb-draw-mmap-cpu.html">SKIP</a> (<a href=3D"https://gitlab.freedeskt=
op.org/drm/i915/kernel/-/issues/15102">i915#15102</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-indfb-plflip-blt:</p>
<ul>
<li>shard-dg2:          (<a href=3D"https://intel-gfx-ci.01.org/tree/drm-ti=
p/CI_DRM_18943/shard-dg2-6/igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-=
indfb-plflip-blt.html">SKIP</a>, <a href=3D"https://intel-gfx-ci.01.org/tre=
e/drm-tip/CI_DRM_18943/shard-dg2-1/igt@kms_frontbuffer_tracking@fbcpsr-1p-p=
rimscrn-indfb-plflip-blt.html">SKIP</a>) (<a href=3D"https://gitlab.freedes=
ktop.org/drm/i915/kernel/-/issues/15102">i915#15102</a>) -&gt; <a href=3D"h=
ttps://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_171547v1/shard-dg2-4/igt@=
kms_frontbuffer_tracking@fbcpsr-1p-primscrn-indfb-plflip-blt.html">SKIP</a>=
 (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/10433"=
>i915#10433</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel=
/-/issues/15102">i915#15102</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-pri-shrfb-draw-mmap-cpu:=
</p>
<ul>
<li>shard-dg2:          (<a href=3D"https://intel-gfx-ci.01.org/tree/drm-ti=
p/CI_DRM_18943/shard-dg2-6/igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-=
pri-shrfb-draw-mmap-cpu.html">SKIP</a>, <a href=3D"https://intel-gfx-ci.01.=
org/tree/drm-tip/CI_DRM_18943/shard-dg2-5/igt@kms_frontbuffer_tracking@fbcp=
sr-1p-primscrn-pri-shrfb-draw-mmap-cpu.html">SKIP</a>) (<a href=3D"https://=
gitlab.freedesktop.org/drm/i915/kernel/-/issues/15102">i915#15102</a>) -&gt=
; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_171547v1/sh=
ard-dg2-10/igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-pri-shrfb-draw-m=
map-cpu.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/=
kernel/-/issues/16708">i915#16708</a> / <a href=3D"https://gitlab.freedeskt=
op.org/drm/i915/kernel/-/issues/5354">i915#5354</a>) +5 other tests skip</l=
i>
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
-ci.01.org/tree/drm-tip/Patchwork_171547v1/shard-dg2-10/igt@kms_frontbuffer=
_tracking@fbcpsr-1p-primscrn-pri-shrfb-draw-mmap-gtt.html">SKIP</a> (<a hre=
f=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16708">i915#16=
708</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issue=
s/5354">i915#5354</a>) +3 other tests skip</li>
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
Patchwork_171547v1/shard-dg2-4/igt@kms_frontbuffer_tracking@fbcpsr-1p-prims=
crn-spr-indfb-draw-blt.html">SKIP</a> (<a href=3D"https://gitlab.freedeskto=
p.org/drm/i915/kernel/-/issues/10433">i915#10433</a> / <a href=3D"https://g=
itlab.freedesktop.org/drm/i915/kernel/-/issues/15102">i915#15102</a>)</li>
<li>shard-rkl:          (<a href=3D"https://intel-gfx-ci.01.org/tree/drm-ti=
p/CI_DRM_18943/shard-rkl-7/igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-=
spr-indfb-draw-blt.html">SKIP</a>, <a href=3D"https://intel-gfx-ci.01.org/t=
ree/drm-tip/CI_DRM_18943/shard-rkl-8/igt@kms_frontbuffer_tracking@fbcpsr-1p=
-primscrn-spr-indfb-draw-blt.html">SKIP</a>) (<a href=3D"https://gitlab.fre=
edesktop.org/drm/i915/kernel/-/issues/15102">i915#15102</a> / <a href=3D"ht=
tps://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3023">i915#3023</a>) =
-&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_171547v=
1/shard-rkl-6/igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-spr-indfb-dra=
w-blt.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/ke=
rnel/-/issues/14544">i915#14544</a> / <a href=3D"https://gitlab.freedesktop=
.org/drm/i915/kernel/-/issues/15102">i915#15102</a> / <a href=3D"https://gi=
tlab.freedesktop.org/drm/i915/kernel/-/issues/3023">i915#3023</a>) +3 other=
 tests skip</li>
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
k_171547v1/shard-dg2-10/igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-cur=
-indfb-move.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i=
915/kernel/-/issues/16708">i915#16708</a> / <a href=3D"https://gitlab.freed=
esktop.org/drm/i915/kernel/-/issues/5354">i915#5354</a>) +10 other tests sk=
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
a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_171547v1/shard=
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
a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_171547v1/shard=
-dg2-10/igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-spr-indfb-draw-mmap=
-gtt.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/ker=
nel/-/issues/16708">i915#16708</a> / <a href=3D"https://gitlab.freedesktop.=
org/drm/i915/kernel/-/issues/5354">i915#5354</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-rgb101010-draw-pwrite:</p>
<ul>
<li>shard-dg2:          (<a href=3D"https://intel-gfx-ci.01.org/tree/drm-ti=
p/CI_DRM_18943/shard-dg2-10/igt@kms_frontbuffer_tracking@fbcpsr-rgb101010-d=
raw-pwrite.html">SKIP</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/drm-=
tip/CI_DRM_18943/shard-dg2-4/igt@kms_frontbuffer_tracking@fbcpsr-rgb101010-=
draw-pwrite.html">SKIP</a>) (<a href=3D"https://gitlab.freedesktop.org/drm/=
i915/kernel/-/issues/10433">i915#10433</a> / <a href=3D"https://gitlab.free=
desktop.org/drm/i915/kernel/-/issues/15102">i915#15102</a> / <a href=3D"htt=
ps://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16708">i915#16708</a> =
/ <a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5354">=
i915#5354</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/Pa=
tchwork_171547v1/shard-dg2-4/igt@kms_frontbuffer_tracking@fbcpsr-rgb101010-=
draw-pwrite.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i=
915/kernel/-/issues/10433">i915#10433</a> / <a href=3D"https://gitlab.freed=
esktop.org/drm/i915/kernel/-/issues/15102">i915#15102</a>)</li>
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
Patchwork_171547v1/shard-dg2-10/igt@kms_frontbuffer_tracking@fbcpsr-tiling-=
y.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel=
/-/issues/16708">i915#16708</a> / <a href=3D"https://gitlab.freedesktop.org=
/drm/i915/kernel/-/issues/5354">i915#5354</a>) +1 other test skip</li>
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
https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_171547v1/shard-dg2-10/ig=
t@kms_frontbuffer_tracking@fbcpsrhdr-1p-offscreen-pri-indfb-draw-mmap-cpu.h=
tml">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/=
issues/16708">i915#16708</a>) +2 other tests skip</li>
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
/Patchwork_171547v1/shard-rkl-5/igt@kms_frontbuffer_tracking@fbcpsrhdr-1p-p=
rimscrn-spr-indfb-draw-mmap-cpu.html">SKIP</a> (<a href=3D"https://gitlab.f=
reedesktop.org/drm/i915/kernel/-/issues/15102">i915#15102</a>) +17 other te=
sts skip</li>
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
Patchwork_171547v1/shard-dg2-8/igt@kms_frontbuffer_tracking@fbcpsrhdr-2p-sc=
ndscrn-pri-indfb-draw-mmap-wc.html">SKIP</a> (<a href=3D"https://gitlab.fre=
edesktop.org/drm/i915/kernel/-/issues/15990">i915#15990</a>) +29 other test=
s skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsrhdr-2p-scndscrn-shrfb-plflip-blt:</p>
<ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_18943/shard-rkl-1/igt@kms_frontbuffer_tracking@fbcpsrhdr-2p-scndscr=
n-shrfb-plflip-blt.html">SKIP</a> -&gt; <a href=3D"https://intel-gfx-ci.01.=
org/tree/drm-tip/Patchwork_171547v1/shard-rkl-6/igt@kms_frontbuffer_trackin=
g@fbcpsrhdr-2p-scndscrn-shrfb-plflip-blt.html">SKIP</a> (<a href=3D"https:/=
/gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a>) +16=
 other tests skip</li>
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
ttps://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_171547v1/shard-dg2-10/igt=
@kms_frontbuffer_tracking@fbcpsrhdr-2p-scndscrn-spr-indfb-draw-mmap-cpu.htm=
l">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/is=
sues/16708">i915#16708</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsrhdr-2p-shrfb-fliptrack-mmap-gtt:</p>
<ul>
<li>shard-dg2:          (<a href=3D"https://intel-gfx-ci.01.org/tree/drm-ti=
p/CI_DRM_18943/shard-dg2-8/igt@kms_frontbuffer_tracking@fbcpsrhdr-2p-shrfb-=
fliptrack-mmap-gtt.html">SKIP</a>, <a href=3D"https://intel-gfx-ci.01.org/t=
ree/drm-tip/CI_DRM_18943/shard-dg2-10/igt@kms_frontbuffer_tracking@fbcpsrhd=
r-2p-shrfb-fliptrack-mmap-gtt.html">SKIP</a>) (<a href=3D"https://gitlab.fr=
eedesktop.org/drm/i915/kernel/-/issues/15990">i915#15990</a> / <a href=3D"h=
ttps://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16708">i915#16708</a=
>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_1715=
47v1/shard-dg2-10/igt@kms_frontbuffer_tracking@fbcpsrhdr-2p-shrfb-fliptrack=
-mmap-gtt.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i91=
5/kernel/-/issues/16708">i915#16708</a>) +8 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsrhdr-rgb565-draw-render:</p>
<ul>
<li>shard-rkl:          (<a href=3D"https://intel-gfx-ci.01.org/tree/drm-ti=
p/CI_DRM_18943/shard-rkl-7/igt@kms_frontbuffer_tracking@fbcpsrhdr-rgb565-dr=
aw-render.html">SKIP</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/drm-t=
ip/CI_DRM_18943/shard-rkl-8/igt@kms_frontbuffer_tracking@fbcpsrhdr-rgb565-d=
raw-render.html">SKIP</a>) (<a href=3D"https://gitlab.freedesktop.org/drm/i=
915/kernel/-/issues/15102">i915#15102</a>) -&gt; <a href=3D"https://intel-g=
fx-ci.01.org/tree/drm-tip/Patchwork_171547v1/shard-rkl-6/igt@kms_frontbuffe=
r_tracking@fbcpsrhdr-rgb565-draw-render.html">SKIP</a> (<a href=3D"https://=
gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a> / <a =
href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15102">i915=
#15102</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsrhdr-tiling-y:</p>
<ul>
<li>shard-dg2:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_18943/shard-dg2-8/igt@kms_frontbuffer_tracking@fbcpsrhdr-tiling-y.h=
tml">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/=
issues/10055">i915#10055</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/Patchwork_171547v1/shard-dg2-10/igt@kms_frontbuffer_tracking@f=
bcpsrhdr-tiling-y.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org=
/drm/i915/kernel/-/issues/16708">i915#16708</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@hdr-1p-offscreen-pri-indfb-draw-pwrite:</p>
<ul>
<li>shard-dg2:          (<a href=3D"https://intel-gfx-ci.01.org/tree/drm-ti=
p/CI_DRM_18943/shard-dg2-10/igt@kms_frontbuffer_tracking@hdr-1p-offscreen-p=
ri-indfb-draw-pwrite.html">SKIP</a>, <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/CI_DRM_18943/shard-dg2-8/igt@kms_frontbuffer_tracking@hdr-1p-=
offscreen-pri-indfb-draw-pwrite.html">SKIP</a>) (<a href=3D"https://gitlab.=
freedesktop.org/drm/i915/kernel/-/issues/15989">i915#15989</a> / <a href=3D=
"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16708">i915#16708<=
/a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_17=
1547v1/shard-dg2-10/igt@kms_frontbuffer_tracking@hdr-1p-offscreen-pri-indfb=
-draw-pwrite.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/=
i915/kernel/-/issues/16708">i915#16708</a>) +8 other tests skip</li>
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
_171547v1/shard-dg2-8/igt@kms_frontbuffer_tracking@hdr-1p-primscrn-pri-shrf=
b-draw-mmap-cpu.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/d=
rm/i915/kernel/-/issues/15989">i915#15989</a>) +25 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@hdr-1p-primscrn-spr-indfb-draw-mmap-cpu:</p>
<ul>
<li>shard-dg2:          (<a href=3D"https://intel-gfx-ci.01.org/tree/drm-ti=
p/CI_DRM_18943/shard-dg2-6/igt@kms_frontbuffer_tracking@hdr-1p-primscrn-spr=
-indfb-draw-mmap-cpu.html">SKIP</a>, <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/CI_DRM_18943/shard-dg2-5/igt@kms_frontbuffer_tracking@hdr-1p-=
primscrn-spr-indfb-draw-mmap-cpu.html">SKIP</a>) (<a href=3D"https://gitlab=
.freedesktop.org/drm/i915/kernel/-/issues/15989">i915#15989</a>) -&gt; <a h=
ref=3D"https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_171547v1/shard-dg=
2-10/igt@kms_frontbuffer_tracking@hdr-1p-primscrn-spr-indfb-draw-mmap-cpu.h=
tml">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/=
issues/16708">i915#16708</a>) +9 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@hdr-2p-primscrn-pri-shrfb-draw-blt:</p>
<ul>
<li>shard-dg2:          (<a href=3D"https://intel-gfx-ci.01.org/tree/drm-ti=
p/CI_DRM_18943/shard-dg2-8/igt@kms_frontbuffer_tracking@hdr-2p-primscrn-pri=
-shrfb-draw-blt.html">SKIP</a>, <a href=3D"https://intel-gfx-ci.01.org/tree=
/drm-tip/CI_DRM_18943/shard-dg2-10/igt@kms_frontbuffer_tracking@hdr-2p-prim=
scrn-pri-shrfb-draw-blt.html">SKIP</a>) (<a href=3D"https://gitlab.freedesk=
top.org/drm/i915/kernel/-/issues/15991">i915#15991</a> / <a href=3D"https:/=
/gitlab.freedesktop.org/drm/i915/kernel/-/issues/16708">i915#16708</a>) -&g=
t; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_171547v1/s=
hard-dg2-10/igt@kms_frontbuffer_tracking@hdr-2p-primscrn-pri-shrfb-draw-blt=
.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/=
-/issues/16708">i915#16708</a>) +17 other tests skip</li>
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
el-gfx-ci.01.org/tree/drm-tip/Patchwork_171547v1/shard-glk4/igt@kms_frontbu=
ffer_tracking@hdr-2p-scndscrn-pri-shrfb-draw-mmap-cpu.html">SKIP</a> +9 oth=
er tests skip</li>
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
rm-tip/Patchwork_171547v1/shard-dg2-1/igt@kms_frontbuffer_tracking@psr-1p-o=
ffscreen-pri-shrfb-draw-mmap-wc.html">SKIP</a> (<a href=3D"https://gitlab.f=
reedesktop.org/drm/i915/kernel/-/issues/15104">i915#15104</a> / <a href=3D"=
https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15990">i915#15990</=
a>) +4 other tests skip</li>
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
_171547v1/shard-dg2-1/igt@kms_frontbuffer_tracking@psr-1p-primscrn-cur-indf=
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
47v1/shard-dg2-10/igt@kms_frontbuffer_tracking@psr-1p-primscrn-cur-indfb-mo=
ve.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kerne=
l/-/issues/16708">i915#16708</a> / <a href=3D"https://gitlab.freedesktop.or=
g/drm/i915/kernel/-/issues/5354">i915#5354</a>) +10 other tests skip</li>
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
e/drm-tip/Patchwork_171547v1/shard-dg2-1/igt@kms_frontbuffer_tracking@psr-1=
p-primscrn-pri-shrfb-draw-blt.html">SKIP</a> (<a href=3D"https://gitlab.fre=
edesktop.org/drm/i915/kernel/-/issues/15102">i915#15102</a>)</li>
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
Patchwork_171547v1/shard-dg2-6/igt@kms_frontbuffer_tracking@psr-2p-primscrn=
-pri-indfb-draw-render.html">SKIP</a> (<a href=3D"https://gitlab.freedeskto=
p.org/drm/i915/kernel/-/issues/15991">i915#15991</a> / <a href=3D"https://g=
itlab.freedesktop.org/drm/i915/kernel/-/issues/5354">i915#5354</a>) +45 oth=
er tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-2p-scndscrn-pri-shrfb-draw-mmap-wc:</p>
<ul>
<li>shard-rkl:          (<a href=3D"https://intel-gfx-ci.01.org/tree/drm-ti=
p/CI_DRM_18943/shard-rkl-8/igt@kms_frontbuffer_tracking@psr-2p-scndscrn-pri=
-shrfb-draw-mmap-wc.html">SKIP</a>, <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/CI_DRM_18943/shard-rkl-7/igt@kms_frontbuffer_tracking@psr-2p-s=
cndscrn-pri-shrfb-draw-mmap-wc.html">SKIP</a>) (<a href=3D"https://gitlab.f=
reedesktop.org/drm/i915/kernel/-/issues/1825">i915#1825</a>) -&gt; <a href=
=3D"https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_171547v1/shard-rkl-6=
/igt@kms_frontbuffer_tracking@psr-2p-scndscrn-pri-shrfb-draw-mmap-wc.html">=
SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issue=
s/14544">i915#14544</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i91=
5/kernel/-/issues/1825">i915#1825</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-2p-scndscrn-shrfb-pgflip-blt:</p>
<ul>
<li>shard-dg2:          (<a href=3D"https://intel-gfx-ci.01.org/tree/drm-ti=
p/CI_DRM_18943/shard-dg2-5/igt@kms_frontbuffer_tracking@psr-2p-scndscrn-shr=
fb-pgflip-blt.html">SKIP</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/d=
rm-tip/CI_DRM_18943/shard-dg2-6/igt@kms_frontbuffer_tracking@psr-2p-scndscr=
n-shrfb-pgflip-blt.html">SKIP</a>) (<a href=3D"https://gitlab.freedesktop.o=
rg/drm/i915/kernel/-/issues/15991">i915#15991</a> / <a href=3D"https://gitl=
ab.freedesktop.org/drm/i915/kernel/-/issues/5354">i915#5354</a>) -&gt; <a h=
ref=3D"https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_171547v1/shard-dg=
2-10/igt@kms_frontbuffer_tracking@psr-2p-scndscrn-shrfb-pgflip-blt.html">SK=
IP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/=
16708">i915#16708</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i915/=
kernel/-/issues/5354">i915#5354</a>) +12 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-rgb101010-draw-mmap-cpu:</p>
<ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_18943/shard-rkl-1/igt@kms_frontbuffer_tracking@psr-rgb101010-draw-m=
map-cpu.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/=
kernel/-/issues/15102">i915#15102</a> / <a href=3D"https://gitlab.freedeskt=
op.org/drm/i915/kernel/-/issues/3023">i915#3023</a>) -&gt; <a href=3D"https=
://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_171547v1/shard-rkl-6/igt@kms_=
frontbuffer_tracking@psr-rgb101010-draw-mmap-cpu.html">SKIP</a> (<a href=3D=
"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14544<=
/a> / <a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15=
102">i915#15102</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i915/ke=
rnel/-/issues/3023">i915#3023</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-rgb565-draw-mmap-cpu:</p>
<ul>
<li>shard-dg2:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_18943/shard-dg2-8/igt@kms_frontbuffer_tracking@psr-rgb565-draw-mmap=
-cpu.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/ker=
nel/-/issues/15102">i915#15102</a>) -&gt; <a href=3D"https://intel-gfx-ci.0=
1.org/tree/drm-tip/Patchwork_171547v1/shard-dg2-10/igt@kms_frontbuffer_trac=
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
i.01.org/tree/drm-tip/Patchwork_171547v1/shard-rkl-5/igt@kms_frontbuffer_tr=
acking@psr-suspend.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.or=
g/drm/i915/kernel/-/issues/15102">i915#15102</a> / <a href=3D"https://gitla=
b.freedesktop.org/drm/i915/kernel/-/issues/3023">i915#3023</a>) +14 other t=
ests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psrhdr-1p-offscreen-pri-shrfb-draw-pwrite:<=
/p>
<ul>
<li>shard-dg2:          (<a href=3D"https://intel-gfx-ci.01.org/tree/drm-ti=
p/CI_DRM_18943/shard-dg2-5/igt@kms_frontbuffer_tracking@psrhdr-1p-offscreen=
-pri-shrfb-draw-pwrite.html">SKIP</a>, <a href=3D"https://intel-gfx-ci.01.o=
rg/tree/drm-tip/CI_DRM_18943/shard-dg2-6/igt@kms_frontbuffer_tracking@psrhd=
r-1p-offscreen-pri-shrfb-draw-pwrite.html">SKIP</a>) (<a href=3D"https://gi=
tlab.freedesktop.org/drm/i915/kernel/-/issues/15102">i915#15102</a>) -&gt; =
<a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_171547v1/shar=
d-dg2-10/igt@kms_frontbuffer_tracking@psrhdr-1p-offscreen-pri-shrfb-draw-pw=
rite.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/ker=
nel/-/issues/16708">i915#16708</a>) +8 other tests skip</li>
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
=3D"https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_171547v1/shard-dg2-8=
/igt@kms_frontbuffer_tracking@psrhdr-2p-pri-indfb-multidraw.html">SKIP</a> =
(<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15991">=
i915#15991</a>) +53 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psrhdr-slowdraw:</p>
<ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_18943/shard-rkl-1/igt@kms_frontbuffer_tracking@psrhdr-slowdraw.html=
">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/iss=
ues/15102">i915#15102</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tre=
e/drm-tip/Patchwork_171547v1/shard-rkl-6/igt@kms_frontbuffer_tracking@psrhd=
r-slowdraw.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i9=
15/kernel/-/issues/14544">i915#14544</a> / <a href=3D"https://gitlab.freede=
sktop.org/drm/i915/kernel/-/issues/15102">i915#15102</a>) +6 other tests sk=
ip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psrhdr-suspend:</p>
<ul>
<li>shard-dg2:          (<a href=3D"https://intel-gfx-ci.01.org/tree/drm-ti=
p/CI_DRM_18943/shard-dg2-10/igt@kms_frontbuffer_tracking@psrhdr-suspend.htm=
l">SKIP</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_189=
43/shard-dg2-8/igt@kms_frontbuffer_tracking@psrhdr-suspend.html">SKIP</a>) =
(<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15102">=
i915#15102</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/=
-/issues/16708">i915#16708</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.or=
g/tree/drm-tip/Patchwork_171547v1/shard-dg2-10/igt@kms_frontbuffer_tracking=
@psrhdr-suspend.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/d=
rm/i915/kernel/-/issues/16708">i915#16708</a>) +12 other tests skip</li>
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
ip/Patchwork_171547v1/shard-dg2-4/igt@kms_hdr@bpc-switch.html">SKIP</a> (<a=
 href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16518">i91=
5#16518</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/i=
ssues/3555">i915#3555</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i=
915/kernel/-/issues/8228">i915#8228</a>)</li>
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
171547v1/shard-dg2-10/igt@kms_hdr@static-toggle.html">SKIP</a> (<a href=3D"=
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
171547v1/shard-rkl-8/igt@kms_hdr@static-toggle.html">SKIP</a> (<a href=3D"h=
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
1.org/tree/drm-tip/Patchwork_171547v1/shard-dg2-10/igt@kms_hdr@static-toggl=
e-dpms.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/k=
ernel/-/issues/16707">i915#16707</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_joiner@invalid-modeset-ultra-joiner:</p>
<ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_18943/shard-rkl-1/igt@kms_joiner@invalid-modeset-ultra-joiner.html"=
>SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issu=
es/15458">i915#15458</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree=
/drm-tip/Patchwork_171547v1/shard-rkl-6/igt@kms_joiner@invalid-modeset-ultr=
a-joiner.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915=
/kernel/-/issues/14544">i915#14544</a> / <a href=3D"https://gitlab.freedesk=
top.org/drm/i915/kernel/-/issues/15458">i915#15458</a>)</li>
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
atchwork_171547v1/shard-dg2-8/igt@kms_panel_fitting@atomic-fastset.html">SK=
IP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/=
6301">i915#6301</a>)</li>
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
i.01.org/tree/drm-tip/Patchwork_171547v1/shard-rkl-4/igt@kms_plane@pixel-fo=
rmat-y-tiled-ccs-modifier.html">SKIP</a> (<a href=3D"https://gitlab.freedes=
ktop.org/drm/i915/kernel/-/issues/15709">i915#15709</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane@plane-panning-bottom-right:</p>
<ul>
<li>shard-dg2:          (<a href=3D"https://intel-gfx-ci.01.org/tree/drm-ti=
p/CI_DRM_18943/shard-dg2-8/igt@kms_plane@plane-panning-bottom-right.html">P=
ASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18943/s=
hard-dg2-10/igt@kms_plane@plane-panning-bottom-right.html">SKIP</a>) (<a hr=
ef=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8825">i915#88=
25</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork=
_171547v1/shard-dg2-10/igt@kms_plane@plane-panning-bottom-right.html">SKIP<=
/a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/882=
5">i915#8825</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane_multiple@2x-tiling-4:</p>
<ul>
<li>shard-dg2:          (<a href=3D"https://intel-gfx-ci.01.org/tree/drm-ti=
p/CI_DRM_18943/shard-dg2-10/igt@kms_plane_multiple@2x-tiling-4.html">SKIP</=
a>, <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18943/shard-=
dg2-8/igt@kms_plane_multiple@2x-tiling-4.html">SKIP</a>) (<a href=3D"https:=
//gitlab.freedesktop.org/drm/i915/kernel/-/issues/13958">i915#13958</a> / <=
a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16707">i9=
15#16707</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/Pat=
chwork_171547v1/shard-dg2-10/igt@kms_plane_multiple@2x-tiling-4.html">SKIP<=
/a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/167=
07">i915#16707</a>)</li>
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
ip/Patchwork_171547v1/shard-dg2-4/igt@kms_plane_multiple@2x-tiling-none.htm=
l">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/is=
sues/13958">i915#13958</a>) +1 other test skip</li>
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
_171547v1/shard-dg2-10/igt@kms_plane_multiple@tiling-y.html">SKIP</a> (<a h=
ref=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16707">i915#=
16707</a>)</li>
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
a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_171547v1/shard=
-dg2-10/igt@kms_plane_scaling@planes-upscale-factor-0-25.html">SKIP</a> (<a=
 href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15329">i91=
5#15329</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/i=
ssues/3555">i915#3555</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i=
915/kernel/-/issues/6953">i915#6953</a> / <a href=3D"https://gitlab.freedes=
ktop.org/drm/i915/kernel/-/issues/9423">i915#9423</a>) +1 other test skip</=
li>
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
ci.01.org/tree/drm-tip/Patchwork_171547v1/shard-dg2-10/igt@kms_plane_scalin=
g@planes-upscale-factor-0-25@pipe-d.html">SKIP</a> (<a href=3D"https://gitl=
ab.freedesktop.org/drm/i915/kernel/-/issues/15329">i915#15329</a>) +7 other=
 tests skip</li>
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
hwork_171547v1/shard-rkl-5/igt@kms_pm_dc@dc5-pageflip-negative.html">SKIP</=
a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9685=
">i915#9685</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pm_dc@dc5-retention-flops:</p>
<ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_18943/shard-rkl-1/igt@kms_pm_dc@dc5-retention-flops.html">SKIP</a> =
(<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3828">i=
915#3828</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/Pat=
chwork_171547v1/shard-rkl-6/igt@kms_pm_dc@dc5-retention-flops.html">SKIP</a=
> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544=
">i915#14544</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i915/kerne=
l/-/issues/3828">i915#3828</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pm_dc@dc9-dpms:</p>
<ul>
<li>shard-tglu:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_18943/shard-tglu-6/igt@kms_pm_dc@dc9-dpms.html">SKIP</a> (<a href=
=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15128">i915#151=
28</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork=
_171547v1/shard-tglu-5/igt@kms_pm_dc@dc9-dpms.html">SKIP</a> (<a href=3D"ht=
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
ef=3D"https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_171547v1/shard-rkl=
-6/igt@kms_pm_lpsp@kms-lpsp.html">SKIP</a> (<a href=3D"https://gitlab.freed=
esktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a> / <a href=3D"http=
s://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9340">i915#9340</a>)</l=
i>
<li>shard-dg1:          (<a href=3D"https://intel-gfx-ci.01.org/tree/drm-ti=
p/CI_DRM_18943/shard-dg1-15/igt@kms_pm_lpsp@kms-lpsp.html">SKIP</a>, <a hre=
f=3D"https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18943/shard-dg1-17/igt=
@kms_pm_lpsp@kms-lpsp.html">SKIP</a>) (<a href=3D"https://gitlab.freedeskto=
p.org/drm/i915/kernel/-/issues/3828">i915#3828</a> / <a href=3D"https://git=
lab.freedesktop.org/drm/i915/kernel/-/issues/9340">i915#9340</a>) -&gt; <a =
href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_171547v1/shard-d=
g1-14/igt@kms_pm_lpsp@kms-lpsp.html">SKIP</a> (<a href=3D"https://gitlab.fr=
eedesktop.org/drm/i915/kernel/-/issues/3828">i915#3828</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pm_lpsp@screens-disabled:</p>
<ul>
<li>shard-rkl:          (<a href=3D"https://intel-gfx-ci.01.org/tree/drm-ti=
p/CI_DRM_18943/shard-rkl-8/igt@kms_pm_lpsp@screens-disabled.html">SKIP</a>,=
 <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18943/shard-rkl=
-6/igt@kms_pm_lpsp@screens-disabled.html">SKIP</a>) (<a href=3D"https://git=
lab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a> / <a hre=
f=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8430">i915#843=
0</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_=
171547v1/shard-rkl-3/igt@kms_pm_lpsp@screens-disabled.html">SKIP</a> (<a hr=
ef=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8430">i915#84=
30</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pm_rpm@dpms-lpsp:</p>
<ul>
<li>shard-rkl:          (<a href=3D"https://intel-gfx-ci.01.org/tree/drm-ti=
p/CI_DRM_18943/shard-rkl-8/igt@kms_pm_rpm@dpms-lpsp.html">PASS</a>, <a href=
=3D"https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18943/shard-rkl-3/igt@k=
ms_pm_rpm@dpms-lpsp.html">SKIP</a>) (<a href=3D"https://gitlab.freedesktop.=
org/drm/i915/kernel/-/issues/15073">i915#15073</a>) -&gt; <a href=3D"https:=
//intel-gfx-ci.01.org/tree/drm-tip/Patchwork_171547v1/shard-rkl-4/igt@kms_p=
m_rpm@dpms-lpsp.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/d=
rm/i915/kernel/-/issues/15073">i915#15073</a>) +2 other tests skip</li>
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
k_171547v1/shard-dg1-15/igt@kms_pm_rpm@dpms-mode-unset-non-lpsp.html">SKIP<=
/a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/150=
73">i915#15073</a>) +2 other tests skip</li>
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
/Patchwork_171547v1/shard-dg2-10/igt@kms_properties@colorop-properties-lega=
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
f=3D"https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_171547v1/shard-rkl-=
5/igt@kms_psr2_sf@fbc-psr2-overlay-plane-update-continuous-sf.html">SKIP</a=
> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11520=
">i915#11520</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@pr-primary-plane-update-sf-dmg-area-big-fb:</p>
<ul>
<li>shard-rkl:          (<a href=3D"https://intel-gfx-ci.01.org/tree/drm-ti=
p/CI_DRM_18943/shard-rkl-7/igt@kms_psr2_sf@pr-primary-plane-update-sf-dmg-a=
rea-big-fb.html">SKIP</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/drm-=
tip/CI_DRM_18943/shard-rkl-8/igt@kms_psr2_sf@pr-primary-plane-update-sf-dmg=
-area-big-fb.html">SKIP</a>) (<a href=3D"https://gitlab.freedesktop.org/drm=
/i915/kernel/-/issues/11520">i915#11520</a>) -&gt; <a href=3D"https://intel=
-gfx-ci.01.org/tree/drm-tip/Patchwork_171547v1/shard-rkl-6/igt@kms_psr2_sf@=
pr-primary-plane-update-sf-dmg-area-big-fb.html">SKIP</a> (<a href=3D"https=
://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11520">i915#11520</a> / =
<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i=
915#14544</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@psr2-overlay-plane-move-continuous-exceed-sf:</p>
<ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_18943/shard-rkl-1/igt@kms_psr2_sf@psr2-overlay-plane-move-continuou=
s-exceed-sf.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i=
915/kernel/-/issues/11520">i915#11520</a>) -&gt; <a href=3D"https://intel-g=
fx-ci.01.org/tree/drm-tip/Patchwork_171547v1/shard-rkl-6/igt@kms_psr2_sf@ps=
r2-overlay-plane-move-continuous-exceed-sf.html">SKIP</a> (<a href=3D"https=
://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11520">i915#11520</a> / =
<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i=
915#14544</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@psr2-overlay-plane-move-continuous-sf:</p>
<ul>
<li>shard-dg1:          (<a href=3D"https://intel-gfx-ci.01.org/tree/drm-ti=
p/CI_DRM_18943/shard-dg1-13/igt@kms_psr2_sf@psr2-overlay-plane-move-continu=
ous-sf.html">SKIP</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/=
CI_DRM_18943/shard-dg1-19/igt@kms_psr2_sf@psr2-overlay-plane-move-continuou=
s-sf.html">SKIP</a>) (<a href=3D"https://gitlab.freedesktop.org/drm/i915/ke=
rnel/-/issues/11520">i915#11520</a>) -&gt; <a href=3D"https://intel-gfx-ci.=
01.org/tree/drm-tip/Patchwork_171547v1/shard-dg1-12/igt@kms_psr2_sf@psr2-ov=
erlay-plane-move-continuous-sf.html">SKIP</a> (<a href=3D"https://gitlab.fr=
eedesktop.org/drm/i915/kernel/-/issues/11520">i915#11520</a> / <a href=3D"h=
ttps://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4423">i915#4423</a>)=
</li>
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
47v1/shard-rkl-4/igt@kms_psr2_su@page_flip-p010.html">SKIP</a> (<a href=3D"=
https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9683">i915#9683</a>=
)</li>
</ul>
</li>
<li>
<p>igt@kms_psr@fbc-pr-sprite-plane-onoff:</p>
<ul>
<li>shard-rkl:          (<a href=3D"https://intel-gfx-ci.01.org/tree/drm-ti=
p/CI_DRM_18943/shard-rkl-8/igt@kms_psr@fbc-pr-sprite-plane-onoff.html">SKIP=
</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18943/shar=
d-rkl-7/igt@kms_psr@fbc-pr-sprite-plane-onoff.html">SKIP</a>) (<a href=3D"h=
ttps://gitlab.freedesktop.org/drm/i915/kernel/-/issues/1072">i915#1072</a> =
/ <a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9732">=
i915#9732</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/Pa=
tchwork_171547v1/shard-rkl-6/igt@kms_psr@fbc-pr-sprite-plane-onoff.html">SK=
IP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/=
1072">i915#1072</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i915/ke=
rnel/-/issues/14544">i915#14544</a> / <a href=3D"https://gitlab.freedesktop=
.org/drm/i915/kernel/-/issues/9732">i915#9732</a>) +1 other test skip</li>
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
Patchwork_171547v1/shard-rkl-8/igt@kms_psr@pr-cursor-mmap-cpu.html">SKIP</a=
> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/1072"=
>i915#1072</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/=
-/issues/9732">i915#9732</a>) +12 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr@psr2-sprite-plane-onoff:</p>
<ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_18943/shard-rkl-1/igt@kms_psr@psr2-sprite-plane-onoff.html">SKIP</a=
> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/1072"=
>i915#1072</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/=
-/issues/9732">i915#9732</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/Patchwork_171547v1/shard-rkl-6/igt@kms_psr@psr2-sprite-plane-o=
noff.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/ker=
nel/-/issues/1072">i915#1072</a> / <a href=3D"https://gitlab.freedesktop.or=
g/drm/i915/kernel/-/issues/14544">i915#14544</a> / <a href=3D"https://gitla=
b.freedesktop.org/drm/i915/kernel/-/issues/9732">i915#9732</a>) +2 other te=
sts skip</li>
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
ps://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_171547v1/shard-rkl-5/igt@km=
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
chwork_171547v1/shard-dg2-10/igt@kms_rotation_crc@exhaust-fences.html">SKIP=
</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16=
707">i915#16707</a>)</li>
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
&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_171547v1=
/shard-dg2-6/igt@kms_rotation_crc@primary-y-tiled-reflect-x-90.html">SKIP</=
a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/1275=
5">i915#12755</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i915/kern=
el/-/issues/15867">i915#15867</a> / <a href=3D"https://gitlab.freedesktop.o=
rg/drm/i915/kernel/-/issues/5190">i915#5190</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_rotation_crc@primary-yf-tiled-reflect-x-0:</p>
<ul>
<li>shard-dg2:          (<a href=3D"https://intel-gfx-ci.01.org/tree/drm-ti=
p/CI_DRM_18943/shard-dg2-10/igt@kms_rotation_crc@primary-yf-tiled-reflect-x=
-0.html">SKIP</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/CI_D=
RM_18943/shard-dg2-4/igt@kms_rotation_crc@primary-yf-tiled-reflect-x-0.html=
">SKIP</a>) (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/is=
sues/16707">i915#16707</a> / <a href=3D"https://gitlab.freedesktop.org/drm/=
i915/kernel/-/issues/5190">i915#5190</a>) -&gt; <a href=3D"https://intel-gf=
x-ci.01.org/tree/drm-tip/Patchwork_171547v1/shard-dg2-4/igt@kms_rotation_cr=
c@primary-yf-tiled-reflect-x-0.html">SKIP</a> (<a href=3D"https://gitlab.fr=
eedesktop.org/drm/i915/kernel/-/issues/5190">i915#5190</a>) +1 other test s=
kip</li>
</ul>
</li>
<li>
<p>igt@kms_rotation_crc@primary-yf-tiled-reflect-x-180:</p>
<ul>
<li>shard-dg2:          (<a href=3D"https://intel-gfx-ci.01.org/tree/drm-ti=
p/CI_DRM_18943/shard-dg2-5/igt@kms_rotation_crc@primary-yf-tiled-reflect-x-=
180.html">SKIP</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/CI_=
DRM_18943/shard-dg2-6/igt@kms_rotation_crc@primary-yf-tiled-reflect-x-180.h=
tml">SKIP</a>) (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-=
/issues/5190">i915#5190</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/t=
ree/drm-tip/Patchwork_171547v1/shard-dg2-10/igt@kms_rotation_crc@primary-yf=
-tiled-reflect-x-180.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.=
org/drm/i915/kernel/-/issues/16707">i915#16707</a> / <a href=3D"https://git=
lab.freedesktop.org/drm/i915/kernel/-/issues/5190">i915#5190</a>)</li>
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
x-ci.01.org/tree/drm-tip/Patchwork_171547v1/shard-dg2-1/igt@kms_rotation_cr=
c@sprite-rotation-270.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop=
.org/drm/i915/kernel/-/issues/12755">i915#12755</a> / <a href=3D"https://gi=
tlab.freedesktop.org/drm/i915/kernel/-/issues/15867">i915#15867</a>) +1 oth=
er test skip</li>
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
rm-tip/Patchwork_171547v1/shard-dg2-10/igt@kms_rotation_crc@sprite-rotation=
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
71547v1/shard-dg2-10/igt@kms_scaling_modes@scaling-mode-none.html">SKIP</a>=
 (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16707"=
>i915#16707</a>) +1 other test skip</li>
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
rm-tip/Patchwork_171547v1/shard-dg2-6/igt@kms_tiled_display@basic-test-patt=
ern.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kern=
el/-/issues/8623">i915#8623</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_vblank@ts-continuation-dpms-suspend:</p>
<ul>
<li>shard-dg2:          (<a href=3D"https://intel-gfx-ci.01.org/tree/drm-ti=
p/CI_DRM_18943/shard-dg2-10/igt@kms_vblank@ts-continuation-dpms-suspend.htm=
l">SKIP</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_189=
43/shard-dg2-8/igt@kms_vblank@ts-continuation-dpms-suspend.html">PASS</a>) =
(<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16707">=
i915#16707</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/P=
atchwork_171547v1/shard-dg2-10/igt@kms_vblank@ts-continuation-dpms-suspend.=
html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-=
/issues/16707">i915#16707</a>) +27 other tests skip</li>
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
71547v1/shard-dg2-8/igt@kms_vrr@flip-basic-fastset.html">SKIP</a> (<a href=
=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9906">i915#9906=
</a>) +2 other tests skip</li>
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
71547v1/shard-dg2-6/igt@kms_vrr@flip-dpms.html">SKIP</a> (<a href=3D"https:=
//gitlab.freedesktop.org/drm/i915/kernel/-/issues/15243">i915#15243</a> / <=
a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3555">i91=
5#3555</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_vrr@flip-suspend:</p>
<ul>
<li>shard-dg2:          (<a href=3D"https://intel-gfx-ci.01.org/tree/drm-ti=
p/CI_DRM_18943/shard-dg2-6/igt@kms_vrr@flip-suspend.html">SKIP</a>, <a href=
=3D"https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18943/shard-dg2-5/igt@k=
ms_vrr@flip-suspend.html">SKIP</a>) (<a href=3D"https://gitlab.freedesktop.=
org/drm/i915/kernel/-/issues/15243">i915#15243</a> / <a href=3D"https://git=
lab.freedesktop.org/drm/i915/kernel/-/issues/3555">i915#3555</a>) -&gt; <a =
href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_171547v1/shard-d=
g2-10/igt@kms_vrr@flip-suspend.html">SKIP</a> (<a href=3D"https://gitlab.fr=
eedesktop.org/drm/i915/kernel/-/issues/16707">i915#16707</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_vrr@seamless-rr-switch-drrs:</p>
<ul>
<li>shard-rkl:          (<a href=3D"https://intel-gfx-ci.01.org/tree/drm-ti=
p/CI_DRM_18943/shard-rkl-8/igt@kms_vrr@seamless-rr-switch-drrs.html">SKIP</=
a>, <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18943/shard-=
rkl-7/igt@kms_vrr@seamless-rr-switch-drrs.html">SKIP</a>) (<a href=3D"https=
://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9906">i915#9906</a>) -&g=
t; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_171547v1/s=
hard-rkl-6/igt@kms_vrr@seamless-rr-switch-drrs.html">SKIP</a> (<a href=3D"h=
ttps://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a=
> / <a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9906=
">i915#9906</a>)</li>
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
ork_171547v1/shard-rkl-3/igt@kms_vrr@seamless-rr-switch-vrr.html">SKIP</a> =
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
p/Patchwork_171547v1/shard-rkl-5/igt@perf@per-context-mode-unprivileged.htm=
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
&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_171547v1=
/shard-mtlp-8/igt@perf_pmu@busy-double-start@rcs0.html">FAIL</a> (<a href=
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
work_171547v1/shard-dg2-10/igt@prime_vgem@basic-fence-flip.html">SKIP</a> (=
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
171547v1/shard-rkl-5/igt@prime_vgem@basic-read.html">SKIP</a> (<a href=3D"h=
ttps://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3291">i915#3291</a> =
/ <a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3708">=
i915#3708</a>)</li>
</ul>
</li>
<li>
<p>igt@prime_vgem@fence-write-hang:</p>
<ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_18943/shard-rkl-1/igt@prime_vgem@fence-write-hang.html">SKIP</a> (<=
a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3708">i91=
5#3708</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/Patch=
work_171547v1/shard-rkl-6/igt@prime_vgem@fence-write-hang.html">SKIP</a> (<=
a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i9=
15#14544</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/=
issues/3708">i915#3708</a>)</li>
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
47v1/shard-rkl-5/igt@sriov_basic@bind-unbind-vf.html">SKIP</a> (<a href=3D"=
https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9917">i915#9917</a>=
)</li>
</ul>
</li>
</ul>
<h2>Build changes</h2>
<ul>
<li>Linux: CI_DRM_18943 -&gt; Patchwork_171547v1</li>
</ul>
<p>CI-20190529: 20190529<br />
  CI_DRM_18943: 0377b35cbeef071dfeed06ccadc0d7607eccaa64 @ git://anongit.fr=
eedesktop.org/gfx-ci/linux<br />
  IGT_9036: 9036<br />
  Patchwork_171547v1: 0377b35cbeef071dfeed06ccadc0d7607eccaa64 @ git://anon=
git.freedesktop.org/gfx-ci/linux<br />
  piglit_4509: fdc5a4ca11124ab8413c7988896eec4c97336694 @ git://anongit.fre=
edesktop.org/piglit</p>

</body>
</html>

--===============9202677912254395861==--
