Return-Path: <intel-gfx-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C0BFCC43458
	for <intel-gfx@archiver.kernel.org>; Wed,  1 Jul 2026 20:34:15 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3602C10F010;
	Wed,  1 Jul 2026 20:34:15 +0000 (UTC)
Received: from 6beec6c84f66 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 37B4310E1ED;
 Wed,  1 Jul 2026 20:34:14 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============6271220977777631968=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=97_i915=2ECI=2EBAT=3A_failure_for_drm/i915/display=3A_Enabl?=
 =?utf-8?q?e_HDR_over_DP_MST_=28rev2=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Gil Dekel" <gildekel@google.com>
Cc: intel-gfx@lists.freedesktop.org
Date: Wed, 01 Jul 2026 20:34:14 -0000
Message-ID: <178293805420.139541.5618081894201602876@6beec6c84f66>
X-Patchwork-Hint: ignore
References: <20260626214513.179943-1-gildekel@google.com>
In-Reply-To: <20260626214513.179943-1-gildekel@google.com>
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

--===============6271220977777631968==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: drm/i915/display: Enable HDR over DP MST (rev2)
URL   : https://patchwork.freedesktop.org/series/169609/
State : failure

== Summary ==

CI Bug Log - changes from CI_DRM_18745 -> Patchwork_169609v2
====================================================

Summary
-------

  **FAILURE**

  Serious unknown changes coming with Patchwork_169609v2 absolutely need to be
  verified manually.
  
  If you think the reported changes have nothing to do with the changes
  introduced in Patchwork_169609v2, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them
  to document this new failure mode, which will reduce false positives in CI.

  External URL: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_169609v2/index.html

Participating hosts (42 -> 40)
------------------------------

  Missing    (2): bat-dg2-13 fi-snb-2520m 

Possible new issues
-------------------

  Here are the unknown changes that may have been introduced in Patchwork_169609v2:

### IGT changes ###

#### Possible regressions ####

  * igt@i915_module_load@load:
    - bat-mtlp-9:         [PASS][1] -> [ABORT][2]
   [1]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18745/bat-mtlp-9/igt@i915_module_load@load.html
   [2]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_169609v2/bat-mtlp-9/igt@i915_module_load@load.html

  * igt@i915_selftest@live:
    - fi-bsw-n3050:       [PASS][3] -> [ABORT][4] +1 other test abort
   [3]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18745/fi-bsw-n3050/igt@i915_selftest@live.html
   [4]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_169609v2/fi-bsw-n3050/igt@i915_selftest@live.html

  
Known issues
------------

  Here are the changes found in Patchwork_169609v2 that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@kms_hdmi_inject@inject-audio:
    - fi-tgl-1115g4:      [PASS][5] -> [FAIL][6] ([i915#16115])
   [5]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18745/fi-tgl-1115g4/igt@kms_hdmi_inject@inject-audio.html
   [6]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_169609v2/fi-tgl-1115g4/igt@kms_hdmi_inject@inject-audio.html

  
#### Possible fixes ####

  * igt@i915_module_load@load:
    - fi-bsw-n3050:       [DMESG-WARN][7] ([i915#16057]) -> [PASS][8]
   [7]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18745/fi-bsw-n3050/igt@i915_module_load@load.html
   [8]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_169609v2/fi-bsw-n3050/igt@i915_module_load@load.html

  
  [i915#16057]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16057
  [i915#16115]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16115


Build changes
-------------

  * Linux: CI_DRM_18745 -> Patchwork_169609v2

  CI-20190529: 20190529
  CI_DRM_18745: 0cafeac0ca1baa5846a52337c6b7cd94f830da72 @ git://anongit.freedesktop.org/gfx-ci/linux
  IGT_8989: a8e2cbd2854d7980a9eccecc6e0c801d0824b88f @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
  Patchwork_169609v2: 0cafeac0ca1baa5846a52337c6b7cd94f830da72 @ git://anongit.freedesktop.org/gfx-ci/linux

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_169609v2/index.html

--===============6271220977777631968==
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
<tr><td><b>Series:</b></td><td>drm/i915/display: Enable HDR over DP MST (rev2)</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/169609/">https://patchwork.freedesktop.org/series/169609/</a></td></tr>
<tr><td><b>State:</b></td><td>failure</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_169609v2/index.html">https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_169609v2/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from CI_DRM_18745 -&gt; Patchwork_169609v2</h1>
<h2>Summary</h2>
<p><strong>FAILURE</strong></p>
<p>Serious unknown changes coming with Patchwork_169609v2 absolutely need to be<br />
  verified manually.</p>
<p>If you think the reported changes have nothing to do with the changes<br />
  introduced in Patchwork_169609v2, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them<br />
  to document this new failure mode, which will reduce false positives in CI.</p>
<p>External URL: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_169609v2/index.html</p>
<h2>Participating hosts (42 -&gt; 40)</h2>
<p>Missing    (2): bat-dg2-13 fi-snb-2520m </p>
<h2>Possible new issues</h2>
<p>Here are the unknown changes that may have been introduced in Patchwork_169609v2:</p>
<h3>IGT changes</h3>
<h4>Possible regressions</h4>
<ul>
<li>
<p>igt@i915_module_load@load:</p>
<ul>
<li>bat-mtlp-9:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18745/bat-mtlp-9/igt@i915_module_load@load.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_169609v2/bat-mtlp-9/igt@i915_module_load@load.html">ABORT</a></li>
</ul>
</li>
<li>
<p>igt@i915_selftest@live:</p>
<ul>
<li>fi-bsw-n3050:       <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18745/fi-bsw-n3050/igt@i915_selftest@live.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_169609v2/fi-bsw-n3050/igt@i915_selftest@live.html">ABORT</a> +1 other test abort</li>
</ul>
</li>
</ul>
<h2>Known issues</h2>
<p>Here are the changes found in Patchwork_169609v2 that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>igt@kms_hdmi_inject@inject-audio:<ul>
<li>fi-tgl-1115g4:      <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18745/fi-tgl-1115g4/igt@kms_hdmi_inject@inject-audio.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_169609v2/fi-tgl-1115g4/igt@kms_hdmi_inject@inject-audio.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16115">i915#16115</a>)</li>
</ul>
</li>
</ul>
<h4>Possible fixes</h4>
<ul>
<li>igt@i915_module_load@load:<ul>
<li>fi-bsw-n3050:       <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18745/fi-bsw-n3050/igt@i915_module_load@load.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16057">i915#16057</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_169609v2/fi-bsw-n3050/igt@i915_module_load@load.html">PASS</a></li>
</ul>
</li>
</ul>
<h2>Build changes</h2>
<ul>
<li>Linux: CI_DRM_18745 -&gt; Patchwork_169609v2</li>
</ul>
<p>CI-20190529: 20190529<br />
  CI_DRM_18745: 0cafeac0ca1baa5846a52337c6b7cd94f830da72 @ git://anongit.freedesktop.org/gfx-ci/linux<br />
  IGT_8989: a8e2cbd2854d7980a9eccecc6e0c801d0824b88f @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git<br />
  Patchwork_169609v2: 0cafeac0ca1baa5846a52337c6b7cd94f830da72 @ git://anongit.freedesktop.org/gfx-ci/linux</p>

</body>
</html>

--===============6271220977777631968==--
