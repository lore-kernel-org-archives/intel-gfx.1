Return-Path: <intel-gfx-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 473DEC5DF68
	for <intel-gfx@archiver.kernel.org>; Sat, 21 Feb 2026 00:18:46 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BF35010E0C0;
	Sat, 21 Feb 2026 00:18:45 +0000 (UTC)
Received: from a3b018990fe9 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3984210E02F;
 Sat, 21 Feb 2026 00:18:45 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============3192923186149616309=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=97_i915=2ECI=2EBAT=3A_failure_for_drm/i915/gem=3A_Explicitl?=
 =?utf-8?q?y_return_error_value_from_eb=5Frelocate_helpers_=28rev2=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Cavitt, Jonathan" <jonathan.cavitt@intel.com>
Cc: intel-gfx@lists.freedesktop.org
Date: Sat, 21 Feb 2026 00:18:45 -0000
Message-ID: <177163312521.270871.14468517940401370366@a3b018990fe9>
X-Patchwork-Hint: ignore
References: <20260204230307.81289-2-jonathan.cavitt@intel.com>
In-Reply-To: <20260204230307.81289-2-jonathan.cavitt@intel.com>
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

--===============3192923186149616309==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: drm/i915/gem: Explicitly return error value from eb_relocate helpers (rev2)
URL   : https://patchwork.freedesktop.org/series/161167/
State : failure

== Summary ==

CI Bug Log - changes from CI_DRM_18015 -> Patchwork_161167v2
====================================================

Summary
-------

  **FAILURE**

  Serious unknown changes coming with Patchwork_161167v2 absolutely need to be
  verified manually.
  
  If you think the reported changes have nothing to do with the changes
  introduced in Patchwork_161167v2, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them
  to document this new failure mode, which will reduce false positives in CI.

  External URL: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_161167v2/index.html

Participating hosts (43 -> 40)
------------------------------

  Missing    (3): bat-dg2-13 fi-snb-2520m bat-adls-6 

Possible new issues
-------------------

  Here are the unknown changes that may have been introduced in Patchwork_161167v2:

### IGT changes ###

