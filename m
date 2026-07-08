Return-Path: <intel-gfx-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5B90EC43458
	for <intel-gfx@archiver.kernel.org>; Wed,  8 Jul 2026 15:21:32 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CE19610E4D9;
	Wed,  8 Jul 2026 15:21:31 +0000 (UTC)
Received: from 6beec6c84f66 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 69C1610E4D9;
 Wed,  8 Jul 2026 15:21:30 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============7763016610421983913=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=93_i915=2ECI=2EBAT=3A_success_for_drm/i915/audio=3A_treat_U?=
 =?utf-8?q?HBR_SST_like_MST_for_cpu=5Ftranscoder_signalling_=28rev3=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Mitul Golani" <mitulkumar.ajitkumar.golani@intel.com>
Cc: intel-gfx@lists.freedesktop.org
Date: Wed, 08 Jul 2026 15:21:30 -0000
Message-ID: <178352409042.165378.16118942555806981846@6beec6c84f66>
X-Patchwork-Hint: ignore
References: <20260708113558.1863316-1-mitulkumar.ajitkumar.golani@intel.com>
In-Reply-To: <20260708113558.1863316-1-mitulkumar.ajitkumar.golani@intel.com>
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

--===============7763016610421983913==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: drm/i915/audio: treat UHBR SST like MST for cpu_transcoder signalling (rev3)
URL   : https://patchwork.freedesktop.org/series/169868/
State : success

== Summary ==

CI Bug Log - changes from CI_DRM_18787 -> Patchwork_169868v3
====================================================

Summary
-------

  **SUCCESS**

  No regressions found.

  External URL: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_169868v3/index.html

Participating hosts (42 -> 40)
------------------------------

  Missing    (2): bat-dg2-13 fi-snb-2520m 

Known issues
------------

  Here are the changes found in Patchwork_169868v3 that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@i915_selftest@live:
    - bat-arlh-2:         [PASS][1] -> [INCOMPLETE][2] ([i915#16547])
   [1]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18787/bat-arlh-2/igt@i915_selftest@live.html
   [2]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_169868v3/bat-arlh-2/igt@i915_selftest@live.html

  * igt@i915_selftest@live@coherency:
    - bat-arlh-2:         [PASS][3] -> [INCOMPLETE][4] ([i915#16575])
   [3]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18787/bat-arlh-2/igt@i915_selftest@live@coherency.html
   [4]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_169868v3/bat-arlh-2/igt@i915_selftest@live@coherency.html

  
  [i915#16547]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16547
  [i915#16575]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16575


Build changes
-------------

  * Linux: CI_DRM_18787 -> Patchwork_169868v3

  CI-20190529: 20190529
  CI_DRM_18787: d2b771941e0c8aec7b6648b0c47d81161136944d @ git://anongit.freedesktop.org/gfx-ci/linux
  IGT_8992: 1e912fa143a35c4238a1fbcf94443175d8ce1d60 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
  Patchwork_169868v3: d2b771941e0c8aec7b6648b0c47d81161136944d @ git://anongit.freedesktop.org/gfx-ci/linux

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_169868v3/index.html

--===============7763016610421983913==
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
<tr><td><b>Series:</b></td><td>drm/i915/audio: treat UHBR SST like MST for cpu_transcoder signalling (rev3)</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/169868/">https://patchwork.freedesktop.org/series/169868/</a></td></tr>
<tr><td><b>State:</b></td><td>success</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_169868v3/index.html">https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_169868v3/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from CI_DRM_18787 -&gt; Patchwork_169868v3</h1>
<h2>Summary</h2>
<p><strong>SUCCESS</strong></p>
<p>No regressions found.</p>
<p>External URL: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_169868v3/index.html</p>
<h2>Participating hosts (42 -&gt; 40)</h2>
<p>Missing    (2): bat-dg2-13 fi-snb-2520m </p>
<h2>Known issues</h2>
<p>Here are the changes found in Patchwork_169868v3 that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>
<p>igt@i915_selftest@live:</p>
<ul>
<li>bat-arlh-2:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18787/bat-arlh-2/igt@i915_selftest@live.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_169868v3/bat-arlh-2/igt@i915_selftest@live.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16547">i915#16547</a>)</li>
</ul>
</li>
<li>
<p>igt@i915_selftest@live@coherency:</p>
<ul>
<li>bat-arlh-2:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18787/bat-arlh-2/igt@i915_selftest@live@coherency.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_169868v3/bat-arlh-2/igt@i915_selftest@live@coherency.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16575">i915#16575</a>)</li>
</ul>
</li>
</ul>
<h2>Build changes</h2>
<ul>
<li>Linux: CI_DRM_18787 -&gt; Patchwork_169868v3</li>
</ul>
<p>CI-20190529: 20190529<br />
  CI_DRM_18787: d2b771941e0c8aec7b6648b0c47d81161136944d @ git://anongit.freedesktop.org/gfx-ci/linux<br />
  IGT_8992: 1e912fa143a35c4238a1fbcf94443175d8ce1d60 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git<br />
  Patchwork_169868v3: d2b771941e0c8aec7b6648b0c47d81161136944d @ git://anongit.freedesktop.org/gfx-ci/linux</p>

</body>
</html>

--===============7763016610421983913==--
