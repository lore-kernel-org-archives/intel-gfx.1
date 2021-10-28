Return-Path: <SRS0=5qC0=PQ=lists.freedesktop.org=intel-gfx-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9388AC433F5
	for <intel-gfx@archiver.kernel.org>; Thu, 28 Oct 2021 21:44:47 +0000 (UTC)
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 3C698610C8
	for <intel-gfx@archiver.kernel.org>; Thu, 28 Oct 2021 21:44:47 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 3C698610C8
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=emeril.freedesktop.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.freedesktop.org
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B30EE6E0A6;
	Thu, 28 Oct 2021 21:44:46 +0000 (UTC)
Received: from emeril.freedesktop.org (emeril.freedesktop.org
 [IPv6:2610:10:20:722:a800:ff:feee:56cf])
 by gabe.freedesktop.org (Postfix) with ESMTP id 910C86E0A6;
 Thu, 28 Oct 2021 21:44:45 +0000 (UTC)
Received: from emeril.freedesktop.org (localhost [127.0.0.1])
 by emeril.freedesktop.org (Postfix) with ESMTP id 89F77A363C;
 Thu, 28 Oct 2021 21:44:45 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============3674872772541756125=="
MIME-Version: 1.0
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Jani Nikula" <jani.nikula@intel.com>
Cc: intel-gfx@lists.freedesktop.org
Date: Thu, 28 Oct 2021 21:44:45 -0000
Message-ID: <163545748553.4339.16486156573913196380@emeril.freedesktop.org>
X-Patchwork-Hint: ignore
References: <20211028173518.9107-1-jani.nikula@intel.com>
In-Reply-To: <20211028173518.9107-1-jani.nikula@intel.com>
Subject: [Intel-gfx] =?utf-8?b?4pyTIEZpLkNJLkJBVDogc3VjY2VzcyBmb3Igc2Vy?=
 =?utf-8?q?ies_starting_with_=5Bv2=2C1/6=5D_drm/i915/audio=3A_group_audio_?=
 =?utf-8?q?under_anonymous_struct_in_drm=5Fi915=5Fprivate?=
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

--===============3674872772541756125==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: series starting with [v2,1/6] drm/i915/audio: group audio under anonymous struct in drm_i915_private
URL   : https://patchwork.freedesktop.org/series/96399/
State : success

== Summary ==

CI Bug Log - changes from CI_DRM_10809 -> Patchwork_21478
====================================================

Summary
-------

  **SUCCESS**

  No regressions found.

  External URL: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_21478/index.html

Participating hosts (36 -> 32)
------------------------------

  Missing    (4): fi-icl-u2 bat-adlp-4 bat-dg1-6 bat-dg1-5 

