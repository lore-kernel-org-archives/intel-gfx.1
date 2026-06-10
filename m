Return-Path: <intel-gfx-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 61469CD8CB9
	for <intel-gfx@archiver.kernel.org>; Wed, 10 Jun 2026 16:07:07 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EAD7810EA80;
	Wed, 10 Jun 2026 16:07:06 +0000 (UTC)
Received: from 6beec6c84f66 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0353A10E4A6;
 Wed, 10 Jun 2026 16:07:06 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============6999542003097247368=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=93_i915=2ECI=2EBAT=3A_success_for_drm/i915=3A_clear_CRTC_co?=
 =?utf-8?q?lor_blob_pointers_after_dropping_refs_=28rev2=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Guangshuo Li" <lgs201920130244@gmail.com>
Cc: intel-gfx@lists.freedesktop.org
Date: Wed, 10 Jun 2026 16:07:06 -0000
Message-ID: <178110762600.65390.4580575195618194357@6beec6c84f66>
X-Patchwork-Hint: ignore
References: <20260610035419.1596963-1-lgs201920130244@gmail.com>
In-Reply-To: <20260610035419.1596963-1-lgs201920130244@gmail.com>
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

--===============6999542003097247368==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: drm/i915: clear CRTC color blob pointers after dropping refs (rev2)
URL   : https://patchwork.freedesktop.org/series/168258/
State : success

== Summary ==

CI Bug Log - changes from CI_DRM_18654 -> Patchwork_168258v2
====================================================

Summary
-------

  **SUCCESS**

  No regressions found.

  External URL: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_168258v2/index.html

Participating hosts (42 -> 40)
------------------------------

  Missing    (2): bat-dg2-13 fi-snb-2520m 

Known issues
------------

  Here are the changes found in Patchwork_168258v2 that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@i915_selftest@live@gem_migrate:
    - bat-arlh-2:         [PASS][1] -> [INCOMPLETE][2] ([i915#15978]) +1 other test incomplete
   [1]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18654/bat-arlh-2/igt@i915_selftest@live@gem_migrate.html
   [2]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_168258v2/bat-arlh-2/igt@i915_selftest@live@gem_migrate.html

  
  [i915#15978]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15978


Build changes
-------------

  * Linux: CI_DRM_18654 -> Patchwork_168258v2

  CI-20190529: 20190529
  CI_DRM_18654: fc59f76558703febba8056be87d1c97d14f7485e @ git://anongit.freedesktop.org/gfx-ci/linux
  IGT_8956: 8956
  Patchwork_168258v2: fc59f76558703febba8056be87d1c97d14f7485e @ git://anongit.freedesktop.org/gfx-ci/linux

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_168258v2/index.html

--===============6999542003097247368==
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
<tr><td><b>Series:</b></td><td>drm/i915: clear CRTC color blob pointers after dropping refs (rev2)</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/168258/">https://patchwork.freedesktop.org/series/168258/</a></td></tr>
<tr><td><b>State:</b></td><td>success</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_168258v2/index.html">https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_168258v2/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from CI_DRM_18654 -&gt; Patchwork_168258v2</h1>
<h2>Summary</h2>
<p><strong>SUCCESS</strong></p>
<p>No regressions found.</p>
<p>External URL: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_168258v2/index.html</p>
<h2>Participating hosts (42 -&gt; 40)</h2>
<p>Missing    (2): bat-dg2-13 fi-snb-2520m </p>
<h2>Known issues</h2>
<p>Here are the changes found in Patchwork_168258v2 that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>igt@i915_selftest@live@gem_migrate:<ul>
<li>bat-arlh-2:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18654/bat-arlh-2/igt@i915_selftest@live@gem_migrate.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_168258v2/bat-arlh-2/igt@i915_selftest@live@gem_migrate.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15978">i915#15978</a>) +1 other test incomplete</li>
</ul>
</li>
</ul>
<h2>Build changes</h2>
<ul>
<li>Linux: CI_DRM_18654 -&gt; Patchwork_168258v2</li>
</ul>
<p>CI-20190529: 20190529<br />
  CI_DRM_18654: fc59f76558703febba8056be87d1c97d14f7485e @ git://anongit.freedesktop.org/gfx-ci/linux<br />
  IGT_8956: 8956<br />
  Patchwork_168258v2: fc59f76558703febba8056be87d1c97d14f7485e @ git://anongit.freedesktop.org/gfx-ci/linux</p>

</body>
</html>

--===============6999542003097247368==--
