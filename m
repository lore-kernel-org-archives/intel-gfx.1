Return-Path: <intel-gfx-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 37E04E7716B
	for <intel-gfx@archiver.kernel.org>; Wed,  4 Dec 2024 13:12:11 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BC3C010E4CA;
	Wed,  4 Dec 2024 13:12:10 +0000 (UTC)
Received: from b555e5b46a47 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 58B1010E4CA;
 Wed,  4 Dec 2024 13:12:09 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=97_i915=2ECI=2EBAT=3A_failure_for_LOBF_enablement_fix_=28re?=
 =?utf-8?q?v2=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Manna, Animesh" <animesh.manna@intel.com>
Cc: intel-gfx@lists.freedesktop.org
Date: Wed, 04 Dec 2024 13:12:09 -0000
Message-ID: <173331792935.2477718.5403519351741257859@b555e5b46a47>
X-Patchwork-Hint: ignore
References: <20241204100328.3738778-1-animesh.manna@intel.com>
In-Reply-To: <20241204100328.3738778-1-animesh.manna@intel.com>
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

== Series Details ==

Series: LOBF enablement fix (rev2)
URL   : https://patchwork.freedesktop.org/series/141974/
State : failure

== Summary ==

CI Bug Log - changes from CI_DRM_15786 -> Patchwork_141974v2
====================================================

Summary
-------

  **FAILURE**

  Serious unknown changes coming with Patchwork_141974v2 absolutely need to be
  verified manually.
  
  If you think the reported changes have nothing to do with the changes
  introduced in Patchwork_141974v2, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them
  to document this new failure mode, which will reduce false positives in CI.

  External URL: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_141974v2/index.html

Participating hosts (44 -> 43)
------------------------------

  Missing    (1): fi-snb-2520m 

Possible new issues
-------------------

  Here are the unknown changes that may have been introduced in Patchwork_141974v2:

### IGT changes ###

#### Possible regressions ####

  * igt@kms_cursor_legacy@basic-flip-before-cursor-varying-size:
    - fi-kbl-7567u:       [PASS][1] -> [DMESG-WARN][2]
   [1]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15786/fi-kbl-7567u/igt@kms_cursor_legacy@basic-flip-before-cursor-varying-size.html
   [2]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_141974v2/fi-kbl-7567u/igt@kms_cursor_legacy@basic-flip-before-cursor-varying-size.html

  
Known issues
------------

  Here are the changes found in Patchwork_141974v2 that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@i915_module_load@reload:
    - bat-twl-1:          [PASS][3] -> [DMESG-WARN][4] ([i915#1982])
   [3]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15786/bat-twl-1/igt@i915_module_load@reload.html
   [4]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_141974v2/bat-twl-1/igt@i915_module_load@reload.html

  * igt@i915_selftest@live@gt_mocs:
    - bat-twl-2:          [PASS][5] -> [ABORT][6] ([i915#12919]) +1 other test abort
   [5]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15786/bat-twl-2/igt@i915_selftest@live@gt_mocs.html
   [6]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_141974v2/bat-twl-2/igt@i915_selftest@live@gt_mocs.html

  
#### Possible fixes ####

  * igt@i915_module_load@load:
    - bat-twl-1:          [DMESG-WARN][7] ([i915#1982]) -> [PASS][8]
   [7]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15786/bat-twl-1/igt@i915_module_load@load.html
   [8]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_141974v2/bat-twl-1/igt@i915_module_load@load.html

  * igt@i915_pm_rpm@module-reload:
    - bat-rpls-4:         [FAIL][9] ([i915#12903]) -> [PASS][10]
   [9]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15786/bat-rpls-4/igt@i915_pm_rpm@module-reload.html
   [10]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_141974v2/bat-rpls-4/igt@i915_pm_rpm@module-reload.html

  * igt@i915_selftest@live@workarounds:
    - bat-mtlp-6:         [ABORT][11] ([i915#12061]) -> [PASS][12] +1 other test pass
   [11]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15786/bat-mtlp-6/igt@i915_selftest@live@workarounds.html
   [12]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_141974v2/bat-mtlp-6/igt@i915_selftest@live@workarounds.html

  
  {name}: This element is suppressed. This means it is ignored when computing
          the status of the difference (SUCCESS, WARNING, or FAILURE).

  [i915#12061]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12061
  [i915#12903]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12903
  [i915#12919]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12919
  [i915#1982]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/1982


Build changes
-------------

  * Linux: CI_DRM_15786 -> Patchwork_141974v2

  CI-20190529: 20190529
  CI_DRM_15786: c8df5caf278df4f9ca0aba627047c5ee4318fc0d @ git://anongit.freedesktop.org/gfx-ci/linux
  IGT_8137: 8137
  Patchwork_141974v2: c8df5caf278df4f9ca0aba627047c5ee4318fc0d @ git://anongit.freedesktop.org/gfx-ci/linux

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_141974v2/index.html
