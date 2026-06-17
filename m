Return-Path: <intel-gfx-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CCAC5CD98F2
	for <intel-gfx@archiver.kernel.org>; Wed, 17 Jun 2026 15:55:53 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5F28B10E571;
	Wed, 17 Jun 2026 15:55:53 +0000 (UTC)
Received: from 6beec6c84f66 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6EDFA10E571;
 Wed, 17 Jun 2026 15:55:51 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============7426539786876593424=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=93_i915=2ECI=2EBAT=3A_success_for_drm/dp=3A_Move_byte-by-by?=
 =?utf-8?q?te_AUX_read_fallback_to_drm=5Fdp=5Fdpcd=5Fread=28=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Chia-Lin Kao (AceLan)" <acelan.kao@canonical.com>
Cc: intel-gfx@lists.freedesktop.org
Date: Wed, 17 Jun 2026 15:55:51 -0000
Message-ID: <178171175144.90144.6497856881604257742@6beec6c84f66>
X-Patchwork-Hint: ignore
References: <20260616053802.1673782-1-acelan.kao@canonical.com>
In-Reply-To: <20260616053802.1673782-1-acelan.kao@canonical.com>
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

--===============7426539786876593424==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: drm/dp: Move byte-by-byte AUX read fallback to drm_dp_dpcd_read()
URL   : https://patchwork.freedesktop.org/series/168715/
State : success

== Summary ==

CI Bug Log - changes from CI_DRM_18696 -> Patchwork_168715v1
====================================================

Summary
-------

  **SUCCESS**

  No regressions found.

  External URL: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_168715v1/index.html

Participating hosts (42 -> 40)
------------------------------

  Missing    (2): bat-dg2-13 fi-snb-2520m 


Changes
-------

  No changes found


Build changes
-------------

  * Linux: CI_DRM_18696 -> Patchwork_168715v1

  CI-20190529: 20190529
  CI_DRM_18696: f7cb2873b7430d84afd4ad4e4771d3f8ad03fbf9 @ git://anongit.freedesktop.org/gfx-ci/linux
  IGT_8969: 5a8fa64e48c3c30af9afa2824d6adb5ad2bcc5a3 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
  Patchwork_168715v1: f7cb2873b7430d84afd4ad4e4771d3f8ad03fbf9 @ git://anongit.freedesktop.org/gfx-ci/linux

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_168715v1/index.html

--===============7426539786876593424==
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
<tr><td><b>Series:</b></td><td>drm/dp: Move byte-by-byte AUX read fallback to drm_dp_dpcd_read()</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/168715/">https://patchwork.freedesktop.org/series/168715/</a></td></tr>
<tr><td><b>State:</b></td><td>success</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_168715v1/index.html">https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_168715v1/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from CI_DRM_18696 -&gt; Patchwork_168715v1</h1>
<h2>Summary</h2>
<p><strong>SUCCESS</strong></p>
<p>No regressions found.</p>
<p>External URL: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_168715v1/index.html</p>
<h2>Participating hosts (42 -&gt; 40)</h2>
<p>Missing    (2): bat-dg2-13 fi-snb-2520m </p>
<h2>Changes</h2>
<p>No changes found</p>
<h2>Build changes</h2>
<ul>
<li>Linux: CI_DRM_18696 -&gt; Patchwork_168715v1</li>
</ul>
<p>CI-20190529: 20190529<br />
  CI_DRM_18696: f7cb2873b7430d84afd4ad4e4771d3f8ad03fbf9 @ git://anongit.freedesktop.org/gfx-ci/linux<br />
  IGT_8969: 5a8fa64e48c3c30af9afa2824d6adb5ad2bcc5a3 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git<br />
  Patchwork_168715v1: f7cb2873b7430d84afd4ad4e4771d3f8ad03fbf9 @ git://anongit.freedesktop.org/gfx-ci/linux</p>

</body>
</html>

--===============7426539786876593424==--
