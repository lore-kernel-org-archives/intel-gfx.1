Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 64854606A319
	for <intel-gfx@archiver.kernel.org>; Tue, 20 Oct 2026 06:35:10 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F2A3610F275;
	Tue, 20 Oct 2026 06:35:09 +0000 (UTC)
Received: from 221881a7231d (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6BDA810F268;
 Tue, 20 Oct 2026 06:35:09 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============2196651828425580208=="
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=93_i915=2ECI=2EBAT=3A_success_for_series_starting_with_=5Bv?=
 =?utf-8?q?5=2C1/2=5D_gpu/buddy=3A_restore_two-pass_clear/dirty_guard_for_ra?=
 =?utf-8?q?nge-biased_allocation?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Paneer Selvam, Arunpravin" <arunpravin.paneerselvam@amd.com>
Cc: intel-gfx@lists.freedesktop.org
Date: Tue, 20 Oct 2026 06:35:09 -0000
Message-ID: <179247810943.44173.6310718348939111994@221881a7231d>
X-Patchwork-Hint: ignore
References: <20261020055537.1640552-1-arunpravin.paneerselvam@amd.com>
In-Reply-To: <20261020055537.1640552-1-arunpravin.paneerselvam@amd.com>
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

--===============2196651828425580208==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: series starting with [v5,1/2] gpu/buddy: restore two-pass clear/dirty guard for range-biased allocation
URL   : https://patchwork.freedesktop.org/series/176445/
State : success

== Summary ==

CI Bug Log - changes from CI_DRM_19366 -> Patchwork_176445v1
====================================================

Summary
-------

  **SUCCESS**

  No regressions found.

  External URL: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_176445v1/index.html

Participating hosts (40 -> 39)
------------------------------

  Missing    (1): bat-dg2-13 

Known issues
------------

  Here are the changes found in Patchwork_176445v1 that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@core_auth@basic-auth:
    - bat-apl-1:          [PASS][1] -> [DMESG-WARN][2] ([i915#16685])
   [1]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19366/bat-apl-1/igt@core_auth@basic-auth.html
   [2]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_176445v1/bat-apl-1/igt@core_auth@basic-auth.html

  
  [i915#16685]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16685


Build changes
-------------

  * Linux: CI_DRM_19366 -> Patchwork_176445v1

  CI-20190529: 20190529
  CI_DRM_19366: 24d867f5e671c78760ab39087a57c25ad98e1f42 @ git://anongit.freedesktop.org/gfx-ci/linux
  IGT_9153: 9153
  Patchwork_176445v1: 24d867f5e671c78760ab39087a57c25ad98e1f42 @ git://anongit.freedesktop.org/gfx-ci/linux

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_176445v1/index.html

--===============2196651828425580208==
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
<tr><td><b>Series:</b></td><td>series starting with [v5,1/2] gpu/buddy: restore two-pass clear/dirty guard for range-biased allocation</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/176445/">https://patchwork.freedesktop.org/series/176445/</a></td></tr>
<tr><td><b>State:</b></td><td>success</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_176445v1/index.html">https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_176445v1/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from CI_DRM_19366 -&gt; Patchwork_176445v1</h1>
<h2>Summary</h2>
<p><strong>SUCCESS</strong></p>
<p>No regressions found.</p>
<p>External URL: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_176445v1/index.html</p>
<h2>Participating hosts (40 -&gt; 39)</h2>
<p>Missing    (1): bat-dg2-13 </p>
<h2>Known issues</h2>
<p>Here are the changes found in Patchwork_176445v1 that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>igt@core_auth@basic-auth:<ul>
<li>bat-apl-1:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19366/bat-apl-1/igt@core_auth@basic-auth.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_176445v1/bat-apl-1/igt@core_auth@basic-auth.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16685">i915#16685</a>)</li>
</ul>
</li>
</ul>
<h2>Build changes</h2>
<ul>
<li>Linux: CI_DRM_19366 -&gt; Patchwork_176445v1</li>
</ul>
<p>CI-20190529: 20190529<br />
  CI_DRM_19366: 24d867f5e671c78760ab39087a57c25ad98e1f42 @ git://anongit.freedesktop.org/gfx-ci/linux<br />
  IGT_9153: 9153<br />
  Patchwork_176445v1: 24d867f5e671c78760ab39087a57c25ad98e1f42 @ git://anongit.freedesktop.org/gfx-ci/linux</p>

</body>
</html>

--===============2196651828425580208==--
