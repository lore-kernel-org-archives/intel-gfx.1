Return-Path: <intel-gfx-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1004FCA6019
	for <intel-gfx@archiver.kernel.org>; Fri,  9 Oct 2026 15:51:43 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9F0F31121DC;
	Fri,  9 Oct 2026 15:51:42 +0000 (UTC)
Received: from 221881a7231d (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EB98610E9DC;
 Fri,  9 Oct 2026 15:51:40 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============1228694499736048062=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=93_i915=2ECI=2EBAT=3A_success_for_drm/i915/pmu=3A_convert_i?=
 =?utf-8?q?915=5Fpmu-=3Elock_to_raw=5Fspinlock=5Ft_from_spinlock=5Ft_=28rev3?=
 =?utf-8?q?=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Anubhav Shelat" <ashelat@redhat.com>
Cc: intel-gfx@lists.freedesktop.org
Date: Fri, 09 Oct 2026 15:51:40 -0000
Message-ID: <179156110095.4094.6502881970861735005@221881a7231d>
X-Patchwork-Hint: ignore
References: <20261005195658.732657-2-ashelat@redhat.com>
In-Reply-To: <20261005195658.732657-2-ashelat@redhat.com>
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

--===============1228694499736048062==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: drm/i915/pmu: convert i915_pmu->lock to raw_spinlock_t from spinlock_t (rev3)
URL   : https://patchwork.freedesktop.org/series/175438/
State : success

== Summary ==

CI Bug Log - changes from CI_DRM_19309 -> Patchwork_175438v3
====================================================

Summary
-------

  **SUCCESS**

  No regressions found.

  External URL: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_175438v3/index.html

Participating hosts (39 -> 37)
------------------------------

  Missing    (2): bat-dg2-13 bat-adls-6 


Changes
-------

  No changes found


Build changes
-------------

  * Linux: CI_DRM_19309 -> Patchwork_175438v3

  CI-20190529: 20190529
  CI_DRM_19309: a9079e63263acdef3db9b768ef47cfaf779a97aa @ git://anongit.freedesktop.org/gfx-ci/linux
  IGT_9138: 9138
  Patchwork_175438v3: a9079e63263acdef3db9b768ef47cfaf779a97aa @ git://anongit.freedesktop.org/gfx-ci/linux

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_175438v3/index.html

--===============1228694499736048062==
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
<tr><td><b>Series:</b></td><td>drm/i915/pmu: convert i915_pmu-&gt;lock to raw_spinlock_t from spinlock_t (rev3)</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/175438/">https://patchwork.freedesktop.org/series/175438/</a></td></tr>
<tr><td><b>State:</b></td><td>success</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_175438v3/index.html">https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_175438v3/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from CI_DRM_19309 -&gt; Patchwork_175438v3</h1>
<h2>Summary</h2>
<p><strong>SUCCESS</strong></p>
<p>No regressions found.</p>
<p>External URL: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_175438v3/index.html</p>
<h2>Participating hosts (39 -&gt; 37)</h2>
<p>Missing    (2): bat-dg2-13 bat-adls-6 </p>
<h2>Changes</h2>
<p>No changes found</p>
<h2>Build changes</h2>
<ul>
<li>Linux: CI_DRM_19309 -&gt; Patchwork_175438v3</li>
</ul>
<p>CI-20190529: 20190529<br />
  CI_DRM_19309: a9079e63263acdef3db9b768ef47cfaf779a97aa @ git://anongit.freedesktop.org/gfx-ci/linux<br />
  IGT_9138: 9138<br />
  Patchwork_175438v3: a9079e63263acdef3db9b768ef47cfaf779a97aa @ git://anongit.freedesktop.org/gfx-ci/linux</p>

</body>
</html>

--===============1228694499736048062==--
