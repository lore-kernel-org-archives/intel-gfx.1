Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 62808606A31B
	for <intel-gfx@archiver.kernel.org>; Mon, 26 Oct 2026 05:40:19 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EAD1510E95C;
	Mon, 26 Oct 2026 05:40:18 +0000 (UTC)
Received: from 221881a7231d (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 96E4B10E95E;
 Mon, 26 Oct 2026 05:40:17 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============3270116452890942035=="
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=93_i915=2ECI=2EBAT=3A_success_for_drm/i915/dsc=3A_Fix_QP=2C?=
 =?utf-8?q?_RC_parameters_issues_=28rev2=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Ankit Nautiyal" <ankit.k.nautiyal@intel.com>
Cc: intel-gfx@lists.freedesktop.org
Date: Mon, 26 Oct 2026 05:40:17 -0000
Message-ID: <179299321761.67195.12310461151005135838@221881a7231d>
X-Patchwork-Hint: ignore
References: <20261016101713.230013-1-ankit.k.nautiyal@intel.com>
In-Reply-To: <20261016101713.230013-1-ankit.k.nautiyal@intel.com>
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

--===============3270116452890942035==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: drm/i915/dsc: Fix QP, RC parameters issues (rev2)
URL   : https://patchwork.freedesktop.org/series/176293/
State : success

== Summary ==

CI Bug Log - changes from CI_DRM_19394 -> Patchwork_176293v2
====================================================

Summary
-------

  **SUCCESS**

  No regressions found.

  External URL: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_176293v2/index.html

Participating hosts (40 -> 39)
------------------------------

  Missing    (1): bat-dg2-13 

New tests
---------

  New tests have been introduced between CI_DRM_19394 and Patchwork_176293v2:

### New IGT tests (1) ###

  * igt@gem_exec_create@basic@lmem0:
    - Statuses : 5 pass(s)
    - Exec time: [2.12, 2.28] s

  

Known issues
------------

  Here are the changes found in Patchwork_176293v2 that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@i915_selftest@live:
    - fi-bsw-nick:        [PASS][1] -> [INCOMPLETE][2] ([i915#17451]) +1 other test incomplete
   [1]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19394/fi-bsw-nick/igt@i915_selftest@live.html
   [2]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_176293v2/fi-bsw-nick/igt@i915_selftest@live.html

  
  [i915#17451]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17451


Build changes
-------------

  * Linux: CI_DRM_19394 -> Patchwork_176293v2

  CI-20190529: 20190529
  CI_DRM_19394: d56ff005f0d16ec136ee31fe3238eb447fefdc1a @ git://anongit.freedesktop.org/gfx-ci/linux
  IGT_9163: 9163
  Patchwork_176293v2: d56ff005f0d16ec136ee31fe3238eb447fefdc1a @ git://anongit.freedesktop.org/gfx-ci/linux

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_176293v2/index.html

--===============3270116452890942035==
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
<tr><td><b>Series:</b></td><td>drm/i915/dsc: Fix QP, RC parameters issues (rev2)</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/176293/">https://patchwork.freedesktop.org/series/176293/</a></td></tr>
<tr><td><b>State:</b></td><td>success</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_176293v2/index.html">https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_176293v2/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from CI_DRM_19394 -&gt; Patchwork_176293v2</h1>
<h2>Summary</h2>
<p><strong>SUCCESS</strong></p>
<p>No regressions found.</p>
<p>External URL: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_176293v2/index.html</p>
<h2>Participating hosts (40 -&gt; 39)</h2>
<p>Missing    (1): bat-dg2-13 </p>
<h2>New tests</h2>
<p>New tests have been introduced between CI_DRM_19394 and Patchwork_176293v2:</p>
<h3>New IGT tests (1)</h3>
<ul>
<li>igt@gem_exec_create@basic@lmem0:<ul>
<li>Statuses : 5 pass(s)</li>
<li>Exec time: [2.12, 2.28] s</li>
</ul>
</li>
</ul>
<h2>Known issues</h2>
<p>Here are the changes found in Patchwork_176293v2 that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>igt@i915_selftest@live:<ul>
<li>fi-bsw-nick:        <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19394/fi-bsw-nick/igt@i915_selftest@live.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_176293v2/fi-bsw-nick/igt@i915_selftest@live.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17451">i915#17451</a>) +1 other test incomplete</li>
</ul>
</li>
</ul>
<h2>Build changes</h2>
<ul>
<li>Linux: CI_DRM_19394 -&gt; Patchwork_176293v2</li>
</ul>
<p>CI-20190529: 20190529<br />
  CI_DRM_19394: d56ff005f0d16ec136ee31fe3238eb447fefdc1a @ git://anongit.freedesktop.org/gfx-ci/linux<br />
  IGT_9163: 9163<br />
  Patchwork_176293v2: d56ff005f0d16ec136ee31fe3238eb447fefdc1a @ git://anongit.freedesktop.org/gfx-ci/linux</p>

</body>
</html>

--===============3270116452890942035==--
