Return-Path: <SRS0=4MRd=OT=lists.freedesktop.org=intel-gfx-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 52B15C433EF
	for <intel-gfx@archiver.kernel.org>; Wed, 29 Sep 2021 14:46:15 +0000 (UTC)
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id DC083613CD
	for <intel-gfx@archiver.kernel.org>; Wed, 29 Sep 2021 14:46:14 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org DC083613CD
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=emeril.freedesktop.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.freedesktop.org
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 62AAD6EA8F;
	Wed, 29 Sep 2021 14:46:14 +0000 (UTC)
Received: from emeril.freedesktop.org (emeril.freedesktop.org
 [IPv6:2610:10:20:722:a800:ff:feee:56cf])
 by gabe.freedesktop.org (Postfix) with ESMTP id 61E496EA8F;
 Wed, 29 Sep 2021 14:46:13 +0000 (UTC)
Received: from emeril.freedesktop.org (localhost [127.0.0.1])
 by emeril.freedesktop.org (Postfix) with ESMTP id 5DAFCA47EB;
 Wed, 29 Sep 2021 14:46:13 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============6667335285186051297=="
MIME-Version: 1.0
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Tejas Upadhyay" <tejaskumarx.surendrakumar.upadhyay@intel.com>
Cc: intel-gfx@lists.freedesktop.org
Date: Wed, 29 Sep 2021 14:46:13 -0000
Message-ID: <163292677337.27098.5935356372898867213@emeril.freedesktop.org>
X-Patchwork-Hint: ignore
References: <20210929052442.2543054-1-tejaskumarx.surendrakumar.upadhyay@intel.com>
In-Reply-To: <20210929052442.2543054-1-tejaskumarx.surendrakumar.upadhyay@intel.com>
Subject: [Intel-gfx] =?utf-8?b?4pyTIEZpLkNJLkJBVDogc3VjY2VzcyBmb3IgZHJt?=
 =?utf-8?q?/i915/gen11=3A_Disable_cursor_clock_gating_in_HDR_mode_=28rev7?=
 =?utf-8?q?=29?=
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

--===============6667335285186051297==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: drm/i915/gen11: Disable cursor clock gating in HDR mode (rev7)
URL   : https://patchwork.freedesktop.org/series/91674/
State : success

== Summary ==

CI Bug Log - changes from CI_DRM_10660 -> Patchwork_21190
====================================================

Summary
-------

  **SUCCESS**

  No regressions found.

  External URL: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_21190/index.html


Changes
-------

  No changes found


Participating hosts (33 -> 29)
------------------------------

  Missing    (4): fi-bsw-cyan bat-jsl-1 bat-dg1-6 bat-adlp-4 


Build changes
-------------

  * Linux: CI_DRM_10660 -> Patchwork_21190

  CI-20190529: 20190529
  CI_DRM_10660: 05888a7b7b4aec560d6692e5e9173adc7e76c0df @ git://anongit.freedesktop.org/gfx-ci/linux
  IGT_6227: 6ac2da7fd6b13f04f9aa0ec10f86b831d2756946 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
  Patchwork_21190: f2837e9db771588f882bbc29f7f1efed0e123f49 @ git://anongit.freedesktop.org/gfx-ci/linux


== Linux commits ==

f2837e9db771 drm/i915/gen11: Disable cursor clock gating in HDR mode

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_21190/index.html

--===============6667335285186051297==
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
<tr><td><b>Series:</b></td><td>drm/i915/gen11: Disable cursor clock gating in HDR mode (rev7)</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/91674/">https://patchwork.freedesktop.org/series/91674/</a></td></tr>
<tr><td><b>State:</b></td><td>success</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_21190/index.html">https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_21190/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from CI_DRM_10660 -&gt; Patchwork_21190</h1>
<h2>Summary</h2>
<p><strong>SUCCESS</strong></p>
<p>No regressions found.</p>
<p>External URL: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_21190/index.html</p>
<h2>Changes</h2>
<p>No changes found</p>
<h2>Participating hosts (33 -&gt; 29)</h2>
<p>Missing    (4): fi-bsw-cyan bat-jsl-1 bat-dg1-6 bat-adlp-4 </p>
<h2>Build changes</h2>
<ul>
<li>Linux: CI_DRM_10660 -&gt; Patchwork_21190</li>
</ul>
<p>CI-20190529: 20190529<br />
  CI_DRM_10660: 05888a7b7b4aec560d6692e5e9173adc7e76c0df @ git://anongit.freedesktop.org/gfx-ci/linux<br />
  IGT_6227: 6ac2da7fd6b13f04f9aa0ec10f86b831d2756946 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git<br />
  Patchwork_21190: f2837e9db771588f882bbc29f7f1efed0e123f49 @ git://anongit.freedesktop.org/gfx-ci/linux</p>
<p>== Linux commits ==</p>
<p>f2837e9db771 drm/i915/gen11: Disable cursor clock gating in HDR mode</p>

</body>
</html>

--===============6667335285186051297==--
