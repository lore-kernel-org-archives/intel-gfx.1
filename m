Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9B0A0606A31B
	for <intel-gfx@archiver.kernel.org>; Thu, 22 Oct 2026 14:35:00 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 347971126CC;
	Thu, 22 Oct 2026 14:35:00 +0000 (UTC)
Received: from 221881a7231d (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 54C2E1126B5;
 Thu, 22 Oct 2026 14:34:59 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============5421527220878136772=="
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=93_i915=2ECI=2EBAT=3A_success_for_drm=3A_handle_IRQ=5FHPD_e?=
 =?utf-8?q?vents_correctly_=28rev7=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Dmitry Baryshkov" <dmitry.baryshkov@oss.qualcomm.com>
Cc: intel-gfx@lists.freedesktop.org
Date: Thu, 22 Oct 2026 14:34:59 -0000
Message-ID: <179267969933.58280.15409315388648000257@221881a7231d>
X-Patchwork-Hint: ignore
References: <20261022-hpd-irq-events-v6-0-337ea3ddaa62@oss.qualcomm.com>
In-Reply-To: <20261022-hpd-irq-events-v6-0-337ea3ddaa62@oss.qualcomm.com>
X-BeenThere: intel-gfx@lists.freedesktop.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Intel graphics driver community testing & development
 <intel-gfx.lists.freedesktop.org>
List-Archive: <https://lists.freedesktop.org/archives/intel-gfx>
List-Post: <mailto:intel-gfx@lists.freedesktop.org>
List-Help: <mailto:intel-gfx-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/intel-gfx>,
 <mailto:intel-gfx-request@lists.freedesktop.org?subject=subscribe>
Reply-To: intel-gfx@lists.freedesktop.org
Sender: "Intel-gfx" <intel-gfx-bounces@lists.freedesktop.org>
X-Spam-Status: No, score=-6.0 required=3.0 tests=BAYES_00,HTML_MESSAGE,
	MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS
	autolearn=no autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

--===============5421527220878136772==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: drm: handle IRQ_HPD events correctly (rev7)
URL   : https://patchwork.freedesktop.org/series/164957/
State : success

== Summary ==

CI Bug Log - changes from CI_DRM_19384 -> Patchwork_164957v7
====================================================

Summary
-------

  **SUCCESS**

  No regressions found.

  External URL: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_164957v7/index.html

Participating hosts (40 -> 39)
------------------------------

  Missing    (1): bat-dg2-13 

Known issues
------------

  Here are the changes found in Patchwork_164957v7 that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@i915_selftest@live:
    - bat-arlh-3:         [PASS][1] -> [INCOMPLETE][2] ([i915#16547])
   [1]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19384/bat-arlh-3/igt@i915_selftest@live.html
   [2]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_164957v7/bat-arlh-3/igt@i915_selftest@live.html

  * igt@i915_selftest@live@gt_pm:
    - bat-arlh-3:         [PASS][3] -> [INCOMPLETE][4] ([i915#17304])
   [3]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19384/bat-arlh-3/igt@i915_selftest@live@gt_pm.html
   [4]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_164957v7/bat-arlh-3/igt@i915_selftest@live@gt_pm.html

  
  [i915#16547]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16547
  [i915#17304]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17304


Build changes
-------------

  * Linux: CI_DRM_19384 -> Patchwork_164957v7

  CI-20190529: 20190529
  CI_DRM_19384: b2af5f9ef576a3026836cca5ec8757cc045a1856 @ git://anongit.freedesktop.org/gfx-ci/linux
  IGT_9158: c06ac65c584387323e8322c258d74cea1ce07b18 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
  Patchwork_164957v7: b2af5f9ef576a3026836cca5ec8757cc045a1856 @ git://anongit.freedesktop.org/gfx-ci/linux

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_164957v7/index.html

--===============5421527220878136772==
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
<tr><td><b>Series:</b></td><td>drm: handle IRQ_HPD events correctly (rev7)</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/164957/">https://patchwork.freedesktop.org/series/164957/</a></td></tr>
<tr><td><b>State:</b></td><td>success</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_164957v7/index.html">https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_164957v7/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from CI_DRM_19384 -&gt; Patchwork_164957v7</h1>
<h2>Summary</h2>
<p><strong>SUCCESS</strong></p>
<p>No regressions found.</p>
<p>External URL: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_164957v7/index.html</p>
<h2>Participating hosts (40 -&gt; 39)</h2>
<p>Missing    (1): bat-dg2-13 </p>
<h2>Known issues</h2>
<p>Here are the changes found in Patchwork_164957v7 that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>
<p>igt@i915_selftest@live:</p>
<ul>
<li>bat-arlh-3:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19384/bat-arlh-3/igt@i915_selftest@live.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_164957v7/bat-arlh-3/igt@i915_selftest@live.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16547">i915#16547</a>)</li>
</ul>
</li>
<li>
<p>igt@i915_selftest@live@gt_pm:</p>
<ul>
<li>bat-arlh-3:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19384/bat-arlh-3/igt@i915_selftest@live@gt_pm.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_164957v7/bat-arlh-3/igt@i915_selftest@live@gt_pm.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17304">i915#17304</a>)</li>
</ul>
</li>
</ul>
<h2>Build changes</h2>
<ul>
<li>Linux: CI_DRM_19384 -&gt; Patchwork_164957v7</li>
</ul>
<p>CI-20190529: 20190529<br />
  CI_DRM_19384: b2af5f9ef576a3026836cca5ec8757cc045a1856 @ git://anongit.freedesktop.org/gfx-ci/linux<br />
  IGT_9158: c06ac65c584387323e8322c258d74cea1ce07b18 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git<br />
  Patchwork_164957v7: b2af5f9ef576a3026836cca5ec8757cc045a1856 @ git://anongit.freedesktop.org/gfx-ci/linux</p>

</body>
</html>

--===============5421527220878136772==--
