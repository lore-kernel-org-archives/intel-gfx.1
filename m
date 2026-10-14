Return-Path: <intel-gfx-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EA580CC6B1D
	for <intel-gfx@archiver.kernel.org>; Wed, 14 Oct 2026 15:20:47 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7055B10FDF6;
	Wed, 14 Oct 2026 15:20:47 +0000 (UTC)
Received: from 221881a7231d (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8E2AC10FDF5;
 Wed, 14 Oct 2026 15:20:46 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============6416320630690901668=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=97_i915=2ECI=2EBAT=3A_failure_for_drm/i915/psr=3A_Send_a_fr?=
 =?utf-8?q?ame_change_notification_for_async_flips?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Vladyslav Yamkovyi via B4 Relay" <devnull+hex.aleph0.ai@kernel.org>
Cc: intel-gfx@lists.freedesktop.org
Date: Wed, 14 Oct 2026 15:20:46 -0000
Message-ID: <179199124657.24343.17027333833125108417@221881a7231d>
X-Patchwork-Hint: ignore
References: <20261013-fix-psr-async-trans-push-v1-1-ee79bf31b66f@aleph0.ai>
In-Reply-To: <20261013-fix-psr-async-trans-push-v1-1-ee79bf31b66f@aleph0.ai>
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

--===============6416320630690901668==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: drm/i915/psr: Send a frame change notification for async flips
URL   : https://patchwork.freedesktop.org/series/176137/
State : failure

== Summary ==

CI Bug Log - changes from CI_DRM_19338 -> Patchwork_176137v1
====================================================

Summary
-------

  **FAILURE**

  Serious unknown changes coming with Patchwork_176137v1 absolutely need to be
  verified manually.
  
  If you think the reported changes have nothing to do with the changes
  introduced in Patchwork_176137v1, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them
  to document this new failure mode, which will reduce false positives in CI.

  External URL: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_176137v1/index.html

Participating hosts (39 -> 38)
------------------------------

  Missing    (1): bat-dg2-13 

Possible new issues
-------------------

  Here are the unknown changes that may have been introduced in Patchwork_176137v1:

### CI changes ###

#### Possible regressions ####

  * boot:
    - fi-bsw-n3050:       [PASS][1] -> [FAIL][2]
   [1]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19338/fi-bsw-n3050/boot.html
   [2]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_176137v1/fi-bsw-n3050/boot.html

  


Build changes
-------------

  * Linux: CI_DRM_19338 -> Patchwork_176137v1

  CI-20190529: 20190529
  CI_DRM_19338: e6ef773b81a0b833e4ee3cf4ccc4bc472397db7e @ git://anongit.freedesktop.org/gfx-ci/linux
  IGT_9146: 9e6040664f13f0767bb4d1028b422b7ee00425dc @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
  Patchwork_176137v1: e6ef773b81a0b833e4ee3cf4ccc4bc472397db7e @ git://anongit.freedesktop.org/gfx-ci/linux

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_176137v1/index.html

--===============6416320630690901668==
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
<tr><td><b>Series:</b></td><td>drm/i915/psr: Send a frame change notification for async flips</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/176137/">https://patchwork.freedesktop.org/series/176137/</a></td></tr>
<tr><td><b>State:</b></td><td>failure</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_176137v1/index.html">https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_176137v1/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from CI_DRM_19338 -&gt; Patchwork_176137v1</h1>
<h2>Summary</h2>
<p><strong>FAILURE</strong></p>
<p>Serious unknown changes coming with Patchwork_176137v1 absolutely need to be<br />
  verified manually.</p>
<p>If you think the reported changes have nothing to do with the changes<br />
  introduced in Patchwork_176137v1, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them<br />
  to document this new failure mode, which will reduce false positives in CI.</p>
<p>External URL: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_176137v1/index.html</p>
<h2>Participating hosts (39 -&gt; 38)</h2>
<p>Missing    (1): bat-dg2-13 </p>
<h2>Possible new issues</h2>
<p>Here are the unknown changes that may have been introduced in Patchwork_176137v1:</p>
<h3>CI changes</h3>
<h4>Possible regressions</h4>
<ul>
<li>boot:<ul>
<li>fi-bsw-n3050:       <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19338/fi-bsw-n3050/boot.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_176137v1/fi-bsw-n3050/boot.html">FAIL</a></li>
</ul>
</li>
</ul>
<h2>Build changes</h2>
<ul>
<li>Linux: CI_DRM_19338 -&gt; Patchwork_176137v1</li>
</ul>
<p>CI-20190529: 20190529<br />
  CI_DRM_19338: e6ef773b81a0b833e4ee3cf4ccc4bc472397db7e @ git://anongit.freedesktop.org/gfx-ci/linux<br />
  IGT_9146: 9e6040664f13f0767bb4d1028b422b7ee00425dc @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git<br />
  Patchwork_176137v1: e6ef773b81a0b833e4ee3cf4ccc4bc472397db7e @ git://anongit.freedesktop.org/gfx-ci/linux</p>

</body>
</html>

--===============6416320630690901668==--
