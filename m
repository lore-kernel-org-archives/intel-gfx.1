Return-Path: <intel-gfx-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C2F98C53209
	for <intel-gfx@archiver.kernel.org>; Mon, 27 Jul 2026 19:51:58 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 437F210E119;
	Mon, 27 Jul 2026 19:51:58 +0000 (UTC)
Received: from 6beec6c84f66 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9566E10E119;
 Mon, 27 Jul 2026 19:51:56 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============8019768900787228719=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=93_i915=2ECI=2EBAT=3A_success_for_drm/i915/kunit=3A_DP_Link?=
 =?utf-8?q?=3A_Use_if_statements_instead_of_for_loops?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Jonathan Cavitt" <jonathan.cavitt@intel.com>
Cc: intel-gfx@lists.freedesktop.org
Date: Mon, 27 Jul 2026 19:51:56 -0000
Message-ID: <178518191658.228721.1508675739824973425@6beec6c84f66>
X-Patchwork-Hint: ignore
References: <20260727190223.2080436-1-jonathan.cavitt@intel.com>
In-Reply-To: <20260727190223.2080436-1-jonathan.cavitt@intel.com>
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

--===============8019768900787228719==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: drm/i915/kunit: DP Link: Use if statements instead of for loops
URL   : https://patchwork.freedesktop.org/series/171131/
State : success

== Summary ==

CI Bug Log - changes from CI_DRM_18909 -> Patchwork_171131v1
====================================================

Summary
-------

  **SUCCESS**

  No regressions found.

  External URL: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_171131v1/index.html

Participating hosts (41 -> 39)
------------------------------

  Missing    (2): bat-dg2-13 fi-snb-2520m 

Known issues
------------

  Here are the changes found in Patchwork_171131v1 that come from known issues:

### IGT changes ###

#### Possible fixes ####

  * igt@i915_selftest@live:
    - fi-bsw-n3050:       [ABORT][1] ([i915#16562]) -> [PASS][2]
   [1]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18909/fi-bsw-n3050/igt@i915_selftest@live.html
   [2]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_171131v1/fi-bsw-n3050/igt@i915_selftest@live.html

  * igt@i915_selftest@live@hangcheck:
    - fi-bsw-n3050:       [ABORT][3] ([i915#16633]) -> [PASS][4]
   [3]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18909/fi-bsw-n3050/igt@i915_selftest@live@hangcheck.html
   [4]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_171131v1/fi-bsw-n3050/igt@i915_selftest@live@hangcheck.html

  
  [i915#16562]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16562
  [i915#16633]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16633


Build changes
-------------

  * Linux: CI_DRM_18909 -> Patchwork_171131v1

  CI-20190529: 20190529
  CI_DRM_18909: 28e3f47d47a61b5e28e7566944479e9c9715d41d @ git://anongit.freedesktop.org/gfx-ci/linux
  IGT_9027: 9027
  Patchwork_171131v1: 28e3f47d47a61b5e28e7566944479e9c9715d41d @ git://anongit.freedesktop.org/gfx-ci/linux

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_171131v1/index.html

--===============8019768900787228719==
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
<tr><td><b>Series:</b></td><td>drm/i915/kunit: DP Link: Use if statements instead of for loops</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/171131/">https://patchwork.freedesktop.org/series/171131/</a></td></tr>
<tr><td><b>State:</b></td><td>success</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_171131v1/index.html">https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_171131v1/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from CI_DRM_18909 -&gt; Patchwork_171131v1</h1>
<h2>Summary</h2>
<p><strong>SUCCESS</strong></p>
<p>No regressions found.</p>
<p>External URL: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_171131v1/index.html</p>
<h2>Participating hosts (41 -&gt; 39)</h2>
<p>Missing    (2): bat-dg2-13 fi-snb-2520m </p>
<h2>Known issues</h2>
<p>Here are the changes found in Patchwork_171131v1 that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Possible fixes</h4>
<ul>
<li>
<p>igt@i915_selftest@live:</p>
<ul>
<li>fi-bsw-n3050:       <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18909/fi-bsw-n3050/igt@i915_selftest@live.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16562">i915#16562</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_171131v1/fi-bsw-n3050/igt@i915_selftest@live.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@i915_selftest@live@hangcheck:</p>
<ul>
<li>fi-bsw-n3050:       <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18909/fi-bsw-n3050/igt@i915_selftest@live@hangcheck.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16633">i915#16633</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_171131v1/fi-bsw-n3050/igt@i915_selftest@live@hangcheck.html">PASS</a></li>
</ul>
</li>
</ul>
<h2>Build changes</h2>
<ul>
<li>Linux: CI_DRM_18909 -&gt; Patchwork_171131v1</li>
</ul>
<p>CI-20190529: 20190529<br />
  CI_DRM_18909: 28e3f47d47a61b5e28e7566944479e9c9715d41d @ git://anongit.freedesktop.org/gfx-ci/linux<br />
  IGT_9027: 9027<br />
  Patchwork_171131v1: 28e3f47d47a61b5e28e7566944479e9c9715d41d @ git://anongit.freedesktop.org/gfx-ci/linux</p>

</body>
</html>

--===============8019768900787228719==--
