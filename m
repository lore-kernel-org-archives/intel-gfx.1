Return-Path: <intel-gfx-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 43BE5C531D1
	for <intel-gfx@archiver.kernel.org>; Thu, 23 Jul 2026 15:19:22 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B8A6610E542;
	Thu, 23 Jul 2026 15:19:21 +0000 (UTC)
Received: from 6beec6c84f66 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C552210E5A7;
 Thu, 23 Jul 2026 15:19:20 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============7366826601034574856=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=93_i915=2ECI=2EBAT=3A_success_for_drm/i915/userptr=3A_Conve?=
 =?utf-8?q?rt_page_APIs_to_folio_equivalents_in_put=5Fpages?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Hongfu Li" <hongfu.li@linux.dev>
Cc: intel-gfx@lists.freedesktop.org
Date: Thu, 23 Jul 2026 15:19:20 -0000
Message-ID: <178481996079.221667.2262791532045336715@6beec6c84f66>
X-Patchwork-Hint: ignore
References: <20260723064651.4100-1-hongfu.li@linux.dev>
In-Reply-To: <20260723064651.4100-1-hongfu.li@linux.dev>
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

--===============7366826601034574856==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: drm/i915/userptr: Convert page APIs to folio equivalents in put_pages
URL   : https://patchwork.freedesktop.org/series/170999/
State : success

== Summary ==

CI Bug Log - changes from CI_DRM_18885 -> Patchwork_170999v1
====================================================

Summary
-------

  **SUCCESS**

  No regressions found.

  External URL: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_170999v1/index.html

Participating hosts (41 -> 40)
------------------------------

  Additional (1): fi-pnv-d510 
  Missing    (2): bat-dg2-13 fi-snb-2520m 

Known issues
------------

  Here are the changes found in Patchwork_170999v1 that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@fbdev@info:
    - fi-pnv-d510:        NOTRUN -> [SKIP][1] ([i915#1849])
   [1]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_170999v1/fi-pnv-d510/igt@fbdev@info.html

  * igt@kms_pipe_crc_basic@nonblocking-crc:
    - fi-pnv-d510:        NOTRUN -> [SKIP][2] ([i915#11190]) +16 other tests skip
   [2]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_170999v1/fi-pnv-d510/igt@kms_pipe_crc_basic@nonblocking-crc.html

  * igt@kms_psr@psr-primary-mmap-gtt:
    - fi-pnv-d510:        NOTRUN -> [SKIP][3] +31 other tests skip
   [3]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_170999v1/fi-pnv-d510/igt@kms_psr@psr-primary-mmap-gtt.html

  
#### Possible fixes ####

  * igt@i915_selftest@live:
    - fi-bsw-nick:        [INCOMPLETE][4] -> [PASS][5] +1 other test pass
   [4]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18885/fi-bsw-nick/igt@i915_selftest@live.html
   [5]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_170999v1/fi-bsw-nick/igt@i915_selftest@live.html

  * igt@kms_flip@basic-flip-vs-wf_vblank:
    - fi-bsw-n3050:       [DMESG-WARN][6] ([i915#16057]) -> [PASS][7] +1 other test pass
   [6]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18885/fi-bsw-n3050/igt@kms_flip@basic-flip-vs-wf_vblank.html
   [7]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_170999v1/fi-bsw-n3050/igt@kms_flip@basic-flip-vs-wf_vblank.html

  
  [i915#11190]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11190
  [i915#16057]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16057
  [i915#1849]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/1849


Build changes
-------------

  * Linux: CI_DRM_18885 -> Patchwork_170999v1

  CI-20190529: 20190529
  CI_DRM_18885: 2c64192f1ad194a53800f6dd8c779d5b4bbc1831 @ git://anongit.freedesktop.org/gfx-ci/linux
  IGT_9020: 9020
  Patchwork_170999v1: 2c64192f1ad194a53800f6dd8c779d5b4bbc1831 @ git://anongit.freedesktop.org/gfx-ci/linux

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_170999v1/index.html

--===============7366826601034574856==
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
<tr><td><b>Series:</b></td><td>drm/i915/userptr: Convert page APIs to folio equivalents in put_pages</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/170999/">https://patchwork.freedesktop.org/series/170999/</a></td></tr>
<tr><td><b>State:</b></td><td>success</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_170999v1/index.html">https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_170999v1/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from CI_DRM_18885 -&gt; Patchwork_170999v1</h1>
<h2>Summary</h2>
<p><strong>SUCCESS</strong></p>
<p>No regressions found.</p>
<p>External URL: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_170999v1/index.html</p>
<h2>Participating hosts (41 -&gt; 40)</h2>
<p>Additional (1): fi-pnv-d510 <br />
  Missing    (2): bat-dg2-13 fi-snb-2520m </p>
<h2>Known issues</h2>
<p>Here are the changes found in Patchwork_170999v1 that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>
<p>igt@fbdev@info:</p>
<ul>
<li>fi-pnv-d510:        NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_170999v1/fi-pnv-d510/igt@fbdev@info.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/1849">i915#1849</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pipe_crc_basic@nonblocking-crc:</p>
<ul>
<li>fi-pnv-d510:        NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_170999v1/fi-pnv-d510/igt@kms_pipe_crc_basic@nonblocking-crc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11190">i915#11190</a>) +16 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr@psr-primary-mmap-gtt:</p>
<ul>
<li>fi-pnv-d510:        NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_170999v1/fi-pnv-d510/igt@kms_psr@psr-primary-mmap-gtt.html">SKIP</a> +31 other tests skip</li>
</ul>
</li>
</ul>
<h4>Possible fixes</h4>
<ul>
<li>
<p>igt@i915_selftest@live:</p>
<ul>
<li>fi-bsw-nick:        <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18885/fi-bsw-nick/igt@i915_selftest@live.html">INCOMPLETE</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_170999v1/fi-bsw-nick/igt@i915_selftest@live.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@kms_flip@basic-flip-vs-wf_vblank:</p>
<ul>
<li>fi-bsw-n3050:       <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18885/fi-bsw-n3050/igt@kms_flip@basic-flip-vs-wf_vblank.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16057">i915#16057</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_170999v1/fi-bsw-n3050/igt@kms_flip@basic-flip-vs-wf_vblank.html">PASS</a> +1 other test pass</li>
</ul>
</li>
</ul>
<h2>Build changes</h2>
<ul>
<li>Linux: CI_DRM_18885 -&gt; Patchwork_170999v1</li>
</ul>
<p>CI-20190529: 20190529<br />
  CI_DRM_18885: 2c64192f1ad194a53800f6dd8c779d5b4bbc1831 @ git://anongit.freedesktop.org/gfx-ci/linux<br />
  IGT_9020: 9020<br />
  Patchwork_170999v1: 2c64192f1ad194a53800f6dd8c779d5b4bbc1831 @ git://anongit.freedesktop.org/gfx-ci/linux</p>

</body>
</html>

--===============7366826601034574856==--
