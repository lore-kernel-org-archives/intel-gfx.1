Return-Path: <intel-gfx-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6984E106703C
	for <intel-gfx@archiver.kernel.org>; Thu, 12 Mar 2026 14:52:36 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DEDCF10E08B;
	Thu, 12 Mar 2026 14:52:35 +0000 (UTC)
Received: from a3b018990fe9 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4D9F010E08B;
 Thu, 12 Mar 2026 14:52:34 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============6239081884843647943=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=93_i915=2ECI=2EBAT=3A_success_for_drm/i915/dmc=3A_Update_PI?=
 =?utf-8?q?PEDMC_interrupt_mask/?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Dibin Moolakadan Subrahmanian" <dibin.moolakadan.subrahmanian@intel.com>
Cc: intel-gfx@lists.freedesktop.org
Date: Thu, 12 Mar 2026 14:52:34 -0000
Message-ID: <177332715429.351130.15945454995251477833@a3b018990fe9>
X-Patchwork-Hint: ignore
References: <20260312132654.2614433-1-dibin.moolakadan.subrahmanian@intel.com>
In-Reply-To: <20260312132654.2614433-1-dibin.moolakadan.subrahmanian@intel.com>
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

--===============6239081884843647943==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: drm/i915/dmc: Update PIPEDMC interrupt mask/
URL   : https://patchwork.freedesktop.org/series/163114/
State : success

== Summary ==

CI Bug Log - changes from CI_DRM_18136 -> Patchwork_163114v1
====================================================

Summary
-------

  **SUCCESS**

  No regressions found.

  External URL: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_163114v1/index.html

Participating hosts (40 -> 37)
------------------------------

  Missing    (3): bat-dg2-13 fi-snb-2520m bat-twl-2 

Known issues
------------

  Here are the changes found in Patchwork_163114v1 that come from known issues:

### IGT changes ###

#### Possible fixes ####

  * igt@kms_hdmi_inject@inject-audio:
    - fi-tgl-1115g4:      [FAIL][1] ([i915#14867]) -> [PASS][2]
   [1]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18136/fi-tgl-1115g4/igt@kms_hdmi_inject@inject-audio.html
   [2]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_163114v1/fi-tgl-1115g4/igt@kms_hdmi_inject@inject-audio.html

  
  [i915#14867]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14867


Build changes
-------------

  * Linux: CI_DRM_18136 -> Patchwork_163114v1

  CI-20190529: 20190529
  CI_DRM_18136: 72190ebdd4c0e9a2b454b04ba382beeb6020e047 @ git://anongit.freedesktop.org/gfx-ci/linux
  IGT_8798: 8798
  Patchwork_163114v1: 72190ebdd4c0e9a2b454b04ba382beeb6020e047 @ git://anongit.freedesktop.org/gfx-ci/linux

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_163114v1/index.html

--===============6239081884843647943==
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
<tr><td><b>Series:</b></td><td>drm/i915/dmc: Update PIPEDMC interrupt mask/</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/163114/">https://patchwork.freedesktop.org/series/163114/</a></td></tr>
<tr><td><b>State:</b></td><td>success</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_163114v1/index.html">https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_163114v1/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from CI_DRM_18136 -&gt; Patchwork_163114v1</h1>
<h2>Summary</h2>
<p><strong>SUCCESS</strong></p>
<p>No regressions found.</p>
<p>External URL: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_163114v1/index.html</p>
<h2>Participating hosts (40 -&gt; 37)</h2>
<p>Missing    (3): bat-dg2-13 fi-snb-2520m bat-twl-2 </p>
<h2>Known issues</h2>
<p>Here are the changes found in Patchwork_163114v1 that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Possible fixes</h4>
<ul>
<li>igt@kms_hdmi_inject@inject-audio:<ul>
<li>fi-tgl-1115g4:      <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18136/fi-tgl-1115g4/igt@kms_hdmi_inject@inject-audio.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14867">i915#14867</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_163114v1/fi-tgl-1115g4/igt@kms_hdmi_inject@inject-audio.html">PASS</a></li>
</ul>
</li>
</ul>
<h2>Build changes</h2>
<ul>
<li>Linux: CI_DRM_18136 -&gt; Patchwork_163114v1</li>
</ul>
<p>CI-20190529: 20190529<br />
  CI_DRM_18136: 72190ebdd4c0e9a2b454b04ba382beeb6020e047 @ git://anongit.freedesktop.org/gfx-ci/linux<br />
  IGT_8798: 8798<br />
  Patchwork_163114v1: 72190ebdd4c0e9a2b454b04ba382beeb6020e047 @ git://anongit.freedesktop.org/gfx-ci/linux</p>

</body>
</html>

--===============6239081884843647943==--
