Return-Path: <intel-gfx-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 14003C9830E
	for <intel-gfx@archiver.kernel.org>; Thu, 24 Sep 2026 12:53:41 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 807AA10E7E9;
	Thu, 24 Sep 2026 12:53:40 +0000 (UTC)
Received: from 61270ab9df2a (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AD4FD10E7E9;
 Thu, 24 Sep 2026 12:53:39 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============4637752489653309100=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=97_i915=2ECI=2EBAT=3A_failure_for_drm/i915/selftests=3A_Mod?=
 =?utf-8?q?ernize_printing_in_i915_selftests_=28rev5=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Krzysztof Karas" <krzysztof.karas@intel.com>
Cc: intel-gfx@lists.freedesktop.org
Date: Thu, 24 Sep 2026 12:53:39 -0000
Message-ID: <179025441970.202893.3648149281628920732@61270ab9df2a>
X-Patchwork-Hint: ignore
References: <20260924120147.1305127-1-krzysztof.karas@intel.com>
In-Reply-To: <20260924120147.1305127-1-krzysztof.karas@intel.com>
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

--===============4637752489653309100==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: drm/i915/selftests: Modernize printing in i915 selftests (rev5)
URL   : https://patchwork.freedesktop.org/series/171991/
State : failure

== Summary ==

CI Bug Log - changes from CI_DRM_19214 -> Patchwork_171991v5
====================================================

Summary
-------

  **FAILURE**

  Serious unknown changes coming with Patchwork_171991v5 absolutely need to be
  verified manually.
  
  If you think the reported changes have nothing to do with the changes
  introduced in Patchwork_171991v5, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them
  to document this new failure mode, which will reduce false positives in CI.

  External URL: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_171991v5/index.html

Participating hosts (38 -> 37)
------------------------------

  Additional (1): bat-adls-6 
  Missing    (2): bat-dg2-13 fi-glk-j4005 

Possible new issues
-------------------

  Here are the unknown changes that may have been introduced in Patchwork_171991v5:

### IGT changes ###

#### Possible regressions ####

  * igt@i915_selftest@live:
    - fi-kbl-x1275:       [PASS][1] -> [ABORT][2] +1 other test abort
   [1]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19214/fi-kbl-x1275/igt@i915_selftest@live.html
   [2]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_171991v5/fi-kbl-x1275/igt@i915_selftest@live.html
    - bat-adlp-11:        [PASS][3] -> [ABORT][4] +1 other test abort
   [3]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19214/bat-adlp-11/igt@i915_selftest@live.html
   [4]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_171991v5/bat-adlp-11/igt@i915_selftest@live.html
    - fi-hsw-4770:        [PASS][5] -> [ABORT][6] +1 other test abort
   [5]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19214/fi-hsw-4770/igt@i915_selftest@live.html
   [6]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_171991v5/fi-hsw-4770/igt@i915_selftest@live.html
    - fi-cfl-8109u:       [PASS][7] -> [ABORT][8] +1 other test abort
   [7]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19214/fi-cfl-8109u/igt@i915_selftest@live.html
   [8]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_171991v5/fi-cfl-8109u/igt@i915_selftest@live.html
    - fi-kbl-8809g:       [PASS][9] -> [ABORT][10] +1 other test abort
   [9]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19214/fi-kbl-8809g/igt@i915_selftest@live.html
   [10]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_171991v5/fi-kbl-8809g/igt@i915_selftest@live.html
    - fi-ivb-3770:        [PASS][11] -> [ABORT][12] +1 other test abort
   [11]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19214/fi-ivb-3770/igt@i915_selftest@live.html
   [12]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_171991v5/fi-ivb-3770/igt@i915_selftest@live.html
    - bat-mtlp-8:         [PASS][13] -> [ABORT][14] +1 other test abort
   [13]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19214/bat-mtlp-8/igt@i915_selftest@live.html
   [14]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_171991v5/bat-mtlp-8/igt@i915_selftest@live.html
    - bat-dg1-6:          [PASS][15] -> [ABORT][16] +1 other test abort
   [15]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19214/bat-dg1-6/igt@i915_selftest@live.html
   [16]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_171991v5/bat-dg1-6/igt@i915_selftest@live.html
    - fi-elk-e7500:       [PASS][17] -> [ABORT][18] +1 other test abort
   [17]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19214/fi-elk-e7500/igt@i915_selftest@live.html
   [18]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_171991v5/fi-elk-e7500/igt@i915_selftest@live.html
    - bat-adls-6:         NOTRUN -> [ABORT][19] +1 other test abort
   [19]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_171991v5/bat-adls-6/igt@i915_selftest@live.html
    - fi-ilk-650:         [PASS][20] -> [ABORT][21] +1 other test abort
   [20]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19214/fi-ilk-650/igt@i915_selftest@live.html
   [21]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_171991v5/fi-ilk-650/igt@i915_selftest@live.html
    - fi-tgl-1115g4:      [PASS][22] -> [ABORT][23] +1 other test abort
   [22]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19214/fi-tgl-1115g4/igt@i915_selftest@live.html
   [23]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_171991v5/fi-tgl-1115g4/igt@i915_selftest@live.html
    - fi-bsw-n3050:       [PASS][24] -> [ABORT][25] +1 other test abort
   [24]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19214/fi-bsw-n3050/igt@i915_selftest@live.html
   [25]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_171991v5/fi-bsw-n3050/igt@i915_selftest@live.html
    - bat-adlp-6:         [PASS][26] -> [ABORT][27] +1 other test abort
   [26]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19214/bat-adlp-6/igt@i915_selftest@live.html
   [27]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_171991v5/bat-adlp-6/igt@i915_selftest@live.html
    - fi-skl-6600u:       [PASS][28] -> [ABORT][29] +1 other test abort
   [28]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19214/fi-skl-6600u/igt@i915_selftest@live.html
   [29]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_171991v5/fi-skl-6600u/igt@i915_selftest@live.html
    - bat-arlh-3:         [PASS][30] -> [ABORT][31] +1 other test abort
   [30]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19214/bat-arlh-3/igt@i915_selftest@live.html
   [31]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_171991v5/bat-arlh-3/igt@i915_selftest@live.html
    - fi-pnv-d510:        [PASS][32] -> [ABORT][33] +1 other test abort
   [32]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19214/fi-pnv-d510/igt@i915_selftest@live.html
   [33]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_171991v5/fi-pnv-d510/igt@i915_selftest@live.html
    - bat-adlp-9:         [PASS][34] -> [ABORT][35] +1 other test abort
   [34]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19214/bat-adlp-9/igt@i915_selftest@live.html
   [35]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_171991v5/bat-adlp-9/igt@i915_selftest@live.html
    - bat-twl-2:          [PASS][36] -> [ABORT][37] +1 other test abort
   [36]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19214/bat-twl-2/igt@i915_selftest@live.html
   [37]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_171991v5/bat-twl-2/igt@i915_selftest@live.html
    - bat-rpls-4:         [PASS][38] -> [ABORT][39] +1 other test abort
   [38]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19214/bat-rpls-4/igt@i915_selftest@live.html
   [39]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_171991v5/bat-rpls-4/igt@i915_selftest@live.html
    - fi-kbl-7567u:       [PASS][40] -> [ABORT][41] +1 other test abort
   [40]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19214/fi-kbl-7567u/igt@i915_selftest@live.html
   [41]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_171991v5/fi-kbl-7567u/igt@i915_selftest@live.html
    - fi-cfl-8700k:       [PASS][42] -> [ABORT][43] +1 other test abort
   [42]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19214/fi-cfl-8700k/igt@i915_selftest@live.html
   [43]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_171991v5/fi-cfl-8700k/igt@i915_selftest@live.html
    - bat-twl-1:          [PASS][44] -> [ABORT][45] +1 other test abort
   [44]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19214/bat-twl-1/igt@i915_selftest@live.html
   [45]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_171991v5/bat-twl-1/igt@i915_selftest@live.html
    - bat-jsl-5:          [PASS][46] -> [ABORT][47] +1 other test abort
   [46]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19214/bat-jsl-5/igt@i915_selftest@live.html
   [47]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_171991v5/bat-jsl-5/igt@i915_selftest@live.html

  * igt@i915_selftest@live@gt_pm:
    - fi-tgl-1115g4:      [PASS][48] -> [DMESG-WARN][49]
   [48]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19214/fi-tgl-1115g4/igt@i915_selftest@live@gt_pm.html
   [49]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_171991v5/fi-tgl-1115g4/igt@i915_selftest@live@gt_pm.html

  * igt@i915_selftest@live@gt_tlb:
    - bat-adlp-9:         [PASS][50] -> [DMESG-WARN][51]
   [50]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19214/bat-adlp-9/igt@i915_selftest@live@gt_tlb.html
   [51]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_171991v5/bat-adlp-9/igt@i915_selftest@live@gt_tlb.html
    - fi-kbl-7567u:       [PASS][52] -> [DMESG-WARN][53]
   [52]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19214/fi-kbl-7567u/igt@i915_selftest@live@gt_tlb.html
   [53]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_171991v5/fi-kbl-7567u/igt@i915_selftest@live@gt_tlb.html
    - fi-cfl-8700k:       [PASS][54] -> [DMESG-WARN][55]
   [54]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19214/fi-cfl-8700k/igt@i915_selftest@live@gt_tlb.html
   [55]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_171991v5/fi-cfl-8700k/igt@i915_selftest@live@gt_tlb.html
    - fi-bsw-nick:        [PASS][56] -> [DMESG-WARN][57]
   [56]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19214/fi-bsw-nick/igt@i915_selftest@live@gt_tlb.html
   [57]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_171991v5/fi-bsw-nick/igt@i915_selftest@live@gt_tlb.html
    - fi-cfl-guc:         [PASS][58] -> [DMESG-WARN][59]
   [58]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19214/fi-cfl-guc/igt@i915_selftest@live@gt_tlb.html
   [59]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_171991v5/fi-cfl-guc/igt@i915_selftest@live@gt_tlb.html
    - bat-adlp-11:        [PASS][60] -> [DMESG-WARN][61]
   [60]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19214/bat-adlp-11/igt@i915_selftest@live@gt_tlb.html
   [61]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_171991v5/bat-adlp-11/igt@i915_selftest@live@gt_tlb.html
    - bat-dg1-6:          [PASS][62] -> [DMESG-WARN][63]
   [62]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19214/bat-dg1-6/igt@i915_selftest@live@gt_tlb.html
   [63]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_171991v5/bat-dg1-6/igt@i915_selftest@live@gt_tlb.html
    - fi-bsw-n3050:       [PASS][64] -> [DMESG-WARN][65]
   [64]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19214/fi-bsw-n3050/igt@i915_selftest@live@gt_tlb.html
   [65]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_171991v5/fi-bsw-n3050/igt@i915_selftest@live@gt_tlb.html
    - bat-adlp-6:         [PASS][66] -> [DMESG-WARN][67]
   [66]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19214/bat-adlp-6/igt@i915_selftest@live@gt_tlb.html
   [67]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_171991v5/bat-adlp-6/igt@i915_selftest@live@gt_tlb.html

  * igt@i915_selftest@live@requests:
    - bat-apl-1:          [PASS][68] -> [ABORT][69] +1 other test abort
   [68]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19214/bat-apl-1/igt@i915_selftest@live@requests.html
   [69]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_171991v5/bat-apl-1/igt@i915_selftest@live@requests.html
    - bat-dg2-14:         [PASS][70] -> [ABORT][71]
   [70]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19214/bat-dg2-14/igt@i915_selftest@live@requests.html
   [71]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_171991v5/bat-dg2-14/igt@i915_selftest@live@requests.html
    - fi-bsw-nick:        [PASS][72] -> [ABORT][73] +1 other test abort
   [72]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19214/fi-bsw-nick/igt@i915_selftest@live@requests.html
   [73]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_171991v5/fi-bsw-nick/igt@i915_selftest@live@requests.html
    - bat-kbl-2:          [PASS][74] -> [ABORT][75] +1 other test abort
   [74]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19214/bat-kbl-2/igt@i915_selftest@live@requests.html
   [75]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_171991v5/bat-kbl-2/igt@i915_selftest@live@requests.html
    - bat-rplp-1:         [PASS][76] -> [ABORT][77] +1 other test abort
   [76]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19214/bat-rplp-1/igt@i915_selftest@live@requests.html
   [77]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_171991v5/bat-rplp-1/igt@i915_selftest@live@requests.html
    - bat-arlh-2:         [PASS][78] -> [ABORT][79] +1 other test abort
   [78]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19214/bat-arlh-2/igt@i915_selftest@live@requests.html
   [79]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_171991v5/bat-arlh-2/igt@i915_selftest@live@requests.html
    - fi-rkl-11600:       [PASS][80] -> [ABORT][81] +1 other test abort
   [80]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19214/fi-rkl-11600/igt@i915_selftest@live@requests.html
   [81]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_171991v5/fi-rkl-11600/igt@i915_selftest@live@requests.html
    - bat-atsm-1:         [PASS][82] -> [ABORT][83]
   [82]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19214/bat-atsm-1/igt@i915_selftest@live@requests.html
   [83]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_171991v5/bat-atsm-1/igt@i915_selftest@live@requests.html
    - fi-cfl-guc:         [PASS][84] -> [ABORT][85] +1 other test abort
   [84]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19214/fi-cfl-guc/igt@i915_selftest@live@requests.html
   [85]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_171991v5/fi-cfl-guc/igt@i915_selftest@live@requests.html
    - bat-mtlp-9:         [PASS][86] -> [ABORT][87] +1 other test abort
   [86]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19214/bat-mtlp-9/igt@i915_selftest@live@requests.html
   [87]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_171991v5/bat-mtlp-9/igt@i915_selftest@live@requests.html
    - bat-arls-6:         [PASS][88] -> [ABORT][89] +1 other test abort
   [88]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19214/bat-arls-6/igt@i915_selftest@live@requests.html
   [89]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_171991v5/bat-arls-6/igt@i915_selftest@live@requests.html
    - bat-dg2-9:          [PASS][90] -> [ABORT][91]
   [90]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19214/bat-dg2-9/igt@i915_selftest@live@requests.html
   [91]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_171991v5/bat-dg2-9/igt@i915_selftest@live@requests.html
    - bat-dg2-8:          [PASS][92] -> [ABORT][93]
   [92]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19214/bat-dg2-8/igt@i915_selftest@live@requests.html
   [93]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_171991v5/bat-dg2-8/igt@i915_selftest@live@requests.html

  
Known issues
------------

  Here are the changes found in Patchwork_171991v5 that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@core_auth@basic-auth:
    - bat-adlp-6:         [PASS][94] -> [DMESG-WARN][95] ([i915#15673])
   [94]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19214/bat-adlp-6/igt@core_auth@basic-auth.html
   [95]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_171991v5/bat-adlp-6/igt@core_auth@basic-auth.html

  * igt@gem_lmem_swapping@verify-random:
    - bat-adls-6:         NOTRUN -> [SKIP][96] ([i915#4613]) +3 other tests skip
   [96]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_171991v5/bat-adls-6/igt@gem_lmem_swapping@verify-random.html

  * igt@gem_tiled_pread_basic@basic:
    - bat-adls-6:         NOTRUN -> [SKIP][97] ([i915#15656])
   [97]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_171991v5/bat-adls-6/igt@gem_tiled_pread_basic@basic.html

  * igt@i915_selftest@live:
    - bat-dg2-8:          [PASS][98] -> [ABORT][99] ([i915#17063])
   [98]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19214/bat-dg2-8/igt@i915_selftest@live.html
   [99]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_171991v5/bat-dg2-8/igt@i915_selftest@live.html
    - bat-dg2-14:         [PASS][100] -> [ABORT][101] ([i915#17063])
   [100]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19214/bat-dg2-14/igt@i915_selftest@live.html
   [101]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_171991v5/bat-dg2-14/igt@i915_selftest@live.html
    - bat-atsm-1:         [PASS][102] -> [ABORT][103] ([i915#14564])
   [102]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19214/bat-atsm-1/igt@i915_selftest@live.html
   [103]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_171991v5/bat-atsm-1/igt@i915_selftest@live.html
    - bat-dg2-9:          [PASS][104] -> [ABORT][105] ([i915#17063])
   [104]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19214/bat-dg2-9/igt@i915_selftest@live.html
   [105]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_171991v5/bat-dg2-9/igt@i915_selftest@live.html

  * igt@intel_hwmon@hwmon-read:
    - bat-adls-6:         NOTRUN -> [SKIP][106] ([i915#7707]) +1 other test skip
   [106]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_171991v5/bat-adls-6/igt@intel_hwmon@hwmon-read.html

  * igt@kms_cursor_legacy@basic-busy-flip-before-cursor-legacy:
    - bat-adls-6:         NOTRUN -> [SKIP][107] ([i915#4103]) +1 other test skip
   [107]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_171991v5/bat-adls-6/igt@kms_cursor_legacy@basic-busy-flip-before-cursor-legacy.html

  * igt@kms_dsc@dsc-basic:
    - bat-adls-6:         NOTRUN -> [SKIP][108] ([i915#16361])
   [108]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_171991v5/bat-adls-6/igt@kms_dsc@dsc-basic.html

  * igt@kms_force_connector_basic@force-load-detect:
    - bat-adls-6:         NOTRUN -> [SKIP][109]
   [109]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_171991v5/bat-adls-6/igt@kms_force_connector_basic@force-load-detect.html

  * igt@kms_pm_backlight@basic-brightness:
    - bat-adls-6:         NOTRUN -> [SKIP][110] ([i915#5354])
   [110]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_171991v5/bat-adls-6/igt@kms_pm_backlight@basic-brightness.html

  * igt@kms_psr@psr-primary-mmap-gtt:
    - bat-adls-6:         NOTRUN -> [SKIP][111] ([i915#1072] / [i915#9732]) +3 other tests skip
   [111]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_171991v5/bat-adls-6/igt@kms_psr@psr-primary-mmap-gtt.html

  * igt@kms_setmode@basic-clone-single-crtc:
    - bat-adls-6:         NOTRUN -> [SKIP][112] ([i915#3555])
   [112]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_171991v5/bat-adls-6/igt@kms_setmode@basic-clone-single-crtc.html

  * igt@prime_vgem@basic-fence-read:
    - bat-adls-6:         NOTRUN -> [SKIP][113] ([i915#3291]) +2 other tests skip
   [113]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_171991v5/bat-adls-6/igt@prime_vgem@basic-fence-read.html

  
#### Possible fixes ####

  * igt@core_debugfs@read-all-entries:
    - bat-adlp-6:         [DMESG-WARN][114] ([i915#15673]) -> [PASS][115]
   [114]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19214/bat-adlp-6/igt@core_debugfs@read-all-entries.html
   [115]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_171991v5/bat-adlp-6/igt@core_debugfs@read-all-entries.html

  
  [i915#1072]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/1072
  [i915#14564]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14564
  [i915#15656]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15656
  [i915#15673]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15673
  [i915#16361]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16361
  [i915#17063]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17063
  [i915#3291]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3291
  [i915#3555]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3555
  [i915#4103]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4103
  [i915#4613]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4613
  [i915#5354]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5354
  [i915#7707]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/7707
  [i915#9732]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9732


Build changes
-------------

  * Linux: CI_DRM_19214 -> Patchwork_171991v5

  CI-20190529: 20190529
  CI_DRM_19214: a61293e633b18c618fd2f7d508cf558db0f42227 @ git://anongit.freedesktop.org/gfx-ci/linux
  IGT_9111: 4aeabf104b136437d0ccc57caf32a752587d595c @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
  Patchwork_171991v5: a61293e633b18c618fd2f7d508cf558db0f42227 @ git://anongit.freedesktop.org/gfx-ci/linux

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_171991v5/index.html

--===============4637752489653309100==
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
<tr><td><b>Series:</b></td><td>drm/i915/selftests: Modernize printing in i915 selftests (rev5)</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/171991/">https://patchwork.freedesktop.org/series/171991/</a></td></tr>
<tr><td><b>State:</b></td><td>failure</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_171991v5/index.html">https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_171991v5/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from CI_DRM_19214 -&gt; Patchwork_171991v5</h1>
<h2>Summary</h2>
<p><strong>FAILURE</strong></p>
<p>Serious unknown changes coming with Patchwork_171991v5 absolutely need to be<br />
  verified manually.</p>
<p>If you think the reported changes have nothing to do with the changes<br />
  introduced in Patchwork_171991v5, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them<br />
  to document this new failure mode, which will reduce false positives in CI.</p>
<p>External URL: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_171991v5/index.html</p>
<h2>Participating hosts (38 -&gt; 37)</h2>
<p>Additional (1): bat-adls-6 <br />
  Missing    (2): bat-dg2-13 fi-glk-j4005 </p>
<h2>Possible new issues</h2>
<p>Here are the unknown changes that may have been introduced in Patchwork_171991v5:</p>
<h3>IGT changes</h3>
<h4>Possible regressions</h4>
<ul>
<li>
<p>igt@i915_selftest@live:</p>
<ul>
<li>fi-kbl-x1275:       <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19214/fi-kbl-x1275/igt@i915_selftest@live.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_171991v5/fi-kbl-x1275/igt@i915_selftest@live.html">ABORT</a> +1 other test abort</li>
<li>bat-adlp-11:        <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19214/bat-adlp-11/igt@i915_selftest@live.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_171991v5/bat-adlp-11/igt@i915_selftest@live.html">ABORT</a> +1 other test abort</li>
<li>fi-hsw-4770:        <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19214/fi-hsw-4770/igt@i915_selftest@live.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_171991v5/fi-hsw-4770/igt@i915_selftest@live.html">ABORT</a> +1 other test abort</li>
<li>fi-cfl-8109u:       <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19214/fi-cfl-8109u/igt@i915_selftest@live.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_171991v5/fi-cfl-8109u/igt@i915_selftest@live.html">ABORT</a> +1 other test abort</li>
<li>fi-kbl-8809g:       <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19214/fi-kbl-8809g/igt@i915_selftest@live.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_171991v5/fi-kbl-8809g/igt@i915_selftest@live.html">ABORT</a> +1 other test abort</li>
<li>fi-ivb-3770:        <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19214/fi-ivb-3770/igt@i915_selftest@live.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_171991v5/fi-ivb-3770/igt@i915_selftest@live.html">ABORT</a> +1 other test abort</li>
<li>bat-mtlp-8:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19214/bat-mtlp-8/igt@i915_selftest@live.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_171991v5/bat-mtlp-8/igt@i915_selftest@live.html">ABORT</a> +1 other test abort</li>
<li>bat-dg1-6:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19214/bat-dg1-6/igt@i915_selftest@live.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_171991v5/bat-dg1-6/igt@i915_selftest@live.html">ABORT</a> +1 other test abort</li>
<li>fi-elk-e7500:       <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19214/fi-elk-e7500/igt@i915_selftest@live.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_171991v5/fi-elk-e7500/igt@i915_selftest@live.html">ABORT</a> +1 other test abort</li>
<li>bat-adls-6:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_171991v5/bat-adls-6/igt@i915_selftest@live.html">ABORT</a> +1 other test abort</li>
<li>fi-ilk-650:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19214/fi-ilk-650/igt@i915_selftest@live.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_171991v5/fi-ilk-650/igt@i915_selftest@live.html">ABORT</a> +1 other test abort</li>
<li>fi-tgl-1115g4:      <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19214/fi-tgl-1115g4/igt@i915_selftest@live.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_171991v5/fi-tgl-1115g4/igt@i915_selftest@live.html">ABORT</a> +1 other test abort</li>
<li>fi-bsw-n3050:       <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19214/fi-bsw-n3050/igt@i915_selftest@live.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_171991v5/fi-bsw-n3050/igt@i915_selftest@live.html">ABORT</a> +1 other test abort</li>
<li>bat-adlp-6:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19214/bat-adlp-6/igt@i915_selftest@live.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_171991v5/bat-adlp-6/igt@i915_selftest@live.html">ABORT</a> +1 other test abort</li>
<li>fi-skl-6600u:       <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19214/fi-skl-6600u/igt@i915_selftest@live.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_171991v5/fi-skl-6600u/igt@i915_selftest@live.html">ABORT</a> +1 other test abort</li>
<li>bat-arlh-3:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19214/bat-arlh-3/igt@i915_selftest@live.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_171991v5/bat-arlh-3/igt@i915_selftest@live.html">ABORT</a> +1 other test abort</li>
<li>fi-pnv-d510:        <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19214/fi-pnv-d510/igt@i915_selftest@live.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_171991v5/fi-pnv-d510/igt@i915_selftest@live.html">ABORT</a> +1 other test abort</li>
<li>bat-adlp-9:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19214/bat-adlp-9/igt@i915_selftest@live.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_171991v5/bat-adlp-9/igt@i915_selftest@live.html">ABORT</a> +1 other test abort</li>
<li>bat-twl-2:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19214/bat-twl-2/igt@i915_selftest@live.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_171991v5/bat-twl-2/igt@i915_selftest@live.html">ABORT</a> +1 other test abort</li>
<li>bat-rpls-4:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19214/bat-rpls-4/igt@i915_selftest@live.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_171991v5/bat-rpls-4/igt@i915_selftest@live.html">ABORT</a> +1 other test abort</li>
<li>fi-kbl-7567u:       <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19214/fi-kbl-7567u/igt@i915_selftest@live.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_171991v5/fi-kbl-7567u/igt@i915_selftest@live.html">ABORT</a> +1 other test abort</li>
<li>fi-cfl-8700k:       <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19214/fi-cfl-8700k/igt@i915_selftest@live.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_171991v5/fi-cfl-8700k/igt@i915_selftest@live.html">ABORT</a> +1 other test abort</li>
<li>bat-twl-1:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19214/bat-twl-1/igt@i915_selftest@live.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_171991v5/bat-twl-1/igt@i915_selftest@live.html">ABORT</a> +1 other test abort</li>
<li>bat-jsl-5:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19214/bat-jsl-5/igt@i915_selftest@live.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_171991v5/bat-jsl-5/igt@i915_selftest@live.html">ABORT</a> +1 other test abort</li>
</ul>
</li>
<li>
<p>igt@i915_selftest@live@gt_pm:</p>
<ul>
<li>fi-tgl-1115g4:      <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19214/fi-tgl-1115g4/igt@i915_selftest@live@gt_pm.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_171991v5/fi-tgl-1115g4/igt@i915_selftest@live@gt_pm.html">DMESG-WARN</a></li>
</ul>
</li>
<li>
<p>igt@i915_selftest@live@gt_tlb:</p>
<ul>
<li>bat-adlp-9:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19214/bat-adlp-9/igt@i915_selftest@live@gt_tlb.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_171991v5/bat-adlp-9/igt@i915_selftest@live@gt_tlb.html">DMESG-WARN</a></li>
<li>fi-kbl-7567u:       <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19214/fi-kbl-7567u/igt@i915_selftest@live@gt_tlb.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_171991v5/fi-kbl-7567u/igt@i915_selftest@live@gt_tlb.html">DMESG-WARN</a></li>
<li>fi-cfl-8700k:       <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19214/fi-cfl-8700k/igt@i915_selftest@live@gt_tlb.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_171991v5/fi-cfl-8700k/igt@i915_selftest@live@gt_tlb.html">DMESG-WARN</a></li>
<li>fi-bsw-nick:        <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19214/fi-bsw-nick/igt@i915_selftest@live@gt_tlb.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_171991v5/fi-bsw-nick/igt@i915_selftest@live@gt_tlb.html">DMESG-WARN</a></li>
<li>fi-cfl-guc:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19214/fi-cfl-guc/igt@i915_selftest@live@gt_tlb.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_171991v5/fi-cfl-guc/igt@i915_selftest@live@gt_tlb.html">DMESG-WARN</a></li>
<li>bat-adlp-11:        <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19214/bat-adlp-11/igt@i915_selftest@live@gt_tlb.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_171991v5/bat-adlp-11/igt@i915_selftest@live@gt_tlb.html">DMESG-WARN</a></li>
<li>bat-dg1-6:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19214/bat-dg1-6/igt@i915_selftest@live@gt_tlb.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_171991v5/bat-dg1-6/igt@i915_selftest@live@gt_tlb.html">DMESG-WARN</a></li>
<li>fi-bsw-n3050:       <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19214/fi-bsw-n3050/igt@i915_selftest@live@gt_tlb.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_171991v5/fi-bsw-n3050/igt@i915_selftest@live@gt_tlb.html">DMESG-WARN</a></li>
<li>bat-adlp-6:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19214/bat-adlp-6/igt@i915_selftest@live@gt_tlb.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_171991v5/bat-adlp-6/igt@i915_selftest@live@gt_tlb.html">DMESG-WARN</a></li>
</ul>
</li>
<li>
<p>igt@i915_selftest@live@requests:</p>
<ul>
<li>bat-apl-1:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19214/bat-apl-1/igt@i915_selftest@live@requests.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_171991v5/bat-apl-1/igt@i915_selftest@live@requests.html">ABORT</a> +1 other test abort</li>
<li>bat-dg2-14:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19214/bat-dg2-14/igt@i915_selftest@live@requests.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_171991v5/bat-dg2-14/igt@i915_selftest@live@requests.html">ABORT</a></li>
<li>fi-bsw-nick:        <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19214/fi-bsw-nick/igt@i915_selftest@live@requests.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_171991v5/fi-bsw-nick/igt@i915_selftest@live@requests.html">ABORT</a> +1 other test abort</li>
<li>bat-kbl-2:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19214/bat-kbl-2/igt@i915_selftest@live@requests.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_171991v5/bat-kbl-2/igt@i915_selftest@live@requests.html">ABORT</a> +1 other test abort</li>
<li>bat-rplp-1:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19214/bat-rplp-1/igt@i915_selftest@live@requests.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_171991v5/bat-rplp-1/igt@i915_selftest@live@requests.html">ABORT</a> +1 other test abort</li>
<li>bat-arlh-2:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19214/bat-arlh-2/igt@i915_selftest@live@requests.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_171991v5/bat-arlh-2/igt@i915_selftest@live@requests.html">ABORT</a> +1 other test abort</li>
<li>fi-rkl-11600:       <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19214/fi-rkl-11600/igt@i915_selftest@live@requests.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_171991v5/fi-rkl-11600/igt@i915_selftest@live@requests.html">ABORT</a> +1 other test abort</li>
<li>bat-atsm-1:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19214/bat-atsm-1/igt@i915_selftest@live@requests.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_171991v5/bat-atsm-1/igt@i915_selftest@live@requests.html">ABORT</a></li>
<li>fi-cfl-guc:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19214/fi-cfl-guc/igt@i915_selftest@live@requests.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_171991v5/fi-cfl-guc/igt@i915_selftest@live@requests.html">ABORT</a> +1 other test abort</li>
<li>bat-mtlp-9:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19214/bat-mtlp-9/igt@i915_selftest@live@requests.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_171991v5/bat-mtlp-9/igt@i915_selftest@live@requests.html">ABORT</a> +1 other test abort</li>
<li>bat-arls-6:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19214/bat-arls-6/igt@i915_selftest@live@requests.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_171991v5/bat-arls-6/igt@i915_selftest@live@requests.html">ABORT</a> +1 other test abort</li>
<li>bat-dg2-9:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19214/bat-dg2-9/igt@i915_selftest@live@requests.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_171991v5/bat-dg2-9/igt@i915_selftest@live@requests.html">ABORT</a></li>
<li>bat-dg2-8:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19214/bat-dg2-8/igt@i915_selftest@live@requests.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_171991v5/bat-dg2-8/igt@i915_selftest@live@requests.html">ABORT</a></li>
</ul>
</li>
</ul>
<h2>Known issues</h2>
<p>Here are the changes found in Patchwork_171991v5 that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>
<p>igt@core_auth@basic-auth:</p>
<ul>
<li>bat-adlp-6:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19214/bat-adlp-6/igt@core_auth@basic-auth.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_171991v5/bat-adlp-6/igt@core_auth@basic-auth.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15673">i915#15673</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_lmem_swapping@verify-random:</p>
<ul>
<li>bat-adls-6:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_171991v5/bat-adls-6/igt@gem_lmem_swapping@verify-random.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4613">i915#4613</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@gem_tiled_pread_basic@basic:</p>
<ul>
<li>bat-adls-6:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_171991v5/bat-adls-6/igt@gem_tiled_pread_basic@basic.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15656">i915#15656</a>)</li>
</ul>
</li>
<li>
<p>igt@i915_selftest@live:</p>
<ul>
<li>bat-dg2-8:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19214/bat-dg2-8/igt@i915_selftest@live.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_171991v5/bat-dg2-8/igt@i915_selftest@live.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17063">i915#17063</a>)</li>
<li>bat-dg2-14:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19214/bat-dg2-14/igt@i915_selftest@live.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_171991v5/bat-dg2-14/igt@i915_selftest@live.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17063">i915#17063</a>)</li>
<li>bat-atsm-1:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19214/bat-atsm-1/igt@i915_selftest@live.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_171991v5/bat-atsm-1/igt@i915_selftest@live.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14564">i915#14564</a>)</li>
<li>bat-dg2-9:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19214/bat-dg2-9/igt@i915_selftest@live.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_171991v5/bat-dg2-9/igt@i915_selftest@live.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17063">i915#17063</a>)</li>
</ul>
</li>
<li>
<p>igt@intel_hwmon@hwmon-read:</p>
<ul>
<li>bat-adls-6:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_171991v5/bat-adls-6/igt@intel_hwmon@hwmon-read.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/7707">i915#7707</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@basic-busy-flip-before-cursor-legacy:</p>
<ul>
<li>bat-adls-6:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_171991v5/bat-adls-6/igt@kms_cursor_legacy@basic-busy-flip-before-cursor-legacy.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4103">i915#4103</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_dsc@dsc-basic:</p>
<ul>
<li>bat-adls-6:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_171991v5/bat-adls-6/igt@kms_dsc@dsc-basic.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16361">i915#16361</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_force_connector_basic@force-load-detect:</p>
<ul>
<li>bat-adls-6:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_171991v5/bat-adls-6/igt@kms_force_connector_basic@force-load-detect.html">SKIP</a></li>
</ul>
</li>
<li>
<p>igt@kms_pm_backlight@basic-brightness:</p>
<ul>
<li>bat-adls-6:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_171991v5/bat-adls-6/igt@kms_pm_backlight@basic-brightness.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5354">i915#5354</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr@psr-primary-mmap-gtt:</p>
<ul>
<li>bat-adls-6:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_171991v5/bat-adls-6/igt@kms_psr@psr-primary-mmap-gtt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/1072">i915#1072</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9732">i915#9732</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_setmode@basic-clone-single-crtc:</p>
<ul>
<li>bat-adls-6:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_171991v5/bat-adls-6/igt@kms_setmode@basic-clone-single-crtc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3555">i915#3555</a>)</li>
</ul>
</li>
<li>
<p>igt@prime_vgem@basic-fence-read:</p>
<ul>
<li>bat-adls-6:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_171991v5/bat-adls-6/igt@prime_vgem@basic-fence-read.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3291">i915#3291</a>) +2 other tests skip</li>
</ul>
</li>
</ul>
<h4>Possible fixes</h4>
<ul>
<li>igt@core_debugfs@read-all-entries:<ul>
<li>bat-adlp-6:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19214/bat-adlp-6/igt@core_debugfs@read-all-entries.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15673">i915#15673</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_171991v5/bat-adlp-6/igt@core_debugfs@read-all-entries.html">PASS</a></li>
</ul>
</li>
</ul>
<h2>Build changes</h2>
<ul>
<li>Linux: CI_DRM_19214 -&gt; Patchwork_171991v5</li>
</ul>
<p>CI-20190529: 20190529<br />
  CI_DRM_19214: a61293e633b18c618fd2f7d508cf558db0f42227 @ git://anongit.freedesktop.org/gfx-ci/linux<br />
  IGT_9111: 4aeabf104b136437d0ccc57caf32a752587d595c @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git<br />
  Patchwork_171991v5: a61293e633b18c618fd2f7d508cf558db0f42227 @ git://anongit.freedesktop.org/gfx-ci/linux</p>

</body>
</html>

--===============4637752489653309100==--
