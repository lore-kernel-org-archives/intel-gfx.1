Return-Path: <intel-gfx-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1B94DCA5FBB
	for <intel-gfx@archiver.kernel.org>; Wed, 30 Sep 2026 13:52:52 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A9E1210F424;
	Wed, 30 Sep 2026 13:52:51 +0000 (UTC)
Received: from 61270ab9df2a (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2037E10F424;
 Wed, 30 Sep 2026 13:52:50 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============8023755054325541232=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=93_i915=2ECI=2EBAT=3A_success_for_series_starting_with_=5B1?=
 =?utf-8?q?/3=5D_drm/i915/gmbus=3A_Switch_GMBUS_fully_to_=5Ffw=28=29_registe?=
 =?utf-8?q?r_accesses?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: =?utf-8?b?VmlsbGUgU3lyasOkbMOk?= <ville.syrjala@linux.intel.com>
Cc: intel-gfx@lists.freedesktop.org
Date: Wed, 30 Sep 2026 13:52:50 -0000
Message-ID: <179077637012.223713.16759381256701728695@61270ab9df2a>
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

--===============8023755054325541232==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: series starting with [1/3] drm/i915/gmbus: Switch GMBUS fully to _fw() register accesses
URL   : https://patchwork.freedesktop.org/series/175283/
State : success

== Summary ==

CI Bug Log - changes from CI_DRM_19242 -> Patchwork_175283v1
====================================================

Summary
-------

  **SUCCESS**

  No regressions found.

  External URL: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_175283v1/index.html

Participating hosts (39 -> 38)
------------------------------

  Missing    (1): bat-dg2-13 

Known issues
------------

  Here are the changes found in Patchwork_175283v1 that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@i915_selftest@live@late_gt_pm:
    - bat-dg2-14:         [PASS][1] -> [ABORT][2] ([i915#17063]) +1 other test abort
   [1]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19242/bat-dg2-14/igt@i915_selftest@live@late_gt_pm.html
   [2]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_175283v1/bat-dg2-14/igt@i915_selftest@live@late_gt_pm.html

  
  [i915#17063]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17063


Build changes
-------------

  * Linux: CI_DRM_19242 -> Patchwork_175283v1

  CI-20190529: 20190529
  CI_DRM_19242: dde43fa4801498eefd0280da6c729ff5a178f866 @ git://anongit.freedesktop.org/gfx-ci/linux
  IGT_9118: 26513be3e0f711ed835ec50d5cdcb723ef224105 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
  Patchwork_175283v1: dde43fa4801498eefd0280da6c729ff5a178f866 @ git://anongit.freedesktop.org/gfx-ci/linux

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_175283v1/index.html

--===============8023755054325541232==
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
<tr><td><b>Series:</b></td><td>series starting with [1/3] drm/i915/gmbus: Switch GMBUS fully to _fw() register accesses</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/175283/">https://patchwork.freedesktop.org/series/175283/</a></td></tr>
<tr><td><b>State:</b></td><td>success</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_175283v1/index.html">https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_175283v1/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from CI_DRM_19242 -&gt; Patchwork_175283v1</h1>
<h2>Summary</h2>
<p><strong>SUCCESS</strong></p>
<p>No regressions found.</p>
<p>External URL: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_175283v1/index.html</p>
<h2>Participating hosts (39 -&gt; 38)</h2>
<p>Missing    (1): bat-dg2-13 </p>
<h2>Known issues</h2>
<p>Here are the changes found in Patchwork_175283v1 that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>igt@i915_selftest@live@late_gt_pm:<ul>
<li>bat-dg2-14:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19242/bat-dg2-14/igt@i915_selftest@live@late_gt_pm.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_175283v1/bat-dg2-14/igt@i915_selftest@live@late_gt_pm.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17063">i915#17063</a>) +1 other test abort</li>
</ul>
</li>
</ul>
<h2>Build changes</h2>
<ul>
<li>Linux: CI_DRM_19242 -&gt; Patchwork_175283v1</li>
</ul>
<p>CI-20190529: 20190529<br />
  CI_DRM_19242: dde43fa4801498eefd0280da6c729ff5a178f866 @ git://anongit.freedesktop.org/gfx-ci/linux<br />
  IGT_9118: 26513be3e0f711ed835ec50d5cdcb723ef224105 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git<br />
  Patchwork_175283v1: dde43fa4801498eefd0280da6c729ff5a178f866 @ git://anongit.freedesktop.org/gfx-ci/linux</p>

</body>
</html>

--===============8023755054325541232==--
