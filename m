Return-Path: <intel-gfx-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E977EC43458
	for <intel-gfx@archiver.kernel.org>; Tue,  7 Jul 2026 02:39:29 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7BF3710EB3B;
	Tue,  7 Jul 2026 02:39:29 +0000 (UTC)
Received: from 6beec6c84f66 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8110710E408;
 Tue,  7 Jul 2026 02:39:28 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============1921226828782146099=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=93_i915=2ECI=2EBAT=3A_success_for_drm/i915=3A_All_fixes_to_?=
 =?utf-8?q?make_i915_work_well_with_PREEMPT=5FRT=2E_=28rev5=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Maarten Lankhorst" <dev@lankhorst.se>
Cc: intel-gfx@lists.freedesktop.org
Date: Tue, 07 Jul 2026 02:39:28 -0000
Message-ID: <178339196852.158191.14368788033534619335@6beec6c84f66>
X-Patchwork-Hint: ignore
References: <20260706114823.752313-1-dev@lankhorst.se>
In-Reply-To: <20260706114823.752313-1-dev@lankhorst.se>
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

--===============1921226828782146099==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: drm/i915: All fixes to make i915 work well with PREEMPT_RT. (rev5)
URL   : https://patchwork.freedesktop.org/series/169677/
State : success

== Summary ==

CI Bug Log - changes from CI_DRM_18772 -> Patchwork_169677v5
====================================================

Summary
-------

  **SUCCESS**

  No regressions found.

  External URL: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_169677v5/index.html

Participating hosts (42 -> 39)
------------------------------

  Missing    (3): bat-dg2-13 fi-snb-2520m bat-adls-6 


Changes
-------

  No changes found


Build changes
-------------

  * Linux: CI_DRM_18772 -> Patchwork_169677v5

  CI-20190529: 20190529
  CI_DRM_18772: 6085bbba363b5c5b1f0e0420a9d7ecfd8ccea907 @ git://anongit.freedesktop.org/gfx-ci/linux
  IGT_8990: 8990
  Patchwork_169677v5: 6085bbba363b5c5b1f0e0420a9d7ecfd8ccea907 @ git://anongit.freedesktop.org/gfx-ci/linux

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_169677v5/index.html

--===============1921226828782146099==
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
<tr><td><b>Series:</b></td><td>drm/i915: All fixes to make i915 work well with PREEMPT_RT. (rev5)</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/169677/">https://patchwork.freedesktop.org/series/169677/</a></td></tr>
<tr><td><b>State:</b></td><td>success</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_169677v5/index.html">https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_169677v5/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from CI_DRM_18772 -&gt; Patchwork_169677v5</h1>
<h2>Summary</h2>
<p><strong>SUCCESS</strong></p>
<p>No regressions found.</p>
<p>External URL: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_169677v5/index.html</p>
<h2>Participating hosts (42 -&gt; 39)</h2>
<p>Missing    (3): bat-dg2-13 fi-snb-2520m bat-adls-6 </p>
<h2>Changes</h2>
<p>No changes found</p>
<h2>Build changes</h2>
<ul>
<li>Linux: CI_DRM_18772 -&gt; Patchwork_169677v5</li>
</ul>
<p>CI-20190529: 20190529<br />
  CI_DRM_18772: 6085bbba363b5c5b1f0e0420a9d7ecfd8ccea907 @ git://anongit.freedesktop.org/gfx-ci/linux<br />
  IGT_8990: 8990<br />
  Patchwork_169677v5: 6085bbba363b5c5b1f0e0420a9d7ecfd8ccea907 @ git://anongit.freedesktop.org/gfx-ci/linux</p>

</body>
</html>

--===============1921226828782146099==--
