Return-Path: <intel-gfx-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6AE98CD6E55
	for <intel-gfx@archiver.kernel.org>; Mon,  1 Jun 2026 20:39:47 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A8A2B10E961;
	Mon,  1 Jun 2026 20:39:46 +0000 (UTC)
Received: from 6beec6c84f66 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B236D10E960;
 Mon,  1 Jun 2026 20:39:45 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============0294609667631221427=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=93_i915=2ECI=2EBAT=3A_success_for_Revert_=22drm=3A_prevent_?=
 =?utf-8?q?integer_overflows_in_dumb_buffer_creation_helpers=22?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Chaitanya Kumar Borah" <chaitanya.kumar.borah@intel.com>
Cc: intel-gfx@lists.freedesktop.org
Date: Mon, 01 Jun 2026 20:39:45 -0000
Message-ID: <178034638572.32237.6500831942801265202@6beec6c84f66>
X-Patchwork-Hint: ignore
References: <20260601173619.348486-1-chaitanya.kumar.borah@intel.com>
In-Reply-To: <20260601173619.348486-1-chaitanya.kumar.borah@intel.com>
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

--===============0294609667631221427==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: Revert "drm: prevent integer overflows in dumb buffer creation helpers"
URL   : https://patchwork.freedesktop.org/series/167686/
State : success

== Summary ==

CI Bug Log - changes from CI_DRM_18599 -> Patchwork_167686v1
====================================================

Summary
-------

  **SUCCESS**

  No regressions found.

  External URL: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_167686v1/index.html

Participating hosts (42 -> 40)
------------------------------

  Missing    (2): bat-dg2-13 fi-snb-2520m 

