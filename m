Return-Path: <intel-gfx-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0859FCD5BD0
	for <intel-gfx@archiver.kernel.org>; Wed, 27 May 2026 13:25:14 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 946AC10E7D8;
	Wed, 27 May 2026 13:25:13 +0000 (UTC)
Received: from 6beec6c84f66 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EED3910E7C6;
 Wed, 27 May 2026 13:25:12 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============4330785798360227965=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=97_i915=2ECI=2EBAT=3A_failure_for_series_starting_with_=5Bv?=
 =?utf-8?q?4=2C1/2=5D_gpu/buddy=3A_replace_dual-tree/force=5Fmerge_with_deco?=
 =?utf-8?q?upled_clear_tracker?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Arunpravin Paneer Selvam" <arunpravin.paneerselvam@amd.com>
Cc: intel-gfx@lists.freedesktop.org
Date: Wed, 27 May 2026 13:25:12 -0000
Message-ID: <177988831296.15289.10764322880836616057@6beec6c84f66>
X-Patchwork-Hint: ignore
References: <20260527112902.3815-1-Arunpravin.PaneerSelvam@amd.com>
In-Reply-To: <20260527112902.3815-1-Arunpravin.PaneerSelvam@amd.com>
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

--===============4330785798360227965==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: series starting with [v4,1/2] gpu/buddy: replace dual-tree/force_merge with decoupled clear tracker
URL   : https://patchwork.freedesktop.org/series/167371/
State : failure

== Summary ==

CI Bug Log - changes from CI_DRM_18560 -> Patchwork_167371v1
====================================================

Summary
-------

  **FAILURE**

  Serious unknown changes coming with Patchwork_167371v1 absolutely need to be
  verified manually.
  
  If you think the reported changes have nothing to do with the changes
  introduced in Patchwork_167371v1, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them
  to document this new failure mode, which will reduce false positives in CI.

  External URL: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_167371v1/index.html

Participating hosts (42 -> 40)
------------------------------

  Missing    (2): bat-dg2-13 fi-snb-2520m 

Possible new issues
-------------------

  Here are the unknown changes that may have been introduced in Patchwork_167371v1:

### IGT changes ###

#### Possible regressions ####

  * igt@runner@aborted:
    - fi-pnv-d510:        NOTRUN -> [FAIL][1]
   [1]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_167371v1/fi-pnv-d510/igt@runner@aborted.html

  
Known issues
------------

  Here are the changes found in Patchwork_167371v1 that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@i915_pm_rpm@module-reload:
    - bat-adlp-6:         [PASS][2] -> [DMESG-WARN][3] ([i915#15673]) +78 other tests dmesg-warn
   [2]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18560/bat-adlp-6/igt@i915_pm_rpm@module-reload.html
   [3]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_167371v1/bat-adlp-6/igt@i915_pm_rpm@module-reload.html

  * igt@i915_selftest@live@client:
    - fi-kbl-7567u:       [PASS][4] -> [DMESG-WARN][5] ([i915#13735]) +13 other tests dmesg-warn
   [4]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18560/fi-kbl-7567u/igt@i915_selftest@live@client.html
   [5]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_167371v1/fi-kbl-7567u/igt@i915_selftest@live@client.html

  
  [i915#13735]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13735
  [i915#15673]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15673


Build changes
-------------

  * Linux: CI_DRM_18560 -> Patchwork_167371v1

  CI-20190529: 20190529
  CI_DRM_18560: 971288d0e77f7a0d356287121ce549ab5dad570a @ git://anongit.freedesktop.org/gfx-ci/linux
  IGT_8938: b024a3b67372962ff6e643d3998c5cf5acc07081 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
  Patchwork_167371v1: 971288d0e77f7a0d356287121ce549ab5dad570a @ git://anongit.freedesktop.org/gfx-ci/linux

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_167371v1/index.html

--===============4330785798360227965==
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
<tr><td><b>Series:</b></td><td>series starting with [v4,1/2] gpu/buddy: replace dual-tree/force_merge with decoupled clear tracker</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/167371/">https://patchwork.freedesktop.org/series/167371/</a></td></tr>
<tr><td><b>State:</b></td><td>failure</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_167371v1/index.html">https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_167371v1/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from CI_DRM_18560 -&gt; Patchwork_167371v1</h1>
<h2>Summary</h2>
<p><strong>FAILURE</strong></p>
<p>Serious unknown changes coming with Patchwork_167371v1 absolutely need to be<br />
  verified manually.</p>
<p>If you think the reported changes have nothing to do with the changes<br />
  introduced in Patchwork_167371v1, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them<br />
  to document this new failure mode, which will reduce false positives in CI.</p>
<p>External URL: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_167371v1/index.html</p>
<h2>Participating hosts (42 -&gt; 40)</h2>
<p>Missing    (2): bat-dg2-13 fi-snb-2520m </p>
<h2>Possible new issues</h2>
<p>Here are the unknown changes that may have been introduced in Patchwork_167371v1:</p>
<h3>IGT changes</h3>
<h4>Possible regressions</h4>
<ul>
<li>igt@runner@aborted:<ul>
<li>fi-pnv-d510:        NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_167371v1/fi-pnv-d510/igt@runner@aborted.html">FAIL</a></li>
</ul>
</li>
</ul>
<h2>Known issues</h2>
<p>Here are the changes found in Patchwork_167371v1 that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>
<p>igt@i915_pm_rpm@module-reload:</p>
<ul>
<li>bat-adlp-6:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18560/bat-adlp-6/igt@i915_pm_rpm@module-reload.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_167371v1/bat-adlp-6/igt@i915_pm_rpm@module-reload.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15673">i915#15673</a>) +78 other tests dmesg-warn</li>
</ul>
</li>
<li>
<p>igt@i915_selftest@live@client:</p>
<ul>
<li>fi-kbl-7567u:       <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18560/fi-kbl-7567u/igt@i915_selftest@live@client.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_167371v1/fi-kbl-7567u/igt@i915_selftest@live@client.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13735">i915#13735</a>) +13 other tests dmesg-warn</li>
</ul>
</li>
</ul>
<h2>Build changes</h2>
<ul>
<li>Linux: CI_DRM_18560 -&gt; Patchwork_167371v1</li>
</ul>
<p>CI-20190529: 20190529<br />
  CI_DRM_18560: 971288d0e77f7a0d356287121ce549ab5dad570a @ git://anongit.freedesktop.org/gfx-ci/linux<br />
  IGT_8938: b024a3b67372962ff6e643d3998c5cf5acc07081 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git<br />
  Patchwork_167371v1: 971288d0e77f7a0d356287121ce549ab5dad570a @ git://anongit.freedesktop.org/gfx-ci/linux</p>

</body>
</html>

--===============4330785798360227965==--
