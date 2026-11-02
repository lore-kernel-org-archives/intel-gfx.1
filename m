Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 93C8C606A324
	for <intel-gfx@archiver.kernel.org>; Mon,  2 Nov 2026 10:59:48 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2B61A10ECEB;
	Mon,  2 Nov 2026 10:59:48 +0000 (UTC)
Received: from 221881a7231d (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C66DA10ED0B;
 Mon,  2 Nov 2026 10:59:46 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============0700085556192616648=="
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=93_i915=2ECI=2EBAT=3A_success_for_drm/i915/display=3A_Run_t?=
 =?utf-8?q?he_selective_fetch_update_after_the_crtc_checks?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Kahola, Mika" <mika.kahola@intel.com>
Cc: intel-gfx@lists.freedesktop.org
Date: Mon, 02 Nov 2026 10:59:46 -0000
Message-ID: <179361718680.102032.13029808709058318568@221881a7231d>
X-Patchwork-Hint: ignore
References: <20261102080705.2027571-1-mika.kahola@intel.com>
In-Reply-To: <20261102080705.2027571-1-mika.kahola@intel.com>
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

--===============0700085556192616648==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: drm/i915/display: Run the selective fetch update after the crtc checks
URL   : https://patchwork.freedesktop.org/series/177418/
State : success

== Summary ==

CI Bug Log - changes from CI_DRM_19426 -> Patchwork_177418v1
====================================================

Summary
-------

  **SUCCESS**

  No regressions found.

  External URL: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_177418v1/index.html

Participating hosts (39 -> 37)
------------------------------

  Missing    (2): bat-dg2-13 bat-adls-6 

Known issues
------------

  Here are the changes found in Patchwork_177418v1 that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@runner@aborted:
    - fi-bsw-n3050:       NOTRUN -> [FAIL][1] ([i915#17747])
   [1]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_177418v1/fi-bsw-n3050/igt@runner@aborted.html

  
  [i915#17747]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17747


Build changes
-------------

  * Linux: CI_DRM_19426 -> Patchwork_177418v1

  CI-20190529: 20190529
  CI_DRM_19426: f286613c3d586fb61b669fbab700fddd2be584e7 @ git://anongit.freedesktop.org/gfx-ci/linux
  IGT_9173: 9173
  Patchwork_177418v1: f286613c3d586fb61b669fbab700fddd2be584e7 @ git://anongit.freedesktop.org/gfx-ci/linux

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_177418v1/index.html

--===============0700085556192616648==
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
<tr><td><b>Series:</b></td><td>drm/i915/display: Run the selective fetch update after the crtc checks</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/177418/">https://patchwork.freedesktop.org/series/177418/</a></td></tr>
<tr><td><b>State:</b></td><td>success</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_177418v1/index.html">https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_177418v1/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from CI_DRM_19426 -&gt; Patchwork_177418v1</h1>
<h2>Summary</h2>
<p><strong>SUCCESS</strong></p>
<p>No regressions found.</p>
<p>External URL: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_177418v1/index.html</p>
<h2>Participating hosts (39 -&gt; 37)</h2>
<p>Missing    (2): bat-dg2-13 bat-adls-6 </p>
<h2>Known issues</h2>
<p>Here are the changes found in Patchwork_177418v1 that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>igt@runner@aborted:<ul>
<li>fi-bsw-n3050:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_177418v1/fi-bsw-n3050/igt@runner@aborted.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17747">i915#17747</a>)</li>
</ul>
</li>
</ul>
<h2>Build changes</h2>
<ul>
<li>Linux: CI_DRM_19426 -&gt; Patchwork_177418v1</li>
</ul>
<p>CI-20190529: 20190529<br />
  CI_DRM_19426: f286613c3d586fb61b669fbab700fddd2be584e7 @ git://anongit.freedesktop.org/gfx-ci/linux<br />
  IGT_9173: 9173<br />
  Patchwork_177418v1: f286613c3d586fb61b669fbab700fddd2be584e7 @ git://anongit.freedesktop.org/gfx-ci/linux</p>

</body>
</html>

--===============0700085556192616648==--
