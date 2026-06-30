Return-Path: <intel-gfx-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 39E65C43602
	for <intel-gfx@archiver.kernel.org>; Tue, 30 Jun 2026 12:18:28 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AF13C10E1EB;
	Tue, 30 Jun 2026 12:18:27 +0000 (UTC)
Received: from 6beec6c84f66 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6A80E10E0B4;
 Tue, 30 Jun 2026 12:18:26 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============3830576334556467964=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=93_i915=2ECI=2EBAT=3A_success_for_drm=3A_Guard_DRM=5FCLIENT?=
 =?utf-8?q?=5FCAP=5FPLANE=5FCOLOR=5FPIPELINE_behind_driver_feature?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Robert Mader" <robert.mader@collabora.com>
Cc: intel-gfx@lists.freedesktop.org
Date: Tue, 30 Jun 2026 12:18:26 -0000
Message-ID: <178282190643.133065.545353120912550389@6beec6c84f66>
X-Patchwork-Hint: ignore
References: <20260630084229.529682-1-robert.mader@collabora.com>
In-Reply-To: <20260630084229.529682-1-robert.mader@collabora.com>
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

--===============3830576334556467964==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: drm: Guard DRM_CLIENT_CAP_PLANE_COLOR_PIPELINE behind driver feature
URL   : https://patchwork.freedesktop.org/series/169489/
State : success

== Summary ==

CI Bug Log - changes from CI_DRM_18729 -> Patchwork_169489v1
====================================================

Summary
-------

  **SUCCESS**

  No regressions found.

  External URL: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_169489v1/index.html

Participating hosts (41 -> 39)
------------------------------

  Missing    (2): bat-dg2-13 fi-snb-2520m 

Known issues
------------

  Here are the changes found in Patchwork_169489v1 that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@i915_selftest@live@late_gt_pm:
    - fi-cfl-8109u:       [PASS][1] -> [DMESG-WARN][2] ([i915#13735]) +32 other tests dmesg-warn
   [1]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18729/fi-cfl-8109u/igt@i915_selftest@live@late_gt_pm.html
   [2]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_169489v1/fi-cfl-8109u/igt@i915_selftest@live@late_gt_pm.html

  * igt@kms_pipe_crc_basic@read-crc:
    - fi-cfl-8109u:       [PASS][3] -> [DMESG-WARN][4] ([i915#15673]) +48 other tests dmesg-warn
   [3]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18729/fi-cfl-8109u/igt@kms_pipe_crc_basic@read-crc.html
   [4]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_169489v1/fi-cfl-8109u/igt@kms_pipe_crc_basic@read-crc.html

  
#### Possible fixes ####

  * igt@i915_selftest@live:
    - fi-bsw-n3050:       [DMESG-WARN][5] -> [PASS][6] +1 other test pass
   [5]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18729/fi-bsw-n3050/igt@i915_selftest@live.html
   [6]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_169489v1/fi-bsw-n3050/igt@i915_selftest@live.html

  
  [i915#13735]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13735
  [i915#15673]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15673


Build changes
-------------

  * Linux: CI_DRM_18729 -> Patchwork_169489v1

  CI-20190529: 20190529
  CI_DRM_18729: a2d82f27ac35c691c1c65b40c72b13d8b2a7f91f @ git://anongit.freedesktop.org/gfx-ci/linux
  IGT_8988: 8988
  Patchwork_169489v1: a2d82f27ac35c691c1c65b40c72b13d8b2a7f91f @ git://anongit.freedesktop.org/gfx-ci/linux

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_169489v1/index.html

--===============3830576334556467964==
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
<tr><td><b>Series:</b></td><td>drm: Guard DRM_CLIENT_CAP_PLANE_COLOR_PIPELINE behind driver feature</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/169489/">https://patchwork.freedesktop.org/series/169489/</a></td></tr>
<tr><td><b>State:</b></td><td>success</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_169489v1/index.html">https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_169489v1/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from CI_DRM_18729 -&gt; Patchwork_169489v1</h1>
<h2>Summary</h2>
<p><strong>SUCCESS</strong></p>
<p>No regressions found.</p>
<p>External URL: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_169489v1/index.html</p>
<h2>Participating hosts (41 -&gt; 39)</h2>
<p>Missing    (2): bat-dg2-13 fi-snb-2520m </p>
<h2>Known issues</h2>
<p>Here are the changes found in Patchwork_169489v1 that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>
<p>igt@i915_selftest@live@late_gt_pm:</p>
<ul>
<li>fi-cfl-8109u:       <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18729/fi-cfl-8109u/igt@i915_selftest@live@late_gt_pm.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_169489v1/fi-cfl-8109u/igt@i915_selftest@live@late_gt_pm.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13735">i915#13735</a>) +32 other tests dmesg-warn</li>
</ul>
</li>
<li>
<p>igt@kms_pipe_crc_basic@read-crc:</p>
<ul>
<li>fi-cfl-8109u:       <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18729/fi-cfl-8109u/igt@kms_pipe_crc_basic@read-crc.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_169489v1/fi-cfl-8109u/igt@kms_pipe_crc_basic@read-crc.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15673">i915#15673</a>) +48 other tests dmesg-warn</li>
</ul>
</li>
</ul>
<h4>Possible fixes</h4>
<ul>
<li>igt@i915_selftest@live:<ul>
<li>fi-bsw-n3050:       <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18729/fi-bsw-n3050/igt@i915_selftest@live.html">DMESG-WARN</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_169489v1/fi-bsw-n3050/igt@i915_selftest@live.html">PASS</a> +1 other test pass</li>
</ul>
</li>
</ul>
<h2>Build changes</h2>
<ul>
<li>Linux: CI_DRM_18729 -&gt; Patchwork_169489v1</li>
</ul>
<p>CI-20190529: 20190529<br />
  CI_DRM_18729: a2d82f27ac35c691c1c65b40c72b13d8b2a7f91f @ git://anongit.freedesktop.org/gfx-ci/linux<br />
  IGT_8988: 8988<br />
  Patchwork_169489v1: a2d82f27ac35c691c1c65b40c72b13d8b2a7f91f @ git://anongit.freedesktop.org/gfx-ci/linux</p>

</body>
</html>

--===============3830576334556467964==--
