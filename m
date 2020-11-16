Return-Path: <SRS0=ME6F=EW=lists.freedesktop.org=intel-gfx-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.7 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,HTML_MESSAGE,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DCE1EC4742C
	for <intel-gfx@archiver.kernel.org>; Mon, 16 Nov 2020 08:27:15 +0000 (UTC)
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 71D6120702
	for <intel-gfx@archiver.kernel.org>; Mon, 16 Nov 2020 08:27:15 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 71D6120702
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=emeril.freedesktop.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=intel-gfx-bounces@lists.freedesktop.org
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7E13789D67;
	Mon, 16 Nov 2020 08:27:14 +0000 (UTC)
Received: from emeril.freedesktop.org (emeril.freedesktop.org
 [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTP id B997889D66;
 Mon, 16 Nov 2020 08:27:12 +0000 (UTC)
Received: from emeril.freedesktop.org (localhost [127.0.0.1])
 by emeril.freedesktop.org (Postfix) with ESMTP id AA9A0A66C9;
 Mon, 16 Nov 2020 08:27:12 +0000 (UTC)
MIME-Version: 1.0
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Manasi Navare" <manasi.d.navare@intel.com>
Date: Mon, 16 Nov 2020 08:27:12 -0000
Message-ID: <160551523266.30809.17197783632614770572@emeril.freedesktop.org>
X-Patchwork-Hint: ignore
References: <20201116062948.25052-1-manasi.d.navare@intel.com>
In-Reply-To: <20201116062948.25052-1-manasi.d.navare@intel.com>
Subject: [Intel-gfx] =?utf-8?b?4pyTIEZpLkNJLkJBVDogc3VjY2VzcyBmb3Igc2Vy?=
 =?utf-8?q?ies_starting_with_=5BCI=2Cv2=2C1/3=5D_drm/i915=3A_Precompute_ca?=
 =?utf-8?q?n=5Fsagv_for_each_wm_level?=
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
Content-Type: multipart/mixed; boundary="===============1803595030=="
Errors-To: intel-gfx-bounces@lists.freedesktop.org
Sender: "Intel-gfx" <intel-gfx-bounces@lists.freedesktop.org>

--===============1803595030==
Content-Type: multipart/alternative;
 boundary="===============5881181503194468543=="

--===============5881181503194468543==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: series starting with [CI,v2,1/3] drm/i915: Precompute can_sagv for each wm level
URL   : https://patchwork.freedesktop.org/series/83874/
State : success

== Summary ==

CI Bug Log - changes from CI_DRM_9334 -> Patchwork_18911
====================================================

Summary
-------

  **SUCCESS**

  No regressions found.

  External URL: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_18911/index.html

New tests
---------

  New tests have been introduced between CI_DRM_9334 and Patchwork_18911:

### New CI tests (1) ###

  * boot:
    - Statuses : 5 pass(s)
    - Exec time: [0.0] s

  


Changes
-------

  No changes found


Participating hosts (5 -> 5)
------------------------------

  No changes in participating hosts


Build changes
-------------

  * Linux: CI_DRM_9334 -> Patchwork_18911

  CI-20190529: 20190529
  CI_DRM_9334: 0dac74f48884712184124a106fca2fd8aa3ec4f1 @ git://anongit.freedesktop.org/gfx-ci/linux
  IGT_5850: 9748a4a0f93d108955d374a866e60cb962da9b5d @ git://anongit.freedesktop.org/xorg/app/intel-gpu-tools
  Patchwork_18911: e8020331e37c1dc93c153c5870df669716a63d5a @ git://anongit.freedesktop.org/gfx-ci/linux


== Linux commits ==

e8020331e37c drm/i915: Remove skl_adjusted_plane_pixel_rate()
0247253652f5 drm/i915: Store plane relative data rate in crtc_state
9f45cefbd3a5 drm/i915: Precompute can_sagv for each wm level

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_18911/index.html

--===============5881181503194468543==
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
<tr><td><b>Series:</b></td><td>series starting with [CI,v2,1/3] drm/i915: Precompute can_sagv for each wm level</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/83874/">https://patchwork.freedesktop.org/series/83874/</a></td></tr>
<tr><td><b>State:</b></td><td>success</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_18911/index.html">https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_18911/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from CI_DRM_9334 -&gt; Patchwork_18911</h1>
<h2>Summary</h2>
<p><strong>SUCCESS</strong></p>
<p>No regressions found.</p>
<p>External URL: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_18911/index.html</p>
<h2>New tests</h2>
<p>New tests have been introduced between CI_DRM_9334 and Patchwork_18911:</p>
<h3>New CI tests (1)</h3>
<ul>
<li>boot:<ul>
<li>Statuses : 5 pass(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
</ul>
<h2>Changes</h2>
<p>No changes found</p>
<h2>Participating hosts (5 -&gt; 5)</h2>
<p>No changes in participating hosts</p>
<h2>Build changes</h2>
<ul>
<li>Linux: CI_DRM_9334 -&gt; Patchwork_18911</li>
</ul>
<p>CI-20190529: 20190529<br />
  CI_DRM_9334: 0dac74f48884712184124a106fca2fd8aa3ec4f1 @ git://anongit.freedesktop.org/gfx-ci/linux<br />
  IGT_5850: 9748a4a0f93d108955d374a866e60cb962da9b5d @ git://anongit.freedesktop.org/xorg/app/intel-gpu-tools<br />
  Patchwork_18911: e8020331e37c1dc93c153c5870df669716a63d5a @ git://anongit.freedesktop.org/gfx-ci/linux</p>
<p>== Linux commits ==</p>
<p>e8020331e37c drm/i915: Remove skl_adjusted_plane_pixel_rate()<br />
0247253652f5 drm/i915: Store plane relative data rate in crtc_state<br />
9f45cefbd3a5 drm/i915: Precompute can_sagv for each wm level</p>

</body>
</html>

--===============5881181503194468543==--

--===============1803595030==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Intel-gfx mailing list
Intel-gfx@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/intel-gfx

--===============1803595030==--
