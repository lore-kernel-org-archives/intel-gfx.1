Return-Path: <intel-gfx-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CA929C982D0
	for <intel-gfx@archiver.kernel.org>; Thu, 17 Sep 2026 05:57:52 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3C78310E742;
	Thu, 17 Sep 2026 05:57:52 +0000 (UTC)
Received: from 61270ab9df2a (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7912710E447;
 Thu, 17 Sep 2026 05:57:50 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============1485262629493146290=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=93_i915=2ECI=2EBAT=3A_success_for_Implement_Wa=5F1402176879?=
 =?utf-8?q?2_to_bypass_m=5Fn_ratio_limit_=28rev9=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Nautiyal, Ankit K" <ankit.k.nautiyal@intel.com>
Cc: intel-gfx@lists.freedesktop.org
Date: Thu, 17 Sep 2026 05:57:50 -0000
Message-ID: <178962467048.175855.6218475750861812433@61270ab9df2a>
X-Patchwork-Hint: ignore
References: <20260917050649.871960-1-suraj.kandpal@intel.com>
In-Reply-To: <20260917050649.871960-1-suraj.kandpal@intel.com>
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

--===============1485262629493146290==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: Implement Wa_14021768792 to bypass m_n ratio limit (rev9)
URL   : https://patchwork.freedesktop.org/series/138257/
State : success

== Summary ==

CI Bug Log - changes from CI_DRM_19156 -> Patchwork_138257v9
====================================================

Summary
-------

  **SUCCESS**

  No regressions found.

  External URL: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_138257v9/index.html

Participating hosts (38 -> 37)
------------------------------

  Missing    (1): bat-dg2-13 

Known issues
------------

  Here are the changes found in Patchwork_138257v9 that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@runner@aborted:
    - bat-mtlp-8:         NOTRUN -> [FAIL][1] ([i915#16945])
   [1]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_138257v9/bat-mtlp-8/igt@runner@aborted.html

  
  [i915#16945]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16945


Build changes
-------------

  * Linux: CI_DRM_19156 -> Patchwork_138257v9

  CI-20190529: 20190529
  CI_DRM_19156: bb38af66c2f21340a7c081afbb7ace249357fbb5 @ git://anongit.freedesktop.org/gfx-ci/linux
  IGT_9099: 9099
  Patchwork_138257v9: bb38af66c2f21340a7c081afbb7ace249357fbb5 @ git://anongit.freedesktop.org/gfx-ci/linux

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_138257v9/index.html

--===============1485262629493146290==
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
<tr><td><b>Series:</b></td><td>Implement Wa_14021768792 to bypass m_n ratio limit (rev9)</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/138257/">https://patchwork.freedesktop.org/series/138257/</a></td></tr>
<tr><td><b>State:</b></td><td>success</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_138257v9/index.html">https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_138257v9/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from CI_DRM_19156 -&gt; Patchwork_138257v9</h1>
<h2>Summary</h2>
<p><strong>SUCCESS</strong></p>
<p>No regressions found.</p>
<p>External URL: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_138257v9/index.html</p>
<h2>Participating hosts (38 -&gt; 37)</h2>
<p>Missing    (1): bat-dg2-13 </p>
<h2>Known issues</h2>
<p>Here are the changes found in Patchwork_138257v9 that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>igt@runner@aborted:<ul>
<li>bat-mtlp-8:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_138257v9/bat-mtlp-8/igt@runner@aborted.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16945">i915#16945</a>)</li>
</ul>
</li>
</ul>
<h2>Build changes</h2>
<ul>
<li>Linux: CI_DRM_19156 -&gt; Patchwork_138257v9</li>
</ul>
<p>CI-20190529: 20190529<br />
  CI_DRM_19156: bb38af66c2f21340a7c081afbb7ace249357fbb5 @ git://anongit.freedesktop.org/gfx-ci/linux<br />
  IGT_9099: 9099<br />
  Patchwork_138257v9: bb38af66c2f21340a7c081afbb7ace249357fbb5 @ git://anongit.freedesktop.org/gfx-ci/linux</p>

</body>
</html>

--===============1485262629493146290==--
