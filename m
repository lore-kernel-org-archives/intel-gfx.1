Return-Path: <SRS0=xVQy=L2=lists.freedesktop.org=intel-gfx-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,HTML_MESSAGE,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D7CC3C11F68
	for <intel-gfx@archiver.kernel.org>; Fri,  2 Jul 2021 10:41:17 +0000 (UTC)
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 9AE3C6141C
	for <intel-gfx@archiver.kernel.org>; Fri,  2 Jul 2021 10:41:17 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 9AE3C6141C
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=emeril.freedesktop.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=intel-gfx-bounces@lists.freedesktop.org
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1BB376E0EA;
	Fri,  2 Jul 2021 10:41:17 +0000 (UTC)
Received: from emeril.freedesktop.org (emeril.freedesktop.org
 [IPv6:2610:10:20:722:a800:ff:feee:56cf])
 by gabe.freedesktop.org (Postfix) with ESMTP id EE4516E0D9;
 Fri,  2 Jul 2021 10:41:15 +0000 (UTC)
Received: from emeril.freedesktop.org (localhost [127.0.0.1])
 by emeril.freedesktop.org (Postfix) with ESMTP id E6037A41FB;
 Fri,  2 Jul 2021 10:41:15 +0000 (UTC)
MIME-Version: 1.0
From: Patchwork <patchwork@emeril.freedesktop.org>
To: venkata.sai.patnana@intel.com
Date: Fri, 02 Jul 2021 10:41:15 -0000
Message-ID: <162522247591.22028.6683660951177455793@emeril.freedesktop.org>
X-Patchwork-Hint: ignore
References: <20210702091043.14368-1-venkata.sai.patnana@intel.com>
In-Reply-To: <20210702091043.14368-1-venkata.sai.patnana@intel.com>
Subject: [Intel-gfx] =?utf-8?b?4pyTIEZpLkNJLkJBVDogc3VjY2VzcyBmb3IgZHJt?=
 =?utf-8?q?/i915/display/dsc=3A_Set_BPP_in_the_kernel_=28rev5=29?=
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
Content-Type: multipart/mixed; boundary="===============1442095817=="
Errors-To: intel-gfx-bounces@lists.freedesktop.org
Sender: "Intel-gfx" <intel-gfx-bounces@lists.freedesktop.org>

--===============1442095817==
Content-Type: multipart/alternative;
 boundary="===============4529875884225391912=="

--===============4529875884225391912==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: drm/i915/display/dsc: Set BPP in the kernel (rev5)
URL   : https://patchwork.freedesktop.org/series/91917/
State : success

== Summary ==

CI Bug Log - changes from CI_DRM_10302 -> Patchwork_20519
====================================================

Summary
-------

  **SUCCESS**

  No regressions found.

  External URL: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_20519/index.html

