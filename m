Return-Path: <intel-gfx-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 27636C61DFD
	for <intel-gfx@archiver.kernel.org>; Wed,  2 Sep 2026 09:02:53 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9135910F0BE;
	Wed,  2 Sep 2026 09:02:52 +0000 (UTC)
Received: from 61270ab9df2a (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B968810F0BE;
 Wed,  2 Sep 2026 09:02:51 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============7215138770053087946=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=93_i915=2ECI=2EBAT=3A_success_for_drm/i915/color=3A_Add_YUV?=
 =?utf-8?q?_Support_in_color_pipeline?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Chaitanya Kumar Borah" <chaitanya.kumar.borah@intel.com>
Cc: intel-gfx@lists.freedesktop.org
Date: Wed, 02 Sep 2026 09:02:51 -0000
Message-ID: <178833977175.110735.14137310095598745165@61270ab9df2a>
X-Patchwork-Hint: ignore
References: <20260902075417.656673-1-chaitanya.kumar.borah@intel.com>
In-Reply-To: <20260902075417.656673-1-chaitanya.kumar.borah@intel.com>
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

--===============7215138770053087946==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: drm/i915/color: Add YUV Support in color pipeline
URL   : https://patchwork.freedesktop.org/series/173194/
State : success

== Summary ==

CI Bug Log - changes from CI_DRM_19069 -> Patchwork_173194v1
====================================================

Summary
-------

  **SUCCESS**

  No regressions found.

  External URL: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_173194v1/index.html

Participating hosts (37 -> 36)
------------------------------

  Missing    (1): bat-dg2-13 

Known issues
------------

  Here are the changes found in Patchwork_173194v1 that come from known issues:

### IGT changes ###

#### Possible fixes ####

  * igt@kms_pm_rpm@basic-pci-d3-state:
    - fi-kbl-7567u:       [DMESG-WARN][1] ([i915#15673]) -> [PASS][2] +51 other tests pass
   [1]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19069/fi-kbl-7567u/igt@kms_pm_rpm@basic-pci-d3-state.html
   [2]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_173194v1/fi-kbl-7567u/igt@kms_pm_rpm@basic-pci-d3-state.html

  
  [i915#15673]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15673


Build changes
-------------

  * Linux: CI_DRM_19069 -> Patchwork_173194v1

  CI-20190529: 20190529
  CI_DRM_19069: c53467440a5196138d2d6610e269a43b6b47bf6b @ git://anongit.freedesktop.org/gfx-ci/linux
  IGT_9079: 9079
  Patchwork_173194v1: c53467440a5196138d2d6610e269a43b6b47bf6b @ git://anongit.freedesktop.org/gfx-ci/linux

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_173194v1/index.html

--===============7215138770053087946==
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
<tr><td><b>Series:</b></td><td>drm/i915/color: Add YUV Support in color pipeline</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/173194/">https://patchwork.freedesktop.org/series/173194/</a></td></tr>
<tr><td><b>State:</b></td><td>success</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_173194v1/index.html">https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_173194v1/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from CI_DRM_19069 -&gt; Patchwork_173194v1</h1>
<h2>Summary</h2>
<p><strong>SUCCESS</strong></p>
<p>No regressions found.</p>
<p>External URL: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_173194v1/index.html</p>
<h2>Participating hosts (37 -&gt; 36)</h2>
<p>Missing    (1): bat-dg2-13 </p>
<h2>Known issues</h2>
<p>Here are the changes found in Patchwork_173194v1 that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Possible fixes</h4>
<ul>
<li>igt@kms_pm_rpm@basic-pci-d3-state:<ul>
<li>fi-kbl-7567u:       <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19069/fi-kbl-7567u/igt@kms_pm_rpm@basic-pci-d3-state.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15673">i915#15673</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_173194v1/fi-kbl-7567u/igt@kms_pm_rpm@basic-pci-d3-state.html">PASS</a> +51 other tests pass</li>
</ul>
</li>
</ul>
<h2>Build changes</h2>
<ul>
<li>Linux: CI_DRM_19069 -&gt; Patchwork_173194v1</li>
</ul>
<p>CI-20190529: 20190529<br />
  CI_DRM_19069: c53467440a5196138d2d6610e269a43b6b47bf6b @ git://anongit.freedesktop.org/gfx-ci/linux<br />
  IGT_9079: 9079<br />
  Patchwork_173194v1: c53467440a5196138d2d6610e269a43b6b47bf6b @ git://anongit.freedesktop.org/gfx-ci/linux</p>

</body>
</html>

--===============7215138770053087946==--
