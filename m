Return-Path: <intel-gfx-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B0977C88E77
	for <intel-gfx@archiver.kernel.org>; Tue, 15 Sep 2026 21:48:05 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 44FC710E328;
	Tue, 15 Sep 2026 21:48:05 +0000 (UTC)
Received: from 61270ab9df2a (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4427A10E44D;
 Tue, 15 Sep 2026 21:48:03 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============6068885309756087774=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=97_i915=2ECI=2EBAT=3A_failure_for_drm/=7Bi915=2Cxe=7D=3A_us?=
 =?utf-8?q?e_a_shared_gtt=5Fview=5Ftypes=2Eh_header?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Jani Nikula" <jani.nikula@intel.com>
Cc: intel-gfx@lists.freedesktop.org
Date: Tue, 15 Sep 2026 21:48:03 -0000
Message-ID: <178950888327.168648.7610191791995540288@61270ab9df2a>
X-Patchwork-Hint: ignore
References: <cover.1789502902.git.jani.nikula@intel.com>
In-Reply-To: <cover.1789502902.git.jani.nikula@intel.com>
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

--===============6068885309756087774==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: drm/{i915,xe}: use a shared gtt_view_types.h header
URL   : https://patchwork.freedesktop.org/series/174203/
State : failure

== Summary ==

CI Bug Log - changes from CI_DRM_19152 -> Patchwork_174203v1
====================================================

Summary
-------

  **FAILURE**

  Serious unknown changes coming with Patchwork_174203v1 absolutely need to be
  verified manually.
  
  If you think the reported changes have nothing to do with the changes
  introduced in Patchwork_174203v1, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them
  to document this new failure mode, which will reduce false positives in CI.

  External URL: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_174203v1/index.html

Participating hosts (39 -> 38)
------------------------------

  Missing    (1): bat-dg2-13 

Possible new issues
-------------------

  Here are the unknown changes that may have been introduced in Patchwork_174203v1:

### IGT changes ###

#### Possible regressions ####

  * igt@i915_selftest@live:
    - fi-hsw-4770:        [PASS][1] -> [DMESG-FAIL][2] +1 other test dmesg-fail
   [1]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19152/fi-hsw-4770/igt@i915_selftest@live.html
   [2]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_174203v1/fi-hsw-4770/igt@i915_selftest@live.html
    - fi-ivb-3770:        [PASS][3] -> [DMESG-FAIL][4] +1 other test dmesg-fail
   [3]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19152/fi-ivb-3770/igt@i915_selftest@live.html
   [4]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_174203v1/fi-ivb-3770/igt@i915_selftest@live.html
    - fi-elk-e7500:       [PASS][5] -> [DMESG-FAIL][6] +1 other test dmesg-fail
   [5]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19152/fi-elk-e7500/igt@i915_selftest@live.html
   [6]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_174203v1/fi-elk-e7500/igt@i915_selftest@live.html
    - bat-adls-6:         [PASS][7] -> [DMESG-FAIL][8] +1 other test dmesg-fail
   [7]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19152/bat-adls-6/igt@i915_selftest@live.html
   [8]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_174203v1/bat-adls-6/igt@i915_selftest@live.html
    - fi-bsw-n3050:       [PASS][9] -> [DMESG-FAIL][10] +1 other test dmesg-fail
   [9]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19152/fi-bsw-n3050/igt@i915_selftest@live.html
   [10]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_174203v1/fi-bsw-n3050/igt@i915_selftest@live.html
    - fi-pnv-d510:        [PASS][11] -> [DMESG-FAIL][12] +1 other test dmesg-fail
   [11]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19152/fi-pnv-d510/igt@i915_selftest@live.html
   [12]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_174203v1/fi-pnv-d510/igt@i915_selftest@live.html
    - fi-glk-j4005:       [PASS][13] -> [DMESG-FAIL][14] +1 other test dmesg-fail
   [13]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19152/fi-glk-j4005/igt@i915_selftest@live.html
   [14]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_174203v1/fi-glk-j4005/igt@i915_selftest@live.html
    - bat-adlp-9:         [PASS][15] -> [DMESG-FAIL][16] +1 other test dmesg-fail
   [15]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19152/bat-adlp-9/igt@i915_selftest@live.html
   [16]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_174203v1/bat-adlp-9/igt@i915_selftest@live.html
    - bat-rpls-4:         [PASS][17] -> [DMESG-FAIL][18] +1 other test dmesg-fail
   [17]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19152/bat-rpls-4/igt@i915_selftest@live.html
   [18]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_174203v1/bat-rpls-4/igt@i915_selftest@live.html
    - fi-kbl-7567u:       [PASS][19] -> [DMESG-FAIL][20] +1 other test dmesg-fail
   [19]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19152/fi-kbl-7567u/igt@i915_selftest@live.html
   [20]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_174203v1/fi-kbl-7567u/igt@i915_selftest@live.html
    - bat-twl-1:          [PASS][21] -> [DMESG-FAIL][22] +1 other test dmesg-fail
   [21]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19152/bat-twl-1/igt@i915_selftest@live.html
   [22]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_174203v1/bat-twl-1/igt@i915_selftest@live.html
    - bat-jsl-5:          [PASS][23] -> [DMESG-FAIL][24] +1 other test dmesg-fail
   [23]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19152/bat-jsl-5/igt@i915_selftest@live.html
   [24]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_174203v1/bat-jsl-5/igt@i915_selftest@live.html
    - bat-apl-1:          [PASS][25] -> [DMESG-FAIL][26] +1 other test dmesg-fail
   [25]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19152/bat-apl-1/igt@i915_selftest@live.html
   [26]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_174203v1/bat-apl-1/igt@i915_selftest@live.html
    - bat-rplp-1:         [PASS][27] -> [DMESG-FAIL][28] +1 other test dmesg-fail
   [27]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19152/bat-rplp-1/igt@i915_selftest@live.html
   [28]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_174203v1/bat-rplp-1/igt@i915_selftest@live.html
    - fi-rkl-11600:       [PASS][29] -> [DMESG-FAIL][30] +1 other test dmesg-fail
   [29]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19152/fi-rkl-11600/igt@i915_selftest@live.html
   [30]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_174203v1/fi-rkl-11600/igt@i915_selftest@live.html
    - fi-cfl-guc:         [PASS][31] -> [DMESG-FAIL][32] +1 other test dmesg-fail
   [31]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19152/fi-cfl-guc/igt@i915_selftest@live.html
   [32]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_174203v1/fi-cfl-guc/igt@i915_selftest@live.html
    - fi-kbl-x1275:       [PASS][33] -> [DMESG-FAIL][34] +1 other test dmesg-fail
   [33]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19152/fi-kbl-x1275/igt@i915_selftest@live.html
   [34]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_174203v1/fi-kbl-x1275/igt@i915_selftest@live.html
    - bat-adlp-11:        [PASS][35] -> [DMESG-FAIL][36] +1 other test dmesg-fail
   [35]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19152/bat-adlp-11/igt@i915_selftest@live.html
   [36]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_174203v1/bat-adlp-11/igt@i915_selftest@live.html
    - fi-cfl-8109u:       [PASS][37] -> [DMESG-FAIL][38] +1 other test dmesg-fail
   [37]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19152/fi-cfl-8109u/igt@i915_selftest@live.html
   [38]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_174203v1/fi-cfl-8109u/igt@i915_selftest@live.html
    - fi-kbl-8809g:       [PASS][39] -> [DMESG-FAIL][40] +1 other test dmesg-fail
   [39]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19152/fi-kbl-8809g/igt@i915_selftest@live.html
   [40]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_174203v1/fi-kbl-8809g/igt@i915_selftest@live.html
    - fi-ilk-650:         [PASS][41] -> [DMESG-FAIL][42] +1 other test dmesg-fail
   [41]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19152/fi-ilk-650/igt@i915_selftest@live.html
   [42]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_174203v1/fi-ilk-650/igt@i915_selftest@live.html
    - fi-tgl-1115g4:      [PASS][43] -> [DMESG-FAIL][44] +1 other test dmesg-fail
   [43]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19152/fi-tgl-1115g4/igt@i915_selftest@live.html
   [44]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_174203v1/fi-tgl-1115g4/igt@i915_selftest@live.html
    - bat-adlp-6:         [PASS][45] -> [DMESG-FAIL][46] +1 other test dmesg-fail
   [45]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19152/bat-adlp-6/igt@i915_selftest@live.html
   [46]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_174203v1/bat-adlp-6/igt@i915_selftest@live.html
    - fi-skl-6600u:       [PASS][47] -> [DMESG-FAIL][48] +1 other test dmesg-fail
   [47]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19152/fi-skl-6600u/igt@i915_selftest@live.html
   [48]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_174203v1/fi-skl-6600u/igt@i915_selftest@live.html
    - bat-twl-2:          [PASS][49] -> [DMESG-FAIL][50] +1 other test dmesg-fail
   [49]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19152/bat-twl-2/igt@i915_selftest@live.html
   [50]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_174203v1/bat-twl-2/igt@i915_selftest@live.html

  * igt@i915_selftest@live@vma:
    - fi-cfl-8700k:       [PASS][51] -> [DMESG-FAIL][52] +1 other test dmesg-fail
   [51]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19152/fi-cfl-8700k/igt@i915_selftest@live@vma.html
   [52]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_174203v1/fi-cfl-8700k/igt@i915_selftest@live@vma.html
    - fi-bsw-nick:        [PASS][53] -> [DMESG-FAIL][54] +1 other test dmesg-fail
   [53]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19152/fi-bsw-nick/igt@i915_selftest@live@vma.html
   [54]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_174203v1/fi-bsw-nick/igt@i915_selftest@live@vma.html
    - bat-kbl-2:          [PASS][55] -> [DMESG-FAIL][56] +1 other test dmesg-fail
   [55]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19152/bat-kbl-2/igt@i915_selftest@live@vma.html
   [56]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_174203v1/bat-kbl-2/igt@i915_selftest@live@vma.html

  


Build changes
-------------

  * Linux: CI_DRM_19152 -> Patchwork_174203v1

  CI-20190529: 20190529
  CI_DRM_19152: 0fb8d1900f1a6b9d21aadbfa5f784979b950bcf8 @ git://anongit.freedesktop.org/gfx-ci/linux
  IGT_9098: 9098
  Patchwork_174203v1: 0fb8d1900f1a6b9d21aadbfa5f784979b950bcf8 @ git://anongit.freedesktop.org/gfx-ci/linux

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_174203v1/index.html

--===============6068885309756087774==
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
<tr><td><b>Series:</b></td><td>drm/{i915,xe}: use a shared gtt_view_types.h header</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/174203/">https://patchwork.freedesktop.org/series/174203/</a></td></tr>
<tr><td><b>State:</b></td><td>failure</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_174203v1/index.html">https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_174203v1/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from CI_DRM_19152 -&gt; Patchwork_174203v1</h1>
<h2>Summary</h2>
<p><strong>FAILURE</strong></p>
<p>Serious unknown changes coming with Patchwork_174203v1 absolutely need to be<br />
  verified manually.</p>
<p>If you think the reported changes have nothing to do with the changes<br />
  introduced in Patchwork_174203v1, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them<br />
  to document this new failure mode, which will reduce false positives in CI.</p>
<p>External URL: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_174203v1/index.html</p>
<h2>Participating hosts (39 -&gt; 38)</h2>
<p>Missing    (1): bat-dg2-13 </p>
<h2>Possible new issues</h2>
<p>Here are the unknown changes that may have been introduced in Patchwork_174203v1:</p>
<h3>IGT changes</h3>
<h4>Possible regressions</h4>
<ul>
<li>
<p>igt@i915_selftest@live:</p>
<ul>
<li>fi-hsw-4770:        <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19152/fi-hsw-4770/igt@i915_selftest@live.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_174203v1/fi-hsw-4770/igt@i915_selftest@live.html">DMESG-FAIL</a> +1 other test dmesg-fail</li>
<li>fi-ivb-3770:        <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19152/fi-ivb-3770/igt@i915_selftest@live.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_174203v1/fi-ivb-3770/igt@i915_selftest@live.html">DMESG-FAIL</a> +1 other test dmesg-fail</li>
<li>fi-elk-e7500:       <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19152/fi-elk-e7500/igt@i915_selftest@live.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_174203v1/fi-elk-e7500/igt@i915_selftest@live.html">DMESG-FAIL</a> +1 other test dmesg-fail</li>
<li>bat-adls-6:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19152/bat-adls-6/igt@i915_selftest@live.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_174203v1/bat-adls-6/igt@i915_selftest@live.html">DMESG-FAIL</a> +1 other test dmesg-fail</li>
<li>fi-bsw-n3050:       <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19152/fi-bsw-n3050/igt@i915_selftest@live.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_174203v1/fi-bsw-n3050/igt@i915_selftest@live.html">DMESG-FAIL</a> +1 other test dmesg-fail</li>
<li>fi-pnv-d510:        <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19152/fi-pnv-d510/igt@i915_selftest@live.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_174203v1/fi-pnv-d510/igt@i915_selftest@live.html">DMESG-FAIL</a> +1 other test dmesg-fail</li>
<li>fi-glk-j4005:       <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19152/fi-glk-j4005/igt@i915_selftest@live.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_174203v1/fi-glk-j4005/igt@i915_selftest@live.html">DMESG-FAIL</a> +1 other test dmesg-fail</li>
<li>bat-adlp-9:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19152/bat-adlp-9/igt@i915_selftest@live.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_174203v1/bat-adlp-9/igt@i915_selftest@live.html">DMESG-FAIL</a> +1 other test dmesg-fail</li>
<li>bat-rpls-4:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19152/bat-rpls-4/igt@i915_selftest@live.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_174203v1/bat-rpls-4/igt@i915_selftest@live.html">DMESG-FAIL</a> +1 other test dmesg-fail</li>
<li>fi-kbl-7567u:       <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19152/fi-kbl-7567u/igt@i915_selftest@live.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_174203v1/fi-kbl-7567u/igt@i915_selftest@live.html">DMESG-FAIL</a> +1 other test dmesg-fail</li>
<li>bat-twl-1:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19152/bat-twl-1/igt@i915_selftest@live.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_174203v1/bat-twl-1/igt@i915_selftest@live.html">DMESG-FAIL</a> +1 other test dmesg-fail</li>
<li>bat-jsl-5:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19152/bat-jsl-5/igt@i915_selftest@live.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_174203v1/bat-jsl-5/igt@i915_selftest@live.html">DMESG-FAIL</a> +1 other test dmesg-fail</li>
<li>bat-apl-1:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19152/bat-apl-1/igt@i915_selftest@live.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_174203v1/bat-apl-1/igt@i915_selftest@live.html">DMESG-FAIL</a> +1 other test dmesg-fail</li>
<li>bat-rplp-1:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19152/bat-rplp-1/igt@i915_selftest@live.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_174203v1/bat-rplp-1/igt@i915_selftest@live.html">DMESG-FAIL</a> +1 other test dmesg-fail</li>
<li>fi-rkl-11600:       <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19152/fi-rkl-11600/igt@i915_selftest@live.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_174203v1/fi-rkl-11600/igt@i915_selftest@live.html">DMESG-FAIL</a> +1 other test dmesg-fail</li>
<li>fi-cfl-guc:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19152/fi-cfl-guc/igt@i915_selftest@live.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_174203v1/fi-cfl-guc/igt@i915_selftest@live.html">DMESG-FAIL</a> +1 other test dmesg-fail</li>
<li>fi-kbl-x1275:       <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19152/fi-kbl-x1275/igt@i915_selftest@live.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_174203v1/fi-kbl-x1275/igt@i915_selftest@live.html">DMESG-FAIL</a> +1 other test dmesg-fail</li>
<li>bat-adlp-11:        <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19152/bat-adlp-11/igt@i915_selftest@live.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_174203v1/bat-adlp-11/igt@i915_selftest@live.html">DMESG-FAIL</a> +1 other test dmesg-fail</li>
<li>fi-cfl-8109u:       <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19152/fi-cfl-8109u/igt@i915_selftest@live.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_174203v1/fi-cfl-8109u/igt@i915_selftest@live.html">DMESG-FAIL</a> +1 other test dmesg-fail</li>
<li>fi-kbl-8809g:       <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19152/fi-kbl-8809g/igt@i915_selftest@live.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_174203v1/fi-kbl-8809g/igt@i915_selftest@live.html">DMESG-FAIL</a> +1 other test dmesg-fail</li>
<li>fi-ilk-650:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19152/fi-ilk-650/igt@i915_selftest@live.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_174203v1/fi-ilk-650/igt@i915_selftest@live.html">DMESG-FAIL</a> +1 other test dmesg-fail</li>
<li>fi-tgl-1115g4:      <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19152/fi-tgl-1115g4/igt@i915_selftest@live.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_174203v1/fi-tgl-1115g4/igt@i915_selftest@live.html">DMESG-FAIL</a> +1 other test dmesg-fail</li>
<li>bat-adlp-6:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19152/bat-adlp-6/igt@i915_selftest@live.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_174203v1/bat-adlp-6/igt@i915_selftest@live.html">DMESG-FAIL</a> +1 other test dmesg-fail</li>
<li>fi-skl-6600u:       <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19152/fi-skl-6600u/igt@i915_selftest@live.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_174203v1/fi-skl-6600u/igt@i915_selftest@live.html">DMESG-FAIL</a> +1 other test dmesg-fail</li>
<li>bat-twl-2:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19152/bat-twl-2/igt@i915_selftest@live.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_174203v1/bat-twl-2/igt@i915_selftest@live.html">DMESG-FAIL</a> +1 other test dmesg-fail</li>
</ul>
</li>
<li>
<p>igt@i915_selftest@live@vma:</p>
<ul>
<li>fi-cfl-8700k:       <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19152/fi-cfl-8700k/igt@i915_selftest@live@vma.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_174203v1/fi-cfl-8700k/igt@i915_selftest@live@vma.html">DMESG-FAIL</a> +1 other test dmesg-fail</li>
<li>fi-bsw-nick:        <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19152/fi-bsw-nick/igt@i915_selftest@live@vma.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_174203v1/fi-bsw-nick/igt@i915_selftest@live@vma.html">DMESG-FAIL</a> +1 other test dmesg-fail</li>
<li>bat-kbl-2:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19152/bat-kbl-2/igt@i915_selftest@live@vma.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_174203v1/bat-kbl-2/igt@i915_selftest@live@vma.html">DMESG-FAIL</a> +1 other test dmesg-fail</li>
</ul>
</li>
</ul>
<h2>Build changes</h2>
<ul>
<li>Linux: CI_DRM_19152 -&gt; Patchwork_174203v1</li>
</ul>
<p>CI-20190529: 20190529<br />
  CI_DRM_19152: 0fb8d1900f1a6b9d21aadbfa5f784979b950bcf8 @ git://anongit.freedesktop.org/gfx-ci/linux<br />
  IGT_9098: 9098<br />
  Patchwork_174203v1: 0fb8d1900f1a6b9d21aadbfa5f784979b950bcf8 @ git://anongit.freedesktop.org/gfx-ci/linux</p>

</body>
</html>

--===============6068885309756087774==--
