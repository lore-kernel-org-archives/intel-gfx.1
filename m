Return-Path: <intel-gfx-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E66DFCD5BB1
	for <intel-gfx@archiver.kernel.org>; Tue, 26 May 2026 18:01:20 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 74F5F10E1D0;
	Tue, 26 May 2026 18:01:20 +0000 (UTC)
Received: from 6beec6c84f66 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C05BB10E1D0;
 Tue, 26 May 2026 18:01:19 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============1948110705001480962=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=93_i915=2ECI=2EBAT=3A_success_for_CMTG_enablement_=28rev7?=
 =?utf-8?q?=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Animesh Manna" <animesh.manna@intel.com>
Cc: intel-gfx@lists.freedesktop.org
Date: Tue, 26 May 2026 18:01:19 -0000
Message-ID: <177981847978.11680.11054109759241746118@6beec6c84f66>
X-Patchwork-Hint: ignore
References: <20260526133811.2621675-1-animesh.manna@intel.com>
In-Reply-To: <20260526133811.2621675-1-animesh.manna@intel.com>
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

--===============1948110705001480962==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: CMTG enablement (rev7)
URL   : https://patchwork.freedesktop.org/series/157664/
State : success

== Summary ==

CI Bug Log - changes from CI_DRM_18556 -> Patchwork_157664v7
====================================================

Summary
-------

  **SUCCESS**

  No regressions found.

  External URL: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_157664v7/index.html

Participating hosts (42 -> 40)
------------------------------

  Missing    (2): bat-dg2-13 fi-snb-2520m 

New tests
---------

  New tests have been introduced between CI_DRM_18556 and Patchwork_157664v7:

