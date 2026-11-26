Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0EFBD606A31E
	for <intel-gfx@archiver.kernel.org>; Thu, 26 Nov 2026 08:54:08 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 869151121F2;
	Thu, 26 Nov 2026 08:54:07 +0000 (UTC)
Received: from 9ac1b63fe3ea (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7BFFB1121EB;
 Thu, 26 Nov 2026 08:54:06 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============4852943536965450888=="
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=93_i915=2ECI=2EBAT=3A_success_for_drm/i915/display=3A_Refre?=
 =?utf-8?q?sh_global_state_after_non-atomic_sanitization_=28rev2=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Hanson Wang" <hanson.wang@ugreen.com>
Cc: intel-gfx@lists.freedesktop.org
Date: Thu, 26 Nov 2026 08:54:06 -0000
Message-ID: <179568324650.91070.18265241028148925544@9ac1b63fe3ea>
X-Patchwork-Hint: ignore
References: <20261126020213.3412946-1-hanson.wang@ugreen.com>
In-Reply-To: <20261126020213.3412946-1-hanson.wang@ugreen.com>
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
	autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

--===============4852943536965450888==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: drm/i915/display: Refresh global state after non-atomic sanitization (rev2)
URL   : https://patchwork.freedesktop.org/series/179670/
State : success

== Summary ==

CI Bug Log - changes from CI_DRM_19614 -> Patchwork_179670v2
====================================================

Summary
-------

  **SUCCESS**

  No regressions found.

  External URL: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_179670v2/index.html

Participating hosts (40 -> 38)
------------------------------

  Missing    (2): bat-dg2-13 fi-glk-j4005 

Known issues
------------

  Here are the changes found in Patchwork_179670v2 that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@kms_pm_rpm@basic-pci-d3-state:
    - bat-rpls-4:         [PASS][1] -> [DMESG-WARN][2] ([i915#13400])
   [1]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19614/bat-rpls-4/igt@kms_pm_rpm@basic-pci-d3-state.html
   [2]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_179670v2/bat-rpls-4/igt@kms_pm_rpm@basic-pci-d3-state.html

  
#### Possible fixes ####

  * igt@i915_selftest@live:
    - fi-skl-6600u:       [INCOMPLETE][3] -> [PASS][4] +1 other test pass
   [3]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19614/fi-skl-6600u/igt@i915_selftest@live.html
   [4]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_179670v2/fi-skl-6600u/igt@i915_selftest@live.html

  * igt@vgem_basic@unload:
    - bat-rpls-4:         [DMESG-WARN][5] ([i915#13400]) -> [PASS][6]
   [5]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19614/bat-rpls-4/igt@vgem_basic@unload.html
   [6]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_179670v2/bat-rpls-4/igt@vgem_basic@unload.html

  
  [i915#13400]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13400


Build changes
-------------

  * Linux: CI_DRM_19614 -> Patchwork_179670v2

  CI-20190529: 20190529
  CI_DRM_19614: 38fc48e17b82ca1d9903a982ce596280f8172326 @ git://anongit.freedesktop.org/gfx-ci/linux
  IGT_9204: 52e9317c945f97f29fbec75be29280fc7b00cf32 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
  Patchwork_179670v2: 38fc48e17b82ca1d9903a982ce596280f8172326 @ git://anongit.freedesktop.org/gfx-ci/linux

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_179670v2/index.html

--===============4852943536965450888==
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
<tr><td><b>Series:</b></td><td>drm/i915/display: Refresh global state after non-atomic sanitization (rev2)</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/179670/">https://patchwork.freedesktop.org/series/179670/</a></td></tr>
<tr><td><b>State:</b></td><td>success</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_179670v2/index.html">https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_179670v2/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from CI_DRM_19614 -&gt; Patchwork_179670v2</h1>
<h2>Summary</h2>
<p><strong>SUCCESS</strong></p>
<p>No regressions found.</p>
<p>External URL: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_179670v2/index.html</p>
<h2>Participating hosts (40 -&gt; 38)</h2>
<p>Missing    (2): bat-dg2-13 fi-glk-j4005 </p>
<h2>Known issues</h2>
<p>Here are the changes found in Patchwork_179670v2 that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>igt@kms_pm_rpm@basic-pci-d3-state:<ul>
<li>bat-rpls-4:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19614/bat-rpls-4/igt@kms_pm_rpm@basic-pci-d3-state.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_179670v2/bat-rpls-4/igt@kms_pm_rpm@basic-pci-d3-state.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13400">i915#13400</a>)</li>
</ul>
</li>
</ul>
<h4>Possible fixes</h4>
<ul>
<li>
<p>igt@i915_selftest@live:</p>
<ul>
<li>fi-skl-6600u:       <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19614/fi-skl-6600u/igt@i915_selftest@live.html">INCOMPLETE</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_179670v2/fi-skl-6600u/igt@i915_selftest@live.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@vgem_basic@unload:</p>
<ul>
<li>bat-rpls-4:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19614/bat-rpls-4/igt@vgem_basic@unload.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13400">i915#13400</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_179670v2/bat-rpls-4/igt@vgem_basic@unload.html">PASS</a></li>
</ul>
</li>
</ul>
<h2>Build changes</h2>
<ul>
<li>Linux: CI_DRM_19614 -&gt; Patchwork_179670v2</li>
</ul>
<p>CI-20190529: 20190529<br />
  CI_DRM_19614: 38fc48e17b82ca1d9903a982ce596280f8172326 @ git://anongit.freedesktop.org/gfx-ci/linux<br />
  IGT_9204: 52e9317c945f97f29fbec75be29280fc7b00cf32 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git<br />
  Patchwork_179670v2: 38fc48e17b82ca1d9903a982ce596280f8172326 @ git://anongit.freedesktop.org/gfx-ci/linux</p>

</body>
</html>

--===============4852943536965450888==--