#### Possible regressions ####

  * igt@gem_exec_gttfill@basic:
    - bat-apl-1:          [PASS][1] -> [ABORT][2]
   [1]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18015/bat-apl-1/igt@gem_exec_gttfill@basic.html
   [2]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_161167v2/bat-apl-1/igt@gem_exec_gttfill@basic.html
    - fi-bsw-nick:        [PASS][3] -> [ABORT][4]
   [3]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18015/fi-bsw-nick/igt@gem_exec_gttfill@basic.html
   [4]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_161167v2/fi-bsw-nick/igt@gem_exec_gttfill@basic.html

  * igt@i915_module_load@load:
    - bat-jsl-1:          [PASS][5] -> [FAIL][6] +1 other test fail
   [5]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18015/bat-jsl-1/igt@i915_module_load@load.html
   [6]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_161167v2/bat-jsl-1/igt@i915_module_load@load.html
    - fi-bsw-n3050:       [PASS][7] -> [FAIL][8] +1 other test fail
   [7]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18015/fi-bsw-n3050/igt@i915_module_load@load.html
   [8]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_161167v2/fi-bsw-n3050/igt@i915_module_load@load.html
    - fi-kbl-8809g:       [PASS][9] -> [FAIL][10] +1 other test fail
   [9]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18015/fi-kbl-8809g/igt@i915_module_load@load.html
   [10]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_161167v2/fi-kbl-8809g/igt@i915_module_load@load.html
    - bat-apl-1:          [PASS][11] -> [FAIL][12]
   [11]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18015/bat-apl-1/igt@i915_module_load@load.html
   [12]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_161167v2/bat-apl-1/igt@i915_module_load@load.html
    - fi-tgl-1115g4:      [PASS][13] -> [FAIL][14] +1 other test fail
   [13]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18015/fi-tgl-1115g4/igt@i915_module_load@load.html
   [14]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_161167v2/fi-tgl-1115g4/igt@i915_module_load@load.html
    - fi-bsw-nick:        [PASS][15] -> [FAIL][16]
   [15]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18015/fi-bsw-nick/igt@i915_module_load@load.html
   [16]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_161167v2/fi-bsw-nick/igt@i915_module_load@load.html

  * igt@i915_module_load@reload:
    - fi-glk-j4005:       [PASS][17] -> [FAIL][18] +1 other test fail
   [17]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18015/fi-glk-j4005/igt@i915_module_load@reload.html
   [18]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_161167v2/fi-glk-j4005/igt@i915_module_load@reload.html
    - fi-kbl-7567u:       [PASS][19] -> [FAIL][20] +1 other test fail
   [19]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18015/fi-kbl-7567u/igt@i915_module_load@reload.html
   [20]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_161167v2/fi-kbl-7567u/igt@i915_module_load@reload.html
    - bat-jsl-5:          [PASS][21] -> [FAIL][22] +1 other test fail
   [21]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18015/bat-jsl-5/igt@i915_module_load@reload.html
   [22]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_161167v2/bat-jsl-5/igt@i915_module_load@reload.html
    - fi-cfl-guc:         [PASS][23] -> [FAIL][24] +1 other test fail
   [23]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18015/fi-cfl-guc/igt@i915_module_load@reload.html
   [24]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_161167v2/fi-cfl-guc/igt@i915_module_load@reload.html
    - fi-kbl-x1275:       [PASS][25] -> [FAIL][26] +1 other test fail
   [25]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18015/fi-kbl-x1275/igt@i915_module_load@reload.html
   [26]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_161167v2/fi-kbl-x1275/igt@i915_module_load@reload.html
    - fi-cfl-8109u:       [PASS][27] -> [FAIL][28] +1 other test fail
   [27]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18015/fi-cfl-8109u/igt@i915_module_load@reload.html
   [28]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_161167v2/fi-cfl-8109u/igt@i915_module_load@reload.html
    - fi-skl-6600u:       [PASS][29] -> [FAIL][30] +1 other test fail
   [29]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18015/fi-skl-6600u/igt@i915_module_load@reload.html
   [30]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_161167v2/fi-skl-6600u/igt@i915_module_load@reload.html
    - fi-cfl-8700k:       [PASS][31] -> [FAIL][32] +1 other test fail
   [31]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18015/fi-cfl-8700k/igt@i915_module_load@reload.html
   [32]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_161167v2/fi-cfl-8700k/igt@i915_module_load@reload.html
    - bat-kbl-2:          [PASS][33] -> [FAIL][34] +1 other test fail
   [33]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18015/bat-kbl-2/igt@i915_module_load@reload.html
   [34]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_161167v2/bat-kbl-2/igt@i915_module_load@reload.html

  
