Return-Path: <intel-gfx-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 608BCC79FBB
	for <intel-gfx@archiver.kernel.org>; Thu, 10 Sep 2026 22:13:59 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C851010EDAF;
	Thu, 10 Sep 2026 22:13:58 +0000 (UTC)
Received: from 61270ab9df2a (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4661D10ED32;
 Thu, 10 Sep 2026 22:13:58 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============5182618089982215171=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=93_i915=2ECI=2EBAT=3A_success_for_Fixup_deadlock_scenarios_?=
 =?utf-8?q?in_the_PMU_path?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Umesh Nerlige Ramappa" <umesh.nerlige.ramappa@intel.com>
Cc: intel-gfx@lists.freedesktop.org
Date: Thu, 10 Sep 2026 22:13:58 -0000
Message-ID: <178907843828.147924.16512213895283837472@61270ab9df2a>
X-Patchwork-Hint: ignore
References: <20260910184253.1231313-4-umesh.nerlige.ramappa@intel.com>
In-Reply-To: <20260910184253.1231313-4-umesh.nerlige.ramappa@intel.com>
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

--===============5182618089982215171==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: Fixup deadlock scenarios in the PMU path
URL   : https://patchwork.freedesktop.org/series/173809/
State : success

== Summary ==

CI Bug Log - changes from CI_DRM_19123 -> Patchwork_173809v1
====================================================

Summary
-------

  **SUCCESS**

  No regressions found.

  External URL: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_173809v1/index.html

Participating hosts (39 -> 38)
------------------------------

  Missing    (1): bat-dg2-13 

Known issues
------------

  Here are the changes found in Patchwork_173809v1 that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@i915_selftest@live:
    - bat-adlp-11:        [PASS][1] -> [DMESG-FAIL][2] ([i915#12964]) +1 other test dmesg-fail
   [1]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19123/bat-adlp-11/igt@i915_selftest@live.html
   [2]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_173809v1/bat-adlp-11/igt@i915_selftest@live.html

  
#### Possible fixes ####

  * igt@i915_selftest@live:
    - fi-glk-j4005:       [ABORT][3] -> [PASS][4] +1 other test pass
   [3]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19123/fi-glk-j4005/igt@i915_selftest@live.html
   [4]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_173809v1/fi-glk-j4005/igt@i915_selftest@live.html

  
  [i915#12964]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12964


Build changes
-------------

  * Linux: CI_DRM_19123 -> Patchwork_173809v1

  CI-20190529: 20190529
  CI_DRM_19123: da9c5bc444c1057d8d59ca6fe1de87e39dbad974 @ git://anongit.freedesktop.org/gfx-ci/linux
  IGT_9090: 9090
  Patchwork_173809v1: da9c5bc444c1057d8d59ca6fe1de87e39dbad974 @ git://anongit.freedesktop.org/gfx-ci/linux

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_173809v1/index.html

--===============5182618089982215171==
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
<tr><td><b>Series:</b></td><td>Fixup deadlock scenarios in the PMU path</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/173809/">https://patchwork.freedesktop.org/series/173809/</a></td></tr>
<tr><td><b>State:</b></td><td>success</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_173809v1/index.html">https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_173809v1/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from CI_DRM_19123 -&gt; Patchwork_173809v1</h1>
<h2>Summary</h2>
<p><strong>SUCCESS</strong></p>
<p>No regressions found.</p>
<p>External URL: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_173809v1/index.html</p>
<h2>Participating hosts (39 -&gt; 38)</h2>
<p>Missing    (1): bat-dg2-13 </p>
<h2>Known issues</h2>
<p>Here are the changes found in Patchwork_173809v1 that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>igt@i915_selftest@live:<ul>
<li>bat-adlp-11:        <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19123/bat-adlp-11/igt@i915_selftest@live.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_173809v1/bat-adlp-11/igt@i915_selftest@live.html">DMESG-FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12964">i915#12964</a>) +1 other test dmesg-fail</li>
</ul>
</li>
</ul>
<h4>Possible fixes</h4>
<ul>
<li>igt@i915_selftest@live:<ul>
<li>fi-glk-j4005:       <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19123/fi-glk-j4005/igt@i915_selftest@live.html">ABORT</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_173809v1/fi-glk-j4005/igt@i915_selftest@live.html">PASS</a> +1 other test pass</li>
</ul>
</li>
</ul>
<h2>Build changes</h2>
<ul>
<li>Linux: CI_DRM_19123 -&gt; Patchwork_173809v1</li>
</ul>
<p>CI-20190529: 20190529<br />
  CI_DRM_19123: da9c5bc444c1057d8d59ca6fe1de87e39dbad974 @ git://anongit.freedesktop.org/gfx-ci/linux<br />
  IGT_9090: 9090<br />
  Patchwork_173809v1: da9c5bc444c1057d8d59ca6fe1de87e39dbad974 @ git://anongit.freedesktop.org/gfx-ci/linux</p>

</body>
</html>

--===============5182618089982215171==--
