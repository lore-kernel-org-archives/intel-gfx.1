Return-Path: <intel-gfx-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 52E71CD6E4A
	for <intel-gfx@archiver.kernel.org>; Fri, 29 May 2026 13:32:11 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DA31910FF3D;
	Fri, 29 May 2026 13:32:10 +0000 (UTC)
Received: from 6beec6c84f66 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0BCDE10FF3A;
 Fri, 29 May 2026 13:32:09 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============7110192745032323062=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=93_i915=2ECI=2EBAT=3A_success_for_drm/i915/edp=3A_Check_sup?=
 =?utf-8?q?ported_link_rates_DPCD_read?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Nikita Zhandarovich" <n.zhandarovich@fintech.ru>
Cc: intel-gfx@lists.freedesktop.org
Date: Fri, 29 May 2026 13:32:09 -0000
Message-ID: <178006152904.23779.7393580753157169051@6beec6c84f66>
X-Patchwork-Hint: ignore
References: <20260529120921.1633346-1-n.zhandarovich@fintech.ru>
In-Reply-To: <20260529120921.1633346-1-n.zhandarovich@fintech.ru>
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

--===============7110192745032323062==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: drm/i915/edp: Check supported link rates DPCD read
URL   : https://patchwork.freedesktop.org/series/167547/
State : success

== Summary ==

CI Bug Log - changes from CI_DRM_18583 -> Patchwork_167547v1
====================================================

Summary
-------

  **SUCCESS**

  No regressions found.

  External URL: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_167547v1/index.html

Participating hosts (42 -> 40)
------------------------------

  Missing    (2): bat-dg2-13 fi-snb-2520m 

Known issues
------------

  Here are the changes found in Patchwork_167547v1 that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@dmabuf@all-tests:
    - bat-arlh-2:         NOTRUN -> [SKIP][1] ([i915#11346] / [i915#15931])
   [1]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_167547v1/bat-arlh-2/igt@dmabuf@all-tests.html

  
#### Possible fixes ####

  * igt@i915_selftest@live:
    - bat-arlh-2:         [INCOMPLETE][2] ([i915#15978]) -> [PASS][3]
   [2]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18583/bat-arlh-2/igt@i915_selftest@live.html
   [3]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_167547v1/bat-arlh-2/igt@i915_selftest@live.html

  * igt@i915_selftest@live@gem:
    - bat-arlh-2:         [INCOMPLETE][4] -> [PASS][5]
   [4]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18583/bat-arlh-2/igt@i915_selftest@live@gem.html
   [5]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_167547v1/bat-arlh-2/igt@i915_selftest@live@gem.html

  
  [i915#11346]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11346
  [i915#15931]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15931
  [i915#15978]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15978


Build changes
-------------

  * Linux: CI_DRM_18583 -> Patchwork_167547v1

  CI-20190529: 20190529
  CI_DRM_18583: 17840f1e2263db3bf46c485ea639832095b5ccde @ git://anongit.freedesktop.org/gfx-ci/linux
  IGT_8943: 8943
  Patchwork_167547v1: 17840f1e2263db3bf46c485ea639832095b5ccde @ git://anongit.freedesktop.org/gfx-ci/linux

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_167547v1/index.html

--===============7110192745032323062==
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
<tr><td><b>Series:</b></td><td>drm/i915/edp: Check supported link rates DPCD read</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/167547/">https://patchwork.freedesktop.org/series/167547/</a></td></tr>
<tr><td><b>State:</b></td><td>success</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_167547v1/index.html">https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_167547v1/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from CI_DRM_18583 -&gt; Patchwork_167547v1</h1>
<h2>Summary</h2>
<p><strong>SUCCESS</strong></p>
<p>No regressions found.</p>
<p>External URL: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_167547v1/index.html</p>
<h2>Participating hosts (42 -&gt; 40)</h2>
<p>Missing    (2): bat-dg2-13 fi-snb-2520m </p>
<h2>Known issues</h2>
<p>Here are the changes found in Patchwork_167547v1 that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>igt@dmabuf@all-tests:<ul>
<li>bat-arlh-2:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_167547v1/bat-arlh-2/igt@dmabuf@all-tests.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11346">i915#11346</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15931">i915#15931</a>)</li>
</ul>
</li>
</ul>
<h4>Possible fixes</h4>
<ul>
<li>
<p>igt@i915_selftest@live:</p>
<ul>
<li>bat-arlh-2:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18583/bat-arlh-2/igt@i915_selftest@live.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15978">i915#15978</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_167547v1/bat-arlh-2/igt@i915_selftest@live.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@i915_selftest@live@gem:</p>
<ul>
<li>bat-arlh-2:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18583/bat-arlh-2/igt@i915_selftest@live@gem.html">INCOMPLETE</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_167547v1/bat-arlh-2/igt@i915_selftest@live@gem.html">PASS</a></li>
</ul>
</li>
</ul>
<h2>Build changes</h2>
<ul>
<li>Linux: CI_DRM_18583 -&gt; Patchwork_167547v1</li>
</ul>
<p>CI-20190529: 20190529<br />
  CI_DRM_18583: 17840f1e2263db3bf46c485ea639832095b5ccde @ git://anongit.freedesktop.org/gfx-ci/linux<br />
  IGT_8943: 8943<br />
  Patchwork_167547v1: 17840f1e2263db3bf46c485ea639832095b5ccde @ git://anongit.freedesktop.org/gfx-ci/linux</p>

</body>
</html>

--===============7110192745032323062==--
