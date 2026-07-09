Return-Path: <intel-gfx-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CA723C43458
	for <intel-gfx@archiver.kernel.org>; Thu,  9 Jul 2026 08:23:11 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4444A10E040;
	Thu,  9 Jul 2026 08:23:11 +0000 (UTC)
Received: from 6beec6c84f66 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 145CC10E039;
 Thu,  9 Jul 2026 08:23:10 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============3283321921892373624=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=97_i915=2ECI=2EBAT=3A_failure_for_drivers=3A_Improve_memory?=
 =?utf-8?q?_management_for_large_object_allocations_when_i915/shmem_is_used_?=
 =?utf-8?q?with_iommu_=28rev4=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Krzysztof Karas" <krzysztof.karas@intel.com>
Cc: intel-gfx@lists.freedesktop.org
Date: Thu, 09 Jul 2026 08:23:10 -0000
Message-ID: <178358539007.168859.3944686766515421096@6beec6c84f66>
X-Patchwork-Hint: ignore
References: <20260701104437.236979-1-krzysztof.karas@intel.com>
In-Reply-To: <20260701104437.236979-1-krzysztof.karas@intel.com>
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

--===============3283321921892373624==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: drivers: Improve memory management for large object allocations when i915/shmem is used with iommu (rev4)
URL   : https://patchwork.freedesktop.org/series/169199/
State : failure

== Summary ==

CI Bug Log - changes from CI_DRM_18791 -> Patchwork_169199v4
====================================================

Summary
-------

  **FAILURE**

  Serious unknown changes coming with Patchwork_169199v4 absolutely need to be
  verified manually.
  
  If you think the reported changes have nothing to do with the changes
  introduced in Patchwork_169199v4, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them
  to document this new failure mode, which will reduce false positives in CI.

  External URL: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_169199v4/index.html

Participating hosts (42 -> 40)
------------------------------

  Missing    (2): bat-dg2-13 fi-snb-2520m 

Possible new issues
-------------------

  Here are the unknown changes that may have been introduced in Patchwork_169199v4:

### IGT changes ###

#### Possible regressions ####

  * igt@i915_pm_rpm@module-reload:
    - bat-arlh-3:         [PASS][1] -> [INCOMPLETE][2]
   [1]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18791/bat-arlh-3/igt@i915_pm_rpm@module-reload.html
   [2]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_169199v4/bat-arlh-3/igt@i915_pm_rpm@module-reload.html

  


Build changes
-------------

  * Linux: CI_DRM_18791 -> Patchwork_169199v4

  CI-20190529: 20190529
  CI_DRM_18791: 031615563ea8f1acce065bea91fe6ce6b0ce965c @ git://anongit.freedesktop.org/gfx-ci/linux
  IGT_8994: 59469572ae481848d6bd469242aef7c5333b39ad @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
  Patchwork_169199v4: 031615563ea8f1acce065bea91fe6ce6b0ce965c @ git://anongit.freedesktop.org/gfx-ci/linux

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_169199v4/index.html

--===============3283321921892373624==
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
<tr><td><b>Series:</b></td><td>drivers: Improve memory management for large object allocations when i915/shmem is used with iommu (rev4)</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/169199/">https://patchwork.freedesktop.org/series/169199/</a></td></tr>
<tr><td><b>State:</b></td><td>failure</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_169199v4/index.html">https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_169199v4/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from CI_DRM_18791 -&gt; Patchwork_169199v4</h1>
<h2>Summary</h2>
<p><strong>FAILURE</strong></p>
<p>Serious unknown changes coming with Patchwork_169199v4 absolutely need to be<br />
  verified manually.</p>
<p>If you think the reported changes have nothing to do with the changes<br />
  introduced in Patchwork_169199v4, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them<br />
  to document this new failure mode, which will reduce false positives in CI.</p>
<p>External URL: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_169199v4/index.html</p>
<h2>Participating hosts (42 -&gt; 40)</h2>
<p>Missing    (2): bat-dg2-13 fi-snb-2520m </p>
<h2>Possible new issues</h2>
<p>Here are the unknown changes that may have been introduced in Patchwork_169199v4:</p>
<h3>IGT changes</h3>
<h4>Possible regressions</h4>
<ul>
<li>igt@i915_pm_rpm@module-reload:<ul>
<li>bat-arlh-3:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18791/bat-arlh-3/igt@i915_pm_rpm@module-reload.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_169199v4/bat-arlh-3/igt@i915_pm_rpm@module-reload.html">INCOMPLETE</a></li>
</ul>
</li>
</ul>
<h2>Build changes</h2>
<ul>
<li>Linux: CI_DRM_18791 -&gt; Patchwork_169199v4</li>
</ul>
<p>CI-20190529: 20190529<br />
  CI_DRM_18791: 031615563ea8f1acce065bea91fe6ce6b0ce965c @ git://anongit.freedesktop.org/gfx-ci/linux<br />
  IGT_8994: 59469572ae481848d6bd469242aef7c5333b39ad @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git<br />
  Patchwork_169199v4: 031615563ea8f1acce065bea91fe6ce6b0ce965c @ git://anongit.freedesktop.org/gfx-ci/linux</p>

</body>
</html>

--===============3283321921892373624==--
