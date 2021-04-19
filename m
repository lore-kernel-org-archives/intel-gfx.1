Return-Path: <SRS0=JaAq=JQ=lists.freedesktop.org=intel-gfx-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,HTML_MESSAGE,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 453C5C433ED
	for <intel-gfx@archiver.kernel.org>; Mon, 19 Apr 2021 16:08:22 +0000 (UTC)
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id F047361354
	for <intel-gfx@archiver.kernel.org>; Mon, 19 Apr 2021 16:08:21 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org F047361354
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=emeril.freedesktop.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=intel-gfx-bounces@lists.freedesktop.org
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9C823898EE;
	Mon, 19 Apr 2021 16:08:21 +0000 (UTC)
Received: from emeril.freedesktop.org (emeril.freedesktop.org
 [IPv6:2610:10:20:722:a800:ff:feee:56cf])
 by gabe.freedesktop.org (Postfix) with ESMTP id B48A58989F;
 Mon, 19 Apr 2021 16:08:20 +0000 (UTC)
Received: from emeril.freedesktop.org (localhost [127.0.0.1])
 by emeril.freedesktop.org (Postfix) with ESMTP id 898B7A8835;
 Mon, 19 Apr 2021 16:08:20 +0000 (UTC)
MIME-Version: 1.0
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Lee Shawn C" <shawn.c.lee@intel.com>
Date: Mon, 19 Apr 2021 16:08:20 -0000
Message-ID: <161884850053.27829.3936513298944753580@emeril.freedesktop.org>
X-Patchwork-Hint: ignore
References: <20210419151718.22979-1-shawn.c.lee@intel.com>
In-Reply-To: <20210419151718.22979-1-shawn.c.lee@intel.com>
Subject: [Intel-gfx] =?utf-8?b?4pyTIEZpLkNJLkJBVDogc3VjY2VzcyBmb3IgZHJt?=
 =?utf-8?q?/i915=3A_set_min_brightness_for_aux_backlight_interface=2E?=
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
Cc: intel-gfx@lists.freedesktop.org
Content-Type: multipart/mixed; boundary="===============0232682536=="
Errors-To: intel-gfx-bounces@lists.freedesktop.org
Sender: "Intel-gfx" <intel-gfx-bounces@lists.freedesktop.org>

--===============0232682536==
Content-Type: multipart/alternative;
 boundary="===============6075633735849361928=="

--===============6075633735849361928==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: drm/i915: set min brightness for aux backlight interface.
URL   : https://patchwork.freedesktop.org/series/89233/
State : success

== Summary ==

CI Bug Log - changes from CI_DRM_9981 -> Patchwork_19951
====================================================

Summary
-------

  **SUCCESS**

  No regressions found.

  External URL: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_19951/index.html

