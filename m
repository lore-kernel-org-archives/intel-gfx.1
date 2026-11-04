Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F176F606A31B
	for <intel-gfx@archiver.kernel.org>; Wed,  4 Nov 2026 17:45:39 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 947B010E649;
	Wed,  4 Nov 2026 17:45:39 +0000 (UTC)
Received: from 221881a7231d (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 301E910F177;
 Wed,  4 Nov 2026 17:45:38 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============4781581477015796200=="
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=97_i915=2ECI=2EFull=3A_failure_for_drm/i915/display=3A_add_?=
 =?utf-8?q?and_use_INTEL=5FREG=5FINVALID_macro?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Jani Nikula" <jani.nikula@intel.com>
Cc: intel-gfx@lists.freedesktop.org
Date: Wed, 04 Nov 2026 17:45:38 -0000
Message-ID: <179381433818.118729.1034499790438005128@221881a7231d>
X-Patchwork-Hint: ignore
References: <20261104133757.168881-1-jani.nikula@intel.com>
In-Reply-To: <20261104133757.168881-1-jani.nikula@intel.com>
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
	autolearn=no autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

--===============4781581477015796200==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: drm/i915/display: add and use INTEL_REG_INVALID macro
URL   : https://patchwork.freedesktop.org/series/177728/
State : failure

== Summary ==

CI Bug Log - changes from CI_DRM_19444_full -> Patchwork_177728v1_full
====================================================

Summary
-------

  **FAILURE**

  Serious unknown changes coming with Patchwork_177728v1_full absolutely need to be
  verified manually.
  
  If you think the reported changes have nothing to do with the changes
  introduced in Patchwork_177728v1_full, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them
  to document this new failure mode, which will reduce false positives in CI.

  

Participating hosts (1 -> 0)
------------------------------

  ERROR: It appears as if the changes made in Patchwork_177728v1_full prevented too many machines from booting.

  Missing    (1): pig-kbl-iris 


Changes
-------

  No changes found


Build changes
-------------

  * Linux: CI_DRM_19444 -> Patchwork_177728v1

  CI_DRM_19444: c0cb7e7c00c9563d72c1e1b08fac139a57fd0ebf @ git://anongit.freedesktop.org/gfx-ci/linux
  Patchwork_177728v1: c0cb7e7c00c9563d72c1e1b08fac139a57fd0ebf @ git://anongit.freedesktop.org/gfx-ci/linux
  piglit_4509: fdc5a4ca11124ab8413c7988896eec4c97336694 @ git://anongit.freedesktop.org/piglit

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_177728v1/index.html

--===============4781581477015796200==
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
<tr><td><b>Series:</b></td><td>drm/i915/display: add and use INTEL_REG_INVALID macro</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/177728/">https://patchwork.freedesktop.org/series/177728/</a></td></tr>
<tr><td><b>State:</b></td><td>failure</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_177728v1/index.html">https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_177728v1/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from CI_DRM_19444_full -&gt; Patchwork_177728v1_full</h1>
<h2>Summary</h2>
<p><strong>FAILURE</strong></p>
<p>Serious unknown changes coming with Patchwork_177728v1_full absolutely need to be<br />
  verified manually.</p>
<p>If you think the reported changes have nothing to do with the changes<br />
  introduced in Patchwork_177728v1_full, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them<br />
  to document this new failure mode, which will reduce false positives in CI.</p>
<h2>Participating hosts (1 -&gt; 0)</h2>
<p>ERROR: It appears as if the changes made in Patchwork_177728v1_full prevented too many machines from booting.</p>
<p>Missing    (1): pig-kbl-iris </p>
<h2>Changes</h2>
<p>No changes found</p>
<h2>Build changes</h2>
<ul>
<li>Linux: CI_DRM_19444 -&gt; Patchwork_177728v1</li>
</ul>
<p>CI_DRM_19444: c0cb7e7c00c9563d72c1e1b08fac139a57fd0ebf @ git://anongit.freedesktop.org/gfx-ci/linux<br />
  Patchwork_177728v1: c0cb7e7c00c9563d72c1e1b08fac139a57fd0ebf @ git://anongit.freedesktop.org/gfx-ci/linux<br />
  piglit_4509: fdc5a4ca11124ab8413c7988896eec4c97336694 @ git://anongit.freedesktop.org/piglit</p>

</body>
</html>

--===============4781581477015796200==--
