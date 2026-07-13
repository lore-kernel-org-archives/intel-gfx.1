Return-Path: <intel-gfx-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D7E29C44507
	for <intel-gfx@archiver.kernel.org>; Mon, 13 Jul 2026 18:28:33 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 639A010EABE;
	Mon, 13 Jul 2026 18:28:33 +0000 (UTC)
Received: from 6beec6c84f66 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9B8C910E64E;
 Mon, 13 Jul 2026 18:28:32 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============0304625603885668131=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=93_i915=2ECI=2EBAT=3A_success_for_drm/i915/display=3A_Fix_t?=
 =?utf-8?q?oo_few_bits_in_transcoder_mask_variables?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "John Harrison" <john.harrison@igalia.com>
Cc: intel-gfx@lists.freedesktop.org
Date: Mon, 13 Jul 2026 18:28:32 -0000
Message-ID: <178396731262.185196.4993578843929165533@6beec6c84f66>
X-Patchwork-Hint: ignore
References: <20260713165626.2827609-1-John.Harrison@Igalia.com>
In-Reply-To: <20260713165626.2827609-1-John.Harrison@Igalia.com>
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

--===============0304625603885668131==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: drm/i915/display: Fix too few bits in transcoder mask variables
URL   : https://patchwork.freedesktop.org/series/170334/
State : success

== Summary ==

CI Bug Log - changes from CI_DRM_18814 -> Patchwork_170334v1
====================================================

Summary
-------

  **SUCCESS**

  No regressions found.

  External URL: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_170334v1/index.html

Participating hosts (42 -> 40)
------------------------------

  Missing    (2): bat-dg2-13 fi-snb-2520m 


Changes
-------

  No changes found


Build changes
-------------

  * Linux: CI_DRM_18814 -> Patchwork_170334v1

  CI-20190529: 20190529
  CI_DRM_18814: b4ff3505d3eacce720d43e24651ce84f2a0d7f56 @ git://anongit.freedesktop.org/gfx-ci/linux
  IGT_9005: 5d0cdd6f2f5d3ad4992da1edf67f22622a8bb153 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
  Patchwork_170334v1: b4ff3505d3eacce720d43e24651ce84f2a0d7f56 @ git://anongit.freedesktop.org/gfx-ci/linux

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_170334v1/index.html

--===============0304625603885668131==
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
<tr><td><b>Series:</b></td><td>drm/i915/display: Fix too few bits in transcoder mask variables</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/170334/">https://patchwork.freedesktop.org/series/170334/</a></td></tr>
<tr><td><b>State:</b></td><td>success</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_170334v1/index.html">https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_170334v1/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from CI_DRM_18814 -&gt; Patchwork_170334v1</h1>
<h2>Summary</h2>
<p><strong>SUCCESS</strong></p>
<p>No regressions found.</p>
<p>External URL: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_170334v1/index.html</p>
<h2>Participating hosts (42 -&gt; 40)</h2>
<p>Missing    (2): bat-dg2-13 fi-snb-2520m </p>
<h2>Changes</h2>
<p>No changes found</p>
<h2>Build changes</h2>
<ul>
<li>Linux: CI_DRM_18814 -&gt; Patchwork_170334v1</li>
</ul>
<p>CI-20190529: 20190529<br />
  CI_DRM_18814: b4ff3505d3eacce720d43e24651ce84f2a0d7f56 @ git://anongit.freedesktop.org/gfx-ci/linux<br />
  IGT_9005: 5d0cdd6f2f5d3ad4992da1edf67f22622a8bb153 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git<br />
  Patchwork_170334v1: b4ff3505d3eacce720d43e24651ce84f2a0d7f56 @ git://anongit.freedesktop.org/gfx-ci/linux</p>

</body>
</html>

--===============0304625603885668131==--
