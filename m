Return-Path: <intel-gfx-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AFA5ECD6E79
	for <intel-gfx@archiver.kernel.org>; Tue,  9 Jun 2026 09:24:26 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3E9B410E1CC;
	Tue,  9 Jun 2026 09:24:26 +0000 (UTC)
Received: from 6beec6c84f66 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0297010E1CC;
 Tue,  9 Jun 2026 09:24:25 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============2322022685769280074=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=97_i915=2ECI=2EBAT=3A_failure_for_drm/i915/display=3A_harde?=
 =?utf-8?q?n_some_bit-shifting_operations_=28rev5=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Luca Coelho" <luciano.coelho@intel.com>
Cc: intel-gfx@lists.freedesktop.org
Date: Tue, 09 Jun 2026 09:24:25 -0000
Message-ID: <178099706500.58706.14793849621789558330@6beec6c84f66>
X-Patchwork-Hint: ignore
References: <20260609082040.524725-1-luciano.coelho@intel.com>
In-Reply-To: <20260609082040.524725-1-luciano.coelho@intel.com>
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

--===============2322022685769280074==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: drm/i915/display: harden some bit-shifting operations (rev5)
URL   : https://patchwork.freedesktop.org/series/166863/
State : failure

== Summary ==

CI Bug Log - changes from CI_DRM_18647 -> Patchwork_166863v5
====================================================

Summary
-------

  **FAILURE**

  Serious unknown changes coming with Patchwork_166863v5 absolutely need to be
  verified manually.
  
  If you think the reported changes have nothing to do with the changes
  introduced in Patchwork_166863v5, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them
  to document this new failure mode, which will reduce false positives in CI.

  External URL: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_166863v5/index.html

Participating hosts (42 -> 40)
------------------------------

  Missing    (2): bat-dg2-13 fi-snb-2520m 

Possible new issues
-------------------

  Here are the unknown changes that may have been introduced in Patchwork_166863v5:

### IGT changes ###

#### Possible regressions ####

  * igt@i915_module_load@load:
    - bat-twl-1:          [PASS][1] -> [ABORT][2]
   [1]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18647/bat-twl-1/igt@i915_module_load@load.html
   [2]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_166863v5/bat-twl-1/igt@i915_module_load@load.html
    - bat-rplp-1:         [PASS][3] -> [ABORT][4]
   [3]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18647/bat-rplp-1/igt@i915_module_load@load.html
   [4]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_166863v5/bat-rplp-1/igt@i915_module_load@load.html
    - bat-adlp-6:         [PASS][5] -> [ABORT][6]
   [5]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18647/bat-adlp-6/igt@i915_module_load@load.html
   [6]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_166863v5/bat-adlp-6/igt@i915_module_load@load.html
    - bat-twl-2:          [PASS][7] -> [ABORT][8]
   [7]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18647/bat-twl-2/igt@i915_module_load@load.html
   [8]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_166863v5/bat-twl-2/igt@i915_module_load@load.html
    - bat-dg2-14:         [PASS][9] -> [ABORT][10]
   [9]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18647/bat-dg2-14/igt@i915_module_load@load.html
   [10]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_166863v5/bat-dg2-14/igt@i915_module_load@load.html

  * igt@kms_force_connector_basic@force-connector-state:
    - fi-rkl-11600:       [PASS][11] -> [ABORT][12]
   [11]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18647/fi-rkl-11600/igt@kms_force_connector_basic@force-connector-state.html
   [12]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_166863v5/fi-rkl-11600/igt@kms_force_connector_basic@force-connector-state.html

  * igt@kms_force_connector_basic@force-edid:
    - bat-adlp-9:         [PASS][13] -> [ABORT][14]
   [13]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18647/bat-adlp-9/igt@kms_force_connector_basic@force-edid.html
   [14]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_166863v5/bat-adlp-9/igt@kms_force_connector_basic@force-edid.html

  * igt@kms_hdmi_inject@inject-audio:
    - bat-mtlp-9:         [PASS][15] -> [ABORT][16]
   [15]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18647/bat-mtlp-9/igt@kms_hdmi_inject@inject-audio.html
   [16]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_166863v5/bat-mtlp-9/igt@kms_hdmi_inject@inject-audio.html
    - bat-mtlp-8:         [PASS][17] -> [ABORT][18]
   [17]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18647/bat-mtlp-8/igt@kms_hdmi_inject@inject-audio.html
   [18]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_166863v5/bat-mtlp-8/igt@kms_hdmi_inject@inject-audio.html
    - bat-dg2-8:          [PASS][19] -> [ABORT][20]
   [19]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18647/bat-dg2-8/igt@kms_hdmi_inject@inject-audio.html
   [20]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_166863v5/bat-dg2-8/igt@kms_hdmi_inject@inject-audio.html
    - bat-arlh-3:         [PASS][21] -> [ABORT][22]
   [21]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18647/bat-arlh-3/igt@kms_hdmi_inject@inject-audio.html
   [22]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_166863v5/bat-arlh-3/igt@kms_hdmi_inject@inject-audio.html
    - bat-dg2-9:          [PASS][23] -> [ABORT][24]
   [23]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18647/bat-dg2-9/igt@kms_hdmi_inject@inject-audio.html
   [24]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_166863v5/bat-dg2-9/igt@kms_hdmi_inject@inject-audio.html

  
