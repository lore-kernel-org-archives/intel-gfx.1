Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 266B8606A31C
	for <intel-gfx@archiver.kernel.org>; Thu, 12 Nov 2026 10:29:09 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A8AE710FFE3;
	Thu, 12 Nov 2026 10:29:08 +0000 (UTC)
Received: from 9ac1b63fe3ea (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5866110FFDD;
 Thu, 12 Nov 2026 10:29:07 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============6043219188515468944=="
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=97_i915=2ECI=2EBAT=3A_failure_for_Add_struct=5Foffsetofend?=
 =?utf-8?q?=28=29_for_pointer_arithmetic?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Bence Csokas" <bence.csokas@arm.com>
Cc: intel-gfx@lists.freedesktop.org
Date: Thu, 12 Nov 2026 10:29:07 -0000
Message-ID: <179447934735.14844.6598601699005572355@9ac1b63fe3ea>
X-Patchwork-Hint: ignore
References: <20261112-offsetof-v2-0-276ede839967@arm.com>
In-Reply-To: <20261112-offsetof-v2-0-276ede839967@arm.com>
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
	autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

--===============6043219188515468944==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: Add struct_offsetofend() for pointer arithmetic
URL   : https://patchwork.freedesktop.org/series/178382/
State : failure

== Summary ==

CI Bug Log - changes from CI_DRM_19501 -> Patchwork_178382v1
====================================================

Summary
-------

  **FAILURE**

  Serious unknown changes coming with Patchwork_178382v1 absolutely need to be
  verified manually.
  
  If you think the reported changes have nothing to do with the changes
  introduced in Patchwork_178382v1, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them
  to document this new failure mode, which will reduce false positives in CI.

  External URL: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_178382v1/index.html

Participating hosts (39 -> 38)
------------------------------

  Additional (1): bat-adls-6 
  Missing    (2): bat-dg2-13 fi-glk-j4005 

Possible new issues
-------------------

  Here are the unknown changes that may have been introduced in Patchwork_178382v1:

### IGT changes ###

#### Possible regressions ####

  * igt@kms_cursor_legacy@basic-flip-after-cursor-varying-size:
    - fi-bsw-n3050:       [PASS][1] -> [FAIL][2]
   [1]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19501/fi-bsw-n3050/igt@kms_cursor_legacy@basic-flip-after-cursor-varying-size.html
   [2]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_178382v1/fi-bsw-n3050/igt@kms_cursor_legacy@basic-flip-after-cursor-varying-size.html

  
Known issues
------------

  Here are the changes found in Patchwork_178382v1 that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@gem_lmem_swapping@parallel-random-engines:
    - bat-adls-6:         NOTRUN -> [SKIP][3] ([i915#4613]) +3 other tests skip
   [3]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_178382v1/bat-adls-6/igt@gem_lmem_swapping@parallel-random-engines.html

  * igt@gem_tiled_pread_basic@basic:
    - bat-adls-6:         NOTRUN -> [SKIP][4] ([i915#15656])
   [4]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_178382v1/bat-adls-6/igt@gem_tiled_pread_basic@basic.html

  * igt@i915_pm_rpm@module-reload:
    - fi-tgl-1115g4:      [PASS][5] -> [FAIL][6] ([i915#17751])
   [5]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19501/fi-tgl-1115g4/igt@i915_pm_rpm@module-reload.html
   [6]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_178382v1/fi-tgl-1115g4/igt@i915_pm_rpm@module-reload.html

  * igt@intel_hwmon@hwmon-read:
    - bat-adls-6:         NOTRUN -> [SKIP][7] ([i915#7707]) +1 other test skip
   [7]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_178382v1/bat-adls-6/igt@intel_hwmon@hwmon-read.html

  * igt@kms_cursor_legacy@basic-busy-flip-before-cursor-legacy:
    - bat-adls-6:         NOTRUN -> [SKIP][8] ([i915#4103]) +1 other test skip
   [8]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_178382v1/bat-adls-6/igt@kms_cursor_legacy@basic-busy-flip-before-cursor-legacy.html

  * igt@kms_dsc@dsc-basic:
    - bat-adls-6:         NOTRUN -> [SKIP][9] ([i915#16361])
   [9]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_178382v1/bat-adls-6/igt@kms_dsc@dsc-basic.html

  * igt@kms_force_connector_basic@force-load-detect:
    - bat-adls-6:         NOTRUN -> [SKIP][10] ([i915#17452])
   [10]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_178382v1/bat-adls-6/igt@kms_force_connector_basic@force-load-detect.html

  * igt@kms_pm_backlight@basic-brightness:
    - bat-adls-6:         NOTRUN -> [SKIP][11] ([i915#5354])
   [11]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_178382v1/bat-adls-6/igt@kms_pm_backlight@basic-brightness.html

  * igt@kms_psr@psr-primary-mmap-gtt:
    - bat-adls-6:         NOTRUN -> [SKIP][12] ([i915#1072] / [i915#9732]) +3 other tests skip
   [12]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_178382v1/bat-adls-6/igt@kms_psr@psr-primary-mmap-gtt.html

  * igt@kms_setmode@basic-clone-single-crtc:
    - bat-adls-6:         NOTRUN -> [SKIP][13] ([i915#3555])
   [13]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_178382v1/bat-adls-6/igt@kms_setmode@basic-clone-single-crtc.html

  * igt@prime_vgem@basic-fence-read:
    - bat-adls-6:         NOTRUN -> [SKIP][14] ([i915#17448] / [i915#3291]) +2 other tests skip
   [14]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_178382v1/bat-adls-6/igt@prime_vgem@basic-fence-read.html

  * igt@vgem_basic@unload:
    - bat-rpls-4:         [PASS][15] -> [DMESG-WARN][16] ([i915#13400])
   [15]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19501/bat-rpls-4/igt@vgem_basic@unload.html
   [16]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_178382v1/bat-rpls-4/igt@vgem_basic@unload.html

  
  [i915#1072]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/1072
  [i915#13400]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13400
  [i915#15656]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15656
  [i915#16361]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16361
  [i915#17448]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17448
  [i915#17452]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17452
  [i915#17751]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17751
  [i915#3291]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3291
  [i915#3555]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3555
  [i915#4103]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4103
  [i915#4613]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4613
  [i915#5354]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5354
  [i915#7707]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/7707
  [i915#9732]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9732


Build changes
-------------

  * Linux: CI_DRM_19501 -> Patchwork_178382v1

  CI-20190529: 20190529
  CI_DRM_19501: 020bf044c3c299e9b0961753bf5f8b92c3b505ce @ git://anongit.freedesktop.org/gfx-ci/linux
  IGT_9187: 9187
  Patchwork_178382v1: 020bf044c3c299e9b0961753bf5f8b92c3b505ce @ git://anongit.freedesktop.org/gfx-ci/linux

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_178382v1/index.html

--===============6043219188515468944==
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
<tr><td><b>Series:</b></td><td>Add struct_offsetofend() for pointer arithmetic</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/178382/">https://patchwork.freedesktop.org/series/178382/</a></td></tr>
<tr><td><b>State:</b></td><td>failure</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_178382v1/index.html">https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_178382v1/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from CI_DRM_19501 -&gt; Patchwork_178382v1</h1>
<h2>Summary</h2>
<p><strong>FAILURE</strong></p>
<p>Serious unknown changes coming with Patchwork_178382v1 absolutely need to be<br />
  verified manually.</p>
<p>If you think the reported changes have nothing to do with the changes<br />
  introduced in Patchwork_178382v1, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them<br />
  to document this new failure mode, which will reduce false positives in CI.</p>
<p>External URL: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_178382v1/index.html</p>
<h2>Participating hosts (39 -&gt; 38)</h2>
<p>Additional (1): bat-adls-6 <br />
  Missing    (2): bat-dg2-13 fi-glk-j4005 </p>
<h2>Possible new issues</h2>
<p>Here are the unknown changes that may have been introduced in Patchwork_178382v1:</p>
<h3>IGT changes</h3>
<h4>Possible regressions</h4>
<ul>
<li>igt@kms_cursor_legacy@basic-flip-after-cursor-varying-size:<ul>
<li>fi-bsw-n3050:       <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19501/fi-bsw-n3050/igt@kms_cursor_legacy@basic-flip-after-cursor-varying-size.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_178382v1/fi-bsw-n3050/igt@kms_cursor_legacy@basic-flip-after-cursor-varying-size.html">FAIL</a></li>
</ul>
</li>
</ul>
<h2>Known issues</h2>
<p>Here are the changes found in Patchwork_178382v1 that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>
<p>igt@gem_lmem_swapping@parallel-random-engines:</p>
<ul>
<li>bat-adls-6:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_178382v1/bat-adls-6/igt@gem_lmem_swapping@parallel-random-engines.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4613">i915#4613</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@gem_tiled_pread_basic@basic:</p>
<ul>
<li>bat-adls-6:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_178382v1/bat-adls-6/igt@gem_tiled_pread_basic@basic.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15656">i915#15656</a>)</li>
</ul>
</li>
<li>
<p>igt@i915_pm_rpm@module-reload:</p>
<ul>
<li>fi-tgl-1115g4:      <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19501/fi-tgl-1115g4/igt@i915_pm_rpm@module-reload.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_178382v1/fi-tgl-1115g4/igt@i915_pm_rpm@module-reload.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17751">i915#17751</a>)</li>
</ul>
</li>
<li>
<p>igt@intel_hwmon@hwmon-read:</p>
<ul>
<li>bat-adls-6:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_178382v1/bat-adls-6/igt@intel_hwmon@hwmon-read.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/7707">i915#7707</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@basic-busy-flip-before-cursor-legacy:</p>
<ul>
<li>bat-adls-6:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_178382v1/bat-adls-6/igt@kms_cursor_legacy@basic-busy-flip-before-cursor-legacy.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4103">i915#4103</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_dsc@dsc-basic:</p>
<ul>
<li>bat-adls-6:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_178382v1/bat-adls-6/igt@kms_dsc@dsc-basic.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16361">i915#16361</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_force_connector_basic@force-load-detect:</p>
<ul>
<li>bat-adls-6:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_178382v1/bat-adls-6/igt@kms_force_connector_basic@force-load-detect.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17452">i915#17452</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pm_backlight@basic-brightness:</p>
<ul>
<li>bat-adls-6:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_178382v1/bat-adls-6/igt@kms_pm_backlight@basic-brightness.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5354">i915#5354</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr@psr-primary-mmap-gtt:</p>
<ul>
<li>bat-adls-6:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_178382v1/bat-adls-6/igt@kms_psr@psr-primary-mmap-gtt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/1072">i915#1072</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9732">i915#9732</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_setmode@basic-clone-single-crtc:</p>
<ul>
<li>bat-adls-6:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_178382v1/bat-adls-6/igt@kms_setmode@basic-clone-single-crtc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3555">i915#3555</a>)</li>
</ul>
</li>
<li>
<p>igt@prime_vgem@basic-fence-read:</p>
<ul>
<li>bat-adls-6:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_178382v1/bat-adls-6/igt@prime_vgem@basic-fence-read.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17448">i915#17448</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3291">i915#3291</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@vgem_basic@unload:</p>
<ul>
<li>bat-rpls-4:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19501/bat-rpls-4/igt@vgem_basic@unload.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_178382v1/bat-rpls-4/igt@vgem_basic@unload.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13400">i915#13400</a>)</li>
</ul>
</li>
</ul>
<h2>Build changes</h2>
<ul>
<li>Linux: CI_DRM_19501 -&gt; Patchwork_178382v1</li>
</ul>
<p>CI-20190529: 20190529<br />
  CI_DRM_19501: 020bf044c3c299e9b0961753bf5f8b92c3b505ce @ git://anongit.freedesktop.org/gfx-ci/linux<br />
  IGT_9187: 9187<br />
  Patchwork_178382v1: 020bf044c3c299e9b0961753bf5f8b92c3b505ce @ git://anongit.freedesktop.org/gfx-ci/linux</p>

</body>
</html>

--===============6043219188515468944==--
