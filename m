Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 49510606A326
	for <intel-gfx@archiver.kernel.org>; Wed, 28 Oct 2026 18:23:34 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E4B6A10E083;
	Wed, 28 Oct 2026 18:23:33 +0000 (UTC)
Received: from 221881a7231d (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C05C910E083;
 Wed, 28 Oct 2026 18:23:32 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============0902743168724369693=="
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Subject: =?utf-8?b?4pyTIGk5MTUuQ0kuQkFUOiBzdWNjZXNzIGZvciBkcm0vaTkxNTogRG9uJ3QgdXNl?=
 =?utf-8?b?IGludGVsX2RlX3tyZWFkLCB3cml0ZX1fZncoKSBpbiBiZHdfdXBkYXRlX3twaXBl?=
 =?utf-8?b?LCBwb3J0fV9pcnEoKQ==?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: =?utf-8?b?VmlsbGUgU3lyasOkbMOk?= <ville.syrjala@linux.intel.com>
Cc: intel-gfx@lists.freedesktop.org
Date: Wed, 28 Oct 2026 18:23:32 -0000
Message-ID: <179321181278.83855.1358073572760016265@221881a7231d>
X-Patchwork-Hint: ignore
References: <20261028145035.26707-1-ville.syrjala@linux.intel.com>
In-Reply-To: <20261028145035.26707-1-ville.syrjala@linux.intel.com>
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

--===============0902743168724369693==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: drm/i915: Don't use intel_de_{read, write}_fw() in bdw_update_{pipe, port}_irq()
URL   : https://patchwork.freedesktop.org/series/177042/
State : success

== Summary ==

CI Bug Log - changes from CI_DRM_19406 -> Patchwork_177042v1
====================================================

Summary
-------

  **SUCCESS**

  No regressions found.

  External URL: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_177042v1/index.html

Participating hosts (40 -> 38)
------------------------------

  Missing    (2): bat-dg2-13 bat-adls-6 


Changes
-------

  No changes found


Build changes
-------------

  * Linux: CI_DRM_19406 -> Patchwork_177042v1

  CI-20190529: 20190529
  CI_DRM_19406: f00a1fa90fcfdf84b1600e0aca74c965fb86fe76 @ git://anongit.freedesktop.org/gfx-ci/linux
  IGT_9169: 9169
  Patchwork_177042v1: f00a1fa90fcfdf84b1600e0aca74c965fb86fe76 @ git://anongit.freedesktop.org/gfx-ci/linux

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_177042v1/index.html

--===============0902743168724369693==
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
<tr><td><b>Series:</b></td><td>drm/i915: Don&#x27;t use intel_de_{read, write}_fw() in bdw_update_{pipe, port}_irq()</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/177042/">https://patchwork.freedesktop.org/series/177042/</a></td></tr>
<tr><td><b>State:</b></td><td>success</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_177042v1/index.html">https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_177042v1/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from CI_DRM_19406 -&gt; Patchwork_177042v1</h1>
<h2>Summary</h2>
<p><strong>SUCCESS</strong></p>
<p>No regressions found.</p>
<p>External URL: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_177042v1/index.html</p>
<h2>Participating hosts (40 -&gt; 38)</h2>
<p>Missing    (2): bat-dg2-13 bat-adls-6 </p>
<h2>Changes</h2>
<p>No changes found</p>
<h2>Build changes</h2>
<ul>
<li>Linux: CI_DRM_19406 -&gt; Patchwork_177042v1</li>
</ul>
<p>CI-20190529: 20190529<br />
  CI_DRM_19406: f00a1fa90fcfdf84b1600e0aca74c965fb86fe76 @ git://anongit.freedesktop.org/gfx-ci/linux<br />
  IGT_9169: 9169<br />
  Patchwork_177042v1: f00a1fa90fcfdf84b1600e0aca74c965fb86fe76 @ git://anongit.freedesktop.org/gfx-ci/linux</p>

</body>
</html>

--===============0902743168724369693==--
