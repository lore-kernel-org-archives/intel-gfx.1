Return-Path: <intel-gfx-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 286C1C43458
	for <intel-gfx@archiver.kernel.org>; Tue,  7 Jul 2026 15:46:10 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9524E89B33;
	Tue,  7 Jul 2026 15:46:09 +0000 (UTC)
Received: from 6beec6c84f66 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9FBE410EE3F;
 Tue,  7 Jul 2026 15:46:08 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============6150785959793826561=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=93_i915=2ECI=2EBAT=3A_success_for_vga=5Fswitcheroo=2C_drm?=
 =?utf-8?q?=3A_Push_fbcon_handling_into_DRM_clients?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Thomas Zimmermann" <tzimmermann@suse.de>
Cc: intel-gfx@lists.freedesktop.org
Date: Tue, 07 Jul 2026 15:46:08 -0000
Message-ID: <178343916864.162395.6845617452301481536@6beec6c84f66>
X-Patchwork-Hint: ignore
References: <20260707135724.247562-1-tzimmermann@suse.de>
In-Reply-To: <20260707135724.247562-1-tzimmermann@suse.de>
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

--===============6150785959793826561==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: vga_switcheroo, drm: Push fbcon handling into DRM clients
URL   : https://patchwork.freedesktop.org/series/169933/
State : success

== Summary ==

CI Bug Log - changes from CI_DRM_18777 -> Patchwork_169933v1
====================================================

Summary
-------

  **SUCCESS**

  No regressions found.

  External URL: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_169933v1/index.html

Participating hosts (42 -> 40)
------------------------------

  Missing    (2): bat-dg2-13 fi-snb-2520m 

Known issues
------------

  Here are the changes found in Patchwork_169933v1 that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@i915_selftest@live@client:
    - fi-kbl-7567u:       [PASS][1] -> [DMESG-WARN][2] ([i915#13735]) +13 other tests dmesg-warn
   [1]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18777/fi-kbl-7567u/igt@i915_selftest@live@client.html
   [2]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_169933v1/fi-kbl-7567u/igt@i915_selftest@live@client.html

  
  [i915#13735]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13735


Build changes
-------------

  * Linux: CI_DRM_18777 -> Patchwork_169933v1

  CI-20190529: 20190529
  CI_DRM_18777: 7a8782fa5da551a92ada0aca6f7dbadfc4c36da3 @ git://anongit.freedesktop.org/gfx-ci/linux
  IGT_8991: c5721520bb6611ab8fcbe27db0c120b72d25b99e @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
  Patchwork_169933v1: 7a8782fa5da551a92ada0aca6f7dbadfc4c36da3 @ git://anongit.freedesktop.org/gfx-ci/linux

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_169933v1/index.html

--===============6150785959793826561==
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
<tr><td><b>Series:</b></td><td>vga_switcheroo, drm: Push fbcon handling into DRM clients</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/169933/">https://patchwork.freedesktop.org/series/169933/</a></td></tr>
<tr><td><b>State:</b></td><td>success</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_169933v1/index.html">https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_169933v1/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from CI_DRM_18777 -&gt; Patchwork_169933v1</h1>
<h2>Summary</h2>
<p><strong>SUCCESS</strong></p>
<p>No regressions found.</p>
<p>External URL: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_169933v1/index.html</p>
<h2>Participating hosts (42 -&gt; 40)</h2>
<p>Missing    (2): bat-dg2-13 fi-snb-2520m </p>
<h2>Known issues</h2>
<p>Here are the changes found in Patchwork_169933v1 that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>igt@i915_selftest@live@client:<ul>
<li>fi-kbl-7567u:       <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18777/fi-kbl-7567u/igt@i915_selftest@live@client.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_169933v1/fi-kbl-7567u/igt@i915_selftest@live@client.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13735">i915#13735</a>) +13 other tests dmesg-warn</li>
</ul>
</li>
</ul>
<h2>Build changes</h2>
<ul>
<li>Linux: CI_DRM_18777 -&gt; Patchwork_169933v1</li>
</ul>
<p>CI-20190529: 20190529<br />
  CI_DRM_18777: 7a8782fa5da551a92ada0aca6f7dbadfc4c36da3 @ git://anongit.freedesktop.org/gfx-ci/linux<br />
  IGT_8991: c5721520bb6611ab8fcbe27db0c120b72d25b99e @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git<br />
  Patchwork_169933v1: 7a8782fa5da551a92ada0aca6f7dbadfc4c36da3 @ git://anongit.freedesktop.org/gfx-ci/linux</p>

</body>
</html>

--===============6150785959793826561==--
