Return-Path: <SRS0=c2Tb=MM=lists.freedesktop.org=intel-gfx-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,HTML_MESSAGE,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 241D8C07E9B
	for <intel-gfx@archiver.kernel.org>; Tue, 20 Jul 2021 22:56:35 +0000 (UTC)
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id B62F76101E
	for <intel-gfx@archiver.kernel.org>; Tue, 20 Jul 2021 22:56:34 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org B62F76101E
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=emeril.freedesktop.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=intel-gfx-bounces@lists.freedesktop.org
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3BEB76E05F;
	Tue, 20 Jul 2021 22:56:34 +0000 (UTC)
Received: from emeril.freedesktop.org (emeril.freedesktop.org
 [IPv6:2610:10:20:722:a800:ff:feee:56cf])
 by gabe.freedesktop.org (Postfix) with ESMTP id B38366E05F;
 Tue, 20 Jul 2021 22:56:32 +0000 (UTC)
Received: from emeril.freedesktop.org (localhost [127.0.0.1])
 by emeril.freedesktop.org (Postfix) with ESMTP id ABA9BA47E1;
 Tue, 20 Jul 2021 22:56:32 +0000 (UTC)
MIME-Version: 1.0
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Matthew Brost" <matthew.brost@intel.com>
Date: Tue, 20 Jul 2021 22:56:32 -0000
Message-ID: <162682179269.12850.5841882783797587533@emeril.freedesktop.org>
X-Patchwork-Hint: ignore
References: <20210720223921.56160-1-matthew.brost@intel.com>
In-Reply-To: <20210720223921.56160-1-matthew.brost@intel.com>
Subject: [Intel-gfx] =?utf-8?b?4pyTIEZpLkNJLkJBVDogc3VjY2VzcyBmb3IgU2Vy?=
 =?utf-8?q?ies_to_merge_a_subset_of_GuC_submission?=
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
Content-Type: multipart/mixed; boundary="===============1729739841=="
Errors-To: intel-gfx-bounces@lists.freedesktop.org
Sender: "Intel-gfx" <intel-gfx-bounces@lists.freedesktop.org>

--===============1729739841==
Content-Type: multipart/alternative;
 boundary="===============5638050850376568452=="

--===============5638050850376568452==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: Series to merge a subset of GuC submission
URL   : https://patchwork.freedesktop.org/series/92791/
State : success

== Summary ==

CI Bug Log - changes from CI_DRM_10358 -> Patchwork_20659
====================================================

Summary
-------

  **SUCCESS**

  No regressions found.

  External URL: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_20659/index.html

