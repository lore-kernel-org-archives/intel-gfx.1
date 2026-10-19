Return-Path: <intel-gfx-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 21215CCF2D6
	for <intel-gfx@archiver.kernel.org>; Mon, 19 Oct 2026 13:39:29 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B1ACE10E902;
	Mon, 19 Oct 2026 13:39:28 +0000 (UTC)
Received: from 221881a7231d (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id ADF8410E902;
 Mon, 19 Oct 2026 13:39:26 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============9111572227232612003=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=93_i915=2ECI=2EBAT=3A_success_for_drm/i915/dp=3A_Fail_the_D?=
 =?utf-8?q?SC_slice_config_if_the_minimum_slice_count_is_0?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Xiao Lu" <xiaolu.xie@intel.com>
Cc: intel-gfx@lists.freedesktop.org
Date: Mon, 19 Oct 2026 13:39:26 -0000
Message-ID: <179241716670.40589.14761162688973680530@221881a7231d>
X-Patchwork-Hint: ignore
References: <20261019113151.2258239-1-xiaolu.xie@intel.com>
In-Reply-To: <20261019113151.2258239-1-xiaolu.xie@intel.com>
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

--===============9111572227232612003==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: drm/i915/dp: Fail the DSC slice config if the minimum slice count is 0
URL   : https://patchwork.freedesktop.org/series/176378/
State : success

== Summary ==

CI Bug Log - changes from CI_DRM_19361 -> Patchwork_176378v1
====================================================

Summary
-------

  **SUCCESS**

  No regressions found.

  External URL: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_176378v1/index.html

Participating hosts (40 -> 39)
------------------------------

  Missing    (1): bat-dg2-13 


Changes
-------

  No changes found


Build changes
-------------

  * Linux: CI_DRM_19361 -> Patchwork_176378v1

  CI-20190529: 20190529
  CI_DRM_19361: b0311e0de50840c3f35aafa2e95c14bf38f4a767 @ git://anongit.freedesktop.org/gfx-ci/linux
  IGT_9150: 18811c476bfde62ffbb4c0af55cd6f57e36e0dca @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
  Patchwork_176378v1: b0311e0de50840c3f35aafa2e95c14bf38f4a767 @ git://anongit.freedesktop.org/gfx-ci/linux

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_176378v1/index.html

--===============9111572227232612003==
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
<tr><td><b>Series:</b></td><td>drm/i915/dp: Fail the DSC slice config if the minimum slice count is 0</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/176378/">https://patchwork.freedesktop.org/series/176378/</a></td></tr>
<tr><td><b>State:</b></td><td>success</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_176378v1/index.html">https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_176378v1/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from CI_DRM_19361 -&gt; Patchwork_176378v1</h1>
<h2>Summary</h2>
<p><strong>SUCCESS</strong></p>
<p>No regressions found.</p>
<p>External URL: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_176378v1/index.html</p>
<h2>Participating hosts (40 -&gt; 39)</h2>
<p>Missing    (1): bat-dg2-13 </p>
<h2>Changes</h2>
<p>No changes found</p>
<h2>Build changes</h2>
<ul>
<li>Linux: CI_DRM_19361 -&gt; Patchwork_176378v1</li>
</ul>
<p>CI-20190529: 20190529<br />
  CI_DRM_19361: b0311e0de50840c3f35aafa2e95c14bf38f4a767 @ git://anongit.freedesktop.org/gfx-ci/linux<br />
  IGT_9150: 18811c476bfde62ffbb4c0af55cd6f57e36e0dca @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git<br />
  Patchwork_176378v1: b0311e0de50840c3f35aafa2e95c14bf38f4a767 @ git://anongit.freedesktop.org/gfx-ci/linux</p>

</body>
</html>

--===============9111572227232612003==--
