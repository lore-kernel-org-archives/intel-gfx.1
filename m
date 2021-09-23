Return-Path: <SRS0=HC+g=ON=lists.freedesktop.org=intel-gfx-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,HTML_MESSAGE,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 34F4CC433F5
	for <intel-gfx@archiver.kernel.org>; Thu, 23 Sep 2021 22:18:27 +0000 (UTC)
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id E9E8661241
	for <intel-gfx@archiver.kernel.org>; Thu, 23 Sep 2021 22:18:26 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org E9E8661241
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=emeril.freedesktop.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.freedesktop.org
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 63F466E11F;
	Thu, 23 Sep 2021 22:18:26 +0000 (UTC)
Received: from emeril.freedesktop.org (emeril.freedesktop.org
 [IPv6:2610:10:20:722:a800:ff:feee:56cf])
 by gabe.freedesktop.org (Postfix) with ESMTP id C1B306E113;
 Thu, 23 Sep 2021 22:18:24 +0000 (UTC)
Received: from emeril.freedesktop.org (localhost [127.0.0.1])
 by emeril.freedesktop.org (Postfix) with ESMTP id B8784AA0EB;
 Thu, 23 Sep 2021 22:18:24 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============7419017938995752740=="
MIME-Version: 1.0
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Ville Syrjala" <ville.syrjala@linux.intel.com>
Cc: intel-gfx@lists.freedesktop.org
Date: Thu, 23 Sep 2021 22:18:24 -0000
Message-ID: <163243550471.31049.11357926175180683321@emeril.freedesktop.org>
X-Patchwork-Hint: ignore
References: <20210923200109.4459-1-ville.syrjala@linux.intel.com>
In-Reply-To: <20210923200109.4459-1-ville.syrjala@linux.intel.com>
Subject: [Intel-gfx] =?utf-8?b?4pyTIEZpLkNJLkJBVDogc3VjY2VzcyBmb3IgZHJt?=
 =?utf-8?q?/i915=3A_Reject_bogus_modes_with_fixed_mode_panels?=
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

--===============7419017938995752740==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: drm/i915: Reject bogus modes with fixed mode panels
URL   : https://patchwork.freedesktop.org/series/95003/
State : success

== Summary ==

CI Bug Log - changes from CI_DRM_10633 -> Patchwork_21149
====================================================

Summary
-------

  **SUCCESS**

  No regressions found.

  External URL: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_21149/index.html

