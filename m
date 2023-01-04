Return-Path: <intel-gfx-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9A7AEC4708D
	for <intel-gfx@archiver.kernel.org>; Wed,  4 Jan 2023 20:30:28 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 887C489561;
	Wed,  4 Jan 2023 20:30:27 +0000 (UTC)
Received: from emeril.freedesktop.org (emeril.freedesktop.org
 [IPv6:2610:10:20:722:a800:ff:feee:56cf])
 by gabe.freedesktop.org (Postfix) with ESMTP id E94E010E081;
 Wed,  4 Jan 2023 20:30:25 +0000 (UTC)
Received: from emeril.freedesktop.org (localhost [127.0.0.1])
 by emeril.freedesktop.org (Postfix) with ESMTP id E71A9AADD8;
 Wed,  4 Jan 2023 20:30:25 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============9203197281459668234=="
MIME-Version: 1.0
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Rodrigo Vivi" <rodrigo.vivi@intel.com>
Date: Wed, 04 Jan 2023 20:30:25 -0000
Message-ID: <167286422594.24956.2811882916046026590@emeril.freedesktop.org>
X-Patchwork-Hint: ignore
References: <20221229161230.1261938-1-rodrigo.vivi@intel.com>
In-Reply-To: <20221229161230.1261938-1-rodrigo.vivi@intel.com>
Subject: [Intel-gfx] =?utf-8?b?4pyTIEZpLkNJLkJBVDogc3VjY2VzcyBmb3IgZHJt?=
 =?utf-8?q?/i915=3A_Expand_force=5Fprobe_to_block_probe_of_devices_as_well?=
 =?utf-8?b?LiAocmV2Myk=?=
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
Cc: intel-gfx@lists.freedesktop.org
Errors-To: intel-gfx-bounces@lists.freedesktop.org
Sender: "Intel-gfx" <intel-gfx-bounces@lists.freedesktop.org>

--===============9203197281459668234==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: drm/i915: Expand force_probe to block probe of devices as well. (rev3)
URL   : https://patchwork.freedesktop.org/series/112292/
State : success

== Summary ==

CI Bug Log - changes from CI_DRM_12546 -> Patchwork_112292v3
====================================================

Summary
-------

  **SUCCESS**

  No regressions found.

  External URL: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_112292v3/index.html

Participating hosts (43 -> 41)
------------------------------

  Missing    (2): bat-atsm-1 fi-snb-2520m 

Known issues
------------

  Here are the changes found in Patchwork_112292v3 that come from known issues:

### IGT changes ###

#### Possible fixes ####

  * igt@gem_exec_suspend@basic-s0@smem:
    - {bat-adlp-6}:       [DMESG-WARN][1] ([i915#2867]) -> [PASS][2] +2 similar issues
   [1]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12546/bat-adlp-6/igt@gem_exec_suspend@basic-s0@smem.html
   [2]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_112292v3/bat-adlp-6/igt@gem_exec_suspend@basic-s0@smem.html

  
  {name}: This element is suppressed. This means it is ignored when computing
          the status of the difference (SUCCESS, WARNING, or FAILURE).

  [i915#2867]: https://gitlab.freedesktop.org/drm/intel/issues/2867
  [i915#6257]: https://gitlab.freedesktop.org/drm/intel/issues/6257
  [i915#6367]: https://gitlab.freedesktop.org/drm/intel/issues/6367
  [i915#6997]: https://gitlab.freedesktop.org/drm/intel/issues/6997
  [i915#7336]: https://gitlab.freedesktop.org/drm/intel/issues/7336


Build changes
-------------

  * Linux: CI_DRM_12546 -> Patchwork_112292v3

  CI-20190529: 20190529
  CI_DRM_12546: 07a684fbd4d0f5e284e8a782e0298f772fc4164e @ git://anongit.freedesktop.org/gfx-ci/linux
  IGT_7107: 4f22b49ee353406c14ce8bb3151ebe3ce4e6e9be @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
  Patchwork_112292v3: 07a684fbd4d0f5e284e8a782e0298f772fc4164e @ git://anongit.freedesktop.org/gfx-ci/linux


### Linux commits

7c84d6caf781 drm/i915: Expand force_probe to block probe of devices as well.

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_112292v3/index.html

--===============9203197281459668234==
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
<tr><td><b>Series:</b></td><td>drm/i915: Expand force_probe to block probe of devices as well. (rev3)</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/112292/">https://patchwork.freedesktop.org/series/112292/</a></td></tr>
<tr><td><b>State:</b></td><td>success</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_112292v3/index.html">https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_112292v3/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from CI_DRM_12546 -&gt; Patchwork_112292v3</h1>
<h2>Summary</h2>
<p><strong>SUCCESS</strong></p>
<p>No regressions found.</p>
<p>External URL: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_112292v3/index.html</p>
<h2>Participating hosts (43 -&gt; 41)</h2>
<p>Missing    (2): bat-atsm-1 fi-snb-2520m </p>
<h2>Known issues</h2>
<p>Here are the changes found in Patchwork_112292v3 that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Possible fixes</h4>
<ul>
<li>igt@gem_exec_suspend@basic-s0@smem:<ul>
<li>{bat-adlp-6}:       <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12546/bat-adlp-6/igt@gem_exec_suspend@basic-s0@smem.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/2867">i915#2867</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_112292v3/bat-adlp-6/igt@gem_exec_suspend@basic-s0@smem.html">PASS</a> +2 similar issues</li>
</ul>
</li>
</ul>
<p>{name}: This element is suppressed. This means it is ignored when computing<br />
          the status of the difference (SUCCESS, WARNING, or FAILURE).</p>
<h2>Build changes</h2>
<ul>
<li>Linux: CI_DRM_12546 -&gt; Patchwork_112292v3</li>
</ul>
<p>CI-20190529: 20190529<br />
  CI_DRM_12546: 07a684fbd4d0f5e284e8a782e0298f772fc4164e @ git://anongit.freedesktop.org/gfx-ci/linux<br />
  IGT_7107: 4f22b49ee353406c14ce8bb3151ebe3ce4e6e9be @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git<br />
  Patchwork_112292v3: 07a684fbd4d0f5e284e8a782e0298f772fc4164e @ git://anongit.freedesktop.org/gfx-ci/linux</p>
<h3>Linux commits</h3>
<p>7c84d6caf781 drm/i915: Expand force_probe to block probe of devices as well.</p>

</body>
</html>

--===============9203197281459668234==--
