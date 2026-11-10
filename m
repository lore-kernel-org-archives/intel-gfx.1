Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DC6A8606A31C
	for <intel-gfx@archiver.kernel.org>; Tue, 10 Nov 2026 00:12:58 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4549910E27D;
	Tue, 10 Nov 2026 00:12:58 +0000 (UTC)
Received: from 9ac1b63fe3ea (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DFC5010E211;
 Tue, 10 Nov 2026 00:12:56 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============9181678981733730819=="
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=93_i915=2ECI=2EBAT=3A_success_for_Add_offsetofp=28=29_and_o?=
 =?utf-8?q?ffsetofendp=28=29_for_pointer_arithmetic?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Bence Csokas" <bence.csokas@arm.com>
Cc: intel-gfx@lists.freedesktop.org
Date: Tue, 10 Nov 2026 00:12:56 -0000
Message-ID: <179426957690.11.9729519975485579764@9ac1b63fe3ea>
X-Patchwork-Hint: ignore
References: <20261105-offsetof-v1-0-4153f5c10edc@arm.com>
In-Reply-To: <20261105-offsetof-v1-0-4153f5c10edc@arm.com>
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

--===============9181678981733730819==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: Add offsetofp() and offsetofendp() for pointer arithmetic
URL   : https://patchwork.freedesktop.org/series/178111/
State : success

== Summary ==

CI Bug Log - changes from CI_DRM_19476 -> Patchwork_178111v1
====================================================

Summary
-------

  **SUCCESS**

  No regressions found.

  External URL: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_178111v1/index.html

Participating hosts (40 -> 39)
------------------------------

  Missing    (1): bat-dg2-13 

Known issues
------------

  Here are the changes found in Patchwork_178111v1 that come from known issues:

### IGT changes ###

#### Possible fixes ####

  * igt@kms_pm_rpm@basic-pci-d3-state:
    - bat-apl-1:          [SKIP][1] ([i915#17764]) -> [PASS][2]
   [1]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19476/bat-apl-1/igt@kms_pm_rpm@basic-pci-d3-state.html
   [2]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_178111v1/bat-apl-1/igt@kms_pm_rpm@basic-pci-d3-state.html

  * igt@kms_pm_rpm@basic-rte:
    - bat-apl-1:          [FAIL][3] ([i915#17795]) -> [PASS][4]
   [3]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19476/bat-apl-1/igt@kms_pm_rpm@basic-rte.html
   [4]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_178111v1/bat-apl-1/igt@kms_pm_rpm@basic-rte.html

  
  [i915#17764]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17764
  [i915#17795]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17795


Build changes
-------------

  * Linux: CI_DRM_19476 -> Patchwork_178111v1

  CI-20190529: 20190529
  CI_DRM_19476: 3793efe0f97c23fef047dc5551c5dad092128210 @ git://anongit.freedesktop.org/gfx-ci/linux
  IGT_9182: 9182
  Patchwork_178111v1: 3793efe0f97c23fef047dc5551c5dad092128210 @ git://anongit.freedesktop.org/gfx-ci/linux

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_178111v1/index.html

--===============9181678981733730819==
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
<tr><td><b>Series:</b></td><td>Add offsetofp() and offsetofendp() for pointer arithmetic</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/178111/">https://patchwork.freedesktop.org/series/178111/</a></td></tr>
<tr><td><b>State:</b></td><td>success</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_178111v1/index.html">https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_178111v1/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from CI_DRM_19476 -&gt; Patchwork_178111v1</h1>
<h2>Summary</h2>
<p><strong>SUCCESS</strong></p>
<p>No regressions found.</p>
<p>External URL: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_178111v1/index.html</p>
<h2>Participating hosts (40 -&gt; 39)</h2>
<p>Missing    (1): bat-dg2-13 </p>
<h2>Known issues</h2>
<p>Here are the changes found in Patchwork_178111v1 that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Possible fixes</h4>
<ul>
<li>
<p>igt@kms_pm_rpm@basic-pci-d3-state:</p>
<ul>
<li>bat-apl-1:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19476/bat-apl-1/igt@kms_pm_rpm@basic-pci-d3-state.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17764">i915#17764</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_178111v1/bat-apl-1/igt@kms_pm_rpm@basic-pci-d3-state.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_pm_rpm@basic-rte:</p>
<ul>
<li>bat-apl-1:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19476/bat-apl-1/igt@kms_pm_rpm@basic-rte.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17795">i915#17795</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_178111v1/bat-apl-1/igt@kms_pm_rpm@basic-rte.html">PASS</a></li>
</ul>
</li>
</ul>
<h2>Build changes</h2>
<ul>
<li>Linux: CI_DRM_19476 -&gt; Patchwork_178111v1</li>
</ul>
<p>CI-20190529: 20190529<br />
  CI_DRM_19476: 3793efe0f97c23fef047dc5551c5dad092128210 @ git://anongit.freedesktop.org/gfx-ci/linux<br />
  IGT_9182: 9182<br />
  Patchwork_178111v1: 3793efe0f97c23fef047dc5551c5dad092128210 @ git://anongit.freedesktop.org/gfx-ci/linux</p>

</body>
</html>

--===============9181678981733730819==--
