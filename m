Return-Path: <SRS0=Qdda=MS=lists.freedesktop.org=intel-gfx-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.7 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,HTML_MESSAGE,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A93B2C4338F
	for <intel-gfx@archiver.kernel.org>; Mon, 26 Jul 2021 18:58:56 +0000 (UTC)
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 5A78960F5B
	for <intel-gfx@archiver.kernel.org>; Mon, 26 Jul 2021 18:58:56 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 5A78960F5B
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=emeril.freedesktop.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.freedesktop.org
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 069556E838;
	Mon, 26 Jul 2021 18:58:56 +0000 (UTC)
Received: from emeril.freedesktop.org (emeril.freedesktop.org
 [IPv6:2610:10:20:722:a800:ff:feee:56cf])
 by gabe.freedesktop.org (Postfix) with ESMTP id 71D466E838;
 Mon, 26 Jul 2021 18:58:55 +0000 (UTC)
Received: from emeril.freedesktop.org (localhost [127.0.0.1])
 by emeril.freedesktop.org (Postfix) with ESMTP id 6DE15A882E;
 Mon, 26 Jul 2021 18:58:55 +0000 (UTC)
MIME-Version: 1.0
From: Patchwork <patchwork@emeril.freedesktop.org>
To: =?utf-8?q?Jos=C3=A9_Roberto_de_Souza?= <jose.souza@intel.com>
Date: Mon, 26 Jul 2021 18:58:55 -0000
Message-ID: <162732593544.2615.4646314912304119519@emeril.freedesktop.org>
X-Patchwork-Hint: ignore
References: <20210726181559.80855-1-jose.souza@intel.com>
In-Reply-To: <20210726181559.80855-1-jose.souza@intel.com>
Subject: [Intel-gfx] =?utf-8?b?4pyTIEZpLkNJLkJBVDogc3VjY2VzcyBmb3IgZHJt?=
 =?utf-8?q?/i915/display=3A_Disable_audio=2C_DRRS_and_PSR_before_planes?=
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
Content-Type: multipart/mixed; boundary="===============1411128147=="
Errors-To: intel-gfx-bounces@lists.freedesktop.org
Sender: "Intel-gfx" <intel-gfx-bounces@lists.freedesktop.org>

--===============1411128147==
Content-Type: multipart/alternative;
 boundary="===============8743376213317888871=="

--===============8743376213317888871==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: drm/i915/display: Disable audio, DRRS and PSR before planes
URL   : https://patchwork.freedesktop.org/series/93024/
State : success

== Summary ==

CI Bug Log - changes from CI_DRM_10396 -> Patchwork_20705
====================================================

Summary
-------

  **SUCCESS**

  No regressions found.

  External URL: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_20705/index.html

Known issues
------------

  Here are the changes found in Patchwork_20705 that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@kms_chamelium@dp-crc-fast:
    - fi-kbl-7500u:       [PASS][1] -> [FAIL][2] ([i915#1372])
   [1]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10396/fi-kbl-7500u/igt@kms_chamelium@dp-crc-fast.html
   [2]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_20705/fi-kbl-7500u/igt@kms_chamelium@dp-crc-fast.html

  
#### Possible fixes ####

  * igt@kms_chamelium@hdmi-crc-fast:
    - fi-kbl-7500u:       [DMESG-FAIL][3] ([i915#165]) -> [PASS][4]
   [3]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10396/fi-kbl-7500u/igt@kms_chamelium@hdmi-crc-fast.html
   [4]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_20705/fi-kbl-7500u/igt@kms_chamelium@hdmi-crc-fast.html

  
  [i915#1372]: https://gitlab.freedesktop.org/drm/intel/issues/1372
  [i915#165]: https://gitlab.freedesktop.org/drm/intel/issues/165


Participating hosts (39 -> 35)
------------------------------

  Missing    (4): fi-ilk-m540 fi-bsw-cyan fi-bdw-samus fi-hsw-4200u 


Build changes
-------------

  * Linux: CI_DRM_10396 -> Patchwork_20705

  CI-20190529: 20190529
  CI_DRM_10396: a119adff94c9db72f198ddde3dbb0a3e51c56618 @ git://anongit.freedesktop.org/gfx-ci/linux
  IGT_6151: c3170c2d3744521b8351a4b9c579792bc9a5f835 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
  Patchwork_20705: 4b987bbf5ee886fe98a743f73849a03ec30de6db @ git://anongit.freedesktop.org/gfx-ci/linux


== Linux commits ==

4b987bbf5ee8 drm/i915/display: Disable audio, DRRS and PSR before planes

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_20705/index.html

--===============8743376213317888871==
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
<tr><td><b>Series:</b></td><td>drm/i915/display: Disable audio, DRRS and PSR before planes</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/93024/">https://patchwork.freedesktop.org/series/93024/</a></td></tr>
<tr><td><b>State:</b></td><td>success</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_20705/index.html">https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_20705/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from CI_DRM_10396 -&gt; Patchwork_20705</h1>
<h2>Summary</h2>
<p><strong>SUCCESS</strong></p>
<p>No regressions found.</p>
<p>External URL: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_20705/index.html</p>
<h2>Known issues</h2>
<p>Here are the changes found in Patchwork_20705 that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>igt@kms_chamelium@dp-crc-fast:<ul>
<li>fi-kbl-7500u:       <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10396/fi-kbl-7500u/igt@kms_chamelium@dp-crc-fast.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_20705/fi-kbl-7500u/igt@kms_chamelium@dp-crc-fast.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1372">i915#1372</a>)</li>
</ul>
</li>
</ul>
<h4>Possible fixes</h4>
<ul>
<li>igt@kms_chamelium@hdmi-crc-fast:<ul>
<li>fi-kbl-7500u:       <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10396/fi-kbl-7500u/igt@kms_chamelium@hdmi-crc-fast.html">DMESG-FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/165">i915#165</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_20705/fi-kbl-7500u/igt@kms_chamelium@hdmi-crc-fast.html">PASS</a></li>
</ul>
</li>
</ul>
<h2>Participating hosts (39 -&gt; 35)</h2>
<p>Missing    (4): fi-ilk-m540 fi-bsw-cyan fi-bdw-samus fi-hsw-4200u </p>
<h2>Build changes</h2>
<ul>
<li>Linux: CI_DRM_10396 -&gt; Patchwork_20705</li>
</ul>
<p>CI-20190529: 20190529<br />
  CI_DRM_10396: a119adff94c9db72f198ddde3dbb0a3e51c56618 @ git://anongit.freedesktop.org/gfx-ci/linux<br />
  IGT_6151: c3170c2d3744521b8351a4b9c579792bc9a5f835 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git<br />
  Patchwork_20705: 4b987bbf5ee886fe98a743f73849a03ec30de6db @ git://anongit.freedesktop.org/gfx-ci/linux</p>
<p>== Linux commits ==</p>
<p>4b987bbf5ee8 drm/i915/display: Disable audio, DRRS and PSR before planes</p>

</body>
</html>

--===============8743376213317888871==--

--===============1411128147==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Intel-gfx mailing list
Intel-gfx@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/intel-gfx

--===============1411128147==--
