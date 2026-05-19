Return-Path: <intel-gfx-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 16661CD4F5B
	for <intel-gfx@archiver.kernel.org>; Tue, 19 May 2026 13:12:36 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B23EC10ECD4;
	Tue, 19 May 2026 13:12:35 +0000 (UTC)
Received: from 5ab824fced77 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 50E5B10ECBE;
 Tue, 19 May 2026 13:12:34 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============5039968242106434972=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=97_i915=2ECI=2EBAT=3A_failure_for_drm/atomic=3A_Rework_init?=
 =?utf-8?q?ial_state_allocation_=28rev4=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Maxime Ripard" <mripard@kernel.org>
Cc: intel-gfx@lists.freedesktop.org
Date: Tue, 19 May 2026 13:12:34 -0000
Message-ID: <177919635432.86973.766998607307103407@5ab824fced77>
X-Patchwork-Hint: ignore
References: <20260519-drm-mode-config-init-v5-0-388b03321e38@kernel.org>
In-Reply-To: <20260519-drm-mode-config-init-v5-0-388b03321e38@kernel.org>
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

--===============5039968242106434972==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: drm/atomic: Rework initial state allocation (rev4)
URL   : https://patchwork.freedesktop.org/series/163608/
State : failure

== Summary ==

CI Bug Log - changes from CI_DRM_18520 -> Patchwork_163608v4
====================================================

Summary
-------

  **FAILURE**

  Serious unknown changes coming with Patchwork_163608v4 absolutely need to be
  verified manually.
  
  If you think the reported changes have nothing to do with the changes
  introduced in Patchwork_163608v4, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them
  to document this new failure mode, which will reduce false positives in CI.

  External URL: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_163608v4/index.html

Participating hosts (42 -> 40)
------------------------------

  Missing    (2): bat-dg2-13 fi-snb-2520m 

Possible new issues
-------------------

  Here are the unknown changes that may have been introduced in Patchwork_163608v4:

### IGT changes ###

#### Possible regressions ####

  * igt@core_hotunplug@unbind-rebind:
    - bat-apl-1:          [PASS][1] -> [DMESG-WARN][2]
   [1]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18520/bat-apl-1/igt@core_hotunplug@unbind-rebind.html
   [2]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_163608v4/bat-apl-1/igt@core_hotunplug@unbind-rebind.html

  


Build changes
-------------

  * Linux: CI_DRM_18520 -> Patchwork_163608v4

  CI-20190529: 20190529
  CI_DRM_18520: 4d278f945ef2667d9661d623a3aa9501f17ab784 @ git://anongit.freedesktop.org/gfx-ci/linux
  IGT_8920: f850fd46bb65d821ca7e3a8895e685eff2128ef5 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
  Patchwork_163608v4: 4d278f945ef2667d9661d623a3aa9501f17ab784 @ git://anongit.freedesktop.org/gfx-ci/linux

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_163608v4/index.html

--===============5039968242106434972==
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
<tr><td><b>Series:</b></td><td>drm/atomic: Rework initial state allocation (rev4)</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/163608/">https://patchwork.freedesktop.org/series/163608/</a></td></tr>
<tr><td><b>State:</b></td><td>failure</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_163608v4/index.html">https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_163608v4/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from CI_DRM_18520 -&gt; Patchwork_163608v4</h1>
<h2>Summary</h2>
<p><strong>FAILURE</strong></p>
<p>Serious unknown changes coming with Patchwork_163608v4 absolutely need to be<br />
  verified manually.</p>
<p>If you think the reported changes have nothing to do with the changes<br />
  introduced in Patchwork_163608v4, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them<br />
  to document this new failure mode, which will reduce false positives in CI.</p>
<p>External URL: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_163608v4/index.html</p>
<h2>Participating hosts (42 -&gt; 40)</h2>
<p>Missing    (2): bat-dg2-13 fi-snb-2520m </p>
<h2>Possible new issues</h2>
<p>Here are the unknown changes that may have been introduced in Patchwork_163608v4:</p>
<h3>IGT changes</h3>
<h4>Possible regressions</h4>
<ul>
<li>igt@core_hotunplug@unbind-rebind:<ul>
<li>bat-apl-1:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18520/bat-apl-1/igt@core_hotunplug@unbind-rebind.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_163608v4/bat-apl-1/igt@core_hotunplug@unbind-rebind.html">DMESG-WARN</a></li>
</ul>
</li>
</ul>
<h2>Build changes</h2>
<ul>
<li>Linux: CI_DRM_18520 -&gt; Patchwork_163608v4</li>
</ul>
<p>CI-20190529: 20190529<br />
  CI_DRM_18520: 4d278f945ef2667d9661d623a3aa9501f17ab784 @ git://anongit.freedesktop.org/gfx-ci/linux<br />
  IGT_8920: f850fd46bb65d821ca7e3a8895e685eff2128ef5 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git<br />
  Patchwork_163608v4: 4d278f945ef2667d9661d623a3aa9501f17ab784 @ git://anongit.freedesktop.org/gfx-ci/linux</p>

</body>
</html>

--===============5039968242106434972==--
