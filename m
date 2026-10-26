Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 11038606A31A
	for <intel-gfx@archiver.kernel.org>; Mon, 26 Oct 2026 06:43:54 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9C1B210E0CE;
	Mon, 26 Oct 2026 06:43:53 +0000 (UTC)
Received: from 221881a7231d (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 933C010E0CE;
 Mon, 26 Oct 2026 06:43:52 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============2366794452484064769=="
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=97_i915=2ECI=2EBAT=3A_failure_for_Enable_DP2=2E1_alpm_=28re?=
 =?utf-8?q?v7=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Animesh Manna" <animesh.manna@intel.com>
Cc: intel-gfx@lists.freedesktop.org
Date: Mon, 26 Oct 2026 06:43:52 -0000
Message-ID: <179299703259.68147.14149242995520971562@221881a7231d>
X-Patchwork-Hint: ignore
References: <20261026054001.799894-1-animesh.manna@intel.com>
In-Reply-To: <20261026054001.799894-1-animesh.manna@intel.com>
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

--===============2366794452484064769==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: Enable DP2.1 alpm (rev7)
URL   : https://patchwork.freedesktop.org/series/156417/
State : failure

== Summary ==

CI Bug Log - changes from CI_DRM_19394 -> Patchwork_156417v7
====================================================

Summary
-------

  **FAILURE**

  Serious unknown changes coming with Patchwork_156417v7 absolutely need to be
  verified manually.
  
  If you think the reported changes have nothing to do with the changes
  introduced in Patchwork_156417v7, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them
  to document this new failure mode, which will reduce false positives in CI.

  External URL: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_156417v7/index.html

Participating hosts (40 -> 39)
------------------------------

  Missing    (1): bat-dg2-13 

Possible new issues
-------------------

  Here are the unknown changes that may have been introduced in Patchwork_156417v7:

### IGT changes ###

#### Possible regressions ####

  * igt@i915_selftest@live:
    - bat-rpls-4:         [PASS][1] -> [INCOMPLETE][2] +1 other test incomplete
   [1]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19394/bat-rpls-4/igt@i915_selftest@live.html
   [2]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_156417v7/bat-rpls-4/igt@i915_selftest@live.html
    - fi-skl-6600u:       [PASS][3] -> [INCOMPLETE][4] +1 other test incomplete
   [3]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19394/fi-skl-6600u/igt@i915_selftest@live.html
   [4]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_156417v7/fi-skl-6600u/igt@i915_selftest@live.html

  
Known issues
------------

  Here are the changes found in Patchwork_156417v7 that come from known issues:

### IGT changes ###

#### Warnings ####

  * igt@kms_flip@basic-flip-vs-dpms:
    - fi-kbl-x1275:       [SKIP][5] -> [SKIP][6] ([i915#3637]) +3 other tests skip
   [5]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19394/fi-kbl-x1275/igt@kms_flip@basic-flip-vs-dpms.html
   [6]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_156417v7/fi-kbl-x1275/igt@kms_flip@basic-flip-vs-dpms.html

  * igt@kms_flip@basic-flip-vs-wf_vblank:
    - fi-bsw-nick:        [SKIP][7] -> [SKIP][8] ([i915#3637]) +3 other tests skip
   [7]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19394/fi-bsw-nick/igt@kms_flip@basic-flip-vs-wf_vblank.html
   [8]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_156417v7/fi-bsw-nick/igt@kms_flip@basic-flip-vs-wf_vblank.html
    - bat-kbl-2:          [SKIP][9] -> [SKIP][10] ([i915#3637]) +3 other tests skip
   [9]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19394/bat-kbl-2/igt@kms_flip@basic-flip-vs-wf_vblank.html
   [10]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_156417v7/bat-kbl-2/igt@kms_flip@basic-flip-vs-wf_vblank.html

  * igt@kms_flip@basic-plain-flip:
    - fi-kbl-8809g:       [SKIP][11] -> [SKIP][12] ([i915#3637]) +3 other tests skip
   [11]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19394/fi-kbl-8809g/igt@kms_flip@basic-plain-flip.html
   [12]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_156417v7/fi-kbl-8809g/igt@kms_flip@basic-plain-flip.html

  * igt@kms_psr@psr-cursor-plane-move:
    - fi-cfl-guc:         [SKIP][13] -> [SKIP][14] ([i915#9732]) +3 other tests skip
   [13]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19394/fi-cfl-guc/igt@kms_psr@psr-cursor-plane-move.html
   [14]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_156417v7/fi-cfl-guc/igt@kms_psr@psr-cursor-plane-move.html

  * igt@kms_psr@psr-primary-mmap-gtt:
    - fi-bsw-n3050:       [SKIP][15] -> [SKIP][16] ([i915#9732]) +3 other tests skip
   [15]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19394/fi-bsw-n3050/igt@kms_psr@psr-primary-mmap-gtt.html
   [16]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_156417v7/fi-bsw-n3050/igt@kms_psr@psr-primary-mmap-gtt.html
    - fi-pnv-d510:        [SKIP][17] -> [SKIP][18] ([i915#9732]) +3 other tests skip
   [17]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19394/fi-pnv-d510/igt@kms_psr@psr-primary-mmap-gtt.html
   [18]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_156417v7/fi-pnv-d510/igt@kms_psr@psr-primary-mmap-gtt.html

  * igt@kms_psr@psr-primary-page-flip:
    - fi-glk-j4005:       [SKIP][19] -> [SKIP][20] ([i915#9732]) +3 other tests skip
   [19]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19394/fi-glk-j4005/igt@kms_psr@psr-primary-page-flip.html
   [20]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_156417v7/fi-glk-j4005/igt@kms_psr@psr-primary-page-flip.html
    - fi-kbl-7567u:       [SKIP][21] -> [SKIP][22] ([i915#9732]) +3 other tests skip
   [21]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19394/fi-kbl-7567u/igt@kms_psr@psr-primary-page-flip.html
   [22]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_156417v7/fi-kbl-7567u/igt@kms_psr@psr-primary-page-flip.html
    - bat-apl-1:          [SKIP][23] -> [SKIP][24] ([i915#9732]) +3 other tests skip
   [23]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19394/bat-apl-1/igt@kms_psr@psr-primary-page-flip.html
   [24]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_156417v7/bat-apl-1/igt@kms_psr@psr-primary-page-flip.html
    - fi-kbl-x1275:       [SKIP][25] -> [SKIP][26] ([i915#9732]) +3 other tests skip
   [25]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19394/fi-kbl-x1275/igt@kms_psr@psr-primary-page-flip.html
   [26]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_156417v7/fi-kbl-x1275/igt@kms_psr@psr-primary-page-flip.html
    - fi-cfl-8109u:       [SKIP][27] -> [SKIP][28] ([i915#9732]) +3 other tests skip
   [27]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19394/fi-cfl-8109u/igt@kms_psr@psr-primary-page-flip.html
   [28]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_156417v7/fi-cfl-8109u/igt@kms_psr@psr-primary-page-flip.html
    - fi-kbl-8809g:       [SKIP][29] -> [SKIP][30] ([i915#9732]) +3 other tests skip
   [29]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19394/fi-kbl-8809g/igt@kms_psr@psr-primary-page-flip.html
   [30]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_156417v7/fi-kbl-8809g/igt@kms_psr@psr-primary-page-flip.html
    - fi-ilk-650:         [SKIP][31] -> [SKIP][32] ([i915#9732]) +3 other tests skip
   [31]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19394/fi-ilk-650/igt@kms_psr@psr-primary-page-flip.html
   [32]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_156417v7/fi-ilk-650/igt@kms_psr@psr-primary-page-flip.html

  * igt@kms_psr@psr-sprite-plane-onoff:
    - fi-cfl-8700k:       [SKIP][33] -> [SKIP][34] ([i915#9732]) +3 other tests skip
   [33]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19394/fi-cfl-8700k/igt@kms_psr@psr-sprite-plane-onoff.html
   [34]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_156417v7/fi-cfl-8700k/igt@kms_psr@psr-sprite-plane-onoff.html
    - fi-bsw-nick:        [SKIP][35] -> [SKIP][36] ([i915#9732]) +3 other tests skip
   [35]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19394/fi-bsw-nick/igt@kms_psr@psr-sprite-plane-onoff.html
   [36]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_156417v7/fi-bsw-nick/igt@kms_psr@psr-sprite-plane-onoff.html
    - bat-kbl-2:          [SKIP][37] -> [SKIP][38] ([i915#9732]) +3 other tests skip
   [37]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19394/bat-kbl-2/igt@kms_psr@psr-sprite-plane-onoff.html
   [38]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_156417v7/bat-kbl-2/igt@kms_psr@psr-sprite-plane-onoff.html
    - fi-ivb-3770:        [SKIP][39] -> [SKIP][40] ([i915#9732]) +3 other tests skip
   [39]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19394/fi-ivb-3770/igt@kms_psr@psr-sprite-plane-onoff.html
   [40]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_156417v7/fi-ivb-3770/igt@kms_psr@psr-sprite-plane-onoff.html
    - fi-elk-e7500:       [SKIP][41] -> [SKIP][42] ([i915#9732]) +3 other tests skip
   [41]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19394/fi-elk-e7500/igt@kms_psr@psr-sprite-plane-onoff.html
   [42]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_156417v7/fi-elk-e7500/igt@kms_psr@psr-sprite-plane-onoff.html

  
  [i915#3637]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3637
  [i915#9732]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9732


Build changes
-------------

  * Linux: CI_DRM_19394 -> Patchwork_156417v7

  CI-20190529: 20190529
  CI_DRM_19394: d56ff005f0d16ec136ee31fe3238eb447fefdc1a @ git://anongit.freedesktop.org/gfx-ci/linux
  IGT_9163: 9163
  Patchwork_156417v7: d56ff005f0d16ec136ee31fe3238eb447fefdc1a @ git://anongit.freedesktop.org/gfx-ci/linux

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_156417v7/index.html

--===============2366794452484064769==
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
<tr><td><b>Series:</b></td><td>Enable DP2.1 alpm (rev7)</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/156417/">https://patchwork.freedesktop.org/series/156417/</a></td></tr>
<tr><td><b>State:</b></td><td>failure</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_156417v7/index.html">https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_156417v7/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from CI_DRM_19394 -&gt; Patchwork_156417v7</h1>
<h2>Summary</h2>
<p><strong>FAILURE</strong></p>
<p>Serious unknown changes coming with Patchwork_156417v7 absolutely need to be<br />
  verified manually.</p>
<p>If you think the reported changes have nothing to do with the changes<br />
  introduced in Patchwork_156417v7, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them<br />
  to document this new failure mode, which will reduce false positives in CI.</p>
<p>External URL: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_156417v7/index.html</p>
<h2>Participating hosts (40 -&gt; 39)</h2>
<p>Missing    (1): bat-dg2-13 </p>
<h2>Possible new issues</h2>
<p>Here are the unknown changes that may have been introduced in Patchwork_156417v7:</p>
<h3>IGT changes</h3>
<h4>Possible regressions</h4>
<ul>
<li>igt@i915_selftest@live:<ul>
<li>bat-rpls-4:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19394/bat-rpls-4/igt@i915_selftest@live.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_156417v7/bat-rpls-4/igt@i915_selftest@live.html">INCOMPLETE</a> +1 other test incomplete</li>
<li>fi-skl-6600u:       <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19394/fi-skl-6600u/igt@i915_selftest@live.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_156417v7/fi-skl-6600u/igt@i915_selftest@live.html">INCOMPLETE</a> +1 other test incomplete</li>
</ul>
</li>
</ul>
<h2>Known issues</h2>
<p>Here are the changes found in Patchwork_156417v7 that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Warnings</h4>
<ul>
<li>
<p>igt@kms_flip@basic-flip-vs-dpms:</p>
<ul>
<li>fi-kbl-x1275:       <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19394/fi-kbl-x1275/igt@kms_flip@basic-flip-vs-dpms.html">SKIP</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_156417v7/fi-kbl-x1275/igt@kms_flip@basic-flip-vs-dpms.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3637">i915#3637</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip@basic-flip-vs-wf_vblank:</p>
<ul>
<li>fi-bsw-nick:        <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19394/fi-bsw-nick/igt@kms_flip@basic-flip-vs-wf_vblank.html">SKIP</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_156417v7/fi-bsw-nick/igt@kms_flip@basic-flip-vs-wf_vblank.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3637">i915#3637</a>) +3 other tests skip</li>
<li>bat-kbl-2:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19394/bat-kbl-2/igt@kms_flip@basic-flip-vs-wf_vblank.html">SKIP</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_156417v7/bat-kbl-2/igt@kms_flip@basic-flip-vs-wf_vblank.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3637">i915#3637</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip@basic-plain-flip:</p>
<ul>
<li>fi-kbl-8809g:       <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19394/fi-kbl-8809g/igt@kms_flip@basic-plain-flip.html">SKIP</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_156417v7/fi-kbl-8809g/igt@kms_flip@basic-plain-flip.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3637">i915#3637</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr@psr-cursor-plane-move:</p>
<ul>
<li>fi-cfl-guc:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19394/fi-cfl-guc/igt@kms_psr@psr-cursor-plane-move.html">SKIP</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_156417v7/fi-cfl-guc/igt@kms_psr@psr-cursor-plane-move.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9732">i915#9732</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr@psr-primary-mmap-gtt:</p>
<ul>
<li>fi-bsw-n3050:       <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19394/fi-bsw-n3050/igt@kms_psr@psr-primary-mmap-gtt.html">SKIP</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_156417v7/fi-bsw-n3050/igt@kms_psr@psr-primary-mmap-gtt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9732">i915#9732</a>) +3 other tests skip</li>
<li>fi-pnv-d510:        <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19394/fi-pnv-d510/igt@kms_psr@psr-primary-mmap-gtt.html">SKIP</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_156417v7/fi-pnv-d510/igt@kms_psr@psr-primary-mmap-gtt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9732">i915#9732</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr@psr-primary-page-flip:</p>
<ul>
<li>fi-glk-j4005:       <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19394/fi-glk-j4005/igt@kms_psr@psr-primary-page-flip.html">SKIP</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_156417v7/fi-glk-j4005/igt@kms_psr@psr-primary-page-flip.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9732">i915#9732</a>) +3 other tests skip</li>
<li>fi-kbl-7567u:       <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19394/fi-kbl-7567u/igt@kms_psr@psr-primary-page-flip.html">SKIP</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_156417v7/fi-kbl-7567u/igt@kms_psr@psr-primary-page-flip.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9732">i915#9732</a>) +3 other tests skip</li>
<li>bat-apl-1:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19394/bat-apl-1/igt@kms_psr@psr-primary-page-flip.html">SKIP</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_156417v7/bat-apl-1/igt@kms_psr@psr-primary-page-flip.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9732">i915#9732</a>) +3 other tests skip</li>
<li>fi-kbl-x1275:       <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19394/fi-kbl-x1275/igt@kms_psr@psr-primary-page-flip.html">SKIP</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_156417v7/fi-kbl-x1275/igt@kms_psr@psr-primary-page-flip.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9732">i915#9732</a>) +3 other tests skip</li>
<li>fi-cfl-8109u:       <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19394/fi-cfl-8109u/igt@kms_psr@psr-primary-page-flip.html">SKIP</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_156417v7/fi-cfl-8109u/igt@kms_psr@psr-primary-page-flip.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9732">i915#9732</a>) +3 other tests skip</li>
<li>fi-kbl-8809g:       <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19394/fi-kbl-8809g/igt@kms_psr@psr-primary-page-flip.html">SKIP</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_156417v7/fi-kbl-8809g/igt@kms_psr@psr-primary-page-flip.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9732">i915#9732</a>) +3 other tests skip</li>
<li>fi-ilk-650:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19394/fi-ilk-650/igt@kms_psr@psr-primary-page-flip.html">SKIP</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_156417v7/fi-ilk-650/igt@kms_psr@psr-primary-page-flip.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9732">i915#9732</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr@psr-sprite-plane-onoff:</p>
<ul>
<li>fi-cfl-8700k:       <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19394/fi-cfl-8700k/igt@kms_psr@psr-sprite-plane-onoff.html">SKIP</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_156417v7/fi-cfl-8700k/igt@kms_psr@psr-sprite-plane-onoff.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9732">i915#9732</a>) +3 other tests skip</li>
<li>fi-bsw-nick:        <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19394/fi-bsw-nick/igt@kms_psr@psr-sprite-plane-onoff.html">SKIP</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_156417v7/fi-bsw-nick/igt@kms_psr@psr-sprite-plane-onoff.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9732">i915#9732</a>) +3 other tests skip</li>
<li>bat-kbl-2:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19394/bat-kbl-2/igt@kms_psr@psr-sprite-plane-onoff.html">SKIP</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_156417v7/bat-kbl-2/igt@kms_psr@psr-sprite-plane-onoff.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9732">i915#9732</a>) +3 other tests skip</li>
<li>fi-ivb-3770:        <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19394/fi-ivb-3770/igt@kms_psr@psr-sprite-plane-onoff.html">SKIP</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_156417v7/fi-ivb-3770/igt@kms_psr@psr-sprite-plane-onoff.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9732">i915#9732</a>) +3 other tests skip</li>
<li>fi-elk-e7500:       <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19394/fi-elk-e7500/igt@kms_psr@psr-sprite-plane-onoff.html">SKIP</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_156417v7/fi-elk-e7500/igt@kms_psr@psr-sprite-plane-onoff.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9732">i915#9732</a>) +3 other tests skip</li>
</ul>
</li>
</ul>
<h2>Build changes</h2>
<ul>
<li>Linux: CI_DRM_19394 -&gt; Patchwork_156417v7</li>
</ul>
<p>CI-20190529: 20190529<br />
  CI_DRM_19394: d56ff005f0d16ec136ee31fe3238eb447fefdc1a @ git://anongit.freedesktop.org/gfx-ci/linux<br />
  IGT_9163: 9163<br />
  Patchwork_156417v7: d56ff005f0d16ec136ee31fe3238eb447fefdc1a @ git://anongit.freedesktop.org/gfx-ci/linux</p>

</body>
</html>

--===============2366794452484064769==--
