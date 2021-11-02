Return-Path: <SRS0=WhEZ=PV=lists.freedesktop.org=intel-gfx-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 85A1AC433F5
	for <intel-gfx@archiver.kernel.org>; Tue,  2 Nov 2021 06:29:29 +0000 (UTC)
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 4AD1660F0F
	for <intel-gfx@archiver.kernel.org>; Tue,  2 Nov 2021 06:29:29 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 4AD1660F0F
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=emeril.freedesktop.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.freedesktop.org
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7D0866E04A;
	Tue,  2 Nov 2021 06:29:28 +0000 (UTC)
Received: from emeril.freedesktop.org (emeril.freedesktop.org
 [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTP id D2A636E047;
 Tue,  2 Nov 2021 06:29:27 +0000 (UTC)
Received: from emeril.freedesktop.org (localhost [127.0.0.1])
 by emeril.freedesktop.org (Postfix) with ESMTP id C9AA6A00A0;
 Tue,  2 Nov 2021 06:29:27 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============4493139652696997340=="
MIME-Version: 1.0
From: Patchwork <patchwork@emeril.freedesktop.org>
To: =?utf-8?q?Thomas_Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>
Date: Tue, 02 Nov 2021 06:29:27 -0000
Message-ID: <163583456779.15505.15732406955813209576@emeril.freedesktop.org>
X-Patchwork-Hint: ignore
References: <20211101183851.291015-1-thomas.hellstrom@linux.intel.com>
In-Reply-To: <20211101183851.291015-1-thomas.hellstrom@linux.intel.com>
Subject: [Intel-gfx] =?utf-8?b?4pyTIEZpLkNJLkJBVDogc3VjY2VzcyBmb3IgZHJt?=
 =?utf-8?q?/i915=3A_Failsafe_migration_blits_=28rev3=29?=
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
Cc: intel-gfx@lists.freedesktop.org
Errors-To: intel-gfx-bounces@lists.freedesktop.org
Sender: "Intel-gfx" <intel-gfx-bounces@lists.freedesktop.org>

--===============4493139652696997340==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: drm/i915: Failsafe migration blits (rev3)
URL   : https://patchwork.freedesktop.org/series/95617/
State : success

== Summary ==

CI Bug Log - changes from CI_DRM_10826 -> Patchwork_21501
====================================================

Summary
-------

  **SUCCESS**

  No regressions found.

  External URL: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_21501/index.html

Participating hosts (40 -> 33)
------------------------------

  Missing    (7): fi-kbl-soraka bat-dg1-6 fi-hsw-4200u fi-icl-u2 fi-bsw-cyan bat-adlp-4 fi-elk-e7500 

Known issues
------------

  Here are the changes found in Patchwork_21501 that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@gem_exec_suspend@basic-s0:
    - fi-tgl-1115g4:      [PASS][1] -> [FAIL][2] ([i915#1888])
   [1]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10826/fi-tgl-1115g4/igt@gem_exec_suspend@basic-s0.html
   [2]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_21501/fi-tgl-1115g4/igt@gem_exec_suspend@basic-s0.html

  * igt@runner@aborted:
    - fi-bdw-5557u:       NOTRUN -> [FAIL][3] ([i915#1602] / [i915#2426] / [i915#4312])
   [3]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_21501/fi-bdw-5557u/igt@runner@aborted.html

  
#### Possible fixes ####

  * igt@gem_exec_suspend@basic-s3:
    - fi-bdw-5557u:       [INCOMPLETE][4] ([i915#146]) -> [PASS][5]
   [4]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10826/fi-bdw-5557u/igt@gem_exec_suspend@basic-s3.html
   [5]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_21501/fi-bdw-5557u/igt@gem_exec_suspend@basic-s3.html

  
  [i915#146]: https://gitlab.freedesktop.org/drm/intel/issues/146
  [i915#1602]: https://gitlab.freedesktop.org/drm/intel/issues/1602
  [i915#1888]: https://gitlab.freedesktop.org/drm/intel/issues/1888
  [i915#2426]: https://gitlab.freedesktop.org/drm/intel/issues/2426
  [i915#4312]: https://gitlab.freedesktop.org/drm/intel/issues/4312


Build changes
-------------

  * Linux: CI_DRM_10826 -> Patchwork_21501

  CI-20190529: 20190529
  CI_DRM_10826: 8b8fbc1dc64274b9eed192df4bfaeced03bdf0ae @ git://anongit.freedesktop.org/gfx-ci/linux
  IGT_6266: fa0291675a7a3ade6c219cc52fceac9a0a4a63d8 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
  Patchwork_21501: 3806353c151f44ab58fd3224470b834cb70edb5c @ git://anongit.freedesktop.org/gfx-ci/linux


== Linux commits ==

3806353c151f drm/i915/ttm: Failsafe migration blits
5fe248ea3330 drm/i915/ttm: Reorganize the ttm move code

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_21501/index.html

--===============4493139652696997340==
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
<tr><td><b>Series:</b></td><td>drm/i915: Failsafe migration blits (rev3)</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/95617/">https://patchwork.freedesktop.org/series/95617/</a></td></tr>
<tr><td><b>State:</b></td><td>success</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_21501/index.html">https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_21501/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from CI_DRM_10826 -&gt; Patchwork_21501</h1>
<h2>Summary</h2>
<p><strong>SUCCESS</strong></p>
<p>No regressions found.</p>
<p>External URL: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_21501/index.html</p>
<h2>Participating hosts (40 -&gt; 33)</h2>
<p>Missing    (7): fi-kbl-soraka bat-dg1-6 fi-hsw-4200u fi-icl-u2 fi-bsw-cyan bat-adlp-4 fi-elk-e7500 </p>
<h2>Known issues</h2>
<p>Here are the changes found in Patchwork_21501 that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>
<p>igt@gem_exec_suspend@basic-s0:</p>
<ul>
<li>fi-tgl-1115g4:      <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10826/fi-tgl-1115g4/igt@gem_exec_suspend@basic-s0.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_21501/fi-tgl-1115g4/igt@gem_exec_suspend@basic-s0.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1888">i915#1888</a>)</li>
</ul>
</li>
<li>
<p>igt@runner@aborted:</p>
<ul>
<li>fi-bdw-5557u:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_21501/fi-bdw-5557u/igt@runner@aborted.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1602">i915#1602</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/2426">i915#2426</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/4312">i915#4312</a>)</li>
</ul>
</li>
</ul>
<h4>Possible fixes</h4>
<ul>
<li>igt@gem_exec_suspend@basic-s3:<ul>
<li>fi-bdw-5557u:       <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10826/fi-bdw-5557u/igt@gem_exec_suspend@basic-s3.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/146">i915#146</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_21501/fi-bdw-5557u/igt@gem_exec_suspend@basic-s3.html">PASS</a></li>
</ul>
</li>
</ul>
<h2>Build changes</h2>
<ul>
<li>Linux: CI_DRM_10826 -&gt; Patchwork_21501</li>
</ul>
<p>CI-20190529: 20190529<br />
  CI_DRM_10826: 8b8fbc1dc64274b9eed192df4bfaeced03bdf0ae @ git://anongit.freedesktop.org/gfx-ci/linux<br />
  IGT_6266: fa0291675a7a3ade6c219cc52fceac9a0a4a63d8 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git<br />
  Patchwork_21501: 3806353c151f44ab58fd3224470b834cb70edb5c @ git://anongit.freedesktop.org/gfx-ci/linux</p>
<p>== Linux commits ==</p>
<p>3806353c151f drm/i915/ttm: Failsafe migration blits<br />
5fe248ea3330 drm/i915/ttm: Reorganize the ttm move code</p>

</body>
</html>

--===============4493139652696997340==--
