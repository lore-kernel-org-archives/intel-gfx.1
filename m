Return-Path: <intel-gfx-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 571D6C5DF9C
	for <intel-gfx@archiver.kernel.org>; Mon, 24 Aug 2026 16:29:23 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AE3BB10E7DF;
	Mon, 24 Aug 2026 16:29:22 +0000 (UTC)
Received: from 61270ab9df2a (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 12C2210E7DC;
 Mon, 24 Aug 2026 16:29:21 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============3225663058357260553=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=93_i915=2ECI=2EBAT=3A_success_for_drm/panic=3A_Split_into_c?=
 =?utf-8?q?ore_and_helpers_=28rev2=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Thomas Zimmermann" <tzimmermann@suse.de>
Cc: intel-gfx@lists.freedesktop.org
Date: Mon, 24 Aug 2026 16:29:21 -0000
Message-ID: <178758896107.79853.16741274228045549347@61270ab9df2a>
X-Patchwork-Hint: ignore
References: <20260824125201.218863-1-tzimmermann@suse.de>
In-Reply-To: <20260824125201.218863-1-tzimmermann@suse.de>
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

--===============3225663058357260553==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: drm/panic: Split into core and helpers (rev2)
URL   : https://patchwork.freedesktop.org/series/172395/
State : success

== Summary ==

CI Bug Log - changes from CI_DRM_19038 -> Patchwork_172395v2
====================================================

Summary
-------

  **SUCCESS**

  No regressions found.

  External URL: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_172395v2/index.html

Participating hosts (40 -> 38)
------------------------------

  Missing    (2): bat-dg2-13 fi-snb-2520m 

Known issues
------------

  Here are the changes found in Patchwork_172395v2 that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@core_debugfs@read-all-entries:
    - bat-adlp-6:         [PASS][1] -> [DMESG-WARN][2] ([i915#15673])
   [1]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19038/bat-adlp-6/igt@core_debugfs@read-all-entries.html
   [2]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_172395v2/bat-adlp-6/igt@core_debugfs@read-all-entries.html

  
#### Possible fixes ####

  * igt@core_auth@basic-auth:
    - bat-adlp-6:         [DMESG-WARN][3] ([i915#15673]) -> [PASS][4]
   [3]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19038/bat-adlp-6/igt@core_auth@basic-auth.html
   [4]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_172395v2/bat-adlp-6/igt@core_auth@basic-auth.html

  
  [i915#15673]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15673


Build changes
-------------

  * Linux: CI_DRM_19038 -> Patchwork_172395v2

  CI-20190529: 20190529
  CI_DRM_19038: 00537470d4dadf8e803a2df45b36940dba096d4b @ git://anongit.freedesktop.org/gfx-ci/linux
  IGT_9070: 80b6e4c9b9cb853c63a9bcaa4784e0306d1f7fca @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
  Patchwork_172395v2: 00537470d4dadf8e803a2df45b36940dba096d4b @ git://anongit.freedesktop.org/gfx-ci/linux

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_172395v2/index.html

--===============3225663058357260553==
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
<tr><td><b>Series:</b></td><td>drm/panic: Split into core and helpers (rev2)</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/172395/">https://patchwork.freedesktop.org/series/172395/</a></td></tr>
<tr><td><b>State:</b></td><td>success</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_172395v2/index.html">https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_172395v2/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from CI_DRM_19038 -&gt; Patchwork_172395v2</h1>
<h2>Summary</h2>
<p><strong>SUCCESS</strong></p>
<p>No regressions found.</p>
<p>External URL: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_172395v2/index.html</p>
<h2>Participating hosts (40 -&gt; 38)</h2>
<p>Missing    (2): bat-dg2-13 fi-snb-2520m </p>
<h2>Known issues</h2>
<p>Here are the changes found in Patchwork_172395v2 that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>igt@core_debugfs@read-all-entries:<ul>
<li>bat-adlp-6:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19038/bat-adlp-6/igt@core_debugfs@read-all-entries.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_172395v2/bat-adlp-6/igt@core_debugfs@read-all-entries.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15673">i915#15673</a>)</li>
</ul>
</li>
</ul>
<h4>Possible fixes</h4>
<ul>
<li>igt@core_auth@basic-auth:<ul>
<li>bat-adlp-6:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19038/bat-adlp-6/igt@core_auth@basic-auth.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15673">i915#15673</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_172395v2/bat-adlp-6/igt@core_auth@basic-auth.html">PASS</a></li>
</ul>
</li>
</ul>
<h2>Build changes</h2>
<ul>
<li>Linux: CI_DRM_19038 -&gt; Patchwork_172395v2</li>
</ul>
<p>CI-20190529: 20190529<br />
  CI_DRM_19038: 00537470d4dadf8e803a2df45b36940dba096d4b @ git://anongit.freedesktop.org/gfx-ci/linux<br />
  IGT_9070: 80b6e4c9b9cb853c63a9bcaa4784e0306d1f7fca @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git<br />
  Patchwork_172395v2: 00537470d4dadf8e803a2df45b36940dba096d4b @ git://anongit.freedesktop.org/gfx-ci/linux</p>

</body>
</html>

--===============3225663058357260553==--
