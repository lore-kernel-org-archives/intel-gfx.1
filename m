Return-Path: <intel-gfx-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 00085C55174
	for <intel-gfx@archiver.kernel.org>; Sat,  8 Aug 2026 05:31:09 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 17B1B10E20C;
	Sat,  8 Aug 2026 05:31:09 +0000 (UTC)
Received: from 61270ab9df2a (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 97EA810E0E1;
 Sat,  8 Aug 2026 05:31:07 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============1969807743942991875=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=93_i915=2ECI=2EBAT=3A_success_for_drm/i915/display=3A_Add_q?=
 =?utf-8?q?uirk_to_force_backlight_type_on_some_TUXEDO_devices?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Werner Sembach" <wse@tuxedocomputers.com>
Cc: intel-gfx@lists.freedesktop.org
Date: Sat, 08 Aug 2026 05:31:07 -0000
Message-ID: <178616706759.30889.2999023982897284019@61270ab9df2a>
X-Patchwork-Hint: ignore
References: <20260807200709.464343-1-wse@tuxedocomputers.com>
In-Reply-To: <20260807200709.464343-1-wse@tuxedocomputers.com>
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

--===============1969807743942991875==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: drm/i915/display: Add quirk to force backlight type on some TUXEDO devices
URL   : https://patchwork.freedesktop.org/series/171811/
State : success

== Summary ==

CI Bug Log - changes from CI_DRM_18963 -> Patchwork_171811v1
====================================================

Summary
-------

  **SUCCESS**

  No regressions found.

  External URL: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_171811v1/index.html

Participating hosts (38 -> 36)
------------------------------

  Missing    (2): bat-dg2-13 fi-snb-2520m 

Known issues
------------

  Here are the changes found in Patchwork_171811v1 that come from known issues:

### IGT changes ###

#### Possible fixes ####

  * igt@i915_selftest@live:
    - bat-arlh-2:         [INCOMPLETE][1] ([i915#16547]) -> [PASS][2]
   [1]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18963/bat-arlh-2/igt@i915_selftest@live.html
   [2]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_171811v1/bat-arlh-2/igt@i915_selftest@live.html

  * igt@i915_selftest@live@vma:
    - bat-arlh-2:         [INCOMPLETE][3] -> [PASS][4]
   [3]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18963/bat-arlh-2/igt@i915_selftest@live@vma.html
   [4]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_171811v1/bat-arlh-2/igt@i915_selftest@live@vma.html

  
  [i915#16547]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16547


Build changes
-------------

  * Linux: CI_DRM_18963 -> Patchwork_171811v1

  CI-20190529: 20190529
  CI_DRM_18963: 73ca195e4ebfaa9ae0648c8d48af49eedaec246b @ git://anongit.freedesktop.org/gfx-ci/linux
  IGT_9047: 9047
  Patchwork_171811v1: 73ca195e4ebfaa9ae0648c8d48af49eedaec246b @ git://anongit.freedesktop.org/gfx-ci/linux

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_171811v1/index.html

--===============1969807743942991875==
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
<tr><td><b>Series:</b></td><td>drm/i915/display: Add quirk to force backlight type on some TUXEDO devices</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/171811/">https://patchwork.freedesktop.org/series/171811/</a></td></tr>
<tr><td><b>State:</b></td><td>success</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_171811v1/index.html">https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_171811v1/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from CI_DRM_18963 -&gt; Patchwork_171811v1</h1>
<h2>Summary</h2>
<p><strong>SUCCESS</strong></p>
<p>No regressions found.</p>
<p>External URL: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_171811v1/index.html</p>
<h2>Participating hosts (38 -&gt; 36)</h2>
<p>Missing    (2): bat-dg2-13 fi-snb-2520m </p>
<h2>Known issues</h2>
<p>Here are the changes found in Patchwork_171811v1 that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Possible fixes</h4>
<ul>
<li>
<p>igt@i915_selftest@live:</p>
<ul>
<li>bat-arlh-2:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18963/bat-arlh-2/igt@i915_selftest@live.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16547">i915#16547</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_171811v1/bat-arlh-2/igt@i915_selftest@live.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@i915_selftest@live@vma:</p>
<ul>
<li>bat-arlh-2:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18963/bat-arlh-2/igt@i915_selftest@live@vma.html">INCOMPLETE</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_171811v1/bat-arlh-2/igt@i915_selftest@live@vma.html">PASS</a></li>
</ul>
</li>
</ul>
<h2>Build changes</h2>
<ul>
<li>Linux: CI_DRM_18963 -&gt; Patchwork_171811v1</li>
</ul>
<p>CI-20190529: 20190529<br />
  CI_DRM_18963: 73ca195e4ebfaa9ae0648c8d48af49eedaec246b @ git://anongit.freedesktop.org/gfx-ci/linux<br />
  IGT_9047: 9047<br />
  Patchwork_171811v1: 73ca195e4ebfaa9ae0648c8d48af49eedaec246b @ git://anongit.freedesktop.org/gfx-ci/linux</p>

</body>
</html>

--===============1969807743942991875==--