Known issues
------------

  Here are the changes found in Patchwork_21478 that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@i915_selftest@live@execlists:
    - fi-bsw-nick:        [PASS][1] -> [INCOMPLETE][2] ([i915#2940])
   [1]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10809/fi-bsw-nick/igt@i915_selftest@live@execlists.html
   [2]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_21478/fi-bsw-nick/igt@i915_selftest@live@execlists.html

  * igt@runner@aborted:
    - fi-bsw-nick:        NOTRUN -> [FAIL][3] ([fdo#109271] / [i915#1436] / [i915#3428] / [i915#4312])
   [3]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_21478/fi-bsw-nick/igt@runner@aborted.html

  
  [fdo#109271]: https://bugs.freedesktop.org/show_bug.cgi?id=109271
  [i915#1436]: https://gitlab.freedesktop.org/drm/intel/issues/1436
  [i915#2940]: https://gitlab.freedesktop.org/drm/intel/issues/2940
  [i915#3428]: https://gitlab.freedesktop.org/drm/intel/issues/3428
  [i915#4312]: https://gitlab.freedesktop.org/drm/intel/issues/4312


Build changes
-------------

  * Linux: CI_DRM_10809 -> Patchwork_21478

  CI-20190529: 20190529
  CI_DRM_10809: 9959c5de92d04f2336d749a5a331799aa41cfb1f @ git://anongit.freedesktop.org/gfx-ci/linux
  IGT_6264: 3458490c14afe3cb8aa873fa9e520e1c815ea068 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
  Patchwork_21478: d4f0b49238d0070f82985d5fefde3248c3f0fef2 @ git://anongit.freedesktop.org/gfx-ci/linux


== Linux commits ==

d4f0b49238d0 drm/i915/audio: rename intel_init_audio_hooks to intel_audio_hooks_init
cb77ff6f4e63 drm/i915/audio: clean up LPE audio init/cleanup calls
b8d059680c73 drm/i915/audio: move intel_audio_funcs internal to intel_audio.c
54360d96b9b3 drm/i915/audio: define the audio struct separately from drm_i915_private
a782cd9b4623 drm/i915/audio: name the audio sub-struct in drm_i915_private
99ae5429914a drm/i915/audio: group audio under anonymous struct in drm_i915_private

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_21478/index.html

--===============3674872772541756125==
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
<tr><td><b>Series:</b></td><td>series starting with [v2,1/6] drm/i915/audio: group audio under anonymous struct in drm_i915_private</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/96399/">https://patchwork.freedesktop.org/series/96399/</a></td></tr>
<tr><td><b>State:</b></td><td>success</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_21478/index.html">https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_21478/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from CI_DRM_10809 -&gt; Patchwork_21478</h1>
<h2>Summary</h2>
<p><strong>SUCCESS</strong></p>
<p>No regressions found.</p>
<p>External URL: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_21478/index.html</p>
<h2>Participating hosts (36 -&gt; 32)</h2>
<p>Missing    (4): fi-icl-u2 bat-adlp-4 bat-dg1-6 bat-dg1-5 </p>
<h2>Known issues</h2>
<p>Here are the changes found in Patchwork_21478 that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>
<p>igt@i915_selftest@live@execlists:</p>
<ul>
<li>fi-bsw-nick:        <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10809/fi-bsw-nick/igt@i915_selftest@live@execlists.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_21478/fi-bsw-nick/igt@i915_selftest@live@execlists.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/2940">i915#2940</a>)</li>
</ul>
</li>
<li>
<p>igt@runner@aborted:</p>
<ul>
<li>fi-bsw-nick:        NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_21478/fi-bsw-nick/igt@runner@aborted.html">FAIL</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/1436">i915#1436</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/3428">i915#3428</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/4312">i915#4312</a>)</li>
</ul>
</li>
</ul>
<h2>Build changes</h2>
<ul>
<li>Linux: CI_DRM_10809 -&gt; Patchwork_21478</li>
</ul>
<p>CI-20190529: 20190529<br />
  CI_DRM_10809: 9959c5de92d04f2336d749a5a331799aa41cfb1f @ git://anongit.freedesktop.org/gfx-ci/linux<br />
  IGT_6264: 3458490c14afe3cb8aa873fa9e520e1c815ea068 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git<br />
  Patchwork_21478: d4f0b49238d0070f82985d5fefde3248c3f0fef2 @ git://anongit.freedesktop.org/gfx-ci/linux</p>
<p>== Linux commits ==</p>
<p>d4f0b49238d0 drm/i915/audio: rename intel_init_audio_hooks to intel_audio_hooks_init<br />
cb77ff6f4e63 drm/i915/audio: clean up LPE audio init/cleanup calls<br />
b8d059680c73 drm/i915/audio: move intel_audio_funcs internal to intel_audio.c<br />
54360d96b9b3 drm/i915/audio: define the audio struct separately from drm_i915_private<br />
a782cd9b4623 drm/i915/audio: name the audio sub-struct in drm_i915_private<br />
99ae5429914a drm/i915/audio: group audio under anonymous struct in drm_i915_private</p>

</body>
</html>

--===============3674872772541756125==--
