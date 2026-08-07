Return-Path: <intel-gfx-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B4E8AC2A09B
	for <intel-gfx@archiver.kernel.org>; Fri,  7 Aug 2026 15:10:03 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0CC5610F510;
	Fri,  7 Aug 2026 15:10:03 +0000 (UTC)
Received: from 61270ab9df2a (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AD66710E261;
 Fri,  7 Aug 2026 15:10:01 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============0694719496773862775=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=97_i915=2ECI=2EBAT=3A_failure_for_series_starting_with_=5B1?=
 =?utf-8?q?/1=5D_drm/i915/dmabuf=3A_avoid_global_wbinvd_on_dma-buf_import?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Prabhakaran, Krishna" <krishna.prabhakaran@intel.com>
Cc: intel-gfx@lists.freedesktop.org
Date: Fri, 07 Aug 2026 15:10:01 -0000
Message-ID: <178611540168.29544.4106735914196212597@61270ab9df2a>
X-Patchwork-Hint: ignore
References: <20260807043326.556767-1-krishna.prabhakaran@intel.com>
In-Reply-To: <20260807043326.556767-1-krishna.prabhakaran@intel.com>
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

--===============0694719496773862775==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: series starting with [1/1] drm/i915/dmabuf: avoid global wbinvd on dma-buf import
URL   : https://patchwork.freedesktop.org/series/171760/
State : failure

== Summary ==

CI Bug Log - changes from CI_DRM_18962 -> Patchwork_171760v1
====================================================

Summary
-------

  **FAILURE**

  Serious unknown changes coming with Patchwork_171760v1 absolutely need to be
  verified manually.
  
  If you think the reported changes have nothing to do with the changes
  introduced in Patchwork_171760v1, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them
  to document this new failure mode, which will reduce false positives in CI.

  External URL: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_171760v1/index.html

Participating hosts (40 -> 36)
------------------------------

  Missing    (4): bat-dg2-13 bat-dg2-9 fi-snb-2520m bat-adls-6 

Possible new issues
-------------------

  Here are the unknown changes that may have been introduced in Patchwork_171760v1:

### IGT changes ###

#### Possible regressions ####

  * igt@i915_selftest@live:
    - bat-mtlp-8:         [PASS][1] -> [DMESG-FAIL][2] +1 other test dmesg-fail
   [1]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18962/bat-mtlp-8/igt@i915_selftest@live.html
   [2]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_171760v1/bat-mtlp-8/igt@i915_selftest@live.html
    - fi-elk-e7500:       [PASS][3] -> [DMESG-FAIL][4] +1 other test dmesg-fail
   [3]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18962/fi-elk-e7500/igt@i915_selftest@live.html
   [4]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_171760v1/fi-elk-e7500/igt@i915_selftest@live.html
    - fi-bsw-n3050:       [PASS][5] -> [DMESG-FAIL][6] +1 other test dmesg-fail
   [5]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18962/fi-bsw-n3050/igt@i915_selftest@live.html
   [6]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_171760v1/fi-bsw-n3050/igt@i915_selftest@live.html
    - bat-arlh-3:         [PASS][7] -> [DMESG-FAIL][8] +1 other test dmesg-fail
   [7]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18962/bat-arlh-3/igt@i915_selftest@live.html
   [8]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_171760v1/bat-arlh-3/igt@i915_selftest@live.html
    - fi-pnv-d510:        [PASS][9] -> [DMESG-FAIL][10] +1 other test dmesg-fail
   [9]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18962/fi-pnv-d510/igt@i915_selftest@live.html
   [10]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_171760v1/fi-pnv-d510/igt@i915_selftest@live.html
    - bat-apl-1:          [PASS][11] -> [DMESG-FAIL][12] +1 other test dmesg-fail
   [11]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18962/bat-apl-1/igt@i915_selftest@live.html
   [12]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_171760v1/bat-apl-1/igt@i915_selftest@live.html
    - bat-arlh-2:         [PASS][13] -> [DMESG-FAIL][14] +1 other test dmesg-fail
   [13]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18962/bat-arlh-2/igt@i915_selftest@live.html
   [14]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_171760v1/bat-arlh-2/igt@i915_selftest@live.html
    - fi-ilk-650:         [PASS][15] -> [DMESG-FAIL][16] +1 other test dmesg-fail
   [15]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18962/fi-ilk-650/igt@i915_selftest@live.html
   [16]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_171760v1/fi-ilk-650/igt@i915_selftest@live.html

  * igt@i915_selftest@live@dmabuf:
    - bat-mtlp-9:         [PASS][17] -> [DMESG-FAIL][18] +1 other test dmesg-fail
   [17]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18962/bat-mtlp-9/igt@i915_selftest@live@dmabuf.html
   [18]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_171760v1/bat-mtlp-9/igt@i915_selftest@live@dmabuf.html
    - bat-arls-6:         [PASS][19] -> [DMESG-FAIL][20] +1 other test dmesg-fail
   [19]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18962/bat-arls-6/igt@i915_selftest@live@dmabuf.html
   [20]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_171760v1/bat-arls-6/igt@i915_selftest@live@dmabuf.html
    - fi-bsw-nick:        [PASS][21] -> [DMESG-FAIL][22]
   [21]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18962/fi-bsw-nick/igt@i915_selftest@live@dmabuf.html
   [22]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_171760v1/fi-bsw-nick/igt@i915_selftest@live@dmabuf.html

  
Known issues
------------

  Here are the changes found in Patchwork_171760v1 that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@i915_selftest@live@late_gt_pm:
    - fi-bsw-nick:        [PASS][23] -> [ABORT][24] ([i915#16562]) +1 other test abort
   [23]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18962/fi-bsw-nick/igt@i915_selftest@live@late_gt_pm.html
   [24]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_171760v1/fi-bsw-nick/igt@i915_selftest@live@late_gt_pm.html

  
  [i915#16562]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16562


Build changes
-------------

  * Linux: CI_DRM_18962 -> Patchwork_171760v1

  CI-20190529: 20190529
  CI_DRM_18962: 01d30c194951b8794c33f0d7f559bc4a1c9b7630 @ git://anongit.freedesktop.org/gfx-ci/linux
  IGT_9043: 9043
  Patchwork_171760v1: 01d30c194951b8794c33f0d7f559bc4a1c9b7630 @ git://anongit.freedesktop.org/gfx-ci/linux

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_171760v1/index.html

--===============0694719496773862775==
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
<tr><td><b>Series:</b></td><td>series starting with [1/1] drm/i915/dmabuf: avoid global wbinvd on dma-buf import</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/171760/">https://patchwork.freedesktop.org/series/171760/</a></td></tr>
<tr><td><b>State:</b></td><td>failure</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_171760v1/index.html">https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_171760v1/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from CI_DRM_18962 -&gt; Patchwork_171760v1</h1>
<h2>Summary</h2>
<p><strong>FAILURE</strong></p>
<p>Serious unknown changes coming with Patchwork_171760v1 absolutely need to be<br />
  verified manually.</p>
<p>If you think the reported changes have nothing to do with the changes<br />
  introduced in Patchwork_171760v1, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them<br />
  to document this new failure mode, which will reduce false positives in CI.</p>
<p>External URL: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_171760v1/index.html</p>
<h2>Participating hosts (40 -&gt; 36)</h2>
<p>Missing    (4): bat-dg2-13 bat-dg2-9 fi-snb-2520m bat-adls-6 </p>
<h2>Possible new issues</h2>
<p>Here are the unknown changes that may have been introduced in Patchwork_171760v1:</p>
<h3>IGT changes</h3>
<h4>Possible regressions</h4>
<ul>
<li>
<p>igt@i915_selftest@live:</p>
<ul>
<li>bat-mtlp-8:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18962/bat-mtlp-8/igt@i915_selftest@live.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_171760v1/bat-mtlp-8/igt@i915_selftest@live.html">DMESG-FAIL</a> +1 other test dmesg-fail</li>
<li>fi-elk-e7500:       <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18962/fi-elk-e7500/igt@i915_selftest@live.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_171760v1/fi-elk-e7500/igt@i915_selftest@live.html">DMESG-FAIL</a> +1 other test dmesg-fail</li>
<li>fi-bsw-n3050:       <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18962/fi-bsw-n3050/igt@i915_selftest@live.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_171760v1/fi-bsw-n3050/igt@i915_selftest@live.html">DMESG-FAIL</a> +1 other test dmesg-fail</li>
<li>bat-arlh-3:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18962/bat-arlh-3/igt@i915_selftest@live.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_171760v1/bat-arlh-3/igt@i915_selftest@live.html">DMESG-FAIL</a> +1 other test dmesg-fail</li>
<li>fi-pnv-d510:        <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18962/fi-pnv-d510/igt@i915_selftest@live.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_171760v1/fi-pnv-d510/igt@i915_selftest@live.html">DMESG-FAIL</a> +1 other test dmesg-fail</li>
<li>bat-apl-1:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18962/bat-apl-1/igt@i915_selftest@live.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_171760v1/bat-apl-1/igt@i915_selftest@live.html">DMESG-FAIL</a> +1 other test dmesg-fail</li>
<li>bat-arlh-2:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18962/bat-arlh-2/igt@i915_selftest@live.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_171760v1/bat-arlh-2/igt@i915_selftest@live.html">DMESG-FAIL</a> +1 other test dmesg-fail</li>
<li>fi-ilk-650:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18962/fi-ilk-650/igt@i915_selftest@live.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_171760v1/fi-ilk-650/igt@i915_selftest@live.html">DMESG-FAIL</a> +1 other test dmesg-fail</li>
</ul>
</li>
<li>
<p>igt@i915_selftest@live@dmabuf:</p>
<ul>
<li>bat-mtlp-9:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18962/bat-mtlp-9/igt@i915_selftest@live@dmabuf.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_171760v1/bat-mtlp-9/igt@i915_selftest@live@dmabuf.html">DMESG-FAIL</a> +1 other test dmesg-fail</li>
<li>bat-arls-6:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18962/bat-arls-6/igt@i915_selftest@live@dmabuf.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_171760v1/bat-arls-6/igt@i915_selftest@live@dmabuf.html">DMESG-FAIL</a> +1 other test dmesg-fail</li>
<li>fi-bsw-nick:        <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18962/fi-bsw-nick/igt@i915_selftest@live@dmabuf.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_171760v1/fi-bsw-nick/igt@i915_selftest@live@dmabuf.html">DMESG-FAIL</a></li>
</ul>
</li>
</ul>
<h2>Known issues</h2>
<p>Here are the changes found in Patchwork_171760v1 that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>igt@i915_selftest@live@late_gt_pm:<ul>
<li>fi-bsw-nick:        <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18962/fi-bsw-nick/igt@i915_selftest@live@late_gt_pm.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_171760v1/fi-bsw-nick/igt@i915_selftest@live@late_gt_pm.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16562">i915#16562</a>) +1 other test abort</li>
</ul>
</li>
</ul>
<h2>Build changes</h2>
<ul>
<li>Linux: CI_DRM_18962 -&gt; Patchwork_171760v1</li>
</ul>
<p>CI-20190529: 20190529<br />
  CI_DRM_18962: 01d30c194951b8794c33f0d7f559bc4a1c9b7630 @ git://anongit.freedesktop.org/gfx-ci/linux<br />
  IGT_9043: 9043<br />
  Patchwork_171760v1: 01d30c194951b8794c33f0d7f559bc4a1c9b7630 @ git://anongit.freedesktop.org/gfx-ci/linux</p>

</body>
</html>

--===============0694719496773862775==--