### New IGT tests (36) ###

  * igt@kms_flip@basic-flip-vs-dpms@a-hdmi-a1:
    - Statuses : 7 pass(s)
    - Exec time: [0.68, 1.45] s

  * igt@kms_flip@basic-flip-vs-dpms@a-hdmi-a2:
    - Statuses : 4 pass(s)
    - Exec time: [0.76, 0.94] s

  * igt@kms_flip@basic-flip-vs-dpms@a-vga1:
    - Statuses : 5 pass(s)
    - Exec time: [0.88, 1.66] s

  * igt@kms_flip@basic-flip-vs-dpms@b-hdmi-a1:
    - Statuses : 7 pass(s)
    - Exec time: [0.70, 1.38] s

  * igt@kms_flip@basic-flip-vs-dpms@b-hdmi-a2:
    - Statuses : 4 pass(s)
    - Exec time: [0.69, 0.83] s

  * igt@kms_flip@basic-flip-vs-dpms@b-vga1:
    - Statuses : 5 pass(s)
    - Exec time: [0.76, 1.66] s

  * igt@kms_flip@basic-flip-vs-dpms@c-hdmi-a1:
    - Statuses : 6 pass(s)
    - Exec time: [0.70, 1.41] s

  * igt@kms_flip@basic-flip-vs-dpms@c-hdmi-a2:
    - Statuses : 5 pass(s)
    - Exec time: [0.69, 2.78] s

  * igt@kms_flip@basic-flip-vs-dpms@c-vga1:
    - Statuses : 2 pass(s)
    - Exec time: [0.91] s

  * igt@kms_flip@basic-flip-vs-modeset@a-hdmi-a1:
    - Statuses : 7 pass(s)
    - Exec time: [0.77, 1.60] s

  * igt@kms_flip@basic-flip-vs-modeset@a-hdmi-a2:
    - Statuses : 4 pass(s)
    - Exec time: [0.79, 0.97] s

  * igt@kms_flip@basic-flip-vs-modeset@a-vga1:
    - Statuses : 5 pass(s)
    - Exec time: [0.86, 1.59] s

  * igt@kms_flip@basic-flip-vs-modeset@b-hdmi-a1:
    - Statuses : 7 pass(s)
    - Exec time: [0.63, 1.42] s

  * igt@kms_flip@basic-flip-vs-modeset@b-hdmi-a2:
    - Statuses : 4 pass(s)
    - Exec time: [0.70, 0.85] s

  * igt@kms_flip@basic-flip-vs-modeset@b-vga1:
    - Statuses : 5 pass(s)
    - Exec time: [0.64, 1.39] s

  * igt@kms_flip@basic-flip-vs-modeset@c-hdmi-a1:
    - Statuses : 6 pass(s)
    - Exec time: [0.62, 1.40] s

  * igt@kms_flip@basic-flip-vs-modeset@c-hdmi-a2:
    - Statuses : 5 pass(s)
    - Exec time: [0.72, 2.72] s

  * igt@kms_flip@basic-flip-vs-modeset@c-vga1:
    - Statuses : 2 pass(s)
    - Exec time: [0.94, 0.95] s

  * igt@kms_flip@basic-flip-vs-wf_vblank@a-hdmi-a1:
    - Statuses : 7 pass(s)
    - Exec time: [0.84, 1.58] s

  * igt@kms_flip@basic-flip-vs-wf_vblank@a-hdmi-a2:
    - Statuses : 4 pass(s)
    - Exec time: [1.05, 1.16] s

  * igt@kms_flip@basic-flip-vs-wf_vblank@a-vga1:
    - Statuses : 5 pass(s)
    - Exec time: [1.07, 1.90] s

  * igt@kms_flip@basic-flip-vs-wf_vblank@b-hdmi-a1:
    - Statuses : 7 pass(s)
    - Exec time: [0.81, 1.45] s

  * igt@kms_flip@basic-flip-vs-wf_vblank@b-hdmi-a2:
    - Statuses : 4 pass(s)
    - Exec time: [1.03, 1.23] s

  * igt@kms_flip@basic-flip-vs-wf_vblank@b-vga1:
    - Statuses : 5 pass(s)
    - Exec time: [1.0, 1.80] s

  * igt@kms_flip@basic-flip-vs-wf_vblank@c-hdmi-a1:
    - Statuses : 6 pass(s)
    - Exec time: [0.81, 1.45] s

  * igt@kms_flip@basic-flip-vs-wf_vblank@c-hdmi-a2:
    - Statuses : 5 pass(s)
    - Exec time: [1.03, 2.92] s

  * igt@kms_flip@basic-flip-vs-wf_vblank@c-vga1:
    - Statuses : 2 pass(s)
    - Exec time: [1.15, 1.17] s

  * igt@kms_flip@basic-plain-flip@a-hdmi-a1:
    - Statuses : 7 pass(s)
    - Exec time: [0.71, 1.23] s

  * igt@kms_flip@basic-plain-flip@a-hdmi-a2:
    - Statuses : 4 pass(s)
    - Exec time: [0.78, 0.88] s

  * igt@kms_flip@basic-plain-flip@a-vga1:
    - Statuses : 5 pass(s)
    - Exec time: [0.79, 1.60] s

  * igt@kms_flip@basic-plain-flip@b-hdmi-a1:
    - Statuses : 7 pass(s)
    - Exec time: [0.68, 1.16] s

  * igt@kms_flip@basic-plain-flip@b-hdmi-a2:
    - Statuses : 4 pass(s)
    - Exec time: [0.73, 0.82] s

  * igt@kms_flip@basic-plain-flip@b-vga1:
    - Statuses : 5 pass(s)
    - Exec time: [0.73, 1.49] s

  * igt@kms_flip@basic-plain-flip@c-hdmi-a1:
    - Statuses : 6 pass(s)
    - Exec time: [0.68, 1.17] s

  * igt@kms_flip@basic-plain-flip@c-hdmi-a2:
    - Statuses : 5 pass(s)
    - Exec time: [0.75, 2.64] s

  * igt@kms_flip@basic-plain-flip@c-vga1:
    - Statuses : 2 pass(s)
    - Exec time: [0.88, 0.89] s

  


Changes
-------

  No changes found


