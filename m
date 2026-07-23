Return-Path: <intel-gfx-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8E849C531CB
	for <intel-gfx@archiver.kernel.org>; Thu, 23 Jul 2026 11:39:05 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0D76F10E2A4;
	Thu, 23 Jul 2026 11:39:05 +0000 (UTC)
Received: from 6beec6c84f66 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1862010E2A4;
 Thu, 23 Jul 2026 11:39:03 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============0850578177791351507=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=93_i915=2ECI=2EBAT=3A_success_for_drivers=3A_Improve_memory?=
 =?utf-8?q?_management_for_large_object_allocations_when_i915/shmem_is_used_?=
 =?utf-8?q?with_iommu?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Krzysztof Karas" <krzysztof.karas@intel.com>
Cc: intel-gfx@lists.freedesktop.org
Date: Thu, 23 Jul 2026 11:39:03 -0000
Message-ID: <178480674309.221139.7717261238083306148@6beec6c84f66>
X-Patchwork-Hint: ignore
References: <20260723102542.3245495-1-krzysztof.karas@intel.com>
In-Reply-To: <20260723102542.3245495-1-krzysztof.karas@intel.com>
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

--===============0850578177791351507==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: drivers: Improve memory management for large object allocations when i915/shmem is used with iommu
URL   : https://patchwork.freedesktop.org/series/170988/
State : success

== Summary ==

CI Bug Log - changes from CI_DRM_18885 -> Patchwork_170988v1
====================================================

Summary
-------

  **SUCCESS**

  No regressions found.

  External URL: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_170988v1/index.html

Participating hosts (41 -> 39)
------------------------------

  Missing    (2): bat-dg2-13 fi-snb-2520m 

Known issues
------------

  Here are the changes found in Patchwork_170988v1 that come from known issues:

### IGT changes ###

#### Possible fixes ####

  * igt@i915_selftest@live:
    - fi-bsw-nick:        [INCOMPLETE][1] -> [PASS][2] +1 other test pass
   [1]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18885/fi-bsw-nick/igt@i915_selftest@live.html
   [2]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_170988v1/fi-bsw-nick/igt@i915_selftest@live.html

  * igt@kms_flip@basic-flip-vs-wf_vblank:
    - fi-bsw-n3050:       [DMESG-WARN][3] ([i915#16057]) -> [PASS][4] +1 other test pass
   [3]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18885/fi-bsw-n3050/igt@kms_flip@basic-flip-vs-wf_vblank.html
   [4]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_170988v1/fi-bsw-n3050/igt@kms_flip@basic-flip-vs-wf_vblank.html

  
  [i915#16057]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16057


Build changes
-------------

  * Linux: CI_DRM_18885 -> Patchwork_170988v1

  CI-20190529: 20190529
  CI_DRM_18885: 2c64192f1ad194a53800f6dd8c779d5b4bbc1831 @ git://anongit.freedesktop.org/gfx-ci/linux
  IGT_9020: 9020
  Patchwork_170988v1: 2c64192f1ad194a53800f6dd8c779d5b4bbc1831 @ git://anongit.freedesktop.org/gfx-ci/linux

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_170988v1/index.html

--===============0850578177791351507==
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
<tr><td><b>Series:</b></td><td>drivers: Improve memory management for large object allocations when i915/shmem is used with iommu</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/170988/">https://patchwork.freedesktop.org/series/170988/</a></td></tr>
<tr><td><b>State:</b></td><td>success</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_170988v1/index.html">https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_170988v1/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from CI_DRM_18885 -&gt; Patchwork_170988v1</h1>
<h2>Summary</h2>
<p><strong>SUCCESS</strong></p>
<p>No regressions found.</p>
<p>External URL: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_170988v1/index.html</p>
<h2>Participating hosts (41 -&gt; 39)</h2>
<p>Missing    (2): bat-dg2-13 fi-snb-2520m </p>
<h2>Known issues</h2>
<p>Here are the changes found in Patchwork_170988v1 that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Possible fixes</h4>
<ul>
<li>
<p>igt@i915_selftest@live:</p>
<ul>
<li>fi-bsw-nick:        <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18885/fi-bsw-nick/igt@i915_selftest@live.html">INCOMPLETE</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_170988v1/fi-bsw-nick/igt@i915_selftest@live.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@kms_flip@basic-flip-vs-wf_vblank:</p>
<ul>
<li>fi-bsw-n3050:       <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18885/fi-bsw-n3050/igt@kms_flip@basic-flip-vs-wf_vblank.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16057">i915#16057</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_170988v1/fi-bsw-n3050/igt@kms_flip@basic-flip-vs-wf_vblank.html">PASS</a> +1 other test pass</li>
</ul>
</li>
</ul>
<h2>Build changes</h2>
<ul>
<li>Linux: CI_DRM_18885 -&gt; Patchwork_170988v1</li>
</ul>
<p>CI-20190529: 20190529<br />
  CI_DRM_18885: 2c64192f1ad194a53800f6dd8c779d5b4bbc1831 @ git://anongit.freedesktop.org/gfx-ci/linux<br />
  IGT_9020: 9020<br />
  Patchwork_170988v1: 2c64192f1ad194a53800f6dd8c779d5b4bbc1831 @ git://anongit.freedesktop.org/gfx-ci/linux</p>

</body>
</html>

--===============0850578177791351507==--
