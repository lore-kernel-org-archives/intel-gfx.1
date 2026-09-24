Return-Path: <intel-gfx-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 02030C9830E
	for <intel-gfx@archiver.kernel.org>; Thu, 24 Sep 2026 17:33:42 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7C86A10F6C9;
	Thu, 24 Sep 2026 17:33:42 +0000 (UTC)
Received: from 61270ab9df2a (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CEEB310F6C6;
 Thu, 24 Sep 2026 17:33:41 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============8773979174803328192=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=93_i915=2ECI=2EBAT=3A_success_for_drm/i915/gmbus=3A_Add_bit?=
 =?utf-8?q?-banging_debugfs_control?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Naladala Ramanaidu" <ramanaidu.naladala@intel.com>
Cc: intel-gfx@lists.freedesktop.org
Date: Thu, 24 Sep 2026 17:33:41 -0000
Message-ID: <179027122184.204817.16387707162885638092@61270ab9df2a>
X-Patchwork-Hint: ignore
References: <20260924152812.439986-1-ramanaidu.naladala@intel.com>
In-Reply-To: <20260924152812.439986-1-ramanaidu.naladala@intel.com>
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

--===============8773979174803328192==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: drm/i915/gmbus: Add bit-banging debugfs control
URL   : https://patchwork.freedesktop.org/series/174931/
State : success

== Summary ==

CI Bug Log - changes from CI_DRM_19218 -> Patchwork_174931v1
====================================================

Summary
-------

  **SUCCESS**

  No regressions found.

  External URL: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_174931v1/index.html

Participating hosts (39 -> 38)
------------------------------

  Missing    (1): bat-dg2-13 


Changes
-------

  No changes found


Build changes
-------------

  * Linux: CI_DRM_19218 -> Patchwork_174931v1

  CI-20190529: 20190529
  CI_DRM_19218: 2ac16c180109b3f1ed00e7a2c4459eaacfc80371 @ git://anongit.freedesktop.org/gfx-ci/linux
  IGT_9112: 8d3284b5ae16ca1aef353dfaffb6c0896ceacc19 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
  Patchwork_174931v1: 2ac16c180109b3f1ed00e7a2c4459eaacfc80371 @ git://anongit.freedesktop.org/gfx-ci/linux

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_174931v1/index.html

--===============8773979174803328192==
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
<tr><td><b>Series:</b></td><td>drm/i915/gmbus: Add bit-banging debugfs control</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/174931/">https://patchwork.freedesktop.org/series/174931/</a></td></tr>
<tr><td><b>State:</b></td><td>success</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_174931v1/index.html">https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_174931v1/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from CI_DRM_19218 -&gt; Patchwork_174931v1</h1>
<h2>Summary</h2>
<p><strong>SUCCESS</strong></p>
<p>No regressions found.</p>
<p>External URL: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_174931v1/index.html</p>
<h2>Participating hosts (39 -&gt; 38)</h2>
<p>Missing    (1): bat-dg2-13 </p>
<h2>Changes</h2>
<p>No changes found</p>
<h2>Build changes</h2>
<ul>
<li>Linux: CI_DRM_19218 -&gt; Patchwork_174931v1</li>
</ul>
<p>CI-20190529: 20190529<br />
  CI_DRM_19218: 2ac16c180109b3f1ed00e7a2c4459eaacfc80371 @ git://anongit.freedesktop.org/gfx-ci/linux<br />
  IGT_9112: 8d3284b5ae16ca1aef353dfaffb6c0896ceacc19 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git<br />
  Patchwork_174931v1: 2ac16c180109b3f1ed00e7a2c4459eaacfc80371 @ git://anongit.freedesktop.org/gfx-ci/linux</p>

</body>
</html>

--===============8773979174803328192==--
