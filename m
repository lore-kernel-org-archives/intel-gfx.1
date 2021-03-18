Return-Path: <SRS0=MMuT=IQ=lists.freedesktop.org=intel-gfx-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,HTML_MESSAGE,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D5C43C433DB
	for <intel-gfx@archiver.kernel.org>; Thu, 18 Mar 2021 20:09:45 +0000 (UTC)
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 7A56864F10
	for <intel-gfx@archiver.kernel.org>; Thu, 18 Mar 2021 20:09:45 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 7A56864F10
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=emeril.freedesktop.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=intel-gfx-bounces@lists.freedesktop.org
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 102FA6E964;
	Thu, 18 Mar 2021 20:09:45 +0000 (UTC)
Received: from emeril.freedesktop.org (emeril.freedesktop.org
 [IPv6:2610:10:20:722:a800:ff:feee:56cf])
 by gabe.freedesktop.org (Postfix) with ESMTP id C1BAA6E964;
 Thu, 18 Mar 2021 20:09:43 +0000 (UTC)
Received: from emeril.freedesktop.org (localhost [127.0.0.1])
 by emeril.freedesktop.org (Postfix) with ESMTP id BE327A0019;
 Thu, 18 Mar 2021 20:09:43 +0000 (UTC)
MIME-Version: 1.0
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Ville Syrjala" <ville.syrjala@linux.intel.com>
Date: Thu, 18 Mar 2021 20:09:43 -0000
Message-ID: <161609818377.12738.9441142796604021229@emeril.freedesktop.org>
X-Patchwork-Hint: ignore
References: <20210318181039.17260-1-ville.syrjala@linux.intel.com>
In-Reply-To: <20210318181039.17260-1-ville.syrjala@linux.intel.com>
Subject: [Intel-gfx] =?utf-8?b?4pyXIEZpLkNJLkJBVDogZmFpbHVyZSBmb3Igc2Vy?=
 =?utf-8?q?ies_starting_with_=5B1/2=5D_drm/i915=3A_Fix_pre-skl_DP_AUX_prec?=
 =?utf-8?q?harge_length?=
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
Content-Type: multipart/mixed; boundary="===============1152231415=="
Errors-To: intel-gfx-bounces@lists.freedesktop.org
Sender: "Intel-gfx" <intel-gfx-bounces@lists.freedesktop.org>

--===============1152231415==
Content-Type: multipart/alternative;
 boundary="===============1162659718156485823=="

--===============1162659718156485823==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: series starting with [1/2] drm/i915: Fix pre-skl DP AUX precharge length
URL   : https://patchwork.freedesktop.org/series/88132/
State : failure

== Summary ==

CI Bug Log - changes from CI_DRM_9870 -> Patchwork_19807
====================================================

Summary
-------

  **FAILURE**

  Serious unknown changes coming with Patchwork_19807 absolutely need to be
  verified manually.
  
  If you think the reported changes have nothing to do with the changes
  introduced in Patchwork_19807, please notify your bug team to allow them
  to document this new failure mode, which will reduce false positives in CI.

  External URL: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_19807/index.html

Possible new issues
-------------------

  Here are the unknown changes that may have been introduced in Patchwork_19807:

### IGT changes ###

#### Possible regressions ####

  * igt@i915_selftest@live@execlists:
    - fi-kbl-soraka:      [PASS][1] -> [DMESG-WARN][2]
   [1]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9870/fi-kbl-soraka/igt@i915_selftest@live@execlists.html
   [2]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_19807/fi-kbl-soraka/igt@i915_selftest@live@execlists.html

  
