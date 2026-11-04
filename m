Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4BB76606A31B
	for <intel-gfx@archiver.kernel.org>; Wed,  4 Nov 2026 13:13:21 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DE3F310E8AB;
	Wed,  4 Nov 2026 13:13:20 +0000 (UTC)
Received: from 221881a7231d (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 946AC10E1E8;
 Wed,  4 Nov 2026 13:13:20 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============1165625422410001589=="
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=97_i915=2ECI=2EBAT=3A_failure_for_drm/i915/selftests=3A_Mod?=
 =?utf-8?q?ernize_printing_in_i915_selftests_=28rev7=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Krzysztof Karas" <krzysztof.karas@intel.com>
Cc: intel-gfx@lists.freedesktop.org
Date: Wed, 04 Nov 2026 13:13:20 -0000
Message-ID: <179379800059.116935.4242400603887607757@221881a7231d>
X-Patchwork-Hint: ignore
References: <20261104111104.946617-1-krzysztof.karas@intel.com>
In-Reply-To: <20261104111104.946617-1-krzysztof.karas@intel.com>
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
X-Spam-Status: No, score=-6.0 required=3.0 tests=BAYES_00,HTML_MESSAGE,
	MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS
	autolearn=no autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

--===============1165625422410001589==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: drm/i915/selftests: Modernize printing in i915 selftests (rev7)
URL   : https://patchwork.freedesktop.org/series/171991/
State : failure

== Summary ==

CI Bug Log - changes from CI_DRM_19444 -> Patchwork_171991v7
====================================================

Summary
-------

  **FAILURE**

  Serious unknown changes coming with Patchwork_171991v7 absolutely need to be
  verified manually.
  
  If you think the reported changes have nothing to do with the changes
  introduced in Patchwork_171991v7, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them
  to document this new failure mode, which will reduce false positives in CI.

  External URL: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_171991v7/index.html

Participating hosts (38 -> 35)
------------------------------

  Additional (2): fi-skl-6600u bat-adls-6 
  Missing    (5): bat-kbl-2 fi-rkl-11600 bat-adlp-9 bat-rplp-1 bat-dg2-13 

Possible new issues
-------------------

  Here are the unknown changes that may have been introduced in Patchwork_171991v7:

### IGT changes ###

#### Possible regressions ####

  * igt@i915_selftest@live:
    - bat-adlp-11:        [PASS][1] -> [DMESG-WARN][2] +1 other test dmesg-warn
   [1]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19444/bat-adlp-11/igt@i915_selftest@live.html
   [2]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_171991v7/bat-adlp-11/igt@i915_selftest@live.html
    - bat-dg1-6:          [PASS][3] -> [DMESG-WARN][4] +1 other test dmesg-warn
   [3]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19444/bat-dg1-6/igt@i915_selftest@live.html
   [4]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_171991v7/bat-dg1-6/igt@i915_selftest@live.html
    - fi-bsw-n3050:       [PASS][5] -> [DMESG-WARN][6] +1 other test dmesg-warn
   [5]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19444/fi-bsw-n3050/igt@i915_selftest@live.html
   [6]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_171991v7/fi-bsw-n3050/igt@i915_selftest@live.html
    - bat-adlp-6:         [PASS][7] -> [DMESG-WARN][8] +1 other test dmesg-warn
   [7]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19444/bat-adlp-6/igt@i915_selftest@live.html
   [8]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_171991v7/bat-adlp-6/igt@i915_selftest@live.html

  * igt@i915_selftest@live@gt_pm:
    - fi-tgl-1115g4:      [PASS][9] -> [DMESG-WARN][10] +1 other test dmesg-warn
   [9]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19444/fi-tgl-1115g4/igt@i915_selftest@live@gt_pm.html
   [10]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_171991v7/fi-tgl-1115g4/igt@i915_selftest@live@gt_pm.html

  * igt@i915_selftest@live@gt_tlb:
    - fi-kbl-7567u:       [PASS][11] -> [DMESG-WARN][12] +1 other test dmesg-warn
   [11]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19444/fi-kbl-7567u/igt@i915_selftest@live@gt_tlb.html
   [12]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_171991v7/fi-kbl-7567u/igt@i915_selftest@live@gt_tlb.html
    - fi-cfl-8700k:       [PASS][13] -> [DMESG-WARN][14] +1 other test dmesg-warn
   [13]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19444/fi-cfl-8700k/igt@i915_selftest@live@gt_tlb.html
   [14]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_171991v7/fi-cfl-8700k/igt@i915_selftest@live@gt_tlb.html
    - fi-bsw-nick:        [PASS][15] -> [DMESG-WARN][16] +1 other test dmesg-warn
   [15]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19444/fi-bsw-nick/igt@i915_selftest@live@gt_tlb.html
   [16]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_171991v7/fi-bsw-nick/igt@i915_selftest@live@gt_tlb.html
    - fi-cfl-guc:         [PASS][17] -> [DMESG-WARN][18] +1 other test dmesg-warn
   [17]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19444/fi-cfl-guc/igt@i915_selftest@live@gt_tlb.html
   [18]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_171991v7/fi-cfl-guc/igt@i915_selftest@live@gt_tlb.html

  
Known issues
------------

  Here are the changes found in Patchwork_171991v7 that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@gem_huc_copy@huc-copy:
    - fi-skl-6600u:       NOTRUN -> [SKIP][19] ([i915#2190])
   [19]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_171991v7/fi-skl-6600u/igt@gem_huc_copy@huc-copy.html

  * igt@gem_lmem_swapping@random-engines:
    - fi-skl-6600u:       NOTRUN -> [SKIP][20] ([i915#4613]) +3 other tests skip
   [20]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_171991v7/fi-skl-6600u/igt@gem_lmem_swapping@random-engines.html

  * igt@gem_lmem_swapping@verify-random:
    - bat-adls-6:         NOTRUN -> [SKIP][21] ([i915#4613]) +3 other tests skip
   [21]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_171991v7/bat-adls-6/igt@gem_lmem_swapping@verify-random.html

  * igt@gem_tiled_pread_basic@basic:
    - bat-adls-6:         NOTRUN -> [SKIP][22] ([i915#15656])
   [22]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_171991v7/bat-adls-6/igt@gem_tiled_pread_basic@basic.html

  * igt@intel_hwmon@hwmon-read:
    - bat-adls-6:         NOTRUN -> [SKIP][23] ([i915#7707]) +1 other test skip
   [23]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_171991v7/bat-adls-6/igt@intel_hwmon@hwmon-read.html
    - fi-skl-6600u:       NOTRUN -> [SKIP][24] ([i915#11680]) +1 other test skip
   [24]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_171991v7/fi-skl-6600u/igt@intel_hwmon@hwmon-read.html

  * igt@kms_cursor_legacy@basic-busy-flip-before-cursor-legacy:
    - bat-adls-6:         NOTRUN -> [SKIP][25] ([i915#4103]) +1 other test skip
   [25]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_171991v7/bat-adls-6/igt@kms_cursor_legacy@basic-busy-flip-before-cursor-legacy.html
    - fi-skl-6600u:       NOTRUN -> [SKIP][26] ([i915#17457]) +1 other test skip
   [26]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_171991v7/fi-skl-6600u/igt@kms_cursor_legacy@basic-busy-flip-before-cursor-legacy.html

  * igt@kms_dsc@dsc-basic:
    - bat-adls-6:         NOTRUN -> [SKIP][27] ([i915#16361])
   [27]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_171991v7/bat-adls-6/igt@kms_dsc@dsc-basic.html
    - fi-skl-6600u:       NOTRUN -> [SKIP][28] ([i915#17458])
   [28]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_171991v7/fi-skl-6600u/igt@kms_dsc@dsc-basic.html

  * igt@kms_force_connector_basic@force-load-detect:
    - bat-adls-6:         NOTRUN -> [SKIP][29] ([i915#17452])
   [29]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_171991v7/bat-adls-6/igt@kms_force_connector_basic@force-load-detect.html
    - fi-skl-6600u:       NOTRUN -> [SKIP][30] ([i915#17465])
   [30]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_171991v7/fi-skl-6600u/igt@kms_force_connector_basic@force-load-detect.html

  * igt@kms_pipe_crc_basic@compare-crc-sanitycheck-nv12@pipe-c-edp-1:
    - fi-skl-6600u:       NOTRUN -> [SKIP][31] ([i915#17461]) +3 other tests skip
   [31]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_171991v7/fi-skl-6600u/igt@kms_pipe_crc_basic@compare-crc-sanitycheck-nv12@pipe-c-edp-1.html

  * igt@kms_pm_backlight@basic-brightness:
    - bat-adls-6:         NOTRUN -> [SKIP][32] ([i915#5354])
   [32]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_171991v7/bat-adls-6/igt@kms_pm_backlight@basic-brightness.html

  * igt@kms_psr@psr-primary-mmap-gtt:
    - bat-adls-6:         NOTRUN -> [SKIP][33] ([i915#1072] / [i915#9732]) +3 other tests skip
   [33]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_171991v7/bat-adls-6/igt@kms_psr@psr-primary-mmap-gtt.html

  * igt@kms_setmode@basic-clone-single-crtc:
    - bat-adls-6:         NOTRUN -> [SKIP][34] ([i915#3555])
   [34]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_171991v7/bat-adls-6/igt@kms_setmode@basic-clone-single-crtc.html
    - fi-skl-6600u:       NOTRUN -> [SKIP][35] ([i915#17463])
   [35]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_171991v7/fi-skl-6600u/igt@kms_setmode@basic-clone-single-crtc.html

  * igt@prime_vgem@basic-fence-read:
    - bat-adls-6:         NOTRUN -> [SKIP][36] ([i915#17448] / [i915#3291]) +2 other tests skip
   [36]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_171991v7/bat-adls-6/igt@prime_vgem@basic-fence-read.html

  
  [i915#1072]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/1072
  [i915#11680]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11680
  [i915#15656]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15656
  [i915#16361]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16361
  [i915#17448]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17448
  [i915#17452]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17452
  [i915#17457]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17457
  [i915#17458]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17458
  [i915#17461]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17461
  [i915#17463]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17463
  [i915#17465]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17465
  [i915#2190]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2190
  [i915#3291]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3291
  [i915#3555]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3555
  [i915#4103]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4103
  [i915#4613]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4613
  [i915#5354]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5354
  [i915#7707]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/7707
  [i915#9732]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9732


Build changes
-------------

  * Linux: CI_DRM_19444 -> Patchwork_171991v7

  CI-20190529: 20190529
  CI_DRM_19444: c0cb7e7c00c9563d72c1e1b08fac139a57fd0ebf @ git://anongit.freedesktop.org/gfx-ci/linux
  IGT_9177: 9177
  Patchwork_171991v7: c0cb7e7c00c9563d72c1e1b08fac139a57fd0ebf @ git://anongit.freedesktop.org/gfx-ci/linux

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_171991v7/index.html

--===============1165625422410001589==
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
<tr><td><b>Series:</b></td><td>drm/i915/selftests: Modernize printing in i915 selftests (rev7)</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/171991/">https://patchwork.freedesktop.org/series/171991/</a></td></tr>
<tr><td><b>State:</b></td><td>failure</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_171991v7/index.html">https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_171991v7/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from CI_DRM_19444 -&gt; Patchwork_171991v7</h1>
<h2>Summary</h2>
<p><strong>FAILURE</strong></p>
<p>Serious unknown changes coming with Patchwork_171991v7 absolutely need to be<br />
  verified manually.</p>
<p>If you think the reported changes have nothing to do with the changes<br />
  introduced in Patchwork_171991v7, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them<br />
  to document this new failure mode, which will reduce false positives in CI.</p>
<p>External URL: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_171991v7/index.html</p>
<h2>Participating hosts (38 -&gt; 35)</h2>
<p>Additional (2): fi-skl-6600u bat-adls-6 <br />
  Missing    (5): bat-kbl-2 fi-rkl-11600 bat-adlp-9 bat-rplp-1 bat-dg2-13 </p>
<h2>Possible new issues</h2>
<p>Here are the unknown changes that may have been introduced in Patchwork_171991v7:</p>
<h3>IGT changes</h3>
<h4>Possible regressions</h4>
<ul>
<li>
<p>igt@i915_selftest@live:</p>
<ul>
<li>bat-adlp-11:        <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19444/bat-adlp-11/igt@i915_selftest@live.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_171991v7/bat-adlp-11/igt@i915_selftest@live.html">DMESG-WARN</a> +1 other test dmesg-warn</li>
<li>bat-dg1-6:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19444/bat-dg1-6/igt@i915_selftest@live.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_171991v7/bat-dg1-6/igt@i915_selftest@live.html">DMESG-WARN</a> +1 other test dmesg-warn</li>
<li>fi-bsw-n3050:       <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19444/fi-bsw-n3050/igt@i915_selftest@live.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_171991v7/fi-bsw-n3050/igt@i915_selftest@live.html">DMESG-WARN</a> +1 other test dmesg-warn</li>
<li>bat-adlp-6:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19444/bat-adlp-6/igt@i915_selftest@live.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_171991v7/bat-adlp-6/igt@i915_selftest@live.html">DMESG-WARN</a> +1 other test dmesg-warn</li>
</ul>
</li>
<li>
<p>igt@i915_selftest@live@gt_pm:</p>
<ul>
<li>fi-tgl-1115g4:      <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19444/fi-tgl-1115g4/igt@i915_selftest@live@gt_pm.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_171991v7/fi-tgl-1115g4/igt@i915_selftest@live@gt_pm.html">DMESG-WARN</a> +1 other test dmesg-warn</li>
</ul>
</li>
<li>
<p>igt@i915_selftest@live@gt_tlb:</p>
<ul>
<li>fi-kbl-7567u:       <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19444/fi-kbl-7567u/igt@i915_selftest@live@gt_tlb.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_171991v7/fi-kbl-7567u/igt@i915_selftest@live@gt_tlb.html">DMESG-WARN</a> +1 other test dmesg-warn</li>
<li>fi-cfl-8700k:       <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19444/fi-cfl-8700k/igt@i915_selftest@live@gt_tlb.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_171991v7/fi-cfl-8700k/igt@i915_selftest@live@gt_tlb.html">DMESG-WARN</a> +1 other test dmesg-warn</li>
<li>fi-bsw-nick:        <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19444/fi-bsw-nick/igt@i915_selftest@live@gt_tlb.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_171991v7/fi-bsw-nick/igt@i915_selftest@live@gt_tlb.html">DMESG-WARN</a> +1 other test dmesg-warn</li>
<li>fi-cfl-guc:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19444/fi-cfl-guc/igt@i915_selftest@live@gt_tlb.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_171991v7/fi-cfl-guc/igt@i915_selftest@live@gt_tlb.html">DMESG-WARN</a> +1 other test dmesg-warn</li>
</ul>
</li>
</ul>
<h2>Known issues</h2>
<p>Here are the changes found in Patchwork_171991v7 that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>
<p>igt@gem_huc_copy@huc-copy:</p>
<ul>
<li>fi-skl-6600u:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_171991v7/fi-skl-6600u/igt@gem_huc_copy@huc-copy.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2190">i915#2190</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_lmem_swapping@random-engines:</p>
<ul>
<li>fi-skl-6600u:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_171991v7/fi-skl-6600u/igt@gem_lmem_swapping@random-engines.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4613">i915#4613</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@gem_lmem_swapping@verify-random:</p>
<ul>
<li>bat-adls-6:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_171991v7/bat-adls-6/igt@gem_lmem_swapping@verify-random.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4613">i915#4613</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@gem_tiled_pread_basic@basic:</p>
<ul>
<li>bat-adls-6:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_171991v7/bat-adls-6/igt@gem_tiled_pread_basic@basic.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15656">i915#15656</a>)</li>
</ul>
</li>
<li>
<p>igt@intel_hwmon@hwmon-read:</p>
<ul>
<li>bat-adls-6:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_171991v7/bat-adls-6/igt@intel_hwmon@hwmon-read.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/7707">i915#7707</a>) +1 other test skip</li>
<li>fi-skl-6600u:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_171991v7/fi-skl-6600u/igt@intel_hwmon@hwmon-read.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11680">i915#11680</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@basic-busy-flip-before-cursor-legacy:</p>
<ul>
<li>bat-adls-6:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_171991v7/bat-adls-6/igt@kms_cursor_legacy@basic-busy-flip-before-cursor-legacy.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4103">i915#4103</a>) +1 other test skip</li>
<li>fi-skl-6600u:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_171991v7/fi-skl-6600u/igt@kms_cursor_legacy@basic-busy-flip-before-cursor-legacy.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17457">i915#17457</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_dsc@dsc-basic:</p>
<ul>
<li>bat-adls-6:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_171991v7/bat-adls-6/igt@kms_dsc@dsc-basic.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16361">i915#16361</a>)</li>
<li>fi-skl-6600u:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_171991v7/fi-skl-6600u/igt@kms_dsc@dsc-basic.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17458">i915#17458</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_force_connector_basic@force-load-detect:</p>
<ul>
<li>bat-adls-6:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_171991v7/bat-adls-6/igt@kms_force_connector_basic@force-load-detect.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17452">i915#17452</a>)</li>
<li>fi-skl-6600u:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_171991v7/fi-skl-6600u/igt@kms_force_connector_basic@force-load-detect.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17465">i915#17465</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pipe_crc_basic@compare-crc-sanitycheck-nv12@pipe-c-edp-1:</p>
<ul>
<li>fi-skl-6600u:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_171991v7/fi-skl-6600u/igt@kms_pipe_crc_basic@compare-crc-sanitycheck-nv12@pipe-c-edp-1.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17461">i915#17461</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_pm_backlight@basic-brightness:</p>
<ul>
<li>bat-adls-6:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_171991v7/bat-adls-6/igt@kms_pm_backlight@basic-brightness.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5354">i915#5354</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr@psr-primary-mmap-gtt:</p>
<ul>
<li>bat-adls-6:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_171991v7/bat-adls-6/igt@kms_psr@psr-primary-mmap-gtt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/1072">i915#1072</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9732">i915#9732</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_setmode@basic-clone-single-crtc:</p>
<ul>
<li>bat-adls-6:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_171991v7/bat-adls-6/igt@kms_setmode@basic-clone-single-crtc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3555">i915#3555</a>)</li>
<li>fi-skl-6600u:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_171991v7/fi-skl-6600u/igt@kms_setmode@basic-clone-single-crtc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17463">i915#17463</a>)</li>
</ul>
</li>
<li>
<p>igt@prime_vgem@basic-fence-read:</p>
<ul>
<li>bat-adls-6:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_171991v7/bat-adls-6/igt@prime_vgem@basic-fence-read.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17448">i915#17448</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3291">i915#3291</a>) +2 other tests skip</li>
</ul>
</li>
</ul>
<h2>Build changes</h2>
<ul>
<li>Linux: CI_DRM_19444 -&gt; Patchwork_171991v7</li>
</ul>
<p>CI-20190529: 20190529<br />
  CI_DRM_19444: c0cb7e7c00c9563d72c1e1b08fac139a57fd0ebf @ git://anongit.freedesktop.org/gfx-ci/linux<br />
  IGT_9177: 9177<br />
  Patchwork_171991v7: c0cb7e7c00c9563d72c1e1b08fac139a57fd0ebf @ git://anongit.freedesktop.org/gfx-ci/linux</p>

</body>
</html>

--===============1165625422410001589==--
