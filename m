Return-Path: <intel-gfx-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DA8CFC61DD3
	for <intel-gfx@archiver.kernel.org>; Wed,  2 Sep 2026 02:42:35 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 619B010E458;
	Wed,  2 Sep 2026 02:42:35 +0000 (UTC)
Received: from 61270ab9df2a (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7D38110E458;
 Wed,  2 Sep 2026 02:42:33 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============5206990721724204336=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=97_i915=2ECI=2EBAT=3A_failure_for_drm/i915/display=3A_Enabl?=
 =?utf-8?q?e_VRR/HDR_over_MST_=28rev2=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Xiao Lu" <xiaolu.xie@intel.com>
Cc: intel-gfx@lists.freedesktop.org
Date: Wed, 02 Sep 2026 02:42:33 -0000
Message-ID: <178831695350.109472.5417764058253988953@61270ab9df2a>
X-Patchwork-Hint: ignore
References: <20260901132601.239131-1-xiaolu.xie@intel.com>
In-Reply-To: <20260901132601.239131-1-xiaolu.xie@intel.com>
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

--===============5206990721724204336==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: drm/i915/display: Enable VRR/HDR over MST (rev2)
URL   : https://patchwork.freedesktop.org/series/173155/
State : failure

== Summary ==

CI Bug Log - changes from CI_DRM_19069 -> Patchwork_173155v2
====================================================

Summary
-------

  **FAILURE**

  Serious unknown changes coming with Patchwork_173155v2 absolutely need to be
  verified manually.
  
  If you think the reported changes have nothing to do with the changes
  introduced in Patchwork_173155v2, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them
  to document this new failure mode, which will reduce false positives in CI.

  External URL: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_173155v2/index.html

Participating hosts (37 -> 35)
------------------------------

  Missing    (2): bat-dg2-13 fi-glk-j4005 

Possible new issues
-------------------

  Here are the unknown changes that may have been introduced in Patchwork_173155v2:

### IGT changes ###

#### Possible regressions ####

  * igt@i915_module_load@load:
    - bat-mtlp-9:         [PASS][1] -> [ABORT][2]
   [1]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19069/bat-mtlp-9/igt@i915_module_load@load.html
   [2]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_173155v2/bat-mtlp-9/igt@i915_module_load@load.html

  
Known issues
------------

  Here are the changes found in Patchwork_173155v2 that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@kms_flip@basic-flip-vs-dpms@c-hdmi-a1:
    - fi-tgl-1115g4:      [PASS][3] -> [ABORT][4] ([i915#16876]) +1 other test abort
   [3]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19069/fi-tgl-1115g4/igt@kms_flip@basic-flip-vs-dpms@c-hdmi-a1.html
   [4]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_173155v2/fi-tgl-1115g4/igt@kms_flip@basic-flip-vs-dpms@c-hdmi-a1.html

  
#### Possible fixes ####

  * igt@kms_pm_rpm@basic-pci-d3-state:
    - fi-kbl-7567u:       [DMESG-WARN][5] ([i915#15673]) -> [PASS][6] +51 other tests pass
   [5]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19069/fi-kbl-7567u/igt@kms_pm_rpm@basic-pci-d3-state.html
   [6]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_173155v2/fi-kbl-7567u/igt@kms_pm_rpm@basic-pci-d3-state.html

  
  [i915#15673]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15673
  [i915#16876]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16876


Build changes
-------------

  * Linux: CI_DRM_19069 -> Patchwork_173155v2

  CI-20190529: 20190529
  CI_DRM_19069: c53467440a5196138d2d6610e269a43b6b47bf6b @ git://anongit.freedesktop.org/gfx-ci/linux
  IGT_9079: 9079
  Patchwork_173155v2: c53467440a5196138d2d6610e269a43b6b47bf6b @ git://anongit.freedesktop.org/gfx-ci/linux

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_173155v2/index.html

--===============5206990721724204336==
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
<tr><td><b>Series:</b></td><td>drm/i915/display: Enable VRR/HDR over MST (rev2)</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/173155/">https://patchwork.freedesktop.org/series/173155/</a></td></tr>
<tr><td><b>State:</b></td><td>failure</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_173155v2/index.html">https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_173155v2/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from CI_DRM_19069 -&gt; Patchwork_173155v2</h1>
<h2>Summary</h2>
<p><strong>FAILURE</strong></p>
<p>Serious unknown changes coming with Patchwork_173155v2 absolutely need to be<br />
  verified manually.</p>
<p>If you think the reported changes have nothing to do with the changes<br />
  introduced in Patchwork_173155v2, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them<br />
  to document this new failure mode, which will reduce false positives in CI.</p>
<p>External URL: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_173155v2/index.html</p>
<h2>Participating hosts (37 -&gt; 35)</h2>
<p>Missing    (2): bat-dg2-13 fi-glk-j4005 </p>
<h2>Possible new issues</h2>
<p>Here are the unknown changes that may have been introduced in Patchwork_173155v2:</p>
<h3>IGT changes</h3>
<h4>Possible regressions</h4>
<ul>
<li>igt@i915_module_load@load:<ul>
<li>bat-mtlp-9:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19069/bat-mtlp-9/igt@i915_module_load@load.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_173155v2/bat-mtlp-9/igt@i915_module_load@load.html">ABORT</a></li>
</ul>
</li>
</ul>
<h2>Known issues</h2>
<p>Here are the changes found in Patchwork_173155v2 that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>igt@kms_flip@basic-flip-vs-dpms@c-hdmi-a1:<ul>
<li>fi-tgl-1115g4:      <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19069/fi-tgl-1115g4/igt@kms_flip@basic-flip-vs-dpms@c-hdmi-a1.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_173155v2/fi-tgl-1115g4/igt@kms_flip@basic-flip-vs-dpms@c-hdmi-a1.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16876">i915#16876</a>) +1 other test abort</li>
</ul>
</li>
</ul>
<h4>Possible fixes</h4>
<ul>
<li>igt@kms_pm_rpm@basic-pci-d3-state:<ul>
<li>fi-kbl-7567u:       <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19069/fi-kbl-7567u/igt@kms_pm_rpm@basic-pci-d3-state.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15673">i915#15673</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_173155v2/fi-kbl-7567u/igt@kms_pm_rpm@basic-pci-d3-state.html">PASS</a> +51 other tests pass</li>
</ul>
</li>
</ul>
<h2>Build changes</h2>
<ul>
<li>Linux: CI_DRM_19069 -&gt; Patchwork_173155v2</li>
</ul>
<p>CI-20190529: 20190529<br />
  CI_DRM_19069: c53467440a5196138d2d6610e269a43b6b47bf6b @ git://anongit.freedesktop.org/gfx-ci/linux<br />
  IGT_9079: 9079<br />
  Patchwork_173155v2: c53467440a5196138d2d6610e269a43b6b47bf6b @ git://anongit.freedesktop.org/gfx-ci/linux</p>

</body>
</html>

--===============5206990721724204336==--
