Return-Path: <intel-gfx-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 23D47C61DCB
	for <intel-gfx@archiver.kernel.org>; Fri, 28 Aug 2026 11:31:04 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 94BDA10E004;
	Fri, 28 Aug 2026 11:31:03 +0000 (UTC)
Received: from 61270ab9df2a (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E986910E004;
 Fri, 28 Aug 2026 11:31:02 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============5719764188517195551=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=97_i915=2ECI=2EBAT=3A_failure_for_drm/i915/selftests=3A_Mod?=
 =?utf-8?q?ernize_printing_in_i915_selftests_=28rev4=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Krzysztof Karas" <krzysztof.karas@intel.com>
Cc: intel-gfx@lists.freedesktop.org
Date: Fri, 28 Aug 2026 11:31:02 -0000
Message-ID: <178791666294.94692.13671442626411100888@61270ab9df2a>
X-Patchwork-Hint: ignore
References: <20260828100339.72304-1-krzysztof.karas@intel.com>
In-Reply-To: <20260828100339.72304-1-krzysztof.karas@intel.com>
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

--===============5719764188517195551==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: drm/i915/selftests: Modernize printing in i915 selftests (rev4)
URL   : https://patchwork.freedesktop.org/series/171991/
State : failure

== Summary ==

CI Bug Log - changes from CI_DRM_19057 -> Patchwork_171991v4
====================================================

Summary
-------

  **FAILURE**

  Serious unknown changes coming with Patchwork_171991v4 absolutely need to be
  verified manually.
  
  If you think the reported changes have nothing to do with the changes
  introduced in Patchwork_171991v4, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them
  to document this new failure mode, which will reduce false positives in CI.

  External URL: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_171991v4/index.html

Participating hosts (39 -> 39)
------------------------------

  Additional (2): fi-hsw-4770 bat-arls-5 
  Missing    (2): bat-dg2-13 fi-snb-2520m 

Possible new issues
-------------------

  Here are the unknown changes that may have been introduced in Patchwork_171991v4:

### IGT changes ###

#### Possible regressions ####

  * igt@i915_selftest@live:
    - fi-bsw-n3050:       [PASS][1] -> [DMESG-WARN][2] +1 other test dmesg-warn
   [1]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19057/fi-bsw-n3050/igt@i915_selftest@live.html
   [2]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_171991v4/fi-bsw-n3050/igt@i915_selftest@live.html
    - bat-dg1-7:          [PASS][3] -> [DMESG-WARN][4] +1 other test dmesg-warn
   [3]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19057/bat-dg1-7/igt@i915_selftest@live.html
   [4]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_171991v4/bat-dg1-7/igt@i915_selftest@live.html

  * igt@i915_selftest@live@gt_pm:
    - fi-tgl-1115g4:      NOTRUN -> [DMESG-WARN][5] +1 other test dmesg-warn
   [5]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_171991v4/fi-tgl-1115g4/igt@i915_selftest@live@gt_pm.html

  * igt@i915_selftest@live@gt_tlb:
    - fi-kbl-7567u:       [PASS][6] -> [DMESG-WARN][7] +1 other test dmesg-warn
   [6]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19057/fi-kbl-7567u/igt@i915_selftest@live@gt_tlb.html
   [7]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_171991v4/fi-kbl-7567u/igt@i915_selftest@live@gt_tlb.html
    - fi-cfl-guc:         [PASS][8] -> [DMESG-WARN][9] +1 other test dmesg-warn
   [8]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19057/fi-cfl-guc/igt@i915_selftest@live@gt_tlb.html
   [9]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_171991v4/fi-cfl-guc/igt@i915_selftest@live@gt_tlb.html
    - bat-adlp-11:        [PASS][10] -> [DMESG-WARN][11] +1 other test dmesg-warn
   [10]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19057/bat-adlp-11/igt@i915_selftest@live@gt_tlb.html
   [11]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_171991v4/bat-adlp-11/igt@i915_selftest@live@gt_tlb.html
    - bat-dg1-6:          [PASS][12] -> [DMESG-WARN][13] +1 other test dmesg-warn
   [12]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19057/bat-dg1-6/igt@i915_selftest@live@gt_tlb.html
   [13]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_171991v4/bat-dg1-6/igt@i915_selftest@live@gt_tlb.html
    - bat-adlp-6:         [PASS][14] -> [DMESG-WARN][15] +1 other test dmesg-warn
   [14]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19057/bat-adlp-6/igt@i915_selftest@live@gt_tlb.html
   [15]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_171991v4/bat-adlp-6/igt@i915_selftest@live@gt_tlb.html
    - fi-cfl-8700k:       [PASS][16] -> [DMESG-WARN][17] +1 other test dmesg-warn
   [16]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19057/fi-cfl-8700k/igt@i915_selftest@live@gt_tlb.html
   [17]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_171991v4/fi-cfl-8700k/igt@i915_selftest@live@gt_tlb.html
    - fi-bsw-nick:        [PASS][18] -> [DMESG-WARN][19] +1 other test dmesg-warn
   [18]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19057/fi-bsw-nick/igt@i915_selftest@live@gt_tlb.html
   [19]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_171991v4/fi-bsw-nick/igt@i915_selftest@live@gt_tlb.html

  
Known issues
------------

  Here are the changes found in Patchwork_171991v4 that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@gem_lmem_swapping@basic:
    - bat-arls-5:         NOTRUN -> [SKIP][20] ([i915#10213] / [i915#11671]) +3 other tests skip
   [20]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_171991v4/bat-arls-5/igt@gem_lmem_swapping@basic.html

  * igt@gem_lmem_swapping@parallel-random-engines:
    - fi-tgl-1115g4:      NOTRUN -> [SKIP][21] ([i915#4613]) +3 other tests skip
   [21]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_171991v4/fi-tgl-1115g4/igt@gem_lmem_swapping@parallel-random-engines.html

  * igt@gem_mmap@basic:
    - bat-arls-5:         NOTRUN -> [SKIP][22] ([i915#4083])
   [22]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_171991v4/bat-arls-5/igt@gem_mmap@basic.html

  * igt@gem_render_tiled_blits@basic:
    - bat-arls-5:         NOTRUN -> [SKIP][23] ([i915#10197] / [i915#10211] / [i915#4079])
   [23]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_171991v4/bat-arls-5/igt@gem_render_tiled_blits@basic.html

  * igt@gem_softpin@allocator-basic-reserve:
    - fi-hsw-4770:        NOTRUN -> [SKIP][24] +15 other tests skip
   [24]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_171991v4/fi-hsw-4770/igt@gem_softpin@allocator-basic-reserve.html

  * igt@gem_tiled_blits@basic:
    - bat-arls-5:         NOTRUN -> [SKIP][25] ([i915#12637] / [i915#4077]) +2 other tests skip
   [25]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_171991v4/bat-arls-5/igt@gem_tiled_blits@basic.html

  * igt@gem_tiled_pread_basic@basic:
    - bat-arls-5:         NOTRUN -> [SKIP][26] ([i915#15657])
   [26]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_171991v4/bat-arls-5/igt@gem_tiled_pread_basic@basic.html

  * igt@i915_pm_rps@basic-api:
    - bat-arls-5:         NOTRUN -> [SKIP][27] ([i915#10209] / [i915#11681])
   [27]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_171991v4/bat-arls-5/igt@i915_pm_rps@basic-api.html

  * igt@intel_hwmon@hwmon-read:
    - bat-arls-5:         NOTRUN -> [SKIP][28] ([i915#7707]) +1 other test skip
   [28]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_171991v4/bat-arls-5/igt@intel_hwmon@hwmon-read.html

  * igt@kms_addfb_basic@addfb25-y-tiled-small-legacy:
    - fi-hsw-4770:        NOTRUN -> [SKIP][29] ([i915#5190])
   [29]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_171991v4/fi-hsw-4770/igt@kms_addfb_basic@addfb25-y-tiled-small-legacy.html
    - bat-arls-5:         NOTRUN -> [SKIP][30] ([i915#10200] / [i915#12203])
   [30]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_171991v4/bat-arls-5/igt@kms_addfb_basic@addfb25-y-tiled-small-legacy.html

  * igt@kms_addfb_basic@clobberred-modifier:
    - bat-arls-5:         NOTRUN -> [SKIP][31] ([i915#10200]) +8 other tests skip
   [31]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_171991v4/bat-arls-5/igt@kms_addfb_basic@clobberred-modifier.html

  * igt@kms_cursor_legacy@basic-busy-flip-before-cursor-legacy:
    - bat-arls-5:         NOTRUN -> [SKIP][32] ([i915#10202]) +1 other test skip
   [32]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_171991v4/bat-arls-5/igt@kms_cursor_legacy@basic-busy-flip-before-cursor-legacy.html

  * igt@kms_dsc@dsc-basic:
    - bat-arls-5:         NOTRUN -> [SKIP][33] ([i915#16361])
   [33]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_171991v4/bat-arls-5/igt@kms_dsc@dsc-basic.html

  * igt@kms_force_connector_basic@force-load-detect:
    - bat-arls-5:         NOTRUN -> [SKIP][34] ([i915#10207])
   [34]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_171991v4/bat-arls-5/igt@kms_force_connector_basic@force-load-detect.html
    - fi-tgl-1115g4:      NOTRUN -> [SKIP][35]
   [35]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_171991v4/fi-tgl-1115g4/igt@kms_force_connector_basic@force-load-detect.html

  * igt@kms_hdmi_inject@inject-audio:
    - fi-tgl-1115g4:      NOTRUN -> [FAIL][36] ([i915#16664])
   [36]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_171991v4/fi-tgl-1115g4/igt@kms_hdmi_inject@inject-audio.html

  * igt@kms_pm_backlight@basic-brightness:
    - bat-arls-5:         NOTRUN -> [SKIP][37] ([i915#9812])
   [37]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_171991v4/bat-arls-5/igt@kms_pm_backlight@basic-brightness.html
    - fi-tgl-1115g4:      NOTRUN -> [SKIP][38] ([i915#12343] / [i915#9812])
   [38]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_171991v4/fi-tgl-1115g4/igt@kms_pm_backlight@basic-brightness.html

  * igt@kms_psr@psr-primary-page-flip:
    - bat-arls-5:         NOTRUN -> [SKIP][39] ([i915#9732]) +3 other tests skip
   [39]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_171991v4/bat-arls-5/igt@kms_psr@psr-primary-page-flip.html
    - fi-tgl-1115g4:      NOTRUN -> [SKIP][40] ([i915#9732]) +3 other tests skip
   [40]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_171991v4/fi-tgl-1115g4/igt@kms_psr@psr-primary-page-flip.html

  * igt@kms_psr@psr-sprite-plane-onoff:
    - fi-hsw-4770:        NOTRUN -> [SKIP][41] ([i915#1072]) +3 other tests skip
   [41]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_171991v4/fi-hsw-4770/igt@kms_psr@psr-sprite-plane-onoff.html

  * igt@kms_setmode@basic-clone-single-crtc:
    - bat-arls-5:         NOTRUN -> [SKIP][42] ([i915#10208] / [i915#8809])
   [42]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_171991v4/bat-arls-5/igt@kms_setmode@basic-clone-single-crtc.html
    - fi-tgl-1115g4:      NOTRUN -> [SKIP][43] ([i915#3555])
   [43]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_171991v4/fi-tgl-1115g4/igt@kms_setmode@basic-clone-single-crtc.html

  * igt@prime_vgem@basic-fence-read:
    - bat-arls-5:         NOTRUN -> [SKIP][44] ([i915#10212] / [i915#3708])
   [44]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_171991v4/bat-arls-5/igt@prime_vgem@basic-fence-read.html

  * igt@prime_vgem@basic-gtt:
    - bat-arls-5:         NOTRUN -> [SKIP][45] ([i915#12637] / [i915#3708] / [i915#4077]) +1 other test skip
   [45]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_171991v4/bat-arls-5/igt@prime_vgem@basic-gtt.html

  * igt@prime_vgem@basic-read:
    - bat-arls-5:         NOTRUN -> [SKIP][46] ([i915#10214] / [i915#3708])
   [46]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_171991v4/bat-arls-5/igt@prime_vgem@basic-read.html

  * igt@prime_vgem@basic-write:
    - bat-arls-5:         NOTRUN -> [SKIP][47] ([i915#10216] / [i915#3708])
   [47]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_171991v4/bat-arls-5/igt@prime_vgem@basic-write.html

  
#### Possible fixes ####

  * igt@kms_flip@basic-flip-vs-dpms@d-hdmi-a1:
    - fi-tgl-1115g4:      [ABORT][48] ([i915#16837] / [i915#16872] / [i915#16881]) -> [PASS][49] +1 other test pass
   [48]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19057/fi-tgl-1115g4/igt@kms_flip@basic-flip-vs-dpms@d-hdmi-a1.html
   [49]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_171991v4/fi-tgl-1115g4/igt@kms_flip@basic-flip-vs-dpms@d-hdmi-a1.html

  
  [i915#10197]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/10197
  [i915#10200]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/10200
  [i915#10202]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/10202
  [i915#10207]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/10207
  [i915#10208]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/10208
  [i915#10209]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/10209
  [i915#10211]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/10211
  [i915#10212]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/10212
  [i915#10213]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/10213
  [i915#10214]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/10214
  [i915#10216]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/10216
  [i915#1072]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/1072
  [i915#11671]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11671
  [i915#11681]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11681
  [i915#12203]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12203
  [i915#12343]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12343
  [i915#12637]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12637
  [i915#15657]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15657
  [i915#16361]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16361
  [i915#16664]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16664
  [i915#16837]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16837
  [i915#16872]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16872
  [i915#16881]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16881
  [i915#3555]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3555
  [i915#3708]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3708
  [i915#4077]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4077
  [i915#4079]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4079
  [i915#4083]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4083
  [i915#4613]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4613
  [i915#5190]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5190
  [i915#7707]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/7707
  [i915#8809]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8809
  [i915#9732]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9732
  [i915#9812]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9812


Build changes
-------------

  * Linux: CI_DRM_19057 -> Patchwork_171991v4

  CI-20190529: 20190529
  CI_DRM_19057: 5901f93eb5a007e8b7c21ca2b5bfae5958467832 @ git://anongit.freedesktop.org/gfx-ci/linux
  IGT_9078: 9078
  Patchwork_171991v4: 5901f93eb5a007e8b7c21ca2b5bfae5958467832 @ git://anongit.freedesktop.org/gfx-ci/linux

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_171991v4/index.html

--===============5719764188517195551==
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
<tr><td><b>Series:</b></td><td>drm/i915/selftests: Modernize printing in i915 selftests (rev4)</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/171991/">https://patchwork.freedesktop.org/series/171991/</a></td></tr>
<tr><td><b>State:</b></td><td>failure</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_171991v4/index.html">https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_171991v4/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from CI_DRM_19057 -&gt; Patchwork_171991v4</h1>
<h2>Summary</h2>
<p><strong>FAILURE</strong></p>
<p>Serious unknown changes coming with Patchwork_171991v4 absolutely need to be<br />
  verified manually.</p>
<p>If you think the reported changes have nothing to do with the changes<br />
  introduced in Patchwork_171991v4, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them<br />
  to document this new failure mode, which will reduce false positives in CI.</p>
<p>External URL: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_171991v4/index.html</p>
<h2>Participating hosts (39 -&gt; 39)</h2>
<p>Additional (2): fi-hsw-4770 bat-arls-5 <br />
  Missing    (2): bat-dg2-13 fi-snb-2520m </p>
<h2>Possible new issues</h2>
<p>Here are the unknown changes that may have been introduced in Patchwork_171991v4:</p>
<h3>IGT changes</h3>
<h4>Possible regressions</h4>
<ul>
<li>
<p>igt@i915_selftest@live:</p>
<ul>
<li>fi-bsw-n3050:       <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19057/fi-bsw-n3050/igt@i915_selftest@live.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_171991v4/fi-bsw-n3050/igt@i915_selftest@live.html">DMESG-WARN</a> +1 other test dmesg-warn</li>
<li>bat-dg1-7:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19057/bat-dg1-7/igt@i915_selftest@live.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_171991v4/bat-dg1-7/igt@i915_selftest@live.html">DMESG-WARN</a> +1 other test dmesg-warn</li>
</ul>
</li>
<li>
<p>igt@i915_selftest@live@gt_pm:</p>
<ul>
<li>fi-tgl-1115g4:      NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_171991v4/fi-tgl-1115g4/igt@i915_selftest@live@gt_pm.html">DMESG-WARN</a> +1 other test dmesg-warn</li>
</ul>
</li>
<li>
<p>igt@i915_selftest@live@gt_tlb:</p>
<ul>
<li>fi-kbl-7567u:       <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19057/fi-kbl-7567u/igt@i915_selftest@live@gt_tlb.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_171991v4/fi-kbl-7567u/igt@i915_selftest@live@gt_tlb.html">DMESG-WARN</a> +1 other test dmesg-warn</li>
<li>fi-cfl-guc:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19057/fi-cfl-guc/igt@i915_selftest@live@gt_tlb.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_171991v4/fi-cfl-guc/igt@i915_selftest@live@gt_tlb.html">DMESG-WARN</a> +1 other test dmesg-warn</li>
<li>bat-adlp-11:        <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19057/bat-adlp-11/igt@i915_selftest@live@gt_tlb.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_171991v4/bat-adlp-11/igt@i915_selftest@live@gt_tlb.html">DMESG-WARN</a> +1 other test dmesg-warn</li>
<li>bat-dg1-6:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19057/bat-dg1-6/igt@i915_selftest@live@gt_tlb.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_171991v4/bat-dg1-6/igt@i915_selftest@live@gt_tlb.html">DMESG-WARN</a> +1 other test dmesg-warn</li>
<li>bat-adlp-6:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19057/bat-adlp-6/igt@i915_selftest@live@gt_tlb.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_171991v4/bat-adlp-6/igt@i915_selftest@live@gt_tlb.html">DMESG-WARN</a> +1 other test dmesg-warn</li>
<li>fi-cfl-8700k:       <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19057/fi-cfl-8700k/igt@i915_selftest@live@gt_tlb.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_171991v4/fi-cfl-8700k/igt@i915_selftest@live@gt_tlb.html">DMESG-WARN</a> +1 other test dmesg-warn</li>
<li>fi-bsw-nick:        <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19057/fi-bsw-nick/igt@i915_selftest@live@gt_tlb.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_171991v4/fi-bsw-nick/igt@i915_selftest@live@gt_tlb.html">DMESG-WARN</a> +1 other test dmesg-warn</li>
</ul>
</li>
</ul>
<h2>Known issues</h2>
<p>Here are the changes found in Patchwork_171991v4 that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>
<p>igt@gem_lmem_swapping@basic:</p>
<ul>
<li>bat-arls-5:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_171991v4/bat-arls-5/igt@gem_lmem_swapping@basic.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/10213">i915#10213</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11671">i915#11671</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@gem_lmem_swapping@parallel-random-engines:</p>
<ul>
<li>fi-tgl-1115g4:      NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_171991v4/fi-tgl-1115g4/igt@gem_lmem_swapping@parallel-random-engines.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4613">i915#4613</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@gem_mmap@basic:</p>
<ul>
<li>bat-arls-5:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_171991v4/bat-arls-5/igt@gem_mmap@basic.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4083">i915#4083</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_render_tiled_blits@basic:</p>
<ul>
<li>bat-arls-5:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_171991v4/bat-arls-5/igt@gem_render_tiled_blits@basic.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/10197">i915#10197</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/10211">i915#10211</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4079">i915#4079</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_softpin@allocator-basic-reserve:</p>
<ul>
<li>fi-hsw-4770:        NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_171991v4/fi-hsw-4770/igt@gem_softpin@allocator-basic-reserve.html">SKIP</a> +15 other tests skip</li>
</ul>
</li>
<li>
<p>igt@gem_tiled_blits@basic:</p>
<ul>
<li>bat-arls-5:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_171991v4/bat-arls-5/igt@gem_tiled_blits@basic.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12637">i915#12637</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4077">i915#4077</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@gem_tiled_pread_basic@basic:</p>
<ul>
<li>bat-arls-5:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_171991v4/bat-arls-5/igt@gem_tiled_pread_basic@basic.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15657">i915#15657</a>)</li>
</ul>
</li>
<li>
<p>igt@i915_pm_rps@basic-api:</p>
<ul>
<li>bat-arls-5:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_171991v4/bat-arls-5/igt@i915_pm_rps@basic-api.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/10209">i915#10209</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11681">i915#11681</a>)</li>
</ul>
</li>
<li>
<p>igt@intel_hwmon@hwmon-read:</p>
<ul>
<li>bat-arls-5:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_171991v4/bat-arls-5/igt@intel_hwmon@hwmon-read.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/7707">i915#7707</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_addfb_basic@addfb25-y-tiled-small-legacy:</p>
<ul>
<li>fi-hsw-4770:        NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_171991v4/fi-hsw-4770/igt@kms_addfb_basic@addfb25-y-tiled-small-legacy.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5190">i915#5190</a>)</li>
<li>bat-arls-5:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_171991v4/bat-arls-5/igt@kms_addfb_basic@addfb25-y-tiled-small-legacy.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/10200">i915#10200</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12203">i915#12203</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_addfb_basic@clobberred-modifier:</p>
<ul>
<li>bat-arls-5:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_171991v4/bat-arls-5/igt@kms_addfb_basic@clobberred-modifier.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/10200">i915#10200</a>) +8 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@basic-busy-flip-before-cursor-legacy:</p>
<ul>
<li>bat-arls-5:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_171991v4/bat-arls-5/igt@kms_cursor_legacy@basic-busy-flip-before-cursor-legacy.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/10202">i915#10202</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_dsc@dsc-basic:</p>
<ul>
<li>bat-arls-5:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_171991v4/bat-arls-5/igt@kms_dsc@dsc-basic.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16361">i915#16361</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_force_connector_basic@force-load-detect:</p>
<ul>
<li>bat-arls-5:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_171991v4/bat-arls-5/igt@kms_force_connector_basic@force-load-detect.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/10207">i915#10207</a>)</li>
<li>fi-tgl-1115g4:      NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_171991v4/fi-tgl-1115g4/igt@kms_force_connector_basic@force-load-detect.html">SKIP</a></li>
</ul>
</li>
<li>
<p>igt@kms_hdmi_inject@inject-audio:</p>
<ul>
<li>fi-tgl-1115g4:      NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_171991v4/fi-tgl-1115g4/igt@kms_hdmi_inject@inject-audio.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16664">i915#16664</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pm_backlight@basic-brightness:</p>
<ul>
<li>bat-arls-5:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_171991v4/bat-arls-5/igt@kms_pm_backlight@basic-brightness.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9812">i915#9812</a>)</li>
<li>fi-tgl-1115g4:      NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_171991v4/fi-tgl-1115g4/igt@kms_pm_backlight@basic-brightness.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12343">i915#12343</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9812">i915#9812</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr@psr-primary-page-flip:</p>
<ul>
<li>bat-arls-5:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_171991v4/bat-arls-5/igt@kms_psr@psr-primary-page-flip.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9732">i915#9732</a>) +3 other tests skip</li>
<li>fi-tgl-1115g4:      NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_171991v4/fi-tgl-1115g4/igt@kms_psr@psr-primary-page-flip.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9732">i915#9732</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr@psr-sprite-plane-onoff:</p>
<ul>
<li>fi-hsw-4770:        NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_171991v4/fi-hsw-4770/igt@kms_psr@psr-sprite-plane-onoff.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/1072">i915#1072</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_setmode@basic-clone-single-crtc:</p>
<ul>
<li>bat-arls-5:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_171991v4/bat-arls-5/igt@kms_setmode@basic-clone-single-crtc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/10208">i915#10208</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8809">i915#8809</a>)</li>
<li>fi-tgl-1115g4:      NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_171991v4/fi-tgl-1115g4/igt@kms_setmode@basic-clone-single-crtc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3555">i915#3555</a>)</li>
</ul>
</li>
<li>
<p>igt@prime_vgem@basic-fence-read:</p>
<ul>
<li>bat-arls-5:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_171991v4/bat-arls-5/igt@prime_vgem@basic-fence-read.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/10212">i915#10212</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3708">i915#3708</a>)</li>
</ul>
</li>
<li>
<p>igt@prime_vgem@basic-gtt:</p>
<ul>
<li>bat-arls-5:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_171991v4/bat-arls-5/igt@prime_vgem@basic-gtt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12637">i915#12637</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3708">i915#3708</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4077">i915#4077</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@prime_vgem@basic-read:</p>
<ul>
<li>bat-arls-5:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_171991v4/bat-arls-5/igt@prime_vgem@basic-read.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/10214">i915#10214</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3708">i915#3708</a>)</li>
</ul>
</li>
<li>
<p>igt@prime_vgem@basic-write:</p>
<ul>
<li>bat-arls-5:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_171991v4/bat-arls-5/igt@prime_vgem@basic-write.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/10216">i915#10216</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3708">i915#3708</a>)</li>
</ul>
</li>
</ul>
<h4>Possible fixes</h4>
<ul>
<li>igt@kms_flip@basic-flip-vs-dpms@d-hdmi-a1:<ul>
<li>fi-tgl-1115g4:      <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19057/fi-tgl-1115g4/igt@kms_flip@basic-flip-vs-dpms@d-hdmi-a1.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16837">i915#16837</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16872">i915#16872</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16881">i915#16881</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_171991v4/fi-tgl-1115g4/igt@kms_flip@basic-flip-vs-dpms@d-hdmi-a1.html">PASS</a> +1 other test pass</li>
</ul>
</li>
</ul>
<h2>Build changes</h2>
<ul>
<li>Linux: CI_DRM_19057 -&gt; Patchwork_171991v4</li>
</ul>
<p>CI-20190529: 20190529<br />
  CI_DRM_19057: 5901f93eb5a007e8b7c21ca2b5bfae5958467832 @ git://anongit.freedesktop.org/gfx-ci/linux<br />
  IGT_9078: 9078<br />
  Patchwork_171991v4: 5901f93eb5a007e8b7c21ca2b5bfae5958467832 @ git://anongit.freedesktop.org/gfx-ci/linux</p>

</body>
</html>

--===============5719764188517195551==--
