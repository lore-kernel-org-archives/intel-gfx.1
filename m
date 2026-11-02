Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A52A1606E000
	for <intel-gfx@archiver.kernel.org>; Mon,  2 Nov 2026 15:46:51 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3E4E110F043;
	Mon,  2 Nov 2026 15:46:51 +0000 (UTC)
Received: from 221881a7231d (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3AC9910F021;
 Mon,  2 Nov 2026 15:46:50 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============3951521690612352414=="
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=93_i915=2ECI=2EBAT=3A_success_for_drm/i915=3A_Reject_=3C_10?=
 =?utf-8?q?_MHz_dotclocks_early?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: =?utf-8?b?VmlsbGUgU3lyasOkbMOk?= <ville.syrjala@linux.intel.com>
Cc: intel-gfx@lists.freedesktop.org
Date: Mon, 02 Nov 2026 15:46:50 -0000
Message-ID: <179363441023.104801.6553958446985923066@221881a7231d>
X-Patchwork-Hint: ignore
References: <20261102130319.2747-1-ville.syrjala@linux.intel.com>
In-Reply-To: <20261102130319.2747-1-ville.syrjala@linux.intel.com>
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

--===============3951521690612352414==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: drm/i915: Reject < 10 MHz dotclocks early
URL   : https://patchwork.freedesktop.org/series/177452/
State : success

== Summary ==

CI Bug Log - changes from CI_DRM_19430 -> Patchwork_177452v1
====================================================

Summary
-------

  **SUCCESS**

  No regressions found.

  External URL: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_177452v1/index.html

Participating hosts (40 -> 38)
------------------------------

  Missing    (2): bat-dg2-13 bat-adls-6 

Known issues
------------

  Here are the changes found in Patchwork_177452v1 that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@fbdev@info:
    - fi-pnv-d510:        NOTRUN -> [SKIP][1] ([i915#1849])
   [1]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_177452v1/fi-pnv-d510/igt@fbdev@info.html

  * igt@fbdev@write:
    - fi-pnv-d510:        NOTRUN -> [SKIP][2] ([i915#17464]) +3 other tests skip
   [2]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_177452v1/fi-pnv-d510/igt@fbdev@write.html

  * igt@gem_exec_parallel@engines@contexts:
    - fi-pnv-d510:        NOTRUN -> [SKIP][3] ([i915#17475]) +3 other tests skip
   [3]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_177452v1/fi-pnv-d510/igt@gem_exec_parallel@engines@contexts.html

  * igt@gem_exec_parallel@engines@fds:
    - fi-pnv-d510:        NOTRUN -> [SKIP][4] ([i915#17470])
   [4]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_177452v1/fi-pnv-d510/igt@gem_exec_parallel@engines@fds.html

  * igt@gem_huc_copy@huc-copy:
    - fi-pnv-d510:        NOTRUN -> [SKIP][5] ([i915#17468])
   [5]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_177452v1/fi-pnv-d510/igt@gem_huc_copy@huc-copy.html

  * igt@gem_lmem_swapping@basic:
    - fi-pnv-d510:        NOTRUN -> [SKIP][6] ([i915#11671]) +3 other tests skip
   [6]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_177452v1/fi-pnv-d510/igt@gem_lmem_swapping@basic.html

  * igt@gem_softpin@safe-alignment:
    - fi-pnv-d510:        NOTRUN -> [SKIP][7] ([i915#17471]) +2 other tests skip
   [7]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_177452v1/fi-pnv-d510/igt@gem_softpin@safe-alignment.html

  * igt@i915_pm_rpm@module-reload:
    - fi-pnv-d510:        NOTRUN -> [SKIP][8] ([i915#17473]) +2 other tests skip
   [8]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_177452v1/fi-pnv-d510/igt@i915_pm_rpm@module-reload.html

  * igt@i915_pm_rps@basic-api:
    - fi-pnv-d510:        NOTRUN -> [SKIP][9] ([i915#17474])
   [9]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_177452v1/fi-pnv-d510/igt@i915_pm_rps@basic-api.html

  * igt@intel_hwmon@hwmon-read:
    - fi-pnv-d510:        NOTRUN -> [SKIP][10] ([i915#11680]) +1 other test skip
   [10]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_177452v1/fi-pnv-d510/igt@intel_hwmon@hwmon-read.html

  * igt@kms_addfb_basic@addfb25-y-tiled-small-legacy:
    - fi-pnv-d510:        NOTRUN -> [SKIP][11] ([i915#17469])
   [11]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_177452v1/fi-pnv-d510/igt@kms_addfb_basic@addfb25-y-tiled-small-legacy.html

  * igt@kms_frontbuffer_tracking@basic:
    - fi-pnv-d510:        NOTRUN -> [SKIP][12] ([i915#17466])
   [12]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_177452v1/fi-pnv-d510/igt@kms_frontbuffer_tracking@basic.html

  * igt@kms_hdmi_inject@inject-audio:
    - fi-pnv-d510:        NOTRUN -> [SKIP][13] ([i915#15725])
   [13]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_177452v1/fi-pnv-d510/igt@kms_hdmi_inject@inject-audio.html

  * igt@kms_pipe_crc_basic@nonblocking-crc:
    - fi-pnv-d510:        NOTRUN -> [SKIP][14] ([i915#11190]) +16 other tests skip
   [14]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_177452v1/fi-pnv-d510/igt@kms_pipe_crc_basic@nonblocking-crc.html

  * igt@kms_pm_backlight@basic-brightness:
    - fi-pnv-d510:        NOTRUN -> [SKIP][15] ([i915#17462])
   [15]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_177452v1/fi-pnv-d510/igt@kms_pm_backlight@basic-brightness.html

  * igt@kms_psr@psr-cursor-plane-move:
    - fi-pnv-d510:        NOTRUN -> [SKIP][16] ([i915#9732]) +3 other tests skip
   [16]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_177452v1/fi-pnv-d510/igt@kms_psr@psr-cursor-plane-move.html

  * igt@kms_setmode@basic-clone-single-crtc:
    - fi-pnv-d510:        NOTRUN -> [SKIP][17] ([i915#17463])
   [17]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_177452v1/fi-pnv-d510/igt@kms_setmode@basic-clone-single-crtc.html

  * igt@prime_vgem@basic-fence-flip:
    - fi-pnv-d510:        NOTRUN -> [SKIP][18] ([i915#17467])
   [18]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_177452v1/fi-pnv-d510/igt@prime_vgem@basic-fence-flip.html

  * igt@runner@aborted:
    - fi-bsw-n3050:       NOTRUN -> [FAIL][19] ([i915#17747])
   [19]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_177452v1/fi-bsw-n3050/igt@runner@aborted.html

  
  [i915#11190]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11190
  [i915#11671]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11671
  [i915#11680]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11680
  [i915#15725]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15725
  [i915#17462]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17462
  [i915#17463]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17463
  [i915#17464]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17464
  [i915#17466]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17466
  [i915#17467]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17467
  [i915#17468]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17468
  [i915#17469]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17469
  [i915#17470]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17470
  [i915#17471]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17471
  [i915#17473]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17473
  [i915#17474]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17474
  [i915#17475]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17475
  [i915#17747]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17747
  [i915#1849]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/1849
  [i915#9732]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9732


Build changes
-------------

  * Linux: CI_DRM_19430 -> Patchwork_177452v1

  CI-20190529: 20190529
  CI_DRM_19430: 79cefeb775e63da397152ab01c2f1d4fa1b9b46d @ git://anongit.freedesktop.org/gfx-ci/linux
  IGT_9174: bb222a83882fe443bd3285f34c475813865b301e @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
  Patchwork_177452v1: 79cefeb775e63da397152ab01c2f1d4fa1b9b46d @ git://anongit.freedesktop.org/gfx-ci/linux

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_177452v1/index.html

--===============3951521690612352414==
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
<tr><td><b>Series:</b></td><td>drm/i915: Reject &lt; 10 MHz dotclocks early</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/177452/">https://patchwork.freedesktop.org/series/177452/</a></td></tr>
<tr><td><b>State:</b></td><td>success</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_177452v1/index.html">https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_177452v1/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from CI_DRM_19430 -&gt; Patchwork_177452v1</h1>
<h2>Summary</h2>
<p><strong>SUCCESS</strong></p>
<p>No regressions found.</p>
<p>External URL: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_177452v1/index.html</p>
<h2>Participating hosts (40 -&gt; 38)</h2>
<p>Missing    (2): bat-dg2-13 bat-adls-6 </p>
<h2>Known issues</h2>
<p>Here are the changes found in Patchwork_177452v1 that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>
<p>igt@fbdev@info:</p>
<ul>
<li>fi-pnv-d510:        NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_177452v1/fi-pnv-d510/igt@fbdev@info.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/1849">i915#1849</a>)</li>
</ul>
</li>
<li>
<p>igt@fbdev@write:</p>
<ul>
<li>fi-pnv-d510:        NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_177452v1/fi-pnv-d510/igt@fbdev@write.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17464">i915#17464</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@gem_exec_parallel@engines@contexts:</p>
<ul>
<li>fi-pnv-d510:        NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_177452v1/fi-pnv-d510/igt@gem_exec_parallel@engines@contexts.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17475">i915#17475</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@gem_exec_parallel@engines@fds:</p>
<ul>
<li>fi-pnv-d510:        NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_177452v1/fi-pnv-d510/igt@gem_exec_parallel@engines@fds.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17470">i915#17470</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_huc_copy@huc-copy:</p>
<ul>
<li>fi-pnv-d510:        NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_177452v1/fi-pnv-d510/igt@gem_huc_copy@huc-copy.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17468">i915#17468</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_lmem_swapping@basic:</p>
<ul>
<li>fi-pnv-d510:        NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_177452v1/fi-pnv-d510/igt@gem_lmem_swapping@basic.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11671">i915#11671</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@gem_softpin@safe-alignment:</p>
<ul>
<li>fi-pnv-d510:        NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_177452v1/fi-pnv-d510/igt@gem_softpin@safe-alignment.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17471">i915#17471</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@i915_pm_rpm@module-reload:</p>
<ul>
<li>fi-pnv-d510:        NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_177452v1/fi-pnv-d510/igt@i915_pm_rpm@module-reload.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17473">i915#17473</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@i915_pm_rps@basic-api:</p>
<ul>
<li>fi-pnv-d510:        NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_177452v1/fi-pnv-d510/igt@i915_pm_rps@basic-api.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17474">i915#17474</a>)</li>
</ul>
</li>
<li>
<p>igt@intel_hwmon@hwmon-read:</p>
<ul>
<li>fi-pnv-d510:        NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_177452v1/fi-pnv-d510/igt@intel_hwmon@hwmon-read.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11680">i915#11680</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_addfb_basic@addfb25-y-tiled-small-legacy:</p>
<ul>
<li>fi-pnv-d510:        NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_177452v1/fi-pnv-d510/igt@kms_addfb_basic@addfb25-y-tiled-small-legacy.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17469">i915#17469</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@basic:</p>
<ul>
<li>fi-pnv-d510:        NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_177452v1/fi-pnv-d510/igt@kms_frontbuffer_tracking@basic.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17466">i915#17466</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_hdmi_inject@inject-audio:</p>
<ul>
<li>fi-pnv-d510:        NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_177452v1/fi-pnv-d510/igt@kms_hdmi_inject@inject-audio.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15725">i915#15725</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pipe_crc_basic@nonblocking-crc:</p>
<ul>
<li>fi-pnv-d510:        NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_177452v1/fi-pnv-d510/igt@kms_pipe_crc_basic@nonblocking-crc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11190">i915#11190</a>) +16 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_pm_backlight@basic-brightness:</p>
<ul>
<li>fi-pnv-d510:        NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_177452v1/fi-pnv-d510/igt@kms_pm_backlight@basic-brightness.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17462">i915#17462</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr@psr-cursor-plane-move:</p>
<ul>
<li>fi-pnv-d510:        NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_177452v1/fi-pnv-d510/igt@kms_psr@psr-cursor-plane-move.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9732">i915#9732</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_setmode@basic-clone-single-crtc:</p>
<ul>
<li>fi-pnv-d510:        NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_177452v1/fi-pnv-d510/igt@kms_setmode@basic-clone-single-crtc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17463">i915#17463</a>)</li>
</ul>
</li>
<li>
<p>igt@prime_vgem@basic-fence-flip:</p>
<ul>
<li>fi-pnv-d510:        NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_177452v1/fi-pnv-d510/igt@prime_vgem@basic-fence-flip.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17467">i915#17467</a>)</li>
</ul>
</li>
<li>
<p>igt@runner@aborted:</p>
<ul>
<li>fi-bsw-n3050:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_177452v1/fi-bsw-n3050/igt@runner@aborted.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17747">i915#17747</a>)</li>
</ul>
</li>
</ul>
<h2>Build changes</h2>
<ul>
<li>Linux: CI_DRM_19430 -&gt; Patchwork_177452v1</li>
</ul>
<p>CI-20190529: 20190529<br />
  CI_DRM_19430: 79cefeb775e63da397152ab01c2f1d4fa1b9b46d @ git://anongit.freedesktop.org/gfx-ci/linux<br />
  IGT_9174: bb222a83882fe443bd3285f34c475813865b301e @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git<br />
  Patchwork_177452v1: 79cefeb775e63da397152ab01c2f1d4fa1b9b46d @ git://anongit.freedesktop.org/gfx-ci/linux</p>

</body>
</html>

--===============3951521690612352414==--
