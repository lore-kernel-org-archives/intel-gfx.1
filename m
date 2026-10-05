Return-Path: <intel-gfx-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 407F9CA5FF0
	for <intel-gfx@archiver.kernel.org>; Mon,  5 Oct 2026 19:55:59 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B4B7110EE6A;
	Mon,  5 Oct 2026 19:55:58 +0000 (UTC)
Received: from 61270ab9df2a (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E88D810EE6A;
 Mon,  5 Oct 2026 19:55:57 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============4305836598491570848=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=93_i915=2ECI=2EBAT=3A_success_for_drm/i915/xe3p=5Flpd=3A_Re?=
 =?utf-8?q?duce_lowest_CDCLK_PLL_ratio_to_18?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Gustavo Sousa" <gustavo.sousa@intel.com>
Cc: intel-gfx@lists.freedesktop.org
Date: Mon, 05 Oct 2026 19:55:57 -0000
Message-ID: <179123015794.241496.568111774750159963@61270ab9df2a>
X-Patchwork-Hint: ignore
References: <20261005-xe3p-cdclk-pll-18-v1-1-6f1652c224b4@intel.com>
In-Reply-To: <20261005-xe3p-cdclk-pll-18-v1-1-6f1652c224b4@intel.com>
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

--===============4305836598491570848==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: drm/i915/xe3p_lpd: Reduce lowest CDCLK PLL ratio to 18
URL   : https://patchwork.freedesktop.org/series/175566/
State : success

== Summary ==

CI Bug Log - changes from CI_DRM_19281 -> Patchwork_175566v1
====================================================

Summary
-------

  **SUCCESS**

  No regressions found.

  External URL: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_175566v1/index.html

Participating hosts (39 -> 36)
------------------------------

  Missing    (3): bat-dg2-13 fi-glk-j4005 bat-adls-6 

Known issues
------------

  Here are the changes found in Patchwork_175566v1 that come from known issues:

### IGT changes ###

#### Possible fixes ####

  * igt@i915_selftest@live:
    - bat-arlh-3:         [INCOMPLETE][1] ([i915#16547]) -> [PASS][2]
   [1]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19281/bat-arlh-3/igt@i915_selftest@live.html
   [2]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_175566v1/bat-arlh-3/igt@i915_selftest@live.html

  * igt@i915_selftest@live@evict:
    - bat-arlh-3:         [INCOMPLETE][3] -> [PASS][4]
   [3]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19281/bat-arlh-3/igt@i915_selftest@live@evict.html
   [4]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_175566v1/bat-arlh-3/igt@i915_selftest@live@evict.html

  
  [i915#16547]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16547


Build changes
-------------

  * Linux: CI_DRM_19281 -> Patchwork_175566v1

  CI-20190529: 20190529
  CI_DRM_19281: c1341b7b7cec27ca50f287ec497e41a8cc88f22b @ git://anongit.freedesktop.org/gfx-ci/linux
  IGT_9128: 9128
  Patchwork_175566v1: c1341b7b7cec27ca50f287ec497e41a8cc88f22b @ git://anongit.freedesktop.org/gfx-ci/linux

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_175566v1/index.html

--===============4305836598491570848==
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
<tr><td><b>Series:</b></td><td>drm/i915/xe3p_lpd: Reduce lowest CDCLK PLL ratio to 18</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/175566/">https://patchwork.freedesktop.org/series/175566/</a></td></tr>
<tr><td><b>State:</b></td><td>success</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_175566v1/index.html">https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_175566v1/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from CI_DRM_19281 -&gt; Patchwork_175566v1</h1>
<h2>Summary</h2>
<p><strong>SUCCESS</strong></p>
<p>No regressions found.</p>
<p>External URL: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_175566v1/index.html</p>
<h2>Participating hosts (39 -&gt; 36)</h2>
<p>Missing    (3): bat-dg2-13 fi-glk-j4005 bat-adls-6 </p>
<h2>Known issues</h2>
<p>Here are the changes found in Patchwork_175566v1 that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Possible fixes</h4>
<ul>
<li>
<p>igt@i915_selftest@live:</p>
<ul>
<li>bat-arlh-3:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19281/bat-arlh-3/igt@i915_selftest@live.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16547">i915#16547</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_175566v1/bat-arlh-3/igt@i915_selftest@live.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@i915_selftest@live@evict:</p>
<ul>
<li>bat-arlh-3:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19281/bat-arlh-3/igt@i915_selftest@live@evict.html">INCOMPLETE</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_175566v1/bat-arlh-3/igt@i915_selftest@live@evict.html">PASS</a></li>
</ul>
</li>
</ul>
<h2>Build changes</h2>
<ul>
<li>Linux: CI_DRM_19281 -&gt; Patchwork_175566v1</li>
</ul>
<p>CI-20190529: 20190529<br />
  CI_DRM_19281: c1341b7b7cec27ca50f287ec497e41a8cc88f22b @ git://anongit.freedesktop.org/gfx-ci/linux<br />
  IGT_9128: 9128<br />
  Patchwork_175566v1: c1341b7b7cec27ca50f287ec497e41a8cc88f22b @ git://anongit.freedesktop.org/gfx-ci/linux</p>

</body>
</html>

--===============4305836598491570848==--
