Return-Path: <intel-gfx-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 91920C5DF97
	for <intel-gfx@archiver.kernel.org>; Thu, 27 Aug 2026 00:08:51 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DA72910E2F4;
	Thu, 27 Aug 2026 00:08:50 +0000 (UTC)
Received: from 61270ab9df2a (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9C7A810E2F4;
 Thu, 27 Aug 2026 00:08:49 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============6925289437089348626=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=93_i915=2ECI=2EBAT=3A_success_for_pm=5Fpme_support_on_displ?=
 =?utf-8?q?ay_hotplug_=28rev2=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Vinod Govindapillai" <vinod.govindapillai@intel.com>
Cc: intel-gfx@lists.freedesktop.org
Date: Thu, 27 Aug 2026 00:08:49 -0000
Message-ID: <178778932963.88746.13164718707831062117@61270ab9df2a>
X-Patchwork-Hint: ignore
References: <20260826225338.804902-1-vinod.govindapillai@intel.com>
In-Reply-To: <20260826225338.804902-1-vinod.govindapillai@intel.com>
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

--===============6925289437089348626==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: pm_pme support on display hotplug (rev2)
URL   : https://patchwork.freedesktop.org/series/172306/
State : success

== Summary ==

CI Bug Log - changes from CI_DRM_19048 -> Patchwork_172306v2
====================================================

Summary
-------

  **SUCCESS**

  No regressions found.

  External URL: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_172306v2/index.html

Participating hosts (40 -> 38)
------------------------------

  Missing    (2): bat-dg2-13 fi-snb-2520m 

Known issues
------------

  Here are the changes found in Patchwork_172306v2 that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@i915_selftest@live@gt_timelines:
    - bat-dg2-9:          [PASS][1] -> [ABORT][2] ([i915#16830]) +1 other test abort
   [1]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19048/bat-dg2-9/igt@i915_selftest@live@gt_timelines.html
   [2]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_172306v2/bat-dg2-9/igt@i915_selftest@live@gt_timelines.html

  
#### Possible fixes ####

  * igt@i915_selftest@live:
    - fi-bsw-n3050:       [ABORT][3] ([i915#16562]) -> [PASS][4]
   [3]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19048/fi-bsw-n3050/igt@i915_selftest@live.html
   [4]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_172306v2/fi-bsw-n3050/igt@i915_selftest@live.html

  * igt@i915_selftest@live@hangcheck:
    - fi-bsw-n3050:       [ABORT][5] ([i915#16633] / [i915#16666]) -> [PASS][6]
   [5]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19048/fi-bsw-n3050/igt@i915_selftest@live@hangcheck.html
   [6]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_172306v2/fi-bsw-n3050/igt@i915_selftest@live@hangcheck.html

  
  [i915#16562]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16562
  [i915#16633]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16633
  [i915#16666]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16666
  [i915#16830]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16830


Build changes
-------------

  * Linux: CI_DRM_19048 -> Patchwork_172306v2

  CI-20190529: 20190529
  CI_DRM_19048: 7c56ac46313c75cab25c1e9b7bc4cbf40644b044 @ git://anongit.freedesktop.org/gfx-ci/linux
  IGT_9076: 8f42b0189d73d9912ad58c99cfaa4ff46c20fcc3 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
  Patchwork_172306v2: 7c56ac46313c75cab25c1e9b7bc4cbf40644b044 @ git://anongit.freedesktop.org/gfx-ci/linux

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_172306v2/index.html

--===============6925289437089348626==
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
<tr><td><b>Series:</b></td><td>pm_pme support on display hotplug (rev2)</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/172306/">https://patchwork.freedesktop.org/series/172306/</a></td></tr>
<tr><td><b>State:</b></td><td>success</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_172306v2/index.html">https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_172306v2/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from CI_DRM_19048 -&gt; Patchwork_172306v2</h1>
<h2>Summary</h2>
<p><strong>SUCCESS</strong></p>
<p>No regressions found.</p>
<p>External URL: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_172306v2/index.html</p>
<h2>Participating hosts (40 -&gt; 38)</h2>
<p>Missing    (2): bat-dg2-13 fi-snb-2520m </p>
<h2>Known issues</h2>
<p>Here are the changes found in Patchwork_172306v2 that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>igt@i915_selftest@live@gt_timelines:<ul>
<li>bat-dg2-9:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19048/bat-dg2-9/igt@i915_selftest@live@gt_timelines.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_172306v2/bat-dg2-9/igt@i915_selftest@live@gt_timelines.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16830">i915#16830</a>) +1 other test abort</li>
</ul>
</li>
</ul>
<h4>Possible fixes</h4>
<ul>
<li>
<p>igt@i915_selftest@live:</p>
<ul>
<li>fi-bsw-n3050:       <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19048/fi-bsw-n3050/igt@i915_selftest@live.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16562">i915#16562</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_172306v2/fi-bsw-n3050/igt@i915_selftest@live.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@i915_selftest@live@hangcheck:</p>
<ul>
<li>fi-bsw-n3050:       <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19048/fi-bsw-n3050/igt@i915_selftest@live@hangcheck.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16633">i915#16633</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16666">i915#16666</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_172306v2/fi-bsw-n3050/igt@i915_selftest@live@hangcheck.html">PASS</a></li>
</ul>
</li>
</ul>
<h2>Build changes</h2>
<ul>
<li>Linux: CI_DRM_19048 -&gt; Patchwork_172306v2</li>
</ul>
<p>CI-20190529: 20190529<br />
  CI_DRM_19048: 7c56ac46313c75cab25c1e9b7bc4cbf40644b044 @ git://anongit.freedesktop.org/gfx-ci/linux<br />
  IGT_9076: 8f42b0189d73d9912ad58c99cfaa4ff46c20fcc3 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git<br />
  Patchwork_172306v2: 7c56ac46313c75cab25c1e9b7bc4cbf40644b044 @ git://anongit.freedesktop.org/gfx-ci/linux</p>

</body>
</html>

--===============6925289437089348626==--