Known issues
------------

  Here are the changes found in Patchwork_166863v5 that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@kms_hdmi_inject@inject-audio:
    - fi-tgl-1115g4:      [PASS][25] -> [FAIL][26] ([i915#16115])
   [25]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18647/fi-tgl-1115g4/igt@kms_hdmi_inject@inject-audio.html
   [26]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_166863v5/fi-tgl-1115g4/igt@kms_hdmi_inject@inject-audio.html

  
  [i915#16115]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16115


Build changes
-------------

  * Linux: CI_DRM_18647 -> Patchwork_166863v5

  CI-20190529: 20190529
  CI_DRM_18647: e591d473e392997b89c9ab9598bfe027c59ac21c @ git://anongit.freedesktop.org/gfx-ci/linux
  IGT_8954: 8954
  Patchwork_166863v5: e591d473e392997b89c9ab9598bfe027c59ac21c @ git://anongit.freedesktop.org/gfx-ci/linux

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_166863v5/index.html

--===============2322022685769280074==
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
<tr><td><b>Series:</b></td><td>drm/i915/display: harden some bit-shifting operations (rev5)</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/166863/">https://patchwork.freedesktop.org/series/166863/</a></td></tr>
<tr><td><b>State:</b></td><td>failure</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_166863v5/index.html">https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_166863v5/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from CI_DRM_18647 -&gt; Patchwork_166863v5</h1>
<h2>Summary</h2>
<p><strong>FAILURE</strong></p>
<p>Serious unknown changes coming with Patchwork_166863v5 absolutely need to be<br />
  verified manually.</p>
<p>If you think the reported changes have nothing to do with the changes<br />
  introduced in Patchwork_166863v5, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them<br />
  to document this new failure mode, which will reduce false positives in CI.</p>
<p>External URL: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_166863v5/index.html</p>
<h2>Participating hosts (42 -&gt; 40)</h2>
<p>Missing    (2): bat-dg2-13 fi-snb-2520m </p>
<h2>Possible new issues</h2>
<p>Here are the unknown changes that may have been introduced in Patchwork_166863v5:</p>
<h3>IGT changes</h3>
<h4>Possible regressions</h4>
<ul>
<li>
<p>igt@i915_module_load@load:</p>
<ul>
<li>bat-twl-1:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18647/bat-twl-1/igt@i915_module_load@load.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_166863v5/bat-twl-1/igt@i915_module_load@load.html">ABORT</a></li>
<li>bat-rplp-1:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18647/bat-rplp-1/igt@i915_module_load@load.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_166863v5/bat-rplp-1/igt@i915_module_load@load.html">ABORT</a></li>
<li>bat-adlp-6:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18647/bat-adlp-6/igt@i915_module_load@load.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_166863v5/bat-adlp-6/igt@i915_module_load@load.html">ABORT</a></li>
<li>bat-twl-2:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18647/bat-twl-2/igt@i915_module_load@load.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_166863v5/bat-twl-2/igt@i915_module_load@load.html">ABORT</a></li>
<li>bat-dg2-14:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18647/bat-dg2-14/igt@i915_module_load@load.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_166863v5/bat-dg2-14/igt@i915_module_load@load.html">ABORT</a></li>
</ul>
</li>
<li>
<p>igt@kms_force_connector_basic@force-connector-state:</p>
<ul>
<li>fi-rkl-11600:       <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18647/fi-rkl-11600/igt@kms_force_connector_basic@force-connector-state.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_166863v5/fi-rkl-11600/igt@kms_force_connector_basic@force-connector-state.html">ABORT</a></li>
</ul>
</li>
<li>
<p>igt@kms_force_connector_basic@force-edid:</p>
<ul>
<li>bat-adlp-9:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18647/bat-adlp-9/igt@kms_force_connector_basic@force-edid.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_166863v5/bat-adlp-9/igt@kms_force_connector_basic@force-edid.html">ABORT</a></li>
</ul>
</li>
<li>
<p>igt@kms_hdmi_inject@inject-audio:</p>
<ul>
<li>bat-mtlp-9:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18647/bat-mtlp-9/igt@kms_hdmi_inject@inject-audio.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_166863v5/bat-mtlp-9/igt@kms_hdmi_inject@inject-audio.html">ABORT</a></li>
<li>bat-mtlp-8:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18647/bat-mtlp-8/igt@kms_hdmi_inject@inject-audio.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_166863v5/bat-mtlp-8/igt@kms_hdmi_inject@inject-audio.html">ABORT</a></li>
<li>bat-dg2-8:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18647/bat-dg2-8/igt@kms_hdmi_inject@inject-audio.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_166863v5/bat-dg2-8/igt@kms_hdmi_inject@inject-audio.html">ABORT</a></li>
<li>bat-arlh-3:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18647/bat-arlh-3/igt@kms_hdmi_inject@inject-audio.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_166863v5/bat-arlh-3/igt@kms_hdmi_inject@inject-audio.html">ABORT</a></li>
<li>bat-dg2-9:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18647/bat-dg2-9/igt@kms_hdmi_inject@inject-audio.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_166863v5/bat-dg2-9/igt@kms_hdmi_inject@inject-audio.html">ABORT</a></li>
</ul>
</li>
</ul>
<h2>Known issues</h2>
<p>Here are the changes found in Patchwork_166863v5 that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>igt@kms_hdmi_inject@inject-audio:<ul>
<li>fi-tgl-1115g4:      <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18647/fi-tgl-1115g4/igt@kms_hdmi_inject@inject-audio.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_166863v5/fi-tgl-1115g4/igt@kms_hdmi_inject@inject-audio.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16115">i915#16115</a>)</li>
</ul>
</li>
</ul>
<h2>Build changes</h2>
<ul>
<li>Linux: CI_DRM_18647 -&gt; Patchwork_166863v5</li>
</ul>
<p>CI-20190529: 20190529<br />
  CI_DRM_18647: e591d473e392997b89c9ab9598bfe027c59ac21c @ git://anongit.freedesktop.org/gfx-ci/linux<br />
  IGT_8954: 8954<br />
  Patchwork_166863v5: e591d473e392997b89c9ab9598bfe027c59ac21c @ git://anongit.freedesktop.org/gfx-ci/linux</p>

</body>
</html>

--===============2322022685769280074==--
