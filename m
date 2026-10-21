Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D08FB606A319
	for <intel-gfx@archiver.kernel.org>; Wed, 21 Oct 2026 13:26:39 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6BD0D10F9B5;
	Wed, 21 Oct 2026 13:26:39 +0000 (UTC)
Received: from 221881a7231d (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5269B10E294;
 Wed, 21 Oct 2026 13:26:38 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============6823651010266633030=="
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=97_i915=2ECI=2EBAT=3A_failure_for_series_starting_with_=5Bv?=
 =?utf-8?q?6=2C1/2=5D_gpu/buddy=3A_restore_two-pass_clear/dirty_guard_for_ra?=
 =?utf-8?q?nge-biased_allocation?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Arunpravin Paneer Selvam" <arunpravin.paneerselvam@amd.com>
Cc: intel-gfx@lists.freedesktop.org
Date: Wed, 21 Oct 2026 13:26:38 -0000
Message-ID: <179258919833.52651.7761789063632416186@221881a7231d>
X-Patchwork-Hint: ignore
References: <20261021121813.1820345-1-arunpravin.paneerselvam@amd.com>
In-Reply-To: <20261021121813.1820345-1-arunpravin.paneerselvam@amd.com>
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

--===============6823651010266633030==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: series starting with [v6,1/2] gpu/buddy: restore two-pass clear/dirty guard for range-biased allocation
URL   : https://patchwork.freedesktop.org/series/176558/
State : failure

== Summary ==

CI Bug Log - changes from CI_DRM_19374 -> Patchwork_176558v1
====================================================

Summary
-------

  **FAILURE**

  Serious unknown changes coming with Patchwork_176558v1 absolutely need to be
  verified manually.
  
  If you think the reported changes have nothing to do with the changes
  introduced in Patchwork_176558v1, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them
  to document this new failure mode, which will reduce false positives in CI.

  External URL: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_176558v1/index.html

Participating hosts (40 -> 39)
------------------------------

  Missing    (1): bat-dg2-13 

Possible new issues
-------------------

  Here are the unknown changes that may have been introduced in Patchwork_176558v1:

### IGT changes ###

#### Possible regressions ####

  * igt@i915_selftest@live:
    - fi-bsw-n3050:       [PASS][1] -> [ABORT][2] +1 other test abort
   [1]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19374/fi-bsw-n3050/igt@i915_selftest@live.html
   [2]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_176558v1/fi-bsw-n3050/igt@i915_selftest@live.html

  


Build changes
-------------

  * Linux: CI_DRM_19374 -> Patchwork_176558v1

  CI-20190529: 20190529
  CI_DRM_19374: 59808d4b3a8e9cb4db43b9162aa08f35956bb447 @ git://anongit.freedesktop.org/gfx-ci/linux
  IGT_9156: 9156
  Patchwork_176558v1: 59808d4b3a8e9cb4db43b9162aa08f35956bb447 @ git://anongit.freedesktop.org/gfx-ci/linux

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_176558v1/index.html

--===============6823651010266633030==
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
<tr><td><b>Series:</b></td><td>series starting with [v6,1/2] gpu/buddy: restore two-pass clear/dirty guard for range-biased allocation</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/176558/">https://patchwork.freedesktop.org/series/176558/</a></td></tr>
<tr><td><b>State:</b></td><td>failure</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_176558v1/index.html">https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_176558v1/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from CI_DRM_19374 -&gt; Patchwork_176558v1</h1>
<h2>Summary</h2>
<p><strong>FAILURE</strong></p>
<p>Serious unknown changes coming with Patchwork_176558v1 absolutely need to be<br />
  verified manually.</p>
<p>If you think the reported changes have nothing to do with the changes<br />
  introduced in Patchwork_176558v1, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them<br />
  to document this new failure mode, which will reduce false positives in CI.</p>
<p>External URL: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_176558v1/index.html</p>
<h2>Participating hosts (40 -&gt; 39)</h2>
<p>Missing    (1): bat-dg2-13 </p>
<h2>Possible new issues</h2>
<p>Here are the unknown changes that may have been introduced in Patchwork_176558v1:</p>
<h3>IGT changes</h3>
<h4>Possible regressions</h4>
<ul>
<li>igt@i915_selftest@live:<ul>
<li>fi-bsw-n3050:       <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19374/fi-bsw-n3050/igt@i915_selftest@live.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_176558v1/fi-bsw-n3050/igt@i915_selftest@live.html">ABORT</a> +1 other test abort</li>
</ul>
</li>
</ul>
<h2>Build changes</h2>
<ul>
<li>Linux: CI_DRM_19374 -&gt; Patchwork_176558v1</li>
</ul>
<p>CI-20190529: 20190529<br />
  CI_DRM_19374: 59808d4b3a8e9cb4db43b9162aa08f35956bb447 @ git://anongit.freedesktop.org/gfx-ci/linux<br />
  IGT_9156: 9156<br />
  Patchwork_176558v1: 59808d4b3a8e9cb4db43b9162aa08f35956bb447 @ git://anongit.freedesktop.org/gfx-ci/linux</p>

</body>
</html>

--===============6823651010266633030==--