Build changes
-------------

  * Linux: CI_DRM_18556 -> Patchwork_157664v7

  CI-20190529: 20190529
  CI_DRM_18556: 1e5fbf0d628cd02dced6cfb1ebe39717f121fb4c @ git://anongit.freedesktop.org/gfx-ci/linux
  IGT_8937: 8937
  Patchwork_157664v7: 1e5fbf0d628cd02dced6cfb1ebe39717f121fb4c @ git://anongit.freedesktop.org/gfx-ci/linux

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_157664v7/index.html

--===============1948110705001480962==
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
<tr><td><b>Series:</b></td><td>CMTG enablement (rev7)</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/157664/">https://patchwork.freedesktop.org/series/157664/</a></td></tr>
<tr><td><b>State:</b></td><td>success</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_157664v7/index.html">https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_157664v7/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from CI_DRM_18556 -&gt; Patchwork_157664v7</h1>
<h2>Summary</h2>
<p><strong>SUCCESS</strong></p>
<p>No regressions found.</p>
<p>External URL: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_157664v7/index.html</p>
<h2>Participating hosts (42 -&gt; 40)</h2>
<p>Missing    (2): bat-dg2-13 fi-snb-2520m </p>
<h2>New tests</h2>
<p>New tests have been introduced between CI_DRM_18556 and Patchwork_157664v7:</p>
<h3>New IGT tests (36)</h3>
<ul>
<li>
<p>igt@kms_flip@basic-flip-vs-dpms@a-hdmi-a1:</p>
<ul>
<li>Statuses : 7 pass(s)</li>
<li>Exec time: [0.68, 1.45] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip@basic-flip-vs-dpms@a-hdmi-a2:</p>
<ul>
<li>Statuses : 4 pass(s)</li>
<li>Exec time: [0.76, 0.94] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip@basic-flip-vs-dpms@a-vga1:</p>
<ul>
<li>Statuses : 5 pass(s)</li>
<li>Exec time: [0.88, 1.66] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip@basic-flip-vs-dpms@b-hdmi-a1:</p>
<ul>
<li>Statuses : 7 pass(s)</li>
<li>Exec time: [0.70, 1.38] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip@basic-flip-vs-dpms@b-hdmi-a2:</p>
<ul>
<li>Statuses : 4 pass(s)</li>
<li>Exec time: [0.69, 0.83] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip@basic-flip-vs-dpms@b-vga1:</p>
<ul>
<li>Statuses : 5 pass(s)</li>
<li>Exec time: [0.76, 1.66] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip@basic-flip-vs-dpms@c-hdmi-a1:</p>
<ul>
<li>Statuses : 6 pass(s)</li>
<li>Exec time: [0.70, 1.41] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip@basic-flip-vs-dpms@c-hdmi-a2:</p>
<ul>
<li>Statuses : 5 pass(s)</li>
<li>Exec time: [0.69, 2.78] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip@basic-flip-vs-dpms@c-vga1:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [0.91] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip@basic-flip-vs-modeset@a-hdmi-a1:</p>
<ul>
<li>Statuses : 7 pass(s)</li>
<li>Exec time: [0.77, 1.60] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip@basic-flip-vs-modeset@a-hdmi-a2:</p>
<ul>
<li>Statuses : 4 pass(s)</li>
<li>Exec time: [0.79, 0.97] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip@basic-flip-vs-modeset@a-vga1:</p>
<ul>
<li>Statuses : 5 pass(s)</li>
<li>Exec time: [0.86, 1.59] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip@basic-flip-vs-modeset@b-hdmi-a1:</p>
<ul>
<li>Statuses : 7 pass(s)</li>
<li>Exec time: [0.63, 1.42] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip@basic-flip-vs-modeset@b-hdmi-a2:</p>
<ul>
<li>Statuses : 4 pass(s)</li>
<li>Exec time: [0.70, 0.85] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip@basic-flip-vs-modeset@b-vga1:</p>
<ul>
<li>Statuses : 5 pass(s)</li>
<li>Exec time: [0.64, 1.39] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip@basic-flip-vs-modeset@c-hdmi-a1:</p>
<ul>
<li>Statuses : 6 pass(s)</li>
<li>Exec time: [0.62, 1.40] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip@basic-flip-vs-modeset@c-hdmi-a2:</p>
<ul>
<li>Statuses : 5 pass(s)</li>
<li>Exec time: [0.72, 2.72] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip@basic-flip-vs-modeset@c-vga1:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [0.94, 0.95] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip@basic-flip-vs-wf_vblank@a-hdmi-a1:</p>
<ul>
<li>Statuses : 7 pass(s)</li>
<li>Exec time: [0.84, 1.58] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip@basic-flip-vs-wf_vblank@a-hdmi-a2:</p>
<ul>
<li>Statuses : 4 pass(s)</li>
<li>Exec time: [1.05, 1.16] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip@basic-flip-vs-wf_vblank@a-vga1:</p>
<ul>
<li>Statuses : 5 pass(s)</li>
<li>Exec time: [1.07, 1.90] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip@basic-flip-vs-wf_vblank@b-hdmi-a1:</p>
<ul>
<li>Statuses : 7 pass(s)</li>
<li>Exec time: [0.81, 1.45] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip@basic-flip-vs-wf_vblank@b-hdmi-a2:</p>
<ul>
<li>Statuses : 4 pass(s)</li>
<li>Exec time: [1.03, 1.23] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip@basic-flip-vs-wf_vblank@b-vga1:</p>
<ul>
<li>Statuses : 5 pass(s)</li>
<li>Exec time: [1.0, 1.80] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip@basic-flip-vs-wf_vblank@c-hdmi-a1:</p>
<ul>
<li>Statuses : 6 pass(s)</li>
<li>Exec time: [0.81, 1.45] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip@basic-flip-vs-wf_vblank@c-hdmi-a2:</p>
<ul>
<li>Statuses : 5 pass(s)</li>
<li>Exec time: [1.03, 2.92] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip@basic-flip-vs-wf_vblank@c-vga1:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [1.15, 1.17] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip@basic-plain-flip@a-hdmi-a1:</p>
<ul>
<li>Statuses : 7 pass(s)</li>
<li>Exec time: [0.71, 1.23] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip@basic-plain-flip@a-hdmi-a2:</p>
<ul>
<li>Statuses : 4 pass(s)</li>
<li>Exec time: [0.78, 0.88] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip@basic-plain-flip@a-vga1:</p>
<ul>
<li>Statuses : 5 pass(s)</li>
<li>Exec time: [0.79, 1.60] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip@basic-plain-flip@b-hdmi-a1:</p>
<ul>
<li>Statuses : 7 pass(s)</li>
<li>Exec time: [0.68, 1.16] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip@basic-plain-flip@b-hdmi-a2:</p>
<ul>
<li>Statuses : 4 pass(s)</li>
<li>Exec time: [0.73, 0.82] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip@basic-plain-flip@b-vga1:</p>
<ul>
<li>Statuses : 5 pass(s)</li>
<li>Exec time: [0.73, 1.49] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip@basic-plain-flip@c-hdmi-a1:</p>
<ul>
<li>Statuses : 6 pass(s)</li>
<li>Exec time: [0.68, 1.17] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip@basic-plain-flip@c-hdmi-a2:</p>
<ul>
<li>Statuses : 5 pass(s)</li>
<li>Exec time: [0.75, 2.64] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip@basic-plain-flip@c-vga1:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [0.88, 0.89] s</li>
</ul>
</li>
</ul>
<h2>Changes</h2>
<p>No changes found</p>
<h2>Build changes</h2>
<ul>
<li>Linux: CI_DRM_18556 -&gt; Patchwork_157664v7</li>
</ul>
<p>CI-20190529: 20190529<br />
  CI_DRM_18556: 1e5fbf0d628cd02dced6cfb1ebe39717f121fb4c @ git://anongit.freedesktop.org/gfx-ci/linux<br />
  IGT_8937: 8937<br />
  Patchwork_157664v7: 1e5fbf0d628cd02dced6cfb1ebe39717f121fb4c @ git://anongit.freedesktop.org/gfx-ci/linux</p>

</body>
</html>

--===============1948110705001480962==--
