Return-Path: <intel-gfx-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 26986CD8C9D
	for <intel-gfx@archiver.kernel.org>; Mon,  8 Jun 2026 17:27:03 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A6F4510F7CE;
	Mon,  8 Jun 2026 17:27:02 +0000 (UTC)
Received: from 6beec6c84f66 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2837710F7CD;
 Mon,  8 Jun 2026 17:27:02 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============6386594788974729289=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=93_i915=2ECI=2EBAT=3A_success_for_Fix_pipe_fifo_underruns_d?=
 =?utf-8?q?uring_cdclk/DDB_transitions?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Nemesa Garg" <nemesa.garg@intel.com>
Cc: intel-gfx@lists.freedesktop.org
Date: Mon, 08 Jun 2026 17:27:02 -0000
Message-ID: <178093962215.54354.1828701934760469283@6beec6c84f66>
X-Patchwork-Hint: ignore
References: <20260608125009.979672-1-nemesa.garg@intel.com>
In-Reply-To: <20260608125009.979672-1-nemesa.garg@intel.com>
X-BeenThere: intel-gfx@lists.freedesktop.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Intel graphics driver community testing & development
 <intel-gfx.lists.freedesktop.org>
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/intel-gfx>,
 <mailto:intel-gfx-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/intel-gfx>
List-Post: <mailto:intel-gfx@lists.freedesktop.org>
List-Help: <mailto:intel-gfx-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/intel-gfx>,
 <mailto:intel-gfx-request@lists.freedesktop.org?subject=subscribe>
Reply-To: intel-gfx@lists.freedesktop.org
Errors-To: intel-gfx-bounces@lists.freedesktop.org
Sender: "Intel-gfx" <intel-gfx-bounces@lists.freedesktop.org>

--===============6386594788974729289==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: Fix pipe fifo underruns during cdclk/DDB transitions
URL   : https://patchwork.freedesktop.org/series/168080/
State : success

== Summary ==

CI Bug Log - changes from CI_DRM_18641 -> Patchwork_168080v1
====================================================

Summary
-------

  **SUCCESS**

  No regressions found.

  External URL: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_168080v1/index.html

Participating hosts (42 -> 40)
------------------------------

  Missing    (2): bat-dg2-13 fi-snb-2520m 

Known issues
------------

  Here are the changes found in Patchwork_168080v1 that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@dmabuf@all-tests:
    - bat-rplp-1:         NOTRUN -> [SKIP][1] ([i915#15931])
   [1]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_168080v1/bat-rplp-1/igt@dmabuf@all-tests.html

  
#### Possible fixes ####

  * igt@i915_selftest@live:
    - bat-rplp-1:         [ABORT][2] ([i915#16364]) -> [PASS][3] +1 other test pass
   [2]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18641/bat-rplp-1/igt@i915_selftest@live.html
   [3]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_168080v1/bat-rplp-1/igt@i915_selftest@live.html

  
  [i915#15931]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15931
  [i915#16364]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16364


Build changes
-------------

  * Linux: CI_DRM_18641 -> Patchwork_168080v1

  CI-20190529: 20190529
  CI_DRM_18641: 0375ba98c1fdf69bc3a05ffa80591f9ffe910330 @ git://anongit.freedesktop.org/gfx-ci/linux
  IGT_8951: 8951
  Patchwork_168080v1: 0375ba98c1fdf69bc3a05ffa80591f9ffe910330 @ git://anongit.freedesktop.org/gfx-ci/linux

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_168080v1/index.html

--===============6386594788974729289==
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
<tr><td><b>Series:</b></td><td>Fix pipe fifo underruns during cdclk/DDB transitions</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/168080/">https://patchwork.freedesktop.org/series/168080/</a></td></tr>
<tr><td><b>State:</b></td><td>success</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_168080v1/index.html">https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_168080v1/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from CI_DRM_18641 -&gt; Patchwork_168080v1</h1>
<h2>Summary</h2>
<p><strong>SUCCESS</strong></p>
<p>No regressions found.</p>
<p>External URL: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_168080v1/index.html</p>
<h2>Participating hosts (42 -&gt; 40)</h2>
<p>Missing    (2): bat-dg2-13 fi-snb-2520m </p>
<h2>Known issues</h2>
<p>Here are the changes found in Patchwork_168080v1 that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>igt@dmabuf@all-tests:<ul>
<li>bat-rplp-1:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_168080v1/bat-rplp-1/igt@dmabuf@all-tests.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15931">i915#15931</a>)</li>
</ul>
</li>
</ul>
<h4>Possible fixes</h4>
<ul>
<li>igt@i915_selftest@live:<ul>
<li>bat-rplp-1:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18641/bat-rplp-1/igt@i915_selftest@live.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16364">i915#16364</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_168080v1/bat-rplp-1/igt@i915_selftest@live.html">PASS</a> +1 other test pass</li>
</ul>
</li>
</ul>
<h2>Build changes</h2>
<ul>
<li>Linux: CI_DRM_18641 -&gt; Patchwork_168080v1</li>
</ul>
<p>CI-20190529: 20190529<br />
  CI_DRM_18641: 0375ba98c1fdf69bc3a05ffa80591f9ffe910330 @ git://anongit.freedesktop.org/gfx-ci/linux<br />
  IGT_8951: 8951<br />
  Patchwork_168080v1: 0375ba98c1fdf69bc3a05ffa80591f9ffe910330 @ git://anongit.freedesktop.org/gfx-ci/linux</p>

</body>
</html>

--===============6386594788974729289==--
