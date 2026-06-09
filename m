Return-Path: <intel-gfx-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0E0B4CD8CAA
	for <intel-gfx@archiver.kernel.org>; Tue,  9 Jun 2026 14:40:51 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9D7A810E324;
	Tue,  9 Jun 2026 14:40:50 +0000 (UTC)
Received: from 6beec6c84f66 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5BE5910E324;
 Tue,  9 Jun 2026 14:40:49 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============5657526389751239339=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=93_i915=2ECI=2EBAT=3A_success_for_drm/i915/psr=3A_Flush_on_?=
 =?utf-8?q?cursor_update_also_when_not_using_Selective_Fetch_=28rev2=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Hogander, Jouni" <jouni.hogander@intel.com>
Cc: intel-gfx@lists.freedesktop.org
Date: Tue, 09 Jun 2026 14:40:49 -0000
Message-ID: <178101604936.61411.11083421327449791532@6beec6c84f66>
X-Patchwork-Hint: ignore
References: <20260608064235.20053-1-jouni.hogander@intel.com>
In-Reply-To: <20260608064235.20053-1-jouni.hogander@intel.com>
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

--===============5657526389751239339==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: drm/i915/psr: Flush on cursor update also when not using Selective Fetch (rev2)
URL   : https://patchwork.freedesktop.org/series/168050/
State : success

== Summary ==

CI Bug Log - changes from CI_DRM_18648 -> Patchwork_168050v2
====================================================

Summary
-------

  **SUCCESS**

  No regressions found.

  External URL: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_168050v2/index.html

Participating hosts (42 -> 40)
------------------------------

  Missing    (2): bat-dg2-13 fi-snb-2520m 


Changes
-------

  No changes found


Build changes
-------------

  * Linux: CI_DRM_18648 -> Patchwork_168050v2

  CI-20190529: 20190529
  CI_DRM_18648: 1e8798282ef0590ad21ca33d80e225208d9c7864 @ git://anongit.freedesktop.org/gfx-ci/linux
  IGT_8955: 8955
  Patchwork_168050v2: 1e8798282ef0590ad21ca33d80e225208d9c7864 @ git://anongit.freedesktop.org/gfx-ci/linux

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_168050v2/index.html

--===============5657526389751239339==
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
<tr><td><b>Series:</b></td><td>drm/i915/psr: Flush on cursor update also when not using Selective Fetch (rev2)</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/168050/">https://patchwork.freedesktop.org/series/168050/</a></td></tr>
<tr><td><b>State:</b></td><td>success</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_168050v2/index.html">https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_168050v2/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from CI_DRM_18648 -&gt; Patchwork_168050v2</h1>
<h2>Summary</h2>
<p><strong>SUCCESS</strong></p>
<p>No regressions found.</p>
<p>External URL: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_168050v2/index.html</p>
<h2>Participating hosts (42 -&gt; 40)</h2>
<p>Missing    (2): bat-dg2-13 fi-snb-2520m </p>
<h2>Changes</h2>
<p>No changes found</p>
<h2>Build changes</h2>
<ul>
<li>Linux: CI_DRM_18648 -&gt; Patchwork_168050v2</li>
</ul>
<p>CI-20190529: 20190529<br />
  CI_DRM_18648: 1e8798282ef0590ad21ca33d80e225208d9c7864 @ git://anongit.freedesktop.org/gfx-ci/linux<br />
  IGT_8955: 8955<br />
  Patchwork_168050v2: 1e8798282ef0590ad21ca33d80e225208d9c7864 @ git://anongit.freedesktop.org/gfx-ci/linux</p>

</body>
</html>

--===============5657526389751239339==--
