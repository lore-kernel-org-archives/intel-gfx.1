Return-Path: <intel-gfx-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EFAC4CA5FED
	for <intel-gfx@archiver.kernel.org>; Tue,  6 Oct 2026 09:02:02 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6360510E2C9;
	Tue,  6 Oct 2026 09:02:02 +0000 (UTC)
Received: from 61270ab9df2a (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6977010E21E;
 Tue,  6 Oct 2026 09:02:01 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============7864543785515077713=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=93_i915=2ECI=2EBAT=3A_success_for_series_starting_with_=5Bv?=
 =?utf-8?q?3=2C1/2=5D_gpu/buddy=3A_add_range-restricted_contiguous_allocatio?=
 =?utf-8?q?n_fallback?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Arunpravin Paneer Selvam" <arunpravin.paneerselvam@amd.com>
Cc: intel-gfx@lists.freedesktop.org
Date: Tue, 06 Oct 2026 09:02:01 -0000
Message-ID: <179127732142.243411.4814817417917392242@61270ab9df2a>
X-Patchwork-Hint: ignore
References: <20261006072643.211568-1-arunpravin.paneerselvam@amd.com>
In-Reply-To: <20261006072643.211568-1-arunpravin.paneerselvam@amd.com>
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

--===============7864543785515077713==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: series starting with [v3,1/2] gpu/buddy: add range-restricted contiguous allocation fallback
URL   : https://patchwork.freedesktop.org/series/175598/
State : success

== Summary ==

CI Bug Log - changes from CI_DRM_19286 -> Patchwork_175598v1
====================================================

Summary
-------

  **SUCCESS**

  No regressions found.

  External URL: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_175598v1/index.html

Participating hosts (39 -> 38)
------------------------------

  Missing    (1): bat-dg2-13 

Known issues
------------

  Here are the changes found in Patchwork_175598v1 that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@core_hotunplug@unbind-rebind:
    - bat-apl-1:          [PASS][1] -> [DMESG-WARN][2] ([i915#16685])
   [1]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19286/bat-apl-1/igt@core_hotunplug@unbind-rebind.html
   [2]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_175598v1/bat-apl-1/igt@core_hotunplug@unbind-rebind.html

  * igt@kms_hdmi_inject@inject-audio:
    - fi-tgl-1115g4:      [PASS][3] -> [FAIL][4] ([i915#16664])
   [3]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19286/fi-tgl-1115g4/igt@kms_hdmi_inject@inject-audio.html
   [4]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_175598v1/fi-tgl-1115g4/igt@kms_hdmi_inject@inject-audio.html

  
#### Possible fixes ####

  * igt@fbdev@info:
    - fi-hsw-4770:        [SKIP][5] ([i915#1849] / [i915#2582]) -> [PASS][6]
   [5]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19286/fi-hsw-4770/igt@fbdev@info.html
   [6]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_175598v1/fi-hsw-4770/igt@fbdev@info.html

  * igt@fbdev@nullptr:
    - fi-hsw-4770:        [SKIP][7] ([i915#2582]) -> [PASS][8] +3 other tests pass
   [7]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19286/fi-hsw-4770/igt@fbdev@nullptr.html
   [8]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_175598v1/fi-hsw-4770/igt@fbdev@nullptr.html

  * igt@gem_softpin@safe-alignment:
    - fi-hsw-4770:        [FAIL][9] ([i915#15527]) -> [PASS][10]
   [9]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19286/fi-hsw-4770/igt@gem_softpin@safe-alignment.html
   [10]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_175598v1/fi-hsw-4770/igt@gem_softpin@safe-alignment.html

  
  [i915#15527]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15527
  [i915#16664]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16664
  [i915#16685]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16685
  [i915#1849]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/1849
  [i915#2582]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2582


Build changes
-------------

  * Linux: CI_DRM_19286 -> Patchwork_175598v1

  CI-20190529: 20190529
  CI_DRM_19286: 4043ef7a9db48c52beb26b369cbbb29d623105c6 @ git://anongit.freedesktop.org/gfx-ci/linux
  IGT_9130: 9130
  Patchwork_175598v1: 4043ef7a9db48c52beb26b369cbbb29d623105c6 @ git://anongit.freedesktop.org/gfx-ci/linux

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_175598v1/index.html

--===============7864543785515077713==
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
<tr><td><b>Series:</b></td><td>series starting with [v3,1/2] gpu/buddy: add range-restricted contiguous allocation fallback</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/175598/">https://patchwork.freedesktop.org/series/175598/</a></td></tr>
<tr><td><b>State:</b></td><td>success</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_175598v1/index.html">https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_175598v1/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from CI_DRM_19286 -&gt; Patchwork_175598v1</h1>
<h2>Summary</h2>
<p><strong>SUCCESS</strong></p>
<p>No regressions found.</p>
<p>External URL: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_175598v1/index.html</p>
<h2>Participating hosts (39 -&gt; 38)</h2>
<p>Missing    (1): bat-dg2-13 </p>
<h2>Known issues</h2>
<p>Here are the changes found in Patchwork_175598v1 that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>
<p>igt@core_hotunplug@unbind-rebind:</p>
<ul>
<li>bat-apl-1:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19286/bat-apl-1/igt@core_hotunplug@unbind-rebind.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_175598v1/bat-apl-1/igt@core_hotunplug@unbind-rebind.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16685">i915#16685</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_hdmi_inject@inject-audio:</p>
<ul>
<li>fi-tgl-1115g4:      <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19286/fi-tgl-1115g4/igt@kms_hdmi_inject@inject-audio.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_175598v1/fi-tgl-1115g4/igt@kms_hdmi_inject@inject-audio.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16664">i915#16664</a>)</li>
</ul>
</li>
</ul>
<h4>Possible fixes</h4>
<ul>
<li>
<p>igt@fbdev@info:</p>
<ul>
<li>fi-hsw-4770:        <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19286/fi-hsw-4770/igt@fbdev@info.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/1849">i915#1849</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2582">i915#2582</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_175598v1/fi-hsw-4770/igt@fbdev@info.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@fbdev@nullptr:</p>
<ul>
<li>fi-hsw-4770:        <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19286/fi-hsw-4770/igt@fbdev@nullptr.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2582">i915#2582</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_175598v1/fi-hsw-4770/igt@fbdev@nullptr.html">PASS</a> +3 other tests pass</li>
</ul>
</li>
<li>
<p>igt@gem_softpin@safe-alignment:</p>
<ul>
<li>fi-hsw-4770:        <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19286/fi-hsw-4770/igt@gem_softpin@safe-alignment.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15527">i915#15527</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_175598v1/fi-hsw-4770/igt@gem_softpin@safe-alignment.html">PASS</a></li>
</ul>
</li>
</ul>
<h2>Build changes</h2>
<ul>
<li>Linux: CI_DRM_19286 -&gt; Patchwork_175598v1</li>
</ul>
<p>CI-20190529: 20190529<br />
  CI_DRM_19286: 4043ef7a9db48c52beb26b369cbbb29d623105c6 @ git://anongit.freedesktop.org/gfx-ci/linux<br />
  IGT_9130: 9130<br />
  Patchwork_175598v1: 4043ef7a9db48c52beb26b369cbbb29d623105c6 @ git://anongit.freedesktop.org/gfx-ci/linux</p>

</body>
</html>

--===============7864543785515077713==--
