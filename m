Return-Path: <intel-gfx-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 01BE6C88E77
	for <intel-gfx@archiver.kernel.org>; Tue, 15 Sep 2026 19:52:39 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 763BA10E17C;
	Tue, 15 Sep 2026 19:52:39 +0000 (UTC)
Received: from 61270ab9df2a (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1017910E17C;
 Tue, 15 Sep 2026 19:52:38 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============4986917926315844985=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=93_i915=2ECI=2EBAT=3A_success_for_drm/i915/dp=3A_use_EXPORT?=
 =?utf-8?q?=5FSYMBOL=5FIF=5FKUNIT=28=29_for_kunit_helpers?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Jani Nikula" <jani.nikula@intel.com>
Cc: intel-gfx@lists.freedesktop.org
Date: Tue, 15 Sep 2026 19:52:38 -0000
Message-ID: <178950195805.167993.3505883629927623899@61270ab9df2a>
X-Patchwork-Hint: ignore
References: <20260915160620.779372-1-jani.nikula@intel.com>
In-Reply-To: <20260915160620.779372-1-jani.nikula@intel.com>
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

--===============4986917926315844985==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: drm/i915/dp: use EXPORT_SYMBOL_IF_KUNIT() for kunit helpers
URL   : https://patchwork.freedesktop.org/series/174184/
State : success

== Summary ==

CI Bug Log - changes from CI_DRM_19152 -> Patchwork_174184v1
====================================================

Summary
-------

  **SUCCESS**

  No regressions found.

  External URL: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_174184v1/index.html

Participating hosts (39 -> 37)
------------------------------

  Missing    (2): bat-dg2-13 fi-glk-j4005 


Changes
-------

  No changes found


Build changes
-------------

  * Linux: CI_DRM_19152 -> Patchwork_174184v1

  CI-20190529: 20190529
  CI_DRM_19152: 0fb8d1900f1a6b9d21aadbfa5f784979b950bcf8 @ git://anongit.freedesktop.org/gfx-ci/linux
  IGT_9098: 9098
  Patchwork_174184v1: 0fb8d1900f1a6b9d21aadbfa5f784979b950bcf8 @ git://anongit.freedesktop.org/gfx-ci/linux

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_174184v1/index.html

--===============4986917926315844985==
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
<tr><td><b>Series:</b></td><td>drm/i915/dp: use EXPORT_SYMBOL_IF_KUNIT() for kunit helpers</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/174184/">https://patchwork.freedesktop.org/series/174184/</a></td></tr>
<tr><td><b>State:</b></td><td>success</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_174184v1/index.html">https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_174184v1/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from CI_DRM_19152 -&gt; Patchwork_174184v1</h1>
<h2>Summary</h2>
<p><strong>SUCCESS</strong></p>
<p>No regressions found.</p>
<p>External URL: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_174184v1/index.html</p>
<h2>Participating hosts (39 -&gt; 37)</h2>
<p>Missing    (2): bat-dg2-13 fi-glk-j4005 </p>
<h2>Changes</h2>
<p>No changes found</p>
<h2>Build changes</h2>
<ul>
<li>Linux: CI_DRM_19152 -&gt; Patchwork_174184v1</li>
</ul>
<p>CI-20190529: 20190529<br />
  CI_DRM_19152: 0fb8d1900f1a6b9d21aadbfa5f784979b950bcf8 @ git://anongit.freedesktop.org/gfx-ci/linux<br />
  IGT_9098: 9098<br />
  Patchwork_174184v1: 0fb8d1900f1a6b9d21aadbfa5f784979b950bcf8 @ git://anongit.freedesktop.org/gfx-ci/linux</p>

</body>
</html>

--===============4986917926315844985==--
