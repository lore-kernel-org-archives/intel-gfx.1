Return-Path: <intel-gfx-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 26C22CD8CB9
	for <intel-gfx@archiver.kernel.org>; Wed, 10 Jun 2026 09:43:47 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B6A5F10E849;
	Wed, 10 Jun 2026 09:43:46 +0000 (UTC)
Received: from 6beec6c84f66 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 054E210E849;
 Wed, 10 Jun 2026 09:43:46 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============4236671856687919959=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=97_i915=2ECI=2EBAT=3A_failure_for_drm/i915/scaler=3A_alloca?=
 =?utf-8?q?tion_cleanup?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: =?utf-8?q?Micha=C5=82_Grzelak?= <michal.grzelak@intel.com>
Cc: intel-gfx@lists.freedesktop.org
Date: Wed, 10 Jun 2026 09:43:46 -0000
Message-ID: <178108462601.64047.2844339123030036499@6beec6c84f66>
X-Patchwork-Hint: ignore
References: <20260609231217.208357-1-michal.grzelak@intel.com>
In-Reply-To: <20260609231217.208357-1-michal.grzelak@intel.com>
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

--===============4236671856687919959==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: drm/i915/scaler: allocation cleanup
URL   : https://patchwork.freedesktop.org/series/168207/
State : failure

== Summary ==

CI Bug Log - changes from CI_DRM_18653 -> Patchwork_168207v1
====================================================

Summary
-------

  **FAILURE**

  Serious unknown changes coming with Patchwork_168207v1 absolutely need to be
  verified manually.
  
  If you think the reported changes have nothing to do with the changes
  introduced in Patchwork_168207v1, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them
  to document this new failure mode, which will reduce false positives in CI.

  External URL: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_168207v1/index.html

Participating hosts (42 -> 39)
------------------------------

  Missing    (3): bat-dg2-13 fi-glk-j4005 fi-snb-2520m 

Possible new issues
-------------------

  Here are the unknown changes that may have been introduced in Patchwork_168207v1:

### IGT changes ###

#### Possible regressions ####

  * igt@i915_selftest@live:
    - bat-twl-1:          [PASS][1] -> [DMESG-FAIL][2] +1 other test dmesg-fail
   [1]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18653/bat-twl-1/igt@i915_selftest@live.html
   [2]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_168207v1/bat-twl-1/igt@i915_selftest@live.html

  


Build changes
-------------

  * Linux: CI_DRM_18653 -> Patchwork_168207v1

  CI-20190529: 20190529
  CI_DRM_18653: 724e06af260b571e2d970d4a806ae3d620ff0b7a @ git://anongit.freedesktop.org/gfx-ci/linux
  IGT_8956: 8956
  Patchwork_168207v1: 724e06af260b571e2d970d4a806ae3d620ff0b7a @ git://anongit.freedesktop.org/gfx-ci/linux

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_168207v1/index.html

--===============4236671856687919959==
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
<tr><td><b>Series:</b></td><td>drm/i915/scaler: allocation cleanup</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/168207/">https://patchwork.freedesktop.org/series/168207/</a></td></tr>
<tr><td><b>State:</b></td><td>failure</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_168207v1/index.html">https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_168207v1/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from CI_DRM_18653 -&gt; Patchwork_168207v1</h1>
<h2>Summary</h2>
<p><strong>FAILURE</strong></p>
<p>Serious unknown changes coming with Patchwork_168207v1 absolutely need to be<br />
  verified manually.</p>
<p>If you think the reported changes have nothing to do with the changes<br />
  introduced in Patchwork_168207v1, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them<br />
  to document this new failure mode, which will reduce false positives in CI.</p>
<p>External URL: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_168207v1/index.html</p>
<h2>Participating hosts (42 -&gt; 39)</h2>
<p>Missing    (3): bat-dg2-13 fi-glk-j4005 fi-snb-2520m </p>
<h2>Possible new issues</h2>
<p>Here are the unknown changes that may have been introduced in Patchwork_168207v1:</p>
<h3>IGT changes</h3>
<h4>Possible regressions</h4>
<ul>
<li>igt@i915_selftest@live:<ul>
<li>bat-twl-1:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18653/bat-twl-1/igt@i915_selftest@live.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_168207v1/bat-twl-1/igt@i915_selftest@live.html">DMESG-FAIL</a> +1 other test dmesg-fail</li>
</ul>
</li>
</ul>
<h2>Build changes</h2>
<ul>
<li>Linux: CI_DRM_18653 -&gt; Patchwork_168207v1</li>
</ul>
<p>CI-20190529: 20190529<br />
  CI_DRM_18653: 724e06af260b571e2d970d4a806ae3d620ff0b7a @ git://anongit.freedesktop.org/gfx-ci/linux<br />
  IGT_8956: 8956<br />
  Patchwork_168207v1: 724e06af260b571e2d970d4a806ae3d620ff0b7a @ git://anongit.freedesktop.org/gfx-ci/linux</p>

</body>
</html>

--===============4236671856687919959==--
