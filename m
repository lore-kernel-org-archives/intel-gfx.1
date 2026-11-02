Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D3632606A327
	for <intel-gfx@archiver.kernel.org>; Mon,  2 Nov 2026 12:40:53 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5173B10ED9B;
	Mon,  2 Nov 2026 12:40:53 +0000 (UTC)
Received: from 221881a7231d (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2D74510ED9B;
 Mon,  2 Nov 2026 12:40:52 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============7791767355344946078=="
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=93_i915=2ECI=2EBAT=3A_success_for_Frontbuffer_tracking_fixe?=
 =?utf-8?q?s_=28rev2=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: =?utf-8?q?Jouni_H=C3=B6gander?= <jouni.hogander@intel.com>
Cc: intel-gfx@lists.freedesktop.org
Date: Mon, 02 Nov 2026 12:40:52 -0000
Message-ID: <179362325218.102575.1952020157068344012@221881a7231d>
X-Patchwork-Hint: ignore
References: <20261102100051.272137-1-jouni.hogander@intel.com>
In-Reply-To: <20261102100051.272137-1-jouni.hogander@intel.com>
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

--===============7791767355344946078==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: Frontbuffer tracking fixes (rev2)
URL   : https://patchwork.freedesktop.org/series/177220/
State : success

== Summary ==

CI Bug Log - changes from CI_DRM_19428 -> Patchwork_177220v2
====================================================

Summary
-------

  **SUCCESS**

  No regressions found.

  External URL: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_177220v2/index.html

Participating hosts (39 -> 37)
------------------------------

  Missing    (2): bat-dg2-13 bat-arls-5 


Changes
-------

  No changes found


Build changes
-------------

  * Linux: CI_DRM_19428 -> Patchwork_177220v2

  CI-20190529: 20190529
  CI_DRM_19428: 2738102dee943bff3e5976aef7fc1937fc650f6e @ git://anongit.freedesktop.org/gfx-ci/linux
  IGT_9173: 9173
  Patchwork_177220v2: 2738102dee943bff3e5976aef7fc1937fc650f6e @ git://anongit.freedesktop.org/gfx-ci/linux

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_177220v2/index.html

--===============7791767355344946078==
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
<tr><td><b>Series:</b></td><td>Frontbuffer tracking fixes (rev2)</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/177220/">https://patchwork.freedesktop.org/series/177220/</a></td></tr>
<tr><td><b>State:</b></td><td>success</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_177220v2/index.html">https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_177220v2/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from CI_DRM_19428 -&gt; Patchwork_177220v2</h1>
<h2>Summary</h2>
<p><strong>SUCCESS</strong></p>
<p>No regressions found.</p>
<p>External URL: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_177220v2/index.html</p>
<h2>Participating hosts (39 -&gt; 37)</h2>
<p>Missing    (2): bat-dg2-13 bat-arls-5 </p>
<h2>Changes</h2>
<p>No changes found</p>
<h2>Build changes</h2>
<ul>
<li>Linux: CI_DRM_19428 -&gt; Patchwork_177220v2</li>
</ul>
<p>CI-20190529: 20190529<br />
  CI_DRM_19428: 2738102dee943bff3e5976aef7fc1937fc650f6e @ git://anongit.freedesktop.org/gfx-ci/linux<br />
  IGT_9173: 9173<br />
  Patchwork_177220v2: 2738102dee943bff3e5976aef7fc1937fc650f6e @ git://anongit.freedesktop.org/gfx-ci/linux</p>

</body>
</html>

--===============7791767355344946078==--
