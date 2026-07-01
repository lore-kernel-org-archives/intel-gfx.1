Return-Path: <intel-gfx-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 22F8DC43458
	for <intel-gfx@archiver.kernel.org>; Wed,  1 Jul 2026 10:39:07 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 831C910EEBD;
	Wed,  1 Jul 2026 10:39:06 +0000 (UTC)
Received: from 6beec6c84f66 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 900C110EEBD;
 Wed,  1 Jul 2026 10:39:05 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============5957972394591777777=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=93_i915=2ECI=2EBAT=3A_success_for_drm/i915/gem=3A_Do_not_le?=
 =?utf-8?q?ak_siblings=5B=5D_on_proto_context_error_=28rev2=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Joonas Lahtinen" <joonas.lahtinen@linux.intel.com>
Cc: intel-gfx@lists.freedesktop.org
Date: Wed, 01 Jul 2026 10:39:05 -0000
Message-ID: <178290234558.135912.4520638443289729719@6beec6c84f66>
X-Patchwork-Hint: ignore
References: <20260701073030.44850-1-joonas.lahtinen@linux.intel.com>
In-Reply-To: <20260701073030.44850-1-joonas.lahtinen@linux.intel.com>
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

--===============5957972394591777777==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: drm/i915/gem: Do not leak siblings[] on proto context error (rev2)
URL   : https://patchwork.freedesktop.org/series/169558/
State : success

== Summary ==

CI Bug Log - changes from CI_DRM_18738 -> Patchwork_169558v2
====================================================

Summary
-------

  **SUCCESS**

  No regressions found.

  External URL: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_169558v2/index.html

Participating hosts (42 -> 40)
------------------------------

  Missing    (2): bat-dg2-13 fi-snb-2520m 


Changes
-------

  No changes found


Build changes
-------------

  * Linux: CI_DRM_18738 -> Patchwork_169558v2

  CI-20190529: 20190529
  CI_DRM_18738: 1441c1f8fee3995463a797cb1a759fe9f7ccb047 @ git://anongit.freedesktop.org/gfx-ci/linux
  IGT_8989: a8e2cbd2854d7980a9eccecc6e0c801d0824b88f @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
  Patchwork_169558v2: 1441c1f8fee3995463a797cb1a759fe9f7ccb047 @ git://anongit.freedesktop.org/gfx-ci/linux

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_169558v2/index.html

--===============5957972394591777777==
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
<tr><td><b>Series:</b></td><td>drm/i915/gem: Do not leak siblings[] on proto context error (rev2)</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/169558/">https://patchwork.freedesktop.org/series/169558/</a></td></tr>
<tr><td><b>State:</b></td><td>success</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_169558v2/index.html">https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_169558v2/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from CI_DRM_18738 -&gt; Patchwork_169558v2</h1>
<h2>Summary</h2>
<p><strong>SUCCESS</strong></p>
<p>No regressions found.</p>
<p>External URL: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_169558v2/index.html</p>
<h2>Participating hosts (42 -&gt; 40)</h2>
<p>Missing    (2): bat-dg2-13 fi-snb-2520m </p>
<h2>Changes</h2>
<p>No changes found</p>
<h2>Build changes</h2>
<ul>
<li>Linux: CI_DRM_18738 -&gt; Patchwork_169558v2</li>
</ul>
<p>CI-20190529: 20190529<br />
  CI_DRM_18738: 1441c1f8fee3995463a797cb1a759fe9f7ccb047 @ git://anongit.freedesktop.org/gfx-ci/linux<br />
  IGT_8989: a8e2cbd2854d7980a9eccecc6e0c801d0824b88f @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git<br />
  Patchwork_169558v2: 1441c1f8fee3995463a797cb1a759fe9f7ccb047 @ git://anongit.freedesktop.org/gfx-ci/linux</p>

</body>
</html>

--===============5957972394591777777==--
