Return-Path: <intel-gfx-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 942D7D58CBF
	for <intel-gfx@archiver.kernel.org>; Mon, 23 Mar 2026 22:50:21 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2A2E210E084;
	Mon, 23 Mar 2026 22:50:21 +0000 (UTC)
Received: from a3b018990fe9 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9601110E084;
 Mon, 23 Mar 2026 22:50:19 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============1980849670068521893=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=93_i915=2ECI=2EBAT=3A_success_for_drm/vblank=3A_Extract_get?=
 =?utf-8?q?=5Fvblank=5Fcounter=5Fand=5Ftimestamp=28=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Ville Syrjala" <ville.syrjala@linux.intel.com>
Cc: intel-gfx@lists.freedesktop.org
Date: Mon, 23 Mar 2026 22:50:19 -0000
Message-ID: <177430621957.387756.17569617008364782710@a3b018990fe9>
X-Patchwork-Hint: ignore
References: <20260323213645.10965-1-ville.syrjala@linux.intel.com>
In-Reply-To: <20260323213645.10965-1-ville.syrjala@linux.intel.com>
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

--===============1980849670068521893==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: drm/vblank: Extract get_vblank_counter_and_timestamp()
URL   : https://patchwork.freedesktop.org/series/163737/
State : success

== Summary ==

CI Bug Log - changes from CI_DRM_18194 -> Patchwork_163737v1
====================================================

Summary
-------

  **SUCCESS**

  No regressions found.

  External URL: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_163737v1/index.html

Participating hosts (42 -> 40)
------------------------------

  Missing    (2): bat-dg2-13 fi-snb-2520m 

Known issues
------------

  Here are the changes found in Patchwork_163737v1 that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@i915_selftest@live:
    - bat-mtlp-8:         [PASS][1] -> [DMESG-FAIL][2] ([i915#12061]) +1 other test dmesg-fail
   [1]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18194/bat-mtlp-8/igt@i915_selftest@live.html
   [2]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_163737v1/bat-mtlp-8/igt@i915_selftest@live.html

  
  [i915#12061]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12061


Build changes
-------------

  * Linux: CI_DRM_18194 -> Patchwork_163737v1

  CI-20190529: 20190529
  CI_DRM_18194: 8fd3f32cf38821bef5101402e805e370e5b3aea4 @ git://anongit.freedesktop.org/gfx-ci/linux
  IGT_8820: b2f96bfbce5dd7903530e7e3eb0bbeb01eaecfeb @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
  Patchwork_163737v1: 8fd3f32cf38821bef5101402e805e370e5b3aea4 @ git://anongit.freedesktop.org/gfx-ci/linux

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_163737v1/index.html

--===============1980849670068521893==
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
<tr><td><b>Series:</b></td><td>drm/vblank: Extract get_vblank_counter_and_timestamp()</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/163737/">https://patchwork.freedesktop.org/series/163737/</a></td></tr>
<tr><td><b>State:</b></td><td>success</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_163737v1/index.html">https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_163737v1/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from CI_DRM_18194 -&gt; Patchwork_163737v1</h1>
<h2>Summary</h2>
<p><strong>SUCCESS</strong></p>
<p>No regressions found.</p>
<p>External URL: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_163737v1/index.html</p>
<h2>Participating hosts (42 -&gt; 40)</h2>
<p>Missing    (2): bat-dg2-13 fi-snb-2520m </p>
<h2>Known issues</h2>
<p>Here are the changes found in Patchwork_163737v1 that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>igt@i915_selftest@live:<ul>
<li>bat-mtlp-8:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18194/bat-mtlp-8/igt@i915_selftest@live.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_163737v1/bat-mtlp-8/igt@i915_selftest@live.html">DMESG-FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12061">i915#12061</a>) +1 other test dmesg-fail</li>
</ul>
</li>
</ul>
<h2>Build changes</h2>
<ul>
<li>Linux: CI_DRM_18194 -&gt; Patchwork_163737v1</li>
</ul>
<p>CI-20190529: 20190529<br />
  CI_DRM_18194: 8fd3f32cf38821bef5101402e805e370e5b3aea4 @ git://anongit.freedesktop.org/gfx-ci/linux<br />
  IGT_8820: b2f96bfbce5dd7903530e7e3eb0bbeb01eaecfeb @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git<br />
  Patchwork_163737v1: 8fd3f32cf38821bef5101402e805e370e5b3aea4 @ git://anongit.freedesktop.org/gfx-ci/linux</p>

</body>
</html>

--===============1980849670068521893==--
