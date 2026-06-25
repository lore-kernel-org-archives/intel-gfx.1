Return-Path: <intel-gfx-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 89D0DCDB479
	for <intel-gfx@archiver.kernel.org>; Thu, 25 Jun 2026 13:21:18 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2098B10E20E;
	Thu, 25 Jun 2026 13:21:18 +0000 (UTC)
Received: from 6beec6c84f66 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CDB4810E20E;
 Thu, 25 Jun 2026 13:21:16 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============1637214712093973949=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=93_i915=2ECI=2EBAT=3A_success_for_drm/i915/gt=3A_Return_boo?=
 =?utf-8?q?l_values_from_a_boolean_helper?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Andi Shyti" <andi.shyti@linux.intel.com>
Cc: intel-gfx@lists.freedesktop.org
Date: Thu, 25 Jun 2026 13:21:16 -0000
Message-ID: <178239367683.117406.17116932541340498388@6beec6c84f66>
X-Patchwork-Hint: ignore
References: <20260625114442.2912230-1-andi.shyti@linux.intel.com>
In-Reply-To: <20260625114442.2912230-1-andi.shyti@linux.intel.com>
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

--===============1637214712093973949==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: drm/i915/gt: Return bool values from a boolean helper
URL   : https://patchwork.freedesktop.org/series/169191/
State : success

== Summary ==

CI Bug Log - changes from CI_DRM_18719 -> Patchwork_169191v1
====================================================

Summary
-------

  **SUCCESS**

  No regressions found.

  External URL: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_169191v1/index.html

Participating hosts (42 -> 38)
------------------------------

  Missing    (4): bat-dg2-13 fi-glk-j4005 bat-atsm-1 fi-snb-2520m 

Known issues
------------

  Here are the changes found in Patchwork_169191v1 that come from known issues:

### IGT changes ###

#### Possible fixes ####

  * igt@kms_hdmi_inject@inject-audio:
    - fi-kbl-7567u:       [SKIP][1] -> [PASS][2]
   [1]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18719/fi-kbl-7567u/igt@kms_hdmi_inject@inject-audio.html
   [2]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_169191v1/fi-kbl-7567u/igt@kms_hdmi_inject@inject-audio.html

  


Build changes
-------------

  * Linux: CI_DRM_18719 -> Patchwork_169191v1

  CI-20190529: 20190529
  CI_DRM_18719: adbc617250e16fb2db4a4c777b89440927cb8973 @ git://anongit.freedesktop.org/gfx-ci/linux
  IGT_8985: d5fe8732b8547454c38fdd220b55f6f0cc841a3b @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
  Patchwork_169191v1: adbc617250e16fb2db4a4c777b89440927cb8973 @ git://anongit.freedesktop.org/gfx-ci/linux

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_169191v1/index.html

--===============1637214712093973949==
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
<tr><td><b>Series:</b></td><td>drm/i915/gt: Return bool values from a boolean helper</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/169191/">https://patchwork.freedesktop.org/series/169191/</a></td></tr>
<tr><td><b>State:</b></td><td>success</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_169191v1/index.html">https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_169191v1/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from CI_DRM_18719 -&gt; Patchwork_169191v1</h1>
<h2>Summary</h2>
<p><strong>SUCCESS</strong></p>
<p>No regressions found.</p>
<p>External URL: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_169191v1/index.html</p>
<h2>Participating hosts (42 -&gt; 38)</h2>
<p>Missing    (4): bat-dg2-13 fi-glk-j4005 bat-atsm-1 fi-snb-2520m </p>
<h2>Known issues</h2>
<p>Here are the changes found in Patchwork_169191v1 that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Possible fixes</h4>
<ul>
<li>igt@kms_hdmi_inject@inject-audio:<ul>
<li>fi-kbl-7567u:       <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18719/fi-kbl-7567u/igt@kms_hdmi_inject@inject-audio.html">SKIP</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_169191v1/fi-kbl-7567u/igt@kms_hdmi_inject@inject-audio.html">PASS</a></li>
</ul>
</li>
</ul>
<h2>Build changes</h2>
<ul>
<li>Linux: CI_DRM_18719 -&gt; Patchwork_169191v1</li>
</ul>
<p>CI-20190529: 20190529<br />
  CI_DRM_18719: adbc617250e16fb2db4a4c777b89440927cb8973 @ git://anongit.freedesktop.org/gfx-ci/linux<br />
  IGT_8985: d5fe8732b8547454c38fdd220b55f6f0cc841a3b @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git<br />
  Patchwork_169191v1: adbc617250e16fb2db4a4c777b89440927cb8973 @ git://anongit.freedesktop.org/gfx-ci/linux</p>

</body>
</html>

--===============1637214712093973949==--
