Return-Path: <intel-gfx-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4076FC43458
	for <intel-gfx@archiver.kernel.org>; Mon, 13 Jul 2026 11:01:43 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9D79F10E450;
	Mon, 13 Jul 2026 11:01:42 +0000 (UTC)
Received: from 6beec6c84f66 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 66E7410E450;
 Mon, 13 Jul 2026 11:01:41 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============2697243611418536922=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=93_i915=2ECI=2EBAT=3A_success_for_drivers=3A_Improve_memory?=
 =?utf-8?q?_management_for_large_object_allocations_when_i915/shmem_is_used_?=
 =?utf-8?q?with_iommu?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Krzysztof Karas" <krzysztof.karas@intel.com>
Cc: intel-gfx@lists.freedesktop.org
Date: Mon, 13 Jul 2026 11:01:41 -0000
Message-ID: <178394050141.182780.807103454930150474@6beec6c84f66>
X-Patchwork-Hint: ignore
References: <20260713095812.1014365-1-krzysztof.karas@intel.com>
In-Reply-To: <20260713095812.1014365-1-krzysztof.karas@intel.com>
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

--===============2697243611418536922==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: drivers: Improve memory management for large object allocations when i915/shmem is used with iommu
URL   : https://patchwork.freedesktop.org/series/170304/
State : success

== Summary ==

CI Bug Log - changes from CI_DRM_18810 -> Patchwork_170304v1
====================================================

Summary
-------

  **SUCCESS**

  No regressions found.

  External URL: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_170304v1/index.html

Participating hosts (42 -> 40)
------------------------------

  Missing    (2): bat-dg2-13 fi-snb-2520m 


Changes
-------

  No changes found


Build changes
-------------

  * Linux: CI_DRM_18810 -> Patchwork_170304v1

  CI-20190529: 20190529
  CI_DRM_18810: 83d782d98f4ebb4a10b8ee107e3a389917e0b218 @ git://anongit.freedesktop.org/gfx-ci/linux
  IGT_9003: 9003
  Patchwork_170304v1: 83d782d98f4ebb4a10b8ee107e3a389917e0b218 @ git://anongit.freedesktop.org/gfx-ci/linux

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_170304v1/index.html

--===============2697243611418536922==
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
<tr><td><b>Series:</b></td><td>drivers: Improve memory management for large object allocations when i915/shmem is used with iommu</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/170304/">https://patchwork.freedesktop.org/series/170304/</a></td></tr>
<tr><td><b>State:</b></td><td>success</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_170304v1/index.html">https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_170304v1/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from CI_DRM_18810 -&gt; Patchwork_170304v1</h1>
<h2>Summary</h2>
<p><strong>SUCCESS</strong></p>
<p>No regressions found.</p>
<p>External URL: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_170304v1/index.html</p>
<h2>Participating hosts (42 -&gt; 40)</h2>
<p>Missing    (2): bat-dg2-13 fi-snb-2520m </p>
<h2>Changes</h2>
<p>No changes found</p>
<h2>Build changes</h2>
<ul>
<li>Linux: CI_DRM_18810 -&gt; Patchwork_170304v1</li>
</ul>
<p>CI-20190529: 20190529<br />
  CI_DRM_18810: 83d782d98f4ebb4a10b8ee107e3a389917e0b218 @ git://anongit.freedesktop.org/gfx-ci/linux<br />
  IGT_9003: 9003<br />
  Patchwork_170304v1: 83d782d98f4ebb4a10b8ee107e3a389917e0b218 @ git://anongit.freedesktop.org/gfx-ci/linux</p>

</body>
</html>

--===============2697243611418536922==--
