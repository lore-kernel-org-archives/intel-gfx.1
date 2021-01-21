Return-Path: <SRS0=DGqE=GY=lists.freedesktop.org=intel-gfx-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,HTML_MESSAGE,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0B9DFC433E0
	for <intel-gfx@archiver.kernel.org>; Thu, 21 Jan 2021 23:43:42 +0000 (UTC)
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id AB817206B7
	for <intel-gfx@archiver.kernel.org>; Thu, 21 Jan 2021 23:43:41 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org AB817206B7
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=emeril.freedesktop.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=intel-gfx-bounces@lists.freedesktop.org
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 25DD96E97A;
	Thu, 21 Jan 2021 23:43:41 +0000 (UTC)
Received: from emeril.freedesktop.org (emeril.freedesktop.org
 [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTP id 20F706E979;
 Thu, 21 Jan 2021 23:43:40 +0000 (UTC)
Received: from emeril.freedesktop.org (localhost [127.0.0.1])
 by emeril.freedesktop.org (Postfix) with ESMTP id 1B3D6A8835;
 Thu, 21 Jan 2021 23:43:40 +0000 (UTC)
MIME-Version: 1.0
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Chris Wilson" <chris@chris-wilson.co.uk>
Date: Thu, 21 Jan 2021 23:43:40 -0000
Message-ID: <161127262008.14015.2263340197822440596@emeril.freedesktop.org>
X-Patchwork-Hint: ignore
References: <20210121154950.19898-1-chris@chris-wilson.co.uk>
In-Reply-To: <20210121154950.19898-1-chris@chris-wilson.co.uk>
Subject: [Intel-gfx] =?utf-8?b?4pyXIEZpLkNJLkJBVDogZmFpbHVyZSBmb3Igc2Vy?=
 =?utf-8?q?ies_starting_with_=5BCI=2C1/3=5D_drm/i915/gt=3A_Flush_GT_interr?=
 =?utf-8?q?upt_handler_before_changing_interrupt_state?=
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
Content-Type: multipart/mixed; boundary="===============0559224158=="
Errors-To: intel-gfx-bounces@lists.freedesktop.org
Sender: "Intel-gfx" <intel-gfx-bounces@lists.freedesktop.org>

--===============0559224158==
Content-Type: multipart/alternative;
 boundary="===============5117588383321889601=="

--===============5117588383321889601==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: series starting with [CI,1/3] drm/i915/gt: Flush GT interrupt handler before changing interrupt state
URL   : https://patchwork.freedesktop.org/series/86144/
State : failure

== Summary ==

Applying: drm/i915/gt: Flush GT interrupt handler before changing interrupt state
Using index info to reconstruct a base tree...
M	drivers/gpu/drm/i915/gt/intel_execlists_submission.c
Falling back to patching base and 3-way merge...
Auto-merging drivers/gpu/drm/i915/gt/intel_execlists_submission.c
No changes -- Patch already applied.
Applying: drm/i915/gt: Move execlists_reset() out of line
Using index info to reconstruct a base tree...
M	drivers/gpu/drm/i915/gt/intel_execlists_submission.c
Falling back to patching base and 3-way merge...
No changes -- Patch already applied.
Applying: drm/i915/gt: Call stop_ring() from ring resume, again
Using index info to reconstruct a base tree...
M	drivers/gpu/drm/i915/gt/intel_ring_submission.c
Falling back to patching base and 3-way merge...
No changes -- Patch already applied.



--===============5117588383321889601==
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
<tr><td><b>Series:</b></td><td>series starting with [CI,1/3] drm/i915/gt: Flush GT interrupt handler before changing interrupt state</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/86144/">https://patchwork.freedesktop.org/series/86144/</a></td></tr>
<tr><td><b>State:</b></td><td>failure</td></tr>

</table>


    <p>Applying: drm/i915/gt: Flush GT interrupt handler before changing interrupt state<br />
Using index info to reconstruct a base tree...<br />
M   drivers/gpu/drm/i915/gt/intel_execlists_submission.c<br />
Falling back to patching base and 3-way merge...<br />
Auto-merging drivers/gpu/drm/i915/gt/intel_execlists_submission.c<br />
No changes -- Patch already applied.<br />
Applying: drm/i915/gt: Move execlists_reset() out of line<br />
Using index info to reconstruct a base tree...<br />
M   drivers/gpu/drm/i915/gt/intel_execlists_submission.c<br />
Falling back to patching base and 3-way merge...<br />
No changes -- Patch already applied.<br />
Applying: drm/i915/gt: Call stop_ring() from ring resume, again<br />
Using index info to reconstruct a base tree...<br />
M   drivers/gpu/drm/i915/gt/intel_ring_submission.c<br />
Falling back to patching base and 3-way merge...<br />
No changes -- Patch already applied.</p>

</body>
</html>

--===============5117588383321889601==--

--===============0559224158==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Intel-gfx mailing list
Intel-gfx@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/intel-gfx

--===============0559224158==--
