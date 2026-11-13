Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1693460A3831
	for <intel-gfx@archiver.kernel.org>; Fri, 13 Nov 2026 13:25:06 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9878210E371;
	Fri, 13 Nov 2026 13:25:05 +0000 (UTC)
Received: from 9ac1b63fe3ea (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1FA1710E371;
 Fri, 13 Nov 2026 13:25:04 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============2602494853689957330=="
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=93_i915=2ECI=2EBAT=3A_success_for_drm/i915/dp=3A_Add_quirk_?=
 =?utf-8?q?to_allow_eDP_joiner_on_ASUS_ROG_Strix_SCAR_18_=28rev2=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Ankit Nautiyal" <ankit.k.nautiyal@intel.com>
Cc: intel-gfx@lists.freedesktop.org
Date: Fri, 13 Nov 2026 13:25:04 -0000
Message-ID: <179457630412.19925.9930214570448977992@9ac1b63fe3ea>
X-Patchwork-Hint: ignore
References: <20261027024334.1140596-1-ankit.k.nautiyal@intel.com>
In-Reply-To: <20261027024334.1140596-1-ankit.k.nautiyal@intel.com>
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

--===============2602494853689957330==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: drm/i915/dp: Add quirk to allow eDP joiner on ASUS ROG Strix SCAR 18 (rev2)
URL   : https://patchwork.freedesktop.org/series/176901/
State : success

== Summary ==

CI Bug Log - changes from CI_DRM_19516 -> Patchwork_176901v2
====================================================

Summary
-------

  **SUCCESS**

  No regressions found.

  External URL: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_176901v2/index.html

Participating hosts (40 -> 38)
------------------------------

  Missing    (2): bat-dg2-13 fi-rkl-11600 


Changes
-------

  No changes found


Build changes
-------------

  * Linux: CI_DRM_19516 -> Patchwork_176901v2

  CI-20190529: 20190529
  CI_DRM_19516: d41695c479e8bb24eb941e5ba916e42784af6f4d @ git://anongit.freedesktop.org/gfx-ci/linux
  IGT_9190: 9190
  Patchwork_176901v2: d41695c479e8bb24eb941e5ba916e42784af6f4d @ git://anongit.freedesktop.org/gfx-ci/linux

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_176901v2/index.html

--===============2602494853689957330==
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
<tr><td><b>Series:</b></td><td>drm/i915/dp: Add quirk to allow eDP joiner on ASUS ROG Strix SCAR 18 (rev2)</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/176901/">https://patchwork.freedesktop.org/series/176901/</a></td></tr>
<tr><td><b>State:</b></td><td>success</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_176901v2/index.html">https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_176901v2/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from CI_DRM_19516 -&gt; Patchwork_176901v2</h1>
<h2>Summary</h2>
<p><strong>SUCCESS</strong></p>
<p>No regressions found.</p>
<p>External URL: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_176901v2/index.html</p>
<h2>Participating hosts (40 -&gt; 38)</h2>
<p>Missing    (2): bat-dg2-13 fi-rkl-11600 </p>
<h2>Changes</h2>
<p>No changes found</p>
<h2>Build changes</h2>
<ul>
<li>Linux: CI_DRM_19516 -&gt; Patchwork_176901v2</li>
</ul>
<p>CI-20190529: 20190529<br />
  CI_DRM_19516: d41695c479e8bb24eb941e5ba916e42784af6f4d @ git://anongit.freedesktop.org/gfx-ci/linux<br />
  IGT_9190: 9190<br />
  Patchwork_176901v2: d41695c479e8bb24eb941e5ba916e42784af6f4d @ git://anongit.freedesktop.org/gfx-ci/linux</p>

</body>
</html>

--===============2602494853689957330==--
