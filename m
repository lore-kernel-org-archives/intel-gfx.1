Return-Path: <intel-gfx-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 78A90D778AB
	for <intel-gfx@archiver.kernel.org>; Fri, 23 Jan 2026 18:10:24 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0EA5010EBA1;
	Fri, 23 Jan 2026 18:10:24 +0000 (UTC)
Received: from a3b018990fe9 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C043410EB99;
 Fri, 23 Jan 2026 18:10:22 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============3578710760929657002=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=93_i915=2ECI=2EBAT=3A_success_for_drm/i915/display=3A_vcpi_?=
 =?utf-8?q?is_always_greater_than_zero?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Jonathan Cavitt" <jonathan.cavitt@intel.com>
Cc: intel-gfx@lists.freedesktop.org
Date: Fri, 23 Jan 2026 18:10:22 -0000
Message-ID: <176919182267.187528.641150128590428152@a3b018990fe9>
X-Patchwork-Hint: ignore
References: <20260123170914.64548-2-jonathan.cavitt@intel.com>
In-Reply-To: <20260123170914.64548-2-jonathan.cavitt@intel.com>
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

--===============3578710760929657002==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: drm/i915/display: vcpi is always greater than zero
URL   : https://patchwork.freedesktop.org/series/160563/
State : success

== Summary ==

CI Bug Log - changes from CI_DRM_17877 -> Patchwork_160563v1
====================================================

Summary
-------

  **SUCCESS**

  No regressions found.

  External URL: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_160563v1/index.html

Participating hosts (43 -> 41)
------------------------------

  Missing    (2): bat-dg2-13 fi-snb-2520m 

Known issues
------------

  Here are the changes found in Patchwork_160563v1 that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@kms_pm_rpm@basic-rte:
    - bat-rpls-4:         [PASS][1] -> [DMESG-WARN][2] ([i915#13400])
   [1]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17877/bat-rpls-4/igt@kms_pm_rpm@basic-rte.html
   [2]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_160563v1/bat-rpls-4/igt@kms_pm_rpm@basic-rte.html

  
  [i915#13400]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13400


Build changes
-------------

  * Linux: CI_DRM_17877 -> Patchwork_160563v1

  CI-20190529: 20190529
  CI_DRM_17877: ab42b1c3fe4ce1ae5534c51b880d3a97e6bba145 @ git://anongit.freedesktop.org/gfx-ci/linux
  IGT_8715: 8715
  Patchwork_160563v1: ab42b1c3fe4ce1ae5534c51b880d3a97e6bba145 @ git://anongit.freedesktop.org/gfx-ci/linux

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_160563v1/index.html

--===============3578710760929657002==
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
<tr><td><b>Series:</b></td><td>drm/i915/display: vcpi is always greater than zero</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/160563/">https://patchwork.freedesktop.org/series/160563/</a></td></tr>
<tr><td><b>State:</b></td><td>success</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_160563v1/index.html">https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_160563v1/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from CI_DRM_17877 -&gt; Patchwork_160563v1</h1>
<h2>Summary</h2>
<p><strong>SUCCESS</strong></p>
<p>No regressions found.</p>
<p>External URL: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_160563v1/index.html</p>
<h2>Participating hosts (43 -&gt; 41)</h2>
<p>Missing    (2): bat-dg2-13 fi-snb-2520m </p>
<h2>Known issues</h2>
<p>Here are the changes found in Patchwork_160563v1 that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>igt@kms_pm_rpm@basic-rte:<ul>
<li>bat-rpls-4:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17877/bat-rpls-4/igt@kms_pm_rpm@basic-rte.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_160563v1/bat-rpls-4/igt@kms_pm_rpm@basic-rte.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13400">i915#13400</a>)</li>
</ul>
</li>
</ul>
<h2>Build changes</h2>
<ul>
<li>Linux: CI_DRM_17877 -&gt; Patchwork_160563v1</li>
</ul>
<p>CI-20190529: 20190529<br />
  CI_DRM_17877: ab42b1c3fe4ce1ae5534c51b880d3a97e6bba145 @ git://anongit.freedesktop.org/gfx-ci/linux<br />
  IGT_8715: 8715<br />
  Patchwork_160563v1: ab42b1c3fe4ce1ae5534c51b880d3a97e6bba145 @ git://anongit.freedesktop.org/gfx-ci/linux</p>

</body>
</html>

--===============3578710760929657002==--
