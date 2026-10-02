Return-Path: <intel-gfx-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 68E22CA5FDD
	for <intel-gfx@archiver.kernel.org>; Fri,  2 Oct 2026 16:18:23 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E83B310F916;
	Fri,  2 Oct 2026 16:18:22 +0000 (UTC)
Received: from 61270ab9df2a (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4774610F916;
 Fri,  2 Oct 2026 16:18:21 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============8715032088683235168=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=97_i915=2ECI=2EBAT=3A_failure_for_series_starting_with_=5Bv?=
 =?utf-8?q?2=2C1/3=5D_drm/i915/gmbus=3A_Switch_GMBUS_fully_to_=5Ffw=28=29_re?=
 =?utf-8?q?gister_accesses_=28rev3=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Ville Syrjala" <ville.syrjala@linux.intel.com>
Cc: intel-gfx@lists.freedesktop.org
Date: Fri, 02 Oct 2026 16:18:21 -0000
Message-ID: <179095790128.233267.16881820238905294954@61270ab9df2a>
X-Patchwork-Hint: ignore
References: <20260930115303.24285-1-ville.syrjala@linux.intel.com>
In-Reply-To: <20260930115303.24285-1-ville.syrjala@linux.intel.com>
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

--===============8715032088683235168==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: series starting with [v2,1/3] drm/i915/gmbus: Switch GMBUS fully to _fw() register accesses (rev3)
URL   : https://patchwork.freedesktop.org/series/175283/
State : failure

== Summary ==

CI Bug Log - changes from CI_DRM_19275 -> Patchwork_175283v3
====================================================

Summary
-------

  **FAILURE**

  Serious unknown changes coming with Patchwork_175283v3 absolutely need to be
  verified manually.
  
  If you think the reported changes have nothing to do with the changes
  introduced in Patchwork_175283v3, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them
  to document this new failure mode, which will reduce false positives in CI.

  External URL: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_175283v3/index.html

Participating hosts (39 -> 38)
------------------------------

  Missing    (1): bat-dg2-13 

Possible new issues
-------------------

  Here are the unknown changes that may have been introduced in Patchwork_175283v3:

### IGT changes ###

#### Possible regressions ####

  * igt@i915_selftest@live@dmabuf:
    - bat-arlh-3:         [PASS][1] -> [INCOMPLETE][2]
   [1]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19275/bat-arlh-3/igt@i915_selftest@live@dmabuf.html
   [2]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_175283v3/bat-arlh-3/igt@i915_selftest@live@dmabuf.html

  
Known issues
------------

  Here are the changes found in Patchwork_175283v3 that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@i915_selftest@live:
    - bat-arlh-3:         [PASS][3] -> [INCOMPLETE][4] ([i915#16547])
   [3]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19275/bat-arlh-3/igt@i915_selftest@live.html
   [4]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_175283v3/bat-arlh-3/igt@i915_selftest@live.html

  * igt@kms_addfb_basic@too-high:
    - bat-apl-1:          [PASS][5] -> [DMESG-WARN][6] ([i915#13735]) +38 other tests dmesg-warn
   [5]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19275/bat-apl-1/igt@kms_addfb_basic@too-high.html
   [6]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_175283v3/bat-apl-1/igt@kms_addfb_basic@too-high.html

  * igt@kms_pipe_crc_basic@nonblocking-crc-frame-sequence@pipe-b-dp-1:
    - bat-apl-1:          [PASS][7] -> [DMESG-WARN][8] ([i915#13735] / [i915#180]) +36 other tests dmesg-warn
   [7]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19275/bat-apl-1/igt@kms_pipe_crc_basic@nonblocking-crc-frame-sequence@pipe-b-dp-1.html
   [8]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_175283v3/bat-apl-1/igt@kms_pipe_crc_basic@nonblocking-crc-frame-sequence@pipe-b-dp-1.html

  
#### Possible fixes ####

  * igt@kms_pipe_crc_basic@read-crc@pipe-a-dp-1:
    - bat-apl-1:          [DMESG-WARN][9] ([i915#13735] / [i915#180]) -> [PASS][10]
   [9]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19275/bat-apl-1/igt@kms_pipe_crc_basic@read-crc@pipe-a-dp-1.html
   [10]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_175283v3/bat-apl-1/igt@kms_pipe_crc_basic@read-crc@pipe-a-dp-1.html

  
  [i915#13735]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13735
  [i915#16547]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16547
  [i915#180]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/180


Build changes
-------------

  * Linux: CI_DRM_19275 -> Patchwork_175283v3

  CI-20190529: 20190529
  CI_DRM_19275: b8b605784137aa007148f4872e958131bb33e341 @ git://anongit.freedesktop.org/gfx-ci/linux
  IGT_9125: 9125
  Patchwork_175283v3: b8b605784137aa007148f4872e958131bb33e341 @ git://anongit.freedesktop.org/gfx-ci/linux

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_175283v3/index.html

--===============8715032088683235168==
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
<tr><td><b>Series:</b></td><td>series starting with [v2,1/3] drm/i915/gmbus: Switch GMBUS fully to _fw() register accesses (rev3)</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/175283/">https://patchwork.freedesktop.org/series/175283/</a></td></tr>
<tr><td><b>State:</b></td><td>failure</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_175283v3/index.html">https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_175283v3/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from CI_DRM_19275 -&gt; Patchwork_175283v3</h1>
<h2>Summary</h2>
<p><strong>FAILURE</strong></p>
<p>Serious unknown changes coming with Patchwork_175283v3 absolutely need to be<br />
  verified manually.</p>
<p>If you think the reported changes have nothing to do with the changes<br />
  introduced in Patchwork_175283v3, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them<br />
  to document this new failure mode, which will reduce false positives in CI.</p>
<p>External URL: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_175283v3/index.html</p>
<h2>Participating hosts (39 -&gt; 38)</h2>
<p>Missing    (1): bat-dg2-13 </p>
<h2>Possible new issues</h2>
<p>Here are the unknown changes that may have been introduced in Patchwork_175283v3:</p>
<h3>IGT changes</h3>
<h4>Possible regressions</h4>
<ul>
<li>igt@i915_selftest@live@dmabuf:<ul>
<li>bat-arlh-3:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19275/bat-arlh-3/igt@i915_selftest@live@dmabuf.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_175283v3/bat-arlh-3/igt@i915_selftest@live@dmabuf.html">INCOMPLETE</a></li>
</ul>
</li>
</ul>
<h2>Known issues</h2>
<p>Here are the changes found in Patchwork_175283v3 that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>
<p>igt@i915_selftest@live:</p>
<ul>
<li>bat-arlh-3:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19275/bat-arlh-3/igt@i915_selftest@live.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_175283v3/bat-arlh-3/igt@i915_selftest@live.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16547">i915#16547</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_addfb_basic@too-high:</p>
<ul>
<li>bat-apl-1:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19275/bat-apl-1/igt@kms_addfb_basic@too-high.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_175283v3/bat-apl-1/igt@kms_addfb_basic@too-high.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13735">i915#13735</a>) +38 other tests dmesg-warn</li>
</ul>
</li>
<li>
<p>igt@kms_pipe_crc_basic@nonblocking-crc-frame-sequence@pipe-b-dp-1:</p>
<ul>
<li>bat-apl-1:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19275/bat-apl-1/igt@kms_pipe_crc_basic@nonblocking-crc-frame-sequence@pipe-b-dp-1.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_175283v3/bat-apl-1/igt@kms_pipe_crc_basic@nonblocking-crc-frame-sequence@pipe-b-dp-1.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13735">i915#13735</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/180">i915#180</a>) +36 other tests dmesg-warn</li>
</ul>
</li>
</ul>
<h4>Possible fixes</h4>
<ul>
<li>igt@kms_pipe_crc_basic@read-crc@pipe-a-dp-1:<ul>
<li>bat-apl-1:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19275/bat-apl-1/igt@kms_pipe_crc_basic@read-crc@pipe-a-dp-1.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13735">i915#13735</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/180">i915#180</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_175283v3/bat-apl-1/igt@kms_pipe_crc_basic@read-crc@pipe-a-dp-1.html">PASS</a></li>
</ul>
</li>
</ul>
<h2>Build changes</h2>
<ul>
<li>Linux: CI_DRM_19275 -&gt; Patchwork_175283v3</li>
</ul>
<p>CI-20190529: 20190529<br />
  CI_DRM_19275: b8b605784137aa007148f4872e958131bb33e341 @ git://anongit.freedesktop.org/gfx-ci/linux<br />
  IGT_9125: 9125<br />
  Patchwork_175283v3: b8b605784137aa007148f4872e958131bb33e341 @ git://anongit.freedesktop.org/gfx-ci/linux</p>

</body>
</html>

--===============8715032088683235168==--
