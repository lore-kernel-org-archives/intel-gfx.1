Return-Path: <intel-gfx-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 56904C5AC67
	for <intel-gfx@archiver.kernel.org>; Thu,  6 Aug 2026 21:49:37 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A50DF10E023;
	Thu,  6 Aug 2026 21:49:36 +0000 (UTC)
Received: from 61270ab9df2a (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3E15A10E023;
 Thu,  6 Aug 2026 21:49:35 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============5780419014679298207=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=93_i915=2ECI=2EBAT=3A_success_for_drm/i915/dp=5Fmst=3A_Remo?=
 =?utf-8?q?ve_duplicate_intel=5Fpfit=5Fcompute=5Fconfig=28=29_call?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Chaitanya Kumar Borah" <chaitanya.kumar.borah@intel.com>
Cc: intel-gfx@lists.freedesktop.org
Date: Thu, 06 Aug 2026 21:49:35 -0000
Message-ID: <178605297524.26709.1135764121765786642@61270ab9df2a>
X-Patchwork-Hint: ignore
References: <20260806074819.2631970-1-chaitanya.kumar.borah@intel.com>
In-Reply-To: <20260806074819.2631970-1-chaitanya.kumar.borah@intel.com>
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

--===============5780419014679298207==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: drm/i915/dp_mst: Remove duplicate intel_pfit_compute_config() call
URL   : https://patchwork.freedesktop.org/series/171712/
State : success

== Summary ==

CI Bug Log - changes from CI_DRM_18955 -> Patchwork_171712v1
====================================================

Summary
-------

  **SUCCESS**

  No regressions found.

  External URL: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_171712v1/index.html

Participating hosts (39 -> 37)
------------------------------

  Missing    (2): bat-dg2-13 fi-snb-2520m 

Known issues
------------

  Here are the changes found in Patchwork_171712v1 that come from known issues:

### IGT changes ###

#### Possible fixes ####

  * igt@kms_hdmi_inject@inject-audio:
    - fi-tgl-1115g4:      [FAIL][1] ([i915#16664]) -> [PASS][2]
   [1]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18955/fi-tgl-1115g4/igt@kms_hdmi_inject@inject-audio.html
   [2]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_171712v1/fi-tgl-1115g4/igt@kms_hdmi_inject@inject-audio.html

  
  [i915#16664]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16664


Build changes
-------------

  * Linux: CI_DRM_18955 -> Patchwork_171712v1

  CI-20190529: 20190529
  CI_DRM_18955: 8d11ccdc98daac5e969243b42907fd060a650091 @ git://anongit.freedesktop.org/gfx-ci/linux
  IGT_9041: 9041
  Patchwork_171712v1: 8d11ccdc98daac5e969243b42907fd060a650091 @ git://anongit.freedesktop.org/gfx-ci/linux

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_171712v1/index.html

--===============5780419014679298207==
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
<tr><td><b>Series:</b></td><td>drm/i915/dp_mst: Remove duplicate intel_pfit_compute_config() call</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/171712/">https://patchwork.freedesktop.org/series/171712/</a></td></tr>
<tr><td><b>State:</b></td><td>success</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_171712v1/index.html">https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_171712v1/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from CI_DRM_18955 -&gt; Patchwork_171712v1</h1>
<h2>Summary</h2>
<p><strong>SUCCESS</strong></p>
<p>No regressions found.</p>
<p>External URL: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_171712v1/index.html</p>
<h2>Participating hosts (39 -&gt; 37)</h2>
<p>Missing    (2): bat-dg2-13 fi-snb-2520m </p>
<h2>Known issues</h2>
<p>Here are the changes found in Patchwork_171712v1 that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Possible fixes</h4>
<ul>
<li>igt@kms_hdmi_inject@inject-audio:<ul>
<li>fi-tgl-1115g4:      <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18955/fi-tgl-1115g4/igt@kms_hdmi_inject@inject-audio.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16664">i915#16664</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_171712v1/fi-tgl-1115g4/igt@kms_hdmi_inject@inject-audio.html">PASS</a></li>
</ul>
</li>
</ul>
<h2>Build changes</h2>
<ul>
<li>Linux: CI_DRM_18955 -&gt; Patchwork_171712v1</li>
</ul>
<p>CI-20190529: 20190529<br />
  CI_DRM_18955: 8d11ccdc98daac5e969243b42907fd060a650091 @ git://anongit.freedesktop.org/gfx-ci/linux<br />
  IGT_9041: 9041<br />
  Patchwork_171712v1: 8d11ccdc98daac5e969243b42907fd060a650091 @ git://anongit.freedesktop.org/gfx-ci/linux</p>

</body>
</html>

--===============5780419014679298207==--
