Return-Path: <intel-gfx-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 44A2AC55184
	for <intel-gfx@archiver.kernel.org>; Wed,  5 Aug 2026 00:24:01 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C6C2510E12A;
	Wed,  5 Aug 2026 00:24:00 +0000 (UTC)
Received: from 61270ab9df2a (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EA58910E0FE;
 Wed,  5 Aug 2026 00:23:59 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============6568328461981412792=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=93_i915=2ECI=2EBAT=3A_success_for_drm/i915/flipq=3A_Fix_cur?=
 =?utf-8?q?sor_left_enabled_after_a_pipe_disable?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Mika Kahola" <mika.kahola@intel.com>
Cc: intel-gfx@lists.freedesktop.org
Date: Wed, 05 Aug 2026 00:23:59 -0000
Message-ID: <178588943995.19128.1707538274173037843@61270ab9df2a>
X-Patchwork-Hint: ignore
References: <20260804063058.969207-1-mika.kahola@intel.com>
In-Reply-To: <20260804063058.969207-1-mika.kahola@intel.com>
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

--===============6568328461981412792==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: drm/i915/flipq: Fix cursor left enabled after a pipe disable
URL   : https://patchwork.freedesktop.org/series/171551/
State : success

== Summary ==

CI Bug Log - changes from CI_DRM_18943 -> Patchwork_171551v1
====================================================

Summary
-------

  **SUCCESS**

  No regressions found.

  External URL: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_171551v1/index.html

Participating hosts (39 -> 36)
------------------------------

  Missing    (3): bat-dg2-13 fi-rkl-11600 fi-snb-2520m 

Known issues
------------

  Here are the changes found in Patchwork_171551v1 that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@gem_lmem_swapping@parallel-random-engines:
    - fi-bsw-nick:        NOTRUN -> [SKIP][1] +20 other tests skip
   [1]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_171551v1/fi-bsw-nick/igt@gem_lmem_swapping@parallel-random-engines.html

  * igt@kms_flip@basic-flip-vs-wf_vblank@c-dp3:
    - bat-adlp-6:         [PASS][2] -> [DMESG-WARN][3] ([i915#15673]) +78 other tests dmesg-warn
   [2]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18943/bat-adlp-6/igt@kms_flip@basic-flip-vs-wf_vblank@c-dp3.html
   [3]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_171551v1/bat-adlp-6/igt@kms_flip@basic-flip-vs-wf_vblank@c-dp3.html

  * igt@kms_pipe_crc_basic@read-crc-frame-sequence:
    - fi-bsw-nick:        NOTRUN -> [SKIP][4] ([i915#11190]) +16 other tests skip
   [4]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_171551v1/fi-bsw-nick/igt@kms_pipe_crc_basic@read-crc-frame-sequence.html

  
#### Possible fixes ####

  * igt@gem_exec_gttfill@basic:
    - fi-bsw-nick:        [ABORT][5] -> [PASS][6]
   [5]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18943/fi-bsw-nick/igt@gem_exec_gttfill@basic.html
   [6]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_171551v1/fi-bsw-nick/igt@gem_exec_gttfill@basic.html

  
  [i915#11190]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11190
  [i915#15673]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15673


Build changes
-------------

  * Linux: CI_DRM_18943 -> Patchwork_171551v1

  CI-20190529: 20190529
  CI_DRM_18943: 0377b35cbeef071dfeed06ccadc0d7607eccaa64 @ git://anongit.freedesktop.org/gfx-ci/linux
  IGT_9036: 9036
  Patchwork_171551v1: 0377b35cbeef071dfeed06ccadc0d7607eccaa64 @ git://anongit.freedesktop.org/gfx-ci/linux

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_171551v1/index.html

--===============6568328461981412792==
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
<tr><td><b>Series:</b></td><td>drm/i915/flipq: Fix cursor left enabled after a pipe disable</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/171551/">https://patchwork.freedesktop.org/series/171551/</a></td></tr>
<tr><td><b>State:</b></td><td>success</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_171551v1/index.html">https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_171551v1/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from CI_DRM_18943 -&gt; Patchwork_171551v1</h1>
<h2>Summary</h2>
<p><strong>SUCCESS</strong></p>
<p>No regressions found.</p>
<p>External URL: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_171551v1/index.html</p>
<h2>Participating hosts (39 -&gt; 36)</h2>
<p>Missing    (3): bat-dg2-13 fi-rkl-11600 fi-snb-2520m </p>
<h2>Known issues</h2>
<p>Here are the changes found in Patchwork_171551v1 that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>
<p>igt@gem_lmem_swapping@parallel-random-engines:</p>
<ul>
<li>fi-bsw-nick:        NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_171551v1/fi-bsw-nick/igt@gem_lmem_swapping@parallel-random-engines.html">SKIP</a> +20 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip@basic-flip-vs-wf_vblank@c-dp3:</p>
<ul>
<li>bat-adlp-6:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18943/bat-adlp-6/igt@kms_flip@basic-flip-vs-wf_vblank@c-dp3.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_171551v1/bat-adlp-6/igt@kms_flip@basic-flip-vs-wf_vblank@c-dp3.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15673">i915#15673</a>) +78 other tests dmesg-warn</li>
</ul>
</li>
<li>
<p>igt@kms_pipe_crc_basic@read-crc-frame-sequence:</p>
<ul>
<li>fi-bsw-nick:        NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_171551v1/fi-bsw-nick/igt@kms_pipe_crc_basic@read-crc-frame-sequence.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11190">i915#11190</a>) +16 other tests skip</li>
</ul>
</li>
</ul>
<h4>Possible fixes</h4>
<ul>
<li>igt@gem_exec_gttfill@basic:<ul>
<li>fi-bsw-nick:        <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18943/fi-bsw-nick/igt@gem_exec_gttfill@basic.html">ABORT</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_171551v1/fi-bsw-nick/igt@gem_exec_gttfill@basic.html">PASS</a></li>
</ul>
</li>
</ul>
<h2>Build changes</h2>
<ul>
<li>Linux: CI_DRM_18943 -&gt; Patchwork_171551v1</li>
</ul>
<p>CI-20190529: 20190529<br />
  CI_DRM_18943: 0377b35cbeef071dfeed06ccadc0d7607eccaa64 @ git://anongit.freedesktop.org/gfx-ci/linux<br />
  IGT_9036: 9036<br />
  Patchwork_171551v1: 0377b35cbeef071dfeed06ccadc0d7607eccaa64 @ git://anongit.freedesktop.org/gfx-ci/linux</p>

</body>
</html>

--===============6568328461981412792==--
