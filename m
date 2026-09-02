Return-Path: <intel-gfx-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8CDCAC61DFD
	for <intel-gfx@archiver.kernel.org>; Wed,  2 Sep 2026 05:58:03 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7326B10E46F;
	Wed,  2 Sep 2026 05:58:02 +0000 (UTC)
Received: from 61270ab9df2a (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D1AF210E46F;
 Wed,  2 Sep 2026 05:58:00 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============2147085111443295099=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=93_i915=2ECI=2EBAT=3A_success_for_drm/i915/display=3A_Enabl?=
 =?utf-8?q?e_VRR/HDR_over_MST_=28rev6=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Xiao Lu" <xiaolu.xie@intel.com>
Cc: intel-gfx@lists.freedesktop.org
Date: Wed, 02 Sep 2026 05:58:00 -0000
Message-ID: <178832868085.109472.14027521256563500796@61270ab9df2a>
X-Patchwork-Hint: ignore
References: <20260901132601.239131-1-xiaolu.xie@intel.com>
In-Reply-To: <20260901132601.239131-1-xiaolu.xie@intel.com>
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

--===============2147085111443295099==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: drm/i915/display: Enable VRR/HDR over MST (rev6)
URL   : https://patchwork.freedesktop.org/series/173155/
State : success

== Summary ==

CI Bug Log - changes from CI_DRM_19069 -> Patchwork_173155v6
====================================================

Summary
-------

  **SUCCESS**

  No regressions found.

  External URL: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_173155v6/index.html

Participating hosts (37 -> 36)
------------------------------

  Missing    (1): bat-dg2-13 

Known issues
------------

  Here are the changes found in Patchwork_173155v6 that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@i915_selftest@live@ring_submission:
    - fi-cfl-8109u:       [PASS][1] -> [DMESG-WARN][2] ([i915#13735]) +80 other tests dmesg-warn
   [1]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19069/fi-cfl-8109u/igt@i915_selftest@live@ring_submission.html
   [2]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_173155v6/fi-cfl-8109u/igt@i915_selftest@live@ring_submission.html

  * igt@kms_flip@basic-flip-vs-dpms@d-hdmi-a1:
    - fi-tgl-1115g4:      [PASS][3] -> [ABORT][4] ([i915#16837] / [i915#16876] / [i915#16881]) +1 other test abort
   [3]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19069/fi-tgl-1115g4/igt@kms_flip@basic-flip-vs-dpms@d-hdmi-a1.html
   [4]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_173155v6/fi-tgl-1115g4/igt@kms_flip@basic-flip-vs-dpms@d-hdmi-a1.html

  * igt@kms_pipe_crc_basic@read-crc:
    - fi-cfl-8109u:       [PASS][5] -> [DMESG-WARN][6] ([i915#13735] / [i915#15673]) +49 other tests dmesg-warn
   [5]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19069/fi-cfl-8109u/igt@kms_pipe_crc_basic@read-crc.html
   [6]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_173155v6/fi-cfl-8109u/igt@kms_pipe_crc_basic@read-crc.html

  
#### Possible fixes ####

  * igt@kms_pm_rpm@basic-pci-d3-state:
    - fi-kbl-7567u:       [DMESG-WARN][7] ([i915#15673]) -> [PASS][8] +51 other tests pass
   [7]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19069/fi-kbl-7567u/igt@kms_pm_rpm@basic-pci-d3-state.html
   [8]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_173155v6/fi-kbl-7567u/igt@kms_pm_rpm@basic-pci-d3-state.html

  
  [i915#13735]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13735
  [i915#15673]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15673
  [i915#16837]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16837
  [i915#16876]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16876
  [i915#16881]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16881


Build changes
-------------

  * Linux: CI_DRM_19069 -> Patchwork_173155v6

  CI-20190529: 20190529
  CI_DRM_19069: c53467440a5196138d2d6610e269a43b6b47bf6b @ git://anongit.freedesktop.org/gfx-ci/linux
  IGT_9079: 9079
  Patchwork_173155v6: c53467440a5196138d2d6610e269a43b6b47bf6b @ git://anongit.freedesktop.org/gfx-ci/linux

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_173155v6/index.html

--===============2147085111443295099==
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
<tr><td><b>Series:</b></td><td>drm/i915/display: Enable VRR/HDR over MST (rev6)</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/173155/">https://patchwork.freedesktop.org/series/173155/</a></td></tr>
<tr><td><b>State:</b></td><td>success</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_173155v6/index.html">https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_173155v6/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from CI_DRM_19069 -&gt; Patchwork_173155v6</h1>
<h2>Summary</h2>
<p><strong>SUCCESS</strong></p>
<p>No regressions found.</p>
<p>External URL: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_173155v6/index.html</p>
<h2>Participating hosts (37 -&gt; 36)</h2>
<p>Missing    (1): bat-dg2-13 </p>
<h2>Known issues</h2>
<p>Here are the changes found in Patchwork_173155v6 that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>
<p>igt@i915_selftest@live@ring_submission:</p>
<ul>
<li>fi-cfl-8109u:       <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19069/fi-cfl-8109u/igt@i915_selftest@live@ring_submission.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_173155v6/fi-cfl-8109u/igt@i915_selftest@live@ring_submission.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13735">i915#13735</a>) +80 other tests dmesg-warn</li>
</ul>
</li>
<li>
<p>igt@kms_flip@basic-flip-vs-dpms@d-hdmi-a1:</p>
<ul>
<li>fi-tgl-1115g4:      <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19069/fi-tgl-1115g4/igt@kms_flip@basic-flip-vs-dpms@d-hdmi-a1.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_173155v6/fi-tgl-1115g4/igt@kms_flip@basic-flip-vs-dpms@d-hdmi-a1.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16837">i915#16837</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16876">i915#16876</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16881">i915#16881</a>) +1 other test abort</li>
</ul>
</li>
<li>
<p>igt@kms_pipe_crc_basic@read-crc:</p>
<ul>
<li>fi-cfl-8109u:       <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19069/fi-cfl-8109u/igt@kms_pipe_crc_basic@read-crc.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_173155v6/fi-cfl-8109u/igt@kms_pipe_crc_basic@read-crc.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13735">i915#13735</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15673">i915#15673</a>) +49 other tests dmesg-warn</li>
</ul>
</li>
</ul>
<h4>Possible fixes</h4>
<ul>
<li>igt@kms_pm_rpm@basic-pci-d3-state:<ul>
<li>fi-kbl-7567u:       <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19069/fi-kbl-7567u/igt@kms_pm_rpm@basic-pci-d3-state.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15673">i915#15673</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_173155v6/fi-kbl-7567u/igt@kms_pm_rpm@basic-pci-d3-state.html">PASS</a> +51 other tests pass</li>
</ul>
</li>
</ul>
<h2>Build changes</h2>
<ul>
<li>Linux: CI_DRM_19069 -&gt; Patchwork_173155v6</li>
</ul>
<p>CI-20190529: 20190529<br />
  CI_DRM_19069: c53467440a5196138d2d6610e269a43b6b47bf6b @ git://anongit.freedesktop.org/gfx-ci/linux<br />
  IGT_9079: 9079<br />
  Patchwork_173155v6: c53467440a5196138d2d6610e269a43b6b47bf6b @ git://anongit.freedesktop.org/gfx-ci/linux</p>

</body>
</html>

--===============2147085111443295099==--
