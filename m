Return-Path: <SRS0=1kDK=G6=lists.freedesktop.org=intel-gfx-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.7 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,HTML_MESSAGE,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A1F94C433DB
	for <intel-gfx@archiver.kernel.org>; Wed, 27 Jan 2021 04:55:51 +0000 (UTC)
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 409FF205CA
	for <intel-gfx@archiver.kernel.org>; Wed, 27 Jan 2021 04:55:51 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 409FF205CA
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=emeril.freedesktop.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=intel-gfx-bounces@lists.freedesktop.org
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B9F896E514;
	Wed, 27 Jan 2021 04:55:50 +0000 (UTC)
Received: from emeril.freedesktop.org (emeril.freedesktop.org
 [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTP id 8FD7B6E513;
 Wed, 27 Jan 2021 04:55:49 +0000 (UTC)
Received: from emeril.freedesktop.org (localhost [127.0.0.1])
 by emeril.freedesktop.org (Postfix) with ESMTP id 8D3DBA73C7;
 Wed, 27 Jan 2021 04:55:49 +0000 (UTC)
MIME-Version: 1.0
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Aditya Swarup" <aditya.swarup@intel.com>
Date: Wed, 27 Jan 2021 04:55:49 -0000
Message-ID: <161172334957.11908.13658656014566013599@emeril.freedesktop.org>
X-Patchwork-Hint: ignore
References: <20210127041159.136409-1-aditya.swarup@intel.com>
In-Reply-To: <20210127041159.136409-1-aditya.swarup@intel.com>
Subject: [Intel-gfx] =?utf-8?b?4pyTIEZpLkNJLkJBVDogc3VjY2VzcyBmb3IgRmlu?=
 =?utf-8?q?al_set_of_patches_for_ADLS_enabling?=
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
Content-Type: multipart/mixed; boundary="===============0499946931=="
Errors-To: intel-gfx-bounces@lists.freedesktop.org
Sender: "Intel-gfx" <intel-gfx-bounces@lists.freedesktop.org>

--===============0499946931==
Content-Type: multipart/alternative;
 boundary="===============9213533105215267157=="

--===============9213533105215267157==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: Final set of patches for ADLS enabling
URL   : https://patchwork.freedesktop.org/series/86322/
State : success

== Summary ==

CI Bug Log - changes from CI_DRM_9686 -> Patchwork_19512
====================================================

Summary
-------

  **SUCCESS**

  No regressions found.

  External URL: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_19512/index.html

Known issues
------------

  Here are the changes found in Patchwork_19512 that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@gem_sync@basic-each:
    - fi-tgl-y:           [PASS][1] -> [DMESG-WARN][2] ([i915#402])
   [1]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9686/fi-tgl-y/igt@gem_sync@basic-each.html
   [2]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_19512/fi-tgl-y/igt@gem_sync@basic-each.html

  * igt@i915_pm_rpm@module-reload:
    - fi-byt-j1900:       [PASS][3] -> [INCOMPLETE][4] ([i915#142] / [i915#2405])
   [3]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9686/fi-byt-j1900/igt@i915_pm_rpm@module-reload.html
   [4]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_19512/fi-byt-j1900/igt@i915_pm_rpm@module-reload.html

  * igt@runner@aborted:
    - fi-byt-j1900:       NOTRUN -> [FAIL][5] ([i915#1814] / [i915#2505])
   [5]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_19512/fi-byt-j1900/igt@runner@aborted.html

  
#### Possible fixes ####

  * igt@gem_exec_create@basic:
    - fi-tgl-y:           [DMESG-WARN][6] ([i915#402]) -> [PASS][7] +1 similar issue
   [6]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9686/fi-tgl-y/igt@gem_exec_create@basic.html
   [7]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_19512/fi-tgl-y/igt@gem_exec_create@basic.html

  
  [i915#142]: https://gitlab.freedesktop.org/drm/intel/issues/142
  [i915#1814]: https://gitlab.freedesktop.org/drm/intel/issues/1814
  [i915#2405]: https://gitlab.freedesktop.org/drm/intel/issues/2405
  [i915#2505]: https://gitlab.freedesktop.org/drm/intel/issues/2505
  [i915#402]: https://gitlab.freedesktop.org/drm/intel/issues/402


Participating hosts (44 -> 39)
------------------------------

  Missing    (5): fi-jsl-1 fi-ilk-m540 fi-hsw-4200u fi-bsw-cyan bat-jsl-2 


Build changes
-------------

  * Linux: CI_DRM_9686 -> Patchwork_19512

  CI-20190529: 20190529
  CI_DRM_9686: 8de0436dc0e777bbd5490d56134a838da4c19121 @ git://anongit.freedesktop.org/gfx-ci/linux
  IGT_5973: 7ae3d0d68e6bf4c5e404c87b570773d1b3173d47 @ git://anongit.freedesktop.org/xorg/app/intel-gpu-tools
  Patchwork_19512: 11dca653436d8211406641e04a27f8a828d10391 @ git://anongit.freedesktop.org/gfx-ci/linux


== Linux commits ==

11dca653436d drm/i915/adl_s: Add GT and CTX WAs for ADL-S
b8b8e62c273d drm/i915/adl_s: Add display WAs for ADL-S
1e05edf12b40 drm/i915/adl_s: Update memory bandwidth parameters
e2673158258c drm/i915/adl_s: Load DMC
2490f8422994 drm/i915/display: Add HAS_D12_PLANE_MINIMIZATION
9d236ff1ca29 drm/i915/adl_s: Re-use TGL GuC/HuC firmware
32ae4d0747f2 drm/i915/adl_s: Add power wells
fe66bf899d58 drm/i915/adl_s: MCHBAR memory info registers are moved
244ac6e1eab7 drm/i915/adl_s: Update PHY_MISC programming

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_19512/index.html

--===============9213533105215267157==
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
<tr><td><b>Series:</b></td><td>Final set of patches for ADLS enabling</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/86322/">https://patchwork.freedesktop.org/series/86322/</a></td></tr>
<tr><td><b>State:</b></td><td>success</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_19512/index.html">https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_19512/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from CI_DRM_9686 -&gt; Patchwork_19512</h1>
<h2>Summary</h2>
<p><strong>SUCCESS</strong></p>
<p>No regressions found.</p>
<p>External URL: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_19512/index.html</p>
<h2>Known issues</h2>
<p>Here are the changes found in Patchwork_19512 that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>
<p>igt@gem_sync@basic-each:</p>
<ul>
<li>fi-tgl-y:           <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9686/fi-tgl-y/igt@gem_sync@basic-each.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_19512/fi-tgl-y/igt@gem_sync@basic-each.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/402">i915#402</a>)</li>
</ul>
</li>
<li>
<p>igt@i915_pm_rpm@module-reload:</p>
<ul>
<li>fi-byt-j1900:       <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9686/fi-byt-j1900/igt@i915_pm_rpm@module-reload.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_19512/fi-byt-j1900/igt@i915_pm_rpm@module-reload.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/142">i915#142</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/2405">i915#2405</a>)</li>
</ul>
</li>
<li>
<p>igt@runner@aborted:</p>
<ul>
<li>fi-byt-j1900:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_19512/fi-byt-j1900/igt@runner@aborted.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1814">i915#1814</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/2505">i915#2505</a>)</li>
</ul>
</li>
</ul>
<h4>Possible fixes</h4>
<ul>
<li>igt@gem_exec_create@basic:<ul>
<li>fi-tgl-y:           <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9686/fi-tgl-y/igt@gem_exec_create@basic.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/402">i915#402</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_19512/fi-tgl-y/igt@gem_exec_create@basic.html">PASS</a> +1 similar issue</li>
</ul>
</li>
</ul>
<h2>Participating hosts (44 -&gt; 39)</h2>
<p>Missing    (5): fi-jsl-1 fi-ilk-m540 fi-hsw-4200u fi-bsw-cyan bat-jsl-2 </p>
<h2>Build changes</h2>
<ul>
<li>Linux: CI_DRM_9686 -&gt; Patchwork_19512</li>
</ul>
<p>CI-20190529: 20190529<br />
  CI_DRM_9686: 8de0436dc0e777bbd5490d56134a838da4c19121 @ git://anongit.freedesktop.org/gfx-ci/linux<br />
  IGT_5973: 7ae3d0d68e6bf4c5e404c87b570773d1b3173d47 @ git://anongit.freedesktop.org/xorg/app/intel-gpu-tools<br />
  Patchwork_19512: 11dca653436d8211406641e04a27f8a828d10391 @ git://anongit.freedesktop.org/gfx-ci/linux</p>
<p>== Linux commits ==</p>
<p>11dca653436d drm/i915/adl_s: Add GT and CTX WAs for ADL-S<br />
b8b8e62c273d drm/i915/adl_s: Add display WAs for ADL-S<br />
1e05edf12b40 drm/i915/adl_s: Update memory bandwidth parameters<br />
e2673158258c drm/i915/adl_s: Load DMC<br />
2490f8422994 drm/i915/display: Add HAS_D12_PLANE_MINIMIZATION<br />
9d236ff1ca29 drm/i915/adl_s: Re-use TGL GuC/HuC firmware<br />
32ae4d0747f2 drm/i915/adl_s: Add power wells<br />
fe66bf899d58 drm/i915/adl_s: MCHBAR memory info registers are moved<br />
244ac6e1eab7 drm/i915/adl_s: Update PHY_MISC programming</p>

</body>
</html>

--===============9213533105215267157==--

--===============0499946931==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Intel-gfx mailing list
Intel-gfx@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/intel-gfx

--===============0499946931==--
