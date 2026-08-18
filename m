Return-Path: <intel-gfx-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 91B30C5DF81
	for <intel-gfx@archiver.kernel.org>; Tue, 18 Aug 2026 22:41:28 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2DC5D10E06A;
	Tue, 18 Aug 2026 22:41:28 +0000 (UTC)
Received: from 61270ab9df2a (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0911B10E06A;
 Tue, 18 Aug 2026 22:41:27 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============6559355952394793425=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=93_i915=2ECI=2EBAT=3A_success_for_drm/i915/display=3A_Check?=
 =?utf-8?q?_some_INVALID=5FTRANSCODER_cases_=28rev4=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Jonathan Cavitt" <jonathan.cavitt@intel.com>
Cc: intel-gfx@lists.freedesktop.org
Date: Tue, 18 Aug 2026 22:41:27 -0000
Message-ID: <178709288702.64478.4996397238331713989@61270ab9df2a>
X-Patchwork-Hint: ignore
References: <20260818210238.274246-1-jonathan.cavitt@intel.com>
In-Reply-To: <20260818210238.274246-1-jonathan.cavitt@intel.com>
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

--===============6559355952394793425==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: drm/i915/display: Check some INVALID_TRANSCODER cases (rev4)
URL   : https://patchwork.freedesktop.org/series/164655/
State : success

== Summary ==

CI Bug Log - changes from CI_DRM_19012 -> Patchwork_164655v4
====================================================

Summary
-------

  **SUCCESS**

  No regressions found.

  External URL: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_164655v4/index.html

Participating hosts (40 -> 37)
------------------------------

  Missing    (3): bat-dg2-13 fi-snb-2520m bat-adls-6 

Known issues
------------

  Here are the changes found in Patchwork_164655v4 that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@kms_cursor_legacy@basic-flip-after-cursor-varying-size:
    - fi-bsw-n3050:       [PASS][1] -> [FAIL][2] ([i915#16796])
   [1]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19012/fi-bsw-n3050/igt@kms_cursor_legacy@basic-flip-after-cursor-varying-size.html
   [2]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_164655v4/fi-bsw-n3050/igt@kms_cursor_legacy@basic-flip-after-cursor-varying-size.html

  * igt@kms_hdmi_inject@inject-audio:
    - fi-tgl-1115g4:      [PASS][3] -> [SKIP][4] ([i915#13030])
   [3]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19012/fi-tgl-1115g4/igt@kms_hdmi_inject@inject-audio.html
   [4]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_164655v4/fi-tgl-1115g4/igt@kms_hdmi_inject@inject-audio.html

  
  [i915#13030]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13030
  [i915#16796]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16796


Build changes
-------------

  * Linux: CI_DRM_19012 -> Patchwork_164655v4

  CI-20190529: 20190529
  CI_DRM_19012: 0b3f6d17f4bf02464d012545e4dc31901ba4cb66 @ git://anongit.freedesktop.org/gfx-ci/linux
  IGT_9059: f5a4ff79434df36db1d6b13deb37c90a6602565e @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
  Patchwork_164655v4: 0b3f6d17f4bf02464d012545e4dc31901ba4cb66 @ git://anongit.freedesktop.org/gfx-ci/linux

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_164655v4/index.html

--===============6559355952394793425==
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
<tr><td><b>Series:</b></td><td>drm/i915/display: Check some INVALID_TRANSCODER cases (rev4)</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/164655/">https://patchwork.freedesktop.org/series/164655/</a></td></tr>
<tr><td><b>State:</b></td><td>success</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_164655v4/index.html">https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_164655v4/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from CI_DRM_19012 -&gt; Patchwork_164655v4</h1>
<h2>Summary</h2>
<p><strong>SUCCESS</strong></p>
<p>No regressions found.</p>
<p>External URL: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_164655v4/index.html</p>
<h2>Participating hosts (40 -&gt; 37)</h2>
<p>Missing    (3): bat-dg2-13 fi-snb-2520m bat-adls-6 </p>
<h2>Known issues</h2>
<p>Here are the changes found in Patchwork_164655v4 that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>
<p>igt@kms_cursor_legacy@basic-flip-after-cursor-varying-size:</p>
<ul>
<li>fi-bsw-n3050:       <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19012/fi-bsw-n3050/igt@kms_cursor_legacy@basic-flip-after-cursor-varying-size.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_164655v4/fi-bsw-n3050/igt@kms_cursor_legacy@basic-flip-after-cursor-varying-size.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16796">i915#16796</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_hdmi_inject@inject-audio:</p>
<ul>
<li>fi-tgl-1115g4:      <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19012/fi-tgl-1115g4/igt@kms_hdmi_inject@inject-audio.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_164655v4/fi-tgl-1115g4/igt@kms_hdmi_inject@inject-audio.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13030">i915#13030</a>)</li>
</ul>
</li>
</ul>
<h2>Build changes</h2>
<ul>
<li>Linux: CI_DRM_19012 -&gt; Patchwork_164655v4</li>
</ul>
<p>CI-20190529: 20190529<br />
  CI_DRM_19012: 0b3f6d17f4bf02464d012545e4dc31901ba4cb66 @ git://anongit.freedesktop.org/gfx-ci/linux<br />
  IGT_9059: f5a4ff79434df36db1d6b13deb37c90a6602565e @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git<br />
  Patchwork_164655v4: 0b3f6d17f4bf02464d012545e4dc31901ba4cb66 @ git://anongit.freedesktop.org/gfx-ci/linux</p>

</body>
</html>

--===============6559355952394793425==--