Known issues
------------

  Here are the changes found in Patchwork_161167v2 that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@i915_selftest@live@workarounds:
    - bat-arlh-3:         [PASS][35] -> [DMESG-FAIL][36] ([i915#12061]) +1 other test dmesg-fail
   [35]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18015/bat-arlh-3/igt@i915_selftest@live@workarounds.html
   [36]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_161167v2/bat-arlh-3/igt@i915_selftest@live@workarounds.html
    - bat-dg2-14:         [PASS][37] -> [DMESG-FAIL][38] ([i915#12061]) +1 other test dmesg-fail
   [37]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18015/bat-dg2-14/igt@i915_selftest@live@workarounds.html
   [38]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_161167v2/bat-dg2-14/igt@i915_selftest@live@workarounds.html

  
#### Possible fixes ####

  * igt@i915_selftest@live@workarounds:
    - bat-arls-6:         [DMESG-FAIL][39] ([i915#12061]) -> [PASS][40] +1 other test pass
   [39]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18015/bat-arls-6/igt@i915_selftest@live@workarounds.html
   [40]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_161167v2/bat-arls-6/igt@i915_selftest@live@workarounds.html

  
  [i915#12061]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12061


Build changes
-------------

  * Linux: CI_DRM_18015 -> Patchwork_161167v2

  CI-20190529: 20190529
  CI_DRM_18015: 7c2ed7e89e283615b5f133d0205061934541e26d @ git://anongit.freedesktop.org/gfx-ci/linux
  IGT_8764: 8764
  Patchwork_161167v2: 7c2ed7e89e283615b5f133d0205061934541e26d @ git://anongit.freedesktop.org/gfx-ci/linux

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_161167v2/index.html

--===============3192923186149616309==
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
<tr><td><b>Series:</b></td><td>drm/i915/gem: Explicitly return error value from eb_relocate helpers (rev2)</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/161167/">https://patchwork.freedesktop.org/series/161167/</a></td></tr>
<tr><td><b>State:</b></td><td>failure</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_161167v2/index.html">https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_161167v2/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from CI_DRM_18015 -&gt; Patchwork_161167v2</h1>
<h2>Summary</h2>
<p><strong>FAILURE</strong></p>
<p>Serious unknown changes coming with Patchwork_161167v2 absolutely need to be<br />
  verified manually.</p>
<p>If you think the reported changes have nothing to do with the changes<br />
  introduced in Patchwork_161167v2, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them<br />
  to document this new failure mode, which will reduce false positives in CI.</p>
<p>External URL: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_161167v2/index.html</p>
<h2>Participating hosts (43 -&gt; 40)</h2>
<p>Missing    (3): bat-dg2-13 fi-snb-2520m bat-adls-6 </p>
<h2>Possible new issues</h2>
<p>Here are the unknown changes that may have been introduced in Patchwork_161167v2:</p>
<h3>IGT changes</h3>
<h4>Possible regressions</h4>
<ul>
<li>
<p>igt@gem_exec_gttfill@basic:</p>
<ul>
<li>bat-apl-1:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18015/bat-apl-1/igt@gem_exec_gttfill@basic.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_161167v2/bat-apl-1/igt@gem_exec_gttfill@basic.html">ABORT</a></li>
<li>fi-bsw-nick:        <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18015/fi-bsw-nick/igt@gem_exec_gttfill@basic.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_161167v2/fi-bsw-nick/igt@gem_exec_gttfill@basic.html">ABORT</a></li>
</ul>
</li>
<li>
<p>igt@i915_module_load@load:</p>
<ul>
<li>bat-jsl-1:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18015/bat-jsl-1/igt@i915_module_load@load.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_161167v2/bat-jsl-1/igt@i915_module_load@load.html">FAIL</a> +1 other test fail</li>
<li>fi-bsw-n3050:       <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18015/fi-bsw-n3050/igt@i915_module_load@load.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_161167v2/fi-bsw-n3050/igt@i915_module_load@load.html">FAIL</a> +1 other test fail</li>
<li>fi-kbl-8809g:       <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18015/fi-kbl-8809g/igt@i915_module_load@load.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_161167v2/fi-kbl-8809g/igt@i915_module_load@load.html">FAIL</a> +1 other test fail</li>
<li>bat-apl-1:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18015/bat-apl-1/igt@i915_module_load@load.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_161167v2/bat-apl-1/igt@i915_module_load@load.html">FAIL</a></li>
<li>fi-tgl-1115g4:      <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18015/fi-tgl-1115g4/igt@i915_module_load@load.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_161167v2/fi-tgl-1115g4/igt@i915_module_load@load.html">FAIL</a> +1 other test fail</li>
<li>fi-bsw-nick:        <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18015/fi-bsw-nick/igt@i915_module_load@load.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_161167v2/fi-bsw-nick/igt@i915_module_load@load.html">FAIL</a></li>
</ul>
</li>
<li>
<p>igt@i915_module_load@reload:</p>
<ul>
<li>fi-glk-j4005:       <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18015/fi-glk-j4005/igt@i915_module_load@reload.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_161167v2/fi-glk-j4005/igt@i915_module_load@reload.html">FAIL</a> +1 other test fail</li>
<li>fi-kbl-7567u:       <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18015/fi-kbl-7567u/igt@i915_module_load@reload.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_161167v2/fi-kbl-7567u/igt@i915_module_load@reload.html">FAIL</a> +1 other test fail</li>
<li>bat-jsl-5:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18015/bat-jsl-5/igt@i915_module_load@reload.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_161167v2/bat-jsl-5/igt@i915_module_load@reload.html">FAIL</a> +1 other test fail</li>
<li>fi-cfl-guc:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18015/fi-cfl-guc/igt@i915_module_load@reload.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_161167v2/fi-cfl-guc/igt@i915_module_load@reload.html">FAIL</a> +1 other test fail</li>
<li>fi-kbl-x1275:       <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18015/fi-kbl-x1275/igt@i915_module_load@reload.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_161167v2/fi-kbl-x1275/igt@i915_module_load@reload.html">FAIL</a> +1 other test fail</li>
<li>fi-cfl-8109u:       <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18015/fi-cfl-8109u/igt@i915_module_load@reload.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_161167v2/fi-cfl-8109u/igt@i915_module_load@reload.html">FAIL</a> +1 other test fail</li>
<li>fi-skl-6600u:       <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18015/fi-skl-6600u/igt@i915_module_load@reload.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_161167v2/fi-skl-6600u/igt@i915_module_load@reload.html">FAIL</a> +1 other test fail</li>
<li>fi-cfl-8700k:       <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18015/fi-cfl-8700k/igt@i915_module_load@reload.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_161167v2/fi-cfl-8700k/igt@i915_module_load@reload.html">FAIL</a> +1 other test fail</li>
<li>bat-kbl-2:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18015/bat-kbl-2/igt@i915_module_load@reload.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_161167v2/bat-kbl-2/igt@i915_module_load@reload.html">FAIL</a> +1 other test fail</li>
</ul>
</li>
</ul>
<h2>Known issues</h2>
<p>Here are the changes found in Patchwork_161167v2 that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>igt@i915_selftest@live@workarounds:<ul>
<li>bat-arlh-3:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18015/bat-arlh-3/igt@i915_selftest@live@workarounds.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_161167v2/bat-arlh-3/igt@i915_selftest@live@workarounds.html">DMESG-FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12061">i915#12061</a>) +1 other test dmesg-fail</li>
<li>bat-dg2-14:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18015/bat-dg2-14/igt@i915_selftest@live@workarounds.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_161167v2/bat-dg2-14/igt@i915_selftest@live@workarounds.html">DMESG-FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12061">i915#12061</a>) +1 other test dmesg-fail</li>
</ul>
</li>
</ul>
<h4>Possible fixes</h4>
<ul>
<li>igt@i915_selftest@live@workarounds:<ul>
<li>bat-arls-6:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18015/bat-arls-6/igt@i915_selftest@live@workarounds.html">DMESG-FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12061">i915#12061</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_161167v2/bat-arls-6/igt@i915_selftest@live@workarounds.html">PASS</a> +1 other test pass</li>
</ul>
</li>
</ul>
<h2>Build changes</h2>
<ul>
<li>Linux: CI_DRM_18015 -&gt; Patchwork_161167v2</li>
</ul>
<p>CI-20190529: 20190529<br />
  CI_DRM_18015: 7c2ed7e89e283615b5f133d0205061934541e26d @ git://anongit.freedesktop.org/gfx-ci/linux<br />
  IGT_8764: 8764<br />
  Patchwork_161167v2: 7c2ed7e89e283615b5f133d0205061934541e26d @ git://anongit.freedesktop.org/gfx-ci/linux</p>

</body>
</html>

--===============3192923186149616309==--
