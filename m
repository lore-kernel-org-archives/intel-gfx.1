Return-Path: <intel-gfx-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1536BCD8CAE
	for <intel-gfx@archiver.kernel.org>; Tue,  9 Jun 2026 06:35:20 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9423310E0D4;
	Tue,  9 Jun 2026 06:35:19 +0000 (UTC)
Received: from 6beec6c84f66 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6A33B10E0D3;
 Tue,  9 Jun 2026 06:35:18 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============7872405838197218386=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=93_i915=2ECI=2EBAT=3A_success_for_drm/i915=3A_Handle_VSYNC_?=
 =?utf-8?q?timing_changes_in_the_LRR_path?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Ankit Nautiyal" <ankit.k.nautiyal@intel.com>
Cc: intel-gfx@lists.freedesktop.org
Date: Tue, 09 Jun 2026 06:35:18 -0000
Message-ID: <178098691842.57587.2037616796814494988@6beec6c84f66>
X-Patchwork-Hint: ignore
References: <20260609025325.1128543-1-ankit.k.nautiyal@intel.com>
In-Reply-To: <20260609025325.1128543-1-ankit.k.nautiyal@intel.com>
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

--===============7872405838197218386==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: drm/i915: Handle VSYNC timing changes in the LRR path
URL   : https://patchwork.freedesktop.org/series/168144/
State : success

== Summary ==

CI Bug Log - changes from CI_DRM_18645 -> Patchwork_168144v1
====================================================

Summary
-------

  **SUCCESS**

  No regressions found.

  External URL: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_168144v1/index.html

Participating hosts (42 -> 39)
------------------------------

  Missing    (3): bat-dg2-13 fi-snb-2520m bat-adls-6 

Known issues
------------

  Here are the changes found in Patchwork_168144v1 that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@i915_selftest@live:
    - bat-arlh-3:         [PASS][1] -> [INCOMPLETE][2] ([i915#16139]) +1 other test incomplete
   [1]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18645/bat-arlh-3/igt@i915_selftest@live.html
   [2]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_168144v1/bat-arlh-3/igt@i915_selftest@live.html
    - bat-arlh-2:         [PASS][3] -> [INCOMPLETE][4] ([i915#15978])
   [3]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18645/bat-arlh-2/igt@i915_selftest@live.html
   [4]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_168144v1/bat-arlh-2/igt@i915_selftest@live.html

  * igt@i915_selftest@live@guc_hang:
    - bat-arlh-2:         [PASS][5] -> [INCOMPLETE][6] ([i915#16376])
   [5]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18645/bat-arlh-2/igt@i915_selftest@live@guc_hang.html
   [6]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_168144v1/bat-arlh-2/igt@i915_selftest@live@guc_hang.html

  
  [i915#15978]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15978
  [i915#16139]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16139
  [i915#16376]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16376


Build changes
-------------

  * Linux: CI_DRM_18645 -> Patchwork_168144v1

  CI-20190529: 20190529
  CI_DRM_18645: cc6ecad1583df42f635269218c08a63e79218177 @ git://anongit.freedesktop.org/gfx-ci/linux
  IGT_8953: 8953
  Patchwork_168144v1: cc6ecad1583df42f635269218c08a63e79218177 @ git://anongit.freedesktop.org/gfx-ci/linux

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_168144v1/index.html

--===============7872405838197218386==
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
<tr><td><b>Series:</b></td><td>drm/i915: Handle VSYNC timing changes in the LRR path</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/168144/">https://patchwork.freedesktop.org/series/168144/</a></td></tr>
<tr><td><b>State:</b></td><td>success</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_168144v1/index.html">https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_168144v1/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from CI_DRM_18645 -&gt; Patchwork_168144v1</h1>
<h2>Summary</h2>
<p><strong>SUCCESS</strong></p>
<p>No regressions found.</p>
<p>External URL: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_168144v1/index.html</p>
<h2>Participating hosts (42 -&gt; 39)</h2>
<p>Missing    (3): bat-dg2-13 fi-snb-2520m bat-adls-6 </p>
<h2>Known issues</h2>
<p>Here are the changes found in Patchwork_168144v1 that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>
<p>igt@i915_selftest@live:</p>
<ul>
<li>bat-arlh-3:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18645/bat-arlh-3/igt@i915_selftest@live.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_168144v1/bat-arlh-3/igt@i915_selftest@live.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16139">i915#16139</a>) +1 other test incomplete</li>
<li>bat-arlh-2:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18645/bat-arlh-2/igt@i915_selftest@live.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_168144v1/bat-arlh-2/igt@i915_selftest@live.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15978">i915#15978</a>)</li>
</ul>
</li>
<li>
<p>igt@i915_selftest@live@guc_hang:</p>
<ul>
<li>bat-arlh-2:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18645/bat-arlh-2/igt@i915_selftest@live@guc_hang.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_168144v1/bat-arlh-2/igt@i915_selftest@live@guc_hang.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16376">i915#16376</a>)</li>
</ul>
</li>
</ul>
<h2>Build changes</h2>
<ul>
<li>Linux: CI_DRM_18645 -&gt; Patchwork_168144v1</li>
</ul>
<p>CI-20190529: 20190529<br />
  CI_DRM_18645: cc6ecad1583df42f635269218c08a63e79218177 @ git://anongit.freedesktop.org/gfx-ci/linux<br />
  IGT_8953: 8953<br />
  Patchwork_168144v1: cc6ecad1583df42f635269218c08a63e79218177 @ git://anongit.freedesktop.org/gfx-ci/linux</p>

</body>
</html>

--===============7872405838197218386==--
