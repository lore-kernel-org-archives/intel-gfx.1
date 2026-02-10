Return-Path: <intel-gfx-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9A35BEA811A
	for <intel-gfx@archiver.kernel.org>; Tue, 10 Feb 2026 14:04:04 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 30DAC10E591;
	Tue, 10 Feb 2026 14:04:04 +0000 (UTC)
Received: from a3b018990fe9 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AB29810E591;
 Tue, 10 Feb 2026 14:04:02 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============6425487646857349753=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=97_i915=2ECI=2EBAT=3A_failure_for_drm/i915/aux=3A_use_polli?=
 =?utf-8?q?ng_when_irqs_are_unavailable?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: =?utf-8?q?Micha=C5=82_Grzelak?= <michal.grzelak@intel.com>
Cc: intel-gfx@lists.freedesktop.org
Date: Tue, 10 Feb 2026 14:04:02 -0000
Message-ID: <177073224267.242671.17919448701488743817@a3b018990fe9>
X-Patchwork-Hint: ignore
References: <20260210111952.4138954-1-michal.grzelak@intel.com>
In-Reply-To: <20260210111952.4138954-1-michal.grzelak@intel.com>
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

--===============6425487646857349753==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: drm/i915/aux: use polling when irqs are unavailable
URL   : https://patchwork.freedesktop.org/series/161432/
State : failure

== Summary ==

CI Bug Log - changes from CI_DRM_17968 -> Patchwork_161432v1
====================================================

Summary
-------

  **FAILURE**

  Serious unknown changes coming with Patchwork_161432v1 absolutely need to be
  verified manually.
  
  If you think the reported changes have nothing to do with the changes
  introduced in Patchwork_161432v1, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them
  to document this new failure mode, which will reduce false positives in CI.

  External URL: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_161432v1/index.html

Participating hosts (43 -> 41)
------------------------------

  Missing    (2): bat-dg2-13 fi-snb-2520m 

Possible new issues
-------------------

  Here are the unknown changes that may have been introduced in Patchwork_161432v1:

### IGT changes ###

#### Possible regressions ####

  * igt@i915_selftest@live:
    - fi-bsw-n3050:       [PASS][1] -> [ABORT][2] +1 other test abort
   [1]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17968/fi-bsw-n3050/igt@i915_selftest@live.html
   [2]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_161432v1/fi-bsw-n3050/igt@i915_selftest@live.html

  
