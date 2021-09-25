Return-Path: <SRS0=bSLa=OP=lists.freedesktop.org=intel-gfx-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 86B6EC433EF
	for <intel-gfx@archiver.kernel.org>; Sat, 25 Sep 2021 00:17:58 +0000 (UTC)
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 466E760F6D
	for <intel-gfx@archiver.kernel.org>; Sat, 25 Sep 2021 00:17:58 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 466E760F6D
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=emeril.freedesktop.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.freedesktop.org
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BA9F36EE9B;
	Sat, 25 Sep 2021 00:17:57 +0000 (UTC)
Received: from emeril.freedesktop.org (emeril.freedesktop.org
 [IPv6:2610:10:20:722:a800:ff:feee:56cf])
 by gabe.freedesktop.org (Postfix) with ESMTP id F20A66E2BC;
 Sat, 25 Sep 2021 00:17:56 +0000 (UTC)
Received: from emeril.freedesktop.org (localhost [127.0.0.1])
 by emeril.freedesktop.org (Postfix) with ESMTP id EC9B2A47EB;
 Sat, 25 Sep 2021 00:17:56 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============2644000443861198098=="
MIME-Version: 1.0
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Colin King" <colin.king@canonical.com>
Cc: intel-gfx@lists.freedesktop.org
Date: Sat, 25 Sep 2021 00:17:56 -0000
Message-ID: <163252907696.10328.7601815074657164671@emeril.freedesktop.org>
X-Patchwork-Hint: ignore
References: <20210924225623.143409-1-colin.king@canonical.com>
In-Reply-To: <20210924225623.143409-1-colin.king@canonical.com>
Subject: [Intel-gfx] =?utf-8?b?4pyTIEZpLkNJLkJBVDogc3VjY2VzcyBmb3IgZHJt?=
 =?utf-8?q?/i915/gvt=3A_Fix_spelling_mistake_=22Unsupport=22_-=3E_=22Unsup?=
 =?utf-8?q?ported=22?=
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

--===============2644000443861198098==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: drm/i915/gvt: Fix spelling mistake "Unsupport" -> "Unsupported"
URL   : https://patchwork.freedesktop.org/series/95046/
State : success

== Summary ==

CI Bug Log - changes from CI_DRM_10643 -> Patchwork_21159
====================================================

Summary
-------

  **SUCCESS**

  No regressions found.

  External URL: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_21159/index.html


Changes
-------

  No changes found


Participating hosts (40 -> 34)
------------------------------

  Missing    (6): bat-dg1-6 fi-bsw-cyan bat-adlp-4 fi-bdw-samus bat-jsl-2 bat-jsl-1 


Build changes
-------------

  * Linux: CI_DRM_10643 -> Patchwork_21159

  CI-20190529: 20190529
  CI_DRM_10643: 6b2cb2c1f403ce807a7877c62cf1a8dcb5aef77a @ git://anongit.freedesktop.org/gfx-ci/linux
  IGT_6218: 8d4169d9543d8e5c01f0c746f603801a4d65ead0 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
  Patchwork_21159: 465cf44c1770e237f4eb980ae9e875fd93f689d7 @ git://anongit.freedesktop.org/gfx-ci/linux


== Linux commits ==

465cf44c1770 drm/i915/gvt: Fix spelling mistake "Unsupport" -> "Unsupported"

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_21159/index.html

--===============2644000443861198098==
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
<tr><td><b>Series:</b></td><td>drm/i915/gvt: Fix spelling mistake &quot;Unsupport&quot; -&gt; &quot;Unsupported&quot;</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/95046/">https://patchwork.freedesktop.org/series/95046/</a></td></tr>
<tr><td><b>State:</b></td><td>success</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_21159/index.html">https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_21159/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from CI_DRM_10643 -&gt; Patchwork_21159</h1>
<h2>Summary</h2>
<p><strong>SUCCESS</strong></p>
<p>No regressions found.</p>
<p>External URL: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_21159/index.html</p>
<h2>Changes</h2>
<p>No changes found</p>
<h2>Participating hosts (40 -&gt; 34)</h2>
<p>Missing    (6): bat-dg1-6 fi-bsw-cyan bat-adlp-4 fi-bdw-samus bat-jsl-2 bat-jsl-1 </p>
<h2>Build changes</h2>
<ul>
<li>Linux: CI_DRM_10643 -&gt; Patchwork_21159</li>
</ul>
<p>CI-20190529: 20190529<br />
  CI_DRM_10643: 6b2cb2c1f403ce807a7877c62cf1a8dcb5aef77a @ git://anongit.freedesktop.org/gfx-ci/linux<br />
  IGT_6218: 8d4169d9543d8e5c01f0c746f603801a4d65ead0 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git<br />
  Patchwork_21159: 465cf44c1770e237f4eb980ae9e875fd93f689d7 @ git://anongit.freedesktop.org/gfx-ci/linux</p>
<p>== Linux commits ==</p>
<p>465cf44c1770 drm/i915/gvt: Fix spelling mistake "Unsupport" -&gt; "Unsupported"</p>

</body>
</html>

--===============2644000443861198098==--
