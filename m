Return-Path: <intel-gfx-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A43EBC4450A
	for <intel-gfx@archiver.kernel.org>; Thu, 16 Jul 2026 12:47:21 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2992B10E0A9;
	Thu, 16 Jul 2026 12:47:21 +0000 (UTC)
Received: from 6beec6c84f66 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1E05F10E0A9;
 Thu, 16 Jul 2026 12:47:20 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============8934427079648712359=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=97_i915=2ECI=2EBAT=3A_failure_for_DRM_device_registration_f?=
 =?utf-8?q?ixes?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Krzysztof Niemiec" <krzysztof.niemiec@intel.com>
Cc: intel-gfx@lists.freedesktop.org
Date: Thu, 16 Jul 2026 12:47:20 -0000
Message-ID: <178420604011.197118.5778777853811014003@6beec6c84f66>
X-Patchwork-Hint: ignore
References: <20260716120018.20406-2-krzysztof.niemiec@intel.com>
In-Reply-To: <20260716120018.20406-2-krzysztof.niemiec@intel.com>
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

--===============8934427079648712359==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: DRM device registration fixes
URL   : https://patchwork.freedesktop.org/series/170568/
State : failure

== Summary ==

CI Bug Log - changes from CI_DRM_18835 -> Patchwork_170568v1
====================================================

Summary
-------

  **FAILURE**

  Serious unknown changes coming with Patchwork_170568v1 absolutely need to be
  verified manually.
  
  If you think the reported changes have nothing to do with the changes
  introduced in Patchwork_170568v1, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them
  to document this new failure mode, which will reduce false positives in CI.

  External URL: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_170568v1/index.html

Participating hosts (42 -> 39)
------------------------------

  Missing    (3): bat-dg2-13 bat-mtlp-9 fi-snb-2520m 

Possible new issues
-------------------

  Here are the unknown changes that may have been introduced in Patchwork_170568v1:

### IGT changes ###

#### Possible regressions ####

  * igt@i915_selftest@live:
    - bat-apl-1:          [PASS][1] -> [ABORT][2] +1 other test abort
   [1]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18835/bat-apl-1/igt@i915_selftest@live.html
   [2]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_170568v1/bat-apl-1/igt@i915_selftest@live.html

  
Known issues
------------

  Here are the changes found in Patchwork_170568v1 that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@core_debugfs@read-all-entries:
    - bat-adlp-6:         [PASS][3] -> [DMESG-WARN][4] ([i915#15673])
   [3]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18835/bat-adlp-6/igt@core_debugfs@read-all-entries.html
   [4]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_170568v1/bat-adlp-6/igt@core_debugfs@read-all-entries.html

  
#### Possible fixes ####

  * igt@core_auth@basic-auth:
    - bat-adlp-6:         [DMESG-WARN][5] ([i915#15673]) -> [PASS][6]
   [5]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18835/bat-adlp-6/igt@core_auth@basic-auth.html
   [6]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_170568v1/bat-adlp-6/igt@core_auth@basic-auth.html

  
  [i915#15673]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15673


Build changes
-------------

  * Linux: CI_DRM_18835 -> Patchwork_170568v1

  CI-20190529: 20190529
  CI_DRM_18835: fcaba3bc017906059b910ece3f83185e93010581 @ git://anongit.freedesktop.org/gfx-ci/linux
  IGT_9007: 9007
  Patchwork_170568v1: fcaba3bc017906059b910ece3f83185e93010581 @ git://anongit.freedesktop.org/gfx-ci/linux

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_170568v1/index.html

--===============8934427079648712359==
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
<tr><td><b>Series:</b></td><td>DRM device registration fixes</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/170568/">https://patchwork.freedesktop.org/series/170568/</a></td></tr>
<tr><td><b>State:</b></td><td>failure</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_170568v1/index.html">https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_170568v1/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from CI_DRM_18835 -&gt; Patchwork_170568v1</h1>
<h2>Summary</h2>
<p><strong>FAILURE</strong></p>
<p>Serious unknown changes coming with Patchwork_170568v1 absolutely need to be<br />
  verified manually.</p>
<p>If you think the reported changes have nothing to do with the changes<br />
  introduced in Patchwork_170568v1, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them<br />
  to document this new failure mode, which will reduce false positives in CI.</p>
<p>External URL: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_170568v1/index.html</p>
<h2>Participating hosts (42 -&gt; 39)</h2>
<p>Missing    (3): bat-dg2-13 bat-mtlp-9 fi-snb-2520m </p>
<h2>Possible new issues</h2>
<p>Here are the unknown changes that may have been introduced in Patchwork_170568v1:</p>
<h3>IGT changes</h3>
<h4>Possible regressions</h4>
<ul>
<li>igt@i915_selftest@live:<ul>
<li>bat-apl-1:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18835/bat-apl-1/igt@i915_selftest@live.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_170568v1/bat-apl-1/igt@i915_selftest@live.html">ABORT</a> +1 other test abort</li>
</ul>
</li>
</ul>
<h2>Known issues</h2>
<p>Here are the changes found in Patchwork_170568v1 that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>igt@core_debugfs@read-all-entries:<ul>
<li>bat-adlp-6:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18835/bat-adlp-6/igt@core_debugfs@read-all-entries.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_170568v1/bat-adlp-6/igt@core_debugfs@read-all-entries.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15673">i915#15673</a>)</li>
</ul>
</li>
</ul>
<h4>Possible fixes</h4>
<ul>
<li>igt@core_auth@basic-auth:<ul>
<li>bat-adlp-6:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18835/bat-adlp-6/igt@core_auth@basic-auth.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15673">i915#15673</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_170568v1/bat-adlp-6/igt@core_auth@basic-auth.html">PASS</a></li>
</ul>
</li>
</ul>
<h2>Build changes</h2>
<ul>
<li>Linux: CI_DRM_18835 -&gt; Patchwork_170568v1</li>
</ul>
<p>CI-20190529: 20190529<br />
  CI_DRM_18835: fcaba3bc017906059b910ece3f83185e93010581 @ git://anongit.freedesktop.org/gfx-ci/linux<br />
  IGT_9007: 9007<br />
  Patchwork_170568v1: fcaba3bc017906059b910ece3f83185e93010581 @ git://anongit.freedesktop.org/gfx-ci/linux</p>

</body>
</html>

--===============8934427079648712359==--
