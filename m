Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 64730606A331
	for <intel-gfx@archiver.kernel.org>; Tue, 24 Nov 2026 18:33:22 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C69AD10E2F2;
	Tue, 24 Nov 2026 18:33:21 +0000 (UTC)
Received: from 9ac1b63fe3ea (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3F7C810E2B8;
 Tue, 24 Nov 2026 18:33:20 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============7722761773644241494=="
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=93_i915=2ECI=2EBAT=3A_success_for_drm/i915=3A_use_local_=5F?=
 =?utf-8?q?=5FVLV=5FDISPLAY=5FBASE_for_i915_registers?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Jani Nikula" <jani.nikula@intel.com>
Cc: intel-gfx@lists.freedesktop.org
Date: Tue, 24 Nov 2026 18:33:20 -0000
Message-ID: <179554520025.80140.5531715629813100885@9ac1b63fe3ea>
X-Patchwork-Hint: ignore
References: <20261124133156.1504267-1-jani.nikula@intel.com>
In-Reply-To: <20261124133156.1504267-1-jani.nikula@intel.com>
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

--===============7722761773644241494==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: drm/i915: use local __VLV_DISPLAY_BASE for i915 registers
URL   : https://patchwork.freedesktop.org/series/179489/
State : success

== Summary ==

CI Bug Log - changes from CI_DRM_19600 -> Patchwork_179489v1
====================================================

Summary
-------

  **SUCCESS**

  No regressions found.

  External URL: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_179489v1/index.html

Participating hosts (39 -> 39)
------------------------------

  Additional (1): bat-adls-6 
  Missing    (1): bat-dg2-13 

Known issues
------------

  Here are the changes found in Patchwork_179489v1 that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@core_auth@basic-auth:
    - bat-adlp-6:         [PASS][1] -> [DMESG-WARN][2] ([i915#15673])
   [1]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19600/bat-adlp-6/igt@core_auth@basic-auth.html
   [2]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_179489v1/bat-adlp-6/igt@core_auth@basic-auth.html

  * igt@fbdev@info:
    - fi-hsw-4770:        [PASS][3] -> [SKIP][4] ([i915#1849] / [i915#2582])
   [3]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19600/fi-hsw-4770/igt@fbdev@info.html
   [4]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_179489v1/fi-hsw-4770/igt@fbdev@info.html

  * igt@fbdev@nullptr:
    - fi-hsw-4770:        [PASS][5] -> [SKIP][6] ([i915#2582]) +3 other tests skip
   [5]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19600/fi-hsw-4770/igt@fbdev@nullptr.html
   [6]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_179489v1/fi-hsw-4770/igt@fbdev@nullptr.html

  * igt@gem_lmem_swapping@parallel-random-engines:
    - bat-adls-6:         NOTRUN -> [SKIP][7] ([i915#4613]) +3 other tests skip
   [7]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_179489v1/bat-adls-6/igt@gem_lmem_swapping@parallel-random-engines.html

  * igt@gem_tiled_pread_basic@basic:
    - bat-adls-6:         NOTRUN -> [SKIP][8] ([i915#15656])
   [8]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_179489v1/bat-adls-6/igt@gem_tiled_pread_basic@basic.html

  * igt@intel_hwmon@hwmon-read:
    - bat-adls-6:         NOTRUN -> [SKIP][9] ([i915#7707]) +1 other test skip
   [9]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_179489v1/bat-adls-6/igt@intel_hwmon@hwmon-read.html

  * igt@kms_cursor_legacy@basic-busy-flip-before-cursor-legacy:
    - bat-adls-6:         NOTRUN -> [SKIP][10] ([i915#4103]) +1 other test skip
   [10]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_179489v1/bat-adls-6/igt@kms_cursor_legacy@basic-busy-flip-before-cursor-legacy.html

  * igt@kms_dsc@dsc-basic:
    - bat-adls-6:         NOTRUN -> [SKIP][11] ([i915#16361])
   [11]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_179489v1/bat-adls-6/igt@kms_dsc@dsc-basic.html

  * igt@kms_force_connector_basic@force-load-detect:
    - bat-adls-6:         NOTRUN -> [SKIP][12] ([i915#17452])
   [12]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_179489v1/bat-adls-6/igt@kms_force_connector_basic@force-load-detect.html

  * igt@kms_pm_backlight@basic-brightness:
    - bat-adls-6:         NOTRUN -> [SKIP][13] ([i915#5354])
   [13]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_179489v1/bat-adls-6/igt@kms_pm_backlight@basic-brightness.html

  * igt@kms_psr@psr-primary-mmap-gtt:
    - bat-adls-6:         NOTRUN -> [SKIP][14] ([i915#1072] / [i915#9732]) +3 other tests skip
   [14]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_179489v1/bat-adls-6/igt@kms_psr@psr-primary-mmap-gtt.html

  * igt@kms_setmode@basic-clone-single-crtc:
    - bat-adls-6:         NOTRUN -> [SKIP][15] ([i915#3555])
   [15]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_179489v1/bat-adls-6/igt@kms_setmode@basic-clone-single-crtc.html

  * igt@prime_vgem@basic-fence-read:
    - bat-adls-6:         NOTRUN -> [SKIP][16] ([i915#17448] / [i915#3291]) +2 other tests skip
   [16]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_179489v1/bat-adls-6/igt@prime_vgem@basic-fence-read.html

  
#### Possible fixes ####

  * igt@core_debugfs@read-all-entries:
    - bat-adlp-6:         [DMESG-WARN][17] ([i915#15673]) -> [PASS][18]
   [17]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19600/bat-adlp-6/igt@core_debugfs@read-all-entries.html
   [18]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_179489v1/bat-adlp-6/igt@core_debugfs@read-all-entries.html

  * igt@kms_pm_rpm@basic-pci-d3-state:
    - bat-rpls-4:         [DMESG-WARN][19] ([i915#13400]) -> [PASS][20]
   [19]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19600/bat-rpls-4/igt@kms_pm_rpm@basic-pci-d3-state.html
   [20]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_179489v1/bat-rpls-4/igt@kms_pm_rpm@basic-pci-d3-state.html

  
  [i915#1072]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/1072
  [i915#13400]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13400
  [i915#15656]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15656
  [i915#15673]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15673
  [i915#16361]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16361
  [i915#17448]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17448
  [i915#17452]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17452
  [i915#1849]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/1849
  [i915#2582]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2582
  [i915#3291]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3291
  [i915#3555]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3555
  [i915#4103]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4103
  [i915#4613]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4613
  [i915#5354]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5354
  [i915#7707]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/7707
  [i915#9732]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9732


Build changes
-------------

  * Linux: CI_DRM_19600 -> Patchwork_179489v1

  CI-20190529: 20190529
  CI_DRM_19600: 0136c4319eff88f24494b8d1655e247a935dda57 @ git://anongit.freedesktop.org/gfx-ci/linux
  IGT_9202: 9202
  Patchwork_179489v1: 0136c4319eff88f24494b8d1655e247a935dda57 @ git://anongit.freedesktop.org/gfx-ci/linux

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_179489v1/index.html

--===============7722761773644241494==
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
<tr><td><b>Series:</b></td><td>drm/i915: use local __VLV_DISPLAY_BASE for i915 registers</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/179489/">https://patchwork.freedesktop.org/series/179489/</a></td></tr>
<tr><td><b>State:</b></td><td>success</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_179489v1/index.html">https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_179489v1/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from CI_DRM_19600 -&gt; Patchwork_179489v1</h1>
<h2>Summary</h2>
<p><strong>SUCCESS</strong></p>
<p>No regressions found.</p>
<p>External URL: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_179489v1/index.html</p>
<h2>Participating hosts (39 -&gt; 39)</h2>
<p>Additional (1): bat-adls-6 <br />
  Missing    (1): bat-dg2-13 </p>
<h2>Known issues</h2>
<p>Here are the changes found in Patchwork_179489v1 that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>
<p>igt@core_auth@basic-auth:</p>
<ul>
<li>bat-adlp-6:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19600/bat-adlp-6/igt@core_auth@basic-auth.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_179489v1/bat-adlp-6/igt@core_auth@basic-auth.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15673">i915#15673</a>)</li>
</ul>
</li>
<li>
<p>igt@fbdev@info:</p>
<ul>
<li>fi-hsw-4770:        <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19600/fi-hsw-4770/igt@fbdev@info.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_179489v1/fi-hsw-4770/igt@fbdev@info.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/1849">i915#1849</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2582">i915#2582</a>)</li>
</ul>
</li>
<li>
<p>igt@fbdev@nullptr:</p>
<ul>
<li>fi-hsw-4770:        <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19600/fi-hsw-4770/igt@fbdev@nullptr.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_179489v1/fi-hsw-4770/igt@fbdev@nullptr.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2582">i915#2582</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@gem_lmem_swapping@parallel-random-engines:</p>
<ul>
<li>bat-adls-6:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_179489v1/bat-adls-6/igt@gem_lmem_swapping@parallel-random-engines.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4613">i915#4613</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@gem_tiled_pread_basic@basic:</p>
<ul>
<li>bat-adls-6:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_179489v1/bat-adls-6/igt@gem_tiled_pread_basic@basic.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15656">i915#15656</a>)</li>
</ul>
</li>
<li>
<p>igt@intel_hwmon@hwmon-read:</p>
<ul>
<li>bat-adls-6:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_179489v1/bat-adls-6/igt@intel_hwmon@hwmon-read.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/7707">i915#7707</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@basic-busy-flip-before-cursor-legacy:</p>
<ul>
<li>bat-adls-6:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_179489v1/bat-adls-6/igt@kms_cursor_legacy@basic-busy-flip-before-cursor-legacy.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4103">i915#4103</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_dsc@dsc-basic:</p>
<ul>
<li>bat-adls-6:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_179489v1/bat-adls-6/igt@kms_dsc@dsc-basic.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16361">i915#16361</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_force_connector_basic@force-load-detect:</p>
<ul>
<li>bat-adls-6:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_179489v1/bat-adls-6/igt@kms_force_connector_basic@force-load-detect.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17452">i915#17452</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pm_backlight@basic-brightness:</p>
<ul>
<li>bat-adls-6:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_179489v1/bat-adls-6/igt@kms_pm_backlight@basic-brightness.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5354">i915#5354</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr@psr-primary-mmap-gtt:</p>
<ul>
<li>bat-adls-6:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_179489v1/bat-adls-6/igt@kms_psr@psr-primary-mmap-gtt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/1072">i915#1072</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9732">i915#9732</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_setmode@basic-clone-single-crtc:</p>
<ul>
<li>bat-adls-6:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_179489v1/bat-adls-6/igt@kms_setmode@basic-clone-single-crtc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3555">i915#3555</a>)</li>
</ul>
</li>
<li>
<p>igt@prime_vgem@basic-fence-read:</p>
<ul>
<li>bat-adls-6:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_179489v1/bat-adls-6/igt@prime_vgem@basic-fence-read.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17448">i915#17448</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3291">i915#3291</a>) +2 other tests skip</li>
</ul>
</li>
</ul>
<h4>Possible fixes</h4>
<ul>
<li>
<p>igt@core_debugfs@read-all-entries:</p>
<ul>
<li>bat-adlp-6:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19600/bat-adlp-6/igt@core_debugfs@read-all-entries.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15673">i915#15673</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_179489v1/bat-adlp-6/igt@core_debugfs@read-all-entries.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_pm_rpm@basic-pci-d3-state:</p>
<ul>
<li>bat-rpls-4:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19600/bat-rpls-4/igt@kms_pm_rpm@basic-pci-d3-state.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13400">i915#13400</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_179489v1/bat-rpls-4/igt@kms_pm_rpm@basic-pci-d3-state.html">PASS</a></li>
</ul>
</li>
</ul>
<h2>Build changes</h2>
<ul>
<li>Linux: CI_DRM_19600 -&gt; Patchwork_179489v1</li>
</ul>
<p>CI-20190529: 20190529<br />
  CI_DRM_19600: 0136c4319eff88f24494b8d1655e247a935dda57 @ git://anongit.freedesktop.org/gfx-ci/linux<br />
  IGT_9202: 9202<br />
  Patchwork_179489v1: 0136c4319eff88f24494b8d1655e247a935dda57 @ git://anongit.freedesktop.org/gfx-ci/linux</p>

</body>
</html>

--===============7722761773644241494==--
