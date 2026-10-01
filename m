Return-Path: <intel-gfx-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1F253CA5FB3
	for <intel-gfx@archiver.kernel.org>; Thu,  1 Oct 2026 10:07:37 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A8BA510F5EC;
	Thu,  1 Oct 2026 10:07:36 +0000 (UTC)
Received: from 61270ab9df2a (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1DABF10F5EC;
 Thu,  1 Oct 2026 10:07:36 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============4293115798867206013=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=93_i915=2ECI=2EBAT=3A_success_for_drm/i915/gt=3A_Do_not_des?=
 =?utf-8?q?troy_uninitialized_timer_=28rev2=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Krzysztof Karas" <krzysztof.karas@intel.com>
Cc: intel-gfx@lists.freedesktop.org
Date: Thu, 01 Oct 2026 10:07:36 -0000
Message-ID: <179084925611.227991.6461083637153017328@61270ab9df2a>
X-Patchwork-Hint: ignore
References: <20261001071757.2688815-1-krzysztof.karas@intel.com>
In-Reply-To: <20261001071757.2688815-1-krzysztof.karas@intel.com>
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

--===============4293115798867206013==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: drm/i915/gt: Do not destroy uninitialized timer (rev2)
URL   : https://patchwork.freedesktop.org/series/175217/
State : success

== Summary ==

CI Bug Log - changes from CI_DRM_19257 -> Patchwork_175217v2
====================================================

Summary
-------

  **SUCCESS**

  No regressions found.

  External URL: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_175217v2/index.html

Participating hosts (38 -> 37)
------------------------------

  Missing    (1): bat-dg2-13 


Changes
-------

  No changes found


Build changes
-------------

  * Linux: CI_DRM_19257 -> Patchwork_175217v2

  CI-20190529: 20190529
  CI_DRM_19257: 176fc42afd28308fff5fce3b4f99a324800242af @ git://anongit.freedesktop.org/gfx-ci/linux
  IGT_9120: c6b08ed60430a3081e5173fbdfbea22d19f22aa4 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
  Patchwork_175217v2: 176fc42afd28308fff5fce3b4f99a324800242af @ git://anongit.freedesktop.org/gfx-ci/linux

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_175217v2/index.html

--===============4293115798867206013==
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
<tr><td><b>Series:</b></td><td>drm/i915/gt: Do not destroy uninitialized timer (rev2)</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/175217/">https://patchwork.freedesktop.org/series/175217/</a></td></tr>
<tr><td><b>State:</b></td><td>success</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_175217v2/index.html">https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_175217v2/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from CI_DRM_19257 -&gt; Patchwork_175217v2</h1>
<h2>Summary</h2>
<p><strong>SUCCESS</strong></p>
<p>No regressions found.</p>
<p>External URL: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_175217v2/index.html</p>
<h2>Participating hosts (38 -&gt; 37)</h2>
<p>Missing    (1): bat-dg2-13 </p>
<h2>Changes</h2>
<p>No changes found</p>
<h2>Build changes</h2>
<ul>
<li>Linux: CI_DRM_19257 -&gt; Patchwork_175217v2</li>
</ul>
<p>CI-20190529: 20190529<br />
  CI_DRM_19257: 176fc42afd28308fff5fce3b4f99a324800242af @ git://anongit.freedesktop.org/gfx-ci/linux<br />
  IGT_9120: c6b08ed60430a3081e5173fbdfbea22d19f22aa4 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git<br />
  Patchwork_175217v2: 176fc42afd28308fff5fce3b4f99a324800242af @ git://anongit.freedesktop.org/gfx-ci/linux</p>

</body>
</html>

--===============4293115798867206013==--
