Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 678D9606A32D
	for <intel-gfx@archiver.kernel.org>; Fri, 13 Nov 2026 09:53:59 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DDF2E10EBFF;
	Fri, 13 Nov 2026 09:53:58 +0000 (UTC)
Received: from 9ac1b63fe3ea (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AB97010EBFF;
 Fri, 13 Nov 2026 09:53:57 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============2328455159920265714=="
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=93_i915=2ECI=2EBAT=3A_success_for_drm/i915/dip=3A_Write_the?=
 =?utf-8?q?_DIP_header_last?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Chaitanya Kumar Borah" <chaitanya.kumar.borah@intel.com>
Cc: intel-gfx@lists.freedesktop.org
Date: Fri, 13 Nov 2026 09:53:57 -0000
Message-ID: <179456363769.19323.13699458446754197240@9ac1b63fe3ea>
X-Patchwork-Hint: ignore
References: <20261113074849.30768-1-chaitanya.kumar.borah@intel.com>
In-Reply-To: <20261113074849.30768-1-chaitanya.kumar.borah@intel.com>
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

--===============2328455159920265714==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: drm/i915/dip: Write the DIP header last
URL   : https://patchwork.freedesktop.org/series/178463/
State : success

== Summary ==

CI Bug Log - changes from CI_DRM_19516 -> Patchwork_178463v1
====================================================

Summary
-------

  **SUCCESS**

  No regressions found.

  External URL: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_178463v1/index.html

Participating hosts (40 -> 39)
------------------------------

  Missing    (1): bat-dg2-13 

Known issues
------------

  Here are the changes found in Patchwork_178463v1 that come from known issues:

### IGT changes ###

#### Possible fixes ####

  * igt@vgem_basic@unload:
    - bat-rpls-4:         [DMESG-WARN][1] ([i915#13400]) -> [PASS][2]
   [1]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19516/bat-rpls-4/igt@vgem_basic@unload.html
   [2]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_178463v1/bat-rpls-4/igt@vgem_basic@unload.html

  
  [i915#13400]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13400


Build changes
-------------

  * Linux: CI_DRM_19516 -> Patchwork_178463v1

  CI-20190529: 20190529
  CI_DRM_19516: d41695c479e8bb24eb941e5ba916e42784af6f4d @ git://anongit.freedesktop.org/gfx-ci/linux
  IGT_9190: 9190
  Patchwork_178463v1: d41695c479e8bb24eb941e5ba916e42784af6f4d @ git://anongit.freedesktop.org/gfx-ci/linux

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_178463v1/index.html

--===============2328455159920265714==
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
<tr><td><b>Series:</b></td><td>drm/i915/dip: Write the DIP header last</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/178463/">https://patchwork.freedesktop.org/series/178463/</a></td></tr>
<tr><td><b>State:</b></td><td>success</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_178463v1/index.html">https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_178463v1/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from CI_DRM_19516 -&gt; Patchwork_178463v1</h1>
<h2>Summary</h2>
<p><strong>SUCCESS</strong></p>
<p>No regressions found.</p>
<p>External URL: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_178463v1/index.html</p>
<h2>Participating hosts (40 -&gt; 39)</h2>
<p>Missing    (1): bat-dg2-13 </p>
<h2>Known issues</h2>
<p>Here are the changes found in Patchwork_178463v1 that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Possible fixes</h4>
<ul>
<li>igt@vgem_basic@unload:<ul>
<li>bat-rpls-4:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19516/bat-rpls-4/igt@vgem_basic@unload.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13400">i915#13400</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_178463v1/bat-rpls-4/igt@vgem_basic@unload.html">PASS</a></li>
</ul>
</li>
</ul>
<h2>Build changes</h2>
<ul>
<li>Linux: CI_DRM_19516 -&gt; Patchwork_178463v1</li>
</ul>
<p>CI-20190529: 20190529<br />
  CI_DRM_19516: d41695c479e8bb24eb941e5ba916e42784af6f4d @ git://anongit.freedesktop.org/gfx-ci/linux<br />
  IGT_9190: 9190<br />
  Patchwork_178463v1: d41695c479e8bb24eb941e5ba916e42784af6f4d @ git://anongit.freedesktop.org/gfx-ci/linux</p>

</body>
</html>

--===============2328455159920265714==--
