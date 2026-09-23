Return-Path: <intel-gfx-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E0928C982EA
	for <intel-gfx@archiver.kernel.org>; Wed, 23 Sep 2026 06:59:15 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7B97210E04C;
	Wed, 23 Sep 2026 06:59:15 +0000 (UTC)
Received: from 61270ab9df2a (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8E25510E04C;
 Wed, 23 Sep 2026 06:59:14 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============0018487865572518138=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=93_i915=2ECI=2EBAT=3A_success_for_drm/xe/display=3A_Remove_?=
 =?utf-8?q?invalid_initial_plane_PTE_check_for_iGPU_=28rev3=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Activate Windows" <zhoulol888@gmail.com>
Cc: intel-gfx@lists.freedesktop.org
Date: Wed, 23 Sep 2026 06:59:14 -0000
Message-ID: <179014675457.195677.10930664138277963202@61270ab9df2a>
X-Patchwork-Hint: ignore
References: <20260905142500.17666-1-zhoulol888@gmail.com>
In-Reply-To: <20260905142500.17666-1-zhoulol888@gmail.com>
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

--===============0018487865572518138==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: drm/xe/display: Remove invalid initial plane PTE check for iGPU (rev3)
URL   : https://patchwork.freedesktop.org/series/173618/
State : success

== Summary ==

CI Bug Log - changes from CI_DRM_19205 -> Patchwork_173618v3
====================================================

Summary
-------

  **SUCCESS**

  No regressions found.

  External URL: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_173618v3/index.html

Participating hosts (39 -> 37)
------------------------------

  Missing    (2): bat-dg2-13 bat-adls-6 

Known issues
------------

  Here are the changes found in Patchwork_173618v3 that come from known issues:

### IGT changes ###

#### Possible fixes ####

  * igt@i915_selftest@live@gt_heartbeat:
    - bat-arls-6:         [INCOMPLETE][1] ([i915#17007]) -> [PASS][2] +1 other test pass
   [1]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19205/bat-arls-6/igt@i915_selftest@live@gt_heartbeat.html
   [2]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_173618v3/bat-arls-6/igt@i915_selftest@live@gt_heartbeat.html

  
  [i915#17007]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17007


Build changes
-------------

  * Linux: CI_DRM_19205 -> Patchwork_173618v3

  CI-20190529: 20190529
  CI_DRM_19205: 7cdd31de20cd320f9a1539bb5c3949275326f017 @ git://anongit.freedesktop.org/gfx-ci/linux
  IGT_9109: 65f84b280be2caf8ce376295d97987a808affdee @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
  Patchwork_173618v3: 7cdd31de20cd320f9a1539bb5c3949275326f017 @ git://anongit.freedesktop.org/gfx-ci/linux

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_173618v3/index.html

--===============0018487865572518138==
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
<tr><td><b>Series:</b></td><td>drm/xe/display: Remove invalid initial plane PTE check for iGPU (rev3)</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/173618/">https://patchwork.freedesktop.org/series/173618/</a></td></tr>
<tr><td><b>State:</b></td><td>success</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_173618v3/index.html">https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_173618v3/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from CI_DRM_19205 -&gt; Patchwork_173618v3</h1>
<h2>Summary</h2>
<p><strong>SUCCESS</strong></p>
<p>No regressions found.</p>
<p>External URL: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_173618v3/index.html</p>
<h2>Participating hosts (39 -&gt; 37)</h2>
<p>Missing    (2): bat-dg2-13 bat-adls-6 </p>
<h2>Known issues</h2>
<p>Here are the changes found in Patchwork_173618v3 that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Possible fixes</h4>
<ul>
<li>igt@i915_selftest@live@gt_heartbeat:<ul>
<li>bat-arls-6:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19205/bat-arls-6/igt@i915_selftest@live@gt_heartbeat.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17007">i915#17007</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_173618v3/bat-arls-6/igt@i915_selftest@live@gt_heartbeat.html">PASS</a> +1 other test pass</li>
</ul>
</li>
</ul>
<h2>Build changes</h2>
<ul>
<li>Linux: CI_DRM_19205 -&gt; Patchwork_173618v3</li>
</ul>
<p>CI-20190529: 20190529<br />
  CI_DRM_19205: 7cdd31de20cd320f9a1539bb5c3949275326f017 @ git://anongit.freedesktop.org/gfx-ci/linux<br />
  IGT_9109: 65f84b280be2caf8ce376295d97987a808affdee @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git<br />
  Patchwork_173618v3: 7cdd31de20cd320f9a1539bb5c3949275326f017 @ git://anongit.freedesktop.org/gfx-ci/linux</p>

</body>
</html>

--===============0018487865572518138==--
