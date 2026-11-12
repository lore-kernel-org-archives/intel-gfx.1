Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C6989606A336
	for <intel-gfx@archiver.kernel.org>; Thu, 12 Nov 2026 01:21:30 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 52A5110E4F3;
	Thu, 12 Nov 2026 01:21:30 +0000 (UTC)
Received: from 9ac1b63fe3ea (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F008410E4F3;
 Thu, 12 Nov 2026 01:21:28 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============5840444968894316866=="
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=93_i915=2ECI=2EBAT=3A_success_for_Include_=3Casm/cpu=5Fdevi?=
 =?utf-8?q?ce=5Fid=2Eh=3E_without_=23ifdef_CONFIG=5FX86?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Pavel Popov" <pavel.e.popov@intel.com>
Cc: intel-gfx@lists.freedesktop.org
Date: Thu, 12 Nov 2026 01:21:28 -0000
Message-ID: <179444648897.12459.3130351420616483613@9ac1b63fe3ea>
X-Patchwork-Hint: ignore
References: <20261111234821.4814-1-pavel.e.popov@intel.com>
In-Reply-To: <20261111234821.4814-1-pavel.e.popov@intel.com>
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

--===============5840444968894316866==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: Include <asm/cpu_device_id.h> without #ifdef CONFIG_X86
URL   : https://patchwork.freedesktop.org/series/178357/
State : success

== Summary ==

CI Bug Log - changes from CI_DRM_19498 -> Patchwork_178357v1
====================================================

Summary
-------

  **SUCCESS**

  No regressions found.

  External URL: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_178357v1/index.html

Participating hosts (40 -> 39)
------------------------------

  Missing    (1): bat-dg2-13 

Known issues
------------

  Here are the changes found in Patchwork_178357v1 that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@gem_lmem_swapping@parallel-random-engines:
    - bat-apl-1:          NOTRUN -> [SKIP][1] ([i915#11671]) +3 other tests skip
   [1]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_178357v1/bat-apl-1/igt@gem_lmem_swapping@parallel-random-engines.html

  * igt@vgem_basic@unload:
    - bat-rpls-4:         [PASS][2] -> [DMESG-WARN][3] ([i915#13400])
   [2]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19498/bat-rpls-4/igt@vgem_basic@unload.html
   [3]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_178357v1/bat-rpls-4/igt@vgem_basic@unload.html

  
#### Possible fixes ####

  * igt@core_hotunplug@unbind-rebind:
    - bat-apl-1:          [ABORT][4] -> [PASS][5]
   [4]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19498/bat-apl-1/igt@core_hotunplug@unbind-rebind.html
   [5]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_178357v1/bat-apl-1/igt@core_hotunplug@unbind-rebind.html

  
  [i915#11671]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11671
  [i915#13400]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13400


Build changes
-------------

  * Linux: CI_DRM_19498 -> Patchwork_178357v1

  CI-20190529: 20190529
  CI_DRM_19498: f40cc5e715fe9e7a5e61f7cd44f63f68c1625f2c @ git://anongit.freedesktop.org/gfx-ci/linux
  IGT_9186: 9186
  Patchwork_178357v1: f40cc5e715fe9e7a5e61f7cd44f63f68c1625f2c @ git://anongit.freedesktop.org/gfx-ci/linux

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_178357v1/index.html

--===============5840444968894316866==
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
<tr><td><b>Series:</b></td><td>Include &lt;asm/cpu_device_id.h&gt; without #ifdef CONFIG_X86</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/178357/">https://patchwork.freedesktop.org/series/178357/</a></td></tr>
<tr><td><b>State:</b></td><td>success</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_178357v1/index.html">https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_178357v1/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from CI_DRM_19498 -&gt; Patchwork_178357v1</h1>
<h2>Summary</h2>
<p><strong>SUCCESS</strong></p>
<p>No regressions found.</p>
<p>External URL: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_178357v1/index.html</p>
<h2>Participating hosts (40 -&gt; 39)</h2>
<p>Missing    (1): bat-dg2-13 </p>
<h2>Known issues</h2>
<p>Here are the changes found in Patchwork_178357v1 that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>
<p>igt@gem_lmem_swapping@parallel-random-engines:</p>
<ul>
<li>bat-apl-1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_178357v1/bat-apl-1/igt@gem_lmem_swapping@parallel-random-engines.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11671">i915#11671</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@vgem_basic@unload:</p>
<ul>
<li>bat-rpls-4:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19498/bat-rpls-4/igt@vgem_basic@unload.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_178357v1/bat-rpls-4/igt@vgem_basic@unload.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13400">i915#13400</a>)</li>
</ul>
</li>
</ul>
<h4>Possible fixes</h4>
<ul>
<li>igt@core_hotunplug@unbind-rebind:<ul>
<li>bat-apl-1:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19498/bat-apl-1/igt@core_hotunplug@unbind-rebind.html">ABORT</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_178357v1/bat-apl-1/igt@core_hotunplug@unbind-rebind.html">PASS</a></li>
</ul>
</li>
</ul>
<h2>Build changes</h2>
<ul>
<li>Linux: CI_DRM_19498 -&gt; Patchwork_178357v1</li>
</ul>
<p>CI-20190529: 20190529<br />
  CI_DRM_19498: f40cc5e715fe9e7a5e61f7cd44f63f68c1625f2c @ git://anongit.freedesktop.org/gfx-ci/linux<br />
  IGT_9186: 9186<br />
  Patchwork_178357v1: f40cc5e715fe9e7a5e61f7cd44f63f68c1625f2c @ git://anongit.freedesktop.org/gfx-ci/linux</p>

</body>
</html>

--===============5840444968894316866==--
