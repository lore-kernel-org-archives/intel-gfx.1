Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 06C9D606A31C
	for <intel-gfx@archiver.kernel.org>; Tue, 17 Nov 2026 18:09:29 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 976A110E514;
	Tue, 17 Nov 2026 18:09:28 +0000 (UTC)
Received: from 9ac1b63fe3ea (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5CCD910E514;
 Tue, 17 Nov 2026 18:09:27 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============5448697275098260583=="
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=93_i915=2ECI=2EBAT=3A_success_for_series_starting_with_=5B1?=
 =?utf-8?q?/1=5D_drm/i915=3A_Fix_OOB_access_of_reset=5Fengine=5Fcount_for_co?=
 =?utf-8?q?mpute_class_=28rev3=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Teres Alexis, Alan Previn" <alan.previn.teres.alexis@intel.com>
Cc: intel-gfx@lists.freedesktop.org
Date: Tue, 17 Nov 2026 18:09:27 -0000
Message-ID: <179493896737.39223.11107841180389862577@9ac1b63fe3ea>
X-Patchwork-Hint: ignore
References: <20261028210828.433225-2-alan.previn.teres.alexis@intel.com>
In-Reply-To: <20261028210828.433225-2-alan.previn.teres.alexis@intel.com>
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

--===============5448697275098260583==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: series starting with [1/1] drm/i915: Fix OOB access of reset_engine_count for compute class (rev3)
URL   : https://patchwork.freedesktop.org/series/177055/
State : success

== Summary ==

CI Bug Log - changes from CI_DRM_19541 -> Patchwork_177055v3
====================================================

Summary
-------

  **SUCCESS**

  No regressions found.

  External URL: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_177055v3/index.html

Participating hosts (40 -> 39)
------------------------------

  Missing    (1): bat-dg2-13 


Changes
-------

  No changes found


Build changes
-------------

  * Linux: CI_DRM_19541 -> Patchwork_177055v3

  CI-20190529: 20190529
  CI_DRM_19541: a042bd455a5a6f9fa352b41b4bf5be171c64d1f2 @ git://anongit.freedesktop.org/gfx-ci/linux
  IGT_9196: 9196
  Patchwork_177055v3: a042bd455a5a6f9fa352b41b4bf5be171c64d1f2 @ git://anongit.freedesktop.org/gfx-ci/linux

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_177055v3/index.html

--===============5448697275098260583==
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
<tr><td><b>Series:</b></td><td>series starting with [1/1] drm/i915: Fix OOB access of reset_engine_count for compute class (rev3)</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/177055/">https://patchwork.freedesktop.org/series/177055/</a></td></tr>
<tr><td><b>State:</b></td><td>success</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_177055v3/index.html">https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_177055v3/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from CI_DRM_19541 -&gt; Patchwork_177055v3</h1>
<h2>Summary</h2>
<p><strong>SUCCESS</strong></p>
<p>No regressions found.</p>
<p>External URL: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_177055v3/index.html</p>
<h2>Participating hosts (40 -&gt; 39)</h2>
<p>Missing    (1): bat-dg2-13 </p>
<h2>Changes</h2>
<p>No changes found</p>
<h2>Build changes</h2>
<ul>
<li>Linux: CI_DRM_19541 -&gt; Patchwork_177055v3</li>
</ul>
<p>CI-20190529: 20190529<br />
  CI_DRM_19541: a042bd455a5a6f9fa352b41b4bf5be171c64d1f2 @ git://anongit.freedesktop.org/gfx-ci/linux<br />
  IGT_9196: 9196<br />
  Patchwork_177055v3: a042bd455a5a6f9fa352b41b4bf5be171c64d1f2 @ git://anongit.freedesktop.org/gfx-ci/linux</p>

</body>
</html>

--===============5448697275098260583==--