Known issues
------------

  Here are the changes found in Patchwork_20659 that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@amdgpu/amd_basic@semaphore:
    - fi-bsw-nick:        NOTRUN -> [SKIP][1] ([fdo#109271]) +17 similar issues
   [1]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_20659/fi-bsw-nick/igt@amdgpu/amd_basic@semaphore.html

  * igt@gem_exec_gttfill@basic:
    - fi-bsw-n3050:       NOTRUN -> [SKIP][2] ([fdo#109271])
   [2]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_20659/fi-bsw-n3050/igt@gem_exec_gttfill@basic.html

  * igt@gem_exec_suspend@basic-s3:
    - fi-bsw-n3050:       NOTRUN -> [INCOMPLETE][3] ([i915#3159])
   [3]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_20659/fi-bsw-n3050/igt@gem_exec_suspend@basic-s3.html

  
#### Possible fixes ####

  * igt@i915_selftest@live@execlists:
    - fi-bsw-nick:        [INCOMPLETE][4] ([i915#2782] / [i915#2940]) -> [PASS][5]
   [4]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10358/fi-bsw-nick/igt@i915_selftest@live@execlists.html
   [5]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_20659/fi-bsw-nick/igt@i915_selftest@live@execlists.html

  
  [fdo#109271]: https://bugs.freedesktop.org/show_bug.cgi?id=109271
  [i915#2782]: https://gitlab.freedesktop.org/drm/intel/issues/2782
  [i915#2940]: https://gitlab.freedesktop.org/drm/intel/issues/2940
  [i915#3159]: https://gitlab.freedesktop.org/drm/intel/issues/3159


Participating hosts (37 -> 35)
------------------------------

  Additional (1): fi-bsw-n3050 
  Missing    (3): fi-ilk-m540 fi-bdw-samus fi-hsw-4200u 


Build changes
-------------

  * Linux: CI_DRM_10358 -> Patchwork_20659

  CI-20190529: 20190529
  CI_DRM_10358: 76ff1f71cd0e2e203003b84881e41bf7be9f0e82 @ git://anongit.freedesktop.org/gfx-ci/linux
  IGT_6146: 6caef22e4aafed275771f564d4ea4cab09896ebc @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
  Patchwork_20659: eff5ff5cddbdabaa48b2a714bbfbfb9500a3de26 @ git://anongit.freedesktop.org/gfx-ci/linux


== Linux commits ==

eff5ff5cddbd drm/i915: Add intel_context tracing
67fb3ed8ac4e drm/i915/guc: Add trace point for GuC submit
26cd4897ed36 drm/i915/guc: Update GuC debugfs to support new GuC
e21fad90cbba drm/i915/guc: Update intel_gt_wait_for_idle to work with GuC
dbe4a36fbe4e drm/i915/guc: Ensure G2H response has space in buffer
bfce77d80f9f drm/i915/guc: Disable semaphores when using GuC scheduling
62126880619a drm/i915/guc: Ensure request ordering via completion fences
9911672af3c3 drm/i915: Disable preempt busywait when using GuC scheduling
a9c371205bcc drm/i915/guc: Extend deregistration fence to schedule disable
efc0364130bb drm/i915/guc: Disable engine barriers with GuC during unpin
1b654aaa7260 drm/i915/guc: Defer context unpin until scheduling is disabled
5c25a79e0e15 drm/i915/guc: Insert fence on context when deregistering
f02a6e7e28bc drm/i915/guc: Implement GuC context operations for new inteface
2234dab12cac drm/i915/guc: Add bypass tasklet submission path to GuC
9d1be7a2819b drm/i915/guc: Implement GuC submission tasklet
722a3e5a4415 drm/i915/guc: Add LRC descriptor context lookup array
7e036ee5f85e drm/i915/guc: Remove GuC stage descriptor, add LRC descriptor
ec53f1834fea drm/i915/guc: Add new GuC interface defines and structures

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_20659/index.html

--===============5638050850376568452==
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
<tr><td><b>Series:</b></td><td>Series to merge a subset of GuC submission</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/92791/">https://patchwork.freedesktop.org/series/92791/</a></td></tr>
<tr><td><b>State:</b></td><td>success</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_20659/index.html">https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_20659/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from CI_DRM_10358 -&gt; Patchwork_20659</h1>
<h2>Summary</h2>
<p><strong>SUCCESS</strong></p>
<p>No regressions found.</p>
<p>External URL: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_20659/index.html</p>
<h2>Known issues</h2>
<p>Here are the changes found in Patchwork_20659 that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>
<p>igt@amdgpu/amd_basic@semaphore:</p>
<ul>
<li>fi-bsw-nick:        NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_20659/fi-bsw-nick/igt@amdgpu/amd_basic@semaphore.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a>) +17 similar issues</li>
</ul>
</li>
<li>
<p>igt@gem_exec_gttfill@basic:</p>
<ul>
<li>fi-bsw-n3050:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_20659/fi-bsw-n3050/igt@gem_exec_gttfill@basic.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_exec_suspend@basic-s3:</p>
<ul>
<li>fi-bsw-n3050:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_20659/fi-bsw-n3050/igt@gem_exec_suspend@basic-s3.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/3159">i915#3159</a>)</li>
</ul>
</li>
</ul>
<h4>Possible fixes</h4>
<ul>
<li>igt@i915_selftest@live@execlists:<ul>
<li>fi-bsw-nick:        <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10358/fi-bsw-nick/igt@i915_selftest@live@execlists.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/2782">i915#2782</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/2940">i915#2940</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_20659/fi-bsw-nick/igt@i915_selftest@live@execlists.html">PASS</a></li>
</ul>
</li>
</ul>
<h2>Participating hosts (37 -&gt; 35)</h2>
<p>Additional (1): fi-bsw-n3050 <br />
  Missing    (3): fi-ilk-m540 fi-bdw-samus fi-hsw-4200u </p>
<h2>Build changes</h2>
<ul>
<li>Linux: CI_DRM_10358 -&gt; Patchwork_20659</li>
</ul>
<p>CI-20190529: 20190529<br />
  CI_DRM_10358: 76ff1f71cd0e2e203003b84881e41bf7be9f0e82 @ git://anongit.freedesktop.org/gfx-ci/linux<br />
  IGT_6146: 6caef22e4aafed275771f564d4ea4cab09896ebc @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git<br />
  Patchwork_20659: eff5ff5cddbdabaa48b2a714bbfbfb9500a3de26 @ git://anongit.freedesktop.org/gfx-ci/linux</p>
<p>== Linux commits ==</p>
<p>eff5ff5cddbd drm/i915: Add intel_context tracing<br />
67fb3ed8ac4e drm/i915/guc: Add trace point for GuC submit<br />
26cd4897ed36 drm/i915/guc: Update GuC debugfs to support new GuC<br />
e21fad90cbba drm/i915/guc: Update intel_gt_wait_for_idle to work with GuC<br />
dbe4a36fbe4e drm/i915/guc: Ensure G2H response has space in buffer<br />
bfce77d80f9f drm/i915/guc: Disable semaphores when using GuC scheduling<br />
62126880619a drm/i915/guc: Ensure request ordering via completion fences<br />
9911672af3c3 drm/i915: Disable preempt busywait when using GuC scheduling<br />
a9c371205bcc drm/i915/guc: Extend deregistration fence to schedule disable<br />
efc0364130bb drm/i915/guc: Disable engine barriers with GuC during unpin<br />
1b654aaa7260 drm/i915/guc: Defer context unpin until scheduling is disabled<br />
5c25a79e0e15 drm/i915/guc: Insert fence on context when deregistering<br />
f02a6e7e28bc drm/i915/guc: Implement GuC context operations for new inteface<br />
2234dab12cac drm/i915/guc: Add bypass tasklet submission path to GuC<br />
9d1be7a2819b drm/i915/guc: Implement GuC submission tasklet<br />
722a3e5a4415 drm/i915/guc: Add LRC descriptor context lookup array<br />
7e036ee5f85e drm/i915/guc: Remove GuC stage descriptor, add LRC descriptor<br />
ec53f1834fea drm/i915/guc: Add new GuC interface defines and structures</p>

</body>
</html>

--===============5638050850376568452==--

--===============1729739841==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Intel-gfx mailing list
Intel-gfx@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/intel-gfx

--===============1729739841==--
