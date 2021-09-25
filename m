Return-Path: <SRS0=bSLa=OP=lists.freedesktop.org=intel-gfx-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 51D69C433F5
	for <intel-gfx@archiver.kernel.org>; Sat, 25 Sep 2021 22:37:58 +0000 (UTC)
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id DD22361041
	for <intel-gfx@archiver.kernel.org>; Sat, 25 Sep 2021 22:37:57 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org DD22361041
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=emeril.freedesktop.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.freedesktop.org
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1FCC56E4B0;
	Sat, 25 Sep 2021 22:37:57 +0000 (UTC)
Received: from emeril.freedesktop.org (emeril.freedesktop.org
 [IPv6:2610:10:20:722:a800:ff:feee:56cf])
 by gabe.freedesktop.org (Postfix) with ESMTP id 7FAD96E4AF;
 Sat, 25 Sep 2021 22:37:56 +0000 (UTC)
Received: from emeril.freedesktop.org (localhost [127.0.0.1])
 by emeril.freedesktop.org (Postfix) with ESMTP id 76DC2AADCF;
 Sat, 25 Sep 2021 22:37:56 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============5616374507140299434=="
MIME-Version: 1.0
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Colin King" <colin.king@canonical.com>
Cc: intel-gfx@lists.freedesktop.org
Date: Sat, 25 Sep 2021 22:37:56 -0000
Message-ID: <163260947646.10331.13600131335047589852@emeril.freedesktop.org>
X-Patchwork-Hint: ignore
References: <20210925221221.181630-1-colin.king@canonical.com>
In-Reply-To: <20210925221221.181630-1-colin.king@canonical.com>
Subject: [Intel-gfx] =?utf-8?b?4pyXIEZpLkNJLkJBVDogZmFpbHVyZSBmb3IgZHJt?=
 =?utf-8?q?/i915/gt=3A_return_NULL_rather_than_a_plain_0_integer?=
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

--===============5616374507140299434==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: drm/i915/gt: return NULL rather than a plain 0 integer
URL   : https://patchwork.freedesktop.org/series/95062/
State : failure

== Summary ==

Applying: drm/i915/gt: return NULL rather than a plain 0 integer
Using index info to reconstruct a base tree...
M	drivers/gpu/drm/i915/gt/intel_ring_submission.c
Falling back to patching base and 3-way merge...
Auto-merging drivers/gpu/drm/i915/gt/intel_ring_submission.c
No changes -- Patch already applied.



--===============5616374507140299434==
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
<tr><td><b>Series:</b></td><td>drm/i915/gt: return NULL rather than a plain 0 integer</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/95062/">https://patchwork.freedesktop.org/series/95062/</a></td></tr>
<tr><td><b>State:</b></td><td>failure</td></tr>

</table>


    <p>Applying: drm/i915/gt: return NULL rather than a plain 0 integer<br />
Using index info to reconstruct a base tree...<br />
M   drivers/gpu/drm/i915/gt/intel_ring_submission.c<br />
Falling back to patching base and 3-way merge...<br />
Auto-merging drivers/gpu/drm/i915/gt/intel_ring_submission.c<br />
No changes -- Patch already applied.</p>

</body>
</html>

--===============5616374507140299434==--
