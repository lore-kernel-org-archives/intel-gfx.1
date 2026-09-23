Return-Path: <intel-gfx-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ED46AC98304
	for <intel-gfx@archiver.kernel.org>; Wed, 23 Sep 2026 20:25:25 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 55E9510F18B;
	Wed, 23 Sep 2026 20:25:25 +0000 (UTC)
Received: from 61270ab9df2a (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9F16810F18A;
 Wed, 23 Sep 2026 20:25:24 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============3219228684325277897=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=97_i915=2ECI=2EBAT=3A_failure_for_drm/i915/guc=3A_Fix_ce_us?=
 =?utf-8?q?e-after-free_in_scrub=5Fguc=5Fdesc=5Ffor=5Foutstanding=5Fg2h=28?=
 =?utf-8?q?=29_=28rev2=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Wentao Liang" <vulab@iscas.ac.cn>
Cc: intel-gfx@lists.freedesktop.org
Date: Wed, 23 Sep 2026 20:25:24 -0000
Message-ID: <179019512464.198725.13933701735498664256@61270ab9df2a>
X-Patchwork-Hint: ignore
References: <20260916173110.2088036-1-vulab@iscas.ac.cn>
In-Reply-To: <20260916173110.2088036-1-vulab@iscas.ac.cn>
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

--===============3219228684325277897==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: drm/i915/guc: Fix ce use-after-free in scrub_guc_desc_for_outstanding_g2h() (rev2)
URL   : https://patchwork.freedesktop.org/series/174414/
State : failure

== Summary ==

CI Bug Log - changes from CI_DRM_19210 -> Patchwork_174414v2
====================================================

Summary
-------

  **FAILURE**

  Serious unknown changes coming with Patchwork_174414v2 absolutely need to be
  verified manually.
  
  If you think the reported changes have nothing to do with the changes
  introduced in Patchwork_174414v2, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them
  to document this new failure mode, which will reduce false positives in CI.

  External URL: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_174414v2/index.html

Participating hosts (39 -> 38)
------------------------------

  Missing    (1): bat-dg2-13 

Possible new issues
-------------------

  Here are the unknown changes that may have been introduced in Patchwork_174414v2:

### IGT changes ###

#### Possible regressions ####

  * igt@i915_selftest@live:
    - bat-twl-1:          [PASS][1] -> [INCOMPLETE][2] +1 other test incomplete
   [1]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19210/bat-twl-1/igt@i915_selftest@live.html
   [2]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_174414v2/bat-twl-1/igt@i915_selftest@live.html

  


Build changes
-------------

  * Linux: CI_DRM_19210 -> Patchwork_174414v2

  CI-20190529: 20190529
  CI_DRM_19210: 703cd271db3a35088460ab3fec0a96bd48e7fe04 @ git://anongit.freedesktop.org/gfx-ci/linux
  IGT_9110: 9110
  Patchwork_174414v2: 703cd271db3a35088460ab3fec0a96bd48e7fe04 @ git://anongit.freedesktop.org/gfx-ci/linux

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_174414v2/index.html

--===============3219228684325277897==
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
<tr><td><b>Series:</b></td><td>drm/i915/guc: Fix ce use-after-free in scrub_guc_desc_for_outstanding_g2h() (rev2)</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/174414/">https://patchwork.freedesktop.org/series/174414/</a></td></tr>
<tr><td><b>State:</b></td><td>failure</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_174414v2/index.html">https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_174414v2/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from CI_DRM_19210 -&gt; Patchwork_174414v2</h1>
<h2>Summary</h2>
<p><strong>FAILURE</strong></p>
<p>Serious unknown changes coming with Patchwork_174414v2 absolutely need to be<br />
  verified manually.</p>
<p>If you think the reported changes have nothing to do with the changes<br />
  introduced in Patchwork_174414v2, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them<br />
  to document this new failure mode, which will reduce false positives in CI.</p>
<p>External URL: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_174414v2/index.html</p>
<h2>Participating hosts (39 -&gt; 38)</h2>
<p>Missing    (1): bat-dg2-13 </p>
<h2>Possible new issues</h2>
<p>Here are the unknown changes that may have been introduced in Patchwork_174414v2:</p>
<h3>IGT changes</h3>
<h4>Possible regressions</h4>
<ul>
<li>igt@i915_selftest@live:<ul>
<li>bat-twl-1:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19210/bat-twl-1/igt@i915_selftest@live.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_174414v2/bat-twl-1/igt@i915_selftest@live.html">INCOMPLETE</a> +1 other test incomplete</li>
</ul>
</li>
</ul>
<h2>Build changes</h2>
<ul>
<li>Linux: CI_DRM_19210 -&gt; Patchwork_174414v2</li>
</ul>
<p>CI-20190529: 20190529<br />
  CI_DRM_19210: 703cd271db3a35088460ab3fec0a96bd48e7fe04 @ git://anongit.freedesktop.org/gfx-ci/linux<br />
  IGT_9110: 9110<br />
  Patchwork_174414v2: 703cd271db3a35088460ab3fec0a96bd48e7fe04 @ git://anongit.freedesktop.org/gfx-ci/linux</p>

</body>
</html>

--===============3219228684325277897==--
