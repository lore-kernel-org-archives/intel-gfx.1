Return-Path: <intel-gfx-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0D24DCA5FA2
	for <intel-gfx@archiver.kernel.org>; Mon, 28 Sep 2026 17:30:15 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8C0AA10EB54;
	Mon, 28 Sep 2026 17:30:14 +0000 (UTC)
Received: from 61270ab9df2a (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CAFC510E951;
 Mon, 28 Sep 2026 17:30:13 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============3853663455905188555=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=93_i915=2ECI=2EBAT=3A_success_for_drm/i915/pps=3A_Don=27t_b?=
 =?utf-8?q?lock_DC_states_while_the_VDD_override_is_held?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Kandpal, Suraj" <suraj.kandpal@intel.com>
Cc: intel-gfx@lists.freedesktop.org
Date: Mon, 28 Sep 2026 17:30:13 -0000
Message-ID: <179061661382.215488.3806072114226097765@61270ab9df2a>
X-Patchwork-Hint: ignore
References: <20260928061211.2764543-1-suraj.kandpal@intel.com>
In-Reply-To: <20260928061211.2764543-1-suraj.kandpal@intel.com>
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

--===============3853663455905188555==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: drm/i915/pps: Don't block DC states while the VDD override is held
URL   : https://patchwork.freedesktop.org/series/175080/
State : success

== Summary ==

CI Bug Log - changes from CI_DRM_19232 -> Patchwork_175080v1
====================================================

Summary
-------

  **SUCCESS**

  No regressions found.

  External URL: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_175080v1/index.html

Participating hosts (38 -> 37)
------------------------------

  Missing    (1): bat-dg2-13 

Known issues
------------

  Here are the changes found in Patchwork_175080v1 that come from known issues:

### IGT changes ###

#### Possible fixes ####

  * igt@kms_hdmi_inject@inject-audio:
    - fi-tgl-1115g4:      [SKIP][1] ([i915#13030]) -> [PASS][2]
   [1]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19232/fi-tgl-1115g4/igt@kms_hdmi_inject@inject-audio.html
   [2]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_175080v1/fi-tgl-1115g4/igt@kms_hdmi_inject@inject-audio.html

  
  [i915#13030]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13030


Build changes
-------------

  * Linux: CI_DRM_19232 -> Patchwork_175080v1

  CI-20190529: 20190529
  CI_DRM_19232: 972eeb850a4ca07aba05ccb805db28a33eab2c9a @ git://anongit.freedesktop.org/gfx-ci/linux
  IGT_9113: 691cc6fd50d5a3f6f2b5805c9698af1df28f6830 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
  Patchwork_175080v1: 972eeb850a4ca07aba05ccb805db28a33eab2c9a @ git://anongit.freedesktop.org/gfx-ci/linux

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_175080v1/index.html

--===============3853663455905188555==
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
<tr><td><b>Series:</b></td><td>drm/i915/pps: Don&#x27;t block DC states while the VDD override is held</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/175080/">https://patchwork.freedesktop.org/series/175080/</a></td></tr>
<tr><td><b>State:</b></td><td>success</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_175080v1/index.html">https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_175080v1/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from CI_DRM_19232 -&gt; Patchwork_175080v1</h1>
<h2>Summary</h2>
<p><strong>SUCCESS</strong></p>
<p>No regressions found.</p>
<p>External URL: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_175080v1/index.html</p>
<h2>Participating hosts (38 -&gt; 37)</h2>
<p>Missing    (1): bat-dg2-13 </p>
<h2>Known issues</h2>
<p>Here are the changes found in Patchwork_175080v1 that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Possible fixes</h4>
<ul>
<li>igt@kms_hdmi_inject@inject-audio:<ul>
<li>fi-tgl-1115g4:      <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19232/fi-tgl-1115g4/igt@kms_hdmi_inject@inject-audio.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13030">i915#13030</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_175080v1/fi-tgl-1115g4/igt@kms_hdmi_inject@inject-audio.html">PASS</a></li>
</ul>
</li>
</ul>
<h2>Build changes</h2>
<ul>
<li>Linux: CI_DRM_19232 -&gt; Patchwork_175080v1</li>
</ul>
<p>CI-20190529: 20190529<br />
  CI_DRM_19232: 972eeb850a4ca07aba05ccb805db28a33eab2c9a @ git://anongit.freedesktop.org/gfx-ci/linux<br />
  IGT_9113: 691cc6fd50d5a3f6f2b5805c9698af1df28f6830 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git<br />
  Patchwork_175080v1: 972eeb850a4ca07aba05ccb805db28a33eab2c9a @ git://anongit.freedesktop.org/gfx-ci/linux</p>

</body>
</html>

--===============3853663455905188555==--
