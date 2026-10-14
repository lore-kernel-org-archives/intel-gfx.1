Return-Path: <intel-gfx-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5C0E1CC6B1D
	for <intel-gfx@archiver.kernel.org>; Wed, 14 Oct 2026 09:41:56 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E15E510FC80;
	Wed, 14 Oct 2026 09:41:55 +0000 (UTC)
Received: from 221881a7231d (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0F89C10FC80;
 Wed, 14 Oct 2026 09:41:55 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============3863235681368142780=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=97_i915=2ECI=2EBAT=3A_failure_for_drm/i915/dp=3A_clear_and_?=
 =?utf-8?q?restore_MSTM=5FCTRL_around_MST_DPMS_off/on?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Xiao Lu" <xiaolu.xie@intel.com>
Cc: intel-gfx@lists.freedesktop.org
Date: Wed, 14 Oct 2026 09:41:55 -0000
Message-ID: <179197091505.22610.106320866036845750@221881a7231d>
X-Patchwork-Hint: ignore
References: <20261014081448.2320363-1-xiaolu.xie@intel.com>
In-Reply-To: <20261014081448.2320363-1-xiaolu.xie@intel.com>
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

--===============3863235681368142780==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: drm/i915/dp: clear and restore MSTM_CTRL around MST DPMS off/on
URL   : https://patchwork.freedesktop.org/series/176107/
State : failure

== Summary ==

CI Bug Log - changes from CI_DRM_19336 -> Patchwork_176107v1
====================================================

Summary
-------

  **FAILURE**

  Serious unknown changes coming with Patchwork_176107v1 absolutely need to be
  verified manually.
  
  If you think the reported changes have nothing to do with the changes
  introduced in Patchwork_176107v1, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them
  to document this new failure mode, which will reduce false positives in CI.

  External URL: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_176107v1/index.html

Participating hosts (39 -> 38)
------------------------------

  Missing    (1): bat-dg2-13 

Possible new issues
-------------------

  Here are the unknown changes that may have been introduced in Patchwork_176107v1:

### IGT changes ###

#### Possible regressions ####

  * igt@i915_selftest@live@hangcheck:
    - fi-bsw-n3050:       [PASS][1] -> [ABORT][2]
   [1]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19336/fi-bsw-n3050/igt@i915_selftest@live@hangcheck.html
   [2]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_176107v1/fi-bsw-n3050/igt@i915_selftest@live@hangcheck.html

  * igt@kms_cursor_legacy@basic-flip-before-cursor-atomic:
    - fi-skl-6600u:       [PASS][3] -> [DMESG-WARN][4]
   [3]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19336/fi-skl-6600u/igt@kms_cursor_legacy@basic-flip-before-cursor-atomic.html
   [4]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_176107v1/fi-skl-6600u/igt@kms_cursor_legacy@basic-flip-before-cursor-atomic.html

  
Known issues
------------

  Here are the changes found in Patchwork_176107v1 that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@i915_selftest@live:
    - fi-bsw-n3050:       [PASS][5] -> [ABORT][6] ([i915#17095])
   [5]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19336/fi-bsw-n3050/igt@i915_selftest@live.html
   [6]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_176107v1/fi-bsw-n3050/igt@i915_selftest@live.html

  * igt@kms_hdmi_inject@inject-audio:
    - fi-tgl-1115g4:      [PASS][7] -> [SKIP][8] ([i915#13030])
   [7]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19336/fi-tgl-1115g4/igt@kms_hdmi_inject@inject-audio.html
   [8]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_176107v1/fi-tgl-1115g4/igt@kms_hdmi_inject@inject-audio.html

  
  [i915#13030]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13030
  [i915#17095]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17095


Build changes
-------------

  * Linux: CI_DRM_19336 -> Patchwork_176107v1

  CI-20190529: 20190529
  CI_DRM_19336: c06d7623a198463e9aa2d09a3c33d96fe66ea662 @ git://anongit.freedesktop.org/gfx-ci/linux
  IGT_9145: 05c13a14f7f8bcda7bff83b8aa033c3c47a4b1fb @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
  Patchwork_176107v1: c06d7623a198463e9aa2d09a3c33d96fe66ea662 @ git://anongit.freedesktop.org/gfx-ci/linux

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_176107v1/index.html

--===============3863235681368142780==
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
<tr><td><b>Series:</b></td><td>drm/i915/dp: clear and restore MSTM_CTRL around MST DPMS off/on</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/176107/">https://patchwork.freedesktop.org/series/176107/</a></td></tr>
<tr><td><b>State:</b></td><td>failure</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_176107v1/index.html">https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_176107v1/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from CI_DRM_19336 -&gt; Patchwork_176107v1</h1>
<h2>Summary</h2>
<p><strong>FAILURE</strong></p>
<p>Serious unknown changes coming with Patchwork_176107v1 absolutely need to be<br />
  verified manually.</p>
<p>If you think the reported changes have nothing to do with the changes<br />
  introduced in Patchwork_176107v1, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them<br />
  to document this new failure mode, which will reduce false positives in CI.</p>
<p>External URL: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_176107v1/index.html</p>
<h2>Participating hosts (39 -&gt; 38)</h2>
<p>Missing    (1): bat-dg2-13 </p>
<h2>Possible new issues</h2>
<p>Here are the unknown changes that may have been introduced in Patchwork_176107v1:</p>
<h3>IGT changes</h3>
<h4>Possible regressions</h4>
<ul>
<li>
<p>igt@i915_selftest@live@hangcheck:</p>
<ul>
<li>fi-bsw-n3050:       <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19336/fi-bsw-n3050/igt@i915_selftest@live@hangcheck.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_176107v1/fi-bsw-n3050/igt@i915_selftest@live@hangcheck.html">ABORT</a></li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@basic-flip-before-cursor-atomic:</p>
<ul>
<li>fi-skl-6600u:       <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19336/fi-skl-6600u/igt@kms_cursor_legacy@basic-flip-before-cursor-atomic.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_176107v1/fi-skl-6600u/igt@kms_cursor_legacy@basic-flip-before-cursor-atomic.html">DMESG-WARN</a></li>
</ul>
</li>
</ul>
<h2>Known issues</h2>
<p>Here are the changes found in Patchwork_176107v1 that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>
<p>igt@i915_selftest@live:</p>
<ul>
<li>fi-bsw-n3050:       <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19336/fi-bsw-n3050/igt@i915_selftest@live.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_176107v1/fi-bsw-n3050/igt@i915_selftest@live.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17095">i915#17095</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_hdmi_inject@inject-audio:</p>
<ul>
<li>fi-tgl-1115g4:      <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19336/fi-tgl-1115g4/igt@kms_hdmi_inject@inject-audio.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_176107v1/fi-tgl-1115g4/igt@kms_hdmi_inject@inject-audio.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13030">i915#13030</a>)</li>
</ul>
</li>
</ul>
<h2>Build changes</h2>
<ul>
<li>Linux: CI_DRM_19336 -&gt; Patchwork_176107v1</li>
</ul>
<p>CI-20190529: 20190529<br />
  CI_DRM_19336: c06d7623a198463e9aa2d09a3c33d96fe66ea662 @ git://anongit.freedesktop.org/gfx-ci/linux<br />
  IGT_9145: 05c13a14f7f8bcda7bff83b8aa033c3c47a4b1fb @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git<br />
  Patchwork_176107v1: c06d7623a198463e9aa2d09a3c33d96fe66ea662 @ git://anongit.freedesktop.org/gfx-ci/linux</p>

</body>
</html>

--===============3863235681368142780==--