Known issues
------------

  Here are the changes found in Patchwork_161432v1 that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@i915_selftest@live@workarounds:
    - bat-dg2-14:         [PASS][3] -> [DMESG-FAIL][4] ([i915#12061]) +1 other test dmesg-fail
   [3]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17968/bat-dg2-14/igt@i915_selftest@live@workarounds.html
   [4]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_161432v1/bat-dg2-14/igt@i915_selftest@live@workarounds.html

  
#### Possible fixes ####

  * igt@i915_selftest@live:
    - bat-mtlp-8:         [DMESG-FAIL][5] ([i915#12061]) -> [PASS][6] +1 other test pass
   [5]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17968/bat-mtlp-8/igt@i915_selftest@live.html
   [6]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_161432v1/bat-mtlp-8/igt@i915_selftest@live.html

  * igt@i915_selftest@live@workarounds:
    - bat-mtlp-9:         [DMESG-FAIL][7] ([i915#12061]) -> [PASS][8] +1 other test pass
   [7]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17968/bat-mtlp-9/igt@i915_selftest@live@workarounds.html
   [8]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_161432v1/bat-mtlp-9/igt@i915_selftest@live@workarounds.html
    - bat-arls-6:         [DMESG-FAIL][9] ([i915#12061]) -> [PASS][10] +1 other test pass
   [9]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17968/bat-arls-6/igt@i915_selftest@live@workarounds.html
   [10]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_161432v1/bat-arls-6/igt@i915_selftest@live@workarounds.html

  
  [i915#12061]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12061


Build changes
-------------

  * Linux: CI_DRM_17968 -> Patchwork_161432v1

  CI-20190529: 20190529
  CI_DRM_17968: 5f16c3d1100e59f2fbaeb2724039cc3a948574bb @ git://anongit.freedesktop.org/gfx-ci/linux
  IGT_8746: 8746
  Patchwork_161432v1: 5f16c3d1100e59f2fbaeb2724039cc3a948574bb @ git://anongit.freedesktop.org/gfx-ci/linux

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_161432v1/index.html

--===============6425487646857349753==
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
<tr><td><b>Series:</b></td><td>drm/i915/aux: use polling when irqs are unavailable</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/161432/">https://patchwork.freedesktop.org/series/161432/</a></td></tr>
<tr><td><b>State:</b></td><td>failure</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_161432v1/index.html">https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_161432v1/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from CI_DRM_17968 -&gt; Patchwork_161432v1</h1>
<h2>Summary</h2>
<p><strong>FAILURE</strong></p>
<p>Serious unknown changes coming with Patchwork_161432v1 absolutely need to be<br />
  verified manually.</p>
<p>If you think the reported changes have nothing to do with the changes<br />
  introduced in Patchwork_161432v1, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them<br />
  to document this new failure mode, which will reduce false positives in CI.</p>
<p>External URL: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_161432v1/index.html</p>
<h2>Participating hosts (43 -&gt; 41)</h2>
<p>Missing    (2): bat-dg2-13 fi-snb-2520m </p>
<h2>Possible new issues</h2>
<p>Here are the unknown changes that may have been introduced in Patchwork_161432v1:</p>
<h3>IGT changes</h3>
<h4>Possible regressions</h4>
<ul>
<li>igt@i915_selftest@live:<ul>
<li>fi-bsw-n3050:       <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17968/fi-bsw-n3050/igt@i915_selftest@live.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_161432v1/fi-bsw-n3050/igt@i915_selftest@live.html">ABORT</a> +1 other test abort</li>
</ul>
</li>
</ul>
<h2>Known issues</h2>
<p>Here are the changes found in Patchwork_161432v1 that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>igt@i915_selftest@live@workarounds:<ul>
<li>bat-dg2-14:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17968/bat-dg2-14/igt@i915_selftest@live@workarounds.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_161432v1/bat-dg2-14/igt@i915_selftest@live@workarounds.html">DMESG-FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12061">i915#12061</a>) +1 other test dmesg-fail</li>
</ul>
</li>
</ul>
<h4>Possible fixes</h4>
<ul>
<li>
<p>igt@i915_selftest@live:</p>
<ul>
<li>bat-mtlp-8:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17968/bat-mtlp-8/igt@i915_selftest@live.html">DMESG-FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12061">i915#12061</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_161432v1/bat-mtlp-8/igt@i915_selftest@live.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@i915_selftest@live@workarounds:</p>
<ul>
<li>bat-mtlp-9:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17968/bat-mtlp-9/igt@i915_selftest@live@workarounds.html">DMESG-FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12061">i915#12061</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_161432v1/bat-mtlp-9/igt@i915_selftest@live@workarounds.html">PASS</a> +1 other test pass</li>
<li>bat-arls-6:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17968/bat-arls-6/igt@i915_selftest@live@workarounds.html">DMESG-FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12061">i915#12061</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_161432v1/bat-arls-6/igt@i915_selftest@live@workarounds.html">PASS</a> +1 other test pass</li>
</ul>
</li>
</ul>
<h2>Build changes</h2>
<ul>
<li>Linux: CI_DRM_17968 -&gt; Patchwork_161432v1</li>
</ul>
<p>CI-20190529: 20190529<br />
  CI_DRM_17968: 5f16c3d1100e59f2fbaeb2724039cc3a948574bb @ git://anongit.freedesktop.org/gfx-ci/linux<br />
  IGT_8746: 8746<br />
  Patchwork_161432v1: 5f16c3d1100e59f2fbaeb2724039cc3a948574bb @ git://anongit.freedesktop.org/gfx-ci/linux</p>

</body>
</html>

--===============6425487646857349753==--
