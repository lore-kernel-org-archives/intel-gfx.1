Return-Path: <intel-gfx-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 584E0C5B56A
	for <intel-gfx@archiver.kernel.org>; Wed, 12 Aug 2026 12:30:41 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id ED73C10EFA2;
	Wed, 12 Aug 2026 12:30:40 +0000 (UTC)
Received: from 61270ab9df2a (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6B38110EFA2;
 Wed, 12 Aug 2026 12:30:39 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============8470989978511489478=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=97_i915=2ECI=2EBAT=3A_failure_for_drm/i915/display=3A_Clear?=
 =?utf-8?q?_SEL=5FFETCH=5FPLANE=5FCTL_on_plane_disable?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Garg, Nemesa" <nemesa.garg@intel.com>
Cc: intel-gfx@lists.freedesktop.org
Date: Wed, 12 Aug 2026 12:30:39 -0000
Message-ID: <178653783943.43282.8548027765752072827@61270ab9df2a>
X-Patchwork-Hint: ignore
References: <20260812094547.1808459-1-nemesa.garg@intel.com>
In-Reply-To: <20260812094547.1808459-1-nemesa.garg@intel.com>
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

--===============8470989978511489478==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: drm/i915/display: Clear SEL_FETCH_PLANE_CTL on plane disable
URL   : https://patchwork.freedesktop.org/series/172062/
State : failure

== Summary ==

CI Bug Log - changes from CI_DRM_18982 -> Patchwork_172062v1
====================================================

Summary
-------

  **FAILURE**

  Serious unknown changes coming with Patchwork_172062v1 absolutely need to be
  verified manually.
  
  If you think the reported changes have nothing to do with the changes
  introduced in Patchwork_172062v1, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them
  to document this new failure mode, which will reduce false positives in CI.

  External URL: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_172062v1/index.html

Participating hosts (37 -> 34)
------------------------------

  Missing    (3): fi-hsw-4770 fi-snb-2520m bat-dg2-13 

Possible new issues
-------------------

  Here are the unknown changes that may have been introduced in Patchwork_172062v1:

### IGT changes ###

#### Possible regressions ####

  * igt@i915_selftest@live@client:
    - bat-arlh-3:         [PASS][1] -> [INCOMPLETE][2] +1 other test incomplete
   [1]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18982/bat-arlh-3/igt@i915_selftest@live@client.html
   [2]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_172062v1/bat-arlh-3/igt@i915_selftest@live@client.html

  


Build changes
-------------

  * Linux: CI_DRM_18982 -> Patchwork_172062v1

  CI-20190529: 20190529
  CI_DRM_18982: 96ddbb14986632af742523e68f90d51c138c57f0 @ git://anongit.freedesktop.org/gfx-ci/linux
  IGT_9052: 9052
  Patchwork_172062v1: 96ddbb14986632af742523e68f90d51c138c57f0 @ git://anongit.freedesktop.org/gfx-ci/linux

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_172062v1/index.html

--===============8470989978511489478==
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
<tr><td><b>Series:</b></td><td>drm/i915/display: Clear SEL_FETCH_PLANE_CTL on plane disable</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/172062/">https://patchwork.freedesktop.org/series/172062/</a></td></tr>
<tr><td><b>State:</b></td><td>failure</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_172062v1/index.html">https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_172062v1/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from CI_DRM_18982 -&gt; Patchwork_172062v1</h1>
<h2>Summary</h2>
<p><strong>FAILURE</strong></p>
<p>Serious unknown changes coming with Patchwork_172062v1 absolutely need to be<br />
  verified manually.</p>
<p>If you think the reported changes have nothing to do with the changes<br />
  introduced in Patchwork_172062v1, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them<br />
  to document this new failure mode, which will reduce false positives in CI.</p>
<p>External URL: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_172062v1/index.html</p>
<h2>Participating hosts (37 -&gt; 34)</h2>
<p>Missing    (3): fi-hsw-4770 fi-snb-2520m bat-dg2-13 </p>
<h2>Possible new issues</h2>
<p>Here are the unknown changes that may have been introduced in Patchwork_172062v1:</p>
<h3>IGT changes</h3>
<h4>Possible regressions</h4>
<ul>
<li>igt@i915_selftest@live@client:<ul>
<li>bat-arlh-3:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18982/bat-arlh-3/igt@i915_selftest@live@client.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_172062v1/bat-arlh-3/igt@i915_selftest@live@client.html">INCOMPLETE</a> +1 other test incomplete</li>
</ul>
</li>
</ul>
<h2>Build changes</h2>
<ul>
<li>Linux: CI_DRM_18982 -&gt; Patchwork_172062v1</li>
</ul>
<p>CI-20190529: 20190529<br />
  CI_DRM_18982: 96ddbb14986632af742523e68f90d51c138c57f0 @ git://anongit.freedesktop.org/gfx-ci/linux<br />
  IGT_9052: 9052<br />
  Patchwork_172062v1: 96ddbb14986632af742523e68f90d51c138c57f0 @ git://anongit.freedesktop.org/gfx-ci/linux</p>

</body>
</html>

--===============8470989978511489478==--