Known issues
------------

  Here are the changes found in Patchwork_19951 that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@runner@aborted:
    - fi-cfl-8700k:       NOTRUN -> [FAIL][1] ([i915#2426])
   [1]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_19951/fi-cfl-8700k/igt@runner@aborted.html

  
#### Possible fixes ####

  * igt@gem_exec_suspend@basic-s0:
    - fi-tgl-u2:          [FAIL][2] ([i915#1888]) -> [PASS][3]
   [2]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9981/fi-tgl-u2/igt@gem_exec_suspend@basic-s0.html
   [3]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_19951/fi-tgl-u2/igt@gem_exec_suspend@basic-s0.html

  * igt@i915_selftest@live@gt_pm:
    - fi-cml-s:           [DMESG-FAIL][4] ([i915#2291]) -> [PASS][5]
   [4]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9981/fi-cml-s/igt@i915_selftest@live@gt_pm.html
   [5]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_19951/fi-cml-s/igt@i915_selftest@live@gt_pm.html

  * igt@i915_selftest@live@hangcheck:
    - {fi-hsw-gt1}:       [DMESG-WARN][6] ([i915#3303]) -> [PASS][7]
   [6]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9981/fi-hsw-gt1/igt@i915_selftest@live@hangcheck.html
   [7]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_19951/fi-hsw-gt1/igt@i915_selftest@live@hangcheck.html

  
  {name}: This element is suppressed. This means it is ignored when computing
          the status of the difference (SUCCESS, WARNING, or FAILURE).

  [i915#1888]: https://gitlab.freedesktop.org/drm/intel/issues/1888
  [i915#2291]: https://gitlab.freedesktop.org/drm/intel/issues/2291
  [i915#2426]: https://gitlab.freedesktop.org/drm/intel/issues/2426
  [i915#3303]: https://gitlab.freedesktop.org/drm/intel/issues/3303


Participating hosts (43 -> 41)
------------------------------

  Missing    (2): fi-bsw-cyan fi-bdw-samus 


Build changes
-------------

  * Linux: CI_DRM_9981 -> Patchwork_19951

  CI-20190529: 20190529
  CI_DRM_9981: 319c9b19adaf32bd92cbaa36e23272be36925f02 @ git://anongit.freedesktop.org/gfx-ci/linux
  IGT_6069: 71ee6cdc849c381186f681527e19fb217d32510d @ git://anongit.freedesktop.org/xorg/app/intel-gpu-tools
  Patchwork_19951: 5f89686183663c66111e711c1def95a834864bbc @ git://anongit.freedesktop.org/gfx-ci/linux


== Linux commits ==

5f8968618366 drm/i915: set min brightness for aux backlight interface.

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_19951/index.html

--===============6075633735849361928==
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
<tr><td><b>Series:</b></td><td>drm/i915: set min brightness for aux backlight interface.</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/89233/">https://patchwork.freedesktop.org/series/89233/</a></td></tr>
<tr><td><b>State:</b></td><td>success</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_19951/index.html">https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_19951/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from CI_DRM_9981 -&gt; Patchwork_19951</h1>
<h2>Summary</h2>
<p><strong>SUCCESS</strong></p>
<p>No regressions found.</p>
<p>External URL: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_19951/index.html</p>
<h2>Known issues</h2>
<p>Here are the changes found in Patchwork_19951 that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>igt@runner@aborted:<ul>
<li>fi-cfl-8700k:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_19951/fi-cfl-8700k/igt@runner@aborted.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/2426">i915#2426</a>)</li>
</ul>
</li>
</ul>
<h4>Possible fixes</h4>
<ul>
<li>
<p>igt@gem_exec_suspend@basic-s0:</p>
<ul>
<li>fi-tgl-u2:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9981/fi-tgl-u2/igt@gem_exec_suspend@basic-s0.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1888">i915#1888</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_19951/fi-tgl-u2/igt@gem_exec_suspend@basic-s0.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@i915_selftest@live@gt_pm:</p>
<ul>
<li>fi-cml-s:           <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9981/fi-cml-s/igt@i915_selftest@live@gt_pm.html">DMESG-FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/2291">i915#2291</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_19951/fi-cml-s/igt@i915_selftest@live@gt_pm.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@i915_selftest@live@hangcheck:</p>
<ul>
<li>{fi-hsw-gt1}:       <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9981/fi-hsw-gt1/igt@i915_selftest@live@hangcheck.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/3303">i915#3303</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_19951/fi-hsw-gt1/igt@i915_selftest@live@hangcheck.html">PASS</a></li>
</ul>
</li>
</ul>
<p>{name}: This element is suppressed. This means it is ignored when computing<br />
          the status of the difference (SUCCESS, WARNING, or FAILURE).</p>
<h2>Participating hosts (43 -&gt; 41)</h2>
<p>Missing    (2): fi-bsw-cyan fi-bdw-samus </p>
<h2>Build changes</h2>
<ul>
<li>Linux: CI_DRM_9981 -&gt; Patchwork_19951</li>
</ul>
<p>CI-20190529: 20190529<br />
  CI_DRM_9981: 319c9b19adaf32bd92cbaa36e23272be36925f02 @ git://anongit.freedesktop.org/gfx-ci/linux<br />
  IGT_6069: 71ee6cdc849c381186f681527e19fb217d32510d @ git://anongit.freedesktop.org/xorg/app/intel-gpu-tools<br />
  Patchwork_19951: 5f89686183663c66111e711c1def95a834864bbc @ git://anongit.freedesktop.org/gfx-ci/linux</p>
<p>== Linux commits ==</p>
<p>5f8968618366 drm/i915: set min brightness for aux backlight interface.</p>

</body>
</html>

--===============6075633735849361928==--

--===============0232682536==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Intel-gfx mailing list
Intel-gfx@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/intel-gfx

--===============0232682536==--
