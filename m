Return-Path: <intel-gfx-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BA2C8C4829A
	for <intel-gfx@archiver.kernel.org>; Tue, 13 Feb 2024 20:39:28 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C873810E4CD;
	Tue, 13 Feb 2024 20:39:21 +0000 (UTC)
Received: from 5338d5abeb45 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DD8E510E36E;
 Tue, 13 Feb 2024 20:39:20 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============2286490939984260028=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=93_Fi=2ECI=2EBAT=3A_success_for_series_starting_with_=5B1/2?=
 =?utf-8?q?=5D_drm/buddy=3A_Fix_alloc=5Frange=28=29_error_handling_code?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Arunpravin Paneer Selvam" <arunpravin.paneerselvam@amd.com>
Cc: intel-gfx@lists.freedesktop.org
Date: Tue, 13 Feb 2024 20:39:20 -0000
Message-ID: <170785676089.1218995.6009530541487399238@5338d5abeb45>
X-Patchwork-Hint: ignore
References: <20240213135203.348050-1-Arunpravin.PaneerSelvam@amd.com>
In-Reply-To: <20240213135203.348050-1-Arunpravin.PaneerSelvam@amd.com>
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

--===============2286490939984260028==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: series starting with [1/2] drm/buddy: Fix alloc_range() error handling code
URL   : https://patchwork.freedesktop.org/series/129835/
State : success

== Summary ==

CI Bug Log - changes from CI_DRM_14266 -> Patchwork_129835v1
====================================================

Summary
-------

  **SUCCESS**

  No regressions found.

  External URL: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_129835v1/index.html

Participating hosts (38 -> 35)
------------------------------

  Missing    (3): bat-jsl-1 fi-snb-2520m fi-bsw-n3050 

Known issues
------------

  Here are the changes found in Patchwork_129835v1 that come from known issues:

### IGT changes ###

  {name}: This element is suppressed. This means it is ignored when computing
          the status of the difference (SUCCESS, WARNING, or FAILURE).

  [i915#10194]: https://gitlab.freedesktop.org/drm/intel/issues/10194


Build changes
-------------

  * Linux: CI_DRM_14266 -> Patchwork_129835v1

  CI-20190529: 20190529
  CI_DRM_14266: f16ab0ed5e0f1f8d26a88cab8854ed609283906e @ git://anongit.freedesktop.org/gfx-ci/linux
  IGT_7711: 7711
  Patchwork_129835v1: f16ab0ed5e0f1f8d26a88cab8854ed609283906e @ git://anongit.freedesktop.org/gfx-ci/linux


### Linux commits

7176e61dff99 drm/tests/drm_buddy: add alloc_contiguous test
5f26c4e06ea9 drm/buddy: Fix alloc_range() error handling code

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_129835v1/index.html

--===============2286490939984260028==
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
<tr><td><b>Series:</b></td><td>series starting with [1/2] drm/buddy: Fix alloc_range() error handling code</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/129835/">https://patchwork.freedesktop.org/series/129835/</a></td></tr>
<tr><td><b>State:</b></td><td>success</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_129835v1/index.html">https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_129835v1/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from CI_DRM_14266 -&gt; Patchwork_129835v1</h1>
<h2>Summary</h2>
<p><strong>SUCCESS</strong></p>
<p>No regressions found.</p>
<p>External URL: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_129835v1/index.html</p>
<h2>Participating hosts (38 -&gt; 35)</h2>
<p>Missing    (3): bat-jsl-1 fi-snb-2520m fi-bsw-n3050 </p>
<h2>Known issues</h2>
<p>Here are the changes found in Patchwork_129835v1 that come from known issues:</p>
<h3>IGT changes</h3>
<p>{name}: This element is suppressed. This means it is ignored when computing<br />
          the status of the difference (SUCCESS, WARNING, or FAILURE).</p>
<h2>Build changes</h2>
<ul>
<li>Linux: CI_DRM_14266 -&gt; Patchwork_129835v1</li>
</ul>
<p>CI-20190529: 20190529<br />
  CI_DRM_14266: f16ab0ed5e0f1f8d26a88cab8854ed609283906e @ git://anongit.freedesktop.org/gfx-ci/linux<br />
  IGT_7711: 7711<br />
  Patchwork_129835v1: f16ab0ed5e0f1f8d26a88cab8854ed609283906e @ git://anongit.freedesktop.org/gfx-ci/linux</p>
<h3>Linux commits</h3>
<p>7176e61dff99 drm/tests/drm_buddy: add alloc_contiguous test<br />
5f26c4e06ea9 drm/buddy: Fix alloc_range() error handling code</p>

</body>
</html>

--===============2286490939984260028==--
