Return-Path: <intel-gfx-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 637F2CD5BD1
	for <intel-gfx@archiver.kernel.org>; Mon,  1 Jun 2026 23:31:48 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F0F8D10EA66;
	Mon,  1 Jun 2026 23:31:47 +0000 (UTC)
Received: from 6beec6c84f66 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3A14F10EA63;
 Mon,  1 Jun 2026 23:31:47 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============5307650054857066745=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=97_i915=2ECI=2EBAT=3A_failure_for_drm/i915/dp=3A_Handle_VSC?=
 =?utf-8?q?_SDP_revision_7_in_unpack_=28rev2=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Juasheem Sultan" <jdsultan@google.com>
Cc: intel-gfx@lists.freedesktop.org
Date: Mon, 01 Jun 2026 23:31:47 -0000
Message-ID: <178035670723.33410.13667608379236011120@6beec6c84f66>
X-Patchwork-Hint: ignore
References: <20260430231206.772649-1-jdsultan@google.com>
In-Reply-To: <20260430231206.772649-1-jdsultan@google.com>
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

--===============5307650054857066745==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: drm/i915/dp: Handle VSC SDP revision 7 in unpack (rev2)
URL   : https://patchwork.freedesktop.org/series/165823/
State : failure

== Summary ==

CI Bug Log - changes from CI_DRM_18601 -> Patchwork_165823v2
====================================================

Summary
-------

  **FAILURE**

  Serious unknown changes coming with Patchwork_165823v2 absolutely need to be
  verified manually.
  
  If you think the reported changes have nothing to do with the changes
  introduced in Patchwork_165823v2, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them
  to document this new failure mode, which will reduce false positives in CI.

  External URL: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_165823v2/index.html

Participating hosts (42 -> 40)
------------------------------

  Missing    (2): bat-dg2-13 fi-snb-2520m 

Possible new issues
-------------------

  Here are the unknown changes that may have been introduced in Patchwork_165823v2:

### IGT changes ###

#### Possible regressions ####

  * igt@i915_selftest@live@active:
    - bat-arlh-2:         [PASS][1] -> [INCOMPLETE][2]
   [1]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18601/bat-arlh-2/igt@i915_selftest@live@active.html
   [2]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_165823v2/bat-arlh-2/igt@i915_selftest@live@active.html

  
Known issues
------------

  Here are the changes found in Patchwork_165823v2 that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@i915_selftest@live:
    - bat-arlh-2:         [PASS][3] -> [INCOMPLETE][4] ([i915#15978])
   [3]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18601/bat-arlh-2/igt@i915_selftest@live.html
   [4]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_165823v2/bat-arlh-2/igt@i915_selftest@live.html

  
  [i915#15978]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15978


Build changes
-------------

  * Linux: CI_DRM_18601 -> Patchwork_165823v2

  CI-20190529: 20190529
  CI_DRM_18601: a980196655477a8f5067112946401fe52e510664 @ git://anongit.freedesktop.org/gfx-ci/linux
  IGT_8944: 8944
  Patchwork_165823v2: a980196655477a8f5067112946401fe52e510664 @ git://anongit.freedesktop.org/gfx-ci/linux

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_165823v2/index.html

--===============5307650054857066745==
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
<tr><td><b>Series:</b></td><td>drm/i915/dp: Handle VSC SDP revision 7 in unpack (rev2)</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/165823/">https://patchwork.freedesktop.org/series/165823/</a></td></tr>
<tr><td><b>State:</b></td><td>failure</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_165823v2/index.html">https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_165823v2/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from CI_DRM_18601 -&gt; Patchwork_165823v2</h1>
<h2>Summary</h2>
<p><strong>FAILURE</strong></p>
<p>Serious unknown changes coming with Patchwork_165823v2 absolutely need to be<br />
  verified manually.</p>
<p>If you think the reported changes have nothing to do with the changes<br />
  introduced in Patchwork_165823v2, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them<br />
  to document this new failure mode, which will reduce false positives in CI.</p>
<p>External URL: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_165823v2/index.html</p>
<h2>Participating hosts (42 -&gt; 40)</h2>
<p>Missing    (2): bat-dg2-13 fi-snb-2520m </p>
<h2>Possible new issues</h2>
<p>Here are the unknown changes that may have been introduced in Patchwork_165823v2:</p>
<h3>IGT changes</h3>
<h4>Possible regressions</h4>
<ul>
<li>igt@i915_selftest@live@active:<ul>
<li>bat-arlh-2:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18601/bat-arlh-2/igt@i915_selftest@live@active.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_165823v2/bat-arlh-2/igt@i915_selftest@live@active.html">INCOMPLETE</a></li>
</ul>
</li>
</ul>
<h2>Known issues</h2>
<p>Here are the changes found in Patchwork_165823v2 that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>igt@i915_selftest@live:<ul>
<li>bat-arlh-2:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18601/bat-arlh-2/igt@i915_selftest@live.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_165823v2/bat-arlh-2/igt@i915_selftest@live.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15978">i915#15978</a>)</li>
</ul>
</li>
</ul>
<h2>Build changes</h2>
<ul>
<li>Linux: CI_DRM_18601 -&gt; Patchwork_165823v2</li>
</ul>
<p>CI-20190529: 20190529<br />
  CI_DRM_18601: a980196655477a8f5067112946401fe52e510664 @ git://anongit.freedesktop.org/gfx-ci/linux<br />
  IGT_8944: 8944<br />
  Patchwork_165823v2: a980196655477a8f5067112946401fe52e510664 @ git://anongit.freedesktop.org/gfx-ci/linux</p>

</body>
</html>

--===============5307650054857066745==--
