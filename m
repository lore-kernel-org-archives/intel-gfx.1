Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C6474606A31E
	for <intel-gfx@archiver.kernel.org>; Mon, 23 Nov 2026 19:49:44 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5861610F1AD;
	Mon, 23 Nov 2026 19:49:44 +0000 (UTC)
Received: from 9ac1b63fe3ea (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 236E410F1AD;
 Mon, 23 Nov 2026 19:49:43 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============0238461710872456386=="
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=97_i915=2ECI=2EBAT=3A_failure_for_drm/i915=3A_Annotate_flex?=
 =?utf-8?q?ible_array_members_with_=5F=5Fcounted=5Fby=28=29_attribute_=28rev?=
 =?utf-8?q?2=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Krzysztof Karas" <krzysztof.karas@intel.com>
Cc: intel-gfx@lists.freedesktop.org
Date: Mon, 23 Nov 2026 19:49:43 -0000
Message-ID: <179546338313.71994.12837665313388786158@9ac1b63fe3ea>
X-Patchwork-Hint: ignore
References: <20261123120137.3460155-1-krzysztof.karas@intel.com>
In-Reply-To: <20261123120137.3460155-1-krzysztof.karas@intel.com>
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

--===============0238461710872456386==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: drm/i915: Annotate flexible array members with __counted_by() attribute (rev2)
URL   : https://patchwork.freedesktop.org/series/179077/
State : failure

== Summary ==

CI Bug Log - changes from CI_DRM_19588 -> Patchwork_179077v2
====================================================

Summary
-------

  **FAILURE**

  Serious unknown changes coming with Patchwork_179077v2 absolutely need to be
  verified manually.
  
  If you think the reported changes have nothing to do with the changes
  introduced in Patchwork_179077v2, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them
  to document this new failure mode, which will reduce false positives in CI.

  External URL: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_179077v2/index.html

Participating hosts (40 -> 39)
------------------------------

  Missing    (1): bat-dg2-13 

Possible new issues
-------------------

  Here are the unknown changes that may have been introduced in Patchwork_179077v2:

### IGT changes ###

#### Possible regressions ####

  * igt@i915_selftest@live@gt_contexts:
    - bat-arlh-2:         [PASS][1] -> [INCOMPLETE][2]
   [1]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19588/bat-arlh-2/igt@i915_selftest@live@gt_contexts.html
   [2]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_179077v2/bat-arlh-2/igt@i915_selftest@live@gt_contexts.html

  
Known issues
------------

  Here are the changes found in Patchwork_179077v2 that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@i915_selftest@live:
    - bat-arlh-2:         [PASS][3] -> [INCOMPLETE][4] ([i915#16547])
   [3]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19588/bat-arlh-2/igt@i915_selftest@live.html
   [4]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_179077v2/bat-arlh-2/igt@i915_selftest@live.html

  
  [i915#16547]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16547


Build changes
-------------

  * Linux: CI_DRM_19588 -> Patchwork_179077v2

  CI-20190529: 20190529
  CI_DRM_19588: 401a3e7b64d174c4f2b256b035de716c7b79bdc1 @ git://anongit.freedesktop.org/gfx-ci/linux
  IGT_9201: 9201
  Patchwork_179077v2: 401a3e7b64d174c4f2b256b035de716c7b79bdc1 @ git://anongit.freedesktop.org/gfx-ci/linux

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_179077v2/index.html

--===============0238461710872456386==
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
<tr><td><b>Series:</b></td><td>drm/i915: Annotate flexible array members with __counted_by() attribute (rev2)</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/179077/">https://patchwork.freedesktop.org/series/179077/</a></td></tr>
<tr><td><b>State:</b></td><td>failure</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_179077v2/index.html">https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_179077v2/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from CI_DRM_19588 -&gt; Patchwork_179077v2</h1>
<h2>Summary</h2>
<p><strong>FAILURE</strong></p>
<p>Serious unknown changes coming with Patchwork_179077v2 absolutely need to be<br />
  verified manually.</p>
<p>If you think the reported changes have nothing to do with the changes<br />
  introduced in Patchwork_179077v2, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them<br />
  to document this new failure mode, which will reduce false positives in CI.</p>
<p>External URL: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_179077v2/index.html</p>
<h2>Participating hosts (40 -&gt; 39)</h2>
<p>Missing    (1): bat-dg2-13 </p>
<h2>Possible new issues</h2>
<p>Here are the unknown changes that may have been introduced in Patchwork_179077v2:</p>
<h3>IGT changes</h3>
<h4>Possible regressions</h4>
<ul>
<li>igt@i915_selftest@live@gt_contexts:<ul>
<li>bat-arlh-2:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19588/bat-arlh-2/igt@i915_selftest@live@gt_contexts.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_179077v2/bat-arlh-2/igt@i915_selftest@live@gt_contexts.html">INCOMPLETE</a></li>
</ul>
</li>
</ul>
<h2>Known issues</h2>
<p>Here are the changes found in Patchwork_179077v2 that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>igt@i915_selftest@live:<ul>
<li>bat-arlh-2:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19588/bat-arlh-2/igt@i915_selftest@live.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_179077v2/bat-arlh-2/igt@i915_selftest@live.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16547">i915#16547</a>)</li>
</ul>
</li>
</ul>
<h2>Build changes</h2>
<ul>
<li>Linux: CI_DRM_19588 -&gt; Patchwork_179077v2</li>
</ul>
<p>CI-20190529: 20190529<br />
  CI_DRM_19588: 401a3e7b64d174c4f2b256b035de716c7b79bdc1 @ git://anongit.freedesktop.org/gfx-ci/linux<br />
  IGT_9201: 9201<br />
  Patchwork_179077v2: 401a3e7b64d174c4f2b256b035de716c7b79bdc1 @ git://anongit.freedesktop.org/gfx-ci/linux</p>

</body>
</html>

--===============0238461710872456386==--