Known issues
------------

  Here are the changes found in Patchwork_20519 that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@core_hotunplug@unbind-rebind:
    - fi-bwr-2160:        [PASS][1] -> [FAIL][2] ([i915#3194])
   [1]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10302/fi-bwr-2160/igt@core_hotunplug@unbind-rebind.html
   [2]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_20519/fi-bwr-2160/igt@core_hotunplug@unbind-rebind.html

  * igt@i915_selftest@live@hangcheck:
    - fi-icl-y:           [PASS][3] -> [INCOMPLETE][4] ([i915#2782])
   [3]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10302/fi-icl-y/igt@i915_selftest@live@hangcheck.html
   [4]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_20519/fi-icl-y/igt@i915_selftest@live@hangcheck.html
    - fi-snb-2600:        [PASS][5] -> [INCOMPLETE][6] ([i915#2782])
   [5]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10302/fi-snb-2600/igt@i915_selftest@live@hangcheck.html
   [6]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_20519/fi-snb-2600/igt@i915_selftest@live@hangcheck.html

  * igt@runner@aborted:
    - fi-icl-y:           NOTRUN -> [FAIL][7] ([i915#2782])
   [7]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_20519/fi-icl-y/igt@runner@aborted.html

  
  [i915#2782]: https://gitlab.freedesktop.org/drm/intel/issues/2782
  [i915#3194]: https://gitlab.freedesktop.org/drm/intel/issues/3194


Participating hosts (40 -> 35)
------------------------------

  Missing    (5): fi-bsw-cyan bat-adls-4 bat-adls-3 bat-jsl-1 fi-bdw-samus 


Build changes
-------------

  * IGT: IGT_6128 -> IGTPW_5971
  * Linux: CI_DRM_10302 -> Patchwork_20519

  CI-20190529: 20190529
  CI_DRM_10302: 403c15e48caac46206e92d703408fe07d83c6bf4 @ git://anongit.freedesktop.org/gfx-ci/linux
  IGTPW_5971: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5971/index.html
  IGT_6128: b24e5949af7e51f0af484d2ce4cb4c5a41ac5358 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
  Patchwork_20519: 2523c215fa2c5fa2c8a111bf9b8673ee459e89b4 @ git://anongit.freedesktop.org/gfx-ci/linux


== Linux commits ==

2523c215fa2c drm/i915/display/dsc: Set BPP in the kernel
31d490bc229f drm/i915/display/dsc: Add Per connector debugfs node for DSC BPP enable

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_20519/index.html

--===============4529875884225391912==
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
<tr><td><b>Series:</b></td><td>drm/i915/display/dsc: Set BPP in the kernel (rev5)</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/91917/">https://patchwork.freedesktop.org/series/91917/</a></td></tr>
<tr><td><b>State:</b></td><td>success</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_20519/index.html">https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_20519/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from CI_DRM_10302 -&gt; Patchwork_20519</h1>
<h2>Summary</h2>
<p><strong>SUCCESS</strong></p>
<p>No regressions found.</p>
<p>External URL: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_20519/index.html</p>
<h2>Known issues</h2>
<p>Here are the changes found in Patchwork_20519 that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>
<p>igt@core_hotunplug@unbind-rebind:</p>
<ul>
<li>fi-bwr-2160:        <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10302/fi-bwr-2160/igt@core_hotunplug@unbind-rebind.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_20519/fi-bwr-2160/igt@core_hotunplug@unbind-rebind.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/3194">i915#3194</a>)</li>
</ul>
</li>
<li>
<p>igt@i915_selftest@live@hangcheck:</p>
<ul>
<li>
<p>fi-icl-y:           <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10302/fi-icl-y/igt@i915_selftest@live@hangcheck.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_20519/fi-icl-y/igt@i915_selftest@live@hangcheck.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/2782">i915#2782</a>)</p>
</li>
<li>
<p>fi-snb-2600:        <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10302/fi-snb-2600/igt@i915_selftest@live@hangcheck.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_20519/fi-snb-2600/igt@i915_selftest@live@hangcheck.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/2782">i915#2782</a>)</p>
</li>
</ul>
</li>
<li>
<p>igt@runner@aborted:</p>
<ul>
<li>fi-icl-y:           NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_20519/fi-icl-y/igt@runner@aborted.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/2782">i915#2782</a>)</li>
</ul>
</li>
</ul>
<h2>Participating hosts (40 -&gt; 35)</h2>
<p>Missing    (5): fi-bsw-cyan bat-adls-4 bat-adls-3 bat-jsl-1 fi-bdw-samus </p>
<h2>Build changes</h2>
<ul>
<li>IGT: IGT_6128 -&gt; IGTPW_5971</li>
<li>Linux: CI_DRM_10302 -&gt; Patchwork_20519</li>
</ul>
<p>CI-20190529: 20190529<br />
  CI_DRM_10302: 403c15e48caac46206e92d703408fe07d83c6bf4 @ git://anongit.freedesktop.org/gfx-ci/linux<br />
  IGTPW_5971: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5971/index.html<br />
  IGT_6128: b24e5949af7e51f0af484d2ce4cb4c5a41ac5358 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git<br />
  Patchwork_20519: 2523c215fa2c5fa2c8a111bf9b8673ee459e89b4 @ git://anongit.freedesktop.org/gfx-ci/linux</p>
<p>== Linux commits ==</p>
<p>2523c215fa2c drm/i915/display/dsc: Set BPP in the kernel<br />
31d490bc229f drm/i915/display/dsc: Add Per connector debugfs node for DSC BPP enable</p>

</body>
</html>

--===============4529875884225391912==--

--===============1442095817==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Intel-gfx mailing list
Intel-gfx@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/intel-gfx

--===============1442095817==--