Known issues
------------

  Here are the changes found in Patchwork_167686v1 that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@core_hotunplug@unbind-rebind:
    - bat-rpls-4:         [PASS][1] -> [DMESG-WARN][2] ([i915#13400])
   [1]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18599/bat-rpls-4/igt@core_hotunplug@unbind-rebind.html
   [2]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_167686v1/bat-rpls-4/igt@core_hotunplug@unbind-rebind.html

  
#### Possible fixes ####

  * igt@vgem_basic@create:
    - bat-mtlp-9:         [FAIL][3] ([i915#16296]) -> [PASS][4]
   [3]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18599/bat-mtlp-9/igt@vgem_basic@create.html
   [4]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_167686v1/bat-mtlp-9/igt@vgem_basic@create.html
    - bat-arls-6:         [FAIL][5] ([i915#16296]) -> [PASS][6]
   [5]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18599/bat-arls-6/igt@vgem_basic@create.html
   [6]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_167686v1/bat-arls-6/igt@vgem_basic@create.html
    - fi-hsw-4770:        [FAIL][7] ([i915#16296]) -> [PASS][8]
   [7]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18599/fi-hsw-4770/igt@vgem_basic@create.html
   [8]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_167686v1/fi-hsw-4770/igt@vgem_basic@create.html
    - bat-mtlp-8:         [FAIL][9] ([i915#16296]) -> [PASS][10]
   [9]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18599/bat-mtlp-8/igt@vgem_basic@create.html
   [10]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_167686v1/bat-mtlp-8/igt@vgem_basic@create.html
    - bat-adls-6:         [FAIL][11] ([i915#16296]) -> [PASS][12]
   [11]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18599/bat-adls-6/igt@vgem_basic@create.html
   [12]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_167686v1/bat-adls-6/igt@vgem_basic@create.html
    - bat-arls-5:         [FAIL][13] ([i915#16296]) -> [PASS][14]
   [13]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18599/bat-arls-5/igt@vgem_basic@create.html
   [14]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_167686v1/bat-arls-5/igt@vgem_basic@create.html
    - bat-arlh-2:         [FAIL][15] ([i915#16296]) -> [PASS][16]
   [15]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18599/bat-arlh-2/igt@vgem_basic@create.html
   [16]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_167686v1/bat-arlh-2/igt@vgem_basic@create.html
    - fi-rkl-11600:       [FAIL][17] ([i915#16296]) -> [PASS][18]
   [17]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18599/fi-rkl-11600/igt@vgem_basic@create.html
   [18]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_167686v1/fi-rkl-11600/igt@vgem_basic@create.html
    - bat-arlh-3:         [FAIL][19] ([i915#16296]) -> [PASS][20]
   [19]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18599/bat-arlh-3/igt@vgem_basic@create.html
   [20]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_167686v1/bat-arlh-3/igt@vgem_basic@create.html
    - fi-pnv-d510:        [FAIL][21] ([i915#16296]) -> [PASS][22]
   [21]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18599/fi-pnv-d510/igt@vgem_basic@create.html
   [22]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_167686v1/fi-pnv-d510/igt@vgem_basic@create.html
    - bat-dg1-7:          [FAIL][23] ([i915#16296]) -> [PASS][24]
   [23]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18599/bat-dg1-7/igt@vgem_basic@create.html
   [24]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_167686v1/bat-dg1-7/igt@vgem_basic@create.html
    - fi-glk-j4005:       [FAIL][25] ([i915#16296]) -> [PASS][26]
   [25]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18599/fi-glk-j4005/igt@vgem_basic@create.html
   [26]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_167686v1/fi-glk-j4005/igt@vgem_basic@create.html
    - bat-adlp-9:         [FAIL][27] ([i915#16296]) -> [PASS][28]
   [27]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18599/bat-adlp-9/igt@vgem_basic@create.html
   [28]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_167686v1/bat-adlp-9/igt@vgem_basic@create.html
    - bat-rpls-4:         [FAIL][29] ([i915#16296]) -> [PASS][30]
   [29]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18599/bat-rpls-4/igt@vgem_basic@create.html
   [30]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_167686v1/bat-rpls-4/igt@vgem_basic@create.html
    - fi-cfl-8109u:       [FAIL][31] ([i915#16296]) -> [PASS][32]
   [31]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18599/fi-cfl-8109u/igt@vgem_basic@create.html
   [32]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_167686v1/fi-cfl-8109u/igt@vgem_basic@create.html
    - fi-kbl-7567u:       [FAIL][33] ([i915#16296]) -> [PASS][34]
   [33]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18599/fi-kbl-7567u/igt@vgem_basic@create.html
   [34]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_167686v1/fi-kbl-7567u/igt@vgem_basic@create.html
    - bat-twl-1:          [FAIL][35] ([i915#16296]) -> [PASS][36]
   [35]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18599/bat-twl-1/igt@vgem_basic@create.html
   [36]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_167686v1/bat-twl-1/igt@vgem_basic@create.html
    - fi-kbl-8809g:       [FAIL][37] ([i915#16296]) -> [PASS][38]
   [37]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18599/fi-kbl-8809g/igt@vgem_basic@create.html
   [38]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_167686v1/fi-kbl-8809g/igt@vgem_basic@create.html
    - bat-jsl-5:          [FAIL][39] ([i915#16296]) -> [PASS][40]
   [39]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18599/bat-jsl-5/igt@vgem_basic@create.html
   [40]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_167686v1/bat-jsl-5/igt@vgem_basic@create.html
    - bat-apl-1:          [FAIL][41] ([i915#16296]) -> [PASS][42]
   [41]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18599/bat-apl-1/igt@vgem_basic@create.html
   [42]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_167686v1/bat-apl-1/igt@vgem_basic@create.html
    - bat-rplp-1:         [FAIL][43] ([i915#16296]) -> [PASS][44]
   [43]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18599/bat-rplp-1/igt@vgem_basic@create.html
   [44]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_167686v1/bat-rplp-1/igt@vgem_basic@create.html
    - fi-ilk-650:         [FAIL][45] ([i915#16296]) -> [PASS][46]
   [45]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18599/fi-ilk-650/igt@vgem_basic@create.html
   [46]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_167686v1/fi-ilk-650/igt@vgem_basic@create.html
    - fi-tgl-1115g4:      [FAIL][47] ([i915#16296]) -> [PASS][48]
   [47]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18599/fi-tgl-1115g4/igt@vgem_basic@create.html
   [48]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_167686v1/fi-tgl-1115g4/igt@vgem_basic@create.html
    - fi-cfl-guc:         [FAIL][49] ([i915#16296]) -> [PASS][50]
   [49]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18599/fi-cfl-guc/igt@vgem_basic@create.html
   [50]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_167686v1/fi-cfl-guc/igt@vgem_basic@create.html
    - bat-dg2-9:          [FAIL][51] ([i915#16296]) -> [PASS][52]
   [51]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18599/bat-dg2-9/igt@vgem_basic@create.html
   [52]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_167686v1/bat-dg2-9/igt@vgem_basic@create.html
    - fi-kbl-x1275:       [FAIL][53] ([i915#16296]) -> [PASS][54]
   [53]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18599/fi-kbl-x1275/igt@vgem_basic@create.html
   [54]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_167686v1/fi-kbl-x1275/igt@vgem_basic@create.html
    - bat-adlp-11:        [FAIL][55] ([i915#16296]) -> [PASS][56]
   [55]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18599/bat-adlp-11/igt@vgem_basic@create.html
   [56]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_167686v1/bat-adlp-11/igt@vgem_basic@create.html
    - bat-dg1-6:          [FAIL][57] ([i915#16296]) -> [PASS][58]
   [57]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18599/bat-dg1-6/igt@vgem_basic@create.html
   [58]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_167686v1/bat-dg1-6/igt@vgem_basic@create.html
    - fi-cfl-8700k:       [FAIL][59] ([i915#16296]) -> [PASS][60]
   [59]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18599/fi-cfl-8700k/igt@vgem_basic@create.html
   [60]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_167686v1/fi-cfl-8700k/igt@vgem_basic@create.html
    - bat-kbl-2:          [FAIL][61] ([i915#16296]) -> [PASS][62]
   [61]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18599/bat-kbl-2/igt@vgem_basic@create.html
   [62]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_167686v1/bat-kbl-2/igt@vgem_basic@create.html
    - bat-adlp-6:         [FAIL][63] ([i915#16296]) -> [PASS][64]
   [63]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18599/bat-adlp-6/igt@vgem_basic@create.html
   [64]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_167686v1/bat-adlp-6/igt@vgem_basic@create.html
    - fi-skl-6600u:       [FAIL][65] ([i915#16296]) -> [PASS][66]
   [65]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18599/fi-skl-6600u/igt@vgem_basic@create.html
   [66]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_167686v1/fi-skl-6600u/igt@vgem_basic@create.html
    - bat-atsm-1:         [FAIL][67] ([i915#16296]) -> [PASS][68]
   [67]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18599/bat-atsm-1/igt@vgem_basic@create.html
   [68]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_167686v1/bat-atsm-1/igt@vgem_basic@create.html
    - bat-twl-2:          [FAIL][69] ([i915#16296]) -> [PASS][70]
   [69]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18599/bat-twl-2/igt@vgem_basic@create.html
   [70]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_167686v1/bat-twl-2/igt@vgem_basic@create.html
    - fi-ivb-3770:        [FAIL][71] ([i915#16296]) -> [PASS][72]
   [71]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18599/fi-ivb-3770/igt@vgem_basic@create.html
   [72]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_167686v1/fi-ivb-3770/igt@vgem_basic@create.html
    - bat-dg2-14:         [FAIL][73] ([i915#16296]) -> [PASS][74]
   [73]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18599/bat-dg2-14/igt@vgem_basic@create.html
   [74]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_167686v1/bat-dg2-14/igt@vgem_basic@create.html
    - fi-elk-e7500:       [FAIL][75] ([i915#16296]) -> [PASS][76]
   [75]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18599/fi-elk-e7500/igt@vgem_basic@create.html
   [76]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_167686v1/fi-elk-e7500/igt@vgem_basic@create.html
    - bat-dg2-8:          [FAIL][77] ([i915#16296]) -> [PASS][78]
   [77]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18599/bat-dg2-8/igt@vgem_basic@create.html
   [78]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_167686v1/bat-dg2-8/igt@vgem_basic@create.html
    - fi-bsw-nick:        [FAIL][79] ([i915#16296]) -> [PASS][80]
   [79]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18599/fi-bsw-nick/igt@vgem_basic@create.html
   [80]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_167686v1/fi-bsw-nick/igt@vgem_basic@create.html
    - fi-bsw-n3050:       [FAIL][81] ([i915#16296]) -> [PASS][82]
   [81]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18599/fi-bsw-n3050/igt@vgem_basic@create.html
   [82]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_167686v1/fi-bsw-n3050/igt@vgem_basic@create.html

  
  [i915#13400]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13400
  [i915#16296]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16296


Build changes
-------------

  * Linux: CI_DRM_18599 -> Patchwork_167686v1

  CI-20190529: 20190529
  CI_DRM_18599: 70cada764231ccb4582e920560a93edd210ace01 @ git://anongit.freedesktop.org/gfx-ci/linux
  IGT_8943: 8943
  Patchwork_167686v1: 70cada764231ccb4582e920560a93edd210ace01 @ git://anongit.freedesktop.org/gfx-ci/linux

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_167686v1/index.html

--===============0294609667631221427==
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
<tr><td><b>Series:</b></td><td>Revert &quot;drm: prevent integer overflows in dumb buffer creation helpers&quot;</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/167686/">https://patchwork.freedesktop.org/series/167686/</a></td></tr>
<tr><td><b>State:</b></td><td>success</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_167686v1/index.html">https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_167686v1/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from CI_DRM_18599 -&gt; Patchwork_167686v1</h1>
<h2>Summary</h2>
<p><strong>SUCCESS</strong></p>
<p>No regressions found.</p>
<p>External URL: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_167686v1/index.html</p>
<h2>Participating hosts (42 -&gt; 40)</h2>
<p>Missing    (2): bat-dg2-13 fi-snb-2520m </p>
<h2>Known issues</h2>
<p>Here are the changes found in Patchwork_167686v1 that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>igt@core_hotunplug@unbind-rebind:<ul>
<li>bat-rpls-4:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18599/bat-rpls-4/igt@core_hotunplug@unbind-rebind.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_167686v1/bat-rpls-4/igt@core_hotunplug@unbind-rebind.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13400">i915#13400</a>)</li>
</ul>
</li>
</ul>
<h4>Possible fixes</h4>
<ul>
<li>igt@vgem_basic@create:<ul>
<li>bat-mtlp-9:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18599/bat-mtlp-9/igt@vgem_basic@create.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16296">i915#16296</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_167686v1/bat-mtlp-9/igt@vgem_basic@create.html">PASS</a></li>
<li>bat-arls-6:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18599/bat-arls-6/igt@vgem_basic@create.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16296">i915#16296</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_167686v1/bat-arls-6/igt@vgem_basic@create.html">PASS</a></li>
<li>fi-hsw-4770:        <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18599/fi-hsw-4770/igt@vgem_basic@create.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16296">i915#16296</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_167686v1/fi-hsw-4770/igt@vgem_basic@create.html">PASS</a></li>
<li>bat-mtlp-8:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18599/bat-mtlp-8/igt@vgem_basic@create.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16296">i915#16296</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_167686v1/bat-mtlp-8/igt@vgem_basic@create.html">PASS</a></li>
<li>bat-adls-6:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18599/bat-adls-6/igt@vgem_basic@create.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16296">i915#16296</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_167686v1/bat-adls-6/igt@vgem_basic@create.html">PASS</a></li>
<li>bat-arls-5:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18599/bat-arls-5/igt@vgem_basic@create.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16296">i915#16296</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_167686v1/bat-arls-5/igt@vgem_basic@create.html">PASS</a></li>
<li>bat-arlh-2:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18599/bat-arlh-2/igt@vgem_basic@create.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16296">i915#16296</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_167686v1/bat-arlh-2/igt@vgem_basic@create.html">PASS</a></li>
<li>fi-rkl-11600:       <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18599/fi-rkl-11600/igt@vgem_basic@create.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16296">i915#16296</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_167686v1/fi-rkl-11600/igt@vgem_basic@create.html">PASS</a></li>
<li>bat-arlh-3:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18599/bat-arlh-3/igt@vgem_basic@create.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16296">i915#16296</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_167686v1/bat-arlh-3/igt@vgem_basic@create.html">PASS</a></li>
<li>fi-pnv-d510:        <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18599/fi-pnv-d510/igt@vgem_basic@create.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16296">i915#16296</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_167686v1/fi-pnv-d510/igt@vgem_basic@create.html">PASS</a></li>
<li>bat-dg1-7:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18599/bat-dg1-7/igt@vgem_basic@create.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16296">i915#16296</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_167686v1/bat-dg1-7/igt@vgem_basic@create.html">PASS</a></li>
<li>fi-glk-j4005:       <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18599/fi-glk-j4005/igt@vgem_basic@create.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16296">i915#16296</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_167686v1/fi-glk-j4005/igt@vgem_basic@create.html">PASS</a></li>
<li>bat-adlp-9:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18599/bat-adlp-9/igt@vgem_basic@create.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16296">i915#16296</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_167686v1/bat-adlp-9/igt@vgem_basic@create.html">PASS</a></li>
<li>bat-rpls-4:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18599/bat-rpls-4/igt@vgem_basic@create.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16296">i915#16296</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_167686v1/bat-rpls-4/igt@vgem_basic@create.html">PASS</a></li>
<li>fi-cfl-8109u:       <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18599/fi-cfl-8109u/igt@vgem_basic@create.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16296">i915#16296</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_167686v1/fi-cfl-8109u/igt@vgem_basic@create.html">PASS</a></li>
<li>fi-kbl-7567u:       <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18599/fi-kbl-7567u/igt@vgem_basic@create.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16296">i915#16296</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_167686v1/fi-kbl-7567u/igt@vgem_basic@create.html">PASS</a></li>
<li>bat-twl-1:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18599/bat-twl-1/igt@vgem_basic@create.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16296">i915#16296</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_167686v1/bat-twl-1/igt@vgem_basic@create.html">PASS</a></li>
<li>fi-kbl-8809g:       <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18599/fi-kbl-8809g/igt@vgem_basic@create.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16296">i915#16296</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_167686v1/fi-kbl-8809g/igt@vgem_basic@create.html">PASS</a></li>
<li>bat-jsl-5:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18599/bat-jsl-5/igt@vgem_basic@create.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16296">i915#16296</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_167686v1/bat-jsl-5/igt@vgem_basic@create.html">PASS</a></li>
<li>bat-apl-1:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18599/bat-apl-1/igt@vgem_basic@create.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16296">i915#16296</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_167686v1/bat-apl-1/igt@vgem_basic@create.html">PASS</a></li>
<li>bat-rplp-1:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18599/bat-rplp-1/igt@vgem_basic@create.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16296">i915#16296</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_167686v1/bat-rplp-1/igt@vgem_basic@create.html">PASS</a></li>
<li>fi-ilk-650:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18599/fi-ilk-650/igt@vgem_basic@create.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16296">i915#16296</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_167686v1/fi-ilk-650/igt@vgem_basic@create.html">PASS</a></li>
<li>fi-tgl-1115g4:      <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18599/fi-tgl-1115g4/igt@vgem_basic@create.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16296">i915#16296</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_167686v1/fi-tgl-1115g4/igt@vgem_basic@create.html">PASS</a></li>
<li>fi-cfl-guc:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18599/fi-cfl-guc/igt@vgem_basic@create.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16296">i915#16296</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_167686v1/fi-cfl-guc/igt@vgem_basic@create.html">PASS</a></li>
<li>bat-dg2-9:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18599/bat-dg2-9/igt@vgem_basic@create.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16296">i915#16296</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_167686v1/bat-dg2-9/igt@vgem_basic@create.html">PASS</a></li>
<li>fi-kbl-x1275:       <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18599/fi-kbl-x1275/igt@vgem_basic@create.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16296">i915#16296</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_167686v1/fi-kbl-x1275/igt@vgem_basic@create.html">PASS</a></li>
<li>bat-adlp-11:        <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18599/bat-adlp-11/igt@vgem_basic@create.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16296">i915#16296</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_167686v1/bat-adlp-11/igt@vgem_basic@create.html">PASS</a></li>
<li>bat-dg1-6:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18599/bat-dg1-6/igt@vgem_basic@create.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16296">i915#16296</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_167686v1/bat-dg1-6/igt@vgem_basic@create.html">PASS</a></li>
<li>fi-cfl-8700k:       <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18599/fi-cfl-8700k/igt@vgem_basic@create.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16296">i915#16296</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_167686v1/fi-cfl-8700k/igt@vgem_basic@create.html">PASS</a></li>
<li>bat-kbl-2:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18599/bat-kbl-2/igt@vgem_basic@create.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16296">i915#16296</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_167686v1/bat-kbl-2/igt@vgem_basic@create.html">PASS</a></li>
<li>bat-adlp-6:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18599/bat-adlp-6/igt@vgem_basic@create.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16296">i915#16296</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_167686v1/bat-adlp-6/igt@vgem_basic@create.html">PASS</a></li>
<li>fi-skl-6600u:       <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18599/fi-skl-6600u/igt@vgem_basic@create.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16296">i915#16296</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_167686v1/fi-skl-6600u/igt@vgem_basic@create.html">PASS</a></li>
<li>bat-atsm-1:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18599/bat-atsm-1/igt@vgem_basic@create.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16296">i915#16296</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_167686v1/bat-atsm-1/igt@vgem_basic@create.html">PASS</a></li>
<li>bat-twl-2:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18599/bat-twl-2/igt@vgem_basic@create.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16296">i915#16296</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_167686v1/bat-twl-2/igt@vgem_basic@create.html">PASS</a></li>
<li>fi-ivb-3770:        <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18599/fi-ivb-3770/igt@vgem_basic@create.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16296">i915#16296</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_167686v1/fi-ivb-3770/igt@vgem_basic@create.html">PASS</a></li>
<li>bat-dg2-14:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18599/bat-dg2-14/igt@vgem_basic@create.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16296">i915#16296</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_167686v1/bat-dg2-14/igt@vgem_basic@create.html">PASS</a></li>
<li>fi-elk-e7500:       <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18599/fi-elk-e7500/igt@vgem_basic@create.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16296">i915#16296</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_167686v1/fi-elk-e7500/igt@vgem_basic@create.html">PASS</a></li>
<li>bat-dg2-8:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18599/bat-dg2-8/igt@vgem_basic@create.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16296">i915#16296</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_167686v1/bat-dg2-8/igt@vgem_basic@create.html">PASS</a></li>
<li>fi-bsw-nick:        <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18599/fi-bsw-nick/igt@vgem_basic@create.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16296">i915#16296</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_167686v1/fi-bsw-nick/igt@vgem_basic@create.html">PASS</a></li>
<li>fi-bsw-n3050:       <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18599/fi-bsw-n3050/igt@vgem_basic@create.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16296">i915#16296</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_167686v1/fi-bsw-n3050/igt@vgem_basic@create.html">PASS</a></li>
</ul>
</li>
</ul>
<h2>Build changes</h2>
<ul>
<li>Linux: CI_DRM_18599 -&gt; Patchwork_167686v1</li>
</ul>
<p>CI-20190529: 20190529<br />
  CI_DRM_18599: 70cada764231ccb4582e920560a93edd210ace01 @ git://anongit.freedesktop.org/gfx-ci/linux<br />
  IGT_8943: 8943<br />
  Patchwork_167686v1: 70cada764231ccb4582e920560a93edd210ace01 @ git://anongit.freedesktop.org/gfx-ci/linux</p>

</body>
</html>

--===============0294609667631221427==--
