Return-Path: <intel-gfx-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DE9B1C9832A
	for <intel-gfx@archiver.kernel.org>; Tue, 29 Sep 2026 14:09:25 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5426510E492;
	Tue, 29 Sep 2026 14:09:25 +0000 (UTC)
Received: from 61270ab9df2a (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BC28C10E492;
 Tue, 29 Sep 2026 14:09:24 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============0205627179163653080=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=93_i915=2ECI=2EBAT=3A_success_for_drm/=7Bi915=2C_xe=7D=3A_m?=
 =?utf-8?q?ake_intel=5Fdmc=5Fsuspend=28=29_part_of_display_suspend/shutdown_?=
 =?utf-8?q?calls_=28rev2=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Jani Nikula" <jani.nikula@intel.com>
Cc: intel-gfx@lists.freedesktop.org
Date: Tue, 29 Sep 2026 14:09:24 -0000
Message-ID: <179069096476.218652.10817523956464580034@61270ab9df2a>
X-Patchwork-Hint: ignore
References: <20260929103358.642813-1-jani.nikula@intel.com>
In-Reply-To: <20260929103358.642813-1-jani.nikula@intel.com>
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

--===============0205627179163653080==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: drm/{i915, xe}: make intel_dmc_suspend() part of display suspend/shutdown calls (rev2)
URL   : https://patchwork.freedesktop.org/series/175205/
State : success

== Summary ==

CI Bug Log - changes from CI_DRM_19233 -> Patchwork_175205v2
====================================================

Summary
-------

  **SUCCESS**

  No regressions found.

  External URL: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_175205v2/index.html

Participating hosts (39 -> 37)
------------------------------

  Missing    (2): bat-dg2-13 bat-jsl-5 

Known issues
------------

  Here are the changes found in Patchwork_175205v2 that come from known issues:

### IGT changes ###

#### Possible fixes ####

  * igt@i915_selftest@live:
    - bat-apl-1:          [DMESG-FAIL][1] ([i915#14808]) -> [PASS][2] +1 other test pass
   [1]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19233/bat-apl-1/igt@i915_selftest@live.html
   [2]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_175205v2/bat-apl-1/igt@i915_selftest@live.html

  
  [i915#14808]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14808


Build changes
-------------

  * Linux: CI_DRM_19233 -> Patchwork_175205v2

  CI-20190529: 20190529
  CI_DRM_19233: ecc5a84be849c400af610cdc613a0274e3b101b2 @ git://anongit.freedesktop.org/gfx-ci/linux
  IGT_9114: 916c79cfb7675ca01607dcd821f8c49d4f633a6f @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
  Patchwork_175205v2: ecc5a84be849c400af610cdc613a0274e3b101b2 @ git://anongit.freedesktop.org/gfx-ci/linux

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_175205v2/index.html

--===============0205627179163653080==
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
<tr><td><b>Series:</b></td><td>drm/{i915, xe}: make intel_dmc_suspend() part of display suspend/shutdown calls (rev2)</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/175205/">https://patchwork.freedesktop.org/series/175205/</a></td></tr>
<tr><td><b>State:</b></td><td>success</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_175205v2/index.html">https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_175205v2/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from CI_DRM_19233 -&gt; Patchwork_175205v2</h1>
<h2>Summary</h2>
<p><strong>SUCCESS</strong></p>
<p>No regressions found.</p>
<p>External URL: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_175205v2/index.html</p>
<h2>Participating hosts (39 -&gt; 37)</h2>
<p>Missing    (2): bat-dg2-13 bat-jsl-5 </p>
<h2>Known issues</h2>
<p>Here are the changes found in Patchwork_175205v2 that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Possible fixes</h4>
<ul>
<li>igt@i915_selftest@live:<ul>
<li>bat-apl-1:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19233/bat-apl-1/igt@i915_selftest@live.html">DMESG-FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14808">i915#14808</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_175205v2/bat-apl-1/igt@i915_selftest@live.html">PASS</a> +1 other test pass</li>
</ul>
</li>
</ul>
<h2>Build changes</h2>
<ul>
<li>Linux: CI_DRM_19233 -&gt; Patchwork_175205v2</li>
</ul>
<p>CI-20190529: 20190529<br />
  CI_DRM_19233: ecc5a84be849c400af610cdc613a0274e3b101b2 @ git://anongit.freedesktop.org/gfx-ci/linux<br />
  IGT_9114: 916c79cfb7675ca01607dcd821f8c49d4f633a6f @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git<br />
  Patchwork_175205v2: ecc5a84be849c400af610cdc613a0274e3b101b2 @ git://anongit.freedesktop.org/gfx-ci/linux</p>

</body>
</html>

--===============0205627179163653080==--
