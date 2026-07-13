Return-Path: <intel-gfx-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F313DC43458
	for <intel-gfx@archiver.kernel.org>; Mon, 13 Jul 2026 09:44:52 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8F6C910E5A3;
	Mon, 13 Jul 2026 09:44:52 +0000 (UTC)
Received: from 6beec6c84f66 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 067AA10E59E;
 Mon, 13 Jul 2026 09:44:52 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============0547586608502697602=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=93_i915=2ECI=2EBAT=3A_success_for_drm/i915/dmc=3A_Enable_PI?=
 =?utf-8?q?PEDMC=5FERROR_interrupt_on_display_version_30+_=28rev3=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Dibin Moolakadan Subrahmanian" <dibin.moolakadan.subrahmanian@intel.com>
Cc: intel-gfx@lists.freedesktop.org
Date: Mon, 13 Jul 2026 09:44:52 -0000
Message-ID: <178393589201.182540.4609701829851968141@6beec6c84f66>
X-Patchwork-Hint: ignore
References: <20260708090712.3800170-1-dibin.moolakadan.subrahmanian@intel.com>
In-Reply-To: <20260708090712.3800170-1-dibin.moolakadan.subrahmanian@intel.com>
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

--===============0547586608502697602==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: drm/i915/dmc: Enable PIPEDMC_ERROR interrupt on display version 30+ (rev3)
URL   : https://patchwork.freedesktop.org/series/169876/
State : success

== Summary ==

CI Bug Log - changes from CI_DRM_18791 -> Patchwork_169876v3
====================================================

Summary
-------

  **SUCCESS**

  No regressions found.

  External URL: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_169876v3/index.html

Participating hosts (42 -> 40)
------------------------------

  Missing    (2): bat-dg2-13 fi-snb-2520m 

Known issues
------------

  Here are the changes found in Patchwork_169876v3 that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@gem_render_tiled_blits@basic:
    - fi-skl-6600u:       [PASS][1] -> [INCOMPLETE][2] ([i915#16614])
   [1]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18791/fi-skl-6600u/igt@gem_render_tiled_blits@basic.html
   [2]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_169876v3/fi-skl-6600u/igt@gem_render_tiled_blits@basic.html

  * igt@kms_cursor_legacy@basic-flip-after-cursor-varying-size:
    - bat-rpls-4:         [PASS][3] -> [INCOMPLETE][4] ([i915#16613])
   [3]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18791/bat-rpls-4/igt@kms_cursor_legacy@basic-flip-after-cursor-varying-size.html
   [4]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_169876v3/bat-rpls-4/igt@kms_cursor_legacy@basic-flip-after-cursor-varying-size.html

  
  [i915#16613]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16613
  [i915#16614]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16614


Build changes
-------------

  * Linux: CI_DRM_18791 -> Patchwork_169876v3

  CI-20190529: 20190529
  CI_DRM_18791: 031615563ea8f1acce065bea91fe6ce6b0ce965c @ git://anongit.freedesktop.org/gfx-ci/linux
  IGT_8994: 59469572ae481848d6bd469242aef7c5333b39ad @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
  Patchwork_169876v3: 031615563ea8f1acce065bea91fe6ce6b0ce965c @ git://anongit.freedesktop.org/gfx-ci/linux

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_169876v3/index.html

--===============0547586608502697602==
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
<tr><td><b>Series:</b></td><td>drm/i915/dmc: Enable PIPEDMC_ERROR interrupt on display version 30+ (rev3)</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/169876/">https://patchwork.freedesktop.org/series/169876/</a></td></tr>
<tr><td><b>State:</b></td><td>success</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_169876v3/index.html">https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_169876v3/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from CI_DRM_18791 -&gt; Patchwork_169876v3</h1>
<h2>Summary</h2>
<p><strong>SUCCESS</strong></p>
<p>No regressions found.</p>
<p>External URL: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_169876v3/index.html</p>
<h2>Participating hosts (42 -&gt; 40)</h2>
<p>Missing    (2): bat-dg2-13 fi-snb-2520m </p>
<h2>Known issues</h2>
<p>Here are the changes found in Patchwork_169876v3 that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>
<p>igt@gem_render_tiled_blits@basic:</p>
<ul>
<li>fi-skl-6600u:       <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18791/fi-skl-6600u/igt@gem_render_tiled_blits@basic.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_169876v3/fi-skl-6600u/igt@gem_render_tiled_blits@basic.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16614">i915#16614</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@basic-flip-after-cursor-varying-size:</p>
<ul>
<li>bat-rpls-4:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18791/bat-rpls-4/igt@kms_cursor_legacy@basic-flip-after-cursor-varying-size.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_169876v3/bat-rpls-4/igt@kms_cursor_legacy@basic-flip-after-cursor-varying-size.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16613">i915#16613</a>)</li>
</ul>
</li>
</ul>
<h2>Build changes</h2>
<ul>
<li>Linux: CI_DRM_18791 -&gt; Patchwork_169876v3</li>
</ul>
<p>CI-20190529: 20190529<br />
  CI_DRM_18791: 031615563ea8f1acce065bea91fe6ce6b0ce965c @ git://anongit.freedesktop.org/gfx-ci/linux<br />
  IGT_8994: 59469572ae481848d6bd469242aef7c5333b39ad @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git<br />
  Patchwork_169876v3: 031615563ea8f1acce065bea91fe6ce6b0ce965c @ git://anongit.freedesktop.org/gfx-ci/linux</p>

</body>
</html>

--===============0547586608502697602==--
