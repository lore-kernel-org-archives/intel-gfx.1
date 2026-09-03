Return-Path: <intel-gfx-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BB4D1C61DD3
	for <intel-gfx@archiver.kernel.org>; Thu,  3 Sep 2026 12:40:12 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4C41A10F58A;
	Thu,  3 Sep 2026 12:40:12 +0000 (UTC)
Received: from 61270ab9df2a (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 688B510F588;
 Thu,  3 Sep 2026 12:40:10 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============7320063874895557287=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=97_i915=2ECI=2EBAT=3A_failure_for_drm/i915/dp=3A_reset_HDMI?=
 =?utf-8?q?_2=2E1_PCON_FRL_state_on_disconnect?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Xiao Lu" <xiaolu.xie@intel.com>
Cc: intel-gfx@lists.freedesktop.org
Date: Thu, 03 Sep 2026 12:40:10 -0000
Message-ID: <178843921042.118474.3093686150370396529@61270ab9df2a>
X-Patchwork-Hint: ignore
References: <20260903104400.498178-1-xiaolu.xie@intel.com>
In-Reply-To: <20260903104400.498178-1-xiaolu.xie@intel.com>
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

--===============7320063874895557287==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: drm/i915/dp: reset HDMI 2.1 PCON FRL state on disconnect
URL   : https://patchwork.freedesktop.org/series/173298/
State : failure

== Summary ==

CI Bug Log - changes from CI_DRM_19082 -> Patchwork_173298v1
====================================================

Summary
-------

  **FAILURE**

  Serious unknown changes coming with Patchwork_173298v1 absolutely need to be
  verified manually.
  
  If you think the reported changes have nothing to do with the changes
  introduced in Patchwork_173298v1, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them
  to document this new failure mode, which will reduce false positives in CI.

  External URL: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_173298v1/index.html

Participating hosts (37 -> 37)
------------------------------

  Additional (1): fi-skl-6600u 
  Missing    (1): bat-dg2-13 

Possible new issues
-------------------

  Here are the unknown changes that may have been introduced in Patchwork_173298v1:

### IGT changes ###

#### Possible regressions ####

  * igt@i915_selftest@live:
    - bat-arlh-3:         [PASS][1] -> [INCOMPLETE][2] +1 other test incomplete
   [1]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19082/bat-arlh-3/igt@i915_selftest@live.html
   [2]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_173298v1/bat-arlh-3/igt@i915_selftest@live.html

  
Known issues
------------

  Here are the changes found in Patchwork_173298v1 that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@gem_huc_copy@huc-copy:
    - fi-skl-6600u:       NOTRUN -> [SKIP][3] ([i915#2190])
   [3]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_173298v1/fi-skl-6600u/igt@gem_huc_copy@huc-copy.html

  * igt@gem_lmem_swapping@random-engines:
    - fi-skl-6600u:       NOTRUN -> [SKIP][4] ([i915#4613]) +3 other tests skip
   [4]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_173298v1/fi-skl-6600u/igt@gem_lmem_swapping@random-engines.html

  * igt@kms_pipe_crc_basic@compare-crc-sanitycheck-nv12@pipe-c-edp-1:
    - fi-skl-6600u:       NOTRUN -> [SKIP][5] +10 other tests skip
   [5]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_173298v1/fi-skl-6600u/igt@kms_pipe_crc_basic@compare-crc-sanitycheck-nv12@pipe-c-edp-1.html

  
#### Possible fixes ####

  * igt@i915_pm_rpm@module-reload:
    - bat-arlh-2:         [INCOMPLETE][6] -> [PASS][7]
   [6]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19082/bat-arlh-2/igt@i915_pm_rpm@module-reload.html
   [7]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_173298v1/bat-arlh-2/igt@i915_pm_rpm@module-reload.html

  * igt@i915_selftest@live@gem_migrate:
    - bat-mtlp-9:         [INCOMPLETE][8] ([i915#16229]) -> [PASS][9] +1 other test pass
   [8]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19082/bat-mtlp-9/igt@i915_selftest@live@gem_migrate.html
   [9]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_173298v1/bat-mtlp-9/igt@i915_selftest@live@gem_migrate.html

  
  [i915#16229]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16229
  [i915#2190]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2190
  [i915#4613]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4613


Build changes
-------------

  * Linux: CI_DRM_19082 -> Patchwork_173298v1

  CI-20190529: 20190529
  CI_DRM_19082: ac238a043f935a7115a9c6e099fd45a4682a1b3c @ git://anongit.freedesktop.org/gfx-ci/linux
  IGT_9082: 2d61f578d998115259b87f9fa27f597ce11a0c89 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
  Patchwork_173298v1: ac238a043f935a7115a9c6e099fd45a4682a1b3c @ git://anongit.freedesktop.org/gfx-ci/linux

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_173298v1/index.html

--===============7320063874895557287==
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
<tr><td><b>Series:</b></td><td>drm/i915/dp: reset HDMI 2.1 PCON FRL state on disconnect</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/173298/">https://patchwork.freedesktop.org/series/173298/</a></td></tr>
<tr><td><b>State:</b></td><td>failure</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_173298v1/index.html">https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_173298v1/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from CI_DRM_19082 -&gt; Patchwork_173298v1</h1>
<h2>Summary</h2>
<p><strong>FAILURE</strong></p>
<p>Serious unknown changes coming with Patchwork_173298v1 absolutely need to be<br />
  verified manually.</p>
<p>If you think the reported changes have nothing to do with the changes<br />
  introduced in Patchwork_173298v1, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them<br />
  to document this new failure mode, which will reduce false positives in CI.</p>
<p>External URL: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_173298v1/index.html</p>
<h2>Participating hosts (37 -&gt; 37)</h2>
<p>Additional (1): fi-skl-6600u <br />
  Missing    (1): bat-dg2-13 </p>
<h2>Possible new issues</h2>
<p>Here are the unknown changes that may have been introduced in Patchwork_173298v1:</p>
<h3>IGT changes</h3>
<h4>Possible regressions</h4>
<ul>
<li>igt@i915_selftest@live:<ul>
<li>bat-arlh-3:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19082/bat-arlh-3/igt@i915_selftest@live.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_173298v1/bat-arlh-3/igt@i915_selftest@live.html">INCOMPLETE</a> +1 other test incomplete</li>
</ul>
</li>
</ul>
<h2>Known issues</h2>
<p>Here are the changes found in Patchwork_173298v1 that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>
<p>igt@gem_huc_copy@huc-copy:</p>
<ul>
<li>fi-skl-6600u:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_173298v1/fi-skl-6600u/igt@gem_huc_copy@huc-copy.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2190">i915#2190</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_lmem_swapping@random-engines:</p>
<ul>
<li>fi-skl-6600u:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_173298v1/fi-skl-6600u/igt@gem_lmem_swapping@random-engines.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4613">i915#4613</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_pipe_crc_basic@compare-crc-sanitycheck-nv12@pipe-c-edp-1:</p>
<ul>
<li>fi-skl-6600u:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_173298v1/fi-skl-6600u/igt@kms_pipe_crc_basic@compare-crc-sanitycheck-nv12@pipe-c-edp-1.html">SKIP</a> +10 other tests skip</li>
</ul>
</li>
</ul>
<h4>Possible fixes</h4>
<ul>
<li>
<p>igt@i915_pm_rpm@module-reload:</p>
<ul>
<li>bat-arlh-2:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19082/bat-arlh-2/igt@i915_pm_rpm@module-reload.html">INCOMPLETE</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_173298v1/bat-arlh-2/igt@i915_pm_rpm@module-reload.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@i915_selftest@live@gem_migrate:</p>
<ul>
<li>bat-mtlp-9:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19082/bat-mtlp-9/igt@i915_selftest@live@gem_migrate.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16229">i915#16229</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_173298v1/bat-mtlp-9/igt@i915_selftest@live@gem_migrate.html">PASS</a> +1 other test pass</li>
</ul>
</li>
</ul>
<h2>Build changes</h2>
<ul>
<li>Linux: CI_DRM_19082 -&gt; Patchwork_173298v1</li>
</ul>
<p>CI-20190529: 20190529<br />
  CI_DRM_19082: ac238a043f935a7115a9c6e099fd45a4682a1b3c @ git://anongit.freedesktop.org/gfx-ci/linux<br />
  IGT_9082: 2d61f578d998115259b87f9fa27f597ce11a0c89 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git<br />
  Patchwork_173298v1: ac238a043f935a7115a9c6e099fd45a4682a1b3c @ git://anongit.freedesktop.org/gfx-ci/linux</p>

</body>
</html>

--===============7320063874895557287==--
