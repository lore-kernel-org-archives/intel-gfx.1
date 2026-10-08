Return-Path: <intel-gfx-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8A168CA6007
	for <intel-gfx@archiver.kernel.org>; Thu,  8 Oct 2026 05:08:34 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EC54F10E726;
	Thu,  8 Oct 2026 05:08:33 +0000 (UTC)
Received: from 61270ab9df2a (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 158AC10E726;
 Thu,  8 Oct 2026 05:08:33 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============4148025215155861375=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=93_i915=2ECI=2EBAT=3A_success_for_drm/i915/scaler=3A_Prune_?=
 =?utf-8?q?YUV420_modes_against_the_max_source_width_=28rev2=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Arun R Murthy" <arun.r.murthy@intel.com>
Cc: intel-gfx@lists.freedesktop.org
Date: Thu, 08 Oct 2026 05:08:33 -0000
Message-ID: <179143611307.250849.16355661065702186132@61270ab9df2a>
X-Patchwork-Hint: ignore
References: <20261008041809.3674538-1-arun.r.murthy@intel.com>
In-Reply-To: <20261008041809.3674538-1-arun.r.murthy@intel.com>
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

--===============4148025215155861375==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: drm/i915/scaler: Prune YUV420 modes against the max source width (rev2)
URL   : https://patchwork.freedesktop.org/series/175645/
State : success

== Summary ==

CI Bug Log - changes from CI_DRM_19297 -> Patchwork_175645v2
====================================================

Summary
-------

  **SUCCESS**

  No regressions found.

  External URL: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_175645v2/index.html

Participating hosts (39 -> 37)
------------------------------

  Missing    (2): bat-dg2-13 bat-adls-6 

Known issues
------------

  Here are the changes found in Patchwork_175645v2 that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@gem_lmem_swapping@parallel-random-engines:
    - bat-jsl-5:          NOTRUN -> [SKIP][1] ([i915#4613]) +3 other tests skip
   [1]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_175645v2/bat-jsl-5/igt@gem_lmem_swapping@parallel-random-engines.html

  * igt@kms_force_connector_basic@force-load-detect:
    - bat-jsl-5:          NOTRUN -> [SKIP][2]
   [2]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_175645v2/bat-jsl-5/igt@kms_force_connector_basic@force-load-detect.html

  * igt@kms_pm_backlight@basic-brightness:
    - bat-jsl-5:          NOTRUN -> [SKIP][3] ([i915#15205])
   [3]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_175645v2/bat-jsl-5/igt@kms_pm_backlight@basic-brightness.html

  * igt@kms_psr@psr-primary-page-flip:
    - bat-jsl-5:          NOTRUN -> [SKIP][4] ([i915#1072]) +3 other tests skip
   [4]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_175645v2/bat-jsl-5/igt@kms_psr@psr-primary-page-flip.html

  * igt@kms_setmode@basic-clone-single-crtc:
    - bat-jsl-5:          NOTRUN -> [SKIP][5] ([i915#3555])
   [5]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_175645v2/bat-jsl-5/igt@kms_setmode@basic-clone-single-crtc.html

  
#### Possible fixes ####

  * igt@kms_flip@basic-flip-vs-dpms@c-hdmi-a1:
    - bat-jsl-5:          [ABORT][6] ([i915#17262]) -> [PASS][7] +1 other test pass
   [6]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19297/bat-jsl-5/igt@kms_flip@basic-flip-vs-dpms@c-hdmi-a1.html
   [7]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_175645v2/bat-jsl-5/igt@kms_flip@basic-flip-vs-dpms@c-hdmi-a1.html

  
  [i915#1072]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/1072
  [i915#15205]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15205
  [i915#17262]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17262
  [i915#3555]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3555
  [i915#4613]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4613


Build changes
-------------

  * Linux: CI_DRM_19297 -> Patchwork_175645v2

  CI-20190529: 20190529
  CI_DRM_19297: facc562ab96d7b9fa3dec0528022e0009a5bf875 @ git://anongit.freedesktop.org/gfx-ci/linux
  IGT_9134: 23f88758399c4e526aab1db26f35208faea9816a @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
  Patchwork_175645v2: facc562ab96d7b9fa3dec0528022e0009a5bf875 @ git://anongit.freedesktop.org/gfx-ci/linux

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_175645v2/index.html

--===============4148025215155861375==
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
<tr><td><b>Series:</b></td><td>drm/i915/scaler: Prune YUV420 modes against the max source width (rev2)</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/175645/">https://patchwork.freedesktop.org/series/175645/</a></td></tr>
<tr><td><b>State:</b></td><td>success</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_175645v2/index.html">https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_175645v2/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from CI_DRM_19297 -&gt; Patchwork_175645v2</h1>
<h2>Summary</h2>
<p><strong>SUCCESS</strong></p>
<p>No regressions found.</p>
<p>External URL: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_175645v2/index.html</p>
<h2>Participating hosts (39 -&gt; 37)</h2>
<p>Missing    (2): bat-dg2-13 bat-adls-6 </p>
<h2>Known issues</h2>
<p>Here are the changes found in Patchwork_175645v2 that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>
<p>igt@gem_lmem_swapping@parallel-random-engines:</p>
<ul>
<li>bat-jsl-5:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_175645v2/bat-jsl-5/igt@gem_lmem_swapping@parallel-random-engines.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4613">i915#4613</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_force_connector_basic@force-load-detect:</p>
<ul>
<li>bat-jsl-5:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_175645v2/bat-jsl-5/igt@kms_force_connector_basic@force-load-detect.html">SKIP</a></li>
</ul>
</li>
<li>
<p>igt@kms_pm_backlight@basic-brightness:</p>
<ul>
<li>bat-jsl-5:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_175645v2/bat-jsl-5/igt@kms_pm_backlight@basic-brightness.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15205">i915#15205</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr@psr-primary-page-flip:</p>
<ul>
<li>bat-jsl-5:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_175645v2/bat-jsl-5/igt@kms_psr@psr-primary-page-flip.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/1072">i915#1072</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_setmode@basic-clone-single-crtc:</p>
<ul>
<li>bat-jsl-5:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_175645v2/bat-jsl-5/igt@kms_setmode@basic-clone-single-crtc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3555">i915#3555</a>)</li>
</ul>
</li>
</ul>
<h4>Possible fixes</h4>
<ul>
<li>igt@kms_flip@basic-flip-vs-dpms@c-hdmi-a1:<ul>
<li>bat-jsl-5:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19297/bat-jsl-5/igt@kms_flip@basic-flip-vs-dpms@c-hdmi-a1.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17262">i915#17262</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_175645v2/bat-jsl-5/igt@kms_flip@basic-flip-vs-dpms@c-hdmi-a1.html">PASS</a> +1 other test pass</li>
</ul>
</li>
</ul>
<h2>Build changes</h2>
<ul>
<li>Linux: CI_DRM_19297 -&gt; Patchwork_175645v2</li>
</ul>
<p>CI-20190529: 20190529<br />
  CI_DRM_19297: facc562ab96d7b9fa3dec0528022e0009a5bf875 @ git://anongit.freedesktop.org/gfx-ci/linux<br />
  IGT_9134: 23f88758399c4e526aab1db26f35208faea9816a @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git<br />
  Patchwork_175645v2: facc562ab96d7b9fa3dec0528022e0009a5bf875 @ git://anongit.freedesktop.org/gfx-ci/linux</p>

</body>
</html>

--===============4148025215155861375==--
