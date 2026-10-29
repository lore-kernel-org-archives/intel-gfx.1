Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E9903606A31E
	for <intel-gfx@archiver.kernel.org>; Thu, 29 Oct 2026 02:41:00 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 389C010E177;
	Thu, 29 Oct 2026 02:41:00 +0000 (UTC)
Received: from 221881a7231d (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B9FC810E177;
 Thu, 29 Oct 2026 02:40:58 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============8522723791630371167=="
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=97_i915=2ECI=2EBAT=3A_failure_for_Selftests_fixes_for_multi?=
 =?utf-8?q?-gt_platforms_in_i915?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Krzysztof Niemiec" <krzysztof.niemiec@intel.com>
Cc: intel-gfx@lists.freedesktop.org
Date: Thu, 29 Oct 2026 02:40:58 -0000
Message-ID: <179324165875.84791.6670787031295945073@221881a7231d>
X-Patchwork-Hint: ignore
References: <20261029014155.55865-1-krzysztof.niemiec@intel.com>
In-Reply-To: <20261029014155.55865-1-krzysztof.niemiec@intel.com>
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

--===============8522723791630371167==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: Selftests fixes for multi-gt platforms in i915
URL   : https://patchwork.freedesktop.org/series/177065/
State : failure

== Summary ==

CI Bug Log - changes from CI_DRM_19410 -> Patchwork_177065v1
====================================================

Summary
-------

  **FAILURE**

  Serious unknown changes coming with Patchwork_177065v1 absolutely need to be
  verified manually.
  
  If you think the reported changes have nothing to do with the changes
  introduced in Patchwork_177065v1, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them
  to document this new failure mode, which will reduce false positives in CI.

  External URL: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_177065v1/index.html

Participating hosts (40 -> 38)
------------------------------

  Missing    (2): bat-dg2-13 bat-arlh-3 

Possible new issues
-------------------

  Here are the unknown changes that may have been introduced in Patchwork_177065v1:

### IGT changes ###

#### Possible regressions ####

  * igt@i915_selftest@live:
    - bat-mtlp-8:         [PASS][1] -> [ABORT][2] +1 other test abort
   [1]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19410/bat-mtlp-8/igt@i915_selftest@live.html
   [2]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_177065v1/bat-mtlp-8/igt@i915_selftest@live.html

  * igt@i915_selftest@live@workarounds:
    - bat-arls-5:         [PASS][3] -> [INCOMPLETE][4] +1 other test incomplete
   [3]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19410/bat-arls-5/igt@i915_selftest@live@workarounds.html
   [4]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_177065v1/bat-arls-5/igt@i915_selftest@live@workarounds.html
    - bat-arlh-2:         [PASS][5] -> [INCOMPLETE][6]
   [5]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19410/bat-arlh-2/igt@i915_selftest@live@workarounds.html
   [6]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_177065v1/bat-arlh-2/igt@i915_selftest@live@workarounds.html
    - bat-arls-6:         [PASS][7] -> [ABORT][8] +1 other test abort
   [7]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19410/bat-arls-6/igt@i915_selftest@live@workarounds.html
   [8]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_177065v1/bat-arls-6/igt@i915_selftest@live@workarounds.html

  
New tests
---------

  New tests have been introduced between CI_DRM_19410 and Patchwork_177065v1:

### New IGT tests (46) ###

  * igt@i915_selftest@addfb25-4-tiled:
    - Statuses :
    - Exec time: [None] s

  * igt@i915_selftest@addfb25-bad-modifier:
    - Statuses :
    - Exec time: [None] s

  * igt@i915_selftest@addfb25-modifier-no-flag:
    - Statuses :
    - Exec time: [None] s

  * igt@i915_selftest@addfb25-y-tiled-legacy:
    - Statuses :
    - Exec time: [None] s

  * igt@i915_selftest@addfb25-yf-tiled-legacy:
    - Statuses :
    - Exec time: [None] s

  * igt@i915_selftest@bad-flink:
    - Statuses :
    - Exec time: [None] s

  * igt@i915_selftest@bad-pitch-0:
    - Statuses :
    - Exec time: [None] s

  * igt@i915_selftest@bad-pitch-32:
    - Statuses :
    - Exec time: [None] s

  * igt@i915_selftest@bad-pitch-63:
    - Statuses :
    - Exec time: [None] s

  * igt@i915_selftest@bad-pitch-65536:
    - Statuses :
    - Exec time: [None] s

  * igt@i915_selftest@bad-pitch-999:
    - Statuses :
    - Exec time: [None] s

  * igt@i915_selftest@basic-busy-flip-before-cursor-atomic:
    - Statuses :
    - Exec time: [None] s

  * igt@i915_selftest@basic-busy-flip-before-cursor-legacy:
    - Statuses :
    - Exec time: [None] s

  * igt@i915_selftest@basic-flip-after-cursor-atomic:
    - Statuses :
    - Exec time: [None] s

  * igt@i915_selftest@basic-flip-before-cursor-atomic:
    - Statuses :
    - Exec time: [None] s

  * igt@i915_selftest@basic-flip-before-cursor-legacy:
    - Statuses :
    - Exec time: [None] s

  * igt@i915_selftest@basic-flip-before-cursor-varying-size:
    - Statuses :
    - Exec time: [None] s

  * igt@i915_selftest@basic-flip-vs-dpms:
    - Statuses :
    - Exec time: [None] s

  * igt@i915_selftest@basic-pci-d3-state:
    - Statuses :
    - Exec time: [None] s

  * igt@i915_selftest@basic-plain-flip:
    - Statuses :
    - Exec time: [None] s

  * igt@i915_selftest@basic-with_fd_dup:
    - Statuses :
    - Exec time: [None] s

  * igt@i915_selftest@basic-x-tiled-legacy:
    - Statuses :
    - Exec time: [None] s

  * igt@i915_selftest@basic-y-tiled-legacy:
    - Statuses :
    - Exec time: [None] s

  * igt@i915_selftest@bo-too-small:
    - Statuses :
    - Exec time: [None] s

  * igt@i915_selftest@bo-too-small-due-to-tiling:
    - Statuses :
    - Exec time: [None] s

  * igt@i915_selftest@compare-crc-sanitycheck-nv12:
    - Statuses :
    - Exec time: [None] s

  * igt@i915_selftest@compare-crc-sanitycheck-xr24:
    - Statuses :
    - Exec time: [None] s

  * igt@i915_selftest@double-flink:
    - Statuses :
    - Exec time: [None] s

  * igt@i915_selftest@engines:
    - Statuses :
    - Exec time: [None] s

  * igt@i915_selftest@force-connector-state:
    - Statuses :
    - Exec time: [None] s

  * igt@i915_selftest@force-edid:
    - Statuses :
    - Exec time: [None] s

  * igt@i915_selftest@force-load-detect:
    - Statuses :
    - Exec time: [None] s

  * igt@i915_selftest@framebuffer-vs-set-tiling:
    - Statuses :
    - Exec time: [None] s

  * igt@i915_selftest@hang-read-crc:
    - Statuses :
    - Exec time: [None] s

  * igt@i915_selftest@invalid-get-prop-any:
    - Statuses :
    - Exec time: [None] s

  * igt@i915_selftest@nonblocking-crc:
    - Statuses :
    - Exec time: [None] s

  * igt@i915_selftest@prune-stale-modes:
    - Statuses :
    - Exec time: [None] s

  * igt@i915_selftest@psr-cursor-plane-move:
    - Statuses :
    - Exec time: [None] s

  * igt@i915_selftest@psr-primary-mmap-gtt:
    - Statuses :
    - Exec time: [None] s

  * igt@i915_selftest@psr-primary-page-flip:
    - Statuses :
    - Exec time: [None] s

  * igt@i915_selftest@psr-sprite-plane-onoff:
    - Statuses :
    - Exec time: [None] s

  * igt@i915_selftest@read-crc:
    - Statuses :
    - Exec time: [None] s

  * igt@i915_selftest@read-crc-frame-sequence:
    - Statuses :
    - Exec time: [None] s

  * igt@i915_selftest@size-max:
    - Statuses :
    - Exec time: [None] s

  * igt@i915_selftest@small-bo:
    - Statuses :
    - Exec time: [None] s

  * igt@i915_selftest@tile-pitch-mismatch:
    - Statuses :
    - Exec time: [None] s

  

Known issues
------------

  Here are the changes found in Patchwork_177065v1 that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@i915_selftest@live:
    - bat-arlh-2:         [PASS][9] -> [INCOMPLETE][10] ([i915#16547])
   [9]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19410/bat-arlh-2/igt@i915_selftest@live.html
   [10]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_177065v1/bat-arlh-2/igt@i915_selftest@live.html

  * igt@i915_selftest@live@workarounds:
    - bat-mtlp-9:         [PASS][11] -> [INCOMPLETE][12] ([i915#16229]) +1 other test incomplete
   [11]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19410/bat-mtlp-9/igt@i915_selftest@live@workarounds.html
   [12]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_177065v1/bat-mtlp-9/igt@i915_selftest@live@workarounds.html

  
  [i915#16229]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16229
  [i915#16547]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16547


Build changes
-------------

  * Linux: CI_DRM_19410 -> Patchwork_177065v1

  CI-20190529: 20190529
  CI_DRM_19410: 114156ff58b8db80a36355fd6a28725dc7e20584 @ git://anongit.freedesktop.org/gfx-ci/linux
  IGT_9170: 9170
  Patchwork_177065v1: 114156ff58b8db80a36355fd6a28725dc7e20584 @ git://anongit.freedesktop.org/gfx-ci/linux

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_177065v1/index.html

--===============8522723791630371167==
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
<tr><td><b>Series:</b></td><td>Selftests fixes for multi-gt platforms in i915</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/177065/">https://patchwork.freedesktop.org/series/177065/</a></td></tr>
<tr><td><b>State:</b></td><td>failure</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_177065v1/index.html">https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_177065v1/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from CI_DRM_19410 -&gt; Patchwork_177065v1</h1>
<h2>Summary</h2>
<p><strong>FAILURE</strong></p>
<p>Serious unknown changes coming with Patchwork_177065v1 absolutely need to be<br />
  verified manually.</p>
<p>If you think the reported changes have nothing to do with the changes<br />
  introduced in Patchwork_177065v1, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them<br />
  to document this new failure mode, which will reduce false positives in CI.</p>
<p>External URL: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_177065v1/index.html</p>
<h2>Participating hosts (40 -&gt; 38)</h2>
<p>Missing    (2): bat-dg2-13 bat-arlh-3 </p>
<h2>Possible new issues</h2>
<p>Here are the unknown changes that may have been introduced in Patchwork_177065v1:</p>
<h3>IGT changes</h3>
<h4>Possible regressions</h4>
<ul>
<li>
<p>igt@i915_selftest@live:</p>
<ul>
<li>bat-mtlp-8:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19410/bat-mtlp-8/igt@i915_selftest@live.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_177065v1/bat-mtlp-8/igt@i915_selftest@live.html">ABORT</a> +1 other test abort</li>
</ul>
</li>
<li>
<p>igt@i915_selftest@live@workarounds:</p>
<ul>
<li>bat-arls-5:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19410/bat-arls-5/igt@i915_selftest@live@workarounds.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_177065v1/bat-arls-5/igt@i915_selftest@live@workarounds.html">INCOMPLETE</a> +1 other test incomplete</li>
<li>bat-arlh-2:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19410/bat-arlh-2/igt@i915_selftest@live@workarounds.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_177065v1/bat-arlh-2/igt@i915_selftest@live@workarounds.html">INCOMPLETE</a></li>
<li>bat-arls-6:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19410/bat-arls-6/igt@i915_selftest@live@workarounds.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_177065v1/bat-arls-6/igt@i915_selftest@live@workarounds.html">ABORT</a> +1 other test abort</li>
</ul>
</li>
</ul>
<h2>New tests</h2>
<p>New tests have been introduced between CI_DRM_19410 and Patchwork_177065v1:</p>
<h3>New IGT tests (46)</h3>
<ul>
<li>
<p>igt@i915_selftest@addfb25-4-tiled:</p>
<ul>
<li>Statuses :</li>
<li>Exec time: [None] s</li>
</ul>
</li>
<li>
<p>igt@i915_selftest@addfb25-bad-modifier:</p>
<ul>
<li>Statuses :</li>
<li>Exec time: [None] s</li>
</ul>
</li>
<li>
<p>igt@i915_selftest@addfb25-modifier-no-flag:</p>
<ul>
<li>Statuses :</li>
<li>Exec time: [None] s</li>
</ul>
</li>
<li>
<p>igt@i915_selftest@addfb25-y-tiled-legacy:</p>
<ul>
<li>Statuses :</li>
<li>Exec time: [None] s</li>
</ul>
</li>
<li>
<p>igt@i915_selftest@addfb25-yf-tiled-legacy:</p>
<ul>
<li>Statuses :</li>
<li>Exec time: [None] s</li>
</ul>
</li>
<li>
<p>igt@i915_selftest@bad-flink:</p>
<ul>
<li>Statuses :</li>
<li>Exec time: [None] s</li>
</ul>
</li>
<li>
<p>igt@i915_selftest@bad-pitch-0:</p>
<ul>
<li>Statuses :</li>
<li>Exec time: [None] s</li>
</ul>
</li>
<li>
<p>igt@i915_selftest@bad-pitch-32:</p>
<ul>
<li>Statuses :</li>
<li>Exec time: [None] s</li>
</ul>
</li>
<li>
<p>igt@i915_selftest@bad-pitch-63:</p>
<ul>
<li>Statuses :</li>
<li>Exec time: [None] s</li>
</ul>
</li>
<li>
<p>igt@i915_selftest@bad-pitch-65536:</p>
<ul>
<li>Statuses :</li>
<li>Exec time: [None] s</li>
</ul>
</li>
<li>
<p>igt@i915_selftest@bad-pitch-999:</p>
<ul>
<li>Statuses :</li>
<li>Exec time: [None] s</li>
</ul>
</li>
<li>
<p>igt@i915_selftest@basic-busy-flip-before-cursor-atomic:</p>
<ul>
<li>Statuses :</li>
<li>Exec time: [None] s</li>
</ul>
</li>
<li>
<p>igt@i915_selftest@basic-busy-flip-before-cursor-legacy:</p>
<ul>
<li>Statuses :</li>
<li>Exec time: [None] s</li>
</ul>
</li>
<li>
<p>igt@i915_selftest@basic-flip-after-cursor-atomic:</p>
<ul>
<li>Statuses :</li>
<li>Exec time: [None] s</li>
</ul>
</li>
<li>
<p>igt@i915_selftest@basic-flip-before-cursor-atomic:</p>
<ul>
<li>Statuses :</li>
<li>Exec time: [None] s</li>
</ul>
</li>
<li>
<p>igt@i915_selftest@basic-flip-before-cursor-legacy:</p>
<ul>
<li>Statuses :</li>
<li>Exec time: [None] s</li>
</ul>
</li>
<li>
<p>igt@i915_selftest@basic-flip-before-cursor-varying-size:</p>
<ul>
<li>Statuses :</li>
<li>Exec time: [None] s</li>
</ul>
</li>
<li>
<p>igt@i915_selftest@basic-flip-vs-dpms:</p>
<ul>
<li>Statuses :</li>
<li>Exec time: [None] s</li>
</ul>
</li>
<li>
<p>igt@i915_selftest@basic-pci-d3-state:</p>
<ul>
<li>Statuses :</li>
<li>Exec time: [None] s</li>
</ul>
</li>
<li>
<p>igt@i915_selftest@basic-plain-flip:</p>
<ul>
<li>Statuses :</li>
<li>Exec time: [None] s</li>
</ul>
</li>
<li>
<p>igt@i915_selftest@basic-with_fd_dup:</p>
<ul>
<li>Statuses :</li>
<li>Exec time: [None] s</li>
</ul>
</li>
<li>
<p>igt@i915_selftest@basic-x-tiled-legacy:</p>
<ul>
<li>Statuses :</li>
<li>Exec time: [None] s</li>
</ul>
</li>
<li>
<p>igt@i915_selftest@basic-y-tiled-legacy:</p>
<ul>
<li>Statuses :</li>
<li>Exec time: [None] s</li>
</ul>
</li>
<li>
<p>igt@i915_selftest@bo-too-small:</p>
<ul>
<li>Statuses :</li>
<li>Exec time: [None] s</li>
</ul>
</li>
<li>
<p>igt@i915_selftest@bo-too-small-due-to-tiling:</p>
<ul>
<li>Statuses :</li>
<li>Exec time: [None] s</li>
</ul>
</li>
<li>
<p>igt@i915_selftest@compare-crc-sanitycheck-nv12:</p>
<ul>
<li>Statuses :</li>
<li>Exec time: [None] s</li>
</ul>
</li>
<li>
<p>igt@i915_selftest@compare-crc-sanitycheck-xr24:</p>
<ul>
<li>Statuses :</li>
<li>Exec time: [None] s</li>
</ul>
</li>
<li>
<p>igt@i915_selftest@double-flink:</p>
<ul>
<li>Statuses :</li>
<li>Exec time: [None] s</li>
</ul>
</li>
<li>
<p>igt@i915_selftest@engines:</p>
<ul>
<li>Statuses :</li>
<li>Exec time: [None] s</li>
</ul>
</li>
<li>
<p>igt@i915_selftest@force-connector-state:</p>
<ul>
<li>Statuses :</li>
<li>Exec time: [None] s</li>
</ul>
</li>
<li>
<p>igt@i915_selftest@force-edid:</p>
<ul>
<li>Statuses :</li>
<li>Exec time: [None] s</li>
</ul>
</li>
<li>
<p>igt@i915_selftest@force-load-detect:</p>
<ul>
<li>Statuses :</li>
<li>Exec time: [None] s</li>
</ul>
</li>
<li>
<p>igt@i915_selftest@framebuffer-vs-set-tiling:</p>
<ul>
<li>Statuses :</li>
<li>Exec time: [None] s</li>
</ul>
</li>
<li>
<p>igt@i915_selftest@hang-read-crc:</p>
<ul>
<li>Statuses :</li>
<li>Exec time: [None] s</li>
</ul>
</li>
<li>
<p>igt@i915_selftest@invalid-get-prop-any:</p>
<ul>
<li>Statuses :</li>
<li>Exec time: [None] s</li>
</ul>
</li>
<li>
<p>igt@i915_selftest@nonblocking-crc:</p>
<ul>
<li>Statuses :</li>
<li>Exec time: [None] s</li>
</ul>
</li>
<li>
<p>igt@i915_selftest@prune-stale-modes:</p>
<ul>
<li>Statuses :</li>
<li>Exec time: [None] s</li>
</ul>
</li>
<li>
<p>igt@i915_selftest@psr-cursor-plane-move:</p>
<ul>
<li>Statuses :</li>
<li>Exec time: [None] s</li>
</ul>
</li>
<li>
<p>igt@i915_selftest@psr-primary-mmap-gtt:</p>
<ul>
<li>Statuses :</li>
<li>Exec time: [None] s</li>
</ul>
</li>
<li>
<p>igt@i915_selftest@psr-primary-page-flip:</p>
<ul>
<li>Statuses :</li>
<li>Exec time: [None] s</li>
</ul>
</li>
<li>
<p>igt@i915_selftest@psr-sprite-plane-onoff:</p>
<ul>
<li>Statuses :</li>
<li>Exec time: [None] s</li>
</ul>
</li>
<li>
<p>igt@i915_selftest@read-crc:</p>
<ul>
<li>Statuses :</li>
<li>Exec time: [None] s</li>
</ul>
</li>
<li>
<p>igt@i915_selftest@read-crc-frame-sequence:</p>
<ul>
<li>Statuses :</li>
<li>Exec time: [None] s</li>
</ul>
</li>
<li>
<p>igt@i915_selftest@size-max:</p>
<ul>
<li>Statuses :</li>
<li>Exec time: [None] s</li>
</ul>
</li>
<li>
<p>igt@i915_selftest@small-bo:</p>
<ul>
<li>Statuses :</li>
<li>Exec time: [None] s</li>
</ul>
</li>
<li>
<p>igt@i915_selftest@tile-pitch-mismatch:</p>
<ul>
<li>Statuses :</li>
<li>Exec time: [None] s</li>
</ul>
</li>
</ul>
<h2>Known issues</h2>
<p>Here are the changes found in Patchwork_177065v1 that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>
<p>igt@i915_selftest@live:</p>
<ul>
<li>bat-arlh-2:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19410/bat-arlh-2/igt@i915_selftest@live.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_177065v1/bat-arlh-2/igt@i915_selftest@live.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16547">i915#16547</a>)</li>
</ul>
</li>
<li>
<p>igt@i915_selftest@live@workarounds:</p>
<ul>
<li>bat-mtlp-9:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19410/bat-mtlp-9/igt@i915_selftest@live@workarounds.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_177065v1/bat-mtlp-9/igt@i915_selftest@live@workarounds.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16229">i915#16229</a>) +1 other test incomplete</li>
</ul>
</li>
</ul>
<h2>Build changes</h2>
<ul>
<li>Linux: CI_DRM_19410 -&gt; Patchwork_177065v1</li>
</ul>
<p>CI-20190529: 20190529<br />
  CI_DRM_19410: 114156ff58b8db80a36355fd6a28725dc7e20584 @ git://anongit.freedesktop.org/gfx-ci/linux<br />
  IGT_9170: 9170<br />
  Patchwork_177065v1: 114156ff58b8db80a36355fd6a28725dc7e20584 @ git://anongit.freedesktop.org/gfx-ci/linux</p>

</body>
</html>

--===============8522723791630371167==--
