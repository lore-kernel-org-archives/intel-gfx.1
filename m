Return-Path: <intel-gfx-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DA6C9CD37B9
	for <intel-gfx@archiver.kernel.org>; Mon, 11 May 2026 12:04:32 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6C5E910E098;
	Mon, 11 May 2026 12:04:32 +0000 (UTC)
Received: from 5ab824fced77 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E6EDD10E098;
 Mon, 11 May 2026 12:04:30 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============8664728555210864478=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=93_i915=2ECI=2EBAT=3A_success_for_series_starting_with_=5B1?=
 =?utf-8?q?/2=5D_drm/i915/ddi=3A_Fix_cleanup_after_DP_connector_init_failure?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Imre Deak" <imre.deak@intel.com>
Cc: intel-gfx@lists.freedesktop.org
Date: Mon, 11 May 2026 12:04:30 -0000
Message-ID: <177850107093.56505.7818765225200565477@5ab824fced77>
X-Patchwork-Hint: ignore
References: <20260507065940.2046690-1-imre.deak@intel.com>
In-Reply-To: <20260507065940.2046690-1-imre.deak@intel.com>
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

--===============8664728555210864478==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: series starting with [1/2] drm/i915/ddi: Fix cleanup after DP connector init failure
URL   : https://patchwork.freedesktop.org/series/166105/
State : success

== Summary ==

CI Bug Log - changes from CI_DRM_18438 -> Patchwork_166105v1
====================================================

Summary
-------

  **SUCCESS**

  No regressions found.

  External URL: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_166105v1/index.html

Participating hosts (42 -> 40)
------------------------------

  Missing    (2): bat-dg2-13 fi-snb-2520m 

New tests
---------

  New tests have been introduced between CI_DRM_18438 and Patchwork_166105v1:

### New IGT tests (5) ###

  * igt@gem_exec_basic@basic@ccs0-smem:
    - Statuses : 10 pass(s)
    - Exec time: [0.0, 0.00] s

  * igt@gem_exec_fence@basic-await@ccs0:
    - Statuses : 10 pass(s)
    - Exec time: [0.07, 0.12] s

  * igt@gem_exec_fence@basic-busy@ccs0:
    - Statuses : 10 pass(s)
    - Exec time: [0.05, 0.06] s

  * igt@gem_exec_fence@basic-wait@ccs0:
    - Statuses : 10 pass(s)
    - Exec time: [0.05, 0.06] s

  * igt@gem_exec_fence@nb-await@ccs0:
    - Statuses : 10 pass(s)
    - Exec time: [0.06, 0.10] s

  

Known issues
------------

  Here are the changes found in Patchwork_166105v1 that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@i915_selftest@live:
    - bat-dg2-8:          [PASS][1] -> [DMESG-FAIL][2] ([i915#12061]) +1 other test dmesg-fail
   [1]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18438/bat-dg2-8/igt@i915_selftest@live.html
   [2]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_166105v1/bat-dg2-8/igt@i915_selftest@live.html

  * igt@i915_selftest@live@gt_lrc:
    - bat-mtlp-9:         [PASS][3] -> [INCOMPLETE][4] ([i915#16055]) +1 other test incomplete
   [3]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18438/bat-mtlp-9/igt@i915_selftest@live@gt_lrc.html
   [4]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_166105v1/bat-mtlp-9/igt@i915_selftest@live@gt_lrc.html

  
  [i915#12061]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12061
  [i915#16055]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16055


Build changes
-------------

  * Linux: CI_DRM_18438 -> Patchwork_166105v1

  CI-20190529: 20190529
  CI_DRM_18438: 30f8a0629f6924f24369cac9161b1a9741880259 @ git://anongit.freedesktop.org/gfx-ci/linux
  IGT_8899: 3e5747e536f148bf232049e49a00e2b683f91a83 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
  Patchwork_166105v1: 30f8a0629f6924f24369cac9161b1a9741880259 @ git://anongit.freedesktop.org/gfx-ci/linux

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_166105v1/index.html

--===============8664728555210864478==
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
<tr><td><b>Series:</b></td><td>series starting with [1/2] drm/i915/ddi: Fix cleanup after DP connector init failure</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/166105/">https://patchwork.freedesktop.org/series/166105/</a></td></tr>
<tr><td><b>State:</b></td><td>success</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_166105v1/index.html">https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_166105v1/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from CI_DRM_18438 -&gt; Patchwork_166105v1</h1>
<h2>Summary</h2>
<p><strong>SUCCESS</strong></p>
<p>No regressions found.</p>
<p>External URL: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_166105v1/index.html</p>
<h2>Participating hosts (42 -&gt; 40)</h2>
<p>Missing    (2): bat-dg2-13 fi-snb-2520m </p>
<h2>New tests</h2>
<p>New tests have been introduced between CI_DRM_18438 and Patchwork_166105v1:</p>
<h3>New IGT tests (5)</h3>
<ul>
<li>
<p>igt@gem_exec_basic@basic@ccs0-smem:</p>
<ul>
<li>Statuses : 10 pass(s)</li>
<li>Exec time: [0.0, 0.00] s</li>
</ul>
</li>
<li>
<p>igt@gem_exec_fence@basic-await@ccs0:</p>
<ul>
<li>Statuses : 10 pass(s)</li>
<li>Exec time: [0.07, 0.12] s</li>
</ul>
</li>
<li>
<p>igt@gem_exec_fence@basic-busy@ccs0:</p>
<ul>
<li>Statuses : 10 pass(s)</li>
<li>Exec time: [0.05, 0.06] s</li>
</ul>
</li>
<li>
<p>igt@gem_exec_fence@basic-wait@ccs0:</p>
<ul>
<li>Statuses : 10 pass(s)</li>
<li>Exec time: [0.05, 0.06] s</li>
</ul>
</li>
<li>
<p>igt@gem_exec_fence@nb-await@ccs0:</p>
<ul>
<li>Statuses : 10 pass(s)</li>
<li>Exec time: [0.06, 0.10] s</li>
</ul>
</li>
</ul>
<h2>Known issues</h2>
<p>Here are the changes found in Patchwork_166105v1 that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>
<p>igt@i915_selftest@live:</p>
<ul>
<li>bat-dg2-8:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18438/bat-dg2-8/igt@i915_selftest@live.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_166105v1/bat-dg2-8/igt@i915_selftest@live.html">DMESG-FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12061">i915#12061</a>) +1 other test dmesg-fail</li>
</ul>
</li>
<li>
<p>igt@i915_selftest@live@gt_lrc:</p>
<ul>
<li>bat-mtlp-9:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18438/bat-mtlp-9/igt@i915_selftest@live@gt_lrc.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_166105v1/bat-mtlp-9/igt@i915_selftest@live@gt_lrc.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16055">i915#16055</a>) +1 other test incomplete</li>
</ul>
</li>
</ul>
<h2>Build changes</h2>
<ul>
<li>Linux: CI_DRM_18438 -&gt; Patchwork_166105v1</li>
</ul>
<p>CI-20190529: 20190529<br />
  CI_DRM_18438: 30f8a0629f6924f24369cac9161b1a9741880259 @ git://anongit.freedesktop.org/gfx-ci/linux<br />
  IGT_8899: 3e5747e536f148bf232049e49a00e2b683f91a83 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git<br />
  Patchwork_166105v1: 30f8a0629f6924f24369cac9161b1a9741880259 @ git://anongit.freedesktop.org/gfx-ci/linux</p>

</body>
</html>

--===============8664728555210864478==--