Known issues
------------

  Here are the changes found in Patchwork_21149 that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@i915_selftest@live@execlists:
    - fi-bsw-kefka:       [PASS][1] -> [INCOMPLETE][2] ([i915#2940])
   [1]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10633/fi-bsw-kefka/igt@i915_selftest@live@execlists.html
   [2]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_21149/fi-bsw-kefka/igt@i915_selftest@live@execlists.html

  * igt@i915_selftest@live@gtt:
    - fi-bdw-5557u:       [PASS][3] -> [DMESG-FAIL][4] ([i915#3674])
   [3]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10633/fi-bdw-5557u/igt@i915_selftest@live@gtt.html
   [4]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_21149/fi-bdw-5557u/igt@i915_selftest@live@gtt.html

  * igt@runner@aborted:
    - fi-bsw-kefka:       NOTRUN -> [FAIL][5] ([fdo#109271] / [i915#1436] / [i915#2722] / [i915#3428])
   [5]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_21149/fi-bsw-kefka/igt@runner@aborted.html

  
  [fdo#109271]: https://bugs.freedesktop.org/show_bug.cgi?id=109271
  [i915#1436]: https://gitlab.freedesktop.org/drm/intel/issues/1436
  [i915#2722]: https://gitlab.freedesktop.org/drm/intel/issues/2722
  [i915#2940]: https://gitlab.freedesktop.org/drm/intel/issues/2940
  [i915#3428]: https://gitlab.freedesktop.org/drm/intel/issues/3428
  [i915#3674]: https://gitlab.freedesktop.org/drm/intel/issues/3674


Participating hosts (40 -> 34)
------------------------------

  Missing    (6): bat-dg1-6 bat-dg1-5 fi-bsw-cyan bat-adlp-4 fi-bdw-samus bat-jsl-1 


Build changes
-------------

  * Linux: CI_DRM_10633 -> Patchwork_21149

  CI-20190529: 20190529
  CI_DRM_10633: ce925565db0da9039ece646b74e452a50233a47b @ git://anongit.freedesktop.org/gfx-ci/linux
  IGT_6217: e02037bfd63fb26dd32b9e9ceb1ca131ddbf30c3 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
  Patchwork_21149: df176c398be28a38ecbab2ce5d32a8792ac17f70 @ git://anongit.freedesktop.org/gfx-ci/linux


== Linux commits ==

df176c398be2 drm/i915: Drop pointless fixed_mode checks from dsi code
149293a5d28d drm/i915: Reject user modes that don't match fixed mode's refresh rate
f2c9849d8673 drm/i915: Introduce intel_panel_compute_config()
ccd380d8a7f3 drm/i915: Reject modes that don't match fixed_mode vrefresh
34c74b540067 drm/i915: Use intel_panel_mode_valid() for DSI/LVDS/DVO
9ae9198132ee drm/i915: Extract intel_panel_mode_valid()

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_21149/index.html

--===============7419017938995752740==
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
<tr><td><b>Series:</b></td><td>drm/i915: Reject bogus modes with fixed mode panels</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/95003/">https://patchwork.freedesktop.org/series/95003/</a></td></tr>
<tr><td><b>State:</b></td><td>success</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_21149/index.html">https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_21149/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from CI_DRM_10633 -&gt; Patchwork_21149</h1>
<h2>Summary</h2>
<p><strong>SUCCESS</strong></p>
<p>No regressions found.</p>
<p>External URL: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_21149/index.html</p>
<h2>Known issues</h2>
<p>Here are the changes found in Patchwork_21149 that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>
<p>igt@i915_selftest@live@execlists:</p>
<ul>
<li>fi-bsw-kefka:       <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10633/fi-bsw-kefka/igt@i915_selftest@live@execlists.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_21149/fi-bsw-kefka/igt@i915_selftest@live@execlists.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/2940">i915#2940</a>)</li>
</ul>
</li>
<li>
<p>igt@i915_selftest@live@gtt:</p>
<ul>
<li>fi-bdw-5557u:       <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10633/fi-bdw-5557u/igt@i915_selftest@live@gtt.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_21149/fi-bdw-5557u/igt@i915_selftest@live@gtt.html">DMESG-FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/3674">i915#3674</a>)</li>
</ul>
</li>
<li>
<p>igt@runner@aborted:</p>
<ul>
<li>fi-bsw-kefka:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_21149/fi-bsw-kefka/igt@runner@aborted.html">FAIL</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/1436">i915#1436</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/2722">i915#2722</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/3428">i915#3428</a>)</li>
</ul>
</li>
</ul>
<h2>Participating hosts (40 -&gt; 34)</h2>
<p>Missing    (6): bat-dg1-6 bat-dg1-5 fi-bsw-cyan bat-adlp-4 fi-bdw-samus bat-jsl-1 </p>
<h2>Build changes</h2>
<ul>
<li>Linux: CI_DRM_10633 -&gt; Patchwork_21149</li>
</ul>
<p>CI-20190529: 20190529<br />
  CI_DRM_10633: ce925565db0da9039ece646b74e452a50233a47b @ git://anongit.freedesktop.org/gfx-ci/linux<br />
  IGT_6217: e02037bfd63fb26dd32b9e9ceb1ca131ddbf30c3 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git<br />
  Patchwork_21149: df176c398be28a38ecbab2ce5d32a8792ac17f70 @ git://anongit.freedesktop.org/gfx-ci/linux</p>
<p>== Linux commits ==</p>
<p>df176c398be2 drm/i915: Drop pointless fixed_mode checks from dsi code<br />
149293a5d28d drm/i915: Reject user modes that don't match fixed mode's refresh rate<br />
f2c9849d8673 drm/i915: Introduce intel_panel_compute_config()<br />
ccd380d8a7f3 drm/i915: Reject modes that don't match fixed_mode vrefresh<br />
34c74b540067 drm/i915: Use intel_panel_mode_valid() for DSI/LVDS/DVO<br />
9ae9198132ee drm/i915: Extract intel_panel_mode_valid()</p>

</body>
</html>

--===============7419017938995752740==--
