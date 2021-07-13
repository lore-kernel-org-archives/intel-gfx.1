Return-Path: <SRS0=tFHw=MF=lists.freedesktop.org=intel-gfx-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,HTML_MESSAGE,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A155DC07E9A
	for <intel-gfx@archiver.kernel.org>; Tue, 13 Jul 2021 01:33:11 +0000 (UTC)
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 647AA611B0
	for <intel-gfx@archiver.kernel.org>; Tue, 13 Jul 2021 01:33:11 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 647AA611B0
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=emeril.freedesktop.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=intel-gfx-bounces@lists.freedesktop.org
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E861089FE3;
	Tue, 13 Jul 2021 01:33:10 +0000 (UTC)
Received: from emeril.freedesktop.org (emeril.freedesktop.org
 [IPv6:2610:10:20:722:a800:ff:feee:56cf])
 by gabe.freedesktop.org (Postfix) with ESMTP id 1B3D089FDE;
 Tue, 13 Jul 2021 01:33:10 +0000 (UTC)
Received: from emeril.freedesktop.org (localhost [127.0.0.1])
 by emeril.freedesktop.org (Postfix) with ESMTP id 04ACDA008A;
 Tue, 13 Jul 2021 01:33:10 +0000 (UTC)
MIME-Version: 1.0
From: Patchwork <patchwork@emeril.freedesktop.org>
To: =?utf-8?q?Jos=C3=A9_Roberto_de_Souza?= <jose.souza@intel.com>
Date: Tue, 13 Jul 2021 01:33:09 -0000
Message-ID: <162613998998.710.5629143388504751852@emeril.freedesktop.org>
X-Patchwork-Hint: ignore
References: <20210713003854.143197-1-jose.souza@intel.com>
In-Reply-To: <20210713003854.143197-1-jose.souza@intel.com>
Subject: [Intel-gfx] =?utf-8?b?4pyTIEZpLkNJLkJBVDogc3VjY2VzcyBmb3Igc2Vy?=
 =?utf-8?q?ies_starting_with_=5BCI=2C1/6=5D_drm/i915/display=3A_Settle_on_?=
 =?utf-8?q?=22adl-x=22_in_WA_comments?=
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
Content-Type: multipart/mixed; boundary="===============1405422873=="
Errors-To: intel-gfx-bounces@lists.freedesktop.org
Sender: "Intel-gfx" <intel-gfx-bounces@lists.freedesktop.org>

--===============1405422873==
Content-Type: multipart/alternative;
 boundary="===============2879876197506682668=="

--===============2879876197506682668==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: series starting with [CI,1/6] drm/i915/display: Settle on "adl-x" in WA comments
URL   : https://patchwork.freedesktop.org/series/92457/
State : success

== Summary ==

CI Bug Log - changes from CI_DRM_10335 -> Patchwork_20581
====================================================

Summary
-------

  **SUCCESS**

  No regressions found.

  External URL: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_20581/index.html


Changes
-------

  No changes found


Participating hosts (40 -> 39)
------------------------------

  Missing    (1): fi-bdw-samus 


Build changes
-------------

  * Linux: CI_DRM_10335 -> Patchwork_20581

  CI-20190529: 20190529
  CI_DRM_10335: 6420d4c905cfd9a9098c7ab339992eafa628de4d @ git://anongit.freedesktop.org/gfx-ci/linux
  IGT_6134: cd63c83e23789eb194d38b8d272247a88122f2f6 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
  Patchwork_20581: bd02956b712bc812673a962faaba7c80d48115b4 @ git://anongit.freedesktop.org/gfx-ci/linux


== Linux commits ==

bd02956b712b drm/i915/display/xelpd: Extend Wa_14011508470
fae190f45c0a drm/i915: Limit Wa_22010178259 to affected platforms
fed313930af0 drm/i915/adl_s: Extend Wa_1406941453
a4cf4dd36f79 drm/i915: Implement Wa_1508744258
b6586d4050f6 drm/i915: Settle on "adl-x" in WA comments
fb832381def1 drm/i915/display: Settle on "adl-x" in WA comments

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_20581/index.html

--===============2879876197506682668==
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
<tr><td><b>Series:</b></td><td>series starting with [CI,1/6] drm/i915/display: Settle on &quot;adl-x&quot; in WA comments</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/92457/">https://patchwork.freedesktop.org/series/92457/</a></td></tr>
<tr><td><b>State:</b></td><td>success</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_20581/index.html">https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_20581/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from CI_DRM_10335 -&gt; Patchwork_20581</h1>
<h2>Summary</h2>
<p><strong>SUCCESS</strong></p>
<p>No regressions found.</p>
<p>External URL: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_20581/index.html</p>
<h2>Changes</h2>
<p>No changes found</p>
<h2>Participating hosts (40 -&gt; 39)</h2>
<p>Missing    (1): fi-bdw-samus </p>
<h2>Build changes</h2>
<ul>
<li>Linux: CI_DRM_10335 -&gt; Patchwork_20581</li>
</ul>
<p>CI-20190529: 20190529<br />
  CI_DRM_10335: 6420d4c905cfd9a9098c7ab339992eafa628de4d @ git://anongit.freedesktop.org/gfx-ci/linux<br />
  IGT_6134: cd63c83e23789eb194d38b8d272247a88122f2f6 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git<br />
  Patchwork_20581: bd02956b712bc812673a962faaba7c80d48115b4 @ git://anongit.freedesktop.org/gfx-ci/linux</p>
<p>== Linux commits ==</p>
<p>bd02956b712b drm/i915/display/xelpd: Extend Wa_14011508470<br />
fae190f45c0a drm/i915: Limit Wa_22010178259 to affected platforms<br />
fed313930af0 drm/i915/adl_s: Extend Wa_1406941453<br />
a4cf4dd36f79 drm/i915: Implement Wa_1508744258<br />
b6586d4050f6 drm/i915: Settle on "adl-x" in WA comments<br />
fb832381def1 drm/i915/display: Settle on "adl-x" in WA comments</p>

</body>
</html>

--===============2879876197506682668==--

--===============1405422873==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Intel-gfx mailing list
Intel-gfx@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/intel-gfx

--===============1405422873==--
