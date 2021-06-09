Return-Path: <SRS0=iOfG=LD=lists.freedesktop.org=intel-gfx-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,HTML_MESSAGE,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C5794C47095
	for <intel-gfx@archiver.kernel.org>; Wed,  9 Jun 2021 09:32:29 +0000 (UTC)
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 830A86124C
	for <intel-gfx@archiver.kernel.org>; Wed,  9 Jun 2021 09:32:29 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 830A86124C
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=emeril.freedesktop.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=intel-gfx-bounces@lists.freedesktop.org
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 045966E28A;
	Wed,  9 Jun 2021 09:32:29 +0000 (UTC)
Received: from emeril.freedesktop.org (emeril.freedesktop.org
 [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTP id 91D0F6E28A;
 Wed,  9 Jun 2021 09:32:27 +0000 (UTC)
Received: from emeril.freedesktop.org (localhost [127.0.0.1])
 by emeril.freedesktop.org (Postfix) with ESMTP id 89D5EA8836;
 Wed,  9 Jun 2021 09:32:27 +0000 (UTC)
MIME-Version: 1.0
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Navare, Manasi" <manasi.d.navare@intel.com>
Date: Wed, 09 Jun 2021 09:32:27 -0000
Message-ID: <162323114755.27478.5681127423446137219@emeril.freedesktop.org>
X-Patchwork-Hint: ignore
References: <20210609065914.4454-1-vandita.kulkarni@intel.com>
In-Reply-To: <20210609065914.4454-1-vandita.kulkarni@intel.com>
Subject: [Intel-gfx] =?utf-8?b?4pyXIEZpLkNJLkJBVDogZmFpbHVyZSBmb3IgZHJt?=
 =?utf-8?q?/i915/dsc=3A_Fix_bigjoiner_check_in_dsc=5Fdisable_=28rev5=29?=
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
Content-Type: multipart/mixed; boundary="===============0473643308=="
Errors-To: intel-gfx-bounces@lists.freedesktop.org
Sender: "Intel-gfx" <intel-gfx-bounces@lists.freedesktop.org>

--===============0473643308==
Content-Type: multipart/alternative;
 boundary="===============0114902259903784072=="

--===============0114902259903784072==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: drm/i915/dsc: Fix bigjoiner check in dsc_disable (rev5)
URL   : https://patchwork.freedesktop.org/series/91006/
State : failure

== Summary ==

Applying: drm/i915/dsc: Fix bigjoiner check in dsc_disable
Using index info to reconstruct a base tree...
M	drivers/gpu/drm/i915/display/intel_vdsc.c
Falling back to patching base and 3-way merge...
No changes -- Patch already applied.



--===============0114902259903784072==
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
<tr><td><b>Series:</b></td><td>drm/i915/dsc: Fix bigjoiner check in dsc_disable (rev5)</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/91006/">https://patchwork.freedesktop.org/series/91006/</a></td></tr>
<tr><td><b>State:</b></td><td>failure</td></tr>

</table>


    <p>Applying: drm/i915/dsc: Fix bigjoiner check in dsc_disable<br />
Using index info to reconstruct a base tree...<br />
M   drivers/gpu/drm/i915/display/intel_vdsc.c<br />
Falling back to patching base and 3-way merge...<br />
No changes -- Patch already applied.</p>

</body>
</html>

--===============0114902259903784072==--

--===============0473643308==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Intel-gfx mailing list
Intel-gfx@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/intel-gfx

--===============0473643308==--
