Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ECFF1606A31D
	for <intel-gfx@archiver.kernel.org>; Tue, 27 Oct 2026 14:18:48 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8A40310F5A5;
	Tue, 27 Oct 2026 14:18:48 +0000 (UTC)
Received: from 221881a7231d (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9CF3010F54F;
 Tue, 27 Oct 2026 14:18:46 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============8989856647284127005=="
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=93_i915=2ECI=2EBAT=3A_success_for_drm/i915/gem=3A_Reset_err?=
 =?utf-8?q?_for_each_fence_entry?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: yaolu@kylinos.cn
Cc: intel-gfx@lists.freedesktop.org
Date: Tue, 27 Oct 2026 14:18:46 -0000
Message-ID: <179311072663.76856.1596820768836799090@221881a7231d>
X-Patchwork-Hint: ignore
References: <20261027072832.726435-1-yaolu@kylinos.cn>
In-Reply-To: <20261027072832.726435-1-yaolu@kylinos.cn>
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

--===============8989856647284127005==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: drm/i915/gem: Reset err for each fence entry
URL   : https://patchwork.freedesktop.org/series/176941/
State : success

== Summary ==

CI Bug Log - changes from CI_DRM_19398 -> Patchwork_176941v1
====================================================

Summary
-------

  **SUCCESS**

  No regressions found.

  External URL: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_176941v1/index.html

Participating hosts (40 -> 39)
------------------------------

  Missing    (1): bat-dg2-13 

Known issues
------------

  Here are the changes found in Patchwork_176941v1 that come from known issues:

### IGT changes ###

#### Warnings ####

  * igt@gem_huc_copy@huc-copy:
    - fi-glk-j4005:       [SKIP][1] ([i915#2190]) -> [SKIP][2] ([i915#17456] / [i915#2190])
   [1]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19398/fi-glk-j4005/igt@gem_huc_copy@huc-copy.html
   [2]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_176941v1/fi-glk-j4005/igt@gem_huc_copy@huc-copy.html

  
  [i915#17456]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17456
  [i915#2190]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2190


Build changes
-------------

  * Linux: CI_DRM_19398 -> Patchwork_176941v1

  CI-20190529: 20190529
  CI_DRM_19398: d645db52a6b60d0f0d921077f0233085b41b3a1e @ git://anongit.freedesktop.org/gfx-ci/linux
  IGT_9166: 9166
  Patchwork_176941v1: d645db52a6b60d0f0d921077f0233085b41b3a1e @ git://anongit.freedesktop.org/gfx-ci/linux

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_176941v1/index.html

--===============8989856647284127005==
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
<tr><td><b>Series:</b></td><td>drm/i915/gem: Reset err for each fence entry</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/176941/">https://patchwork.freedesktop.org/series/176941/</a></td></tr>
<tr><td><b>State:</b></td><td>success</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_176941v1/index.html">https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_176941v1/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from CI_DRM_19398 -&gt; Patchwork_176941v1</h1>
<h2>Summary</h2>
<p><strong>SUCCESS</strong></p>
<p>No regressions found.</p>
<p>External URL: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_176941v1/index.html</p>
<h2>Participating hosts (40 -&gt; 39)</h2>
<p>Missing    (1): bat-dg2-13 </p>
<h2>Known issues</h2>
<p>Here are the changes found in Patchwork_176941v1 that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Warnings</h4>
<ul>
<li>igt@gem_huc_copy@huc-copy:<ul>
<li>fi-glk-j4005:       <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19398/fi-glk-j4005/igt@gem_huc_copy@huc-copy.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2190">i915#2190</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_176941v1/fi-glk-j4005/igt@gem_huc_copy@huc-copy.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17456">i915#17456</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2190">i915#2190</a>)</li>
</ul>
</li>
</ul>
<h2>Build changes</h2>
<ul>
<li>Linux: CI_DRM_19398 -&gt; Patchwork_176941v1</li>
</ul>
<p>CI-20190529: 20190529<br />
  CI_DRM_19398: d645db52a6b60d0f0d921077f0233085b41b3a1e @ git://anongit.freedesktop.org/gfx-ci/linux<br />
  IGT_9166: 9166<br />
  Patchwork_176941v1: d645db52a6b60d0f0d921077f0233085b41b3a1e @ git://anongit.freedesktop.org/gfx-ci/linux</p>

</body>
</html>

--===============8989856647284127005==--