Known issues
------------

  Here are the changes found in Patchwork_19807 that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@core_hotunplug@unbind-rebind:
    - fi-bwr-2160:        [PASS][3] -> [FAIL][4] ([i915#3194])
   [3]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9870/fi-bwr-2160/igt@core_hotunplug@unbind-rebind.html
   [4]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_19807/fi-bwr-2160/igt@core_hotunplug@unbind-rebind.html

  
  [i915#3194]: https://gitlab.freedesktop.org/drm/intel/issues/3194


Participating hosts (44 -> 40)
------------------------------

  Missing    (4): fi-ilk-m540 fi-bsw-cyan fi-bdw-samus fi-hsw-4200u 


Build changes
-------------

  * Linux: CI_DRM_9870 -> Patchwork_19807

  CI-20190529: 20190529
  CI_DRM_9870: a9a5ed8d2432e5335e6c26118cefb2cfff28ae37 @ git://anongit.freedesktop.org/gfx-ci/linux
  IGT_6036: 5b535494abcdf5ce2b9be99b7bb5df8ab4733083 @ git://anongit.freedesktop.org/xorg/app/intel-gpu-tools
  Patchwork_19807: 89c9ce9bcfbf7286c2ec25ffaa26041909ec84d6 @ git://anongit.freedesktop.org/gfx-ci/linux


== Linux commits ==

89c9ce9bcfbf drm/i915: Remove stray newlines
6b3f9e7ed7f6 drm/i915: Fix pre-skl DP AUX precharge length

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_19807/index.html

--===============1162659718156485823==
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
<tr><td><b>Series:</b></td><td>series starting with [1/2] drm/i915: Fix pre-skl DP AUX precharge length</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/88132/">https://patchwork.freedesktop.org/series/88132/</a></td></tr>
<tr><td><b>State:</b></td><td>failure</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_19807/index.html">https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_19807/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from CI_DRM_9870 -&gt; Patchwork_19807</h1>
<h2>Summary</h2>
<p><strong>FAILURE</strong></p>
<p>Serious unknown changes coming with Patchwork_19807 absolutely need to be<br />
  verified manually.</p>
<p>If you think the reported changes have nothing to do with the changes<br />
  introduced in Patchwork_19807, please notify your bug team to allow them<br />
  to document this new failure mode, which will reduce false positives in CI.</p>
<p>External URL: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_19807/index.html</p>
<h2>Possible new issues</h2>
<p>Here are the unknown changes that may have been introduced in Patchwork_19807:</p>
<h3>IGT changes</h3>
<h4>Possible regressions</h4>
<ul>
<li>igt@i915_selftest@live@execlists:<ul>
<li>fi-kbl-soraka:      <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9870/fi-kbl-soraka/igt@i915_selftest@live@execlists.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_19807/fi-kbl-soraka/igt@i915_selftest@live@execlists.html">DMESG-WARN</a></li>
</ul>
</li>
</ul>
<h2>Known issues</h2>
<p>Here are the changes found in Patchwork_19807 that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>igt@core_hotunplug@unbind-rebind:<ul>
<li>fi-bwr-2160:        <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9870/fi-bwr-2160/igt@core_hotunplug@unbind-rebind.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_19807/fi-bwr-2160/igt@core_hotunplug@unbind-rebind.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/3194">i915#3194</a>)</li>
</ul>
</li>
</ul>
<h2>Participating hosts (44 -&gt; 40)</h2>
<p>Missing    (4): fi-ilk-m540 fi-bsw-cyan fi-bdw-samus fi-hsw-4200u </p>
<h2>Build changes</h2>
<ul>
<li>Linux: CI_DRM_9870 -&gt; Patchwork_19807</li>
</ul>
<p>CI-20190529: 20190529<br />
  CI_DRM_9870: a9a5ed8d2432e5335e6c26118cefb2cfff28ae37 @ git://anongit.freedesktop.org/gfx-ci/linux<br />
  IGT_6036: 5b535494abcdf5ce2b9be99b7bb5df8ab4733083 @ git://anongit.freedesktop.org/xorg/app/intel-gpu-tools<br />
  Patchwork_19807: 89c9ce9bcfbf7286c2ec25ffaa26041909ec84d6 @ git://anongit.freedesktop.org/gfx-ci/linux</p>
<p>== Linux commits ==</p>
<p>89c9ce9bcfbf drm/i915: Remove stray newlines<br />
6b3f9e7ed7f6 drm/i915: Fix pre-skl DP AUX precharge length</p>

</body>
</html>

--===============1162659718156485823==--

--===============1152231415==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Intel-gfx mailing list
Intel-gfx@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/intel-gfx

--===============1152231415==--
