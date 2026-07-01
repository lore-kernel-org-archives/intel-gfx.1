Return-Path: <intel-gfx-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CE494C43458
	for <intel-gfx@archiver.kernel.org>; Wed,  1 Jul 2026 12:09:39 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 65C7A10E453;
	Wed,  1 Jul 2026 12:09:39 +0000 (UTC)
Received: from 6beec6c84f66 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 624DE10E16D;
 Wed,  1 Jul 2026 12:09:37 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============8450849889887680060=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=93_i915=2ECI=2EBAT=3A_success_for_Fix_LT_PHY_related_SSC_wr?=
 =?utf-8?q?ites_=28rev2=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Kandpal, Suraj" <suraj.kandpal@intel.com>
Cc: intel-gfx@lists.freedesktop.org
Date: Wed, 01 Jul 2026 12:09:37 -0000
Message-ID: <178290777739.135894.11529052206952739810@6beec6c84f66>
X-Patchwork-Hint: ignore
References: <20260701091503.1302226-1-suraj.kandpal@intel.com>
In-Reply-To: <20260701091503.1302226-1-suraj.kandpal@intel.com>
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

--===============8450849889887680060==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: Fix LT PHY related SSC writes (rev2)
URL   : https://patchwork.freedesktop.org/series/169563/
State : success

== Summary ==

CI Bug Log - changes from CI_DRM_18739 -> Patchwork_169563v2
====================================================

Summary
-------

  **SUCCESS**

  No regressions found.

  External URL: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_169563v2/index.html

Participating hosts (41 -> 40)
------------------------------

  Additional (1): fi-pnv-d510 
  Missing    (2): bat-dg2-13 fi-snb-2520m 

Known issues
------------

  Here are the changes found in Patchwork_169563v2 that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@dmabuf@all-tests:
    - fi-pnv-d510:        NOTRUN -> [SKIP][1] +35 other tests skip
   [1]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_169563v2/fi-pnv-d510/igt@dmabuf@all-tests.html

  


Build changes
-------------

  * Linux: CI_DRM_18739 -> Patchwork_169563v2

  CI-20190529: 20190529
  CI_DRM_18739: 75f36b5b412ff6aaf866d2bddb37ec5a55851f68 @ git://anongit.freedesktop.org/gfx-ci/linux
  IGT_8989: a8e2cbd2854d7980a9eccecc6e0c801d0824b88f @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
  Patchwork_169563v2: 75f36b5b412ff6aaf866d2bddb37ec5a55851f68 @ git://anongit.freedesktop.org/gfx-ci/linux

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_169563v2/index.html

--===============8450849889887680060==
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
<tr><td><b>Series:</b></td><td>Fix LT PHY related SSC writes (rev2)</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/169563/">https://patchwork.freedesktop.org/series/169563/</a></td></tr>
<tr><td><b>State:</b></td><td>success</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_169563v2/index.html">https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_169563v2/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from CI_DRM_18739 -&gt; Patchwork_169563v2</h1>
<h2>Summary</h2>
<p><strong>SUCCESS</strong></p>
<p>No regressions found.</p>
<p>External URL: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_169563v2/index.html</p>
<h2>Participating hosts (41 -&gt; 40)</h2>
<p>Additional (1): fi-pnv-d510 <br />
  Missing    (2): bat-dg2-13 fi-snb-2520m </p>
<h2>Known issues</h2>
<p>Here are the changes found in Patchwork_169563v2 that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>igt@dmabuf@all-tests:<ul>
<li>fi-pnv-d510:        NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_169563v2/fi-pnv-d510/igt@dmabuf@all-tests.html">SKIP</a> +35 other tests skip</li>
</ul>
</li>
</ul>
<h2>Build changes</h2>
<ul>
<li>Linux: CI_DRM_18739 -&gt; Patchwork_169563v2</li>
</ul>
<p>CI-20190529: 20190529<br />
  CI_DRM_18739: 75f36b5b412ff6aaf866d2bddb37ec5a55851f68 @ git://anongit.freedesktop.org/gfx-ci/linux<br />
  IGT_8989: a8e2cbd2854d7980a9eccecc6e0c801d0824b88f @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git<br />
  Patchwork_169563v2: 75f36b5b412ff6aaf866d2bddb37ec5a55851f68 @ git://anongit.freedesktop.org/gfx-ci/linux</p>

</body>
</html>

--===============8450849889887680060==--
