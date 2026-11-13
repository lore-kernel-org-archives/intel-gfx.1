Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D935E606A31C
	for <intel-gfx@archiver.kernel.org>; Fri, 13 Nov 2026 01:50:48 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6F08C10E3DA;
	Fri, 13 Nov 2026 01:50:48 +0000 (UTC)
Received: from 9ac1b63fe3ea (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 05ADB10E3DA;
 Fri, 13 Nov 2026 01:50:47 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============7439863081822515726=="
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=93_i915=2ECI=2EBAT=3A_success_for_mm=2Cdrm/i915=2Cpowerpc/s?=
 =?utf-8?q?pufs=3A_vm=5Fops-=3Eaccess_related_fixes?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "David Hildenbrand (Arm)" <david@kernel.org>
Cc: intel-gfx@lists.freedesktop.org
Date: Fri, 13 Nov 2026 01:50:47 -0000
Message-ID: <179453464701.18096.2317004592595208514@9ac1b63fe3ea>
X-Patchwork-Hint: ignore
References: <20261112-access_shite-v1-0-988a5c470db2@kernel.org>
In-Reply-To: <20261112-access_shite-v1-0-988a5c470db2@kernel.org>
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

--===============7439863081822515726==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: mm,drm/i915,powerpc/spufs: vm_ops->access related fixes
URL   : https://patchwork.freedesktop.org/series/178442/
State : success

== Summary ==

CI Bug Log - changes from CI_DRM_19513 -> Patchwork_178442v1
====================================================

Summary
-------

  **SUCCESS**

  No regressions found.

  External URL: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_178442v1/index.html

Participating hosts (40 -> 39)
------------------------------

  Missing    (1): bat-dg2-13 

Known issues
------------

  Here are the changes found in Patchwork_178442v1 that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@kms_pm_rpm@basic-pci-d3-state:
    - bat-rpls-4:         [PASS][1] -> [DMESG-WARN][2] ([i915#13400])
   [1]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19513/bat-rpls-4/igt@kms_pm_rpm@basic-pci-d3-state.html
   [2]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_178442v1/bat-rpls-4/igt@kms_pm_rpm@basic-pci-d3-state.html

  
#### Possible fixes ####

  * igt@vgem_basic@unload:
    - bat-rpls-4:         [DMESG-WARN][3] ([i915#13400]) -> [PASS][4]
   [3]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19513/bat-rpls-4/igt@vgem_basic@unload.html
   [4]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_178442v1/bat-rpls-4/igt@vgem_basic@unload.html

  
  [i915#13400]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13400


Build changes
-------------

  * Linux: CI_DRM_19513 -> Patchwork_178442v1

  CI-20190529: 20190529
  CI_DRM_19513: cc885f684cae2d69ce9e22c2b3634c29cd084b49 @ git://anongit.freedesktop.org/gfx-ci/linux
  IGT_9189: 9189
  Patchwork_178442v1: cc885f684cae2d69ce9e22c2b3634c29cd084b49 @ git://anongit.freedesktop.org/gfx-ci/linux

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_178442v1/index.html

--===============7439863081822515726==
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
<tr><td><b>Series:</b></td><td>mm,drm/i915,powerpc/spufs: vm_ops-&gt;access related fixes</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/178442/">https://patchwork.freedesktop.org/series/178442/</a></td></tr>
<tr><td><b>State:</b></td><td>success</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_178442v1/index.html">https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_178442v1/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from CI_DRM_19513 -&gt; Patchwork_178442v1</h1>
<h2>Summary</h2>
<p><strong>SUCCESS</strong></p>
<p>No regressions found.</p>
<p>External URL: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_178442v1/index.html</p>
<h2>Participating hosts (40 -&gt; 39)</h2>
<p>Missing    (1): bat-dg2-13 </p>
<h2>Known issues</h2>
<p>Here are the changes found in Patchwork_178442v1 that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>igt@kms_pm_rpm@basic-pci-d3-state:<ul>
<li>bat-rpls-4:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19513/bat-rpls-4/igt@kms_pm_rpm@basic-pci-d3-state.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_178442v1/bat-rpls-4/igt@kms_pm_rpm@basic-pci-d3-state.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13400">i915#13400</a>)</li>
</ul>
</li>
</ul>
<h4>Possible fixes</h4>
<ul>
<li>igt@vgem_basic@unload:<ul>
<li>bat-rpls-4:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19513/bat-rpls-4/igt@vgem_basic@unload.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13400">i915#13400</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_178442v1/bat-rpls-4/igt@vgem_basic@unload.html">PASS</a></li>
</ul>
</li>
</ul>
<h2>Build changes</h2>
<ul>
<li>Linux: CI_DRM_19513 -&gt; Patchwork_178442v1</li>
</ul>
<p>CI-20190529: 20190529<br />
  CI_DRM_19513: cc885f684cae2d69ce9e22c2b3634c29cd084b49 @ git://anongit.freedesktop.org/gfx-ci/linux<br />
  IGT_9189: 9189<br />
  Patchwork_178442v1: cc885f684cae2d69ce9e22c2b3634c29cd084b49 @ git://anongit.freedesktop.org/gfx-ci/linux</p>

</body>
</html>

--===============7439863081822515726==--
