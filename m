Return-Path: <SRS0=4f0g=EV=lists.freedesktop.org=intel-gfx-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,HTML_MESSAGE,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A4C2FC2D0E4
	for <intel-gfx@archiver.kernel.org>; Sun, 15 Nov 2020 16:25:50 +0000 (UTC)
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 25A0A22453
	for <intel-gfx@archiver.kernel.org>; Sun, 15 Nov 2020 16:25:49 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 25A0A22453
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=emeril.freedesktop.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=intel-gfx-bounces@lists.freedesktop.org
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7CEB46E99D;
	Sun, 15 Nov 2020 16:25:49 +0000 (UTC)
Received: from emeril.freedesktop.org (emeril.freedesktop.org
 [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTP id 1F9C86E98E;
 Sun, 15 Nov 2020 16:25:49 +0000 (UTC)
Received: from emeril.freedesktop.org (localhost [127.0.0.1])
 by emeril.freedesktop.org (Postfix) with ESMTP id 151EAA0091;
 Sun, 15 Nov 2020 16:25:49 +0000 (UTC)
MIME-Version: 1.0
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Chris Wilson" <chris@chris-wilson.co.uk>
Date: Sun, 15 Nov 2020 16:25:49 -0000
Message-ID: <160545754905.9577.3028655289335839770@emeril.freedesktop.org>
X-Patchwork-Hint: ignore
References: <20201115153139.24369-1-chris@chris-wilson.co.uk>
In-Reply-To: <20201115153139.24369-1-chris@chris-wilson.co.uk>
Subject: [Intel-gfx] =?utf-8?b?4pyTIEZpLkNJLkJBVDogc3VjY2VzcyBmb3IgUmV2?=
 =?utf-8?q?ert_=22drm=3A_convert_drm=5Fatomic=5Fuapi=2Ec_to_new_debug_help?=
 =?utf-8?q?ers=22?=
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
Content-Type: multipart/mixed; boundary="===============2014008996=="
Errors-To: intel-gfx-bounces@lists.freedesktop.org
Sender: "Intel-gfx" <intel-gfx-bounces@lists.freedesktop.org>

--===============2014008996==
Content-Type: multipart/alternative;
 boundary="===============0585588487770191889=="

--===============0585588487770191889==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: Revert "drm: convert drm_atomic_uapi.c to new debug helpers"
URL   : https://patchwork.freedesktop.org/series/83856/
State : success

== Summary ==

CI Bug Log - changes from CI_DRM_9327 -> Patchwork_18908
====================================================

Summary
-------

  **SUCCESS**

  No regressions found.

  External URL: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_18908/index.html

New tests
---------

  New tests have been introduced between CI_DRM_9327 and Patchwork_18908:

### New CI tests (1) ###

  * boot:
    - Statuses : 31 pass(s)
    - Exec time: [0.0] s

  

Known issues
------------

  Here are the changes found in Patchwork_18908 that come from known issues:

### IGT changes ###

#### Possible fixes ####

  * igt@kms_force_connector_basic@force-connector-state:
    - fi-kbl-guc:         [DMESG-WARN][1] -> [PASS][2]
   [1]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9327/fi-kbl-guc/igt@kms_force_connector_basic@force-connector-state.html
   [2]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_18908/fi-kbl-guc/igt@kms_force_connector_basic@force-connector-state.html

  


Participating hosts (5 -> 31)
------------------------------

  Additional (26): fi-kbl-soraka fi-ehl-1 fi-tgl-dsi fi-skl-guc fi-apl-guc fi-snb-2520m fi-pnv-d510 fi-icl-y fi-blb-e6850 fi-skl-6600u fi-snb-2600 fi-cml-u2 fi-bxt-dsi fi-bdw-5557u fi-bsw-n3050 fi-byt-j1900 fi-tgl-u2 fi-glk-dsi fi-cfl-guc fi-ilk-650 fi-kbl-7500u fi-ivb-3770 fi-cfl-8109u fi-bsw-kefka fi-tgl-y fi-skl-6700k2 


Build changes
-------------

  * Linux: CI_DRM_9327 -> Patchwork_18908

  CI-20190529: 20190529
  CI_DRM_9327: af383973ac39069d9ffcac0287a896a107005d54 @ git://anongit.freedesktop.org/gfx-ci/linux
  IGT_5850: 9748a4a0f93d108955d374a866e60cb962da9b5d @ git://anongit.freedesktop.org/xorg/app/intel-gpu-tools
  Patchwork_18908: d8ecccff711fab11259b12e95ca7eb070f9c5c04 @ git://anongit.freedesktop.org/gfx-ci/linux


== Linux commits ==

d8ecccff711f Revert "drm: convert drm_atomic_uapi.c to new debug helpers"

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_18908/index.html

--===============0585588487770191889==
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
<tr><td><b>Series:</b></td><td>Revert &quot;drm: convert drm_atomic_uapi.c to new debug helpers&quot;</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/83856/">https://patchwork.freedesktop.org/series/83856/</a></td></tr>
<tr><td><b>State:</b></td><td>success</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_18908/index.html">https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_18908/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from CI_DRM_9327 -&gt; Patchwork_18908</h1>
<h2>Summary</h2>
<p><strong>SUCCESS</strong></p>
<p>No regressions found.</p>
<p>External URL: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_18908/index.html</p>
<h2>New tests</h2>
<p>New tests have been introduced between CI_DRM_9327 and Patchwork_18908:</p>
<h3>New CI tests (1)</h3>
<ul>
<li>boot:<ul>
<li>Statuses : 31 pass(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
</ul>
<h2>Known issues</h2>
<p>Here are the changes found in Patchwork_18908 that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Possible fixes</h4>
<ul>
<li>igt@kms_force_connector_basic@force-connector-state:<ul>
<li>fi-kbl-guc:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9327/fi-kbl-guc/igt@kms_force_connector_basic@force-connector-state.html">DMESG-WARN</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_18908/fi-kbl-guc/igt@kms_force_connector_basic@force-connector-state.html">PASS</a></li>
</ul>
</li>
</ul>
<h2>Participating hosts (5 -&gt; 31)</h2>
<p>Additional (26): fi-kbl-soraka fi-ehl-1 fi-tgl-dsi fi-skl-guc fi-apl-guc fi-snb-2520m fi-pnv-d510 fi-icl-y fi-blb-e6850 fi-skl-6600u fi-snb-2600 fi-cml-u2 fi-bxt-dsi fi-bdw-5557u fi-bsw-n3050 fi-byt-j1900 fi-tgl-u2 fi-glk-dsi fi-cfl-guc fi-ilk-650 fi-kbl-7500u fi-ivb-3770 fi-cfl-8109u fi-bsw-kefka fi-tgl-y fi-skl-6700k2 </p>
<h2>Build changes</h2>
<ul>
<li>Linux: CI_DRM_9327 -&gt; Patchwork_18908</li>
</ul>
<p>CI-20190529: 20190529<br />
  CI_DRM_9327: af383973ac39069d9ffcac0287a896a107005d54 @ git://anongit.freedesktop.org/gfx-ci/linux<br />
  IGT_5850: 9748a4a0f93d108955d374a866e60cb962da9b5d @ git://anongit.freedesktop.org/xorg/app/intel-gpu-tools<br />
  Patchwork_18908: d8ecccff711fab11259b12e95ca7eb070f9c5c04 @ git://anongit.freedesktop.org/gfx-ci/linux</p>
<p>== Linux commits ==</p>
<p>d8ecccff711f Revert "drm: convert drm_atomic_uapi.c to new debug helpers"</p>

</body>
</html>

--===============0585588487770191889==--

--===============2014008996==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Intel-gfx mailing list
Intel-gfx@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/intel-gfx

--===============2014008996==--
