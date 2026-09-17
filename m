Return-Path: <intel-gfx-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 47569C88E72
	for <intel-gfx@archiver.kernel.org>; Thu, 17 Sep 2026 12:09:39 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C575910EE85;
	Thu, 17 Sep 2026 12:09:38 +0000 (UTC)
Received: from 61270ab9df2a (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9B35C10EE4E;
 Thu, 17 Sep 2026 12:09:37 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============2419053305186125962=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=97_i915=2ECI=2EBAT=3A_failure_for_drm/i915/selftests=3A_Fix?=
 =?utf-8?q?_unlocked_mm=2Estolen_in_reset_selftest_=28rev3=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Sebastian Brzezinka" <sebastian.brzezinka@intel.com>
Cc: intel-gfx@lists.freedesktop.org
Date: Thu, 17 Sep 2026 12:09:37 -0000
Message-ID: <178964697762.177275.2128719962320439442@61270ab9df2a>
X-Patchwork-Hint: ignore
References: <20260821134044.15908-1-sebastian.brzezinka@intel.com>
In-Reply-To: <20260821134044.15908-1-sebastian.brzezinka@intel.com>
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

--===============2419053305186125962==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: drm/i915/selftests: Fix unlocked mm.stolen in reset selftest (rev3)
URL   : https://patchwork.freedesktop.org/series/172573/
State : failure

== Summary ==

CI Bug Log - changes from CI_DRM_19160 -> Patchwork_172573v3
====================================================

Summary
-------

  **FAILURE**

  Serious unknown changes coming with Patchwork_172573v3 absolutely need to be
  verified manually.
  
  If you think the reported changes have nothing to do with the changes
  introduced in Patchwork_172573v3, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them
  to document this new failure mode, which will reduce false positives in CI.

  External URL: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_172573v3/index.html

Participating hosts (39 -> 37)
------------------------------

  Missing    (2): bat-dg2-13 bat-adls-6 

Possible new issues
-------------------

  Here are the unknown changes that may have been introduced in Patchwork_172573v3:

### IGT changes ###

#### Possible regressions ####

  * igt@i915_selftest@live:
    - bat-arlh-3:         [PASS][1] -> [INCOMPLETE][2] +1 other test incomplete
   [1]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19160/bat-arlh-3/igt@i915_selftest@live.html
   [2]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_172573v3/bat-arlh-3/igt@i915_selftest@live.html

  


Build changes
-------------

  * Linux: CI_DRM_19160 -> Patchwork_172573v3

  CI-20190529: 20190529
  CI_DRM_19160: d709485448984efaa7ca726c5340ef088f930cac @ git://anongit.freedesktop.org/gfx-ci/linux
  IGT_9099: 9099
  Patchwork_172573v3: d709485448984efaa7ca726c5340ef088f930cac @ git://anongit.freedesktop.org/gfx-ci/linux

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_172573v3/index.html

--===============2419053305186125962==
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
<tr><td><b>Series:</b></td><td>drm/i915/selftests: Fix unlocked mm.stolen in reset selftest (rev3)</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/172573/">https://patchwork.freedesktop.org/series/172573/</a></td></tr>
<tr><td><b>State:</b></td><td>failure</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_172573v3/index.html">https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_172573v3/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from CI_DRM_19160 -&gt; Patchwork_172573v3</h1>
<h2>Summary</h2>
<p><strong>FAILURE</strong></p>
<p>Serious unknown changes coming with Patchwork_172573v3 absolutely need to be<br />
  verified manually.</p>
<p>If you think the reported changes have nothing to do with the changes<br />
  introduced in Patchwork_172573v3, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them<br />
  to document this new failure mode, which will reduce false positives in CI.</p>
<p>External URL: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_172573v3/index.html</p>
<h2>Participating hosts (39 -&gt; 37)</h2>
<p>Missing    (2): bat-dg2-13 bat-adls-6 </p>
<h2>Possible new issues</h2>
<p>Here are the unknown changes that may have been introduced in Patchwork_172573v3:</p>
<h3>IGT changes</h3>
<h4>Possible regressions</h4>
<ul>
<li>igt@i915_selftest@live:<ul>
<li>bat-arlh-3:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19160/bat-arlh-3/igt@i915_selftest@live.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_172573v3/bat-arlh-3/igt@i915_selftest@live.html">INCOMPLETE</a> +1 other test incomplete</li>
</ul>
</li>
</ul>
<h2>Build changes</h2>
<ul>
<li>Linux: CI_DRM_19160 -&gt; Patchwork_172573v3</li>
</ul>
<p>CI-20190529: 20190529<br />
  CI_DRM_19160: d709485448984efaa7ca726c5340ef088f930cac @ git://anongit.freedesktop.org/gfx-ci/linux<br />
  IGT_9099: 9099<br />
  Patchwork_172573v3: d709485448984efaa7ca726c5340ef088f930cac @ git://anongit.freedesktop.org/gfx-ci/linux</p>

</body>
</html>

--===============2419053305186125962==--
