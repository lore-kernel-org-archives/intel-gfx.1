Return-Path: <intel-gfx-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 002BACD6E57
	for <intel-gfx@archiver.kernel.org>; Tue,  2 Jun 2026 10:54:21 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8EA6610EF0E;
	Tue,  2 Jun 2026 10:54:21 +0000 (UTC)
Received: from 6beec6c84f66 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 814B610EF0E;
 Tue,  2 Jun 2026 10:54:20 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============8902327362964743473=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=97_i915=2ECI=2EBAT=3A_failure_for_drm/=7Bi915=2C_xe=7D/pani?=
 =?utf-8?q?c=3A_drop_dependency_on_struct_intel=5Fframebuffer?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Jani Nikula" <jani.nikula@intel.com>
Cc: intel-gfx@lists.freedesktop.org
Date: Tue, 02 Jun 2026 10:54:20 -0000
Message-ID: <178039766052.34230.2620512787732120169@6beec6c84f66>
X-Patchwork-Hint: ignore
References: <cover.1780394867.git.jani.nikula@intel.com>
In-Reply-To: <cover.1780394867.git.jani.nikula@intel.com>
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

--===============8902327362964743473==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: drm/{i915, xe}/panic: drop dependency on struct intel_framebuffer
URL   : https://patchwork.freedesktop.org/series/167731/
State : failure

== Summary ==

CI Bug Log - changes from CI_DRM_18602 -> Patchwork_167731v1
====================================================

Summary
-------

  **FAILURE**

  Serious unknown changes coming with Patchwork_167731v1 absolutely need to be
  verified manually.
  
  If you think the reported changes have nothing to do with the changes
  introduced in Patchwork_167731v1, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them
  to document this new failure mode, which will reduce false positives in CI.

  External URL: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_167731v1/index.html

Participating hosts (42 -> 39)
------------------------------

  Missing    (3): bat-dg2-13 fi-snb-2520m bat-adls-6 

Possible new issues
-------------------

  Here are the unknown changes that may have been introduced in Patchwork_167731v1:

### IGT changes ###

#### Possible regressions ####

  * igt@kms_flip@basic-flip-vs-wf_vblank:
    - fi-bsw-n3050:       [PASS][1] -> [DMESG-WARN][2] +5 other tests dmesg-warn
   [1]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18602/fi-bsw-n3050/igt@kms_flip@basic-flip-vs-wf_vblank.html
   [2]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_167731v1/fi-bsw-n3050/igt@kms_flip@basic-flip-vs-wf_vblank.html

  


Build changes
-------------

  * Linux: CI_DRM_18602 -> Patchwork_167731v1

  CI-20190529: 20190529
  CI_DRM_18602: 51691efbd097f015d1f412ed410d399f2d9b672f @ git://anongit.freedesktop.org/gfx-ci/linux
  IGT_8945: d34395a7ede75d0b83edac965e27c0512bc0fe6e @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
  Patchwork_167731v1: 51691efbd097f015d1f412ed410d399f2d9b672f @ git://anongit.freedesktop.org/gfx-ci/linux

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_167731v1/index.html

--===============8902327362964743473==
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
<tr><td><b>Series:</b></td><td>drm/{i915, xe}/panic: drop dependency on struct intel_framebuffer</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/167731/">https://patchwork.freedesktop.org/series/167731/</a></td></tr>
<tr><td><b>State:</b></td><td>failure</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_167731v1/index.html">https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_167731v1/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from CI_DRM_18602 -&gt; Patchwork_167731v1</h1>
<h2>Summary</h2>
<p><strong>FAILURE</strong></p>
<p>Serious unknown changes coming with Patchwork_167731v1 absolutely need to be<br />
  verified manually.</p>
<p>If you think the reported changes have nothing to do with the changes<br />
  introduced in Patchwork_167731v1, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them<br />
  to document this new failure mode, which will reduce false positives in CI.</p>
<p>External URL: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_167731v1/index.html</p>
<h2>Participating hosts (42 -&gt; 39)</h2>
<p>Missing    (3): bat-dg2-13 fi-snb-2520m bat-adls-6 </p>
<h2>Possible new issues</h2>
<p>Here are the unknown changes that may have been introduced in Patchwork_167731v1:</p>
<h3>IGT changes</h3>
<h4>Possible regressions</h4>
<ul>
<li>igt@kms_flip@basic-flip-vs-wf_vblank:<ul>
<li>fi-bsw-n3050:       <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18602/fi-bsw-n3050/igt@kms_flip@basic-flip-vs-wf_vblank.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_167731v1/fi-bsw-n3050/igt@kms_flip@basic-flip-vs-wf_vblank.html">DMESG-WARN</a> +5 other tests dmesg-warn</li>
</ul>
</li>
</ul>
<h2>Build changes</h2>
<ul>
<li>Linux: CI_DRM_18602 -&gt; Patchwork_167731v1</li>
</ul>
<p>CI-20190529: 20190529<br />
  CI_DRM_18602: 51691efbd097f015d1f412ed410d399f2d9b672f @ git://anongit.freedesktop.org/gfx-ci/linux<br />
  IGT_8945: d34395a7ede75d0b83edac965e27c0512bc0fe6e @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git<br />
  Patchwork_167731v1: 51691efbd097f015d1f412ed410d399f2d9b672f @ git://anongit.freedesktop.org/gfx-ci/linux</p>

</body>
</html>

--===============8902327362964743473==--
