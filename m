Return-Path: <intel-gfx-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D2FDFCD5BB3
	for <intel-gfx@archiver.kernel.org>; Fri, 22 May 2026 17:17:59 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 499C210F6C5;
	Fri, 22 May 2026 17:17:59 +0000 (UTC)
Received: from 6beec6c84f66 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1576010E25D;
 Fri, 22 May 2026 17:17:58 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============5414126471051123624=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=93_i915=2ECI=2EBAT=3A_success_for_drm/i915=3A_Don=27t_set_m?=
 =?utf-8?q?in=5Fcdclk_in_the_initial_crtc=5Fstate_=28rev2=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Marius Hoch" <mail@mariushoch.de>
Cc: intel-gfx@lists.freedesktop.org
Date: Fri, 22 May 2026 17:17:58 -0000
Message-ID: <177947027808.289.12952914791197767946@6beec6c84f66>
X-Patchwork-Hint: ignore
References: <20260521180722.328317-2-mail@mariushoch.de>
In-Reply-To: <20260521180722.328317-2-mail@mariushoch.de>
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

--===============5414126471051123624==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: drm/i915: Don't set min_cdclk in the initial crtc_state (rev2)
URL   : https://patchwork.freedesktop.org/series/167094/
State : success

== Summary ==

CI Bug Log - changes from CI_DRM_18542 -> Patchwork_167094v2
====================================================

Summary
-------

  **SUCCESS**

  No regressions found.

  External URL: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_167094v2/index.html

Participating hosts (42 -> 40)
------------------------------

  Missing    (2): bat-dg2-13 fi-snb-2520m 


Changes
-------

  No changes found


Build changes
-------------

  * Linux: CI_DRM_18542 -> Patchwork_167094v2

  CI-20190529: 20190529
  CI_DRM_18542: 60d51bdeabf700864c26264c51b146a86b0a9124 @ git://anongit.freedesktop.org/gfx-ci/linux
  IGT_8936: 98b65acc4f6edf68cd52b30f27b83049c4c5c83b @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
  Patchwork_167094v2: 60d51bdeabf700864c26264c51b146a86b0a9124 @ git://anongit.freedesktop.org/gfx-ci/linux

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_167094v2/index.html

--===============5414126471051123624==
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
<tr><td><b>Series:</b></td><td>drm/i915: Don&#x27;t set min_cdclk in the initial crtc_state (rev2)</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/167094/">https://patchwork.freedesktop.org/series/167094/</a></td></tr>
<tr><td><b>State:</b></td><td>success</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_167094v2/index.html">https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_167094v2/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from CI_DRM_18542 -&gt; Patchwork_167094v2</h1>
<h2>Summary</h2>
<p><strong>SUCCESS</strong></p>
<p>No regressions found.</p>
<p>External URL: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_167094v2/index.html</p>
<h2>Participating hosts (42 -&gt; 40)</h2>
<p>Missing    (2): bat-dg2-13 fi-snb-2520m </p>
<h2>Changes</h2>
<p>No changes found</p>
<h2>Build changes</h2>
<ul>
<li>Linux: CI_DRM_18542 -&gt; Patchwork_167094v2</li>
</ul>
<p>CI-20190529: 20190529<br />
  CI_DRM_18542: 60d51bdeabf700864c26264c51b146a86b0a9124 @ git://anongit.freedesktop.org/gfx-ci/linux<br />
  IGT_8936: 98b65acc4f6edf68cd52b30f27b83049c4c5c83b @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git<br />
  Patchwork_167094v2: 60d51bdeabf700864c26264c51b146a86b0a9124 @ git://anongit.freedesktop.org/gfx-ci/linux</p>

</body>
</html>

--===============5414126471051123624==--
