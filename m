Return-Path: <intel-gfx-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 49DBAF30924
	for <intel-gfx@archiver.kernel.org>; Thu,  5 Mar 2026 09:58:46 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C6C6D10EBEA;
	Thu,  5 Mar 2026 09:58:45 +0000 (UTC)
Received: from a3b018990fe9 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 71CD610EBDC;
 Thu,  5 Mar 2026 09:58:44 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============3827483970784933823=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=93_i915=2ECI=2EBAT=3A_success_for_drm/i915/lnl+/tc=3A_Fix_f?=
 =?utf-8?q?alse_disconnect_of_active_DP-alt_TC_port_during_long_HPD_pulse?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Chia-Lin Kao (AceLan)" <acelan.kao@canonical.com>
Cc: intel-gfx@lists.freedesktop.org
Date: Thu, 05 Mar 2026 09:58:44 -0000
Message-ID: <177270472444.320086.9605946094730694783@a3b018990fe9>
X-Patchwork-Hint: ignore
References: <20260305075857.40077-1-acelan.kao@canonical.com>
In-Reply-To: <20260305075857.40077-1-acelan.kao@canonical.com>
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

--===============3827483970784933823==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: drm/i915/lnl+/tc: Fix false disconnect of active DP-alt TC port during long HPD pulse
URL   : https://patchwork.freedesktop.org/series/162632/
State : success

== Summary ==

CI Bug Log - changes from CI_DRM_18096 -> Patchwork_162632v1
====================================================

Summary
-------

  **SUCCESS**

  No regressions found.

  External URL: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_162632v1/index.html

Participating hosts (42 -> 39)
------------------------------

  Missing    (3): bat-dg2-13 fi-snb-2520m bat-adls-6 

Known issues
------------

  Here are the changes found in Patchwork_162632v1 that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@i915_pm_rpm@module-reload:
    - bat-arlh-3:         [PASS][1] -> [INCOMPLETE][2] ([i915#15631])
   [1]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18096/bat-arlh-3/igt@i915_pm_rpm@module-reload.html
   [2]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_162632v1/bat-arlh-3/igt@i915_pm_rpm@module-reload.html

  * igt@i915_selftest@live:
    - bat-dg2-8:          [PASS][3] -> [DMESG-FAIL][4] ([i915#12061]) +1 other test dmesg-fail
   [3]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18096/bat-dg2-8/igt@i915_selftest@live.html
   [4]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_162632v1/bat-dg2-8/igt@i915_selftest@live.html

  * igt@i915_selftest@live@workarounds:
    - bat-arls-6:         [PASS][5] -> [DMESG-FAIL][6] ([i915#12061]) +1 other test dmesg-fail
   [5]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18096/bat-arls-6/igt@i915_selftest@live@workarounds.html
   [6]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_162632v1/bat-arls-6/igt@i915_selftest@live@workarounds.html

  
#### Possible fixes ####

  * igt@i915_selftest@live@workarounds:
    - bat-mtlp-9:         [DMESG-FAIL][7] ([i915#12061]) -> [PASS][8] +1 other test pass
   [7]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18096/bat-mtlp-9/igt@i915_selftest@live@workarounds.html
   [8]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_162632v1/bat-mtlp-9/igt@i915_selftest@live@workarounds.html

  
  [i915#12061]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12061
  [i915#15631]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15631


Build changes
-------------

  * Linux: CI_DRM_18096 -> Patchwork_162632v1

  CI-20190529: 20190529
  CI_DRM_18096: 704ff20b65b8a8037c10332bad4ecabbfeab7cdc @ git://anongit.freedesktop.org/gfx-ci/linux
  IGT_8777: a50285a68dbef0fe11140adef4016a756f57b324 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
  Patchwork_162632v1: 704ff20b65b8a8037c10332bad4ecabbfeab7cdc @ git://anongit.freedesktop.org/gfx-ci/linux

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_162632v1/index.html

--===============3827483970784933823==
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
<tr><td><b>Series:</b></td><td>drm/i915/lnl+/tc: Fix false disconnect of active DP-alt TC port during long HPD pulse</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/162632/">https://patchwork.freedesktop.org/series/162632/</a></td></tr>
<tr><td><b>State:</b></td><td>success</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_162632v1/index.html">https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_162632v1/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from CI_DRM_18096 -&gt; Patchwork_162632v1</h1>
<h2>Summary</h2>
<p><strong>SUCCESS</strong></p>
<p>No regressions found.</p>
<p>External URL: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_162632v1/index.html</p>
<h2>Participating hosts (42 -&gt; 39)</h2>
<p>Missing    (3): bat-dg2-13 fi-snb-2520m bat-adls-6 </p>
<h2>Known issues</h2>
<p>Here are the changes found in Patchwork_162632v1 that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>
<p>igt@i915_pm_rpm@module-reload:</p>
<ul>
<li>bat-arlh-3:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18096/bat-arlh-3/igt@i915_pm_rpm@module-reload.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_162632v1/bat-arlh-3/igt@i915_pm_rpm@module-reload.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15631">i915#15631</a>)</li>
</ul>
</li>
<li>
<p>igt@i915_selftest@live:</p>
<ul>
<li>bat-dg2-8:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18096/bat-dg2-8/igt@i915_selftest@live.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_162632v1/bat-dg2-8/igt@i915_selftest@live.html">DMESG-FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12061">i915#12061</a>) +1 other test dmesg-fail</li>
</ul>
</li>
<li>
<p>igt@i915_selftest@live@workarounds:</p>
<ul>
<li>bat-arls-6:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18096/bat-arls-6/igt@i915_selftest@live@workarounds.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_162632v1/bat-arls-6/igt@i915_selftest@live@workarounds.html">DMESG-FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12061">i915#12061</a>) +1 other test dmesg-fail</li>
</ul>
</li>
</ul>
<h4>Possible fixes</h4>
<ul>
<li>igt@i915_selftest@live@workarounds:<ul>
<li>bat-mtlp-9:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18096/bat-mtlp-9/igt@i915_selftest@live@workarounds.html">DMESG-FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12061">i915#12061</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_162632v1/bat-mtlp-9/igt@i915_selftest@live@workarounds.html">PASS</a> +1 other test pass</li>
</ul>
</li>
</ul>
<h2>Build changes</h2>
<ul>
<li>Linux: CI_DRM_18096 -&gt; Patchwork_162632v1</li>
</ul>
<p>CI-20190529: 20190529<br />
  CI_DRM_18096: 704ff20b65b8a8037c10332bad4ecabbfeab7cdc @ git://anongit.freedesktop.org/gfx-ci/linux<br />
  IGT_8777: a50285a68dbef0fe11140adef4016a756f57b324 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git<br />
  Patchwork_162632v1: 704ff20b65b8a8037c10332bad4ecabbfeab7cdc @ git://anongit.freedesktop.org/gfx-ci/linux</p>

</body>
</html>

--===============3827483970784933823==--
