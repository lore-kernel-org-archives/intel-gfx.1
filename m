Return-Path: <intel-gfx-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 34351CD98E4
	for <intel-gfx@archiver.kernel.org>; Wed, 17 Jun 2026 10:52:30 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C58CA10EFA9;
	Wed, 17 Jun 2026 10:52:29 +0000 (UTC)
Received: from 6beec6c84f66 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DA05A10EFA6;
 Wed, 17 Jun 2026 10:52:28 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============4198439568556600356=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=97_i915=2ECI=2EBAT=3A_failure_for_drm/i915/color=3A_Enable_?=
 =?utf-8?q?SDR_plane_color_pipeline_=28rev3=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Chaitanya Kumar Borah" <chaitanya.kumar.borah@intel.com>
Cc: intel-gfx@lists.freedesktop.org
Date: Wed, 17 Jun 2026 10:52:28 -0000
Message-ID: <178169354888.89425.7204996659297350132@6beec6c84f66>
X-Patchwork-Hint: ignore
References: <20260617090819.1735153-1-chaitanya.kumar.borah@intel.com>
In-Reply-To: <20260617090819.1735153-1-chaitanya.kumar.borah@intel.com>
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

--===============4198439568556600356==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: drm/i915/color: Enable SDR plane color pipeline (rev3)
URL   : https://patchwork.freedesktop.org/series/162788/
State : failure

== Summary ==

CI Bug Log - changes from CI_DRM_18693 -> Patchwork_162788v3
====================================================

Summary
-------

  **FAILURE**

  Serious unknown changes coming with Patchwork_162788v3 absolutely need to be
  verified manually.
  
  If you think the reported changes have nothing to do with the changes
  introduced in Patchwork_162788v3, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them
  to document this new failure mode, which will reduce false positives in CI.

  External URL: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_162788v3/index.html

Participating hosts (41 -> 39)
------------------------------

  Missing    (2): bat-dg2-13 fi-snb-2520m 

Possible new issues
-------------------

  Here are the unknown changes that may have been introduced in Patchwork_162788v3:

### IGT changes ###

#### Possible regressions ####

  * igt@i915_selftest@live@gt_tlb:
    - bat-adlp-9:         [PASS][1] -> [FAIL][2] +31 other tests fail
   [1]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18693/bat-adlp-9/igt@i915_selftest@live@gt_tlb.html
   [2]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_162788v3/bat-adlp-9/igt@i915_selftest@live@gt_tlb.html

  


Build changes
-------------

  * Linux: CI_DRM_18693 -> Patchwork_162788v3

  CI-20190529: 20190529
  CI_DRM_18693: 19b9e4ff1c86741826121bac2d9d2783ed3b3aa5 @ git://anongit.freedesktop.org/gfx-ci/linux
  IGT_8968: 6f40795505dc42c273334e9581c15e6025d8ed57 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
  Patchwork_162788v3: 19b9e4ff1c86741826121bac2d9d2783ed3b3aa5 @ git://anongit.freedesktop.org/gfx-ci/linux

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_162788v3/index.html

--===============4198439568556600356==
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
<tr><td><b>Series:</b></td><td>drm/i915/color: Enable SDR plane color pipeline (rev3)</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/162788/">https://patchwork.freedesktop.org/series/162788/</a></td></tr>
<tr><td><b>State:</b></td><td>failure</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_162788v3/index.html">https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_162788v3/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from CI_DRM_18693 -&gt; Patchwork_162788v3</h1>
<h2>Summary</h2>
<p><strong>FAILURE</strong></p>
<p>Serious unknown changes coming with Patchwork_162788v3 absolutely need to be<br />
  verified manually.</p>
<p>If you think the reported changes have nothing to do with the changes<br />
  introduced in Patchwork_162788v3, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them<br />
  to document this new failure mode, which will reduce false positives in CI.</p>
<p>External URL: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_162788v3/index.html</p>
<h2>Participating hosts (41 -&gt; 39)</h2>
<p>Missing    (2): bat-dg2-13 fi-snb-2520m </p>
<h2>Possible new issues</h2>
<p>Here are the unknown changes that may have been introduced in Patchwork_162788v3:</p>
<h3>IGT changes</h3>
<h4>Possible regressions</h4>
<ul>
<li>igt@i915_selftest@live@gt_tlb:<ul>
<li>bat-adlp-9:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18693/bat-adlp-9/igt@i915_selftest@live@gt_tlb.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_162788v3/bat-adlp-9/igt@i915_selftest@live@gt_tlb.html">FAIL</a> +31 other tests fail</li>
</ul>
</li>
</ul>
<h2>Build changes</h2>
<ul>
<li>Linux: CI_DRM_18693 -&gt; Patchwork_162788v3</li>
</ul>
<p>CI-20190529: 20190529<br />
  CI_DRM_18693: 19b9e4ff1c86741826121bac2d9d2783ed3b3aa5 @ git://anongit.freedesktop.org/gfx-ci/linux<br />
  IGT_8968: 6f40795505dc42c273334e9581c15e6025d8ed57 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git<br />
  Patchwork_162788v3: 19b9e4ff1c86741826121bac2d9d2783ed3b3aa5 @ git://anongit.freedesktop.org/gfx-ci/linux</p>

</body>
</html>

--===============4198439568556600356==--
