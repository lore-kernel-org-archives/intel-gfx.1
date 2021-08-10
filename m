Return-Path: <SRS0=Fgr2=NB=lists.freedesktop.org=intel-gfx-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,HTML_MESSAGE,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6C19BC4338F
	for <intel-gfx@archiver.kernel.org>; Tue, 10 Aug 2021 13:57:31 +0000 (UTC)
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 2E114606A5
	for <intel-gfx@archiver.kernel.org>; Tue, 10 Aug 2021 13:57:31 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 2E114606A5
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=emeril.freedesktop.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.freedesktop.org
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8EB9089FFD;
	Tue, 10 Aug 2021 13:57:30 +0000 (UTC)
Received: from emeril.freedesktop.org (emeril.freedesktop.org
 [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTP id 708F189FFD;
 Tue, 10 Aug 2021 13:57:29 +0000 (UTC)
Received: from emeril.freedesktop.org (localhost [127.0.0.1])
 by emeril.freedesktop.org (Postfix) with ESMTP id 68785A73C9;
 Tue, 10 Aug 2021 13:57:29 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============2424494045294861354=="
MIME-Version: 1.0
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Anshuman Gupta" <anshuman.gupta@intel.com>
Cc: intel-gfx@lists.freedesktop.org
Date: Tue, 10 Aug 2021 13:57:29 -0000
Message-ID: <162860384942.29683.15649135811749450065@emeril.freedesktop.org>
X-Patchwork-Hint: ignore
References: <20210810113112.31739-1-anshuman.gupta@intel.com>
In-Reply-To: <20210810113112.31739-1-anshuman.gupta@intel.com>
Subject: [Intel-gfx] =?utf-8?b?4pyXIEZpLkNJLkJBVDogZmFpbHVyZSBmb3IgVHdl?=
 =?utf-8?q?aked_Wa=5F14010685332_for_all_PCHs?=
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

--===============2424494045294861354==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: Tweaked Wa_14010685332 for all PCHs
URL   : https://patchwork.freedesktop.org/series/93548/
State : failure

== Summary ==

CI Bug Log - changes from CI_DRM_10464 -> Patchwork_20792
====================================================

Summary
-------

  **FAILURE**

  Serious unknown changes coming with Patchwork_20792 absolutely need to be
  verified manually.
  
  If you think the reported changes have nothing to do with the changes
  introduced in Patchwork_20792, please notify your bug team to allow them
  to document this new failure mode, which will reduce false positives in CI.

  External URL: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_20792/index.html

Possible new issues
-------------------

  Here are the unknown changes that may have been introduced in Patchwork_20792:

### IGT changes ###

#### Possible regressions ####

  * igt@core_hotunplug@unbind-rebind:
    - fi-rkl-guc:         NOTRUN -> [DMESG-WARN][1]
   [1]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_20792/fi-rkl-guc/igt@core_hotunplug@unbind-rebind.html

  
Known issues
------------

  Here are the changes found in Patchwork_20792 that come from known issues:

### CI changes ###

#### Issues hit ####

  * boot:
    - fi-kbl-soraka:      [PASS][2] -> [FAIL][3] ([i915#3895])
   [2]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10464/fi-kbl-soraka/boot.html
   [3]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_20792/fi-kbl-soraka/boot.html

  

### IGT changes ###

#### Issues hit ####

  * igt@prime_vgem@basic-userptr:
    - fi-rkl-guc:         NOTRUN -> [SKIP][4] ([i915#3301])
   [4]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_20792/fi-rkl-guc/igt@prime_vgem@basic-userptr.html

  * igt@prime_vgem@basic-write:
    - fi-rkl-guc:         NOTRUN -> [SKIP][5] ([i915#3291]) +2 similar issues
   [5]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_20792/fi-rkl-guc/igt@prime_vgem@basic-write.html

  
#### Possible fixes ####

  * igt@i915_pm_rps@basic-api:
    - fi-rkl-guc:         [DMESG-WARN][6] ([i915#3925]) -> [PASS][7]
   [6]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10464/fi-rkl-guc/igt@i915_pm_rps@basic-api.html
   [7]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_20792/fi-rkl-guc/igt@i915_pm_rps@basic-api.html

  
#### Warnings ####

  * igt@runner@aborted:
    - fi-rkl-guc:         [FAIL][8] ([i915#3925]) -> [FAIL][9] ([i915#1602])
   [8]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10464/fi-rkl-guc/igt@runner@aborted.html
   [9]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_20792/fi-rkl-guc/igt@runner@aborted.html

  
  [i915#1602]: https://gitlab.freedesktop.org/drm/intel/issues/1602
  [i915#3291]: https://gitlab.freedesktop.org/drm/intel/issues/3291
  [i915#3301]: https://gitlab.freedesktop.org/drm/intel/issues/3301
  [i915#3895]: https://gitlab.freedesktop.org/drm/intel/issues/3895
  [i915#3925]: https://gitlab.freedesktop.org/drm/intel/issues/3925


Participating hosts (37 -> 34)
------------------------------

  Missing    (3): fi-bdw-samus fi-bsw-cyan bat-jsl-1 


Build changes
-------------

  * Linux: CI_DRM_10464 -> Patchwork_20792

  CI-20190529: 20190529
  CI_DRM_10464: 294a55f328023a4e36f46e5eb6c4859076efd850 @ git://anongit.freedesktop.org/gfx-ci/linux
  IGT_6165: df5d05d742275b049f6f3c852a86c4769966b126 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
  Patchwork_20792: 0af364b9489343e7bf0eb498f34d70f67dd7551c @ git://anongit.freedesktop.org/gfx-ci/linux


== Linux commits ==

0af364b94893 drm/i915: Tweaked Wa_14010685332 for all PCHs

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_20792/index.html

--===============2424494045294861354==
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
<tr><td><b>Series:</b></td><td>Tweaked Wa_14010685332 for all PCHs</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/93548/">https://patchwork.freedesktop.org/series/93548/</a></td></tr>
<tr><td><b>State:</b></td><td>failure</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_20792/index.html">https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_20792/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from CI_DRM_10464 -&gt; Patchwork_20792</h1>
<h2>Summary</h2>
<p><strong>FAILURE</strong></p>
<p>Serious unknown changes coming with Patchwork_20792 absolutely need to be<br />
  verified manually.</p>
<p>If you think the reported changes have nothing to do with the changes<br />
  introduced in Patchwork_20792, please notify your bug team to allow them<br />
  to document this new failure mode, which will reduce false positives in CI.</p>
<p>External URL: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_20792/index.html</p>
<h2>Possible new issues</h2>
<p>Here are the unknown changes that may have been introduced in Patchwork_20792:</p>
<h3>IGT changes</h3>
<h4>Possible regressions</h4>
<ul>
<li>igt@core_hotunplug@unbind-rebind:<ul>
<li>fi-rkl-guc:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_20792/fi-rkl-guc/igt@core_hotunplug@unbind-rebind.html">DMESG-WARN</a></li>
</ul>
</li>
</ul>
<h2>Known issues</h2>
<p>Here are the changes found in Patchwork_20792 that come from known issues:</p>
<h3>CI changes</h3>
<h4>Issues hit</h4>
<ul>
<li>boot:<ul>
<li>fi-kbl-soraka:      <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10464/fi-kbl-soraka/boot.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_20792/fi-kbl-soraka/boot.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/3895">i915#3895</a>)</li>
</ul>
</li>
</ul>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>
<p>igt@prime_vgem@basic-userptr:</p>
<ul>
<li>fi-rkl-guc:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_20792/fi-rkl-guc/igt@prime_vgem@basic-userptr.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/3301">i915#3301</a>)</li>
</ul>
</li>
<li>
<p>igt@prime_vgem@basic-write:</p>
<ul>
<li>fi-rkl-guc:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_20792/fi-rkl-guc/igt@prime_vgem@basic-write.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/3291">i915#3291</a>) +2 similar issues</li>
</ul>
</li>
</ul>
<h4>Possible fixes</h4>
<ul>
<li>igt@i915_pm_rps@basic-api:<ul>
<li>fi-rkl-guc:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10464/fi-rkl-guc/igt@i915_pm_rps@basic-api.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/3925">i915#3925</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_20792/fi-rkl-guc/igt@i915_pm_rps@basic-api.html">PASS</a></li>
</ul>
</li>
</ul>
<h4>Warnings</h4>
<ul>
<li>igt@runner@aborted:<ul>
<li>fi-rkl-guc:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10464/fi-rkl-guc/igt@runner@aborted.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/3925">i915#3925</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_20792/fi-rkl-guc/igt@runner@aborted.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1602">i915#1602</a>)</li>
</ul>
</li>
</ul>
<h2>Participating hosts (37 -&gt; 34)</h2>
<p>Missing    (3): fi-bdw-samus fi-bsw-cyan bat-jsl-1 </p>
<h2>Build changes</h2>
<ul>
<li>Linux: CI_DRM_10464 -&gt; Patchwork_20792</li>
</ul>
<p>CI-20190529: 20190529<br />
  CI_DRM_10464: 294a55f328023a4e36f46e5eb6c4859076efd850 @ git://anongit.freedesktop.org/gfx-ci/linux<br />
  IGT_6165: df5d05d742275b049f6f3c852a86c4769966b126 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git<br />
  Patchwork_20792: 0af364b9489343e7bf0eb498f34d70f67dd7551c @ git://anongit.freedesktop.org/gfx-ci/linux</p>
<p>== Linux commits ==</p>
<p>0af364b94893 drm/i915: Tweaked Wa_14010685332 for all PCHs</p>

</body>
</html>

--===============2424494045294861354==--
