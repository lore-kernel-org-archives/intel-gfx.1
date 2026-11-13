Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 50B2A607C354
	for <intel-gfx@archiver.kernel.org>; Fri, 13 Nov 2026 17:50:37 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DABA310EC61;
	Fri, 13 Nov 2026 17:50:36 +0000 (UTC)
Received: from 9ac1b63fe3ea (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8B55710E533;
 Fri, 13 Nov 2026 17:50:35 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============3055819589269420101=="
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=93_i915=2ECI=2EBAT=3A_success_for_Add_struct=5Foffsetofend?=
 =?utf-8?q?=28=29_for_pointer_arithmetic_=28rev2=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Bence Csokas" <bence.csokas@arm.com>
Cc: intel-gfx@lists.freedesktop.org
Date: Fri, 13 Nov 2026 17:50:35 -0000
Message-ID: <179459223556.21900.1778832864785020768@9ac1b63fe3ea>
X-Patchwork-Hint: ignore
References: <20261113-offsetof-v3-0-714df7053893@arm.com>
In-Reply-To: <20261113-offsetof-v3-0-714df7053893@arm.com>
X-BeenThere: intel-gfx@lists.freedesktop.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Intel graphics driver community testing & development
 <intel-gfx.lists.freedesktop.org>
List-Archive: <https://lists.freedesktop.org/archives/intel-gfx>
List-Post: <mailto:intel-gfx@lists.freedesktop.org>
List-Help: <mailto:intel-gfx-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/intel-gfx>,
 <mailto:intel-gfx-request@lists.freedesktop.org?subject=subscribe>
Reply-To: intel-gfx@lists.freedesktop.org
Sender: "Intel-gfx" <intel-gfx-bounces@lists.freedesktop.org>
X-Spam-Status: No, score=-6.0 required=3.0 tests=BAYES_00,HTML_MESSAGE,
	MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS
	autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

--===============3055819589269420101==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: Add struct_offsetofend() for pointer arithmetic (rev2)
URL   : https://patchwork.freedesktop.org/series/178382/
State : success

== Summary ==

CI Bug Log - changes from CI_DRM_19517 -> Patchwork_178382v2
====================================================

Summary
-------

  **SUCCESS**

  No regressions found.

  External URL: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_178382v2/index.html

Participating hosts (40 -> 39)
------------------------------

  Missing    (1): bat-dg2-13 

Known issues
------------

  Here are the changes found in Patchwork_178382v2 that come from known issues:

### IGT changes ###

#### Possible fixes ####

  * igt@core_hotunplug@unbind-rebind:
    - bat-rpls-4:         [DMESG-WARN][1] ([i915#13400]) -> [PASS][2]
   [1]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19517/bat-rpls-4/igt@core_hotunplug@unbind-rebind.html
   [2]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_178382v2/bat-rpls-4/igt@core_hotunplug@unbind-rebind.html

  
  [i915#13400]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13400


Build changes
-------------

  * Linux: CI_DRM_19517 -> Patchwork_178382v2

  CI-20190529: 20190529
  CI_DRM_19517: 2b4f99da078af1e9a391d4a4ff51550e30b711f2 @ git://anongit.freedesktop.org/gfx-ci/linux
  IGT_9191: 9191
  Patchwork_178382v2: 2b4f99da078af1e9a391d4a4ff51550e30b711f2 @ git://anongit.freedesktop.org/gfx-ci/linux

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_178382v2/index.html

--===============3055819589269420101==
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
<tr><td><b>Series:</b></td><td>Add struct_offsetofend() for pointer arithmetic (rev2)</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/178382/">https://patchwork.freedesktop.org/series/178382/</a></td></tr>
<tr><td><b>State:</b></td><td>success</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_178382v2/index.html">https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_178382v2/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from CI_DRM_19517 -&gt; Patchwork_178382v2</h1>
<h2>Summary</h2>
<p><strong>SUCCESS</strong></p>
<p>No regressions found.</p>
<p>External URL: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_178382v2/index.html</p>
<h2>Participating hosts (40 -&gt; 39)</h2>
<p>Missing    (1): bat-dg2-13 </p>
<h2>Known issues</h2>
<p>Here are the changes found in Patchwork_178382v2 that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Possible fixes</h4>
<ul>
<li>igt@core_hotunplug@unbind-rebind:<ul>
<li>bat-rpls-4:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19517/bat-rpls-4/igt@core_hotunplug@unbind-rebind.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13400">i915#13400</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_178382v2/bat-rpls-4/igt@core_hotunplug@unbind-rebind.html">PASS</a></li>
</ul>
</li>
</ul>
<h2>Build changes</h2>
<ul>
<li>Linux: CI_DRM_19517 -&gt; Patchwork_178382v2</li>
</ul>
<p>CI-20190529: 20190529<br />
  CI_DRM_19517: 2b4f99da078af1e9a391d4a4ff51550e30b711f2 @ git://anongit.freedesktop.org/gfx-ci/linux<br />
  IGT_9191: 9191<br />
  Patchwork_178382v2: 2b4f99da078af1e9a391d4a4ff51550e30b711f2 @ git://anongit.freedesktop.org/gfx-ci/linux</p>

</body>
</html>

--===============3055819589269420101==--
