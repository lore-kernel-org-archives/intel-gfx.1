Return-Path: <intel-gfx-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B360ECDB479
	for <intel-gfx@archiver.kernel.org>; Wed, 24 Jun 2026 00:37:19 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BA2B510ECFC;
	Wed, 24 Jun 2026 00:37:18 +0000 (UTC)
Received: from 6beec6c84f66 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D56FC10ECFC;
 Wed, 24 Jun 2026 00:37:16 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============7569923456611997758=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=93_i915=2ECI=2EBAT=3A_success_for_Comments_applied_to_dp=5F?=
 =?utf-8?q?link=5Fcaps?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: =?utf-8?q?Micha=C5=82_Grzelak?= <michal.grzelak@intel.com>
Cc: intel-gfx@lists.freedesktop.org
Date: Wed, 24 Jun 2026 00:37:16 -0000
Message-ID: <178226143686.108830.9755578336006167940@6beec6c84f66>
X-Patchwork-Hint: ignore
References: <20260623224619.1949975-1-michal.grzelak@intel.com>
In-Reply-To: <20260623224619.1949975-1-michal.grzelak@intel.com>
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

--===============7569923456611997758==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: Comments applied to dp_link_caps
URL   : https://patchwork.freedesktop.org/series/169058/
State : success

== Summary ==

CI Bug Log - changes from CI_DRM_18712 -> Patchwork_169058v1
====================================================

Summary
-------

  **SUCCESS**

  No regressions found.

  External URL: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_169058v1/index.html

Participating hosts (42 -> 39)
------------------------------

  Missing    (3): bat-dg2-13 fi-snb-2520m bat-adls-6 

Known issues
------------

  Here are the changes found in Patchwork_169058v1 that come from known issues:

### IGT changes ###

#### Possible fixes ####

  * igt@i915_selftest@live:
    - fi-skl-6600u:       [DMESG-FAIL][1] ([i915#14808]) -> [PASS][2] +1 other test pass
   [1]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18712/fi-skl-6600u/igt@i915_selftest@live.html
   [2]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_169058v1/fi-skl-6600u/igt@i915_selftest@live.html

  
  [i915#14808]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14808


Build changes
-------------

  * Linux: CI_DRM_18712 -> Patchwork_169058v1

  CI-20190529: 20190529
  CI_DRM_18712: e7cd62086ec5a70cefb8b8b00964096692bfab36 @ git://anongit.freedesktop.org/gfx-ci/linux
  IGT_8981: 28416da6681a1afa167bdd73cdc934cb36d13133 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
  Patchwork_169058v1: e7cd62086ec5a70cefb8b8b00964096692bfab36 @ git://anongit.freedesktop.org/gfx-ci/linux

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_169058v1/index.html

--===============7569923456611997758==
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
<tr><td><b>Series:</b></td><td>Comments applied to dp_link_caps</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/169058/">https://patchwork.freedesktop.org/series/169058/</a></td></tr>
<tr><td><b>State:</b></td><td>success</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_169058v1/index.html">https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_169058v1/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from CI_DRM_18712 -&gt; Patchwork_169058v1</h1>
<h2>Summary</h2>
<p><strong>SUCCESS</strong></p>
<p>No regressions found.</p>
<p>External URL: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_169058v1/index.html</p>
<h2>Participating hosts (42 -&gt; 39)</h2>
<p>Missing    (3): bat-dg2-13 fi-snb-2520m bat-adls-6 </p>
<h2>Known issues</h2>
<p>Here are the changes found in Patchwork_169058v1 that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Possible fixes</h4>
<ul>
<li>igt@i915_selftest@live:<ul>
<li>fi-skl-6600u:       <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18712/fi-skl-6600u/igt@i915_selftest@live.html">DMESG-FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14808">i915#14808</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_169058v1/fi-skl-6600u/igt@i915_selftest@live.html">PASS</a> +1 other test pass</li>
</ul>
</li>
</ul>
<h2>Build changes</h2>
<ul>
<li>Linux: CI_DRM_18712 -&gt; Patchwork_169058v1</li>
</ul>
<p>CI-20190529: 20190529<br />
  CI_DRM_18712: e7cd62086ec5a70cefb8b8b00964096692bfab36 @ git://anongit.freedesktop.org/gfx-ci/linux<br />
  IGT_8981: 28416da6681a1afa167bdd73cdc934cb36d13133 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git<br />
  Patchwork_169058v1: e7cd62086ec5a70cefb8b8b00964096692bfab36 @ git://anongit.freedesktop.org/gfx-ci/linux</p>

</body>
</html>

--===============7569923456611997758==--
