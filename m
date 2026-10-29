Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6AF89606A31A
	for <intel-gfx@archiver.kernel.org>; Thu, 29 Oct 2026 11:14:51 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 05F4F1121FA;
	Thu, 29 Oct 2026 11:14:51 +0000 (UTC)
Received: from 221881a7231d (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3274410E7D8;
 Thu, 29 Oct 2026 11:14:50 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============0804366573834542648=="
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=93_i915=2ECI=2EBAT=3A_success_for_drm/i915/dp=3A_Add_suppor?=
 =?utf-8?q?t_for_the_DP_symbol_based_timing_generator_=28rev2=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Arun R Murthy" <arun.r.murthy@intel.com>
Cc: intel-gfx@lists.freedesktop.org
Date: Thu, 29 Oct 2026 11:14:50 -0000
Message-ID: <179327249019.87306.8602074025510923113@221881a7231d>
X-Patchwork-Hint: ignore
References: <20261029-vlk-64036-dp-symbol-tg-v3-0-69022424ef17@intel.com>
In-Reply-To: <20261029-vlk-64036-dp-symbol-tg-v3-0-69022424ef17@intel.com>
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

--===============0804366573834542648==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: drm/i915/dp: Add support for the DP symbol based timing generator (rev2)
URL   : https://patchwork.freedesktop.org/series/177002/
State : success

== Summary ==

CI Bug Log - changes from CI_DRM_19414 -> Patchwork_177002v2
====================================================

Summary
-------

  **SUCCESS**

  No regressions found.

  External URL: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_177002v2/index.html

Participating hosts (40 -> 39)
------------------------------

  Missing    (1): bat-dg2-13 


Changes
-------

  No changes found


Build changes
-------------

  * Linux: CI_DRM_19414 -> Patchwork_177002v2

  CI-20190529: 20190529
  CI_DRM_19414: da8074467a69dce9a0dd59602875f5c54874c92a @ git://anongit.freedesktop.org/gfx-ci/linux
  IGT_9170: 9170
  Patchwork_177002v2: da8074467a69dce9a0dd59602875f5c54874c92a @ git://anongit.freedesktop.org/gfx-ci/linux

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_177002v2/index.html

--===============0804366573834542648==
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
<tr><td><b>Series:</b></td><td>drm/i915/dp: Add support for the DP symbol based timing generator (rev2)</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/177002/">https://patchwork.freedesktop.org/series/177002/</a></td></tr>
<tr><td><b>State:</b></td><td>success</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_177002v2/index.html">https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_177002v2/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from CI_DRM_19414 -&gt; Patchwork_177002v2</h1>
<h2>Summary</h2>
<p><strong>SUCCESS</strong></p>
<p>No regressions found.</p>
<p>External URL: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_177002v2/index.html</p>
<h2>Participating hosts (40 -&gt; 39)</h2>
<p>Missing    (1): bat-dg2-13 </p>
<h2>Changes</h2>
<p>No changes found</p>
<h2>Build changes</h2>
<ul>
<li>Linux: CI_DRM_19414 -&gt; Patchwork_177002v2</li>
</ul>
<p>CI-20190529: 20190529<br />
  CI_DRM_19414: da8074467a69dce9a0dd59602875f5c54874c92a @ git://anongit.freedesktop.org/gfx-ci/linux<br />
  IGT_9170: 9170<br />
  Patchwork_177002v2: da8074467a69dce9a0dd59602875f5c54874c92a @ git://anongit.freedesktop.org/gfx-ci/linux</p>

</body>
</html>

--===============0804366573834542648==--
