Return-Path: <intel-gfx-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BC316C624D7
	for <intel-gfx@archiver.kernel.org>; Thu,  3 Sep 2026 10:26:46 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4A14810F4DB;
	Thu,  3 Sep 2026 10:26:46 +0000 (UTC)
Received: from 61270ab9df2a (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 830D710F4DA;
 Thu,  3 Sep 2026 10:26:45 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============7774992018945440735=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=93_i915=2ECI=2EBAT=3A_success_for_pm=5Fpme_support_on_displ?=
 =?utf-8?q?ay_hotplug_=28rev3=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Vinod Govindapillai" <vinod.govindapillai@intel.com>
Cc: intel-gfx@lists.freedesktop.org
Date: Thu, 03 Sep 2026 10:26:45 -0000
Message-ID: <178843120552.116940.10001854429989049850@61270ab9df2a>
X-Patchwork-Hint: ignore
References: <20260903080410.489411-1-vinod.govindapillai@intel.com>
In-Reply-To: <20260903080410.489411-1-vinod.govindapillai@intel.com>
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

--===============7774992018945440735==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: pm_pme support on display hotplug (rev3)
URL   : https://patchwork.freedesktop.org/series/172306/
State : success

== Summary ==

CI Bug Log - changes from CI_DRM_19081 -> Patchwork_172306v3
====================================================

Summary
-------

  **SUCCESS**

  No regressions found.

  External URL: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_172306v3/index.html

Participating hosts (38 -> 37)
------------------------------

  Missing    (1): bat-dg2-13 

Known issues
------------

  Here are the changes found in Patchwork_172306v3 that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@i915_selftest@live@requests:
    - bat-apl-1:          [PASS][1] -> [DMESG-WARN][2] ([i915#13735]) +39 other tests dmesg-warn
   [1]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19081/bat-apl-1/igt@i915_selftest@live@requests.html
   [2]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_172306v3/bat-apl-1/igt@i915_selftest@live@requests.html

  * igt@kms_flip@basic-flip-vs-modeset@b-dp1:
    - bat-apl-1:          [PASS][3] -> [DMESG-FAIL][4] ([i915#180]) +2 other tests dmesg-fail
   [3]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19081/bat-apl-1/igt@kms_flip@basic-flip-vs-modeset@b-dp1.html
   [4]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_172306v3/bat-apl-1/igt@kms_flip@basic-flip-vs-modeset@b-dp1.html

  * igt@kms_flip@basic-flip-vs-wf_vblank@b-dp1:
    - bat-apl-1:          [PASS][5] -> [DMESG-WARN][6] ([i915#13735] / [i915#180]) +32 other tests dmesg-warn
   [5]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19081/bat-apl-1/igt@kms_flip@basic-flip-vs-wf_vblank@b-dp1.html
   [6]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_172306v3/bat-apl-1/igt@kms_flip@basic-flip-vs-wf_vblank@b-dp1.html

  
  [i915#13735]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13735
  [i915#180]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/180


Build changes
-------------

  * Linux: CI_DRM_19081 -> Patchwork_172306v3

  CI-20190529: 20190529
  CI_DRM_19081: 9fde1e4fc48d175c52ecacfd163d4c47b22b1c23 @ git://anongit.freedesktop.org/gfx-ci/linux
  IGT_9081: 9081
  Patchwork_172306v3: 9fde1e4fc48d175c52ecacfd163d4c47b22b1c23 @ git://anongit.freedesktop.org/gfx-ci/linux

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_172306v3/index.html

--===============7774992018945440735==
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
<tr><td><b>Series:</b></td><td>pm_pme support on display hotplug (rev3)</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/172306/">https://patchwork.freedesktop.org/series/172306/</a></td></tr>
<tr><td><b>State:</b></td><td>success</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_172306v3/index.html">https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_172306v3/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from CI_DRM_19081 -&gt; Patchwork_172306v3</h1>
<h2>Summary</h2>
<p><strong>SUCCESS</strong></p>
<p>No regressions found.</p>
<p>External URL: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_172306v3/index.html</p>
<h2>Participating hosts (38 -&gt; 37)</h2>
<p>Missing    (1): bat-dg2-13 </p>
<h2>Known issues</h2>
<p>Here are the changes found in Patchwork_172306v3 that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>
<p>igt@i915_selftest@live@requests:</p>
<ul>
<li>bat-apl-1:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19081/bat-apl-1/igt@i915_selftest@live@requests.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_172306v3/bat-apl-1/igt@i915_selftest@live@requests.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13735">i915#13735</a>) +39 other tests dmesg-warn</li>
</ul>
</li>
<li>
<p>igt@kms_flip@basic-flip-vs-modeset@b-dp1:</p>
<ul>
<li>bat-apl-1:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19081/bat-apl-1/igt@kms_flip@basic-flip-vs-modeset@b-dp1.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_172306v3/bat-apl-1/igt@kms_flip@basic-flip-vs-modeset@b-dp1.html">DMESG-FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/180">i915#180</a>) +2 other tests dmesg-fail</li>
</ul>
</li>
<li>
<p>igt@kms_flip@basic-flip-vs-wf_vblank@b-dp1:</p>
<ul>
<li>bat-apl-1:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19081/bat-apl-1/igt@kms_flip@basic-flip-vs-wf_vblank@b-dp1.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_172306v3/bat-apl-1/igt@kms_flip@basic-flip-vs-wf_vblank@b-dp1.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13735">i915#13735</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/180">i915#180</a>) +32 other tests dmesg-warn</li>
</ul>
</li>
</ul>
<h2>Build changes</h2>
<ul>
<li>Linux: CI_DRM_19081 -&gt; Patchwork_172306v3</li>
</ul>
<p>CI-20190529: 20190529<br />
  CI_DRM_19081: 9fde1e4fc48d175c52ecacfd163d4c47b22b1c23 @ git://anongit.freedesktop.org/gfx-ci/linux<br />
  IGT_9081: 9081<br />
  Patchwork_172306v3: 9fde1e4fc48d175c52ecacfd163d4c47b22b1c23 @ git://anongit.freedesktop.org/gfx-ci/linux</p>

</body>
</html>

--===============7774992018945440735==--
