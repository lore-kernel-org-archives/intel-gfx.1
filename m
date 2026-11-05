Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CE104606A326
	for <intel-gfx@archiver.kernel.org>; Thu,  5 Nov 2026 07:43:56 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 783881121E7;
	Thu,  5 Nov 2026 07:43:56 +0000 (UTC)
Received: from 221881a7231d (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B12511121E7;
 Thu,  5 Nov 2026 07:43:55 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============3543294960863992052=="
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=93_i915=2ECI=2EFull=3A_success_for_drm/display=3A_Increase_?=
 =?utf-8?q?DP=5FRECEIVER=5FCAP=5FSIZE_from_15_to_16_bytes_=28rev3=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Khaled Almahallawy" <khaled.almahallawy@intel.com>
Cc: intel-gfx@lists.freedesktop.org
Date: Thu, 05 Nov 2026 07:43:55 -0000
Message-ID: <179386463571.123153.4660906262279900700@221881a7231d>
X-Patchwork-Hint: ignore
References: <20261105034658.18959-1-khaled.almahallawy@intel.com>
In-Reply-To: <20261105034658.18959-1-khaled.almahallawy@intel.com>
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

--===============3543294960863992052==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: drm/display: Increase DP_RECEIVER_CAP_SIZE from 15 to 16 bytes (rev3)
URL   : https://patchwork.freedesktop.org/series/151097/
State : success

== Summary ==

CI Bug Log - changes from CI_DRM_19448_full -> Patchwork_151097v3_full
====================================================

Summary
-------

  **SUCCESS**

  No regressions found.

  

Participating hosts (1 -> 1)
------------------------------

  No changes in participating hosts


Changes
-------

  No changes found


Build changes
-------------

  * Linux: CI_DRM_19448 -> Patchwork_151097v3

  CI_DRM_19448: 3379b0f74f31bfc3746b692822a7700aeeebe15d @ git://anongit.freedesktop.org/gfx-ci/linux
  Patchwork_151097v3: 3379b0f74f31bfc3746b692822a7700aeeebe15d @ git://anongit.freedesktop.org/gfx-ci/linux
  piglit_4509: fdc5a4ca11124ab8413c7988896eec4c97336694 @ git://anongit.freedesktop.org/piglit

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_151097v3/index.html

--===============3543294960863992052==
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
<tr><td><b>Series:</b></td><td>drm/display: Increase DP_RECEIVER_CAP_SIZE from 15 to 16 bytes (rev3)</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/151097/">https://patchwork.freedesktop.org/series/151097/</a></td></tr>
<tr><td><b>State:</b></td><td>success</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_151097v3/index.html">https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_151097v3/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from CI_DRM_19448_full -&gt; Patchwork_151097v3_full</h1>
<h2>Summary</h2>
<p><strong>SUCCESS</strong></p>
<p>No regressions found.</p>
<h2>Participating hosts (1 -&gt; 1)</h2>
<p>No changes in participating hosts</p>
<h2>Changes</h2>
<p>No changes found</p>
<h2>Build changes</h2>
<ul>
<li>Linux: CI_DRM_19448 -&gt; Patchwork_151097v3</li>
</ul>
<p>CI_DRM_19448: 3379b0f74f31bfc3746b692822a7700aeeebe15d @ git://anongit.freedesktop.org/gfx-ci/linux<br />
  Patchwork_151097v3: 3379b0f74f31bfc3746b692822a7700aeeebe15d @ git://anongit.freedesktop.org/gfx-ci/linux<br />
  piglit_4509: fdc5a4ca11124ab8413c7988896eec4c97336694 @ git://anongit.freedesktop.org/piglit</p>

</body>
</html>

--===============3543294960863992052==--
