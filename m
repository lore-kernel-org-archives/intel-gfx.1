Return-Path: <intel-gfx-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 455FBC88E5C
	for <intel-gfx@archiver.kernel.org>; Sun, 13 Sep 2026 16:12:38 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A23DF10E949;
	Sun, 13 Sep 2026 16:12:37 +0000 (UTC)
Received: from 61270ab9df2a (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EC20E10E949;
 Sun, 13 Sep 2026 16:12:36 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============7864385361083465739=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=97_i915=2ECI=2EBAT=3A_failure_for_Add_support_for_Common_SD?=
 =?utf-8?q?P_Transmission_Line_=28rev6=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Nautiyal, Ankit K" <ankit.k.nautiyal@intel.com>
Cc: intel-gfx@lists.freedesktop.org
Date: Sun, 13 Sep 2026 16:12:36 -0000
Message-ID: <178931595696.156645.6854382348716702568@61270ab9df2a>
X-Patchwork-Hint: ignore
References: <20260913145649.3240904-1-ankit.k.nautiyal@intel.com>
In-Reply-To: <20260913145649.3240904-1-ankit.k.nautiyal@intel.com>
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

--===============7864385361083465739==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: Add support for Common SDP Transmission Line (rev6)
URL   : https://patchwork.freedesktop.org/series/162622/
State : failure

== Summary ==

CI Bug Log - changes from CI_DRM_19136 -> Patchwork_162622v6
====================================================

Summary
-------

  **FAILURE**

  Serious unknown changes coming with Patchwork_162622v6 absolutely need to be
  verified manually.
  
  If you think the reported changes have nothing to do with the changes
  introduced in Patchwork_162622v6, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them
  to document this new failure mode, which will reduce false positives in CI.

  External URL: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_162622v6/index.html

Participating hosts (38 -> 36)
------------------------------

  Missing    (2): bat-dg2-13 fi-glk-j4005 

Possible new issues
-------------------

  Here are the unknown changes that may have been introduced in Patchwork_162622v6:

### IGT changes ###

#### Possible regressions ####

  * igt@i915_selftest@live@late_gt_pm:
    - bat-dg2-14:         [PASS][1] -> [ABORT][2] +1 other test abort
   [1]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19136/bat-dg2-14/igt@i915_selftest@live@late_gt_pm.html
   [2]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_162622v6/bat-dg2-14/igt@i915_selftest@live@late_gt_pm.html

  


Build changes
-------------

  * Linux: CI_DRM_19136 -> Patchwork_162622v6

  CI-20190529: 20190529
  CI_DRM_19136: d0f49187686a810b5b83216805c07814ad7542dc @ git://anongit.freedesktop.org/gfx-ci/linux
  IGT_9093: 932327f15c92ecb52266ced8c0fbe72931a75880 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
  Patchwork_162622v6: d0f49187686a810b5b83216805c07814ad7542dc @ git://anongit.freedesktop.org/gfx-ci/linux

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_162622v6/index.html

--===============7864385361083465739==
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
<tr><td><b>Series:</b></td><td>Add support for Common SDP Transmission Line (rev6)</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/162622/">https://patchwork.freedesktop.org/series/162622/</a></td></tr>
<tr><td><b>State:</b></td><td>failure</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_162622v6/index.html">https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_162622v6/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from CI_DRM_19136 -&gt; Patchwork_162622v6</h1>
<h2>Summary</h2>
<p><strong>FAILURE</strong></p>
<p>Serious unknown changes coming with Patchwork_162622v6 absolutely need to be<br />
  verified manually.</p>
<p>If you think the reported changes have nothing to do with the changes<br />
  introduced in Patchwork_162622v6, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them<br />
  to document this new failure mode, which will reduce false positives in CI.</p>
<p>External URL: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_162622v6/index.html</p>
<h2>Participating hosts (38 -&gt; 36)</h2>
<p>Missing    (2): bat-dg2-13 fi-glk-j4005 </p>
<h2>Possible new issues</h2>
<p>Here are the unknown changes that may have been introduced in Patchwork_162622v6:</p>
<h3>IGT changes</h3>
<h4>Possible regressions</h4>
<ul>
<li>igt@i915_selftest@live@late_gt_pm:<ul>
<li>bat-dg2-14:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19136/bat-dg2-14/igt@i915_selftest@live@late_gt_pm.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_162622v6/bat-dg2-14/igt@i915_selftest@live@late_gt_pm.html">ABORT</a> +1 other test abort</li>
</ul>
</li>
</ul>
<h2>Build changes</h2>
<ul>
<li>Linux: CI_DRM_19136 -&gt; Patchwork_162622v6</li>
</ul>
<p>CI-20190529: 20190529<br />
  CI_DRM_19136: d0f49187686a810b5b83216805c07814ad7542dc @ git://anongit.freedesktop.org/gfx-ci/linux<br />
  IGT_9093: 932327f15c92ecb52266ced8c0fbe72931a75880 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git<br />
  Patchwork_162622v6: d0f49187686a810b5b83216805c07814ad7542dc @ git://anongit.freedesktop.org/gfx-ci/linux</p>

</body>
</html>

--===============7864385361083465739==--
