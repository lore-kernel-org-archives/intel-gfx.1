Return-Path: <intel-gfx-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E86FDFD7061
	for <intel-gfx@archiver.kernel.org>; Tue, 17 Mar 2026 10:11:27 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 80ACF10E4C5;
	Tue, 17 Mar 2026 10:11:27 +0000 (UTC)
Received: from a3b018990fe9 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2F59F10E4C9;
 Tue, 17 Mar 2026 10:11:26 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============5072808200961685920=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=93_i915=2ECI=2EBAT=3A_success_for_drm/i915/gmbus=3A_fix_bug?=
 =?utf-8?q?s?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Samasth Norway Ananda" <samasth.norway.ananda@oracle.com>
Cc: intel-gfx@lists.freedesktop.org
Date: Tue, 17 Mar 2026 10:11:26 -0000
Message-ID: <177374228616.365545.14737506467049149406@a3b018990fe9>
X-Patchwork-Hint: ignore
References: <20260316231920.135438-1-samasth.norway.ananda@oracle.com>
In-Reply-To: <20260316231920.135438-1-samasth.norway.ananda@oracle.com>
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

--===============5072808200961685920==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: drm/i915/gmbus: fix bugs
URL   : https://patchwork.freedesktop.org/series/163332/
State : success

== Summary ==

CI Bug Log - changes from CI_DRM_18160 -> Patchwork_163332v1
====================================================

Summary
-------

  **SUCCESS**

  No regressions found.

  External URL: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_163332v1/index.html

Participating hosts (41 -> 39)
------------------------------

  Missing    (2): bat-dg2-13 fi-snb-2520m 

Known issues
------------

  Here are the changes found in Patchwork_163332v1 that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@i915_selftest@live@late_gt_pm:
    - fi-cfl-8109u:       [PASS][1] -> [DMESG-WARN][2] ([i915#13735]) +33 other tests dmesg-warn
   [1]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18160/fi-cfl-8109u/igt@i915_selftest@live@late_gt_pm.html
   [2]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_163332v1/fi-cfl-8109u/igt@i915_selftest@live@late_gt_pm.html

  * igt@i915_selftest@live@workarounds:
    - bat-arls-6:         [PASS][3] -> [DMESG-FAIL][4] ([i915#12061]) +1 other test dmesg-fail
   [3]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18160/bat-arls-6/igt@i915_selftest@live@workarounds.html
   [4]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_163332v1/bat-arls-6/igt@i915_selftest@live@workarounds.html

  
#### Possible fixes ####

  * igt@i915_selftest@live@workarounds:
    - bat-dg2-14:         [DMESG-FAIL][5] ([i915#12061]) -> [PASS][6] +1 other test pass
   [5]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18160/bat-dg2-14/igt@i915_selftest@live@workarounds.html
   [6]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_163332v1/bat-dg2-14/igt@i915_selftest@live@workarounds.html

  
  [i915#12061]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12061
  [i915#13735]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13735


Build changes
-------------

  * Linux: CI_DRM_18160 -> Patchwork_163332v1

  CI-20190529: 20190529
  CI_DRM_18160: a25d8c583e1e52bde77d371081a7c3fcd0a2e820 @ git://anongit.freedesktop.org/gfx-ci/linux
  IGT_8805: 8805
  Patchwork_163332v1: a25d8c583e1e52bde77d371081a7c3fcd0a2e820 @ git://anongit.freedesktop.org/gfx-ci/linux

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_163332v1/index.html

--===============5072808200961685920==
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
<tr><td><b>Series:</b></td><td>drm/i915/gmbus: fix bugs</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/163332/">https://patchwork.freedesktop.org/series/163332/</a></td></tr>
<tr><td><b>State:</b></td><td>success</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_163332v1/index.html">https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_163332v1/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from CI_DRM_18160 -&gt; Patchwork_163332v1</h1>
<h2>Summary</h2>
<p><strong>SUCCESS</strong></p>
<p>No regressions found.</p>
<p>External URL: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_163332v1/index.html</p>
<h2>Participating hosts (41 -&gt; 39)</h2>
<p>Missing    (2): bat-dg2-13 fi-snb-2520m </p>
<h2>Known issues</h2>
<p>Here are the changes found in Patchwork_163332v1 that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>
<p>igt@i915_selftest@live@late_gt_pm:</p>
<ul>
<li>fi-cfl-8109u:       <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18160/fi-cfl-8109u/igt@i915_selftest@live@late_gt_pm.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_163332v1/fi-cfl-8109u/igt@i915_selftest@live@late_gt_pm.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13735">i915#13735</a>) +33 other tests dmesg-warn</li>
</ul>
</li>
<li>
<p>igt@i915_selftest@live@workarounds:</p>
<ul>
<li>bat-arls-6:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18160/bat-arls-6/igt@i915_selftest@live@workarounds.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_163332v1/bat-arls-6/igt@i915_selftest@live@workarounds.html">DMESG-FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12061">i915#12061</a>) +1 other test dmesg-fail</li>
</ul>
</li>
</ul>
<h4>Possible fixes</h4>
<ul>
<li>igt@i915_selftest@live@workarounds:<ul>
<li>bat-dg2-14:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18160/bat-dg2-14/igt@i915_selftest@live@workarounds.html">DMESG-FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12061">i915#12061</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_163332v1/bat-dg2-14/igt@i915_selftest@live@workarounds.html">PASS</a> +1 other test pass</li>
</ul>
</li>
</ul>
<h2>Build changes</h2>
<ul>
<li>Linux: CI_DRM_18160 -&gt; Patchwork_163332v1</li>
</ul>
<p>CI-20190529: 20190529<br />
  CI_DRM_18160: a25d8c583e1e52bde77d371081a7c3fcd0a2e820 @ git://anongit.freedesktop.org/gfx-ci/linux<br />
  IGT_8805: 8805<br />
  Patchwork_163332v1: a25d8c583e1e52bde77d371081a7c3fcd0a2e820 @ git://anongit.freedesktop.org/gfx-ci/linux</p>

</body>
</html>

--===============5072808200961685920==--
