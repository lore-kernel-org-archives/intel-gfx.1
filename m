Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2EB1D606A331
	for <intel-gfx@archiver.kernel.org>; Mon,  9 Nov 2026 17:57:27 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9825D10E0A7;
	Mon,  9 Nov 2026 17:57:26 +0000 (UTC)
Received: from 221881a7231d (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 878D010E140;
 Mon,  9 Nov 2026 17:57:25 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============4951134330526168609=="
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=93_i915=2ECI=2EBAT=3A_success_for_drm/i915/irq=3A_Micro_opt?=
 =?utf-8?q?imize_gen8/gen11_irq_handlers?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: =?utf-8?b?VmlsbGUgU3lyasOkbMOk?= <ville.syrjala@linux.intel.com>
Cc: intel-gfx@lists.freedesktop.org
Date: Mon, 09 Nov 2026 17:57:25 -0000
Message-ID: <179424704554.140971.10153385461205661852@221881a7231d>
X-Patchwork-Hint: ignore
References: <20261109123012.8110-1-ville.syrjala@linux.intel.com>
In-Reply-To: <20261109123012.8110-1-ville.syrjala@linux.intel.com>
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
	autolearn=no autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

--===============4951134330526168609==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: drm/i915/irq: Micro optimize gen8/gen11 irq handlers
URL   : https://patchwork.freedesktop.org/series/178098/
State : success

== Summary ==

CI Bug Log - changes from CI_DRM_19475 -> Patchwork_178098v1
====================================================

Summary
-------

  **SUCCESS**

  No regressions found.

  External URL: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_178098v1/index.html

Participating hosts (40 -> 39)
------------------------------

  Missing    (1): bat-dg2-13 


Changes
-------

  No changes found


Build changes
-------------

  * Linux: CI_DRM_19475 -> Patchwork_178098v1

  CI-20190529: 20190529
  CI_DRM_19475: d72707a042b6aff601449a9cf87e5fe55decbc5c @ git://anongit.freedesktop.org/gfx-ci/linux
  IGT_9181: 9181
  Patchwork_178098v1: d72707a042b6aff601449a9cf87e5fe55decbc5c @ git://anongit.freedesktop.org/gfx-ci/linux

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_178098v1/index.html

--===============4951134330526168609==
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
<tr><td><b>Series:</b></td><td>drm/i915/irq: Micro optimize gen8/gen11 irq handlers</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/178098/">https://patchwork.freedesktop.org/series/178098/</a></td></tr>
<tr><td><b>State:</b></td><td>success</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_178098v1/index.html">https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_178098v1/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from CI_DRM_19475 -&gt; Patchwork_178098v1</h1>
<h2>Summary</h2>
<p><strong>SUCCESS</strong></p>
<p>No regressions found.</p>
<p>External URL: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_178098v1/index.html</p>
<h2>Participating hosts (40 -&gt; 39)</h2>
<p>Missing    (1): bat-dg2-13 </p>
<h2>Changes</h2>
<p>No changes found</p>
<h2>Build changes</h2>
<ul>
<li>Linux: CI_DRM_19475 -&gt; Patchwork_178098v1</li>
</ul>
<p>CI-20190529: 20190529<br />
  CI_DRM_19475: d72707a042b6aff601449a9cf87e5fe55decbc5c @ git://anongit.freedesktop.org/gfx-ci/linux<br />
  IGT_9181: 9181<br />
  Patchwork_178098v1: d72707a042b6aff601449a9cf87e5fe55decbc5c @ git://anongit.freedesktop.org/gfx-ci/linux</p>

</body>
</html>

--===============4951134330526168609==--
