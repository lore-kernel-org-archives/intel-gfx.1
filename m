Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B9E14606A31C
	for <intel-gfx@archiver.kernel.org>; Mon, 16 Nov 2026 13:31:25 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5100F10F1B4;
	Mon, 16 Nov 2026 13:31:25 +0000 (UTC)
Received: from 9ac1b63fe3ea (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 08F3410F1A5;
 Mon, 16 Nov 2026 13:31:24 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============2515610222495277731=="
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=93_i915=2ECI=2EBAT=3A_success_for_drm/atomic=3A_Try_to_make?=
 =?utf-8?q?_atomic+async_usable=2C_and_clear_up_the_=22async_update=22_helpe?=
 =?utf-8?q?r_confusion?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: =?utf-8?b?VmlsbGUgU3lyasOkbMOk?= <ville.syrjala@linux.intel.com>
Cc: intel-gfx@lists.freedesktop.org
Date: Mon, 16 Nov 2026 13:31:24 -0000
Message-ID: <179483588402.31658.3315120234017471810@9ac1b63fe3ea>
X-Patchwork-Hint: ignore
References: <20261116091130.13950-1-ville.syrjala@linux.intel.com>
In-Reply-To: <20261116091130.13950-1-ville.syrjala@linux.intel.com>
X-BeenThere: intel-gfx@lists.freedesktop.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Intel graphics driver community testing & development
 <intel-gfx.lists.freedesktop.org>
List-Archive: <https://lists.freedesktop.org/archives/intel-gfx>
List-Post: <mailto:intel-gfx@lists.freedesktop.org>
List-Help: <mailto:intel-gfx-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/intel-gfx>,
 <mailto:intel-gfx-request@lists.freedesktop.org?subject=subscribe>
Reply-To: intel-gfx@lists.freedesktop.org
Sender: "Intel-gfx" <intel-gfx-bounces@lists.freedesktop.org>
X-Spam-Status: No, score=-6.0 required=3.0 tests=BAYES_00,HTML_MESSAGE,
	MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS
	autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

--===============2515610222495277731==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: drm/atomic: Try to make atomic+async usable, and clear up the "async update" helper confusion
URL   : https://patchwork.freedesktop.org/series/178656/
State : success

== Summary ==

CI Bug Log - changes from CI_DRM_19531 -> Patchwork_178656v1
====================================================

Summary
-------

  **SUCCESS**

  No regressions found.

  External URL: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_178656v1/index.html

Participating hosts (39 -> 38)
------------------------------

  Missing    (1): bat-dg2-13 


Changes
-------

  No changes found


Build changes
-------------

  * Linux: CI_DRM_19531 -> Patchwork_178656v1

  CI-20190529: 20190529
  CI_DRM_19531: 038b4cc7dba91006374b26c220bdad77c5d6bb42 @ git://anongit.freedesktop.org/gfx-ci/linux
  IGT_9192: 9192
  Patchwork_178656v1: 038b4cc7dba91006374b26c220bdad77c5d6bb42 @ git://anongit.freedesktop.org/gfx-ci/linux

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_178656v1/index.html

--===============2515610222495277731==
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
<tr><td><b>Series:</b></td><td>drm/atomic: Try to make atomic+async usable, and clear up the &quot;async update&quot; helper confusion</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/178656/">https://patchwork.freedesktop.org/series/178656/</a></td></tr>
<tr><td><b>State:</b></td><td>success</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_178656v1/index.html">https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_178656v1/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from CI_DRM_19531 -&gt; Patchwork_178656v1</h1>
<h2>Summary</h2>
<p><strong>SUCCESS</strong></p>
<p>No regressions found.</p>
<p>External URL: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_178656v1/index.html</p>
<h2>Participating hosts (39 -&gt; 38)</h2>
<p>Missing    (1): bat-dg2-13 </p>
<h2>Changes</h2>
<p>No changes found</p>
<h2>Build changes</h2>
<ul>
<li>Linux: CI_DRM_19531 -&gt; Patchwork_178656v1</li>
</ul>
<p>CI-20190529: 20190529<br />
  CI_DRM_19531: 038b4cc7dba91006374b26c220bdad77c5d6bb42 @ git://anongit.freedesktop.org/gfx-ci/linux<br />
  IGT_9192: 9192<br />
  Patchwork_178656v1: 038b4cc7dba91006374b26c220bdad77c5d6bb42 @ git://anongit.freedesktop.org/gfx-ci/linux</p>

</body>
</html>

--===============2515610222495277731==--
